class CL_REST_RESOURCE definition
  public
  abstract
  create public .

public section.

  interfaces IF_REST_RESOURCE .
  interfaces IF_REST_HANDLER
      final methods HANDLE .
protected section.

  types:
    BEGIN OF ts_conditional_info,
          existing TYPE abap_bool,
          etag TYPE rest_etag_s,
          modification_date TYPE timestamp,
          status TYPE i,
          response TYPE REF TO if_rest_response,
        END OF ts_conditional_info .

  data MO_REQUEST type ref to IF_REST_REQUEST .
  data MO_RESPONSE type ref to IF_REST_RESPONSE .
  data MO_CONTEXT type ref to IF_REST_CONTEXT .
  type-pools ABAP .
  data MV_CONDITIONAL type ABAP_BOOL value ABAP_TRUE. .

  methods GET_CONDITIONAL_INFO
    importing
      !IV_METHOD type STRING
    exporting
      !EV_EXISTING type ABAP_BOOL
      !EV_STATUS type I
      !ES_ETAG type REST_ETAG_S
      !EV_MODIFICATION_DATE type TIMESTAMP
      !EV_GET_RESPONSE type ABAP_BOOL .
private section.

  aliases DELETE
    for IF_REST_RESOURCE~DELETE .
  aliases GET
    for IF_REST_RESOURCE~GET .
  aliases HANDLE
    for IF_REST_HANDLER~HANDLE .
  aliases HEAD
    for IF_REST_RESOURCE~HEAD .
  aliases OPTIONS
    for IF_REST_RESOURCE~OPTIONS .
  aliases POST
    for IF_REST_RESOURCE~POST .
  aliases PUT
    for IF_REST_RESOURCE~PUT .

  methods DO_HANDLE_CONDITIONAL .
  methods DO_HANDLE .
  class-methods COPY_RESPONSE
    importing
      !IO_TARGET_RESPONSE type ref to IF_REST_RESPONSE
      !IO_SOURCE_RESPONSE type ref to IF_REST_RESPONSE .
ENDCLASS.



CLASS CL_REST_RESOURCE IMPLEMENTATION.


  METHOD COPY_RESPONSE.
    cl_rest_cond_utils=>copy_response( io_target_response = io_target_response io_source_response = io_source_response ).
  ENDMETHOD.


  METHOD do_handle.

    DATA:
      lv_method TYPE string.

    lv_method = mo_request->get_method( ).
    CASE lv_method.
      WHEN 'GET'.
        get( ).
      WHEN 'PUT'.
        put( mo_request->get_entity( ) ).
      WHEN 'POST'.
        post( mo_request->get_entity( ) ).
      WHEN 'DELETE'.
        delete( ).
      WHEN 'HEAD'.
        head( ).
      WHEN 'OPTIONS'.
        options( ).
      WHEN OTHERS.
        RAISE EXCEPTION TYPE cx_rest_resource_exception
          EXPORTING
            status_code    = cl_rest_status_code=>gc_client_error_bad_request
            request_method = lv_method
            textid         = cx_rest_resource_exception=>method_not_supported.
    ENDCASE.

  ENDMETHOD.                    "DO_HANDLE


  METHOD do_handle_conditional.
    " Implementation of the conditional handling according to the HTTP 1.1 Specification
    " see http://www.w3.org/Protocols/rfc2616/rfc2616-sec14.html#sec14 for the relevant header definitions

    DATA:
      ls_conditions TYPE rest_conditions,
      lt_match TYPE rest_etag_t,
      lv_method TYPE string,
      lv_conditional_status TYPE i,
      lv_get_response TYPE abap_bool,
      lv_existing TYPE abap_bool VALUE abap_true, " per default resource is existing if not said otherwise by resource impl
      lv_modification_date TYPE timestamp,
      lv_etag TYPE rest_etag_s,
      lv_current_time TYPE timestamp,
      lv_modified_since TYPE timestamp,
      lv_unmodified_since TYPE timestamp,
      lv_status TYPE i,
      lo_exc TYPE REF TO cx_rest_exception,
      lt_header_field TYPE tihttpnvp.

    DATA:
      lo_orig_response TYPE REF TO if_rest_response,
      lo_orig_context TYPE REF TO if_rest_context.

    " extract conditions from request
    ls_conditions = cl_rest_cond_utils=>get_conditions( mo_request ).
    lv_method = mo_request->get_method( ).

    IF ls_conditions IS NOT INITIAL.
      " conditions found -> replace response by a temporary queue
      lo_orig_response = mo_response.
      mo_response = cl_rest_message_builder=>create_response(
        iv_status_code = cl_rest_status_code=>gc_success_ok
        iv_reason_phrase = if_http_status=>reason_200 ).
      " replace also the original context
      IF mo_context IS BOUND.
        lo_orig_context = mo_context.
        mo_context = lo_orig_context->clone( ).
      ENDIF.

      " need to open try/catch block because we exchanged response object
      " and we need to react if rest exception occurrs in execution flow
      TRY.
          "get info for conditional handling
          get_conditional_info(
            EXPORTING
              iv_method = lv_method
            IMPORTING
              ev_status = lv_conditional_status
              ev_existing = lv_existing
              es_etag = lv_etag
              ev_modification_date = lv_modification_date
              ev_get_response = lv_get_response ).
          " handle conditions
          cl_rest_cond_utils=>handle_conditions(
            EXPORTING
              iv_method = lv_method
              iv_existing = lv_existing
              is_etag = lv_etag
              iv_modification_date = lv_modification_date
              iv_status_code = lv_conditional_status
            IMPORTING
              ev_status_code = lv_status
            CHANGING
              cs_conditions = ls_conditions ).
        CATCH cx_rest_exception INTO lo_exc.
          " exception occurred -> set status code
          " this should only occur with custom get_conditional_info implementations
          lv_status = lo_exc->status_code.
      ENDTRY.

      " now interpret the result of the conditional handling
      IF lv_status IS INITIAL OR cl_rest_status_code=>is_success( lv_status ) = abap_true.
        " if no rule applied or result is a success, then if request was GET/HEAD and an actual GET was performed
        " we return the result (by restoring original response with new values), otherwise we do a full handle loop.
        IF lv_get_response = abap_true AND ( 'GET' = lv_method OR 'HEAD' = lv_method ).
          copy_response( EXPORTING io_source_response = mo_response io_target_response = lo_orig_response ).
          mo_response = lo_orig_response.
          " the context is still valid
        ELSE.
          mo_context  = lo_orig_context.
          mo_response = lo_orig_response.
          do_handle( ).
        ENDIF.
      ELSEIF lv_status = cl_rest_status_code=>gc_redirection_not_modified.
        " if conditional handling has returned a status of 304, we have to add some additional header if set from the applicantion.
        mo_context  = lo_orig_context.
        lt_header_field = mo_response->get_header_fields( ).
        DELETE lt_header_field WHERE name = if_http_header_fields_sap=>server_protocol.
        DELETE lt_header_field WHERE name = if_http_header_fields=>content_type.
        mo_response = lo_orig_response.
        mo_response->set_header_fields( lt_header_field ).
        mo_response->set_status( lv_status ).
      ELSEIF lv_status = cl_rest_status_code=>gc_client_error_precond_failed.
        " if conditional handling has returned a status of 412, we just set this result
        mo_context  = lo_orig_context.
        mo_context  = lo_orig_context.
        mo_response = lo_orig_response.
        mo_response->set_status( lv_status ).
      ELSE.
        " for all other cases (e.g. 4xx, 5xx) we either return the response (if request was GET/HEAD and an actual GET was performed),
        "or again trigger a full handle
        IF lv_get_response = abap_true AND ( 'GET' = lv_method OR 'HEAD' = lv_method ).
          copy_response( EXPORTING io_source_response = mo_response io_target_response = lo_orig_response ).
          mo_response = lo_orig_response.
          " the context is still valid
        ELSE.
          mo_context  = lo_orig_context.
          mo_response = lo_orig_response.
          do_handle( ).
        ENDIF.
      ENDIF.
    ELSE.
      " no conditions were specified in request -> just do normal handle
      do_handle( ).
    ENDIF.

  ENDMETHOD.                    "do_handle_conditional


  METHOD get_conditional_info.
    " Default implementation of conditional handling --> execute GET and extract information

    DATA:
      lv_status TYPE i,
      lo_entity TYPE REF TO if_rest_entity,
      lo_exc TYPE REF TO cx_rest_resource_exception.

    TRY.
        get( ).
        lv_status = mo_response->get_status( ).
        es_etag = mo_response->get_etag( ).
        lo_entity = mo_response->get_entity( ).
        IF lo_entity IS BOUND.
          ev_modification_date = lo_entity->get_modification_date( ).
        ENDIF.
      CATCH cx_rest_resource_exception INTO lo_exc.
        " if exception occurs we need to do the same handling as in handle();
        " i.e. put status code and message to the response

        lo_entity = mo_response->create_entity( ).
        IF lo_exc->entity_provider IS BOUND.
          lo_exc->entity_provider->write_to( lo_entity ).
        ELSE.
          " if entity provider is given create error representation
          lo_entity->set_string_data( lo_exc->get_text( ) ).
          lo_entity->set_content_type( if_rest_media_type=>gc_text_plain ).
        ENDIF.
        "  set status code
        IF lo_exc->status_code IS NOT INITIAL.
          mo_response->set_status( lo_exc->status_code ).
          lv_status = lo_exc->status_code.
        ELSE.
          mo_response->set_status( cl_rest_status_code=>gc_server_error_internal ).
        ENDIF.
    ENDTRY.

    " set exporting parameters
    ev_status = lv_status.
    ev_get_response = abap_true.
    IF lv_status = cl_rest_status_code=>gc_client_error_not_found.
      ev_existing = abap_false.
    ELSE.
      ev_existing = abap_true.
    ENDIF.

  ENDMETHOD.                    "GET_CONDITIONAL_INFO


  METHOD if_rest_handler~handle.

    DATA:
      lv_conditional TYPE abap_bool,
      lo_conditional_handler TYPE REF TO if_rest_handler,
      lo_entity TYPE REF TO if_rest_entity,
      lo_exc TYPE REF TO cx_rest_exception.

    " store request and response
    mo_request = io_request.
    mo_response = io_response.
    mo_context = io_context.

    TRY.

        IF mv_conditional = abap_true.
          do_handle_conditional( ).
        ELSE.
          do_handle( ).
        ENDIF.

      CATCH cx_rest_exception INTO lo_exc.

        lo_entity = mo_response->create_entity( ).
        IF lo_exc->entity_provider IS BOUND.
          lo_exc->entity_provider->write_to( lo_entity ).
        ELSE.
          " if entity provider is given create error representation
          lo_entity->set_string_data( lo_exc->get_text( ) ).
          lo_entity->set_content_type( if_rest_media_type=>gc_text_plain ).
        ENDIF.
        "  set status code
        IF lo_exc->status_code IS NOT INITIAL.
          mo_response->set_status( lo_exc->status_code ).
        ELSE.
          mo_response->set_status( cl_rest_status_code=>gc_server_error_internal ).
        ENDIF.

    ENDTRY.

  ENDMETHOD.                    "IF_REST_HANDLER~HANDLE


  METHOD if_rest_resource~delete.

    RAISE EXCEPTION TYPE cx_rest_resource_exception
      EXPORTING
        status_code    = cl_rest_status_code=>gc_client_error_meth_not_allwd
        request_method = if_rest_message=>gc_method_delete
        textid         = cx_rest_resource_exception=>method_not_supported.

  ENDMETHOD.                    "IF_REST_RESOURCE~DELETE


  METHOD if_rest_resource~get.

    RAISE EXCEPTION TYPE cx_rest_resource_exception
      EXPORTING
        status_code    = cl_rest_status_code=>gc_client_error_meth_not_allwd
        request_method = if_rest_message=>gc_method_get
        textid         = cx_rest_resource_exception=>method_not_supported.

  ENDMETHOD.                    "IF_REST_RESOURCE~GET


  METHOD if_rest_resource~head.

    RAISE EXCEPTION TYPE cx_rest_resource_exception
      EXPORTING
        status_code    = cl_rest_status_code=>gc_client_error_meth_not_allwd
        request_method = if_rest_message=>gc_method_head
        textid         = cx_rest_resource_exception=>method_not_supported.

  ENDMETHOD.                    "IF_REST_RESOURCE~HEAD


  METHOD if_rest_resource~options.

    RAISE EXCEPTION TYPE cx_rest_resource_exception
      EXPORTING
        status_code    = cl_rest_status_code=>gc_client_error_meth_not_allwd
        request_method = if_rest_message=>gc_method_options
        textid         = cx_rest_resource_exception=>method_not_supported.

  ENDMETHOD.                    "IF_REST_RESOURCE~OPTIONS


  METHOD if_rest_resource~post.

    RAISE EXCEPTION TYPE cx_rest_resource_exception
      EXPORTING
        status_code    = cl_rest_status_code=>gc_client_error_meth_not_allwd
        request_method = if_rest_message=>gc_method_post
        textid         = cx_rest_resource_exception=>method_not_supported.

  ENDMETHOD.                    "IF_REST_RESOURCE~POST


  METHOD if_rest_resource~put.

    RAISE EXCEPTION TYPE cx_rest_resource_exception
      EXPORTING
        status_code    = cl_rest_status_code=>gc_client_error_meth_not_allwd
        request_method = if_rest_message=>gc_method_put
        textid         = cx_rest_resource_exception=>method_not_supported.

  ENDMETHOD.                    "IF_REST_RESOURCE~PUT
ENDCLASS.