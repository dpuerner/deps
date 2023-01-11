class /IWBEP/CL_MGW_PUSH_ABS_DATA definition
  public
  inheriting from /IWBEP/CL_MGW_ABS_DATA
  abstract
  create public .

*"* public components of class /IWBEP/CL_MGW_PUSH_ABS_DATA
*"* do not include other source files here!!!
public section.

  types S type CHAR1 .

  methods /IWBEP/IF_MGW_CORE_SRV_RUNTIME~CREATE_ENTITY
    redefinition .
  methods /IWBEP/IF_MGW_CORE_SRV_RUNTIME~DELETE_ENTITY
    redefinition .
  methods /IWBEP/IF_MGW_CORE_SRV_RUNTIME~EXEC_SERVICE_OPERATION
    redefinition .
  methods /IWBEP/IF_MGW_CORE_SRV_RUNTIME~READ_ENTITY
    redefinition .
  methods /IWBEP/IF_MGW_CORE_SRV_RUNTIME~READ_ENTITYSET
    redefinition .
  methods /IWBEP/IF_MGW_CORE_SRV_RUNTIME~UPDATE_ENTITY
    redefinition .
protected section.
*"* protected components of class /IWBEP/CL_MGW_PUSH_ABS_DATA
*"* do not include other source files here!!!

  methods CHECK_SUBSCRIPTION_AUTHORITY
  abstract
    importing
      !IS_SUBSCRIPTION_DATA type /IWBEP/S_MGW_DB_SUB_DATA
    raising
      /IWBEP/CX_MGW_BUSI_EXCEPTION
      /IWBEP/CX_MGW_TECH_EXCEPTION .
private section.
*"* private components of class /IWBEP/CL_MGW_PUSH_ABS_DATA
*"* do not include other source files here!!!

  types:
    BEGIN OF ty_s_caller_context,
*        CALLER_DESTINATION  type  RFCDISPLAY-RFCDEST,
*        CALLER_IP type  RFCDISPLAY-RFCDEST,
*        CALLER_TRUSTED  type  RFCDISPLAY-RFCSLOGIN,
*        CALLER_RFC_TYPE type  RFCDES-RFCTYPE,
          client TYPE  rfcdisplay-rfcclient,
          whoami TYPE  rfcdisplay-rfcuser,
*        CALLER_START_INFO type  RFCDISPLAY-RFCDEST,
*        CALLER_TCODE  type  SY-TCODE,
*        CALLER_PROGRAM  type  SY-CPROG,
          system_id  TYPE  sy-sysid,
*        CALLER_SYSTEM_RELEASE type  SY-SAPRL,
*        CALLER_KERNEL_RELEASE type  SY-SAPRL,
*        CALLER_ASYNC_TYPE type  SY-BATCH,
*        CALLER_TRANS_TYPE type  SY-BATCH,
*        CALLER_PCS  type  SY-BATCH,
*        CALLER_CODEPAGE type  TCP00-CPCODEPAGE,
*        CALLER_MDMP TYPE  CHAR1,
         END OF ty_s_caller_context .

  constants MC_ENTITY_TYPE_SUBSCRIPTION type STRING value 'Subscription'. "#EC NOTEXT
  constants MC_ENTITY_TYPE_NOTIFICATION type STRING value 'Notification'. "#EC NOTEXT
  constants:
    BEGIN OF mcs_operations ,
              read_entry        TYPE char30 VALUE 'read entry',
              read_feed         TYPE char30 VALUE 'read feed',
              create            TYPE char30 VALUE 'create',
              update            TYPE char30 VALUE 'update',
              delete            TYPE char30 VALUE 'delete',
            END OF mcs_operations .
  constants LC_ICF_NODE_SDATA type ICFNAME value 'sdata'. "#EC NOTEXT
  constants LC_ICF_NODE_ODATA type ICFNAME value 'odata'. "#EC NOTEXT
  constants:
    BEGIN OF lcs_sub_ent_change_type ,
      created TYPE /iwbep/mgw_sub_ent_change_type VALUE 'created',
      updated TYPE /iwbep/mgw_sub_ent_change_type VALUE 'updated',
      deleted TYPE /iwbep/mgw_sub_ent_change_type VALUE 'deleted',
      failed TYPE  /iwbep/mgw_sub_ent_change_type VALUE 'failed',
    END OF lcs_sub_ent_change_type .

  interface /IWBEP/IF_MGW_CORE_SRV_RUNTIME load .
  methods CREATE_SUBSCRIPTION
    importing
      !IO_DATA_PROVIDER type ref to /IWBEP/IF_MGW_ENTRY_PROVIDER
      !IT_KEY_TAB type /IWBEP/T_MGW_NAME_VALUE_PAIR
      !IT_NAVIGATION_PATH type /IWBEP/T_MGW_NAVIGATION_PATH
      !IS_REQUEST_DETAILS type /IWBEP/IF_MGW_CORE_SRV_RUNTIME=>TY_S_MGW_REQUEST_CONTEXT optional
      !IV_EXECUTION_MODE type CHAR1 default 'S'
    exporting
      !ER_ENTITY type ref to DATA
    changing
      !CT_HEADERS type TIHTTPNVP
    raising
      /IWBEP/CX_MGW_BUSI_EXCEPTION
      /IWBEP/CX_MGW_TECH_EXCEPTION .
  methods DELETE_SUBSCRIPTION
    importing
      !IT_KEY_TAB type /IWBEP/T_MGW_NAME_VALUE_PAIR
      !IT_NAVIGATION_PATH type /IWBEP/T_MGW_NAVIGATION_PATH
    changing
      !CT_HEADERS type TIHTTPNVP
    raising
      /IWBEP/CX_MGW_BUSI_EXCEPTION
      /IWBEP/CX_MGW_TECH_EXCEPTION .
  methods READ_SUBSCRIPTIONS
    importing
      !IT_FILTER_SELECT_OPTIONS type /IWBEP/T_MGW_SELECT_OPTION
      !IT_ORDER type /IWBEP/T_MGW_SORTING_ORDER
      !IS_PAGING type /IWBEP/S_MGW_PAGING
      !IT_NAVIGATION_PATH type /IWBEP/T_MGW_NAVIGATION_PATH
      !IT_KEY_TAB type /IWBEP/T_MGW_NAME_VALUE_PAIR
      !IV_SEARCH_STRING type STRING
    exporting
      !ER_ENTITYSET type ref to DATA
    changing
      !CT_HEADERS type TIHTTPNVP
    raising
      /IWBEP/CX_MGW_BUSI_EXCEPTION
      /IWBEP/CX_MGW_TECH_EXCEPTION .
  methods READ_SUBSCRIPTION
    importing
      !IS_REQUEST_DETAILS type /IWBEP/IF_MGW_CORE_SRV_RUNTIME=>TY_S_MGW_REQUEST_CONTEXT
    exporting
      !ER_ENTITY type ref to DATA
    changing
      !CT_HEADERS type TIHTTPNVP
    raising
      /IWBEP/CX_MGW_BUSI_EXCEPTION
      /IWBEP/CX_MGW_TECH_EXCEPTION .
  methods UPDATE_SUBSCRIPTION
    importing
      !IO_DATA_PROVIDER type ref to /IWBEP/IF_MGW_ENTRY_PROVIDER
      !IT_KEY_TAB type /IWBEP/T_MGW_NAME_VALUE_PAIR
      !IT_NAVIGATION_PATH type /IWBEP/T_MGW_NAVIGATION_PATH
    exporting
      !ER_ENTITY type ref to DATA
    changing
      !CT_HEADERS type TIHTTPNVP
    raising
      /IWBEP/CX_MGW_BUSI_EXCEPTION
      /IWBEP/CX_MGW_TECH_EXCEPTION .
  methods GET_CALLER_CONTEXT
    returning
      value(RS_CALLER_CONTEXT) type TY_S_CALLER_CONTEXT .
  methods RAISE_NOT_SUPPORTED_EXCEPTION
    importing
      !IV_OPERATION type CHAR30
      !IV_ENTITY_TYPE type STRING
    raising
      /IWBEP/CX_MGW_TECH_EXCEPTION .
  methods IS_SUBSCRIPTION_DUPLICATE
    importing
      !IV_EXECUTION_MODE type CHAR1
      !IV_SYSTEM_ALIAS type /IWBEP/DEFI_SYSTEM_ALIAS
    exporting
      !IS_DUPLICATE type ABAP_BOOL
      !EV_UPDATE type BOOLEAN
    changing
      !CS_DATA type /IWBEP/S_MGW_DB_SUB_DATA .
  methods ALLOW_DELIVERY_CHANNEL
    importing
      !IS_DATA type /IWBEP/S_MGW_DB_SUB_DATA
    raising
      /IWBEP/CX_MGW_BUSI_EXCEPTION .
  methods CHECK_CHANGE_TYPE
    importing
      !IV_CHANGE_TYPE type /IWBEP/MGW_SUB_ENT_CHANGE_TYPE
    raising
      /IWBEP/CX_MGW_BUSI_EXCEPTION .
  methods GET_SUBSCRIPTIONS
    returning
      value(ET_SUBSCRIPTIONS) type /IWBEP/T_MGW_DB_SUB_DATA .
  methods CHANGE_TYPE_EXISTENCE_CHECK
    importing
      !IS_SUB_DATA type /IWBEP/S_MGW_DB_SUB_DATA
    returning
      value(EV_CHANGE_TYPE_EXISTS) type BOOLEAN .
  methods GET_FORMAT
    returning
      value(RV_FORMAT) type STRING
    raising
      /IWBEP/CX_MGW_TECH_EXCEPTION .
ENDCLASS.



CLASS /IWBEP/CL_MGW_PUSH_ABS_DATA IMPLEMENTATION.


METHOD /iwbep/if_mgw_core_srv_runtime~create_entity.

  CASE iv_entity_name.
    WHEN mc_entity_type_subscription.
      /iwbep/if_mgw_core_srv_runtime~init_request_context(
        it_headers         = ct_headers
        is_request_details = is_request_details
      ).
*-----subscription handling
      create_subscription(
        EXPORTING
          io_data_provider   = io_data_provider
          it_key_tab         = is_request_details-key_tab
          it_navigation_path = is_request_details-navigation_path
        IMPORTING
          er_entity          = cr_entity
        CHANGING
          ct_headers         = ct_headers
      ).
    WHEN mc_entity_type_notification.
      raise_not_supported_exception( iv_operation   = mcs_operations-create
                                     iv_entity_type = iv_entity_name ).
    WHEN OTHERS.
*---default path
      super->/iwbep/if_mgw_core_srv_runtime~create_entity(
        EXPORTING
          iv_entity_name     = iv_entity_name
          iv_source_name     = iv_source_name
          io_data_provider   = io_data_provider
          is_request_details = is_request_details
        CHANGING
          ct_headers         = ct_headers
          cr_entity          = cr_entity
          ct_inline_info     = ct_inline_info
      ).
  ENDCASE.

ENDMETHOD.


METHOD /iwbep/if_mgw_core_srv_runtime~delete_entity.

  CASE iv_entity_name.
    WHEN mc_entity_type_subscription.
*---subscription handling
      delete_subscription(
        EXPORTING
          it_key_tab         = is_request_details-key_tab
          it_navigation_path = is_request_details-navigation_path
        CHANGING
          ct_headers         = ct_headers
      ).
    WHEN mc_entity_type_notification.
      raise_not_supported_exception( iv_operation   = mcs_operations-delete
                                     iv_entity_type = iv_entity_name ).
    WHEN OTHERS.
*-----default path
      super->/iwbep/if_mgw_core_srv_runtime~delete_entity(
        EXPORTING
          iv_entity_name     = iv_entity_name
          iv_source_name     = iv_source_name
          is_request_details = is_request_details
        CHANGING
          ct_headers         = ct_headers
      ).
  ENDCASE.

ENDMETHOD.


METHOD /iwbep/if_mgw_core_srv_runtime~exec_service_operation.

*  DATA: ls_t100key               TYPE scx_t100key.
*  DATA: io_data_provider   TYPE REF TO /iwbep/if_mgw_entry_provider, "#EC NEEDED
*        it_key_tab         TYPE /iwbep/t_mgw_name_value_pair,
*        it_navigation_path TYPE /iwbep/t_mgw_navigation_path,
*        ls_context_param   TYPE /iwbep/s_mgw_name_value_pair.
*
*  CASE iv_action_name.
*    WHEN 'CreateSubscriptionInAllSystems'.
*      READ TABLE is_request_details-context_params WITH KEY name = 'service_root' INTO ls_context_param.
*      IF ls_context_param-value CS ';mo'.
*        create_subscription(
*          EXPORTING
*            io_data_provider   = io_data_provider
*            it_key_tab         = it_key_tab
*            it_navigation_path = it_navigation_path
*            iv_execution_mode = 'M'
*            is_request_details = is_request_details
*         IMPORTING
*             er_entity          = cr_data
*         CHANGING
*             ct_headers         = ct_headers ).
*      ELSE.
*        ls_t100key-msgid = '/IWBEP/CM_MGW_SUB'.
*        ls_t100key-msgno = 010. "Function import only enabled for Multidestination Subscription
*
*        RAISE EXCEPTION TYPE /iwbep/cx_mgw_busi_exception
*          EXPORTING
*              textid = ls_t100key.
*      ENDIF.
*    WHEN OTHERS.
*---default path
  super->/iwbep/if_mgw_core_srv_runtime~exec_service_operation(
    EXPORTING
       iv_action_name     = iv_action_name
       iv_return_type     = iv_return_type
       iv_multiplicity    = iv_multiplicity
       is_request_details = is_request_details
    CHANGING
       ct_headers         = ct_headers
       cr_data            = cr_data
       ct_inline_info     = ct_inline_info
  ).
*
*  ENDCASE.

ENDMETHOD.


METHOD /iwbep/if_mgw_core_srv_runtime~read_entity.

  CASE iv_entity_name.
    WHEN mc_entity_type_subscription.
*-----subscription handling
      read_subscription(
        EXPORTING
          is_request_details = is_request_details
        IMPORTING
          er_entity        = cr_entity
        CHANGING
          ct_headers         = ct_headers
      ).
    WHEN mc_entity_type_notification.
      raise_not_supported_exception( iv_operation   = mcs_operations-read_entry
                                     iv_entity_type = iv_entity_name ).
    WHEN OTHERS.
*-----default path
      super->/iwbep/if_mgw_core_srv_runtime~read_entity(
        EXPORTING
          iv_entity_name      = iv_entity_name
          iv_source_name      = iv_source_name
          is_request_details  = is_request_details
        CHANGING
          ct_headers          = ct_headers
          cr_entity           = cr_entity
          cs_response_context = cs_response_context
          ct_expand_skiptoken = ct_expand_skiptoken
          ct_inline_info      = ct_inline_info
      ).
  ENDCASE.

ENDMETHOD.


METHOD /iwbep/if_mgw_core_srv_runtime~read_entityset.

  DATA:  ls_parameter     TYPE /iwbep/s_mgw_name_value_pair
        ,lv_search_string TYPE string
        .

  CASE iv_entity_name.
    WHEN mc_entity_type_subscription.
*-----subscription handling
*     super->set_headers( CHANGING ct_headers = ct_headers ).
      GET REFERENCE OF is_request_details INTO mr_request_details.

      READ TABLE is_request_details-parameters WITH KEY name = 'search'
        INTO ls_parameter.

      IF sy-subrc EQ 0.
        lv_search_string = ls_parameter-value.
      ENDIF.

      read_subscriptions(
        EXPORTING
          it_filter_select_options = it_filter_select_options
          it_order                 = it_order
          is_paging                = is_paging
          it_navigation_path       = is_request_details-navigation_path
          it_key_tab               = is_request_details-key_tab
          iv_search_string         = lv_search_string
        IMPORTING
          er_entityset             = cr_entityset
        CHANGING
          ct_headers               = ct_headers

      ).
    WHEN mc_entity_type_notification.
      raise_not_supported_exception( iv_operation   = mcs_operations-read_feed
                                     iv_entity_type = iv_entity_name ).
    WHEN OTHERS.
*---default path
      super->/iwbep/if_mgw_core_srv_runtime~read_entityset(
        EXPORTING
          iv_entity_name           = iv_entity_name
          iv_source_name           = iv_source_name
          is_paging                = is_paging
          it_order                 = it_order
          it_filter_select_options = it_filter_select_options
          is_request_details       = is_request_details
        CHANGING
          ct_headers               = ct_headers
          cr_entityset             = cr_entityset
          cr_deleted_entityset     = cr_deleted_entityset
          cs_response_context      = cs_response_context
          ct_inline_info           = ct_inline_info
          cv_response_body         = cv_response_body
      ).
  ENDCASE.

ENDMETHOD.


METHOD /iwbep/if_mgw_core_srv_runtime~update_entity.

  CASE iv_entity_name.
    WHEN mc_entity_type_subscription.
      /iwbep/if_mgw_core_srv_runtime~init_request_context(
        it_headers         = ct_headers
        is_request_details = is_request_details
      ).
*---subscription handling
      update_subscription(
        EXPORTING
          it_navigation_path = is_request_details-navigation_path
          it_key_tab         = is_request_details-key_tab
          io_data_provider   = io_data_provider
        IMPORTING
          er_entity          = cr_entity
        CHANGING
          ct_headers         = ct_headers
      ).
    WHEN mc_entity_type_notification.
      raise_not_supported_exception( iv_operation   = mcs_operations-update
                                     iv_entity_type = iv_entity_name ).
    WHEN OTHERS.
*-----default path
      super->/iwbep/if_mgw_core_srv_runtime~update_entity(
        EXPORTING
          iv_entity_name     = iv_entity_name
          iv_source_name     = iv_source_name
          io_data_provider   = io_data_provider
          is_request_details = is_request_details
        CHANGING
          ct_headers         = ct_headers
          cr_entity          = cr_entity
      ).
  ENDCASE.

ENDMETHOD.


METHOD allow_delivery_channel.

  DATA:
          ls_t100key               TYPE scx_t100key.

  IF is_data-persist_notif EQ abap_true AND
    is_data-delivery_address IS NOT INITIAL.

    ls_t100key-msgid = '/IWBEP/CM_MGW_SUB'.
    ls_t100key-msgno = 004.

    RAISE EXCEPTION TYPE /iwbep/cx_mgw_busi_exception
      EXPORTING
        textid = ls_t100key.

  ELSEIF
    is_data-persist_notif EQ abap_false AND
      is_data-delivery_address IS INITIAL.

    ls_t100key-msgid = '/IWBEP/CM_MGW_SUB'.
    ls_t100key-msgno = 005.

    RAISE EXCEPTION TYPE /iwbep/cx_mgw_busi_exception
      EXPORTING
        textid = ls_t100key.
  ENDIF.
ENDMETHOD.


METHOD change_type_existence_check.

  DATA : lt_subscriptions TYPE /iwbep/t_mgw_db_sub_data,
         ls_subscription TYPE /iwbep/s_mgw_db_sub_data.        "#EC NEEDED

*- Get List of existing subscriptions
  lt_subscriptions = get_subscriptions( ).

*- Check if subscription already exists for the change type
  READ TABLE lt_subscriptions INTO ls_subscription
                              WITH KEY delivery_address = is_sub_data-delivery_address
                                       collection_name  = is_sub_data-collection_name
                                       filter_parameter = is_sub_data-filter_parameter
                                       select_parameter = is_sub_data-select_parameter
                                       change_type      = is_sub_data-change_type.
  IF sy-subrc EQ 0.
    ev_change_type_exists = abap_true.
  ELSE.
*- Check if subscription already exists for all change types
    READ TABLE lt_subscriptions INTO ls_subscription
                                WITH KEY delivery_address = is_sub_data-delivery_address
                                         collection_name  = is_sub_data-collection_name
                                         filter_parameter = is_sub_data-filter_parameter
                                         select_parameter = is_sub_data-select_parameter
                                         change_type      = space.
    IF sy-subrc EQ 0.
      IF ls_subscription-id NE is_sub_data-id.
        ev_change_type_exists = abap_true.
      ENDIF.
    ENDIF.
  ENDIF.

ENDMETHOD.


METHOD check_change_type.

  DATA:
*        ls_t100key TYPE scx_t100key.
       lo_container          TYPE REF TO /iwbep/if_message_container,
       lv_change_type        TYPE symsgv.


  IF iv_change_type IS NOT INITIAL AND
   iv_change_type NE lcs_sub_ent_change_type-created AND
   iv_change_type NE lcs_sub_ent_change_type-updated AND
   iv_change_type NE lcs_sub_ent_change_type-deleted AND
   iv_change_type NE lcs_sub_ent_change_type-failed .

*    ls_t100key-msgid = '/IWBEP/CM_MGW_SUB'.
*    ls_t100key-msgno = 006.
*    ls_t100key-attr1 = iv_change_type.
    lv_change_type = iv_change_type.

    lo_container = /iwbep/if_mgw_conv_srv_runtime~get_message_container( ).
    CALL METHOD lo_container->add_message
      EXPORTING
        iv_msg_type           = 'E'
        iv_msg_id             = '/IWBEP/CM_MGW_SUB'
        iv_msg_number         = '006'
        iv_msg_v1             = lv_change_type
        iv_is_leading_message = abap_true.

    RAISE EXCEPTION TYPE /iwbep/cx_mgw_busi_exception
      EXPORTING
        textid = /iwbep/cx_mgw_busi_exception=>business_error
        message_container = lo_container.

  ENDIF.

ENDMETHOD.


METHOD create_subscription.
  DATA:
        ls_caller_context        TYPE ty_s_caller_context,
        ls_subscription_data     TYPE /iwbep/s_mgw_db_sub_data,
        ls_sub_data              TYPE /iwbep/s_mgw_db_sub_data,
        lt_subscription_data     TYPE STANDARD TABLE OF /iwbep/s_mgw_db_sub_data,
        lv_uuid                  TYPE sysuuid-x,
        ls_ctx_user              TYPE syuname,
        ls_ctx_service_root      TYPE string, " base url
        lx_mgw_sub_dba           TYPE REF TO /iwbep/cx_mgw_sub_dba,
        lv_service_root_icf      TYPE icfname,
        ls_req_params            TYPE /iwbep/s_mgw_name_value_pair,
        is_duplicate_resource    TYPE abap_bool,
*        lv_base_url              TYPE string,
        lv_update                TYPE boolean,
        lx_tech_excp             TYPE REF TO /iwbep/cx_mgw_tech_exception.

  DATA: lo_destination_finder TYPE REF TO /iwbep/if_destin_finder,
        lo_dp_facade          TYPE REF TO /iwbep/if_mgw_dp_fw_facade,
        lv_system_alias       TYPE /iwbep/defi_system_alias.


  IF iv_execution_mode EQ 'M'.
*----Function import handling for Multi destination-----------------------------
*----read data into subscription target structure
    LOOP AT is_request_details-parameters INTO ls_req_params.
      CASE ls_req_params-name.
        WHEN 'title'.
          ls_subscription_data-title = ls_req_params-value.
        WHEN 'deliveryAddress'.
          ls_subscription_data-delivery_address = ls_req_params-value.
        WHEN 'persistNotifications'.
          ls_subscription_data-persist_notif = ls_req_params-value.
        WHEN 'collection' .
          ls_subscription_data-collection_name = ls_req_params-value.
        WHEN 'select' .
          ls_subscription_data-select_parameter = ls_req_params-value.
        WHEN 'filter' .
          ls_subscription_data-filter_parameter = ls_req_params-value.
        WHEN 'changeType' .
          ls_subscription_data-change_type = ls_req_params-value.
      ENDCASE.
    ENDLOOP.
  ELSE.
*-----Single destination handling--
    io_data_provider->read_entry_data( IMPORTING es_data = ls_subscription_data ).
  ENDIF.
*---------------------------------------------------------------------------------

*-get parameters from application context object
  mo_context->get_parameter(
    EXPORTING
      iv_name  = /iwbep/if_mgw_context=>gc_param_request_user
    IMPORTING
      ev_value = ls_ctx_user ).

  mo_context->get_parameter(
    EXPORTING
      iv_name  = /iwbep/if_mgw_context=>gc_param_service_root
    IMPORTING
      ev_value = ls_ctx_service_root ).

  mo_context->get_parameter(
  EXPORTING
    iv_name  = /iwbep/if_mgw_context=>gc_param_service_root_icf
  IMPORTING
    ev_value = lv_service_root_icf ).

*-get caller context of rfc call from gateway
  ls_caller_context = get_caller_context( ).

*- dont allow creating subscriptions if
*- delivery channel is provided with persist notifications = X or
*- delivery channel is not provided with persist notifications = ''
  allow_delivery_channel( is_data = ls_subscription_data ).

*-set context
  mo_context->get_parameter(
    EXPORTING
      iv_name  = /iwbep/if_mgw_context=>gc_param_isn
    IMPORTING
      ev_value = ls_subscription_data-group_tech_name ).

  mo_context->get_parameter(
    EXPORTING
      iv_name  = /iwbep/if_mgw_context=>gc_param_isv
    IMPORTING
      ev_value = ls_subscription_data-group_version ).

*-generate uuid for subscription
  CALL FUNCTION 'SYSTEM_UUID_CREATE'
    IMPORTING
      uuid = lv_uuid.

  "user from context - double check with caller
  ASSERT ls_caller_context-whoami EQ ls_ctx_user. " if rfc user ne context user given by gateway

*-add id to subscription
  ls_subscription_data-id = lv_uuid.

*-add caller gateway info
  ls_subscription_data-source_system_id = ls_caller_context-system_id.
  ls_subscription_data-source_client    = ls_caller_context-client.

*-add info from context
  ls_subscription_data-username         = ls_caller_context-whoami.

  REPLACE ALL OCCURRENCES OF ';mo/' IN ls_ctx_service_root WITH '/'. " for multi destination  - remove ";mo" from service root
  ls_subscription_data-base_url         = ls_ctx_service_root.

*-add service root information
  ls_subscription_data-service_root     = lv_service_root_icf.

*- add Service root from context
*-add timestamp info
  GET TIME STAMP FIELD ls_subscription_data-created_timestmp.
  ls_subscription_data-changed_timestmp = ls_subscription_data-created_timestmp.

*-add subscriber language
  ls_subscription_data-language = sy-langu.

*-authorization check
  check_subscription_authority( is_subscription_data = ls_subscription_data ).

*- Validate Change Type
  check_change_type( iv_change_type = ls_subscription_data-change_type ).

*- add Created By info
  ls_subscription_data-created_by = sy-uname.

*---get SAP system alias
  lo_dp_facade ?= /iwbep/if_mgw_conv_srv_runtime~get_dp_facade( ).
  lo_destination_finder = lo_dp_facade->get_destination_finder( ).
  lv_system_alias = lo_destination_finder->get_system_alias( ).

*-check whether subscription is a duplicate
  is_subscription_duplicate( EXPORTING iv_execution_mode = iv_execution_mode
                                       iv_system_alias   = lv_system_alias
                             IMPORTING is_duplicate = is_duplicate_resource
                                       ev_update    = lv_update
                             CHANGING  cs_data = ls_subscription_data ).

  IF is_duplicate_resource NE abap_true.

    MOVE-CORRESPONDING ls_subscription_data TO ls_sub_data.

  ls_sub_data-system_alias = lv_system_alias .

*- Get Request Format information
    TRY.
        CALL METHOD me->get_format
          RECEIVING
            rv_format = ls_sub_data-notif_format.
      CATCH /iwbep/cx_mgw_tech_exception INTO lx_tech_excp.
*---raise exception if format is not received
        RAISE EXCEPTION TYPE /iwbep/cx_mgw_tech_exception
          EXPORTING
            previous      = lx_tech_excp.
    ENDTRY.
*---store subscription
    TRY.

        IF lv_update EQ abap_true.
          /iwbep/cl_mgw_sub_dba=>update( CHANGING cs_data = ls_sub_data ).
        ELSE.
          /iwbep/cl_mgw_sub_dba=>create( CHANGING cs_data = ls_sub_data ).
        ENDIF.

      CATCH /iwbep/cx_mgw_sub_dba INTO lx_mgw_sub_dba.
        RAISE EXCEPTION TYPE /iwbep/cx_mgw_busi_exception
        EXPORTING
          previous = lx_mgw_sub_dba.

    ENDTRY.

    IF iv_execution_mode EQ 'M'.    " Multidestination mode and duplicate resource = false
*---pass back subscription for multidestination subscription - Function import
      APPEND ls_subscription_data TO lt_subscription_data.
      copy_data_to_ref(
        EXPORTING
          is_data = lt_subscription_data
        CHANGING
          cr_data = er_entity
      ).
    ELSE.
*---pass back subscription
      copy_data_to_ref(
        EXPORTING
          is_data = ls_subscription_data
        CHANGING
          cr_data = er_entity
      ).
    ENDIF.
  ELSEIF iv_execution_mode EQ 'M'.    " Multidestination mode and duplicate resource = true
*---pass back duplicate subscription read from backend
    APPEND ls_subscription_data TO lt_subscription_data.
    copy_data_to_ref(
      EXPORTING
        is_data = lt_subscription_data
      CHANGING
        cr_data = er_entity
    ).
  ELSE.                              " single destination and duplicate resource = true
*---raise exception as the resource already exists
    RAISE EXCEPTION TYPE /iwbep/cx_mgw_busi_exception
      EXPORTING
        textid      = /iwbep/cx_mgw_busi_exception=>resource_duplicate.
  ENDIF.

ENDMETHOD.


METHOD delete_subscription.

  DATA: ls_key          TYPE /iwbep/s_mgw_name_value_pair
        ,lv_sub_id       TYPE /iwbep/s_mgw_db_sub_data-id
        .

  DATA:
        lx_mgw_sub_dba   TYPE REF TO /iwbep/cx_mgw_sub_dba.

*-get subscription id - only one key in table
  READ TABLE it_key_tab INDEX 1
    INTO ls_key.

*-assign subscription id
  lv_sub_id = ls_key-value.

*-delete subscription
  TRY .
      /iwbep/cl_mgw_sub_dba=>delete( iv_id = lv_sub_id ).
    CATCH /iwbep/cx_mgw_sub_dba INTO lx_mgw_sub_dba.
      RAISE EXCEPTION TYPE /iwbep/cx_mgw_busi_exception
      EXPORTING
        previous = lx_mgw_sub_dba.
  ENDTRY.


ENDMETHOD.


METHOD get_caller_context.

  CALL FUNCTION 'RFC_GET_ATTRIBUTES'
   IMPORTING
*     CALLER_DESTINATION              =
*     CALLER_IP                       =
*     CALLER_TRUSTED                  =
*     CALLER_RFC_TYPE                 =
     caller_client                   = rs_caller_context-client
     caller_whoami                   = rs_caller_context-whoami
*     CALLER_START_INFO               =
*     CALLER_TCODE                    =
*     CALLER_PROGRAM                  =
     caller_system_id                = rs_caller_context-system_id
*     CALLER_SYSTEM_RELEASE           =
*     CALLER_KERNEL_RELEASE           =
*     CALLER_ASYNC_TYPE               =
*     CALLER_TRANS_TYPE               =
*     CALLER_PCS                      =
*     CALLER_CODEPAGE                 =
*     CALLER_MDMP                     =
   EXCEPTIONS
     system_call_not_supported       = 1
     no_rfc_communication            = 2
     internal_error                  = 3
     OTHERS                          = 4
            .
  IF sy-subrc = 2 .
* Local Call - Co-Deployment of BEP in Hub
    rs_caller_context-client = sy-mandt.
    rs_caller_context-whoami = sy-uname.
    rs_caller_context-system_id = sy-sysid.
  ELSEIF sy-subrc <> 0.
    "Do Nothing
  ENDIF.

ENDMETHOD.


METHOD get_format.

  DATA : lo_dp_facade TYPE REF TO /iwbep/if_mgw_dp_fw_facade,
         lx_tech_excp TYPE REF TO /iwbep/cx_mgw_tech_exception.

  TRY.

      lo_dp_facade ?= me->/iwbep/if_mgw_conv_srv_runtime~get_dp_facade( ).

      rv_format = lo_dp_facade->get_format( ).

    CATCH /iwbep/cx_mgw_tech_exception INTO lx_tech_excp.
      RAISE EXCEPTION TYPE /iwbep/cx_mgw_tech_exception
        EXPORTING
          previous  = lx_tech_excp.
  ENDTRY.

ENDMETHOD.


METHOD get_subscriptions.
  DATA:
      ls_filter            TYPE /iwbep/s_mgw_select_option
      ,lt_filters           TYPE /iwbep/t_mgw_select_option
      ,lt_select_options    TYPE /iwbep/t_cod_select_options
      ,ls_select_option     TYPE /iwbep/s_cod_select_option
      ,lv_group_tech_name	  TYPE /iwbep/med_grp_technical_name
      ,lv_group_version	    TYPE /iwbep/med_grp_version
      ,lv_service_root_icf  TYPE icfname
      .
*-from context
  mo_context->get_parameter(
    EXPORTING
      iv_name  = /iwbep/if_mgw_context=>gc_param_isn
    IMPORTING
      ev_value = lv_group_tech_name ).

  mo_context->get_parameter(
    EXPORTING
      iv_name  = /iwbep/if_mgw_context=>gc_param_isv
    IMPORTING
      ev_value = lv_group_version ).

  mo_context->get_parameter(
  EXPORTING
    iv_name  = /iwbep/if_mgw_context=>gc_param_service_root_icf
  IMPORTING
    ev_value = lv_service_root_icf ).

*-add parameters to select options - always filter by user
  ls_filter-property = /iwbep/cl_mgw_sub_dba=>gc_db_select_field-username.

  ls_select_option-sign   = 'I'.
  ls_select_option-option = 'EQ'.
  ls_select_option-low    = sy-uname.
  INSERT ls_select_option INTO TABLE lt_select_options.
  ls_filter-select_options = lt_select_options.

  INSERT ls_filter INTO TABLE lt_filters.

*-add parameters to select options - always filter by group tech name
  CLEAR lt_select_options.
  ls_filter-property = /iwbep/cl_mgw_sub_dba=>gc_db_select_field-group_tech_name.

  ls_select_option-sign   = 'I'.
  ls_select_option-option = 'EQ'.
  ls_select_option-low    = lv_group_tech_name.
  INSERT ls_select_option INTO TABLE lt_select_options.
  ls_filter-select_options = lt_select_options.

  INSERT ls_filter INTO TABLE lt_filters.

*-add parameters to select options - always filter by group tech name
  CLEAR lt_select_options.
  ls_filter-property = /iwbep/cl_mgw_sub_dba=>gc_db_select_field-group_version.

  ls_select_option-sign   = 'I'.
  ls_select_option-option = 'EQ'.
  ls_select_option-low    = lv_group_version.
  INSERT ls_select_option INTO TABLE lt_select_options.
  ls_filter-select_options = lt_select_options.

  INSERT ls_filter INTO TABLE lt_filters.

*-add parameters to select options - always filter by Service Root ICF name
  CLEAR lt_select_options.
  ls_filter-property = /iwbep/cl_mgw_sub_dba=>gc_db_select_field-service_root.

  ls_select_option-sign   = 'I'.
  IF lv_service_root_icf EQ lc_icf_node_sdata.
    ls_select_option-low = lc_icf_node_odata.
    ls_select_option-option = 'NE'.
  ELSE.
    ls_select_option-option = 'EQ'.
    ls_select_option-low    = lv_service_root_icf.
  ENDIF.

  INSERT ls_select_option INTO TABLE lt_select_options.
  ls_filter-select_options = lt_select_options.

  INSERT ls_filter INTO TABLE lt_filters.

*-get subscriptions
  et_subscriptions = /iwbep/cl_mgw_sub_dba=>get_list( it_filters = lt_filters ).

ENDMETHOD.


METHOD is_subscription_duplicate.

  DATA:  lt_subscriptions         TYPE        /iwbep/t_mgw_db_sub_data
        ,lr_subscription          TYPE REF TO /iwbep/s_mgw_db_sub_data
        ,ls_filter                TYPE        /iwbep/s_mgw_select_option
        ,lt_filters               TYPE        /iwbep/t_mgw_select_option
        ,lt_select_options        TYPE        /iwbep/t_cod_select_options
        ,ls_select_option         TYPE        /iwbep/s_cod_select_option
        ,lv_new_srv_root          TYPE icfname.
  .
  FIELD-SYMBOLS : <ls_data> TYPE /iwbep/s_mgw_db_sub_data.
*-user
  ls_filter-property = /iwbep/cl_mgw_sub_dba=>gc_db_select_field-username.

  ls_select_option-sign   = 'I'.
  ls_select_option-option = 'EQ'.
  ls_select_option-low    = cs_data-username.
  INSERT ls_select_option INTO TABLE lt_select_options.
  ls_filter-select_options = lt_select_options.

  INSERT ls_filter INTO TABLE lt_filters.

*-collection name
  CLEAR: lt_select_options, ls_filter.
  ls_filter-property   = /iwbep/cl_mgw_sub_dba=>gc_db_select_field-collection_name.
  ls_select_option-low = cs_data-collection_name.
  INSERT ls_select_option INTO TABLE lt_select_options.
  ls_filter-select_options = lt_select_options.
  INSERT ls_filter INTO TABLE lt_filters.

  CLEAR: lt_select_options, ls_filter.
  ls_filter-property   = /iwbep/cl_mgw_sub_dba=>gc_db_select_field-group_tech_name.
  ls_select_option-low = cs_data-group_tech_name.
  INSERT ls_select_option INTO TABLE lt_select_options.
  ls_filter-select_options = lt_select_options.
  INSERT ls_filter INTO TABLE lt_filters.

  CLEAR: lt_select_options, ls_filter.
  ls_filter-property   = /iwbep/cl_mgw_sub_dba=>gc_db_select_field-group_version.
  ls_select_option-low = cs_data-group_version.
  INSERT ls_select_option INTO TABLE lt_select_options.
  ls_filter-select_options = lt_select_options.
  INSERT ls_filter INTO TABLE lt_filters.

  CLEAR: lt_select_options, ls_filter.
  ls_filter-property   = /iwbep/cl_mgw_sub_dba=>gc_db_select_field-source_system_id.
  ls_select_option-low = cs_data-source_system_id.
  INSERT ls_select_option INTO TABLE lt_select_options.
  ls_filter-select_options = lt_select_options.
  INSERT ls_filter INTO TABLE lt_filters.


  CLEAR: lt_select_options, ls_filter.
  ls_filter-property   = /iwbep/cl_mgw_sub_dba=>gc_db_select_field-source_client.
  ls_select_option-low = cs_data-source_client.
  INSERT ls_select_option INTO TABLE lt_select_options.
  ls_filter-select_options = lt_select_options.
  INSERT ls_filter INTO TABLE lt_filters.

*-get subscriptions
  lt_subscriptions = /iwbep/cl_mgw_sub_dba=>get_list( it_filters = lt_filters ).

  IF LINES( lt_subscriptions ) EQ 0.
    is_duplicate = abap_false.
  ELSE.
    LOOP AT lt_subscriptions REFERENCE INTO lr_subscription.
      IF lr_subscription->*-delivery_address EQ cs_data-delivery_address AND
*         lr_subscription->*-base_url         EQ cs_data-base_url         AND
         lr_subscription->*-filter_parameter EQ cs_data-filter_parameter AND
         ( lr_subscription->*-change_type    EQ cs_data-change_type OR
           lr_subscription->*-change_type    IS INITIAL )
         AND
         lr_subscription->*-system_alias     EQ iv_system_alias.
*- If service root is different, update subscription
        IF lr_subscription->*-service_root NE cs_data-service_root.
          ev_update = abap_true.
          lv_new_srv_root = cs_data-service_root.
          MOVE-CORRESPONDING lr_subscription->* TO cs_data.
          cs_data-service_root = lv_new_srv_root.
        ELSE.
          is_duplicate = abap_true.
        ENDIF.
*- Multi-Destination scenario
        IF iv_execution_mode EQ 'M'.
          ASSIGN lr_subscription->* TO <ls_data>.
          cs_data = <ls_data>.
        ENDIF.
        RETURN.
      ENDIF.
    ENDLOOP.
    is_duplicate = abap_false.
  ENDIF.

ENDMETHOD.


method RAISE_NOT_SUPPORTED_EXCEPTION.

  RAISE exception type /iwbep/cx_mgw_tech_exception
    exporting
      textid      = /iwbep/cx_mgw_tech_exception=>operation_not_supported
      operation   = iv_operation
      entity_type = iv_entity_type.

endmethod.


METHOD read_subscription.

  DATA:  ls_subscription      TYPE /iwbep/s_mgw_db_sub_data
        ,ls_key               TYPE /iwbep/s_mgw_name_value_pair
        ,lv_sub_id            TYPE /iwbep/s_mgw_db_sub_data-id
        ,lv_service_root_icf  TYPE icfname
        ,lv_uname             type syuname
        .

*/ Move SY-UNAME to a local variable.
  lv_uname = sy-uname.

*-get subscription id - only one key in table
  READ TABLE is_request_details-key_tab INDEX 1
    INTO ls_key.

*-assign subscription id
  lv_sub_id = ls_key-value.

*-get subscription
  ls_subscription = /iwbep/cl_mgw_sub_dba=>get( iv_id = lv_sub_id ).

* Get the service context - ODATA or SDATA
  mo_context->get_parameter(
  EXPORTING
    iv_name  = /iwbep/if_mgw_context=>gc_param_service_root_icf
  IMPORTING
    ev_value = lv_service_root_icf ).

*-only pass back subscription if it is in current user context
  IF ls_subscription-username EQ lv_uname AND
    ls_subscription-service_root EQ lv_service_root_icf.    "#EC *
*---pass back list of subscription
    copy_data_to_ref(
      EXPORTING
        is_data = ls_subscription
      CHANGING
        cr_data = er_entity
    ).
  ENDIF.

ENDMETHOD.


METHOD read_subscriptions.
  DATA:
         lt_subscriptions     TYPE /iwbep/t_mgw_db_sub_data
        ,ls_filter            TYPE /iwbep/s_mgw_select_option
        ,lt_filters           TYPE /iwbep/t_mgw_select_option
        ,lt_select_options    TYPE /iwbep/t_cod_select_options
        ,ls_select_option     TYPE /iwbep/s_cod_select_option
        ,lv_group_tech_name   TYPE /iwbep/med_grp_technical_name
        ,lv_group_version     TYPE /iwbep/med_grp_version
*        ,lv_service_root_icf  TYPE icfname
*        ,ls_system_alias_info TYPE /iwbep/s_defi_alias_info
        ,lv_no_of_filters     TYPE i
        ,ls_caller_context    TYPE ty_s_caller_context
        .

*- Check if unsupported filter is passed and raise exception
  DESCRIBE TABLE it_filter_select_options LINES lv_no_of_filters.

  IF lv_no_of_filters NE 0.
    LOOP AT it_filter_select_options INTO ls_filter.
      IF ls_filter-property NE 'changeType'.
        RAISE EXCEPTION TYPE /iwbep/cx_mgw_busi_exception
          EXPORTING
            textid = /iwbep/cx_mgw_busi_exception=>filter_not_supported
            filter_param = ls_filter-property.
      ENDIF.
    ENDLOOP.
    CLEAR : ls_filter.
  ENDIF.

*-from context
  mo_context->get_parameter(
    EXPORTING
      iv_name  = /iwbep/if_mgw_context=>gc_param_isn
    IMPORTING
      ev_value = lv_group_tech_name ).

  mo_context->get_parameter(
    EXPORTING
      iv_name  = /iwbep/if_mgw_context=>gc_param_isv
    IMPORTING
      ev_value = lv_group_version ).

*  mo_context->get_parameter(
*  EXPORTING
*    iv_name  = /iwbep/if_mgw_context=>gc_param_service_root_icf
*  IMPORTING
*    ev_value = lv_service_root_icf ).

*-get caller context of rfc call from gateway
  ls_caller_context = get_caller_context( ).

*-add parameters to select options - always filter by Context user
  ls_filter-property = /iwbep/cl_mgw_sub_dba=>gc_db_select_field-username.

  ls_select_option-sign   = 'I'.
  ls_select_option-option = 'EQ'.
  ls_select_option-low    = ls_caller_context-whoami.
  INSERT ls_select_option INTO TABLE lt_select_options.
  ls_filter-select_options = lt_select_options.

  INSERT ls_filter INTO TABLE lt_filters.

*-add parameters to select options - always filter by group tech name
  CLEAR lt_select_options.
  ls_filter-property = /iwbep/cl_mgw_sub_dba=>gc_db_select_field-group_tech_name.

  ls_select_option-sign   = 'I'.
  ls_select_option-option = 'EQ'.
  ls_select_option-low    = lv_group_tech_name.
  INSERT ls_select_option INTO TABLE lt_select_options.
  ls_filter-select_options = lt_select_options.

  INSERT ls_filter INTO TABLE lt_filters.

*-add parameters to select options - always filter by group tech name
  CLEAR lt_select_options.
  ls_filter-property = /iwbep/cl_mgw_sub_dba=>gc_db_select_field-group_version.

  ls_select_option-sign   = 'I'.
  ls_select_option-option = 'EQ'.
  ls_select_option-low    = lv_group_version.
  INSERT ls_select_option INTO TABLE lt_select_options.
  ls_filter-select_options = lt_select_options.

  INSERT ls_filter INTO TABLE lt_filters.

**-add parameters to select options - always filter by Service Root ICF name
*  CLEAR lt_select_options.
*  ls_filter-property = /iwbep/cl_mgw_sub_dba=>gc_db_select_field-service_root.
*
*  ls_select_option-sign   = 'I'.
*  IF lv_service_root_icf EQ lc_icf_node_sdata.
*    ls_select_option-low = lc_icf_node_odata.
*    ls_select_option-option = 'NE'.
*  ELSE.
*    ls_select_option-option = 'EQ'.
*    ls_select_option-low    = lv_service_root_icf.
*  ENDIF.

*  INSERT ls_select_option INTO TABLE lt_select_options.
*  ls_filter-select_options = lt_select_options.
*
*  INSERT ls_filter INTO TABLE lt_filters.

  READ TABLE it_filter_select_options INTO ls_filter
                        WITH KEY property = 'changeType'.
  IF sy-subrc EQ 0.
    ls_filter-property = /iwbep/cl_mgw_sub_dba=>gc_db_select_field-change_type.

    INSERT ls_filter INTO TABLE lt_filters.
  ENDIF.

*-get subscriptions
  lt_subscriptions = /iwbep/cl_mgw_sub_dba=>get_list( it_filters = lt_filters ).

*-pass back list of subscription
  copy_data_to_ref(
    EXPORTING
      is_data = lt_subscriptions
    CHANGING
      cr_data = er_entityset
  ).

ENDMETHOD.


METHOD update_subscription.

  DATA:  ls_subscription_data    TYPE /iwbep/s_mgw_db_sub_data
        ,ls_db_subscription_data TYPE /iwbep/s_mgw_db_sub_data
        ,ls_key                  TYPE /iwbep/s_mgw_name_value_pair
        ,lv_sub_id               TYPE /iwbep/s_mgw_db_sub_data-id
        ,lx_mgw_sub_dba          TYPE REF TO /iwbep/cx_mgw_sub_dba
        ,lv_service_root_icf     TYPE icfname
        ,lv_change_type_exists   TYPE boolean
        ,ls_sub_data             TYPE /iwbep/s_mgw_db_sub_data.
*        ,lx_tech_excp            TYPE REF TO /iwbep/cx_mgw_tech_exception.

*-read data into subscription target structure
  io_data_provider->read_entry_data( IMPORTING es_data = ls_subscription_data ).


*-authorization check
  check_subscription_authority( is_subscription_data = ls_subscription_data ).

*- dont allow updating subscriptions if
*- delivery channel is provided with persist notifications = X
  allow_delivery_channel( is_data = ls_subscription_data ).

*-get subscription id - only one key in table
  READ TABLE it_key_tab INDEX 1 INTO ls_key.

*-assign subscription id
  lv_sub_id = ls_key-value.

*-check whether subscription with id exists in order to perform update
  ls_db_subscription_data = /iwbep/cl_mgw_sub_dba=>get( iv_id = lv_sub_id ).

  IF ls_db_subscription_data IS NOT INITIAL.

*---move fields which can potentially be updated to db subscription
    ls_db_subscription_data-delivery_address = ls_subscription_data-delivery_address.
    ls_db_subscription_data-collection_name  = ls_subscription_data-collection_name.
    ls_db_subscription_data-filter_parameter = ls_subscription_data-filter_parameter.
    ls_db_subscription_data-select_parameter = ls_subscription_data-select_parameter.
    ls_db_subscription_data-persist_notif    = ls_subscription_data-persist_notif.
    ls_db_subscription_data-change_type      = ls_subscription_data-change_type.

*---use current logon language - language can be changed
    ls_db_subscription_data-language = sy-langu.

*---set changed timestamp info
    GET TIME STAMP FIELD ls_db_subscription_data-changed_timestmp.

* For backward compatbility
    IF ls_db_subscription_data-service_root IS INITIAL.
      mo_context->get_parameter(
        EXPORTING
          iv_name  = /iwbep/if_mgw_context=>gc_param_service_root_icf
        IMPORTING
          ev_value = lv_service_root_icf ).
      ls_db_subscription_data-service_root = lv_service_root_icf.
    ENDIF.

*- Validate Change Type
    check_change_type( iv_change_type = ls_db_subscription_data-change_type ).

*- Check if change type already exists and handle accordingly
    CLEAR lv_change_type_exists.
    lv_change_type_exists = change_type_existence_check( is_sub_data = ls_db_subscription_data ).

    IF lv_change_type_exists NE abap_true.
*- Get Request Format information
      MOVE-CORRESPONDING ls_db_subscription_data TO ls_sub_data.
*      TRY.
*          CALL METHOD me->get_format
*            RECEIVING
*              rv_format = ls_sub_data-notif_format.
*        CATCH /iwbep/cx_mgw_tech_exception INTO lx_tech_excp.
**---raise exception if format is not received
*          RAISE EXCEPTION TYPE /iwbep/cx_mgw_tech_exception
*            EXPORTING
*              previous      = lx_tech_excp.
*      ENDTRY.
*---update subscription
      TRY.
          /iwbep/cl_mgw_sub_dba=>update( CHANGING cs_data = ls_sub_data ).
        CATCH /iwbep/cx_mgw_sub_dba INTO lx_mgw_sub_dba.
          RAISE EXCEPTION TYPE /iwbep/cx_mgw_busi_exception
          EXPORTING
            previous = lx_mgw_sub_dba.
      ENDTRY.
*---pass back subscription
      copy_data_to_ref(
        EXPORTING
          is_data = ls_db_subscription_data
        CHANGING
          cr_data = er_entity
      ).
    ELSE.
*---raise exception as the resource already exists
      RAISE EXCEPTION TYPE /iwbep/cx_mgw_busi_exception
        EXPORTING
          textid      = /iwbep/cx_mgw_busi_exception=>resource_duplicate.
    ENDIF.

  ELSE.
*---raise exception as the resource doesn't exist
    RAISE EXCEPTION TYPE /iwbep/cx_mgw_busi_exception
      EXPORTING
        textid      = /iwbep/cx_mgw_busi_exception=>resource_not_found
        entity_type = mc_entity_type_subscription.
  ENDIF.

ENDMETHOD.
ENDCLASS.