class CL_REST_HTTP_HANDLER definition
  public
  abstract
  create public .

public section.

  interfaces IF_HTTP_EXTENSION
      final methods HANDLE_REQUEST .
  interfaces IF_REST_APPLICATION
      abstract methods GET_ROOT_HANDLER .

  types:
    BEGIN OF flow_history_s,
        script_name TYPE string,
        script_name_expanded TYPE string,
        flow_rc type i,
      END OF flow_history_s .
  types:
    flow_history_t TYPE STANDARD TABLE OF flow_history_s WITH DEFAULT KEY .
protected section.

  aliases GET_ROOT_HANDLER
    for IF_REST_APPLICATION~GET_ROOT_HANDLER .

  data MO_CONTEXT type ref to IF_REST_CONTEXT .
  data MO_SERVER type ref to IF_HTTP_SERVER .
  type-pools ABAP .
  class-data GV_ALLOW_METHOD_OVERRIDE type ABAP_BOOL value ABAP_FALSE. "#EC NOTEXT .
  class-data GV_CHECK_REQUESTED_WITH type ABAP_BOOL value ABAP_TRUE. "#EC NOTEXT .
  class-data GV_STATEFUL type ABAP_BOOL value ABAP_FALSE. "#EC NOTEXT .
  class-data FLOW_HISTORY type FLOW_HISTORY_T .

  methods HANDLE_CSRF_TOKEN
    importing
      !IO_CSRF_HANDLER type ref to IF_REST_CSRF_HANDLER
      !IO_REQUEST type ref to IF_REST_REQUEST
      !IO_RESPONSE type ref to IF_REST_RESPONSE .
  methods INITIALIZE
    importing
      !IO_CONTEXT type ref to IF_REST_CONTEXT
    exporting
      !EV_SKIP type ABAP_BOOL
    changing
      !CV_SCRIPT_NAME type STRING
      !CV_SCRIPT_NAME_EXPANDED type STRING
      !CV_PATH_INFO type STRING
      !CV_PATH_INFO_EXPANDED type STRING .
  PRIVATE SECTION.

ENDCLASS.



CLASS CL_REST_HTTP_HANDLER IMPLEMENTATION.


  METHOD handle_csrf_token.
    DATA:
      lv_method TYPE string,
      lv_csrf_token TYPE string,
      lv_csrf_token_valid TYPE abap_bool VALUE abap_false.

    lv_method = io_request->get_method( ).
    lv_csrf_token = io_request->get_header_field( if_rest_request=>gc_header_csrf_token ).

    CASE lv_method.
      WHEN if_rest_request=>gc_method_get OR
           if_rest_request=>gc_method_head OR
           if_rest_request=>gc_method_options.
        lv_csrf_token = to_lower( lv_csrf_token ).
        IF lv_csrf_token = 'fetch' ##no_text.
          io_response->set_header_field(
            iv_name  = if_rest_request=>gc_header_csrf_token
            iv_value = io_csrf_handler->get_csrf_token( ) ).
        ENDIF.
      WHEN OTHERS.
        lv_csrf_token_valid = io_csrf_handler->validate_csrf_token( lv_csrf_token ).
        IF lv_csrf_token_valid <> abap_true.
          io_response->set_header_field(
            iv_name  = if_rest_request=>gc_header_csrf_token
            iv_value = 'Required' ) ##no_text.
          RAISE EXCEPTION TYPE cx_rest_resource_exception
            EXPORTING
              status_code = cl_rest_status_code=>gc_client_error_forbidden
              textid      = cx_rest_resource_exception=>csrf_token_validation_failed.
        ENDIF.
    ENDCASE.
  ENDMETHOD.


  METHOD if_http_extension~handle_request.
    DATA:
      lv_script_name TYPE string,
      lv_script_name_org TYPE string,
      lv_script_name_expanded TYPE string,
      lv_script_name_expanded_org TYPE string,
      lv_path_info TYPE string,
      lv_path_info_org TYPE string,
      lv_path_info_expanded TYPE string,
      lv_path_info_expanded_org TYPE string,
      lv_skip type abap_bool,
      lo_request TYPE REF TO if_rest_request,
      lo_response TYPE REF TO if_rest_response,
      lo_entity TYPE REF TO if_rest_entity,
      lo_root_handler TYPE REF TO if_rest_handler,
      lx_handler_ex TYPE REF TO cx_rest_handler_exception,
      lx_resource_ex TYPE REF TO cx_rest_resource_exception.
    FIELD-SYMBOLS:
       <flow_history> TYPE flow_history_s.

    " get header fields
    lv_script_name_org          = lv_script_name          = server->request->get_header_field( if_http_header_fields_sap=>script_name ).
    lv_script_name_expanded_org = lv_script_name_expanded = server->request->get_header_field( if_http_header_fields_sap=>script_name_expanded ).
    lv_path_info_org            = lv_path_info            = server->request->get_header_field( if_http_header_fields_sap=>path_info ).
    lv_path_info_expanded_org   = lv_path_info_expanded   = server->request->get_header_field( if_http_header_fields_sap=>path_info_expanded ).

    " initialize http request handling
    initialize(
      exporting
        io_context = mo_context
      importing
        ev_skip = lv_skip
      CHANGING
        cv_path_info = lv_path_info
        cv_script_name = lv_script_name
        cv_script_name_expanded = lv_script_name_expanded
        cv_path_info_expanded = lv_path_info_expanded ).

    " update script name
    if lv_script_name <> lv_script_name_org.
      server->request->set_header_field( name = if_http_header_fields_sap=>script_name value = lv_script_name ).
    endif.
    " update script name expanded
    if lv_script_name_expanded <> lv_script_name_expanded_org.
      server->request->set_header_field( name = if_http_header_fields_sap=>script_name_expanded value = lv_script_name_expanded ).
    endif.
    " update path info
    if lv_path_info <> lv_path_info_org.
      server->request->set_header_field( name = if_http_header_fields_sap=>path_info value = lv_path_info ).
    endif.
    " update path info expanded
    if lv_path_info_expanded <> lv_path_info_expanded_org.
      server->request->set_header_field( name = if_http_header_fields_sap=>path_info_expanded value = lv_path_info_expanded ).
    endif.

    " flow history
    APPEND INITIAL LINE TO flow_history ASSIGNING <flow_history>.
    <flow_history>-script_name = lv_script_name.
    <flow_history>-script_name_expanded = lv_script_name_expanded.
    if lv_skip = abap_true.
      <flow_history>-flow_rc = if_http_extension~flow_rc = if_http_extension=>co_flow_ok_others_mand.
    else.
      <flow_history>-flow_rc = -4.
    endif.

    " put flow history into context
    IF mo_context IS BOUND.
      mo_context->set_parameter( iv_name = 'flow_history' iv_value = flow_history ).
    ENDIF.

    " skip this root handler
    if lv_skip = abap_true.
      RETURN.
    endif.

    " request
    lo_request = cl_rest_message_builder=>create_http_request(
      io_http_request = server->request
      iv_allow_method_override = gv_allow_method_override ).

    " response
    lo_response = cl_rest_message_builder=>create_http_response(
      io_http_response = server->response ).

    " start handling of request
    TRY.

        " handle CSRF token header
        handle_csrf_token( io_csrf_handler = lcl_csrf_handler=>create( server ) io_request = lo_request io_response = lo_response ).

        " set server object before get_root_handler( )
        mo_server = server.
        " handle the request by giving control to the root handler
        lo_root_handler = get_root_handler( ).
        " clear server object after get_root_handler( )
        CLEAR mo_server.

        IF lo_root_handler IS BOUND.
          lo_root_handler->handle( io_request = lo_request  io_response = lo_response io_context = mo_context ).
        ELSE.
          " no root handler defined -> exception
          RAISE EXCEPTION TYPE cx_rest_handler_exception
            EXPORTING
              textid = cx_rest_handler_exception=>no_root_handler.
        ENDIF.

        " uncaught resource exceptions are caught and treated as application errors
      CATCH cx_rest_resource_exception INTO lx_resource_ex.
        lo_entity = lo_response->create_entity( ).
        lo_entity->set_content_type( if_rest_media_type=>gc_text_plain ).
        lo_entity->set_string_data( lx_resource_ex->get_text( ) ).
        IF lx_resource_ex->status_code  IS INITIAL.
          lo_response->set_status( cl_rest_status_code=>gc_server_error_internal ).
        ELSE.
          lo_response->set_status( lx_resource_ex->status_code ).
        ENDIF.

        "  uncaught handler exceptions are caught and treated as internal server errors
      CATCH cx_rest_handler_exception INTO lx_handler_ex.
        lo_entity = lo_response->create_entity( ).
        lo_entity->set_content_type( if_rest_media_type=>gc_text_plain ).
        lo_entity->set_string_data( lx_handler_ex->get_text( ) ).
        lo_response->set_status( cl_rest_status_code=>gc_server_error_internal ).

    ENDTRY.
    " other exceptions lead to normal server dumps

    " no setting of default content type
    server->response->suppress_content_type( ).

    " default HTTP handler is stateless
    IF gv_stateful = abap_true.
      server->set_session_stateful( stateful = if_http_server=>co_enabled ).
    ELSE.
      server->set_session_stateful( stateful = if_http_server=>co_disabled ).
    ENDIF.

    " allow modification of if_http_extension attributes via context
    IF mo_context IS BOUND.
      mo_context->get_parameter( EXPORTING iv_name = 'flow_rc' IMPORTING ev_value = if_http_extension~flow_rc ) ##no_text.
      <flow_history>-flow_rc = if_http_extension~flow_rc.
    ENDIF.

  ENDMETHOD.                    "if_http_extension~handle_request


METHOD initialize.

  " skip root handler
  ev_skip = abap_false.

  " path info expanded
  IF cv_path_info_expanded IS NOT INITIAL.
    " path info
    IF cv_path_info_expanded <> cv_path_info.
      ev_skip = abap_true.
    ENDIF.
  ENDIF.

ENDMETHOD.
ENDCLASS.