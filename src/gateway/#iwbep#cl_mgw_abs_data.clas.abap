"! <p class="shorttext synchronized" lang="en">Abstract Business Data Provider</p>
CLASS /iwbep/cl_mgw_abs_data DEFINITION
  PUBLIC
  ABSTRACT
  CREATE PUBLIC .

*"* public components of class /IWBEP/CL_MGW_ABS_DATA
*"* do not include other source files here!!!
  PUBLIC SECTION.
    TYPE-POOLS abap .

    INTERFACES /iwbep/if_mgw_appl_srv_runtime .
    INTERFACES /iwbep/if_mgw_badi_srv_runtime .
    INTERFACES /iwbep/if_mgw_conv_srv_runtime .
    INTERFACES /iwbep/if_mgw_core_srv_runtime .
    INTERFACES /iwbep/if_mgw_sost_srv_runtime .
    INTERFACES if_badi_interface .

    ALIASES check_if_is_not_modified
      FOR /iwbep/if_mgw_conv_srv_runtime~check_if_is_not_modified .
    ALIASES copy_data_to_ref
      FOR /iwbep/if_mgw_conv_srv_runtime~copy_data_to_ref .
    ALIASES move_corresponding
      FOR /iwbep/if_mgw_conv_srv_runtime~move_corresponding .
    ALIASES set_etag
      FOR /iwbep/if_mgw_conv_srv_runtime~set_etag .
    ALIASES set_header
      FOR /iwbep/if_mgw_conv_srv_runtime~set_header .
    ALIASES soft_state_session_end
      FOR /iwbep/if_mgw_conv_srv_runtime~soft_state_session_end .
    ALIASES soft_state_session_start
      FOR /iwbep/if_mgw_conv_srv_runtime~soft_state_session_start .

    TYPES:
      "! <p class="shorttext synchronized" lang="en">Media Type Information</p>
      BEGIN OF ty_s_media_resource.
        INCLUDE TYPE /iwbep/if_mgw_core_srv_runtime=>ty_s_media_resource.
    TYPES:
      END OF ty_s_media_resource .

    CONSTANTS:
      BEGIN OF gcs_parameters,
        expand      TYPE string VALUE '$expand',
        filter      TYPE string VALUE '$filter',
        search      TYPE string VALUE 'search',             "#EC NOTEXT
        slug        TYPE string VALUE 'Slug', "#EC NOTEXT (for media resources)
        skiptoken   TYPE string VALUE '$skiptoken',
        inlinecount TYPE string VALUE '$inlinecount',
        count       TYPE string VALUE '$count',
        format      TYPE string VALUE '$format',
      END OF gcs_parameters .
    "! <p class="shorttext synchronized" lang="en">SAP Note number</p>
    CLASS-DATA gc_note_id_cache_control TYPE /iwbep/mgw_sap_note_id VALUE 1969660 ##NO_TEXT.
    "! <p class="shorttext synchronized" lang="en">SAP Note number</p>
    CLASS-DATA gc_note_id_func_import_0_1 TYPE /iwbep/mgw_sap_note_id VALUE 2009874 ##NO_TEXT.

    "! <p class="shorttext synchronized" lang="en">Class Constructor</p>
    CLASS-METHODS class_constructor .
  PROTECTED SECTION.

*"* protected components of class /IWBEP/CL_MGW_ABS_DATA
*"* do not include other source files here!!!
    "! <p class="shorttext synchronized" lang="en">MGW Context</p>
    DATA mo_context TYPE REF TO /iwbep/if_mgw_context .
    "! <p class="shorttext synchronized" lang="en">the request details for a remote request to a mgw server</p>
    DATA mr_request_details TYPE REF TO /iwbep/if_mgw_core_srv_runtime=>ty_s_mgw_request_context .
    DATA mr_service_document_name TYPE REF TO string .
    DATA mr_service_namespace TYPE REF TO string .
    "! <p class="shorttext synchronized" lang="en">Count parameters</p>
    DATA mr_service_version TYPE REF TO numc4 .
private section.

  types:
      "! <p class="shorttext synchronized" lang="en">Target entity type for navigation property</p>
    BEGIN OF ty_s_nav_target_buffer,
        source_entity_type_name  TYPE /iwbep/mgw_tech_name,
        navigation_property_name TYPE fieldname,
        target_entity_type       TYPE REF TO /iwbep/if_mgw_odata_fw_etype,
      END OF ty_s_nav_target_buffer .
  types:
                "! <p class="shorttext synchronized" lang="en">Target entity type buffer (navi key converter)</p>
    ty_t_nav_target_buffer TYPE SORTED TABLE OF ty_s_nav_target_buffer WITH UNIQUE KEY source_entity_type_name navigation_property_name .
  types:
      "! <p class="shorttext synchronized" lang="en">Operation buffer during batch-at-once execution</p>
    BEGIN OF ty_s_batch_operation_buffer,
        operation_id   TYPE string,
        operation_type TYPE /iwbep/mgw_operation_type,
        model          TYPE REF TO /iwbep/if_mgw_odata_fw_model,
        expand_root    TYPE REF TO /iwbep/cl_mgw_expand_node,
        request_obj    TYPE REF TO /iwbep/cl_mgw_request,
        msg_container  TYPE REF TO /iwbep/if_message_container,
      END OF  ty_s_batch_operation_buffer .
  types:
        "! <p class="shorttext synchronized" lang="en">Operation buffer during batch-at-once execution</p>
    ty_t_batch_operation_buffer TYPE SORTED TABLE OF ty_s_batch_operation_buffer WITH UNIQUE KEY operation_id .

  constants:
      "! <p class="shorttext synchronized" lang="en">ICF Root node names</p>
    BEGIN OF gcs_icf_nodes,
        sdata TYPE string VALUE 'sdata',                    "#EC NOTEXT
        odata TYPE string VALUE 'odata',                    "#EC NOTEXT
      END OF gcs_icf_nodes .
  constants:
*"* private components of class /IWBEP/CL_MGW_ABS_DATA
*"* do not include other source files here!!!
    BEGIN OF gcs_methods,
        get_entity         TYPE string VALUE 'GET_ENTITY',
        execute_action     TYPE string VALUE 'EXECUTE_ACTION',
        update_entity      TYPE string VALUE 'UPDATE_ENTITY',
        patch_entity       TYPE string VALUE 'PATCH_ENTITY',
        create_entity      TYPE string VALUE 'CREATE_ENTITY',
        create_deep_entity TYPE string VALUE 'CREATE_DEEP_ENTITY',
        delete_entity      TYPE string VALUE 'DELETE_ENTITY',
        get_entityset      TYPE string VALUE 'GET_ENTITYSET',
        get_property       TYPE string VALUE 'GET_PROPERTY',
        get_stream         TYPE string VALUE 'GET_STREAM',
        update_stream      TYPE string VALUE 'UPDATE_STREAM',
        create_stream      TYPE string VALUE 'CREATE_STREAM',
        delete_stream      TYPE string VALUE 'DELETE_STREAM',
        changeset_begin    TYPE string VALUE 'CHANGESET_BEGIN',
        changeset_end      TYPE string VALUE 'CHANGESET_END',
        changeset_process  TYPE string VALUE 'CHANGESET_PROCESS',
        softstate_op_start TYPE string VALUE 'SOFTSTATE_OPERATION_START',
        softstate_op_fin   TYPE string VALUE 'SOFTSTATE_OPERATION_CLEAN_UP',
        reset_dp           TYPE string VALUE 'RESET_DATA_PROVIDER',
        batch_begin        TYPE string VALUE 'BATCH_BEGIN',
        batch_end          TYPE string VALUE 'BATCH_END',
      END OF gcs_methods .
  constants:
    BEGIN OF gcs_request_types,
        stream TYPE string VALUE 'stream',                  "#EC NOTEXT
      END OF gcs_request_types .
    "! <p class="shorttext synchronized" lang="en">Character field of length 40</p>
  constants MC_AGENT type CHAR40 value 'DATA_PROVIDER' ##NO_TEXT.
    "! <p class="shorttext synchronized" lang="en">Gateway Runtime Utility 7.50</p>
  class-data GO_RT_UTILITY_750 type ref to /IWBEP/IF_RT_UTILITY_750 .
    "! <p class="shorttext synchronized" lang="en">Changeset Helper for deferred processing</p>
  data MO_CHANGESET_HELPER type ref to /IWBEP/CL_MGW_CHANGESET_HELPER .
    "! <p class="shorttext synchronized" lang="en">OData Channal - Data Provider Facade</p>
  data MO_FACADE type ref to /IWBEP/CL_MGW_DP_FACADE .
    "! <p class="shorttext synchronized" lang="en">interface for a script based model</p>
  data MO_MODEL type ref to /IWBEP/IF_MGW_ODATA_FW_MODEL .
    "! <p class="shorttext synchronized" lang="en">Support Utilities: Runtime</p>
  data MO_SUTIL_RUNTIME type ref to /IWBEP/CL_SUTIL_RUNTIME .
    "! <p class="shorttext synchronized" lang="en">Transaction Handler</p>
  data MO_TRANSACTION_HANDLER type ref to /IWBEP/CL_TRANSACTION_HANDLER .
  data MS_HUB_VERSION type /IWBEP/CL_MGW_UTIL_VERSIONS=>TY_S_MGW_HUB_VERSION .
    "! <p class="shorttext synchronized" lang="en">Soft State Info (enable, Mode)</p>
  data MS_SOFT_STATE_INFO type /IWBEP/IF_MGW_CONV_SRV_RUNTIME~TY_S_SOFT_STATE_INFO .
  data MT_HEADERS type TIHTTPNVP .
    "! <p class="shorttext synchronized" lang="en">Target entity type buffer (navi key converter)</p>
  data MT_NAV_TARGET_BUFFER type TY_T_NAV_TARGET_BUFFER .
    "! <p class="shorttext synchronized" lang="en">XSD Truth Value: True/False [ext.]</p>
  data MV_CHANGESET type XSDBOOLEAN .
    "! <p class="shorttext synchronized" lang="en">XSD Truth Value: True/False [ext.]</p>
  data MV_CHANGESET_DEFER_MODE type XSDBOOLEAN .
    "! <p class="shorttext synchronized" lang="en">XSD Truth Value: True/False [ext.]</p>
  data MV_CHANGESET_FUNC_NOT_ALLOWED type XSDBOOLEAN .
    "! <p class="shorttext synchronized" lang="en">Class Name</p>
  data MV_PROVIDER_CLASS type SEOCLNAME .
    "! <p class="shorttext synchronized" lang="en">Terminate Soft-State Session</p>
  data MV_SOFT_STATE_SESSION_END type ABAP_BOOL .
    "! <p class="shorttext synchronized" lang="en">Start Soft-State Session</p>
  data MV_SOFT_STATE_SESSION_START type ABAP_BOOL .
    "! <p class="shorttext synchronized" lang="en">Batch response creation at end of batch processing</p>
  data MV_BATCH_DEFERRED_RESP_CREA type ABAP_BOOL .
    "! <p class="shorttext synchronized" lang="en">Operation buffer during batch-at-once execution</p>
  data MT_BATCH_OPERATION_BUFFER type TY_T_BATCH_OPERATION_BUFFER .

    "! <p class="shorttext synchronized" lang="en">Add Performance Trace Data</p>
    "!
    "! @parameter iv_class      | <p class="shorttext synchronized" lang="en">Class Name</p>
    "! @parameter iv_method     | <p class="shorttext synchronized" lang="en">Method name</p>
    "! @parameter iv_agent      | <p class="shorttext synchronized" lang="en">Log Agent</p>
    "! @parameter iv_time_start | <p class="shorttext synchronized" lang="en">Start Time</p>
    "! @parameter iv_time_stop  | <p class="shorttext synchronized" lang="en">Stop Time</p>
  methods ADD_PERFORMANCE_DATA
    importing
      !IV_CLASS type SEOCLNAME optional
      !IV_METHOD type SEOMTDNAME
      !IV_AGENT type CHAR40 optional
      !IV_TIME_START type I
      !IV_TIME_STOP type I .
    "! <p class="shorttext synchronized" lang="en">Add SAP Origin for Entity (System Alias)</p>
    "!
    "! @parameter is_request_details | <p class="shorttext synchronized" lang="en">the request details for a remote request to a mgw server</p>
  methods ADD_SAP_ORIGIN_ENTITY
    importing
      !IS_REQUEST_DETAILS type /IWBEP/IF_MGW_CORE_SRV_RUNTIME=>TY_S_MGW_REQUEST_CONTEXT
    changing
      !CS_ENTITY type ANY .
    "! <p class="shorttext synchronized" lang="en">Add SAP Origin for Entity Set (System Alias)</p>
    "!
    "! @parameter is_request_details | <p class="shorttext synchronized" lang="en">the request details for a remote request to a mgw server</p>
    "! @parameter ct_entityset       | <p class="shorttext synchronized" lang="en">Entity Set</p>
  methods ADD_SAP_ORIGIN_ENTITYSET
    importing
      !IS_REQUEST_DETAILS type /IWBEP/IF_MGW_CORE_SRV_RUNTIME=>TY_S_MGW_REQUEST_CONTEXT
    changing
      !CT_ENTITYSET type ANY TABLE .
    "! <p class="shorttext synchronized" lang="en">Check eTag conditions before modification operation</p>
    "!
    "! @parameter it_headers                   | <p class="shorttext synchronized" lang="en">HTTP Framework (iHTTP) Table Name/Value Pairs</p>
    "! @raising   /iwbep/cx_mgw_busi_exception | <p class="shorttext synchronized" lang="en">Business Exception</p>
    "! @raising   /iwbep/cx_mgw_tech_exception | <p class="shorttext synchronized" lang="en">Technical Exception</p>
  methods CHECK_BEFORE_MODIFICATION
    importing
      !IV_ENTITY_NAME type STRING
      !IV_SOURCE_NAME type STRING
      !IS_REQUEST_DETAILS type /IWBEP/IF_MGW_CORE_SRV_RUNTIME=>TY_S_MGW_REQUEST_CONTEXT
      !IT_HEADERS type TIHTTPNVP
    raising
      /IWBEP/CX_MGW_BUSI_EXCEPTION
      /IWBEP/CX_MGW_TECH_EXCEPTION .
    "! <p class="shorttext synchronized" lang="en">Check if ETag match the entity ETag</p>
    "!
    "! @parameter io_expand_node | <p class="shorttext synchronized" lang="en">OData Channel Expand Node</p>
  methods CHECK_ETAG_MATCH
    importing
      !IO_EXPAND_NODE type ref to /IWBEP/CL_MGW_EXPAND_NODE
      !IS_ENTITY_STRUCTURE type ANY
      !IT_ETAG type /IWBEP/IF_MGW_CORE_TYPES=>TY_T_ETAG
    returning
      value(RV_MATCHED) type ABAP_BOOL .
    "! <p class="shorttext synchronized" lang="en">Convert Action Data</p>
    "!
    "! @parameter iv_supports_move_corr        | <p class="shorttext synchronized" lang="en">Is move-corresponding supported</p>
    "! @parameter cr_changeset_data            | <p class="shorttext synchronized" lang="en">OData Channel - Core Runtime Interface - Framework</p>
    "! @raising   /iwbep/cx_mgw_busi_exception | <p class="shorttext synchronized" lang="en">Business Exception</p>
    "! @raising   /iwbep/cx_mgw_tech_exception | <p class="shorttext synchronized" lang="en">Technical Exception</p>
  methods CONVERT_ACTION_DATA
    importing
      !IR_ENTITY_DATA type ref to DATA
      !IV_SUPPORTS_MOVE_CORR type ABAP_BOOL optional
    changing
      !CR_CHANGESET_DATA type ref to /IWBEP/IF_MGW_CORE_SRV_RUNTIME=>TY_S_CHANGESET_DATA
    raising
      /IWBEP/CX_MGW_BUSI_EXCEPTION
      /IWBEP/CX_MGW_TECH_EXCEPTION .
    "! <p class="shorttext synchronized" lang="en">Convert Entity Data</p>
    "!
    "! @parameter iv_supports_move_corr        | <p class="shorttext synchronized" lang="en">Is move-corresponding supported</p>
    "! @parameter cr_changeset_data            | <p class="shorttext synchronized" lang="en">OData Channel - Core Runtime Interface - Framework</p>
    "! @raising   /iwbep/cx_mgw_busi_exception | <p class="shorttext synchronized" lang="en">Business Exception</p>
    "! @raising   /iwbep/cx_mgw_tech_exception | <p class="shorttext synchronized" lang="en">Technical Exception</p>
  methods CONVERT_ENTITY_DATA
    importing
      !IR_ENTITY_DATA type ref to DATA
      !IV_SUPPORTS_MOVE_CORR type ABAP_BOOL optional
    changing
      !CR_CHANGESET_DATA type ref to /IWBEP/IF_MGW_CORE_SRV_RUNTIME=>TY_S_CHANGESET_DATA
    raising
      /IWBEP/CX_MGW_BUSI_EXCEPTION
      /IWBEP/CX_MGW_TECH_EXCEPTION .
  methods CONVERT_FILTER_SELECT_OPTIONS
    changing
      !CS_REQUEST_CONTEXT type /IWBEP/IF_MGW_CORE_SRV_RUNTIME=>TY_S_MGW_REQUEST_CONTEXT
    raising
      /IWBEP/CX_MGW_BUSI_EXCEPTION
      /IWBEP/CX_MGW_TECH_EXCEPTION .
    "! <p class="shorttext synchronized" lang="en">OBSOLETE - Copy Data</p>
    "!
    "! @parameter ir_source_data | <p class="shorttext synchronized" lang="en">Source Data</p>
    "! @parameter cr_target_data | <p class="shorttext synchronized" lang="en">Target Data</p>
  methods COPY_DATA_INTERNAL
    importing
      !IR_SOURCE_DATA type ref to DATA
    changing
      !CR_TARGET_DATA type ref to DATA .
    "! <p class="shorttext synchronized" lang="en">Correct the select options, cut accordingly if necessary</p>
    "!
    "! @parameter cs_request_context           | <p class="shorttext synchronized" lang="en">Request context</p>
    "! @raising   /iwbep/cx_mgw_busi_exception | <p class="shorttext synchronized" lang="en">Business Exception</p>
    "! @raising   /iwbep/cx_mgw_tech_exception | <p class="shorttext synchronized" lang="en">Technical Exception</p>
  methods CORRECT_SELECT_OPTIONS
    changing
      !CS_REQUEST_CONTEXT type /IWBEP/IF_MGW_CORE_SRV_RUNTIME=>TY_S_MGW_REQUEST_CONTEXT
    raising
      /IWBEP/CX_MGW_BUSI_EXCEPTION
      /IWBEP/CX_MGW_TECH_EXCEPTION .
    "! <p class="shorttext synchronized" lang="en">Correct string values (from select options)</p>
    "!
    "! @parameter iv_is_high        | <p class="shorttext synchronized" lang="en">LOW/HIGH Value</p>
    "! @parameter es_extended_range | <p class="shorttext synchronized" lang="en">Extenden range</p>
    "! @parameter cs_range          | <p class="shorttext synchronized" lang="en">MGW Framework: Select Options for Queries</p>
  methods CORRECT_STRING_VALUE
    importing
      !IV_LENGTH type I
      !IV_IS_HIGH type XSDBOOLEAN
    exporting
      !ES_EXTENDED_RANGE type /IWBEP/S_COD_SELECT_OPTION
    changing
      !CS_RANGE type /IWBEP/S_COD_SELECT_OPTION .
    "! <p class="shorttext synchronized" lang="en">Correct STRING for substringof</p>
    "!
    "! @parameter iv_option | <p class="shorttext synchronized" lang="en">Type of OPTION component in row type of a Ranges type</p>
    "! @parameter rv_value  | <p class="shorttext synchronized" lang="en">Single-Character Flag</p>
  methods CORRECT_SUBSTRING
    importing
      !IV_VALUE type STRING
      !IV_OPTION type DDOPTION
    returning
      value(RV_VALUE) type CHAR1 .
    "! <p class="shorttext synchronized" lang="en">Create Inline Info</p>
    "!
    "! @parameter io_expand_node      | <p class="shorttext synchronized" lang="en">OData Channel Expand Node</p>
    "! @parameter iv_expand_part      | <p class="shorttext synchronized" lang="en">Part of Expand String</p>
    "! @parameter iv_tech_expand_part | <p class="shorttext synchronized" lang="en">Part of Technical Expand String</p>
    "! @parameter ir_data             | <p class="shorttext synchronized" lang="en">Application Data</p>
    "! @parameter iv_entry_no         | <p class="shorttext synchronized" lang="en">Entry Number</p>
    "! @parameter iv_from_entry       | <p class="shorttext synchronized" lang="en">XSD Truth Value: True/False [ext.]</p>
  methods CREATE_INLINE_INFO
    importing
      !IO_EXPAND_NODE type ref to /IWBEP/CL_MGW_EXPAND_NODE
      !IV_EXPAND_PART type STRING optional
      !IV_TECH_EXPAND_PART type STRING optional
      !IR_DATA type ref to DATA
      !IV_ENTRY_NO type I default 1
      !IV_FROM_ENTRY type XSDBOOLEAN default ABAP_FALSE
    changing
      !CT_INLINE_INFO type /IWBEP/IF_MGW_CORE_SRV_RUNTIME=>TY_T_INLINE_INFO .
    "! <p class="shorttext synchronized" lang="en">Create Inline Info for Deep Insert</p>
    "!
    "! @parameter cr_changeset_data            | <p class="shorttext synchronized" lang="en">OData Channel - Core Runtime Interface - Framework</p>
    "! @raising   /iwbep/cx_mgw_busi_exception | <p class="shorttext synchronized" lang="en">Business Exception</p>
    "! @raising   /iwbep/cx_mgw_tech_exception | <p class="shorttext synchronized" lang="en">Technical Exception</p>
  methods CREATE_INLINE_INFO_DEEP_INSERT
    importing
      !IR_ENTITY_DATA type ref to DATA
    changing
      !CR_CHANGESET_DATA type ref to /IWBEP/IF_MGW_CORE_SRV_RUNTIME=>TY_S_CHANGESET_DATA
    raising
      /IWBEP/CX_MGW_BUSI_EXCEPTION
      /IWBEP/CX_MGW_TECH_EXCEPTION .
    "! <p class="shorttext synchronized" lang="en">Create Inline Info for ENTRY</p>
    "!
    "! @parameter io_expand_node      | <p class="shorttext synchronized" lang="en">OData Channel Expand Node</p>
    "! @parameter iv_expand_part      | <p class="shorttext synchronized" lang="en">Part of Expand String</p>
    "! @parameter iv_tech_expand_part | <p class="shorttext synchronized" lang="en">Part of Technical Expand String</p>
    "! @parameter ir_data             | <p class="shorttext synchronized" lang="en">Application Data</p>
    "! @parameter iv_entry_no         | <p class="shorttext synchronized" lang="en">Entry Number</p>
  methods CREATE_INLINE_INFO_ENTRY
    importing
      !IO_EXPAND_NODE type ref to /IWBEP/CL_MGW_EXPAND_NODE
      !IV_EXPAND_PART type STRING
      !IV_TECH_EXPAND_PART type STRING
      !IR_DATA type ref to DATA
      !IV_ENTRY_NO type I default 1
    changing
      !CT_INLINE_INFO type /IWBEP/IF_MGW_CORE_SRV_RUNTIME=>TY_T_INLINE_INFO .
    "! <p class="shorttext synchronized" lang="en">Create Inline Info for FEED</p>
    "!
    "! @parameter io_expand_node      | <p class="shorttext synchronized" lang="en">OData Channel Expand Node</p>
    "! @parameter iv_expand_part      | <p class="shorttext synchronized" lang="en">Part of Expand String</p>
    "! @parameter iv_tech_expand_part | <p class="shorttext synchronized" lang="en">Part of Technical Expand String</p>
    "! @parameter ir_data             | <p class="shorttext synchronized" lang="en">Application Data</p>
    "! @parameter iv_entry_no         | <p class="shorttext synchronized" lang="en">Entry Number</p>
    "! @parameter iv_from_entry       | <p class="shorttext synchronized" lang="en">XSD Truth Value: True/False [ext.]</p>
  methods CREATE_INLINE_INFO_FEED
    importing
      !IO_EXPAND_NODE type ref to /IWBEP/CL_MGW_EXPAND_NODE
      !IV_EXPAND_PART type STRING
      !IV_TECH_EXPAND_PART type STRING
      !IR_DATA type ref to DATA
      !IV_ENTRY_NO type I default 1
      !IV_FROM_ENTRY type XSDBOOLEAN default ABAP_FALSE
    changing
      !CT_INLINE_INFO type /IWBEP/IF_MGW_CORE_SRV_RUNTIME=>TY_T_INLINE_INFO .
  methods CREATE_INPUT_PARAM_CONVERTER
    importing
      !IV_ACTION_NAME type /IWBEP/IF_MGW_MED_ODATA_TYPES=>TY_E_MED_ENTITY_NAME
    changing
      !CS_REQUEST_CONTEXT type /IWBEP/IF_MGW_CORE_SRV_RUNTIME=>TY_S_MGW_REQUEST_CONTEXT
    raising
      /IWBEP/CX_MGW_BUSI_EXCEPTION
      /IWBEP/CX_MGW_TECH_EXCEPTION .
  methods CREATE_KEY_CONVERTERS
    changing
      !CS_REQUEST_CONTEXT type /IWBEP/IF_MGW_CORE_SRV_RUNTIME=>TY_S_MGW_REQUEST_CONTEXT
    raising
      /IWBEP/CX_MGW_BUSI_EXCEPTION
      /IWBEP/CX_MGW_TECH_EXCEPTION .
    "! <p class="shorttext synchronized" lang="en">Create operation-specific message container (merge main msg)</p>
    "!
    "! @parameter ro_msg_container | <p class="shorttext synchronized" lang="en">Message container</p>
  methods CREATE_MSG_CONTAINER_AND_MERGE
    returning
      value(RO_MSG_CONTAINER) type ref to /IWBEP/IF_MESSAGE_CONTAINER .
  methods CREATE_NAVI_KEY_CONVERTER
    changing
      !CS_REQUEST_CONTEXT type /IWBEP/IF_MGW_CORE_SRV_RUNTIME=>TY_S_MGW_REQUEST_CONTEXT
    raising
      /IWBEP/CX_MGW_BUSI_EXCEPTION
      /IWBEP/CX_MGW_TECH_EXCEPTION .
    "! <p class="shorttext synchronized" lang="en">Create placeholder info for request caching</p>
    "!
    "! @parameter io_request                   | <p class="shorttext synchronized" lang="en">Request information</p>
    "! @parameter cs_response_context          | <p class="shorttext synchronized" lang="en">Response information</p>
    "! @raising   /iwbep/cx_mgw_busi_exception | <p class="shorttext synchronized" lang="en">Business Exception</p>
    "! @raising   /iwbep/cx_mgw_tech_exception | <p class="shorttext synchronized" lang="en">Technical Exception</p>
  methods CREATE_PLACEHOLDER_INFO
    importing
      !IO_REQUEST type ref to /IWBEP/CL_MGW_REQUEST
    changing
      !CS_RESPONSE_CONTEXT type /IWBEP/IF_MGW_CORE_SRV_RUNTIME=>TY_S_MGW_RESPONSE_CONTEXT
    raising
      /IWBEP/CX_MGW_BUSI_EXCEPTION
      /IWBEP/CX_MGW_TECH_EXCEPTION .
  methods CREATE_REQUEST_OBJECT
    importing
      !IS_REQUEST_DETAILS type /IWBEP/IF_MGW_CORE_SRV_RUNTIME=>TY_S_MGW_REQUEST_CONTEXT
      !IT_HEADERS type TIHTTPNVP
    returning
      value(RO_REQUEST_OBJECT) type ref to /IWBEP/CL_MGW_REQUEST
    raising
      /IWBEP/CX_MGW_TECH_EXCEPTION .
  methods EXPAND_ENTITY
    importing
      !IO_EXPAND_NODE type ref to /IWBEP/CL_MGW_EXPAND_NODE
      !IV_SOURCE_ENTITY_TYPE type STRING
      !IV_TECH_SOURCE_ENTITY_TYPE type /IWBEP/MGW_TECH_NAME
      !IV_TECH_SOURCE_ENTITY_SET type /IWBEP/MGW_TECH_NAME
      !IS_ORIGINAL_REQUEST_DETAILS type /IWBEP/IF_MGW_CORE_SRV_RUNTIME=>TY_S_MGW_REQUEST_CONTEXT optional
      !IV_SUPPORTS_MOVE_CORR type ABAP_BOOL optional
    changing
      !CS_ENTITY type ANY
      !CS_RESPONSE_CONTEXT type /IWBEP/IF_MGW_CORE_SRV_RUNTIME=>TY_S_MGW_RESPONSE_CONTEXT optional
    raising
      /IWBEP/CX_MGW_BUSI_EXCEPTION
      /IWBEP/CX_MGW_TECH_EXCEPTION .
  methods GET_ENTITY_DESCRIPTOR
    importing
      !IS_REQUEST_DETAILS type /IWBEP/IF_MGW_CORE_SRV_RUNTIME=>TY_S_MGW_REQUEST_CONTEXT
      !IV_MULTIPLICITY type /IWBEP/IF_MGW_MED_ODATA_TYPES=>TY_E_MED_CARDINALITY
      !IV_EXPAND type STRING optional
      !IV_TECH_EXPAND type STRING optional
    returning
      value(RO_ENTITY_DESCRIPTOR) type ref to /IWBEP/CL_MGW_EXPAND_NODE
    raising
      /IWBEP/CX_MGW_MED_EXCEPTION .
    "! <p class="shorttext synchronized" lang="en">Core - Get the expand root and expand tree</p>
    "!
    "! @parameter eo_expand_tree               | <p class="shorttext synchronized" lang="en">OData Channel Expand Tree</p>
    "! @parameter eo_expand_root               | <p class="shorttext synchronized" lang="en">OData Channel Expand Node</p>
    "! @raising   /iwbep/cx_mgw_busi_exception | <p class="shorttext synchronized" lang="en">Business Exception</p>
    "! @raising   /iwbep/cx_mgw_tech_exception | <p class="shorttext synchronized" lang="en">Technical Exception</p>
  methods GET_EXPAND_OBJECTS
    importing
      !IS_REQUEST_DETAILS type /IWBEP/IF_MGW_CORE_SRV_RUNTIME=>TY_S_MGW_REQUEST_CONTEXT
      !IV_CARDINALITY type /IWBEP/IF_MGW_MED_ODATA_TYPES=>TY_E_MED_CARDINALITY
    exporting
      !EO_EXPAND_TREE type ref to /IWBEP/CL_MGW_EXPAND_TREE
      !EO_EXPAND_ROOT type ref to /IWBEP/CL_MGW_EXPAND_NODE
    raising
      /IWBEP/CX_MGW_BUSI_EXCEPTION
      /IWBEP/CX_MGW_TECH_EXCEPTION .
  methods GET_KEY_TAB
    importing
      !IO_EXPAND_NODE type ref to /IWBEP/CL_MGW_EXPAND_NODE
      !IS_DATA type ANY
    returning
      value(RT_KEY_TAB) type /IWBEP/IF_MGW_CORE_SRV_RUNTIME=>NVP_T
    raising
      /IWBEP/CX_MGW_TECH_EXCEPTION .
    "! <p class="shorttext synchronized" lang="en">gets metadata model</p>
    "!
    "! @parameter ro_model                    | <p class="shorttext synchronized" lang="en">interface for a script based model</p>
    "! @raising   /iwbep/cx_mgw_med_exception | <p class="shorttext synchronized" lang="en">Meta data exception</p>
  methods GET_MODEL
    returning
      value(RO_MODEL) type ref to /IWBEP/IF_MGW_ODATA_FW_MODEL
    raising
      /IWBEP/CX_MGW_MED_EXCEPTION .
  methods GET_TECH_KEY_TAB
    importing
      !IO_EXPAND_NODE type ref to /IWBEP/CL_MGW_EXPAND_NODE
      !IS_DATA type ANY
    returning
      value(RT_KEY_TAB) type /IWBEP/T_MGW_TECH_PAIRS
    raising
      /IWBEP/CX_MGW_TECH_EXCEPTION .
  methods MOVE_ENTITY_SET
    importing
      !IV_APPLY_CONVERSIONS type ABAP_BOOL optional
      !IO_EXPAND_ROOT type ref to /IWBEP/CL_MGW_EXPAND_NODE optional
      !IS_REQUEST_DETAILS type /IWBEP/IF_MGW_CORE_SRV_RUNTIME=>TY_S_MGW_REQUEST_CONTEXT optional
      !IT_SOURCE_TABLE type ANY TABLE optional
      !IV_SUPPORTS_MOVE_CORR type ABAP_BOOL optional
    changing
      !CT_TARGET_TABLE type ANY TABLE
    raising
      /IWBEP/CX_MGW_BUSI_EXCEPTION
      /IWBEP/CX_MGW_TECH_EXCEPTION .
    "! <p class="shorttext synchronized" lang="en">Post-process entity retrieval after application call</p>
    "!
    "! @parameter io_model                     | <p class="shorttext synchronized" lang="en">Model</p>
    "! @parameter io_expand_root               | <p class="shorttext synchronized" lang="en">Expand root object</p>
    "! @parameter io_request_obj               | <p class="shorttext synchronized" lang="en">Request object</p>
    "! @parameter it_header                    | <p class="shorttext synchronized" lang="en">Response headers</p>
    "! @parameter ct_header                    | <p class="shorttext synchronized" lang="en">Response headers</p>
    "! @parameter cr_entity                    | <p class="shorttext synchronized" lang="en">Entity data</p>
    "! @parameter cs_response_context          | <p class="shorttext synchronized" lang="en">Response context</p>
    "! @parameter ct_inline_info               | <p class="shorttext synchronized" lang="en">Inline info such as initial inline</p>
    "! @raising   /iwbep/cx_mgw_tech_exception | <p class="shorttext synchronized" lang="en">Technical Exception</p>
    "! @raising   /iwbep/cx_mgw_busi_exception | <p class="shorttext synchronized" lang="en">Business Exception</p>
  methods POST_PROCESS_READ_ENTITY
    importing
      !IO_MODEL type ref to /IWBEP/IF_MGW_ODATA_FW_MODEL
      !IO_EXPAND_ROOT type ref to /IWBEP/CL_MGW_EXPAND_NODE
      !IO_REQUEST_OBJ type ref to /IWBEP/CL_MGW_REQUEST
      !IT_HEADER type TIHTTPNVP
    changing
      !CT_HEADER type TIHTTPNVP
      !CR_ENTITY type ref to DATA
      !CS_RESPONSE_CONTEXT type /IWBEP/IF_MGW_CORE_SRV_RUNTIME=>TY_S_MGW_RESPONSE_ENTITY_CNTXT
      !CT_INLINE_INFO type /IWBEP/IF_MGW_CORE_SRV_RUNTIME=>TY_T_INLINE_INFO optional
    raising
      /IWBEP/CX_MGW_TECH_EXCEPTION
      /IWBEP/CX_MGW_BUSI_EXCEPTION .
    "! <p class="shorttext synchronized" lang="en">Post-process entity set retrieval after application call</p>
    "!
    "! @parameter io_model                     | <p class="shorttext synchronized" lang="en">Model</p>
    "! @parameter io_expand_root               | <p class="shorttext synchronized" lang="en">Expand root object</p>
    "! @parameter io_request_obj               | <p class="shorttext synchronized" lang="en">Request object</p>
    "! @parameter it_header                    | <p class="shorttext synchronized" lang="en">Response headers</p>
    "! @parameter cv_response_body             | <p class="shorttext synchronized" lang="en">Respone body - filled if IS_TARGET_FORMAT = true in r.contex</p>
    "! @parameter ct_header                    | <p class="shorttext synchronized" lang="en">Response headers</p>
    "! @parameter cr_entityset                 | <p class="shorttext synchronized" lang="en">Entities - filled if IS_TARGET_FORMAT = false in r.contex</p>
    "! @parameter cr_deleted_entityset         | <p class="shorttext synchronized" lang="en">Deleted entities (delta handling)</p>
    "! @parameter cs_response_context          | <p class="shorttext synchronized" lang="en">Response context</p>
    "! @parameter ct_inline_info               | <p class="shorttext synchronized" lang="en">Inline info such as initial inline</p>
    "! @raising   /iwbep/cx_mgw_tech_exception | <p class="shorttext synchronized" lang="en">Technical Exception</p>
    "! @raising   /iwbep/cx_mgw_busi_exception | <p class="shorttext synchronized" lang="en">Business Exception</p>
  methods POST_PROCESS_READ_ENTITYSET
    importing
      !IO_MODEL type ref to /IWBEP/IF_MGW_ODATA_FW_MODEL
      !IO_EXPAND_ROOT type ref to /IWBEP/CL_MGW_EXPAND_NODE
      !IO_REQUEST_OBJ type ref to /IWBEP/CL_MGW_REQUEST
      !IT_HEADER type TIHTTPNVP
    changing
      !CV_RESPONSE_BODY type XSTRING
      !CT_HEADER type TIHTTPNVP
      !CR_ENTITYSET type ref to DATA
      !CR_DELETED_ENTITYSET type ref to DATA
      !CS_RESPONSE_CONTEXT type /IWBEP/IF_MGW_CORE_SRV_RUNTIME=>TY_S_MGW_RESPONSE_CONTEXT
      !CT_INLINE_INFO type /IWBEP/IF_MGW_CORE_SRV_RUNTIME=>TY_T_INLINE_INFO optional
    raising
      /IWBEP/CX_MGW_TECH_EXCEPTION
      /IWBEP/CX_MGW_BUSI_EXCEPTION .
  methods PREPARE_CRP_HANDLING
    importing
      !IS_REQUEST_CONTEXT type /IWBEP/IF_MGW_CORE_SRV_RUNTIME=>TY_S_MGW_REQUEST_CONTEXT
      !IO_MODEL type ref to /IWBEP/IF_MGW_ODATA_FW_MODEL
      !IO_REQUEST type ref to /IWBEP/CL_MGW_REQUEST
    changing
      !CS_RESPONSE_CONTEXT type /IWBEP/IF_MGW_CORE_SRV_RUNTIME=>TY_S_MGW_RESPONSE_CONTEXT
      !CR_ENTITYSET type ref to DATA
    raising
      /IWBEP/CX_MGW_BUSI_EXCEPTION
      /IWBEP/CX_MGW_TECH_EXCEPTION .
  methods PRE_PROCESS_READ_ENTITYSET
    importing
      !IT_HEADER type TIHTTPNVP
    exporting
      !EO_REQUEST_OBJ type ref to /IWBEP/CL_MGW_REQUEST
      !EV_SEARCH_STRING type STRING
      !EV_FILTER_STRING type STRING
      !EV_EXPAND_STRING type STRING
      !EV_METHOD type SEOMTDNAME
      !EV_TECH_EXPAND_STRING type STRING
      !EO_EXPAND_ROOT type ref to /IWBEP/CL_MGW_EXPAND_NODE
      !EO_EXPAND_TREE type ref to /IWBEP/CL_MGW_EXPAND_TREE
    changing
      !CS_REQUEST_CONTEXT type /IWBEP/IF_MGW_CORE_SRV_RUNTIME=>TY_S_MGW_REQUEST_CONTEXT
    raising
      /IWBEP/CX_MGW_BUSI_EXCEPTION
      /IWBEP/CX_MGW_TECH_EXCEPTION .
    "! <p class="shorttext synchronized" lang="en">Core - Execute READ request (CReadUD) - ENTRY with inline -</p>
    "!
    "! @parameter iv_tech_entity_name          | <p class="shorttext synchronized" lang="en">Technical name</p>
    "! @parameter io_expand_node               | <p class="shorttext synchronized" lang="en">OData Channel Expand Node</p>
    "! @parameter iv_top_level_context         | <p class="shorttext synchronized" lang="en">Top level / Initial call of the method</p>
    "! @parameter iv_supports_move_corr        | <p class="shorttext synchronized" lang="en">Is move-corresponding supported</p>
    "! @raising   /iwbep/cx_mgw_busi_exception | <p class="shorttext synchronized" lang="en">business exception</p>
    "! @raising   /iwbep/cx_mgw_tech_exception | <p class="shorttext synchronized" lang="en">technical exception</p>
  methods READ_EXPANDED_ENTITY
    importing
      !IV_ENTITY_NAME type STRING
      !IV_TECH_ENTITY_NAME type /IWBEP/MGW_TECH_NAME
      !IV_SOURCE_NAME type STRING
      !IS_REQUEST_DETAILS type /IWBEP/IF_MGW_CORE_SRV_RUNTIME=>TY_S_MGW_REQUEST_CONTEXT
      !IO_EXPAND_NODE type ref to /IWBEP/CL_MGW_EXPAND_NODE
      !IO_TECH_REQUEST_CONTEXT type ref to /IWBEP/IF_MGW_REQ_ENTITY optional
      !IV_TOP_LEVEL_CONTEXT type ABAP_BOOL optional
      !IV_SUPPORTS_MOVE_CORR type ABAP_BOOL optional
    changing
      !CS_RESPONSE_CONTEXT type /IWBEP/IF_MGW_CORE_SRV_RUNTIME=>TY_S_MGW_RESPONSE_CONTEXT optional
      !CR_ENTITY type ref to DATA
    raising
      /IWBEP/CX_MGW_BUSI_EXCEPTION
      /IWBEP/CX_MGW_TECH_EXCEPTION .
    "! <p class="shorttext synchronized" lang="en">Core - Execute READ request (CReadUD) - FEED with inline -</p>
    "!
    "! @parameter iv_tech_entity_name          | <p class="shorttext synchronized" lang="en">Technical name</p>
    "! @parameter is_paging                    | <p class="shorttext synchronized" lang="en">paging structure</p>
    "! @parameter it_order                     | <p class="shorttext synchronized" lang="en">the sorting order</p>
    "! @parameter it_filter_select_options     | <p class="shorttext synchronized" lang="en">table of select options</p>
    "! @parameter io_expand_node               | <p class="shorttext synchronized" lang="en">OData Channel Expand Node</p>
    "! @parameter iv_top_level_context         | <p class="shorttext synchronized" lang="en">Top level / Initial call of the method</p>
    "! @parameter iv_supports_move_corr        | <p class="shorttext synchronized" lang="en">Is move-corresponding supported</p>
    "! @raising   /iwbep/cx_mgw_tech_exception | <p class="shorttext synchronized" lang="en">technical exception</p>
    "! @raising   /iwbep/cx_mgw_busi_exception | <p class="shorttext synchronized" lang="en">business exception</p>
  methods READ_EXPANDED_ENTITYSET
    importing
      !IV_ENTITY_NAME type STRING
      !IV_TECH_ENTITY_NAME type /IWBEP/MGW_TECH_NAME
      !IV_SOURCE_NAME type STRING
      !IS_PAGING type /IWBEP/S_MGW_PAGING
      !IT_ORDER type /IWBEP/T_MGW_SORTING_ORDER
      !IT_FILTER_SELECT_OPTIONS type /IWBEP/T_MGW_SELECT_OPTION
      !IS_REQUEST_DETAILS type /IWBEP/IF_MGW_CORE_SRV_RUNTIME=>TY_S_MGW_REQUEST_CONTEXT
      !IO_EXPAND_NODE type ref to /IWBEP/CL_MGW_EXPAND_NODE
      !IV_FILTER_STRING type STRING optional
      !IV_SEARCH_STRING type STRING optional
      !IO_TECH_REQUEST_CONTEXT type ref to /IWBEP/IF_MGW_REQ_ENTITYSET optional
      !IV_TOP_LEVEL_CONTEXT type ABAP_BOOL optional
      !IV_SUPPORTS_MOVE_CORR type ABAP_BOOL optional
    changing
      !CS_RESPONSE_CONTEXT type /IWBEP/IF_MGW_CORE_SRV_RUNTIME=>TY_S_MGW_RESPONSE_CONTEXT optional
      !CR_ENTITYSET type ref to DATA
    raising
      /IWBEP/CX_MGW_TECH_EXCEPTION
      /IWBEP/CX_MGW_BUSI_EXCEPTION .
    "! <p class="shorttext synchronized" lang="en">Choose response context for Expand in recursive call</p>
    "!
    "! @raising   /iwbep/cx_mgw_busi_exception | <p class="shorttext synchronized" lang="en">business exception</p>
    "! @raising   /iwbep/cx_mgw_tech_exception | <p class="shorttext synchronized" lang="en">technical exception</p>
  methods SELECT_EXPAND_RESPONSE_CONTEXT
    importing
      !IS_RESPONSE_CONTEXT_OLD type /IWBEP/IF_MGW_CORE_SRV_RUNTIME=>TY_S_MGW_RESPONSE_CONTEXT
    changing
      !CS_RESPONSE_CONTEXT type /IWBEP/IF_MGW_CORE_SRV_RUNTIME=>TY_S_MGW_RESPONSE_CONTEXT
    raising
      /IWBEP/CX_MGW_BUSI_EXCEPTION
      /IWBEP/CX_MGW_TECH_EXCEPTION .
*      !IV_EXPAND_STRING type STRING
*      !CS_RESPONSE_CONTEXT type /IWBEP/IF_MGW_CORE_SRV_RUNTIME=>TY_S_MGW_RESPONSE_CONTEXT
    "! <p class="shorttext synchronized" lang="en">Serialize entity set with transformation</p>
    "!
    "! @parameter is_request_details  | <p class="shorttext synchronized" lang="en">Request details</p>
    "! @parameter is_response_context | <p class="shorttext synchronized" lang="en">Repsonse context</p>
    "! @parameter iv_service_doc_name | <p class="shorttext synchronized" lang="en">Service document name</p>
    "! @parameter io_model            | <p class="shorttext synchronized" lang="en">Metadata model</p>
    "! @parameter io_request          | <p class="shorttext synchronized" lang="en">Request object</p>
    "! @parameter ev_successful_serialized     | <p class="shorttext synchronized" lang="en">Response was succeessful serialized?</p>
    "! @parameter cr_entityset                 | <p class="shorttext synchronized" lang="en">Entity set data</p>
    "! @parameter cv_response_body             | <p class="shorttext synchronized" lang="en">Response body</p>
  methods SERIALIZE_WITH_TRANSFORMATION
    importing
      !IS_REQUEST_DETAILS type /IWBEP/IF_MGW_CORE_SRV_RUNTIME=>TY_S_MGW_REQUEST_CONTEXT
      !IS_RESPONSE_CONTEXT type /IWBEP/IF_MGW_CORE_SRV_RUNTIME=>TY_S_MGW_RESPONSE_CONTEXT                                                                             "/IWBEP/IF_MGW_APPL_SRV_RUNTIME=>TY_S_MGW_RESPONSE_CONTEXT
      !IV_SERVICE_DOC_NAME type STRING
      !IO_MODEL type ref to /IWBEP/IF_MGW_ODATA_FW_MODEL
      !IO_REQUEST type ref to /IWBEP/IF_MGW_REQUEST
      !IV_EXPAND_STRING type STRING optional
      !IO_EXPAND_ROOT type ref to /IWBEP/CL_MGW_EXPAND_NODE optional
    exporting
      !EV_SUCCESSFUL_SERIALIZED type ABAP_BOOL
    changing
      !CR_ENTITYSET type ref to DATA
      !CV_RESPONSE_BODY type XSTRING optional
    raising
      /IWBEP/CX_MGW_BUSI_EXCEPTION
      /IWBEP/CX_MGW_TECH_EXCEPTION .
    "! <p class="shorttext synchronized" lang="en">sets the header table</p>
  methods SET_HEADERS
    changing
      !CT_HEADERS type TIHTTPNVP .
    "! <p class="shorttext synchronized" lang="en">Set flag SAP_DATA_EXISTS</p>
    "!
    "! @parameter it_expand | <p class="shorttext synchronized" lang="en">Expand String Table</p>
    "! @parameter cv_entity | <p class="shorttext synchronized" lang="en">Entity Data</p>
  methods SET_SAP_DATA_EXISTS
    importing
      !IT_EXPAND type STRING_TABLE
    changing
      !CV_ENTITY type ref to DATA .
    "! <p class="shorttext synchronized" lang="en">Create Inline Info for HUB</p>
    "!
    "! @parameter iv_expand_string   | <p class="shorttext synchronized" lang="en">Part of Expand String</p>
    "! @parameter iv_entity_set_name | <p class="shorttext synchronized" lang="en">Technical name</p>
  methods SORT_INLINE_INFO
    importing
      !IV_EXPAND_STRING type STRING
      !IV_ENTITY_SET_NAME type /IWBEP/MGW_TECH_NAME
    changing
      !CT_INLINE_INFO type /IWBEP/IF_MGW_CORE_SRV_RUNTIME=>TY_T_INLINE_INFO .
ENDCLASS.



CLASS /IWBEP/CL_MGW_ABS_DATA IMPLEMENTATION.


  METHOD /iwbep/if_mgw_appl_srv_runtime~batch_begin.

* Redefine this method if you want to create the complete batch response
* at the end of the batch processing for batch requests with read operations only

* Collect information during the data provider method calls for each
* operation in the batch request and prepare the complete response in method BATCH_END

    ev_deferred_response_creation = abap_false.

  ENDMETHOD.


  METHOD /iwbep/if_mgw_appl_srv_runtime~batch_end.

* Re-define this method if you want to use deferred batch response creation
* and provide the responses to each individual read operation in ET_BATCH_RESPONSE

    RETURN.

  ENDMETHOD.


  METHOD /iwbep/if_mgw_appl_srv_runtime~changeset_begin.

* Default Implementation:
*  - Local Update Task
*  - Only one operation in each changeset
*  - No deferred processing: Immediate process changset operation

    SET UPDATE TASK LOCAL.

    IF lines( it_operation_info ) > 1.
      RAISE EXCEPTION TYPE /iwbep/cx_mgw_tech_exception
        EXPORTING
          textid = /iwbep/cx_mgw_tech_exception=>changeset_default_violation
          method = gcs_methods-changeset_begin.
    ENDIF.

    CLEAR cv_defer_mode.

  ENDMETHOD.


  METHOD /iwbep/if_mgw_appl_srv_runtime~changeset_end.      "#EC NEEDED

  ENDMETHOD.


  METHOD /iwbep/if_mgw_appl_srv_runtime~changeset_process.

    RAISE EXCEPTION TYPE /iwbep/cx_mgw_tech_exception
      EXPORTING
        textid = /iwbep/cx_mgw_tech_exception=>method_not_implemented
        method = gcs_methods-changeset_process.

  ENDMETHOD.


  METHOD /iwbep/if_mgw_appl_srv_runtime~create_deep_entity.

    RAISE EXCEPTION TYPE /iwbep/cx_mgw_tech_exception
      EXPORTING
        textid = /iwbep/cx_mgw_tech_exception=>method_not_implemented
        method = gcs_methods-create_deep_entity.

  ENDMETHOD.


  METHOD /iwbep/if_mgw_appl_srv_runtime~create_entity.

    RAISE EXCEPTION TYPE /iwbep/cx_mgw_tech_exception
      EXPORTING
        textid = /iwbep/cx_mgw_tech_exception=>method_not_implemented
        method = gcs_methods-create_entity.

  ENDMETHOD.


  METHOD /iwbep/if_mgw_appl_srv_runtime~create_stream.

    RAISE EXCEPTION TYPE /iwbep/cx_mgw_tech_exception
      EXPORTING
        textid = /iwbep/cx_mgw_tech_exception=>method_not_implemented
        method = gcs_methods-create_stream.

  ENDMETHOD.


  METHOD /iwbep/if_mgw_appl_srv_runtime~delete_entity.

    RAISE EXCEPTION TYPE /iwbep/cx_mgw_tech_exception
      EXPORTING
        textid = /iwbep/cx_mgw_tech_exception=>method_not_implemented
        method = gcs_methods-delete_entity.


  ENDMETHOD.


  METHOD /iwbep/if_mgw_appl_srv_runtime~delete_stream.

    RAISE EXCEPTION TYPE /iwbep/cx_mgw_tech_exception
      EXPORTING
        textid = /iwbep/cx_mgw_tech_exception=>method_not_implemented
        method = gcs_methods-delete_stream.

  ENDMETHOD.


  METHOD /iwbep/if_mgw_appl_srv_runtime~execute_action.

    RAISE EXCEPTION TYPE /iwbep/cx_mgw_tech_exception
      EXPORTING
        textid = /iwbep/cx_mgw_tech_exception=>method_not_implemented
        method = gcs_methods-execute_action.


  ENDMETHOD.


  METHOD /iwbep/if_mgw_appl_srv_runtime~get_entity.

    RAISE EXCEPTION TYPE /iwbep/cx_mgw_tech_exception
      EXPORTING
        textid = /iwbep/cx_mgw_tech_exception=>method_not_implemented
        method = gcs_methods-get_entity.

  ENDMETHOD.


  METHOD /iwbep/if_mgw_appl_srv_runtime~get_entityset.

    RAISE EXCEPTION TYPE /iwbep/cx_mgw_tech_exception
      EXPORTING
        textid = /iwbep/cx_mgw_tech_exception=>method_not_implemented
        method = gcs_methods-get_entityset.


  ENDMETHOD.


  METHOD /iwbep/if_mgw_appl_srv_runtime~get_entityset_delta.

*-just for compatibility reasons - dispatching to get_entityset - should be overriden by anyone who wants to have proper delta support

    DATA: lv_perf_handle   TYPE i,
          lv_class_name    TYPE string,
          ls_parameter     TYPE /iwbep/s_mgw_name_value_pair,
          lv_search_string TYPE string,
          lv_filter_string TYPE string,
          ls_paging        TYPE /iwbep/s_mgw_paging.


    IF mo_sutil_runtime IS NOT BOUND.
      mo_sutil_runtime = /iwbep/cl_sutil_runtime=>get_instance( ).
    ENDIF.

    IF mv_provider_class IS INITIAL.
      lv_class_name = cl_abap_classdescr=>get_class_name( me ).
      SHIFT lv_class_name BY 7 PLACES.
      mv_provider_class = lv_class_name.
    ENDIF.

    READ TABLE mr_request_details->*-parameters
      WITH KEY name = gcs_parameters-filter
      INTO ls_parameter.

    IF sy-subrc EQ 0.
      lv_filter_string = ls_parameter-value.
    ENDIF.

    lv_search_string = io_tech_request_context->get_search_string( ).

    MOVE-CORRESPONDING mr_request_details->*-paging TO ls_paging.

    lv_perf_handle = mo_sutil_runtime->performance_start( ).

    me->/iwbep/if_mgw_appl_srv_runtime~get_entityset(
      EXPORTING
        iv_entity_name            = mr_request_details->*-target_entity
        iv_entity_set_name        = mr_request_details->*-target_entity_set
        iv_source_name            = mr_request_details->*-source_entity
        it_navigation_path        = mr_request_details->*-navigation_path
        is_paging                 = ls_paging
        it_order                  = mr_request_details->*-order
        it_filter_select_options  = mr_request_details->*-filter_select_options
        it_key_tab                = mr_request_details->*-key_tab
        iv_filter_string          = lv_filter_string
        iv_search_string          = lv_search_string
        io_tech_request_context   = io_tech_request_context
      IMPORTING
        er_entityset              = er_entityset
        es_response_context       = es_response_context
    ).

    mo_sutil_runtime->performance_stop( lv_perf_handle ).

  ENDMETHOD.


  METHOD /iwbep/if_mgw_appl_srv_runtime~get_expanded_entity.

    DATA: lv_perf_handle          TYPE i,
          lv_class_name           TYPE string,
          lo_request_context      TYPE REF TO /iwbep/cl_mgw_request,
          lo_tech_request_context TYPE REF TO /iwbep/if_mgw_req_entity,
          ls_request              TYPE /iwbep/if_mgw_core_srv_runtime=>ty_s_mgw_request_context,
          lr_request              TYPE REF TO	/iwbep/if_mgw_core_srv_runtime=>ty_s_mgw_request_context,
          lx_busi_exception       TYPE REF TO /iwbep/cx_mgw_busi_exception.

    FIELD-SYMBOLS:
        <ls_request>              TYPE /iwbep/if_mgw_core_srv_runtime=>ty_s_mgw_request_context.


    IF mo_sutil_runtime IS NOT BOUND.
      mo_sutil_runtime = /iwbep/cl_sutil_runtime=>get_instance( ).
    ENDIF.

    IF mv_provider_class IS INITIAL.
      lv_class_name = cl_abap_classdescr=>get_class_name( me ).
      SHIFT lv_class_name BY 7 PLACES.
      mv_provider_class = lv_class_name.
    ENDIF.

* For Generic Expand only: value of the IF-MODIFIED-SINCE will be suppressed
* in the backend to make sure that the application is forced to return data
* (Not needed for implemented expand)

    lo_request_context ?= io_tech_request_context.
    ls_request = lo_request_context->get_request_details( ).
    CLEAR ls_request-if_modified_since.

    ASSIGN ls_request TO <ls_request>.
    GET REFERENCE OF <ls_request> INTO lr_request.

    CREATE OBJECT lo_request_context
      EXPORTING
        ir_request_details = lr_request
        it_headers         = mt_headers
        io_model           = mo_model.

    lo_tech_request_context = lo_request_context.

    lv_perf_handle = mo_sutil_runtime->performance_start( ).

    me->/iwbep/if_mgw_appl_srv_runtime~get_entity(
      EXPORTING
        iv_entity_name            = iv_entity_name
        iv_entity_set_name        = iv_entity_set_name
        iv_source_name            = iv_source_name
        it_key_tab                = it_key_tab
        it_navigation_path        = it_navigation_path
        io_tech_request_context   = lo_tech_request_context
      IMPORTING
        er_entity                 = er_entity
        es_response_context       = es_response_context
    ).

    mo_sutil_runtime->performance_stop( lv_perf_handle ).

* For Generic Expand only: data must always be returned, so is_not_modified may not be set to TRUE
    IF es_response_context-is_not_modified EQ /iwbep/if_mgw_appl_types=>gcs_modification_status-is_not_modified.
      CREATE OBJECT lx_busi_exception
        TYPE
        /iwbep/cx_mgw_busi_exception
        EXPORTING
          textid      = /iwbep/cx_mgw_busi_exception=>is_not_modified_expand
          sap_note_id = gc_note_id_cache_control.
      RAISE EXCEPTION lx_busi_exception.
    ENDIF.

  ENDMETHOD.


  METHOD /iwbep/if_mgw_appl_srv_runtime~get_expanded_entityset.

    DATA: lv_perf_handle          TYPE i,
          lv_class_name           TYPE string,
          lo_request_context      TYPE REF TO /iwbep/cl_mgw_request,
          lo_tech_request_context TYPE REF TO /iwbep/if_mgw_req_entityset,
          ls_request              TYPE /iwbep/if_mgw_core_srv_runtime=>ty_s_mgw_request_context,
          lr_request              TYPE REF TO	/iwbep/if_mgw_core_srv_runtime=>ty_s_mgw_request_context,
          lx_busi_exception       TYPE REF TO /iwbep/cx_mgw_busi_exception.

    FIELD-SYMBOLS:
        <ls_request>            TYPE /iwbep/if_mgw_core_srv_runtime=>ty_s_mgw_request_context.


    IF mo_sutil_runtime IS NOT BOUND.
      mo_sutil_runtime = /iwbep/cl_sutil_runtime=>get_instance( ).
    ENDIF.

    IF mv_provider_class IS INITIAL.
      lv_class_name = cl_abap_classdescr=>get_class_name( me ).
      SHIFT lv_class_name BY 7 PLACES.
      mv_provider_class = lv_class_name.
    ENDIF.

* For Generic Expand only: value of the IF-MODIFIED-SINCE will be suppressed
* in the backend to make sure that the application is forced to return data
* (Not needed for implemented expand)

    lo_request_context ?= io_tech_request_context.
    ls_request = lo_request_context->get_request_details( ).
    CLEAR ls_request-if_modified_since.

    ASSIGN ls_request TO <ls_request>.
    GET REFERENCE OF <ls_request> INTO lr_request.

    CREATE OBJECT lo_request_context
      EXPORTING
        ir_request_details = lr_request
        it_headers         = mt_headers
        io_model           = mo_model.

    lo_tech_request_context = lo_request_context.

    lv_perf_handle = mo_sutil_runtime->performance_start( ).

    me->/iwbep/if_mgw_appl_srv_runtime~get_entityset(
      EXPORTING
        iv_entity_name            = iv_entity_name
        iv_entity_set_name        = iv_entity_set_name
        iv_source_name            = iv_source_name
        it_navigation_path        = it_navigation_path
        is_paging                 = is_paging
        it_order                  = it_order
        it_filter_select_options  = it_filter_select_options
        it_key_tab                = it_key_tab
        iv_filter_string          = iv_filter_string
        iv_search_string          = iv_search_string
        io_tech_request_context   = lo_tech_request_context
      IMPORTING
        er_entityset              = er_entityset
        es_response_context       = es_response_context
    ).

    mo_sutil_runtime->performance_stop( lv_perf_handle ).

* For Generic Expand only: data must always be returned, so is_not_modified  may not be set to TRUE
    IF es_response_context-is_not_modified EQ /iwbep/if_mgw_appl_types=>gcs_modification_status-is_not_modified.
      CREATE OBJECT lx_busi_exception
        TYPE
        /iwbep/cx_mgw_busi_exception
        EXPORTING
          textid      = /iwbep/cx_mgw_busi_exception=>is_not_modified_expand
          sap_note_id = gc_note_id_cache_control.
      RAISE EXCEPTION lx_busi_exception.
    ENDIF.

* Add skiptoken to current expand if Framework Expand
    IF es_response_context-skiptoken IS NOT INITIAL.
      APPEND es_response_context-skiptoken TO es_response_context-expand_skiptokens.
    ENDIF.

  ENDMETHOD.


  METHOD /iwbep/if_mgw_appl_srv_runtime~get_is_conditional_implemented.

    rv_conditional_active = abap_false.

  ENDMETHOD.


  METHOD /iwbep/if_mgw_appl_srv_runtime~get_is_condi_imple_for_action.

    rv_conditional_active = abap_false.

*    Important to note:
*    The framework does not do a generic conditional handling (requests with http header if-match)
*    for function imports / actions.

  ENDMETHOD.


  METHOD /iwbep/if_mgw_appl_srv_runtime~get_stream.

    RAISE EXCEPTION TYPE /iwbep/cx_mgw_tech_exception
      EXPORTING
        textid = /iwbep/cx_mgw_tech_exception=>method_not_implemented
        method = gcs_methods-get_stream.

  ENDMETHOD.


  METHOD /iwbep/if_mgw_appl_srv_runtime~patch_entity.
*-semantics of PATCH
*-a patch request is a partial update of an entity. All provided components are patched.
*-The default implementation of patch_entity performs a read before update without locking
*-the corresponding business object. if this is required the default implementation can be used
*-but the patch_entity method needs to be overwritten and after an enqueue the default implementation
*-can be called. after that the business object has to be dequeued.
*-All unpatched simple properties of the entity type are copied during the read before update. complex
*-properties are copied recursively incl. nested complex properties.

*-A SAMPLE IMPLEMENTATION for the lock semantics IS PROVIDED in the last SECTION!!!!

    DATA:  lr_entity         TYPE REF TO data
          ,lr_patched_entity TYPE REF TO data
          ,lo_request_entity TYPE REF TO /iwbep/if_mgw_req_entity
          ,lt_components     TYPE        /iwbep/if_mgw_appl_types=>ty_t_components
          ,lr_components     TYPE REF TO /iwbep/if_mgw_appl_types=>ty_t_components
          ,lo_entry_provider TYPE REF TO /iwbep/if_mgw_entry_provider
          .

    FIELD-SYMBOLS:  <ls_entity>         TYPE any
                   ,<ls_patched_entity> TYPE any
                   .

    lo_request_entity ?= io_tech_request_context.

    me->/iwbep/if_mgw_appl_srv_runtime~get_entity(
      EXPORTING
        iv_entity_name            = iv_entity_name
        iv_entity_set_name        = iv_entity_set_name
        iv_source_name            = iv_source_name
        it_key_tab                = it_key_tab
        it_navigation_path        = it_navigation_path
        io_tech_request_context   = lo_request_entity
      IMPORTING
        er_entity                 = lr_entity
    ).

    IF lr_entity IS NOT BOUND.

      RAISE EXCEPTION TYPE /iwbep/cx_mgw_busi_exception
        EXPORTING
          textid           = /iwbep/cx_mgw_busi_exception=>resource_not_found
          entity_type      = io_tech_request_context->get_entity_type_name( )
          http_status_code = /iwbep/cx_mgw_busi_exception=>gcs_http_status_codes-not_found.

    ENDIF.

*-prepare data structure for patched entity
    ASSIGN lr_entity->* TO <ls_entity>.

*-create structure for patched entity deserialization
    CREATE DATA lr_patched_entity LIKE <ls_entity>.

*-assign patched entity
    ASSIGN lr_patched_entity->* TO <ls_patched_entity>.

    /iwbep/cl_mgw_data_conv_util=>set_model( EXPORTING io_model =  mo_model ).

*-deserialize entry
    io_data_provider->read_entry_data(
      IMPORTING
        es_data = <ls_patched_entity>
    ).

*-merge the data - read before update + merge of provided data
    lt_components = io_tech_request_context->get_components( ).
    GET REFERENCE OF lt_components INTO lr_components.
    /iwbep/cl_mgw_data_conv_util=>copy_data_structure(
      EXPORTING
        ir_components       = lr_components
        is_source_structure = <ls_entity>
      CHANGING
        cs_target_structure = <ls_patched_entity>
    ).

*-todo double check whether it is necessary or not as lr_entity already points to ls_entity?
    GET REFERENCE OF <ls_patched_entity> INTO lr_entity.

    CREATE OBJECT lo_entry_provider
      TYPE
      /iwbep/cl_mgw_entry_patch_prv
      EXPORTING
        ir_data       = lr_entity
        it_components = lt_components.

*-perform the update
    me->/iwbep/if_mgw_appl_srv_runtime~update_entity(
      EXPORTING
        iv_entity_name          = iv_entity_name
        iv_entity_set_name      = iv_entity_set_name
        iv_source_name          = iv_source_name
        io_data_provider        = lo_entry_provider    " MGW Data Provider
        it_key_tab              = it_key_tab
        it_navigation_path      = it_navigation_path
        io_tech_request_context = io_tech_request_context
      IMPORTING
        er_entity               = er_entity
    ).

*-Proposal for implementation with lock semantics - overwrite default implementation of patch entity
*
*  DATA:  lx_tech_exception TYPE REF TO /iwbep/cx_mgw_tech_exception
*        ,lx_busi_exception TYPE REF TO /iwbep/cx_mgw_busi_exception
*        .
*
**-call enqueue based on the values given in it_key_tab
*  TRY.
*      super->/iwbep/if_mgw_appl_srv_runtime~patch_entity(
*        EXPORTING
*          iv_entity_name          = iv_entity_name
*          iv_entity_set_name      = iv_entity_set_name
*          iv_source_name          = iv_source_name
*          io_data_provider        = io_data_provider    " MGW Data Provider
*          it_key_tab              = it_key_tab
*          it_navigation_path      = it_navigation_path
*          io_tech_request_context = io_tech_request_context
*        IMPORTING
*          er_entity               = er_entity
*      ).
*    CATCH /iwbep/cx_mgw_busi_exception INTO lx_busi_exception.
*      RAISE EXCEPTION lx_busi_exception.
*    CATCH /iwbep/cx_mgw_tech_exception INTO lx_tech_exception.
*      RAISE EXCEPTION lx_tech_exception.
*    CLEANUP.
**-----call dequeue based on the values given in it_key_tab
*  ENDTRY.

  ENDMETHOD.


  METHOD /iwbep/if_mgw_appl_srv_runtime~update_entity.

    RAISE EXCEPTION TYPE /iwbep/cx_mgw_tech_exception
      EXPORTING
        textid = /iwbep/cx_mgw_tech_exception=>method_not_implemented
        method = gcs_methods-update_entity.


  ENDMETHOD.


  METHOD /iwbep/if_mgw_appl_srv_runtime~update_stream.

    RAISE EXCEPTION TYPE /iwbep/cx_mgw_tech_exception
      EXPORTING
        textid = /iwbep/cx_mgw_tech_exception=>method_not_implemented
        method = gcs_methods-update_stream.

  ENDMETHOD.


  METHOD /iwbep/if_mgw_conv_srv_runtime~check_if_is_not_modified.

    DATA:
        lv_current_time TYPE tzntstmps.

* Checks if data was not modified based on:
* 1. if-modified-since http request header
* 2. last-modified date provided by the application

*  In case last-modified is older than if-modified-since then the data is up to date
*  In this case returning parameter rv_is_not_modified is set to 'X'
*  (/iwbep/if_mgw_appl_types=>gcs_modification_status-is_not_modified)
*  This method can be used to fill es_response_context-is_not_modified
*  In case es_response_context-is_not_modified is set to 'X'
*  (/iwbep/if_mgw_appl_types=>gcs_modification_status-is_not_modified)
*  then an http response 304 ‚Not Modified‘ shall be sent

    IF iv_if_modified_since IS NOT INITIAL AND
       iv_last_modified IS NOT INITIAL.
      GET TIME STAMP FIELD lv_current_time.
      IF iv_if_modified_since BETWEEN iv_last_modified AND lv_current_time.
        rv_is_not_modified = /iwbep/if_mgw_appl_types=>gcs_modification_status-is_not_modified.
      ELSE.
        rv_is_not_modified = /iwbep/if_mgw_appl_types=>gcs_modification_status-is_modified.
      ENDIF.
    ELSE.
      rv_is_not_modified = /iwbep/if_mgw_appl_types=>gcs_modification_status-is_modified.
    ENDIF.

  ENDMETHOD.


  METHOD /iwbep/if_mgw_conv_srv_runtime~copy_data_to_ref.

    FIELD-SYMBOLS:
                   <ls_data> TYPE any.

    CREATE DATA cr_data LIKE is_data.
    ASSIGN cr_data->* TO <ls_data>.
    <ls_data> = is_data.

  ENDMETHOD.


  METHOD /iwbep/if_mgw_conv_srv_runtime~get_dp_facade.

    DATA: lo_model TYPE REF TO /iwbep/if_mgw_odata_fw_model.

    IF mo_facade IS NOT BOUND.
      lo_model = get_model( ).
      CREATE OBJECT mo_facade
        EXPORTING
          io_model   = lo_model
          ir_request = mr_request_details
          io_context = mo_context.
    ENDIF.

    ro_dp_facade = mo_facade.

  ENDMETHOD.


  METHOD /iwbep/if_mgw_conv_srv_runtime~get_logger.

*-no need to access it via context as logger is anyway implemented as singleton
    ro_logger = /iwbep/cl_cos_logger=>get_logger( ).

  ENDMETHOD.


  METHOD /iwbep/if_mgw_conv_srv_runtime~get_message_container.

    mo_context->get_parameter(
      EXPORTING
        iv_name  = /iwbep/if_mgw_context=>gc_param_msg_container
      IMPORTING
        ev_value = ro_message_container
    ).

  ENDMETHOD.


  METHOD /iwbep/if_mgw_conv_srv_runtime~get_response_util.

    "empty alias in test environments (unit tests etc.)
    DATA lv_system_alias TYPE /iwbep/defi_system_alias.     "#EC NEEDED

    IF mr_request_details IS BOUND.
      CREATE OBJECT ro_response_util TYPE /iwbep/cl_mgw_response_util
        EXPORTING
          io_model        = mo_model
          iv_system_alias = mr_request_details->system_alias_info-system_alias.
    ELSE.
      CREATE OBJECT ro_response_util TYPE /iwbep/cl_mgw_response_util
        EXPORTING
          io_model        = mo_model
          iv_system_alias = lv_system_alias.
    ENDIF.

  ENDMETHOD.


  METHOD /iwbep/if_mgw_conv_srv_runtime~get_soft_state_info.

    rs_soft_state_info = ms_soft_state_info.

  ENDMETHOD.


  METHOD /iwbep/if_mgw_conv_srv_runtime~init_dp_for_unit_test.

    DATA: lr_request_context  TYPE REF TO /iwbep/cl_mgw_request_unittst=>ty_s_mgw_request_context_unit.
    DATA: lt_headers          TYPE        tihttpnvp.
    DATA: lo_context          TYPE REF TO /iwbep/if_mgw_context.
    DATA: lo_logger           TYPE REF TO /iwbep/cl_cos_logger.
    DATA: lo_msg_container    TYPE REF TO /iwbep/if_message_container.
    DATA: lo_msg_container_fw TYPE REF TO /iwbep/cl_mgw_msg_container.



    ASSERT me->mr_request_details IS INITIAL.

    GET REFERENCE OF is_request_context INTO lr_request_context.
    CREATE OBJECT ro_request_context
      EXPORTING
        it_headers = lt_headers.

    ro_request_context->set_request_context( ir_request_context = lr_request_context ).

    lo_logger = /iwbep/cl_cos_logger=>get_logger( ).
    lo_msg_container = /iwbep/cl_mgw_msg_container=>get_mgw_msg_container( ).
    TRY.
        lo_msg_container_fw ?= lo_msg_container.
        lo_msg_container_fw->reset( ).
      CATCH cx_sy_move_cast_error.                      "#EC NO_HANDLER
    ENDTRY.


    CREATE OBJECT lo_context
      TYPE
      /iwbep/cl_mgw_context.

    lo_context->set_parameter(
      EXPORTING
        iv_name  = /iwbep/if_mgw_context=>gc_param_msg_container
        iv_value = lo_msg_container
      ).

    lo_context->set_parameter(
      EXPORTING
        iv_name  = /iwbep/if_mgw_context=>gc_param_logger
        iv_value = lo_logger
      ).

    mo_context = lo_context.

  ENDMETHOD.


  METHOD /iwbep/if_mgw_conv_srv_runtime~move_corresponding.

    DATA: lr_source_data TYPE REF TO data,
          lr_target_data TYPE REF TO data.                  "#EC NEEDED

*** [ This comment need to be taken account only for CORE RUNTIME, not for APPLICATION PROVIDER:
***   In case non-converted data is expected and is to be returned to ODtata Library immediately without
***   further conversion or ID transformation, then the parameter IV_SUPPORTS_MOVE_CORR should be set to ABAP_FALSE ]

    IF go_rt_utility_750 IS BOUND AND
       iv_supports_move_corr EQ abap_true.
      go_rt_utility_750->move_corresponding(
                          EXPORTING
                            ia_source_data = id_source_data
                          IMPORTING
                            ea_target_data = ed_target_data ).
    ELSE.
      GET REFERENCE OF id_source_data INTO lr_source_data.
      GET REFERENCE OF ed_target_data INTO lr_target_data.

      /iwbep/cl_mgw_data_helper=>move_corresponding(
       EXPORTING
         ir_source_data = lr_source_data
       IMPORTING
         er_target_data = lr_target_data ).
    ENDIF.

  ENDMETHOD.


  METHOD /iwbep/if_mgw_conv_srv_runtime~set_etag.

    DATA ls_header TYPE ihttpnvp.

    ls_header-name = 'ETag'.
    ls_header-value = iv_value.
    set_header( ls_header ).

  ENDMETHOD.


  METHOD /iwbep/if_mgw_conv_srv_runtime~set_header.

    IF mv_changeset_defer_mode = abap_false.
      INSERT is_header INTO TABLE mt_headers.
    ELSE.
      mv_changeset_func_not_allowed = abap_true.
    ENDIF.

  ENDMETHOD.


  METHOD /iwbep/if_mgw_conv_srv_runtime~soft_state_session_end.

    IF ms_soft_state_info-enabled = abap_false.
      RAISE EXCEPTION TYPE /iwbep/cx_mgw_tech_exception
        EXPORTING
          textid           = /iwbep/cx_mgw_tech_exception=>soft_state_not_enabled
          http_status_code = /iwbep/cx_mgw_tech_exception=>gcs_http_status_codes-not_implemented.
    ENDIF.

    IF ms_soft_state_info-mode <> /iwbep/if_mgw_core_types=>gcs_soft_state_mode-delayed.
      RAISE EXCEPTION TYPE /iwbep/cx_mgw_tech_exception
        EXPORTING
          textid           = /iwbep/cx_mgw_tech_exception=>soft_state_delay_invocation
          http_status_code = /iwbep/cx_mgw_tech_exception=>gcs_http_status_codes-not_implemented.
    ENDIF.

    mv_soft_state_session_end = abap_true.

  ENDMETHOD.


  METHOD /iwbep/if_mgw_conv_srv_runtime~soft_state_session_start.

    IF ms_soft_state_info-enabled = abap_false.
      RAISE EXCEPTION TYPE /iwbep/cx_mgw_tech_exception
        EXPORTING
          textid           = /iwbep/cx_mgw_tech_exception=>soft_state_not_enabled
          http_status_code = /iwbep/cx_mgw_tech_exception=>gcs_http_status_codes-not_implemented.
    ENDIF.

    IF ms_soft_state_info-mode <> /iwbep/if_mgw_core_types=>gcs_soft_state_mode-delayed.
      RAISE EXCEPTION TYPE /iwbep/cx_mgw_tech_exception
        EXPORTING
          textid           = /iwbep/cx_mgw_tech_exception=>soft_state_delay_invocation
          http_status_code = /iwbep/cx_mgw_tech_exception=>gcs_http_status_codes-not_implemented.
    ENDIF.

    mv_soft_state_session_start = abap_true.

  ENDMETHOD.


  METHOD /iwbep/if_mgw_core_srv_runtime~batch_begin.

    CONSTANTS:
      lc_method_name TYPE seomtdname VALUE '/IWBEP/IF_MGW_APPL_SRV_RUNTIME~BATCH_BEGIN'.

    DATA:
      lv_time_start TYPE i,
      lv_time_stop  TYPE i.

    FIELD-SYMBOLS:
      <ls_operation_info> TYPE /iwbep/s_mgw_operation_info.

    IF mo_sutil_runtime IS NOT BOUND.
      mo_sutil_runtime = /iwbep/cl_sutil_runtime=>get_instance( ).
    ENDIF.

    " restrict deferred processing to read requests only
    " the local and remote handler implementation relies on that
    mv_batch_deferred_resp_crea = abap_false.
    LOOP AT it_operation_info ASSIGNING <ls_operation_info>
      WHERE operation_type NE /iwbep/if_mgw_appl_types=>gcs_operation_type-get_entity AND
            operation_type NE /iwbep/if_mgw_appl_types=>gcs_operation_type-get_entityset AND
            operation_type NE /iwbep/if_mgw_appl_types=>gcs_operation_type-expand_entity AND
            operation_type NE /iwbep/if_mgw_appl_types=>gcs_operation_type-expand_entityset AND
            operation_type NE /iwbep/if_mgw_appl_types=>gcs_operation_type-get_entityset_delta.
      EXIT.
    ENDLOOP.
    IF sy-subrc EQ 0.
      " do not delegate to application
      cv_deferred_response_creation = abap_false.
      RETURN.
    ELSE.

      lv_time_start = mo_sutil_runtime->performance_start(
        iv_class_name  = mv_provider_class
        iv_method_name = lc_method_name ).
      IF lv_time_start IS INITIAL.
        GET RUN TIME FIELD lv_time_start.
      ENDIF.

      /iwbep/if_mgw_appl_srv_runtime~batch_begin(
        EXPORTING
          it_operation_info             =  it_operation_info
        IMPORTING
          ev_deferred_response_creation = cv_deferred_response_creation ).

      lv_time_stop = mo_sutil_runtime->performance_stop( lv_time_start ).
      IF lv_time_stop IS INITIAL.
        GET RUN TIME FIELD lv_time_stop.
      ENDIF.

      add_performance_data(
        iv_method     = lc_method_name
        iv_time_start = lv_time_start
        iv_time_stop  = lv_time_stop ).

      IF cv_deferred_response_creation EQ abap_true.
        mv_batch_deferred_resp_crea = abap_true.
      ENDIF.
    ENDIF.

  ENDMETHOD.


  METHOD /iwbep/if_mgw_core_srv_runtime~batch_end.

    " this method is implemented to handle the equivalents to READ_ENTITY and
    " READ_ENTITYSET, that is, only read operations are supported - please refer
    " to the batch_begin method

    CONSTANTS:
      lc_method_name TYPE seomtdname VALUE '/IWBEP/IF_MGW_APPL_SRV_RUNTIME~BATCH_END'.

    DATA:
      ls_appl_batch_response         TYPE /iwbep/if_mgw_appl_types=>ty_s_batch_response,
      lt_appl_batch_response         TYPE /iwbep/if_mgw_appl_types=>ty_t_batch_response,
      ls_batch_response              TYPE /iwbep/if_mgw_core_srv_runtime=>ty_s_batch_response,
      lt_batch_response              TYPE /iwbep/if_mgw_core_srv_runtime=>ty_t_batch_response,
      ls_entity_response_context     TYPE /iwbep/if_mgw_core_srv_runtime=>ty_s_mgw_response_entity_cntxt,
      ls_entity_set_response_context TYPE /iwbep/if_mgw_core_srv_runtime=>ty_s_mgw_response_context,
      lv_time_start                  TYPE i,
      lv_time_stop                   TYPE i,
      lo_msg_container               TYPE REF TO /iwbep/cl_mgw_msg_container,
      lx_exception                   TYPE REF TO /iwbep/cx_mgw_base_exception.

    FIELD-SYMBOLS:
      <ls_appl_batch_response> TYPE /iwbep/if_mgw_appl_types=>ty_s_batch_response,
      <ls_operation_buffer>    TYPE ty_s_batch_operation_buffer.

    IF mv_batch_deferred_resp_crea EQ abap_false.
      RETURN.
    ENDIF.

    IF mo_sutil_runtime IS NOT BOUND.
      mo_sutil_runtime = /iwbep/cl_sutil_runtime=>get_instance( ).
    ENDIF.

    LOOP AT mt_batch_operation_buffer ASSIGNING <ls_operation_buffer>.
      CLEAR ls_appl_batch_response.
      ls_appl_batch_response-operation_id = <ls_operation_buffer>-operation_id.
      ls_appl_batch_response-msg_container = <ls_operation_buffer>-msg_container.
      INSERT ls_appl_batch_response INTO TABLE lt_appl_batch_response.
    ENDLOOP.

    " reset singleton message container
    lo_msg_container ?= /iwbep/cl_mgw_msg_container=>get_mgw_msg_container( ).
    lo_msg_container->reset( ).

    lv_time_start = mo_sutil_runtime->performance_start(
      iv_class_name  = mv_provider_class
      iv_method_name = lc_method_name ).
    IF lv_time_start IS INITIAL.
      GET RUN TIME FIELD lv_time_start.
    ENDIF.

    /iwbep/if_mgw_appl_srv_runtime~batch_end(
      CHANGING
        ct_batch_response = lt_appl_batch_response ).

    lv_time_stop = mo_sutil_runtime->performance_stop( lv_time_start ).
    IF lv_time_stop IS INITIAL.
      GET RUN TIME FIELD lv_time_stop.
    ENDIF.

    add_performance_data(
      iv_method     = lc_method_name
      iv_time_start = lv_time_start
      iv_time_stop  = lv_time_stop ).


    LOOP AT lt_appl_batch_response ASSIGNING <ls_appl_batch_response>.

      READ TABLE mt_batch_operation_buffer ASSIGNING <ls_operation_buffer>
        WITH TABLE KEY operation_id = <ls_appl_batch_response>-operation_id.
      IF sy-subrc EQ 0.

        CLEAR ls_batch_response.
        ls_batch_response-operation_id = <ls_appl_batch_response>-operation_id.
        /iwbep/cl_mgw_handler_util=>fill_inner_error_for_header(
          EXPORTING
            iv_system_alias  = <ls_operation_buffer>-request_obj->get_request_details( )-system_alias_info-system_alias
            io_msg_container = <ls_appl_batch_response>-msg_container
          CHANGING
            cs_msg_canister = ls_batch_response-msg_container ).


        IF NOT <ls_appl_batch_response>-exception IS INITIAL.

          ls_batch_response-exception = <ls_appl_batch_response>-exception.

        ELSE.

          ls_batch_response-response_data = <ls_appl_batch_response>-response_data.

          TRY.
              CASE <ls_operation_buffer>-operation_type.
                WHEN /iwbep/if_mgw_appl_types=>gcs_operation_type-get_entity OR
                     /iwbep/if_mgw_appl_types=>gcs_operation_type-expand_entity.

                  ls_entity_response_context-appl_response_context = <ls_appl_batch_response>-entity_response_context.
                  ls_batch_response-expand_skiptokens = <ls_appl_batch_response>-expand_skiptokens.

                  post_process_read_entity(
                    EXPORTING
                      io_model                     = <ls_operation_buffer>-model
                      io_expand_root               = <ls_operation_buffer>-expand_root
                      io_request_obj               = <ls_operation_buffer>-request_obj
                      it_header                    = <ls_appl_batch_response>-headers
                    CHANGING
                      ct_header                    = ls_batch_response-headers
                      cr_entity                    = ls_batch_response-response_data
                      cs_response_context          = ls_entity_response_context ).

                  MOVE-CORRESPONDING ls_entity_response_context TO ls_batch_response-entity_response_context.

                WHEN /iwbep/if_mgw_appl_types=>gcs_operation_type-get_entityset OR
                     /iwbep/if_mgw_appl_types=>gcs_operation_type-get_entityset_delta OR
                     /iwbep/if_mgw_appl_types=>gcs_operation_type-expand_entityset.

                  ls_batch_response-response_data_deleted = <ls_appl_batch_response>-response_data_deleted.
                  ls_entity_set_response_context-appl_response_context = <ls_appl_batch_response>-entity_set_response_context.

                  post_process_read_entityset(
                    EXPORTING
                      io_model                     = <ls_operation_buffer>-model
                      io_expand_root               = <ls_operation_buffer>-expand_root
                      io_request_obj               = <ls_operation_buffer>-request_obj
                      it_header                    = <ls_appl_batch_response>-headers
                    CHANGING
                      cv_response_body             = ls_batch_response-response_data_serialized
                      ct_header                    = ls_batch_response-headers
                      cr_entityset                 = ls_batch_response-response_data
                      cr_deleted_entityset         = ls_batch_response-response_data_deleted
                      cs_response_context          = ls_entity_set_response_context ).

                  MOVE-CORRESPONDING ls_entity_set_response_context TO ls_batch_response-entity_set_response_context.

                WHEN OTHERS.
                  ASSERT 1 EQ 2.
              ENDCASE.
            CATCH /iwbep/cx_mgw_tech_exception /iwbep/cx_mgw_busi_exception INTO lx_exception.

              CLEAR ls_batch_response-response_data.
              CLEAR ls_batch_response-response_data_deleted.
              CLEAR ls_batch_response-entity_response_context.
              CLEAR ls_batch_response-entity_set_response_context.
              CLEAR ls_batch_response-expand_skiptokens.

              ls_batch_response-exception = lx_exception.

          ENDTRY.

        ENDIF.

        INSERT ls_batch_response INTO TABLE lt_batch_response.
        DELETE TABLE mt_batch_operation_buffer FROM <ls_operation_buffer>.

      ELSE.

        RAISE EXCEPTION TYPE /iwbep/cx_mgw_btc_exception
          EXPORTING
            textid       = /iwbep/cx_mgw_btc_exception=>batch_operation_id_not_found
            operation_id = <ls_appl_batch_response>-operation_id.

      ENDIF.

    ENDLOOP.

    IF NOT mt_batch_operation_buffer IS INITIAL.
      RAISE EXCEPTION TYPE /iwbep/cx_mgw_btc_exception
        EXPORTING
          textid = /iwbep/cx_mgw_btc_exception=>batch_response_incomplete.
    ENDIF.

    INSERT LINES OF lt_batch_response INTO TABLE ct_batch_response.

  ENDMETHOD.


  METHOD /iwbep/if_mgw_core_srv_runtime~changeset_begin.

    DATA: lv_time_start       TYPE i,
          lv_time_stop        TYPE i,
          lv_class_name       TYPE string,
          lv_operation_type	  TYPE /iwbep/mgw_operation_type,
          ls_operation_info   TYPE /iwbep/s_mgw_operation_info,
          ls_changeset_input  TYPE /iwbep/if_mgw_core_srv_runtime=>ty_s_batch_request,
          lv_cond_hndl_active TYPE abap_bool.


    mv_changeset = abap_true.

    IF mo_sutil_runtime IS NOT BOUND.
      mo_sutil_runtime = /iwbep/cl_sutil_runtime=>get_instance( ).
    ENDIF.

    IF mv_provider_class IS INITIAL.
      lv_class_name = cl_abap_classdescr=>get_class_name( me ).
      SHIFT lv_class_name BY 7 PLACES.
      mv_provider_class = lv_class_name.
    ENDIF.

    lv_time_start = mo_sutil_runtime->performance_start(
                      iv_class_name  = mv_provider_class
                      iv_method_name = '/IWBEP/IF_MGW_APPL_SRV_RUNTIME~CHANGESET_BEGIN'
                    ).
    IF lv_time_start IS INITIAL.
      GET RUN TIME FIELD lv_time_start.
    ENDIF.

    "Etag check
    LOOP AT it_changeset_input INTO ls_changeset_input.
      IF ls_changeset_input-request_context-technical_request-conditions IS INITIAL.
        "no etags are used
        CONTINUE.
      ENDIF.

      READ TABLE it_operation_info INTO ls_operation_info INDEX sy-tabix.
      IF sy-subrc = 0.
        lv_operation_type = ls_operation_info-operation_type.
      ELSE.
        CLEAR lv_operation_type.
      ENDIF.

      IF lv_operation_type EQ /iwbep/if_mgw_appl_types=>gcs_operation_type-execute_action.
        " etag handling on function imports must be implemented by the application
        lv_cond_hndl_active = me->/iwbep/if_mgw_appl_srv_runtime~get_is_condi_imple_for_action( ls_changeset_input-request_context-technical_request-action_name ).
        IF lv_cond_hndl_active NE abap_true.
          RAISE EXCEPTION TYPE /iwbep/cx_mgw_tech_exception
            EXPORTING
              http_status_code = /iwbep/cx_mgw_tech_exception=>gcs_http_status_codes-not_implemented
              textid           = /iwbep/cx_mgw_tech_exception=>etag_for_action_not_supported.
        ENDIF.

      ELSE.

        lv_cond_hndl_active = me->/iwbep/if_mgw_appl_srv_runtime~get_is_conditional_implemented(
                                   iv_operation_type  = lv_operation_type
                                   iv_entity_set_name = ls_changeset_input-request_context-target_entity_set  ).
      ENDIF.

      IF lv_cond_hndl_active <> abap_true.
        check_before_modification( EXPORTING iv_entity_name      = ls_changeset_input-request_context-target_entity
                                             iv_source_name      = ls_changeset_input-request_context-source_entity
                                             is_request_details  = ls_changeset_input-request_context
                                             it_headers          = ls_changeset_input-request_headers ).
      ENDIF.
    ENDLOOP.

    me->/iwbep/if_mgw_appl_srv_runtime~changeset_begin(
      EXPORTING
        it_operation_info = it_operation_info
      CHANGING
        cv_defer_mode     = cv_defer_mode
    ).

    lv_time_stop = mo_sutil_runtime->performance_stop( lv_time_start ).
    IF lv_time_stop IS INITIAL.
      GET RUN TIME FIELD lv_time_stop.
    ENDIF.

    me->add_performance_data(
      iv_method     = '/IWBEP/IF_MGW_APPL_SRV_RUNTIME~CHANGESET_BEGIN'
      iv_time_start = lv_time_start
      iv_time_stop  = lv_time_stop
    ).

* Enable or Disable Deferred Processing Mode
    IF mo_changeset_helper IS NOT BOUND.
      mo_changeset_helper = /iwbep/cl_mgw_changeset_helper=>get_instance( ).
    ENDIF.
    mo_changeset_helper->set_defer_mode( cv_defer_mode ).

* Re-Check because of OLD VERSION via /IWBEP/FM_MGW_CHANGESET
    mv_changeset_defer_mode = cv_defer_mode = mo_changeset_helper->get_defer_mode( ).

    IF cv_defer_mode EQ abap_true.
      mo_model = get_model( ).
      /iwbep/cl_mgw_data_conv_util=>set_model( EXPORTING io_model =  mo_model ).
    ENDIF.

  ENDMETHOD.


  METHOD /iwbep/if_mgw_core_srv_runtime~changeset_end.

    DATA: lv_time_start TYPE i,
          lv_time_stop  TYPE i,
          lv_class_name TYPE string.


* Check for the same Provider Instance
    IF mv_changeset = abap_false.
      RAISE EXCEPTION TYPE /iwbep/cx_mgw_tech_exception
        EXPORTING
          textid = /iwbep/cx_mgw_tech_exception=>changeset_different_instances
          method = gcs_methods-changeset_end.
    ENDIF.

    CLEAR: mv_changeset_defer_mode, mv_changeset_func_not_allowed.

    IF mo_sutil_runtime IS NOT BOUND.
      mo_sutil_runtime = /iwbep/cl_sutil_runtime=>get_instance( ).
    ENDIF.

    IF mv_provider_class IS INITIAL.
      lv_class_name = cl_abap_classdescr=>get_class_name( me ).
      SHIFT lv_class_name BY 7 PLACES.
      mv_provider_class = lv_class_name.
    ENDIF.

    lv_time_start = mo_sutil_runtime->performance_start(
                      iv_class_name  = mv_provider_class
                      iv_method_name = '/IWBEP/IF_MGW_APPL_SRV_RUNTIME~CHANGESET_END'
                    ).
    IF lv_time_start IS INITIAL.
      GET RUN TIME FIELD lv_time_start.
    ENDIF.

    me->/iwbep/if_mgw_appl_srv_runtime~changeset_end( ).

    lv_time_stop = mo_sutil_runtime->performance_stop( lv_time_start ).
    IF lv_time_stop IS INITIAL.
      GET RUN TIME FIELD lv_time_stop.
    ENDIF.

    me->add_performance_data(
      iv_method     = '/IWBEP/IF_MGW_APPL_SRV_RUNTIME~CHANGESET_END'
      iv_time_start = lv_time_start
      iv_time_stop  = lv_time_stop
    ).

    CLEAR: mv_changeset.

  ENDMETHOD.


  METHOD /iwbep/if_mgw_core_srv_runtime~changeset_process.

    DATA: ls_changeset_request  TYPE /iwbep/if_mgw_appl_types=>ty_s_changeset_request,
          lt_changeset_request  TYPE /iwbep/if_mgw_appl_types=>ty_t_changeset_request,
          ls_changeset_response TYPE /iwbep/if_mgw_appl_types=>ty_s_changeset_response,
          lt_changeset_response TYPE /iwbep/if_mgw_appl_types=>ty_t_changeset_response,
          lo_main_msg_container TYPE REF TO /iwbep/if_message_container,
          lr_changeset_data     TYPE REF TO /iwbep/if_mgw_core_srv_runtime=>ty_s_changeset_data,
          lv_supports_move_corr TYPE abap_bool.

    DATA: lv_time_start TYPE i,
          lv_time_stop  TYPE i,
          lv_class_name TYPE string.


* Check for the same Provider Instance
    IF mv_changeset = abap_false.
      RAISE EXCEPTION TYPE /iwbep/cx_mgw_tech_exception
        EXPORTING
          textid = /iwbep/cx_mgw_tech_exception=>changeset_different_instances
          method = gcs_methods-changeset_end.
    ENDIF.

* Main message container is the one of the first changeset operation
    lo_main_msg_container = mo_changeset_helper->get_main_msg_container( ).
    mo_context->set_parameter(
      EXPORTING
        iv_name  = /iwbep/if_mgw_context=>gc_param_msg_container
        iv_value = lo_main_msg_container
    ).

    IF mo_sutil_runtime IS NOT BOUND.
      mo_sutil_runtime = /iwbep/cl_sutil_runtime=>get_instance( ).
    ENDIF.

    IF mv_provider_class IS INITIAL.
      lv_class_name = cl_abap_classdescr=>get_class_name( me ).
      SHIFT lv_class_name BY 7 PLACES.
      mv_provider_class = lv_class_name.
    ENDIF.

* Get Changeset Data and create CHnageset Request
    mo_changeset_helper->get_changeset_data(
      IMPORTING
        et_changeset_data = ct_changeset_data
    ).
    LOOP AT ct_changeset_data REFERENCE INTO lr_changeset_data.
      MOVE-CORRESPONDING lr_changeset_data->* TO ls_changeset_request.
      INSERT ls_changeset_request INTO TABLE lt_changeset_request.
    ENDLOOP.

    lv_time_start = mo_sutil_runtime->performance_start(
                      iv_class_name  = mv_provider_class
                      iv_method_name = '/IWBEP/IF_MGW_APPL_SRV_RUNTIME~CHANGESET_PROCESS'
                    ).
    IF lv_time_start IS INITIAL.
      GET RUN TIME FIELD lv_time_start.
    ENDIF.

* Call Provider
    /iwbep/if_mgw_appl_srv_runtime~changeset_process(
      EXPORTING
        it_changeset_request  = lt_changeset_request
      CHANGING
        ct_changeset_response = lt_changeset_response
      ).

    lv_time_stop = mo_sutil_runtime->performance_stop( lv_time_start ).
    IF lv_time_stop IS INITIAL.
      GET RUN TIME FIELD lv_time_stop.
    ENDIF.

    me->add_performance_data(
      iv_method     = '/IWBEP/IF_MGW_APPL_SRV_RUNTIME~CHANGESET_PROCESS'
      iv_time_start = lv_time_start
      iv_time_stop  = lv_time_stop
    ).

* Check function not allowed during processing
    IF mv_changeset_func_not_allowed = abap_true.
      RAISE EXCEPTION TYPE /iwbep/cx_mgw_tech_exception
        EXPORTING
          textid = /iwbep/cx_mgw_tech_exception=>not_allowed_in_defer_mode
          method = gcs_methods-changeset_process.
    ENDIF.

* Check number of responses
    IF lines( lt_changeset_request ) <> lines( lt_changeset_response ).
      RAISE EXCEPTION TYPE /iwbep/cx_mgw_tech_exception
        EXPORTING
          textid = /iwbep/cx_mgw_tech_exception=>changeset_missing_response
          method = gcs_methods-changeset_process.
    ENDIF.

* Specific Operation Handling such as Conversion
    LOOP AT lt_changeset_response INTO ls_changeset_response.
      IF ls_changeset_response-operation_no <> sy-tabix.
        RAISE EXCEPTION TYPE /iwbep/cx_mgw_tech_exception
          EXPORTING
            textid = /iwbep/cx_mgw_tech_exception=>changeset_missing_response
            method = gcs_methods-changeset_process.
      ENDIF.
      READ TABLE ct_changeset_data REFERENCE INTO lr_changeset_data
        WITH KEY operation_no = ls_changeset_response-operation_no.

      "Check if move-corresponding is supported for this operation
      IF lr_changeset_data->*-entity_descriptor IS BOUND.
        lr_changeset_data->*-entity_descriptor->is_move_corr_supported(
                              IMPORTING ev_supports_move_corr = lv_supports_move_corr ).
      ELSE.
        lv_supports_move_corr = abap_false.
      ENDIF.

      " Taking over the headers set by DPC
      lr_changeset_data->*-headers = ls_changeset_response-headers.

      CASE lr_changeset_data->*-operation_type.

        WHEN /iwbep/if_mgw_appl_types=>gcs_operation_type-create_entity      OR
             /iwbep/if_mgw_appl_types=>gcs_operation_type-create_deep_entity OR
             /iwbep/if_mgw_appl_types=>gcs_operation_type-create_stream.

          " Raise an exception with HTTP Status 500 if no business data returned
          IF ls_changeset_response-entity_data IS NOT BOUND.
            RAISE EXCEPTION TYPE /iwbep/cx_mgw_tech_exception
              EXPORTING
                textid           = /iwbep/cx_mgw_tech_exception=>no_business_data_returned
                http_status_code = /iwbep/cx_mgw_tech_exception=>gcs_http_status_codes-internal_server_error.
          ENDIF.

          convert_entity_data(
            EXPORTING
              ir_entity_data = ls_changeset_response-entity_data
              iv_supports_move_corr = lv_supports_move_corr
            CHANGING
              cr_changeset_data = lr_changeset_data
          ).
          IF lr_changeset_data->*-operation_type = /iwbep/if_mgw_appl_types=>gcs_operation_type-create_deep_entity.
            create_inline_info_deep_insert(
              EXPORTING
                ir_entity_data = ls_changeset_response-entity_data
              CHANGING
                cr_changeset_data = lr_changeset_data
            ).
          ENDIF.

        WHEN /iwbep/if_mgw_appl_types=>gcs_operation_type-update_entity OR
             /iwbep/if_mgw_appl_types=>gcs_operation_type-patch_entity  OR
             /iwbep/if_mgw_appl_types=>gcs_operation_type-update_stream.
          convert_entity_data(
            EXPORTING
              ir_entity_data = ls_changeset_response-entity_data
              iv_supports_move_corr = lv_supports_move_corr
            CHANGING
              cr_changeset_data = lr_changeset_data
          ).

        WHEN /iwbep/if_mgw_appl_types=>gcs_operation_type-delete_entity OR
             /iwbep/if_mgw_appl_types=>gcs_operation_type-delete_stream.
          " Do nothing

        WHEN /iwbep/if_mgw_appl_types=>gcs_operation_type-execute_action.
          convert_action_data(
            EXPORTING
              ir_entity_data = ls_changeset_response-entity_data
              iv_supports_move_corr = lv_supports_move_corr
            CHANGING
              cr_changeset_data = lr_changeset_data
          ).

      ENDCASE.

    ENDLOOP.

  ENDMETHOD.


  METHOD /iwbep/if_mgw_core_srv_runtime~cleanup.

    CLEAR mo_facade.

  ENDMETHOD.


  METHOD /iwbep/if_mgw_core_srv_runtime~create_entity.

    DATA: ls_parameter          TYPE /iwbep/s_mgw_name_value_pair,
          lv_expand_string      TYPE string,
          lv_tech_expand_string TYPE string,
          lo_entity_descriptor  TYPE REF TO /iwbep/cl_mgw_expand_node,
          lo_data_provider      TYPE REF TO /iwbep/cl_mgw_entry_raw_prv,
          lo_expand_tree        TYPE REF TO /iwbep/cl_mgw_expand_tree,
          lo_expand_root        TYPE REF TO /iwbep/cl_mgw_expand_node,
          lv_supports_move_corr TYPE abap_bool,
          lo_model              TYPE REF TO /iwbep/if_mgw_odata_fw_model,
          lo_struct_descr       TYPE REF TO cl_abap_structdescr,
          lr_target_struct      TYPE REF TO data,
          ls_media_resource     TYPE ty_s_media_resource,
          lo_request_obj        TYPE REF TO /iwbep/cl_mgw_request,
          lo_type_descr         TYPE REF TO cl_abap_typedescr,
          ls_request_context    TYPE /iwbep/if_mgw_core_srv_runtime=>ty_s_mgw_request_context,
          lv_model_no_conv      TYPE abap_bool,
          lv_operation_type     TYPE /iwbep/mgw_operation_type,
          lt_expand             TYPE string_table,
          lo_struct_descr_src   TYPE REF TO cl_abap_structdescr,
          lr_source_struct      TYPE REF TO data.

    DATA: lv_time_start TYPE i,
          lv_time_stop  TYPE i.

    FIELD-SYMBOLS:
      <ls_source_structure>     TYPE any,
      <ls_target_structure>     TYPE any,
      <ls_source_structure_new> TYPE any.

* Create Technical Request Object
    ls_request_context = is_request_details.
    lo_request_obj = create_request_object(
                       it_headers          = ct_headers
                       is_request_details  = ls_request_context
                     ).

    IF mv_changeset_defer_mode = abap_false.
      set_headers( CHANGING ct_headers = ct_headers ).
    ENDIF.

    READ TABLE ls_request_context-parameters
      WITH KEY name = gcs_parameters-expand
      INTO ls_parameter.

    IF sy-subrc EQ 0.
      lv_expand_string      = ls_parameter-value.
      lv_tech_expand_string = ls_request_context-technical_request-expand.
    ENDIF.

    lo_model = me->get_model( ).

    IF ls_request_context-technical_request-expand_root IS NOT BOUND.

      get_expand_objects(
           EXPORTING
              is_request_details = ls_request_context
              iv_cardinality = /iwbep/if_mgw_med_odata_types=>gcs_cardinality-cardinality_1_1
           IMPORTING
              eo_expand_root = lo_entity_descriptor ).

      " Save EXPAND_ROOT for GET_SELECT_xxx
      ls_request_context-technical_request-expand_root = lo_entity_descriptor.

    ELSE.
      lo_entity_descriptor ?= ls_request_context-technical_request-expand_root.
    ENDIF.

    lo_entity_descriptor->is_move_corr_supported(
                      IMPORTING ev_supports_move_corr = lv_supports_move_corr ).

* Create Key Converters
    me->create_key_converters(
      CHANGING
        cs_request_context = ls_request_context
    ).

*-media resource is sent as binary
    IF ls_request_context-type EQ gcs_request_types-stream.
*---get slug header
      CLEAR ls_parameter.
      READ TABLE ls_request_context-parameters WITH KEY name = gcs_parameters-slug
       INTO ls_parameter.

      io_data_provider->read_entry_data(
        IMPORTING
          es_data = ls_media_resource
      ).

      " Deferred Processing: Just add operation to CHANGESET_HELPER
      IF mv_changeset_defer_mode = abap_true.
        mo_changeset_helper->add_operation(
          EXPORTING
            iv_operation_type    = /iwbep/if_mgw_appl_types=>gcs_operation_type-create_stream
            it_header            = ct_headers
            is_request_context   = ls_request_context
            io_model             = lo_model
            io_provider_context  = mo_context
            is_media_resource    = ls_media_resource
            iv_slug              = ls_parameter-value
            io_entry_provider    = lo_data_provider
            io_entity_descriptor = lo_entity_descriptor
            io_expand_node       = lo_entity_descriptor
        ).
        RETURN.
      ELSEIF ls_request_context-technical_request-batch_info-content_id_ref IS NOT INITIAL.
        "Content referencing is only allowed for changeset at once (defer mode)
        RAISE EXCEPTION TYPE /iwbep/cx_mgw_tech_exception
          EXPORTING
            textid = /iwbep/cx_mgw_tech_exception=>changeset_with_content_id.
      ENDIF.

      lv_time_start = mo_sutil_runtime->performance_start(
                        iv_class_name  = mv_provider_class
                        iv_method_name = '/IWBEP/IF_MGW_APPL_SRV_RUNTIME~CREATE_STREAM'
                      ).
      IF lv_time_start IS INITIAL.
        GET RUN TIME FIELD lv_time_start.
      ENDIF.

      me->/iwbep/if_mgw_appl_srv_runtime~create_stream(
        EXPORTING
          iv_entity_name          = iv_entity_name
          iv_entity_set_name      = ls_request_context-target_entity_set
          iv_source_name          = iv_source_name
          is_media_resource       = ls_media_resource
          it_key_tab              = ls_request_context-key_tab
          it_navigation_path      = ls_request_context-navigation_path
          iv_slug                 = ls_parameter-value
          io_tech_request_context = lo_request_obj
        IMPORTING
          er_entity               = cr_entity
      ).

      lv_time_stop = mo_sutil_runtime->performance_stop( lv_time_start ).
      IF lv_time_stop IS INITIAL.
        GET RUN TIME FIELD lv_time_stop.
      ENDIF.

      me->add_performance_data(
        iv_method     = '/IWBEP/IF_MGW_APPL_SRV_RUNTIME~CREATE_STREAM'
        iv_time_start = lv_time_start
        iv_time_stop  = lv_time_stop
      ).


    ELSE.

*---casting for conversion exits to set entity descriptor for entry provider
      lo_data_provider ?= io_data_provider.
      lv_model_no_conv = lo_model->get_no_conversion( ).
      lo_data_provider->set_model_no_conversion( lv_model_no_conv ).
      lo_data_provider->set_entity_descriptor( lo_entity_descriptor ).

      " Deferred Processing: Just add operation to CHANGESET_HELPER
      IF mv_changeset_defer_mode = abap_true.
        IF lv_expand_string IS INITIAL.
          lv_operation_type = /iwbep/if_mgw_appl_types=>gcs_operation_type-create_entity.
        ELSE.
          lv_operation_type = /iwbep/if_mgw_appl_types=>gcs_operation_type-create_deep_entity.
        ENDIF.
        mo_changeset_helper->add_operation(
          EXPORTING
            iv_operation_type     = lv_operation_type
            it_header             = ct_headers
            is_request_context    = ls_request_context
            io_model              = lo_model
            io_provider_context   = mo_context
            iv_expand_string      = lv_expand_string
            iv_tech_expand_string = lv_tech_expand_string
            io_entry_provider     = lo_data_provider
            io_entity_descriptor  = lo_entity_descriptor
            io_expand_node        = lo_entity_descriptor
        ).
        RETURN.
      ELSEIF ls_request_context-technical_request-batch_info-content_id_ref IS NOT INITIAL.
        "Content referencing is only allowed for changeset at once (defer mode)
        RAISE EXCEPTION TYPE /iwbep/cx_mgw_tech_exception
          EXPORTING
            textid = /iwbep/cx_mgw_tech_exception=>changeset_with_content_id.
      ENDIF.

      /iwbep/cl_mgw_data_conv_util=>set_model( EXPORTING io_model =  mo_model ).

      IF lv_expand_string IS INITIAL.

        lv_time_start = mo_sutil_runtime->performance_start(
                          iv_class_name  = mv_provider_class
                          iv_method_name = '/IWBEP/IF_MGW_APPL_SRV_RUNTIME~CREATE_ENTITY'
                        ).
        IF lv_time_start IS INITIAL.
          GET RUN TIME FIELD lv_time_start.
        ENDIF.

        me->/iwbep/if_mgw_appl_srv_runtime~create_entity(
          EXPORTING
            iv_entity_name          = iv_entity_name
            iv_entity_set_name      = ls_request_context-target_entity_set
            iv_source_name          = iv_source_name
            io_data_provider        = lo_data_provider    " MGW Data Provider
            it_key_tab              = ls_request_context-key_tab
            it_navigation_path      = ls_request_context-navigation_path
            io_tech_request_context = lo_request_obj
          IMPORTING
            er_entity               = cr_entity
        ).

        lv_time_stop = mo_sutil_runtime->performance_stop( lv_time_start ).
        IF lv_time_stop IS INITIAL.
          GET RUN TIME FIELD lv_time_stop.
        ENDIF.

        me->add_performance_data(
          iv_method     = '/IWBEP/IF_MGW_APPL_SRV_RUNTIME~CREATE_ENTITY'
          iv_time_start = lv_time_start
          iv_time_stop  = lv_time_stop
        ).
      ELSE.
        lv_time_start = mo_sutil_runtime->performance_start(
                          iv_class_name  = mv_provider_class
                          iv_method_name = '/IWBEP/IF_MGW_APPL_SRV_RUNTIME~CREATE_DEEP_ENTITY'
                        ).
        IF lv_time_start IS INITIAL.
          GET RUN TIME FIELD lv_time_start.
        ENDIF.

        me->/iwbep/if_mgw_appl_srv_runtime~create_deep_entity(
          EXPORTING
            iv_entity_name          = iv_entity_name
            iv_entity_set_name      = ls_request_context-target_entity_set
            iv_source_name          = iv_source_name
            io_data_provider        = io_data_provider    " MGW Data Provider
            it_key_tab              = ls_request_context-key_tab
            it_navigation_path      = ls_request_context-navigation_path
            io_expand               = lo_entity_descriptor
            io_tech_request_context = lo_request_obj
          IMPORTING
            er_deep_entity          = cr_entity
        ).

        lv_time_stop = mo_sutil_runtime->performance_stop( lv_time_start ).
        IF lv_time_stop IS INITIAL.
          GET RUN TIME FIELD lv_time_stop.
        ENDIF.

        me->add_performance_data(
          iv_method     = '/IWBEP/IF_MGW_APPL_SRV_RUNTIME~CREATE_DEEP_ENTITY'
          iv_time_start = lv_time_start
          iv_time_stop  = lv_time_stop
        ).
      ENDIF.

    ENDIF.

    " Initial Inlines Handling: Same order as defined in Model Provider
    IF lv_tech_expand_string IS NOT INITIAL.

      " Set SAP__DATA_EXISTS for gateway system
      SPLIT lv_tech_expand_string AT ',' INTO TABLE lt_expand.

      lo_expand_tree = /iwbep/cl_mgw_expand_tree=>create(
                         iv_entity_set       = ls_request_context-target_entity_set
                         iv_entity_type      = iv_entity_name
                         iv_tech_entity_set  = ls_request_context-technical_request-target_entity_set
                         iv_tech_entity_type = ls_request_context-technical_request-target_entity_type
                         iv_multiplicity     = /iwbep/if_mgw_med_odata_types=>gcs_cardinality-cardinality_0_n
                         iv_expand           = lv_expand_string
                         iv_tech_expand      = lv_tech_expand_string
                         io_model            = lo_model
                       ).

      lo_expand_tree->add_metadata( lo_model ).
      lo_expand_tree->get_root( IMPORTING eo_root = lo_expand_root ).

      create_inline_info(
        EXPORTING
          io_expand_node = lo_expand_root
          ir_data        = cr_entity
        CHANGING
          ct_inline_info = ct_inline_info
      ).
      sort_inline_info(
        EXPORTING
          iv_expand_string   = lv_expand_string
          iv_entity_set_name = ls_request_context-technical_request-target_entity_set
        CHANGING
          ct_inline_info     = ct_inline_info
      ).
    ENDIF.



    " Set Session Flags for Local/Remote Handler
    mo_transaction_handler->set_soft_state_session_info(
      iv_session_start = mv_soft_state_session_start
      iv_session_end   = mv_soft_state_session_end
    ).

    lv_model_no_conv = lo_model->get_no_conversion( ).

    IF cr_entity IS BOUND.

*   if cr_entity is bound it has to be a struct/flat type - nothing else is allowed here
      lo_type_descr = cl_abap_typedescr=>describe_by_data_ref( cr_entity ).
      IF ( lo_type_descr->kind <> cl_abap_typedescr=>kind_struct ) AND
         ( lo_type_descr->kind <> cl_abap_typedescr=>kind_elem ).
        DATA: lv_type_expected TYPE string.
        lv_type_expected = TEXT-str.
        RAISE EXCEPTION TYPE /iwbep/cx_mgw_tech_exception
          EXPORTING
            textid        = /iwbep/cx_mgw_tech_exception=>wrong_data_container
            type_expected = lv_type_expected.
      ENDIF.


      IF lt_expand IS INITIAL.
        ASSIGN cr_entity->* TO <ls_source_structure>.

      ELSE.
        " In case of expand, we cannot work with data container supplied
        " by the application (cr_entityset) as this data containter does
        " not contain the field SAP__DATA_EXISTS for 0..1 subnodes.
        " A new data container with corresponding field has to be
        " created and a move_corresponding has to be done.
        ASSIGN cr_entity->* TO <ls_source_structure_new>.

        lo_struct_descr_src ?= lo_entity_descriptor->create_data_descriptor( iv_is_child = abap_true
                                                                             iv_is_expand = abap_true ).
        CREATE DATA lr_source_struct TYPE HANDLE lo_struct_descr_src.
        ASSIGN lr_source_struct->* TO <ls_source_structure>.

        move_corresponding(
          EXPORTING
            id_source_data = <ls_source_structure_new>
            iv_supports_move_corr = abap_false
          IMPORTING
            ed_target_data = <ls_source_structure> ).

        set_sap_data_exists(
          EXPORTING
            it_expand = lt_expand
          CHANGING
            cv_entity = lr_source_struct ).

      ENDIF.


      lo_struct_descr ?= lo_entity_descriptor->create_data_descriptor( iv_is_for_hub = abap_true ).
      CREATE DATA lr_target_struct TYPE HANDLE lo_struct_descr.
      ASSIGN lr_target_struct->* TO <ls_target_structure>.

      IF lv_model_no_conv = abap_false.
        lo_entity_descriptor->check_conversions( ).
        IF lo_entity_descriptor->get_no_conversion( ) = abap_false.
          /iwbep/cl_mgw_data_helper=>convert_entity_outb(
            EXPORTING
              io_expand_node      = lo_entity_descriptor
              is_source_structure = <ls_source_structure>
              iv_supports_move_corr = lv_supports_move_corr
            CHANGING
              cs_target_structure = <ls_target_structure> ).
        ELSE.
          move_corresponding(
            EXPORTING
              id_source_data = <ls_source_structure>
              iv_supports_move_corr = abap_false
            IMPORTING
              ed_target_data = <ls_target_structure> ).
        ENDIF.
      ELSE.
        move_corresponding(
         EXPORTING
           id_source_data = <ls_source_structure>
           iv_supports_move_corr = abap_false
         IMPORTING
           ed_target_data = <ls_target_structure> ).
      ENDIF.

      cr_entity = lr_target_struct.
    ENDIF.

    ct_headers = mt_headers.

  ENDMETHOD.


  METHOD /iwbep/if_mgw_core_srv_runtime~delete_entity.

    DATA: lv_class_name      TYPE string,
          lo_model           TYPE REF TO /iwbep/if_mgw_odata_fw_model,
          lo_request_obj     TYPE REF TO /iwbep/cl_mgw_request,
          ls_request_context TYPE /iwbep/if_mgw_core_srv_runtime=>ty_s_mgw_request_context,
          lv_operation_type  TYPE /iwbep/mgw_operation_type.

    DATA: lv_time_start TYPE i,
          lv_time_stop  TYPE i.

    DATA: lv_cond_hndl_active    TYPE abap_bool.

* Create Technical Request Object
    ls_request_context = is_request_details.

* set conditional operation type for update entity / update stream
    IF ls_request_context-type EQ gcs_request_types-stream.
      ls_request_context-technical_request-operation_type = /iwbep/if_mgw_appl_types=>gcs_operation_type-delete_stream.
    ELSE.
      ls_request_context-technical_request-operation_type = /iwbep/if_mgw_appl_types=>gcs_operation_type-delete_entity.
    ENDIF.

    lo_request_obj = create_request_object(
                       it_headers          = ct_headers
                       is_request_details  = ls_request_context
                     ).

    IF ls_request_context-technical_request-conditions IS NOT INITIAL AND
       mv_changeset EQ abap_false. "changeset etag logic is in changeset_begin

      lv_cond_hndl_active = me->/iwbep/if_mgw_appl_srv_runtime~get_is_conditional_implemented(
                                    iv_operation_type  = ls_request_context-technical_request-operation_type
                                    iv_entity_set_name = ls_request_context-target_entity_set  ).

      IF lv_cond_hndl_active <> abap_true.
        check_before_modification( EXPORTING iv_entity_name      = iv_entity_name
                                             iv_source_name      = iv_source_name
                                             is_request_details  = ls_request_context
                                             it_headers          = ct_headers ).
      ENDIF.
    ENDIF.

    IF mv_changeset_defer_mode = abap_false.
      set_headers( CHANGING ct_headers = ct_headers ).
    ENDIF.

* Create Key Converters
    me->create_key_converters(
      CHANGING
        cs_request_context = ls_request_context
    ).

    lo_model = me->get_model( ).

    IF mo_sutil_runtime IS NOT BOUND.
      mo_sutil_runtime = /iwbep/cl_sutil_runtime=>get_instance( ).
    ENDIF.

    IF mv_provider_class IS INITIAL.
      lv_class_name = cl_abap_classdescr=>get_class_name( me ).
      SHIFT lv_class_name BY 7 PLACES.
      mv_provider_class = lv_class_name.
    ENDIF.

    " Deferred Processing: Just add operation to CHANGESET_HELPER
    IF mv_changeset_defer_mode = abap_true.
      IF ls_request_context-type = gcs_request_types-stream.
        lv_operation_type = /iwbep/if_mgw_appl_types=>gcs_operation_type-delete_stream.
      ELSE.
        lv_operation_type = /iwbep/if_mgw_appl_types=>gcs_operation_type-delete_entity.
      ENDIF.
      mo_changeset_helper->add_operation(
        EXPORTING
          iv_operation_type    = lv_operation_type
          it_header            = ct_headers
          is_request_context   = ls_request_context
          io_model             = lo_model
          io_provider_context  = mo_context
      ).
      RETURN.
    ELSEIF ls_request_context-technical_request-batch_info-content_id_ref IS NOT INITIAL.
      "Content referencing is only allowed for changeset at once (defer mode)
      RAISE EXCEPTION TYPE /iwbep/cx_mgw_tech_exception
        EXPORTING
          textid = /iwbep/cx_mgw_tech_exception=>changeset_with_content_id.
    ENDIF.

    IF ls_request_context-type = gcs_request_types-stream.

      lv_time_start = mo_sutil_runtime->performance_start(
                         iv_class_name  = mv_provider_class
                         iv_method_name = '/IWBEP/IF_MGW_APPL_SRV_RUNTIME~DELETE_STREAM'
                       ).
      IF lv_time_start IS INITIAL.
        GET RUN TIME FIELD lv_time_start.
      ENDIF.

      me->/iwbep/if_mgw_appl_srv_runtime~delete_stream(
        EXPORTING
          iv_entity_name            = iv_entity_name
          iv_entity_set_name        = ls_request_context-target_entity_set
          iv_source_name            = iv_source_name
          it_key_tab                = ls_request_context-key_tab
          it_navigation_path        = ls_request_context-navigation_path
          io_tech_request_context   = lo_request_obj
      ).

      lv_time_stop = mo_sutil_runtime->performance_stop( lv_time_start ).
      IF lv_time_stop IS INITIAL.
        GET RUN TIME FIELD lv_time_stop.
      ENDIF.

      me->add_performance_data(
        iv_method     = '/IWBEP/IF_MGW_APPL_SRV_RUNTIME~DELETE_STREAM'
        iv_time_start = lv_time_start
        iv_time_stop  = lv_time_stop
      ).


    ELSE.

      lv_time_start = mo_sutil_runtime->performance_start(
                        iv_class_name  = mv_provider_class
                        iv_method_name = '/IWBEP/IF_MGW_APPL_SRV_RUNTIME~DELETE_ENTITY'
                      ).
      IF lv_time_start IS INITIAL.
        GET RUN TIME FIELD lv_time_start.
      ENDIF.

      me->/iwbep/if_mgw_appl_srv_runtime~delete_entity(
        EXPORTING
          iv_entity_name            = iv_entity_name
          iv_entity_set_name        = ls_request_context-target_entity_set
          iv_source_name            = iv_source_name
          it_key_tab                = ls_request_context-key_tab
          it_navigation_path        = ls_request_context-navigation_path
          io_tech_request_context   = lo_request_obj
      ).

      lv_time_stop = mo_sutil_runtime->performance_stop( lv_time_start ).
      IF lv_time_stop IS INITIAL.
        GET RUN TIME FIELD lv_time_stop.
      ENDIF.

      me->add_performance_data(
        iv_method     = '/IWBEP/IF_MGW_APPL_SRV_RUNTIME~DELETE_ENTITY'
        iv_time_start = lv_time_start
        iv_time_stop  = lv_time_stop
      ).
    ENDIF.


    " Set Session Flags for Local/Remote Handler
    mo_transaction_handler->set_soft_state_session_info(
      iv_session_start = mv_soft_state_session_start
      iv_session_end   = mv_soft_state_session_end
    ).

    ct_headers = mt_headers.

  ENDMETHOD.


  METHOD /iwbep/if_mgw_core_srv_runtime~exec_service_operation.

    DATA:
      lo_type_descr          TYPE REF TO cl_abap_typedescr,
      lo_struct_descr        TYPE REF TO cl_abap_structdescr,
      lo_table_descr         TYPE REF TO cl_abap_tabledescr,
      lo_expand_tree         TYPE REF TO /iwbep/cl_mgw_expand_tree,
      lo_expand_root         TYPE REF TO /iwbep/cl_mgw_expand_node,
      lo_model               TYPE REF TO /iwbep/if_mgw_odata_fw_model,
      lo_action              TYPE REF TO /iwbep/if_mgw_odata_fw_action,
      lo_complex_type        TYPE REF TO /iwbep/if_mgw_odata_fw_cplxtyp,
      lr_target_struct       TYPE REF TO data,
      lr_target_table        TYPE REF TO data,
      ls_parameter           TYPE /iwbep/s_mgw_name_value_pair,
      lv_expand_string       TYPE string,
      lv_tech_expand_string  TYPE string,
      lv_act_name            TYPE /iwbep/if_mgw_med_odata_types=>ty_e_med_entity_name,
      lv_complex_type        TYPE /iwbep/if_mgw_med_odata_types=>ty_e_med_entity_name,
      lv_entity_type         TYPE string,
      lv_tech_entity_type    TYPE /iwbep/mgw_tech_name,
      lv_multiplicity        TYPE /iwbep/if_mgw_med_odata_types=>ty_e_med_cardinality,
      lo_entity              TYPE REF TO /iwbep/if_mgw_odata_fw_etype,
      lv_not_supp_prop_found TYPE abap_bool,
      lo_request_obj         TYPE REF TO /iwbep/cl_mgw_request,
      ls_request_context     TYPE /iwbep/if_mgw_core_srv_runtime=>ty_s_mgw_request_context,
      lv_model_no_conv       TYPE abap_bool,
      lv_expand_no_conv      TYPE abap_bool,
      lv_supports_move_corr  TYPE abap_bool,
      lv_type_expected       TYPE string,
      lv_cond_hndl_active    TYPE abap_bool.

    FIELD-SYMBOLS:
      <ls_source_structure> TYPE any,
      <ls_entity>           TYPE any,
      <ls_target_structure> TYPE any,
      <lt_source_table>     TYPE ANY TABLE,
      <lt_target_table>     TYPE ANY TABLE.

    DATA: lv_time_start TYPE i,
          lv_time_stop  TYPE i.



* Create Technical Request Object
    ls_request_context = is_request_details.
    lo_request_obj = create_request_object(
                       it_headers         = ct_headers
                       is_request_details = ls_request_context
                     ).

* eTag
    IF ls_request_context-technical_request-conditions IS NOT INITIAL AND
      mv_changeset EQ abap_false.
      lv_cond_hndl_active = me->/iwbep/if_mgw_appl_srv_runtime~get_is_condi_imple_for_action(
                                    iv_action_name = ls_request_context-technical_request-action_name  ).

      IF ( lv_cond_hndl_active <> abap_true ).
        RAISE EXCEPTION TYPE /iwbep/cx_mgw_tech_exception
          EXPORTING
            http_status_code = /iwbep/cx_mgw_tech_exception=>gcs_http_status_codes-not_implemented
            textid           = /iwbep/cx_mgw_tech_exception=>etag_for_action_not_supported.
      ENDIF.

    ENDIF.


* expand
    READ TABLE ls_request_context-uri_parameters WITH KEY name = gcs_parameters-expand
      INTO ls_parameter.
    IF sy-subrc EQ 0.
      lv_expand_string      = ls_parameter-value.
      lv_tech_expand_string = ls_request_context-technical_request-expand.
    ENDIF.


* Get Model & Action
    lo_model    = me->get_model( ).
    lv_act_name = iv_action_name.
    lo_action   = lo_model->get_action( lv_act_name ).

* Create Action Parameter Converter
    me->create_input_param_converter(
      EXPORTING
        iv_action_name     = lv_act_name
      CHANGING
        cs_request_context = ls_request_context
    ).

* Deferred Processing: Just add operation to CHANGESET_HELPER
    IF mv_changeset_defer_mode = abap_true.
      mo_changeset_helper->add_operation(
        EXPORTING
          iv_operation_type     = /iwbep/if_mgw_appl_types=>gcs_operation_type-execute_action
          it_header             = ct_headers
          is_request_context    = ls_request_context
          io_model              = lo_model
          io_provider_context   = mo_context
          iv_expand_string      = lv_expand_string
          iv_tech_expand_string = lv_tech_expand_string
      ).
      RETURN.
    ELSEIF ls_request_context-technical_request-batch_info-content_id_ref IS NOT INITIAL.
      "Content referencing is only allowed for changeset at once (defer mode)
      RAISE EXCEPTION TYPE /iwbep/cx_mgw_tech_exception
        EXPORTING
          textid = /iwbep/cx_mgw_tech_exception=>changeset_with_content_id.
    ENDIF.

    lv_time_start = mo_sutil_runtime->performance_start(
                      iv_class_name  = mv_provider_class
                      iv_method_name = '/IWBEP/IF_MGW_APPL_SRV_RUNTIME~EXECUTE_ACTION'
                    ).
    IF lv_time_start IS INITIAL.
      GET RUN TIME FIELD lv_time_start.
    ENDIF.

    me->/iwbep/if_mgw_appl_srv_runtime~execute_action(
      EXPORTING
        iv_action_name          = iv_action_name
        it_parameter            = ls_request_context-parameters
        io_tech_request_context = lo_request_obj
      IMPORTING
        er_data                 = cr_data ).

    lv_time_stop = mo_sutil_runtime->performance_stop( lv_time_start ).
    IF lv_time_stop IS INITIAL.
      GET RUN TIME FIELD lv_time_stop.
    ENDIF.

    me->add_performance_data(
      iv_method     = '/IWBEP/IF_MGW_APPL_SRV_RUNTIME~EXECUTE_ACTION'
      iv_time_start = lv_time_start
      iv_time_stop  = lv_time_stop
    ).


    " Set Session Flags for Local/Remote Handler
    mo_transaction_handler->set_soft_state_session_info(
      iv_session_start = mv_soft_state_session_start
      iv_session_end   = mv_soft_state_session_end
    ).

* Handle Return Data
    lv_complex_type = lo_action->get_return_complex_type( ).
    lv_entity_type =  lo_action->get_return_entity_type( ).
    lv_tech_entity_type = lo_action->get_tech_return_entity_type( ).
    lv_multiplicity = lo_action->get_return_multiplicity( ).

    IF cr_data IS BOUND.

      " check if cardinality of function return (structure or table) is correct
      CASE lv_multiplicity.

        WHEN /iwbep/if_mgw_med_odata_types=>gcs_cardinality-cardinality_0_1 OR
             /iwbep/if_mgw_med_odata_types=>gcs_cardinality-cardinality_1_1.
          lo_type_descr = cl_abap_typedescr=>describe_by_data_ref( cr_data ).
          IF ( lo_type_descr->kind <> cl_abap_typedescr=>kind_struct ) AND
             ( lo_type_descr->kind <> cl_abap_typedescr=>kind_elem ).
            lv_type_expected = TEXT-str.
            RAISE EXCEPTION TYPE /iwbep/cx_mgw_tech_exception
              EXPORTING
                textid        = /iwbep/cx_mgw_tech_exception=>wrong_data_container
                type_expected = lv_type_expected.
          ENDIF.

          ASSIGN cr_data->* TO <ls_source_structure>.
          "If cr_data is bound but initial check for following issue:
          "Function Imports with cardinality 0..1 and an entity type as return type can cause an error
          "when no data is returned and the entity type has certain key fields (details see note 2009874)
          IF <ls_source_structure> IS INITIAL.
            IF lv_complex_type IS INITIAL AND
               lv_entity_type IS NOT INITIAL AND
               lv_multiplicity EQ /iwbep/if_mgw_med_odata_types=>gcs_cardinality-cardinality_0_1.
              lo_entity = lo_model->get_entity_type_by_tech_name( lv_tech_entity_type ).
              lv_not_supp_prop_found = lo_entity->check_problematic_key_fields( ).
              IF lv_not_supp_prop_found EQ abap_true.
                RAISE EXCEPTION TYPE /iwbep/cx_mgw_tech_exception
                  EXPORTING
                    textid      = /iwbep/cx_mgw_tech_exception=>function_import_card_0_1
                    entity_type = lv_entity_type
                    action      = iv_action_name
                    sap_note_id = gc_note_id_func_import_0_1.
              ENDIF.
            ENDIF.
          ENDIF.

        WHEN /iwbep/if_mgw_med_odata_types=>gcs_cardinality-cardinality_0_n OR
             /iwbep/if_mgw_med_odata_types=>gcs_cardinality-cardinality_1_n.
          lo_type_descr = cl_abap_typedescr=>describe_by_data_ref( cr_data ).
          IF lo_type_descr->kind <> cl_abap_typedescr=>kind_table.
            lv_type_expected = TEXT-tab.
            RAISE EXCEPTION TYPE /iwbep/cx_mgw_tech_exception
              EXPORTING
                textid        = /iwbep/cx_mgw_tech_exception=>wrong_data_container
                type_expected = lv_type_expected.
          ENDIF.
      ENDCASE.

      lv_model_no_conv = lo_model->get_no_conversion( ).

      IF lv_complex_type IS NOT INITIAL.

        lo_complex_type = lo_model->get_complex_type( lv_complex_type ).
        IF lv_model_no_conv = abap_false.
          lo_complex_type->check_conversions( ).
        ENDIF.
        lv_supports_move_corr = lo_complex_type->is_move_corr_supported( ).

        CASE lv_multiplicity.
          WHEN /iwbep/if_mgw_med_odata_types=>gcs_cardinality-cardinality_0_1 OR
              /iwbep/if_mgw_med_odata_types=>gcs_cardinality-cardinality_1_1.
            ASSIGN cr_data->* TO <ls_source_structure>.
            lo_struct_descr ?= lo_complex_type->create_data_descriptor( iv_is_for_hub = abap_true ).
            IF lo_struct_descr IS NOT BOUND.
              lo_struct_descr ?= lo_complex_type->create_data_descriptor( iv_create_new = abap_true
                                                                          iv_is_for_hub = abap_true ).
            ENDIF.
            IF lo_struct_descr IS BOUND.
              CREATE DATA lr_target_struct TYPE HANDLE lo_struct_descr.
              ASSIGN lr_target_struct->* TO <ls_target_structure>.

              IF  ( lv_model_no_conv = abap_false )
              AND ( lo_complex_type->get_no_conversion( ) = abap_false ).
                /iwbep/cl_mgw_data_helper=>convert_complex_property_outb(
                  EXPORTING
                    io_complex_type = lo_complex_type
                    is_source_data  = <ls_source_structure>
                    iv_supports_move_corr = lv_supports_move_corr
                  CHANGING
                    cs_target_data  = <ls_target_structure> ).
              ELSE.
                move_corresponding(
                  EXPORTING
                    id_source_data = <ls_source_structure>
                    iv_supports_move_corr = abap_false
                  IMPORTING
                    ed_target_data = <ls_target_structure> ).
              ENDIF.
              cr_data = lr_target_struct.
            ENDIF.

          WHEN /iwbep/if_mgw_med_odata_types=>gcs_cardinality-cardinality_0_n OR
               /iwbep/if_mgw_med_odata_types=>gcs_cardinality-cardinality_1_n.
            ASSIGN cr_data->* TO <lt_source_table>.
            lo_struct_descr ?= lo_complex_type->create_data_descriptor( iv_is_for_hub = abap_true ).
            IF lo_struct_descr IS NOT BOUND.
              lo_struct_descr ?= lo_complex_type->create_data_descriptor( iv_create_new = abap_true
                                                                          iv_is_for_hub = abap_true  ).
            ENDIF.
            IF lo_struct_descr IS BOUND.
              lo_table_descr = cl_abap_tabledescr=>create( p_line_type = lo_struct_descr ).
              CREATE DATA lr_target_table TYPE HANDLE lo_table_descr.
              ASSIGN lr_target_table->* TO <lt_target_table>.

              IF  ( lv_model_no_conv = abap_false )
              AND ( lo_complex_type->get_no_conversion( ) = abap_false ).
                /iwbep/cl_mgw_data_helper=>convert_complex_property_outb(
                  EXPORTING
                    io_complex_type = lo_complex_type
                    is_source_data  = <lt_source_table>
                    iv_supports_move_corr = lv_supports_move_corr
                  CHANGING
                    cs_target_data = <lt_target_table>
                ).
              ELSE.
                move_corresponding(
                  EXPORTING
                    id_source_data = <lt_source_table>
                    iv_supports_move_corr = abap_false
                  IMPORTING
                    ed_target_data = <lt_target_table>
                ).
              ENDIF.
              cr_data = lr_target_table.
            ENDIF.
        ENDCASE.

      ELSEIF lv_entity_type IS NOT INITIAL.
        lo_expand_tree = /iwbep/cl_mgw_expand_tree=>create(
                           iv_entity_set       = ls_request_context-target_entity_set
                           iv_tech_entity_set  = ls_request_context-technical_request-target_entity_set
                           iv_entity_type      = lv_entity_type
                           iv_tech_entity_type = lv_tech_entity_type
                           iv_multiplicity     = lv_multiplicity
                           iv_expand           = lv_expand_string
                           iv_tech_expand      = lv_tech_expand_string
                           io_model            = lo_model
                         ).

        lo_expand_tree->add_metadata( lo_model ).
        lo_expand_tree->get_root( IMPORTING eo_root = lo_expand_root ).
        lo_expand_root->is_move_corr_supported(
                      IMPORTING ev_supports_move_corr = lv_supports_move_corr ).

        " Save EXPAND_ROOT for GET_SELECT_xxx
        ls_request_context-technical_request-expand_root = lo_expand_root.

        IF lv_model_no_conv = abap_false.
          lo_expand_root->check_conversions( ).
        ENDIF.

        lv_expand_no_conv = lo_expand_root->get_no_conversion( ).

        CASE lv_multiplicity.
          WHEN /iwbep/if_mgw_med_odata_types=>gcs_cardinality-cardinality_0_1 OR
               /iwbep/if_mgw_med_odata_types=>gcs_cardinality-cardinality_1_1.
            ASSIGN cr_data->* TO <ls_source_structure>.
            lo_struct_descr ?= lo_expand_root->create_data_descriptor( iv_is_for_hub = abap_true ).
            CREATE DATA lr_target_struct TYPE HANDLE lo_struct_descr.
            ASSIGN lr_target_struct->* TO <ls_target_structure>.

            IF lv_expand_no_conv = abap_false OR lv_expand_string IS NOT INITIAL.
              /iwbep/cl_mgw_data_helper=>convert_entity_outb(
                EXPORTING
                  io_expand_node      = lo_expand_root
                  is_source_structure = <ls_source_structure>
                  iv_supports_move_corr = lv_supports_move_corr
                CHANGING
                  cs_target_structure = <ls_target_structure>
              ).
            ELSE.
              move_corresponding(
                EXPORTING
                  id_source_data = <ls_source_structure>
                  iv_supports_move_corr = abap_false
                IMPORTING
                  ed_target_data = <ls_target_structure>
              ).
            ENDIF.
            cr_data = lr_target_struct.

            IF lv_expand_string IS NOT INITIAL.
*-------------expand the entity (recursively if required)
              expand_entity(
                EXPORTING
                  io_expand_node              = lo_expand_root
                  iv_source_entity_type       = lv_entity_type
                  iv_tech_source_entity_type  = lv_tech_entity_type
                  iv_tech_source_entity_set   = ls_request_context-technical_request-target_entity_set
                  is_original_request_details = ls_request_context
                  iv_supports_move_corr       = lv_supports_move_corr
                CHANGING
                  cs_entity                  = <ls_target_structure>
              ).
            ENDIF.

          WHEN /iwbep/if_mgw_med_odata_types=>gcs_cardinality-cardinality_0_n OR
               /iwbep/if_mgw_med_odata_types=>gcs_cardinality-cardinality_1_n.
            ASSIGN cr_data->* TO <lt_source_table>.
            lo_table_descr ?= lo_expand_root->create_data_descriptor( iv_is_for_hub = abap_true ).
            CREATE DATA lr_target_table TYPE HANDLE lo_table_descr.
            ASSIGN lr_target_table->* TO <lt_target_table>.

            IF lv_expand_no_conv = abap_false OR lv_expand_string IS NOT INITIAL.
              /iwbep/cl_mgw_data_helper=>convert_entityset_outb(
                EXPORTING
                  io_expand_node  = lo_expand_root
                  it_source_table = <lt_source_table>
                  iv_supports_move_corr = lv_supports_move_corr
                CHANGING
                  ct_target_table = <lt_target_table>
              ).
            ELSE.
              move_corresponding(
                EXPORTING
                  id_source_data = <lt_source_table>
                  iv_supports_move_corr = abap_false
                IMPORTING
                  ed_target_data = <lt_target_table>
              ).
            ENDIF.
            cr_data = lr_target_table.

            IF lv_expand_string IS NOT INITIAL.
              LOOP AT <lt_target_table> ASSIGNING <ls_entity>.
*---------------expand the entity (recursively if required)
                expand_entity(
                  EXPORTING
                    io_expand_node              = lo_expand_root
                    iv_source_entity_type       = lv_entity_type
                    iv_tech_source_entity_type  = lv_tech_entity_type
                    iv_tech_source_entity_set   = ls_request_context-technical_request-target_entity_set
                    is_original_request_details = ls_request_context
                    iv_supports_move_corr       = lv_supports_move_corr
                  CHANGING
                    cs_entity                  = <ls_entity>
                ).
              ENDLOOP.
            ENDIF.
        ENDCASE.
      ELSE.
        RAISE EXCEPTION TYPE /iwbep/cx_mgw_med_exception
          EXPORTING
            textid      = /iwbep/cx_mgw_med_exception=>action_inconsistent
            entity_name = lv_act_name.

      ENDIF.

    ELSE.
      "If cr_data is not bound check for following issue:
      "Function Imports with cardinality 0..1 and an entity type as return type can cause an error
      "when no data is returned and the entity type has certain key fields (details see note 2009874)
      IF lv_complex_type IS INITIAL AND
         lv_entity_type IS NOT INITIAL AND
         lv_multiplicity EQ /iwbep/if_mgw_med_odata_types=>gcs_cardinality-cardinality_0_1.
        lo_entity = lo_model->get_entity_type_by_tech_name( lv_tech_entity_type ).
        lv_not_supp_prop_found = lo_entity->check_problematic_key_fields( ).
        IF lv_not_supp_prop_found EQ abap_true.
          RAISE EXCEPTION TYPE /iwbep/cx_mgw_tech_exception
            EXPORTING
              textid      = /iwbep/cx_mgw_tech_exception=>function_import_card_0_1
              entity_type = lv_entity_type
              action      = iv_action_name
              sap_note_id = gc_note_id_func_import_0_1.
        ENDIF.
      ENDIF.

      " Further checks for cardinality 1..1 and 1..n
      IF lv_complex_type IS INITIAL     AND
         lv_entity_type  IS NOT INITIAL AND
         ( lv_multiplicity = /iwbep/if_mgw_med_odata_types=>gcs_cardinality-cardinality_1_1 OR
           lv_multiplicity = /iwbep/if_mgw_med_odata_types=>gcs_cardinality-cardinality_1_n
         ).
        IF ls_request_context-http_method = 'GET'.
          RAISE EXCEPTION TYPE /iwbep/cx_mgw_busi_exception
            EXPORTING
              textid           = /iwbep/cx_mgw_busi_exception=>resource_not_found
              entity_type      = lv_entity_type
              http_status_code = /iwbep/cx_mgw_busi_exception=>gcs_http_status_codes-not_found.
        ENDIF.
      ENDIF.
    ENDIF.

    ct_headers = mt_headers.

    " Initial Inlines Handling: Same order as defined in Model Provider
    IF lv_tech_expand_string IS NOT INITIAL.
      create_inline_info(
        EXPORTING
          io_expand_node = lo_expand_root
          ir_data        = cr_data
        CHANGING
          ct_inline_info = ct_inline_info
      ).
      sort_inline_info(
        EXPORTING
          iv_expand_string   = lv_expand_string
          iv_entity_set_name = ls_request_context-technical_request-target_entity_set
        CHANGING
          ct_inline_info     = ct_inline_info
      ).
    ENDIF.

  ENDMETHOD.


  METHOD /iwbep/if_mgw_core_srv_runtime~get_expand_root.

    DATA lo_expand_root TYPE REF TO /iwbep/cl_mgw_expand_node.

    CALL METHOD get_expand_objects(
      EXPORTING
        is_request_details = cs_request_details
        iv_cardinality     = iv_cardinality
      IMPORTING
        eo_expand_root     = lo_expand_root ).

    cs_request_details-technical_request-expand_root = lo_expand_root.

  ENDMETHOD.


  METHOD /iwbep/if_mgw_core_srv_runtime~init.

    DATA: lv_class_name TYPE string.

    GET REFERENCE OF iv_namespace INTO mr_service_namespace.
    GET REFERENCE OF iv_version INTO mr_service_version.
    GET REFERENCE OF iv_service_document_name INTO mr_service_document_name.

    mo_context = io_context.

    CLEAR mt_nav_target_buffer.

    IF mv_provider_class IS INITIAL.
      lv_class_name = cl_abap_classdescr=>get_class_name( me ).
      SHIFT lv_class_name BY 7 PLACES.
      mv_provider_class = lv_class_name.
    ENDIF.

    " Get Soft State Status (active/inactive)
    mo_context->get_parameter(
      EXPORTING
        iv_name  = /iwbep/if_mgw_context=>gc_param_softstate
      IMPORTING
        ev_value = ms_soft_state_info-enabled
    ).

    " Get Soft State Mode (immediate/delayed; set in MPC)
    mo_context->get_parameter(
      EXPORTING
        iv_name  = /iwbep/if_mgw_context=>gc_param_softstate_mode
      IMPORTING
        ev_value = ms_soft_state_info-mode
    ).

    " Get Transaction Handler
    mo_transaction_handler = /iwbep/cl_transaction_handler=>get_instance( ).

  ENDMETHOD.


  METHOD /iwbep/if_mgw_core_srv_runtime~init_request_context.

    co_request_context = create_request_object(
                           it_headers          = it_headers
                           is_request_details  = is_request_details
                         ).
  ENDMETHOD.


  METHOD /iwbep/if_mgw_core_srv_runtime~read_entity.

    DATA: ls_parameter              TYPE /iwbep/s_mgw_name_value_pair,
          lo_expand_tree            TYPE REF TO /iwbep/cl_mgw_expand_tree,
          lo_expand_root            TYPE REF TO /iwbep/cl_mgw_expand_node,
          lv_expand_string          TYPE string,
          lv_tech_expand_string     TYPE string,
          lo_model                  TYPE REF TO /iwbep/if_mgw_odata_fw_model,
          lo_request_obj            TYPE REF TO /iwbep/cl_mgw_request,
          ls_request_context        TYPE /iwbep/if_mgw_core_srv_runtime=>ty_s_mgw_request_context,
          ls_response_context       TYPE /iwbep/if_mgw_core_srv_runtime=>ty_s_mgw_response_context,
          lv_method                 TYPE seomtdname,
          ls_response_context_appl  TYPE /iwbep/if_mgw_appl_srv_runtime=>ty_s_mgw_response_entity_cntxt,
          ls_batch_operation_buffer TYPE ty_s_batch_operation_buffer.

    DATA: lv_time_start TYPE i,
          lv_time_stop  TYPE i.


* Create Technical Request Object
    ls_request_context = is_request_details.

    lo_request_obj = create_request_object(
                       it_headers         = ct_headers
                       is_request_details = ls_request_context ).

    READ TABLE ls_request_context-parameters
      WITH KEY name = gcs_parameters-expand
      INTO ls_parameter.

    IF sy-subrc EQ 0.
      lv_expand_string      = ls_parameter-value.
      lv_tech_expand_string = ls_request_context-technical_request-expand.
    ENDIF.

    lo_model = me->get_model( ).

    IF ls_request_context-technical_request-expand_root IS NOT BOUND.

      get_expand_objects(
           EXPORTING
              is_request_details = ls_request_context
              iv_cardinality = /iwbep/if_mgw_med_odata_types=>gcs_cardinality-cardinality_1_1
           IMPORTING
              eo_expand_root = lo_expand_root
              eo_expand_tree = lo_expand_tree ).

      " Save EXPAND_ROOT for GET_SELECT_xxx
      ls_request_context-technical_request-expand_root = lo_expand_root.

    ELSE.

      lo_expand_root ?= ls_request_context-technical_request-expand_root.
      lo_expand_tree = /iwbep/cl_mgw_expand_tree=>create_from_root( io_root_node = lo_expand_root ).

    ENDIF.

* Create Key Converters
    me->create_key_converters(
      CHANGING
        cs_request_context = ls_request_context ).

    IF lv_expand_string IS NOT INITIAL.
      lv_method = '/IWBEP/IF_MGW_APPL_SRV_RUNTIME~GET_EXPANDED_ENTITY'.
    ELSE.
      lv_method = '/IWBEP/IF_MGW_APPL_SRV_RUNTIME~GET_ENTITY'.
    ENDIF.

    lv_time_start = mo_sutil_runtime->performance_start(
                      iv_class_name  = mv_provider_class
                      iv_method_name = lv_method ).
    IF lv_time_start IS INITIAL.
      GET RUN TIME FIELD lv_time_start.
    ENDIF.

    IF lv_expand_string IS NOT INITIAL.
*---create a data container which contains the deep structure
*---if application completely self expands it is an unnecessary step...
*---it is impossible to predict whether application can fully handly expand
      cr_entity = lo_expand_tree->create_data_container( iv_is_expand = abap_true ).

      read_expanded_entity(
        EXPORTING
          iv_entity_name          = iv_entity_name
          iv_tech_entity_name     = ls_request_context-technical_request-target_entity_type
          iv_source_name          = iv_source_name
          is_request_details      = ls_request_context
          io_expand_node          = lo_expand_root
          io_tech_request_context = lo_request_obj
          iv_top_level_context    = abap_true
        CHANGING
          cr_entity               = cr_entity
          cs_response_context     = ls_response_context ).

      ct_expand_skiptoken = ls_response_context-expand_skiptokens.
      MOVE-CORRESPONDING ls_response_context TO cs_response_context.

    ELSE.

      me->/iwbep/if_mgw_appl_srv_runtime~get_entity(
      EXPORTING
        iv_entity_name            = iv_entity_name
        iv_entity_set_name        = ls_request_context-target_entity_set
        iv_source_name            = iv_source_name
        it_key_tab                = ls_request_context-key_tab
        it_navigation_path        = ls_request_context-navigation_path
        io_tech_request_context   = lo_request_obj
      IMPORTING
        er_entity                 = cr_entity
        es_response_context       = ls_response_context_appl ).

      cs_response_context-appl_response_context = ls_response_context_appl.

      " Set Session Flags for Local/Remote Handler
      mo_transaction_handler->set_soft_state_session_info(
        iv_session_start = mv_soft_state_session_start
        iv_session_end   = mv_soft_state_session_end ).

    ENDIF.

    lv_time_stop = mo_sutil_runtime->performance_stop( lv_time_start ).
    IF lv_time_stop IS INITIAL.
      GET RUN TIME FIELD lv_time_stop.
    ENDIF.

    me->add_performance_data(
      iv_method     = lv_method
      iv_time_start = lv_time_start
      iv_time_stop  = lv_time_stop ).

    IF mv_batch_deferred_resp_crea EQ abap_true.
      ls_batch_operation_buffer-operation_id   = ls_request_context-technical_request-batch_info-operation_id.
      ls_batch_operation_buffer-operation_type = /iwbep/if_mgw_appl_types=>gcs_operation_type-get_entity.
      ls_batch_operation_buffer-model          = lo_model.
      ls_batch_operation_buffer-request_obj    = lo_request_obj->clone( ).
      ls_batch_operation_buffer-expand_root    = lo_expand_root.
      ls_batch_operation_buffer-msg_container  = create_msg_container_and_merge( ).
      INSERT ls_batch_operation_buffer INTO TABLE mt_batch_operation_buffer.
      ASSERT sy-subrc EQ 0.

      CLEAR cr_entity.
      CLEAR cs_response_context.
      RETURN.
    ENDIF.

    post_process_read_entity(
      EXPORTING
        io_model                     = lo_model
        io_expand_root               = lo_expand_root
        io_request_obj               = lo_request_obj
        it_header                    = mt_headers
      CHANGING
        ct_header                    = ct_headers
        cr_entity                    = cr_entity
        cs_response_context          = cs_response_context
        ct_inline_info               = ct_inline_info ).

  ENDMETHOD.


  METHOD /iwbep/if_mgw_core_srv_runtime~read_entityset.


    DATA: lv_search_string          TYPE string,
          lv_filter_string          TYPE string,
          lv_expand_string          TYPE string,
          lv_tech_expand_string     TYPE string,
          lo_expand_tree            TYPE REF TO /iwbep/cl_mgw_expand_tree,
          lo_expand_root            TYPE REF TO /iwbep/cl_mgw_expand_node,
          lo_model                  TYPE REF TO /iwbep/if_mgw_odata_fw_model,
          lo_request_obj            TYPE REF TO /iwbep/cl_mgw_request,
          ls_request_context        TYPE /iwbep/if_mgw_core_srv_runtime=>ty_s_mgw_request_context,
          lv_method                 TYPE seomtdname,
          ls_response_context       TYPE /iwbep/if_mgw_appl_srv_runtime=>ty_s_mgw_response_context,
          ls_batch_operation_buffer TYPE ty_s_batch_operation_buffer.
    DATA: lv_time_start TYPE i,
          lv_time_stop  TYPE i.



**********************************************************************
*   Pre Processing
**********************************************************************
    ls_request_context = is_request_details.
    lo_model = get_model( ).

    pre_process_read_entityset(
      EXPORTING
        it_header                    = ct_headers
      IMPORTING
        eo_request_obj               = lo_request_obj
        ev_search_string             = lv_search_string
        ev_filter_string             = lv_filter_string
        ev_expand_string             = lv_expand_string
        ev_method                    = lv_method
        ev_tech_expand_string        = lv_tech_expand_string
        eo_expand_root               = lo_expand_root
        eo_expand_tree               = lo_expand_tree
      CHANGING
        cs_request_context           = ls_request_context ).

    lv_time_start = mo_sutil_runtime->performance_start(
                      iv_class_name  = mv_provider_class
                      iv_method_name = lv_method ).
    IF lv_time_start IS INITIAL.
      GET RUN TIME FIELD lv_time_start.
    ENDIF.



**********************************************************************
*   Get the Data
**********************************************************************
*   Expand
    IF lv_expand_string IS NOT INITIAL.
      " create a data container which contains the deep structure
      " if application completely self expands it is an unnecessary step...
      " it is impossible to predict whether application can fully handly expand
      cr_entityset = lo_expand_tree->create_data_container( iv_is_expand = abap_true ).

      read_expanded_entityset(
        EXPORTING
          iv_entity_name           = ls_request_context-target_entity
          iv_tech_entity_name      = ls_request_context-technical_request-target_entity_type
          iv_source_name           = ls_request_context-source_entity
          iv_filter_string         = lv_filter_string
          iv_search_string         = lv_search_string
          is_paging                = is_paging
          it_order                 = ls_request_context-order
          it_filter_select_options = ls_request_context-filter_select_options
          is_request_details       = ls_request_context
          io_expand_node           = lo_expand_root
          io_tech_request_context  = lo_request_obj
          iv_top_level_context     = abap_true
        CHANGING
          cr_entityset             = cr_entityset
          cs_response_context      = cs_response_context ).

      "Correct first skiptoken for self expand
      READ TABLE cs_response_context-expand_skiptokens INTO cs_response_context-skiptoken INDEX 1.

    ELSE.
*     Delta Request
      IF lo_request_obj->/iwbep/if_mgw_req_entityset~get_deltatoken( ) IS NOT INITIAL.
        me->/iwbep/if_mgw_appl_srv_runtime~get_entityset_delta(
          EXPORTING
            io_tech_request_context   = lo_request_obj
          IMPORTING
            er_entityset              = cr_entityset
            er_deleted_entityset      = cr_deleted_entityset
            es_response_context       = ls_response_context ).

*     Simple List
      ELSE.
        me->/iwbep/if_mgw_appl_srv_runtime~get_entityset(
          EXPORTING
            iv_entity_name            = iv_entity_name
            iv_entity_set_name        = ls_request_context-target_entity_set
            iv_source_name            = iv_source_name
            it_navigation_path        = ls_request_context-navigation_path
            is_paging                 = is_paging
            it_order                  = it_order
            it_filter_select_options  = ls_request_context-filter_select_options
            it_key_tab                = ls_request_context-key_tab
            iv_filter_string          = lv_filter_string
            iv_search_string          = lv_search_string
            io_tech_request_context   = lo_request_obj
          IMPORTING
            er_entityset              = cr_entityset
            es_response_context       = ls_response_context ).
      ENDIF.

      cs_response_context-appl_response_context = ls_response_context.

      " Add skiptoken to current expand
      APPEND cs_response_context-skiptoken TO cs_response_context-expand_skiptokens.
    ENDIF.



**********************************************************************
*   Post Processing
**********************************************************************
    lv_time_stop = mo_sutil_runtime->performance_stop( lv_time_start ).
    IF lv_time_stop IS INITIAL.
      GET RUN TIME FIELD lv_time_stop.
    ENDIF.

    me->add_performance_data(
      EXPORTING
        iv_method     = lv_method
        iv_time_start = lv_time_start
        iv_time_stop  = lv_time_stop ).


    " Set Session Flags for Local/Remote Handler
    mo_transaction_handler->set_soft_state_session_info(
      iv_session_start = mv_soft_state_session_start
      iv_session_end   = mv_soft_state_session_end ).


    IF mv_batch_deferred_resp_crea EQ abap_true.
      ls_batch_operation_buffer-operation_id   = ls_request_context-technical_request-batch_info-operation_id.
      ls_batch_operation_buffer-operation_type = /iwbep/if_mgw_appl_types=>gcs_operation_type-get_entityset.
      ls_batch_operation_buffer-model          = lo_model.
      ls_batch_operation_buffer-request_obj    = lo_request_obj->clone( ).
      ls_batch_operation_buffer-expand_root    = lo_expand_root.
      ls_batch_operation_buffer-msg_container  = create_msg_container_and_merge( ).
      INSERT ls_batch_operation_buffer INTO TABLE mt_batch_operation_buffer.
      ASSERT sy-subrc EQ 0.

      CLEAR cr_entityset.
      CLEAR cr_deleted_entityset.
      CLEAR cs_response_context.
      RETURN.
    ENDIF.


    post_process_read_entityset(
      EXPORTING
        io_model                     = lo_model
        io_expand_root               = lo_expand_root
        io_request_obj               = lo_request_obj
        it_header                    = mt_headers
      CHANGING
        cv_response_body             = cv_response_body
        ct_header                    = ct_headers
        cr_entityset                 = cr_entityset
        cr_deleted_entityset         = cr_deleted_entityset
        cs_response_context          = cs_response_context
        ct_inline_info               = ct_inline_info ).

  ENDMETHOD.


  METHOD /iwbep/if_mgw_core_srv_runtime~read_stream.

    DATA: lv_class_name        TYPE string,
          lo_request_obj       TYPE REF TO /iwbep/cl_mgw_request,
          ls_request_context   TYPE /iwbep/if_mgw_core_srv_runtime=>ty_s_mgw_request_context,
          lv_if_modified_since TYPE tzntstmps,
          ls_response_context  TYPE /iwbep/if_mgw_appl_srv_runtime=>ty_s_mgw_response_entity_cntxt.

    DATA: lv_time_start TYPE i,
          lv_time_stop  TYPE i.

    set_headers( CHANGING ct_headers = ct_headers ).

* Create Technical Request Object
    ls_request_context = is_request_details.
    lo_request_obj = create_request_object(
                       it_headers         = ct_headers
                       is_request_details = ls_request_context
                     ).

* Create Key Converters
    me->create_key_converters(
      CHANGING
        cs_request_context = ls_request_context
    ).

    IF mo_sutil_runtime IS NOT BOUND.
      mo_sutil_runtime = /iwbep/cl_sutil_runtime=>get_instance( ).
    ENDIF.

    IF mv_provider_class IS INITIAL.
      lv_class_name = cl_abap_classdescr=>get_class_name( me ).
      SHIFT lv_class_name BY 7 PLACES.
      mv_provider_class = lv_class_name.
    ENDIF.

    lv_time_start = mo_sutil_runtime->performance_start(
                      iv_class_name  = mv_provider_class
                      iv_method_name = '/IWBEP/IF_MGW_APPL_SRV_RUNTIME~GET_STREAM'
                    ).
    IF lv_time_start IS INITIAL.
      GET RUN TIME FIELD lv_time_start.
    ENDIF.

    /iwbep/if_mgw_appl_srv_runtime~get_stream(
      EXPORTING
        iv_entity_name            = iv_entity_name
        iv_source_name            = iv_source_name
        iv_entity_set_name        = ls_request_context-target_entity_set
        it_key_tab                = ls_request_context-key_tab
        it_navigation_path        = ls_request_context-navigation_path
        io_tech_request_context   = lo_request_obj
      IMPORTING
        er_stream                 = cr_stream
        es_response_context       = ls_response_context ).
    cs_response_context-appl_response_context = ls_response_context.

    lv_time_stop = mo_sutil_runtime->performance_stop( lv_time_start ).
    IF lv_time_stop IS INITIAL.
      GET RUN TIME FIELD lv_time_stop.
    ENDIF.

    me->add_performance_data(
      iv_method     = '/IWBEP/IF_MGW_APPL_SRV_RUNTIME~GET_STREAM'
      iv_time_start = lv_time_start
      iv_time_stop  = lv_time_stop
    ).



    " Set Session Flags for Local/Remote Handler
    mo_transaction_handler->set_soft_state_session_info(
      iv_session_start = mv_soft_state_session_start
      iv_session_end   = mv_soft_state_session_end
    ).

    ct_headers = mt_headers.

    "Common handling and checks for Cache-Control and If-Modified-Since
    lv_if_modified_since = lo_request_obj->/iwbep/if_mgw_req_entity~get_if_modified_since( ).
    /iwbep/cl_mgw_dp_util=>handle_cache_control(
      EXPORTING
        iv_if_modified_since     = lv_if_modified_since
        io_provider              = me
        it_header                = mt_headers
      CHANGING
        cs_response_entity_cntxt = cs_response_context ).

* Data does not need to be sent in case not modidied
    IF cs_response_context-is_not_modified EQ /iwbep/if_mgw_appl_types=>gcs_modification_status-is_not_modified.
      CLEAR cr_stream.
    ENDIF.

  ENDMETHOD.


  METHOD /iwbep/if_mgw_core_srv_runtime~session_is_terminated.

    " Nothing to do at that time

  ENDMETHOD.


  METHOD /iwbep/if_mgw_core_srv_runtime~set_context.

    mo_context = io_context.

  ENDMETHOD.


  METHOD /iwbep/if_mgw_core_srv_runtime~update_entity.

    DATA: lo_entity_descriptor  TYPE REF TO /iwbep/cl_mgw_expand_node,
          lo_model              TYPE REF TO /iwbep/if_mgw_odata_fw_model,
          lo_request_obj        TYPE REF TO /iwbep/cl_mgw_request,
          lo_struct_descr       TYPE REF TO cl_abap_structdescr,
          lo_data_provider      TYPE REF TO /iwbep/cl_mgw_entry_raw_prv,
          lv_supports_move_corr TYPE abap_bool,
          lr_target_struct      TYPE REF TO data,
          ls_media_resource     TYPE ty_s_media_resource,
          lv_model_no_conv      TYPE abap_bool,
          lo_type_descr         TYPE REF TO cl_abap_typedescr,
          ls_request_context    TYPE /iwbep/if_mgw_core_srv_runtime=>ty_s_mgw_request_context,
          lv_operation_type     TYPE /iwbep/mgw_operation_type.

    DATA: lv_time_start TYPE i,
          lv_time_stop  TYPE i.

    FIELD-SYMBOLS:
      <ls_source_structure> TYPE any,
      <ls_target_structure> TYPE any.

    DATA: lv_cond_hndl_active    TYPE abap_bool.


* Create Technical Request Object
    ls_request_context = is_request_details.

* set conditional operation type for update entity / update stream
    IF ls_request_context-type EQ gcs_request_types-stream.
      ls_request_context-technical_request-operation_type = /iwbep/if_mgw_appl_types=>gcs_operation_type-update_stream.
    ELSE.
      IF ls_request_context-technical_request-components IS INITIAL.
        ls_request_context-technical_request-operation_type = /iwbep/if_mgw_appl_types=>gcs_operation_type-update_entity.
      ELSE.
        ls_request_context-technical_request-operation_type = /iwbep/if_mgw_appl_types=>gcs_operation_type-patch_entity.
      ENDIF.
    ENDIF.

    lo_request_obj = create_request_object(
                       it_headers          = ct_headers
                       is_request_details  = ls_request_context
                     ).

    IF ls_request_context-technical_request-conditions IS NOT INITIAL AND
       mv_changeset EQ abap_false. "changeset etag logic is in changeset_begin

      lv_cond_hndl_active = me->/iwbep/if_mgw_appl_srv_runtime~get_is_conditional_implemented(
                                    iv_operation_type  = ls_request_context-technical_request-operation_type
                                    iv_entity_set_name = ls_request_context-target_entity_set  ).

      IF lv_cond_hndl_active <> abap_true.
        check_before_modification( EXPORTING iv_entity_name      = iv_entity_name
                                             iv_source_name      = iv_source_name
                                             is_request_details  = ls_request_context
                                             it_headers          = ct_headers ).
      ENDIF.
    ENDIF.

    IF mv_changeset_defer_mode = abap_false.
      set_headers( CHANGING ct_headers = ct_headers ).
    ENDIF.

    lo_entity_descriptor = get_entity_descriptor(
      is_request_details = is_request_details
      iv_multiplicity    = /iwbep/if_mgw_med_odata_types=>gcs_cardinality-cardinality_1_1
    ).

    IF ls_request_context-technical_request-expand_root IS NOT BOUND.
      " Save EXPAND_ROOT for GET_SELECT_xxx
      ls_request_context-technical_request-expand_root = lo_entity_descriptor.
    ENDIF.

    lo_entity_descriptor->is_move_corr_supported(
                     IMPORTING ev_supports_move_corr = lv_supports_move_corr ).

* Create Key Converters
    me->create_key_converters(
      CHANGING
        cs_request_context = ls_request_context
    ).

    lo_model = me->get_model( ).

    " Stream
    IF ls_request_context-type EQ gcs_request_types-stream.

      io_data_provider->read_entry_data(
        IMPORTING
          es_data = ls_media_resource
      ).

      " Deferred Processing: Just add operation to CHANGESET_HELPER
      IF mv_changeset_defer_mode = abap_true.
        mo_changeset_helper->add_operation(
          EXPORTING
            iv_operation_type    = /iwbep/if_mgw_appl_types=>gcs_operation_type-update_stream
            it_header            = ct_headers
            is_request_context   = ls_request_context
            io_model             = lo_model
            io_provider_context  = mo_context
            is_media_resource    = ls_media_resource
            io_entity_descriptor = lo_entity_descriptor
        ).
        RETURN.
      ELSEIF ls_request_context-technical_request-batch_info-content_id_ref IS NOT INITIAL.
        "Content referencing is only allowed for changeset at once (defer mode)
        RAISE EXCEPTION TYPE /iwbep/cx_mgw_tech_exception
          EXPORTING
            textid = /iwbep/cx_mgw_tech_exception=>changeset_with_content_id.
      ENDIF.

      lv_time_start = mo_sutil_runtime->performance_start(
                        iv_class_name  = mv_provider_class
                        iv_method_name = '/IWBEP/IF_MGW_APPL_SRV_RUNTIME~UPDATE_STREAM'
                      ).
      IF lv_time_start IS INITIAL.
        GET RUN TIME FIELD lv_time_start.
      ENDIF.

      me->/iwbep/if_mgw_appl_srv_runtime~update_stream(
        EXPORTING
          iv_entity_name          = iv_entity_name
          iv_entity_set_name      = ls_request_context-target_entity_set
          iv_source_name          = iv_source_name
          is_media_resource       = ls_media_resource
          it_key_tab              = ls_request_context-key_tab
          it_navigation_path      = ls_request_context-navigation_path
          io_tech_request_context = lo_request_obj
      ).

      lv_time_stop = mo_sutil_runtime->performance_stop( lv_time_start ).
      IF lv_time_stop IS INITIAL.
        GET RUN TIME FIELD lv_time_stop.
      ENDIF.

      me->add_performance_data(
        iv_method     = '/IWBEP/IF_MGW_APPL_SRV_RUNTIME~UPDATE_STREAM'
        iv_time_start = lv_time_start
        iv_time_stop  = lv_time_stop
      ).

    ELSE.

*---casting for conversion exits to set entity descriptor for entry provider
      lo_data_provider ?= io_data_provider.
      lv_model_no_conv = lo_model->get_no_conversion( ).
      lo_data_provider->set_model_no_conversion( lv_model_no_conv ).
      lo_data_provider->set_entity_descriptor( lo_entity_descriptor ).

      " Deferred Processing: Just add operation to CHANGESET_HELPER
      IF mv_changeset_defer_mode = abap_true.
        IF ls_request_context-technical_request-components IS INITIAL.
          lv_operation_type = /iwbep/if_mgw_appl_types=>gcs_operation_type-update_entity.
        ELSE.
          lv_operation_type = /iwbep/if_mgw_appl_types=>gcs_operation_type-patch_entity.
        ENDIF.
        mo_changeset_helper->add_operation(
          EXPORTING
            iv_operation_type    = lv_operation_type
            it_header            = ct_headers
            is_request_context   = ls_request_context
            io_model             = lo_model
            io_provider_context  = mo_context
            io_entry_provider    = lo_data_provider
            io_entity_descriptor = lo_entity_descriptor
        ).
        RETURN.
      ELSEIF ls_request_context-technical_request-batch_info-content_id_ref IS NOT INITIAL.
        "Content referencing is only allowed for changeset at once (defer mode)
        RAISE EXCEPTION TYPE /iwbep/cx_mgw_tech_exception
          EXPORTING
            textid = /iwbep/cx_mgw_tech_exception=>changeset_with_content_id.
      ENDIF.

      /iwbep/cl_mgw_data_conv_util=>set_model( EXPORTING io_model =  mo_model ).
*---check whether it is an update with a merge semantic (MERGE, PATCH) or a simple update
      IF ls_request_context-technical_request-components IS INITIAL.

        lv_time_start = mo_sutil_runtime->performance_start(
                          iv_class_name  = mv_provider_class
                          iv_method_name = '/IWBEP/IF_MGW_APPL_SRV_RUNTIME~UPDATE_ENTITY'
                        ).
        IF lv_time_start IS INITIAL.
          GET RUN TIME FIELD lv_time_start.
        ENDIF.

        me->/iwbep/if_mgw_appl_srv_runtime~update_entity(
          EXPORTING
            iv_entity_name          = iv_entity_name
            iv_entity_set_name      = ls_request_context-target_entity_set
            iv_source_name          = iv_source_name
            io_data_provider        = lo_data_provider    " MGW Data Provider
            it_key_tab              = ls_request_context-key_tab
            it_navigation_path      = ls_request_context-navigation_path
            io_tech_request_context = lo_request_obj
          IMPORTING
            er_entity               = cr_entity
        ).

        lv_time_stop = mo_sutil_runtime->performance_stop( lv_time_start ).
        IF lv_time_stop IS INITIAL.
          GET RUN TIME FIELD lv_time_stop.
        ENDIF.

        me->add_performance_data(
          iv_method     = '/IWBEP/IF_MGW_APPL_SRV_RUNTIME~UPDATE_ENTITY'
          iv_time_start = lv_time_start
          iv_time_stop  = lv_time_stop
        ).

      ELSE.

        lv_time_start = mo_sutil_runtime->performance_start(
                          iv_class_name  = mv_provider_class
                          iv_method_name = '/IWBEP/IF_MGW_APPL_SRV_RUNTIME~PATCH_ENTITY'
                        ).
        IF lv_time_start IS INITIAL.
          GET RUN TIME FIELD lv_time_start.
        ENDIF.

        me->/iwbep/if_mgw_appl_srv_runtime~patch_entity(
          EXPORTING
            iv_entity_name          = iv_entity_name
            iv_entity_set_name      = ls_request_context-target_entity_set
            iv_source_name          = iv_source_name
            io_data_provider        = lo_data_provider    " MGW Data Provider
            it_key_tab              = ls_request_context-key_tab
            it_navigation_path      = ls_request_context-navigation_path
            io_tech_request_context = lo_request_obj
          IMPORTING
            er_entity               = cr_entity
        ).

        lv_time_stop = mo_sutil_runtime->performance_stop( lv_time_start ).
        IF lv_time_stop IS INITIAL.
          GET RUN TIME FIELD lv_time_stop.
        ENDIF.

        me->add_performance_data(
          iv_method     = '/IWBEP/IF_MGW_APPL_SRV_RUNTIME~PATCH_ENTITY'
          iv_time_start = lv_time_start
          iv_time_stop  = lv_time_stop
        ).

      ENDIF.



      " Set Session Flags for Local/Remote Handler
      mo_transaction_handler->set_soft_state_session_info(
        iv_session_start = mv_soft_state_session_start
        iv_session_end   = mv_soft_state_session_end
      ).

      IF cr_entity IS BOUND.

*   if cr_entity is bound it has to be a struct/flat type - nothing else is allowed here
        lo_type_descr = cl_abap_typedescr=>describe_by_data_ref( cr_entity ).
        IF ( lo_type_descr->kind <> cl_abap_typedescr=>kind_struct ) AND
           ( lo_type_descr->kind <> cl_abap_typedescr=>kind_elem ).
          DATA: lv_type_expected TYPE string.
          lv_type_expected = TEXT-str.
          RAISE EXCEPTION TYPE /iwbep/cx_mgw_tech_exception
            EXPORTING
              textid        = /iwbep/cx_mgw_tech_exception=>wrong_data_container
              type_expected = lv_type_expected.
        ENDIF.

        ASSIGN cr_entity->* TO <ls_source_structure>.

        lo_struct_descr ?= lo_entity_descriptor->create_data_descriptor( iv_is_for_hub = abap_true ).
        CREATE DATA lr_target_struct TYPE HANDLE lo_struct_descr.
        ASSIGN lr_target_struct->* TO <ls_target_structure>.

        lv_model_no_conv = lo_model->get_no_conversion( ).

        IF lv_model_no_conv = abap_false.
          lo_entity_descriptor->check_conversions( ).
          IF lo_entity_descriptor->get_no_conversion( ) = abap_false.
            /iwbep/cl_mgw_data_helper=>convert_entity_outb(
              EXPORTING
                io_expand_node      = lo_entity_descriptor
                is_source_structure = <ls_source_structure>
                iv_supports_move_corr = lv_supports_move_corr
              CHANGING
                cs_target_structure = <ls_target_structure> ).
          ELSE.
            move_corresponding(
              EXPORTING
                id_source_data = <ls_source_structure>
                iv_supports_move_corr = abap_false
              IMPORTING
                ed_target_data = <ls_target_structure> ).
          ENDIF.
        ELSE.
          move_corresponding(
             EXPORTING
               id_source_data = <ls_source_structure>
               iv_supports_move_corr = abap_false
             IMPORTING
               ed_target_data = <ls_target_structure> ).
        ENDIF.
        cr_entity = lr_target_struct.
      ENDIF.
    ENDIF.

    ct_headers = mt_headers.

  ENDMETHOD.


  METHOD /iwbep/if_mgw_sost_srv_runtime~operation_end.

* in order to run the corresponding service in the softstate mode you should implement:
* 1. this method.
*    This method is called after an actual operation.
* 2. the method /IWBEP/IF_MGW_SOST_SRV_RUNTIME~OPERATION_START of your DPC.
*    The method is called before an actual operation of the /IWBEP/IF_MGW_APPL_SRV_RUNTIME interface.


    RAISE EXCEPTION TYPE /iwbep/cx_mgw_tech_exception
      EXPORTING
        textid      = /iwbep/cx_mgw_busi_exception=>soft_state_not_supported
        sap_note_id = '1986626'.


  ENDMETHOD.


  METHOD /iwbep/if_mgw_sost_srv_runtime~operation_start.
* in order to run the corresponding service in the softstate mode you should implement:
* 1. this method.
*    The method is called before an actual operation of the /IWBEP/IF_MGW_APPL_SRV_RUNTIME interface.
* 2. the method /IWBEP/IF_MGW_SOST_SRV_RUNTIME~OPERATION_END of your DPC.
*    This method is called after an actual operation.
*

    RAISE EXCEPTION TYPE /iwbep/cx_mgw_tech_exception
      EXPORTING
        textid      = /iwbep/cx_mgw_busi_exception=>soft_state_not_supported
        sap_note_id = '1986626'.

  ENDMETHOD.


  METHOD /iwbep/if_mgw_sost_srv_runtime~reset_dp.
* Reset is called by the GW Framework before Operation_start in dedicated situations:
* e.g a wrong application server session has been assigned to the current request.
* Here the application has to make sure that the resources buffered in the subsequent systems
* are freed and do not lead to any erroneous or inconsistent state on the IW_BEP or IW_FND system.


    RAISE EXCEPTION TYPE /iwbep/cx_mgw_tech_exception
      EXPORTING
        textid      = /iwbep/cx_mgw_busi_exception=>soft_state_not_supported
        sap_note_id = '1986626'.

  ENDMETHOD.


  METHOD add_performance_data.

    DATA: lv_agent         TYPE char40,
          lv_class         TYPE string,
          ls_hub_perf_data TYPE /iwbep/sutil_hub_perf_data,
          lo_sutil_runtime TYPE REF TO /iwbep/cl_sutil_runtime.

    IF iv_class IS NOT INITIAL.
      lv_class = iv_class.
    ELSE.
      lv_class = mv_provider_class.
    ENDIF.

    IF iv_agent IS NOT INITIAL.
      lv_agent = iv_agent.
    ELSE.
      lv_agent = mc_agent.
    ENDIF.

    ls_hub_perf_data-source_class  = lv_class.
    ls_hub_perf_data-source_method = iv_method.
    ls_hub_perf_data-agent         = lv_agent.
    ls_hub_perf_data-time_start    = iv_time_start.
    ls_hub_perf_data-time_stop     = iv_time_stop.

    lo_sutil_runtime = /iwbep/cl_sutil_runtime=>get_instance( ).

    lo_sutil_runtime->hub_perf_add_call_app( ls_hub_perf_data ).

  ENDMETHOD.


  METHOD add_sap_origin_entity.

    FIELD-SYMBOLS:
      <lv_property> TYPE any.

    IF is_request_details-technical_request-co_deployment_info-is_moc EQ abap_true AND
       is_request_details-system_alias_info-system_alias IS NOT INITIAL.

      ASSIGN COMPONENT /iwbep/if_mgw_core_types=>gc_sap_origin
           OF STRUCTURE cs_entity
           TO           <lv_property>.
      <lv_property> = is_request_details-system_alias_info-system_alias.

    ENDIF.

  ENDMETHOD.


  METHOD add_sap_origin_entityset.

    FIELD-SYMBOLS:
      <ls_entity>   TYPE any,
      <lv_property> TYPE any.

    IF is_request_details-technical_request-co_deployment_info-is_moc EQ abap_true AND
       is_request_details-system_alias_info-system_alias IS NOT INITIAL.

      LOOP AT ct_entityset ASSIGNING <ls_entity>.
        ASSIGN COMPONENT /iwbep/if_mgw_core_types=>gc_sap_origin
             OF STRUCTURE <ls_entity>
             TO           <lv_property>.
        <lv_property> = is_request_details-system_alias_info-system_alias.
      ENDLOOP.

    ENDIF.

  ENDMETHOD.


  METHOD check_before_modification.

    DATA: ls_request_details       TYPE /iwbep/if_mgw_core_srv_runtime=>ty_s_mgw_request_context,
          lo_entity_descriptor     TYPE REF TO /iwbep/cl_mgw_expand_node,
          lr_entity                TYPE REF TO data,
          lt_headers               TYPE tihttpnvp,
          lx_busi_exception        TYPE REF TO /iwbep/cx_mgw_busi_exception,
          lr_request_details       TYPE REF TO /iwbep/if_mgw_core_srv_runtime=>ty_s_mgw_request_context,
          ls_response_context_core TYPE /iwbep/if_mgw_core_srv_runtime=>ty_s_mgw_response_entity_cntxt.


    DATA: lv_not_found      TYPE abap_bool,
          lv_precond_failed TYPE abap_bool,
          lv_if_match       TYPE abap_bool,
          lv_if_none_match  TYPE abap_bool.

    FIELD-SYMBOLS: <ls_entity_structure>  TYPE any.

    lr_request_details = mr_request_details.
    ls_request_details = is_request_details.
    lt_headers         = it_headers.

    me->/iwbep/if_mgw_core_srv_runtime~read_entity(
      EXPORTING
        iv_entity_name       = iv_entity_name
        iv_source_name       = iv_source_name
        is_request_details   = is_request_details
      CHANGING
        cr_entity            = lr_entity
        ct_headers           = lt_headers
        cs_response_context  = ls_response_context_core
    ).
*    ls_response_context-

    mr_request_details = lr_request_details.

    IF lr_entity IS NOT BOUND.
      lv_not_found = abap_true.
    ELSE.
      lo_entity_descriptor = get_entity_descriptor( is_request_details = ls_request_details
                                                    iv_multiplicity    = /iwbep/if_mgw_med_odata_types=>gcs_cardinality-cardinality_1_1 ).
      ASSIGN lr_entity->* TO <ls_entity_structure>.

      IF <ls_entity_structure> IS INITIAL.
        lv_not_found = abap_true.
      ELSE.

*     check if_match
        "if etag table is empty set always matched to true
        IF ls_request_details-technical_request-conditions-if_match IS INITIAL.
          lv_if_match = abap_true.
        ELSE.
          "check for '*' tags -> no further processing required if found
          READ TABLE ls_request_details-technical_request-conditions-if_match
            WITH KEY any_value = abap_true TRANSPORTING NO FIELDS. "#EC CI_STDSEQ
          IF sy-subrc = 0.
            lv_if_match = abap_true.
          ELSE.
            lv_if_match = check_etag_match( io_expand_node      = lo_entity_descriptor
                                            is_entity_structure = <ls_entity_structure>
                                            it_etag             = ls_request_details-technical_request-conditions-if_match ).
          ENDIF.
        ENDIF.

*     check if_none_match
        IF lv_if_match EQ abap_true AND
           ls_request_details-technical_request-conditions-if_none_match IS NOT INITIAL.
          "check for '*' tags -> no further processing required if found
          READ TABLE ls_request_details-technical_request-conditions-if_none_match
            WITH KEY any_value = abap_true TRANSPORTING NO FIELDS. "#EC CI_STDSEQ
          IF sy-subrc <> 0.
            lv_if_none_match = check_etag_match( io_expand_node      = lo_entity_descriptor
                                                is_entity_structure = <ls_entity_structure>
                                                it_etag             = ls_request_details-technical_request-conditions-if_none_match ).
          ENDIF.
        ENDIF.

        IF lv_if_match EQ abap_false OR
           lv_if_none_match EQ abap_true.
          lv_precond_failed = abap_true.
        ENDIF.
      ENDIF.
    ENDIF.

    IF lv_not_found EQ abap_true.
      IF ls_response_context_core-is_not_modified EQ abap_true.
        lv_precond_failed = abap_true.
      ELSE.
        CREATE OBJECT lx_busi_exception
          TYPE
          /iwbep/cx_mgw_busi_exception
          EXPORTING
            http_status_code = /iwbep/cx_mgw_busi_exception=>gcs_http_status_codes-not_found
            textid           = /iwbep/cx_mgw_busi_exception=>resource_not_found
            entity_type      = iv_entity_name.
        RAISE EXCEPTION lx_busi_exception.
      ENDIF.
    ENDIF.

    IF lv_precond_failed EQ abap_true.
      CREATE OBJECT lx_busi_exception
        TYPE
        /iwbep/cx_mgw_busi_exception
        EXPORTING
          http_status_code = /iwbep/cx_mgw_busi_exception=>gcs_http_status_codes-precondition_failed
          textid           = /iwbep/cx_mgw_busi_exception=>precondition_failed.
      RAISE EXCEPTION lx_busi_exception.
    ENDIF.

  ENDMETHOD.


  METHOD check_etag_match.

    DATA: ls_property TYPE /iwbep/if_mgw_odata_fw_prop=>ty_s_mgw_odata_property,
          lt_property TYPE /iwbep/if_mgw_odata_fw_prop=>ty_t_mgw_odata_properties.

    DATA: lv_is_etag       TYPE abap_bool,
          lv_abap_name     TYPE string,
          lv_internal_type TYPE abap_typekind.

    DATA: lt_etag TYPE /iwbep/if_mgw_core_types=>ty_t_etag,
          ls_etag TYPE /iwbep/if_mgw_core_types=>ty_s_etag.

    DATA: lt_tag_curr_value TYPE /iwbep/if_mgw_core_types=>ty_t_etag_value,
          ls_tag_value      TYPE /iwbep/if_mgw_core_types=>ty_s_etag_value.

    FIELD-SYMBOLS: <lv_prop_component>  TYPE any.

    rv_matched = abap_false.

    lt_etag = it_etag.

* Get properties
    lt_property = io_expand_node->get_properties( ).

* loop over the etag signed properties and check etag table
    LOOP AT lt_property INTO ls_property.

      lv_is_etag  = ls_property-property->is_etag( ).

      IF lv_is_etag IS INITIAL.
        CONTINUE.
      ENDIF.

      lv_abap_name     = ls_property-property->get_abap_name( ).
      lv_internal_type = ls_property-property->/iwbep/if_mgw_odata_re_prop~get_internal_type( ).

      ASSIGN COMPONENT lv_abap_name OF STRUCTURE is_entity_structure TO <lv_prop_component>.
      IF sy-subrc EQ 0.
        ls_tag_value-name  = lv_abap_name.
        ls_tag_value-value = <lv_prop_component>.
        IF lv_internal_type EQ 'P'.
          CONDENSE ls_tag_value-value.
        ENDIF.
        APPEND ls_tag_value TO lt_tag_curr_value.
      ENDIF.

    ENDLOOP.

    SORT lt_tag_curr_value.

* check for etag
    LOOP AT lt_etag INTO ls_etag.
      SORT ls_etag-tag_values.
      IF ls_etag-tag_values EQ lt_tag_curr_value.
        rv_matched = abap_true.
        RETURN.
      ENDIF.
    ENDLOOP.


  ENDMETHOD.


  METHOD class_constructor.

    "Get Gateway Runtime Utility 7.50 if possible
    IF go_rt_utility_750 IS NOT BOUND.
      IF /iwbep/cl_class_util=>does_class_exist( /iwbep/if_rt_utility_750=>gcv_rt_utility_750_impl ) EQ abap_true.
        CREATE OBJECT go_rt_utility_750 TYPE (/iwbep/if_rt_utility_750=>gcv_rt_utility_750_impl).
      ENDIF.
    ENDIF.

  ENDMETHOD.


  METHOD convert_action_data.

    DATA: lo_model               TYPE REF TO /iwbep/if_mgw_odata_fw_model,
          lo_action              TYPE REF TO /iwbep/if_mgw_odata_fw_action,
          lo_complex_type        TYPE REF TO /iwbep/if_mgw_odata_fw_cplxtyp,
          lr_target_struct       TYPE REF TO data,
          lr_target_table        TYPE REF TO data,
          lo_type_descr          TYPE REF TO cl_abap_typedescr,
          lo_struct_descr        TYPE REF TO cl_abap_structdescr,
          lo_table_descr         TYPE REF TO cl_abap_tabledescr,
          lo_expand_tree         TYPE REF TO /iwbep/cl_mgw_expand_tree,
          lo_expand_root         TYPE REF TO /iwbep/cl_mgw_expand_node,
          lo_mgw_request         TYPE REF TO /iwbep/cl_mgw_request,
          lv_action_name         TYPE /iwbep/mgw_tech_name,
          lv_action_name_string  TYPE string,
          ls_request_context     TYPE /iwbep/if_mgw_core_srv_runtime=>ty_s_mgw_request_context,
          lv_entity_type         TYPE string,
          lv_type_expected       TYPE string,
          lv_tech_entity_type    TYPE /iwbep/mgw_tech_name,
          lv_complex_type        TYPE /iwbep/if_mgw_med_odata_types=>ty_e_med_entity_name,
          lv_multiplicity        TYPE /iwbep/if_mgw_med_odata_types=>ty_e_med_cardinality,
          lo_entity              TYPE REF TO /iwbep/if_mgw_odata_fw_etype,
          lv_supports_move_corr  TYPE abap_bool,
          lv_not_supp_prop_found TYPE abap_bool,
          lv_model_no_conv       TYPE abap_bool,
          lv_expand_no_conv      TYPE abap_bool.

    FIELD-SYMBOLS:
      <ls_source_structure> TYPE any,
      <ls_target_structure> TYPE any,
      <ls_entity>           TYPE any,
      <lt_source_table>     TYPE ANY TABLE,
      <lt_target_table>     TYPE ANY TABLE.


    lo_model = me->get_model( ).

    lo_mgw_request    ?= cr_changeset_data->*-request_context.
    ls_request_context = lo_mgw_request->get_request_details( ).
    lv_action_name     = lv_action_name_string = ls_request_context-technical_request-action_name.

    lo_action           = lo_model->get_action( lv_action_name ).
    lv_complex_type     = lo_action->get_return_complex_type( ).
    lv_entity_type      =  lo_action->get_return_entity_type( ).
    lv_tech_entity_type = lo_action->get_tech_return_entity_type( ).
    lv_multiplicity     = lo_action->get_return_multiplicity( ).

    IF ir_entity_data IS NOT BOUND.
      "If cr_data is not bound check for following issue:
      "Function Imports with cardinality 0..1 and an entity type as return type can cause an error
      "when no data is returned and the entity type has certain key fields (details see note 2009874)
      IF lv_complex_type IS INITIAL AND
         lv_entity_type IS NOT INITIAL AND
         lv_multiplicity EQ /iwbep/if_mgw_med_odata_types=>gcs_cardinality-cardinality_0_1.
        lo_entity = lo_model->get_entity_type_by_tech_name( lv_tech_entity_type ).
        lv_not_supp_prop_found = lo_entity->check_problematic_key_fields( ).
        IF lv_not_supp_prop_found EQ abap_true.
          RAISE EXCEPTION TYPE /iwbep/cx_mgw_tech_exception
            EXPORTING
              textid      = /iwbep/cx_mgw_tech_exception=>function_import_card_0_1
              entity_type = lv_entity_type
              action      = lv_action_name_string
              sap_note_id = gc_note_id_func_import_0_1.
        ENDIF.
      ENDIF.

      " Further checks for cardinality 1..1 and 1..n
      IF lv_complex_type IS INITIAL     AND
         lv_entity_type  IS NOT INITIAL AND
         ( lv_multiplicity = /iwbep/if_mgw_med_odata_types=>gcs_cardinality-cardinality_1_1 OR
           lv_multiplicity = /iwbep/if_mgw_med_odata_types=>gcs_cardinality-cardinality_1_n
         ).
        IF ls_request_context-http_method = 'GET'.
          RAISE EXCEPTION TYPE /iwbep/cx_mgw_busi_exception
            EXPORTING
              textid           = /iwbep/cx_mgw_busi_exception=>resource_not_found
              entity_type      = lv_entity_type
              http_status_code = /iwbep/cx_mgw_busi_exception=>gcs_http_status_codes-not_found.
        ELSEIF ls_request_context-http_method = 'POST'.
          RAISE EXCEPTION TYPE /iwbep/cx_mgw_tech_exception
            EXPORTING
              textid           = /iwbep/cx_mgw_tech_exception=>no_business_data_returned
              http_status_code = /iwbep/cx_mgw_tech_exception=>gcs_http_status_codes-internal_server_error.
        ENDIF.
      ENDIF.
      EXIT.
    ENDIF.

*   check if cardinality of function return (structure or table) is correct
    CASE lv_multiplicity.
      WHEN /iwbep/if_mgw_med_odata_types=>gcs_cardinality-cardinality_0_1 OR
           /iwbep/if_mgw_med_odata_types=>gcs_cardinality-cardinality_1_1.
        lo_type_descr = cl_abap_typedescr=>describe_by_data_ref( ir_entity_data ).
        IF ( lo_type_descr->kind <> cl_abap_typedescr=>kind_struct ) AND
           ( lo_type_descr->kind <> cl_abap_typedescr=>kind_elem ).
          lv_type_expected = TEXT-str.
          RAISE EXCEPTION TYPE /iwbep/cx_mgw_tech_exception
            EXPORTING
              textid        = /iwbep/cx_mgw_tech_exception=>wrong_data_container
              type_expected = lv_type_expected.
        ENDIF.

      WHEN /iwbep/if_mgw_med_odata_types=>gcs_cardinality-cardinality_0_n OR
           /iwbep/if_mgw_med_odata_types=>gcs_cardinality-cardinality_1_n.
        lo_type_descr = cl_abap_typedescr=>describe_by_data_ref( ir_entity_data ).
        IF lo_type_descr->kind <> cl_abap_typedescr=>kind_table.
          lv_type_expected = TEXT-tab.
          RAISE EXCEPTION TYPE /iwbep/cx_mgw_tech_exception
            EXPORTING
              textid        = /iwbep/cx_mgw_tech_exception=>wrong_data_container
              type_expected = lv_type_expected.
        ENDIF.
    ENDCASE.

    lv_model_no_conv = lo_model->get_no_conversion( ).

    IF lv_complex_type IS NOT INITIAL.

      lo_complex_type = lo_model->get_complex_type( lv_complex_type ).
      IF lv_model_no_conv = abap_false.
        lo_complex_type->check_conversions( ).
      ENDIF.
      lv_supports_move_corr = lo_complex_type->is_move_corr_supported( ).

      CASE lv_multiplicity.
        WHEN /iwbep/if_mgw_med_odata_types=>gcs_cardinality-cardinality_0_1 OR
            /iwbep/if_mgw_med_odata_types=>gcs_cardinality-cardinality_1_1.
          ASSIGN ir_entity_data->* TO <ls_source_structure>.
          lo_struct_descr ?= lo_complex_type->create_data_descriptor( iv_is_for_hub = abap_true ).
          IF lo_struct_descr IS NOT BOUND.
            lo_struct_descr ?= lo_complex_type->create_data_descriptor( iv_is_for_hub = abap_true
                                                                        iv_create_new = abap_true ).
          ENDIF.
          IF lo_struct_descr IS NOT BOUND.
            cr_changeset_data->*-entity_data = ir_entity_data.
          ELSE.
            CREATE DATA lr_target_struct TYPE HANDLE lo_struct_descr.
            ASSIGN lr_target_struct->* TO <ls_target_structure>.

            IF ( lv_model_no_conv = abap_false OR
                 lv_model_no_conv = abap_true )
                AND lo_complex_type->get_no_conversion( ) = abap_false.
              /iwbep/cl_mgw_data_helper=>convert_complex_property_outb(
                EXPORTING
                  io_complex_type = lo_complex_type
                  is_source_data  = <ls_source_structure>
                  iv_supports_move_corr = lv_supports_move_corr "for CT the support  for move_corr is calculated locally
                CHANGING
                  cs_target_data  = <ls_target_structure>
              ).
            ELSE.
              move_corresponding(
                EXPORTING
                  id_source_data = <ls_source_structure>
                  iv_supports_move_corr = abap_false
                IMPORTING
                  ed_target_data = <ls_target_structure>
              ).
            ENDIF.
            cr_changeset_data->*-entity_data = lr_target_struct.
          ENDIF.

        WHEN /iwbep/if_mgw_med_odata_types=>gcs_cardinality-cardinality_0_n OR
             /iwbep/if_mgw_med_odata_types=>gcs_cardinality-cardinality_1_n.
          ASSIGN ir_entity_data->* TO <lt_source_table>.
          lo_struct_descr ?= lo_complex_type->create_data_descriptor( iv_is_for_hub = abap_true ).
          IF lo_struct_descr IS NOT BOUND.
            lo_struct_descr ?= lo_complex_type->create_data_descriptor( iv_is_for_hub = abap_true
                                                                        iv_create_new = abap_true ).
          ENDIF.
          IF lo_struct_descr IS NOT BOUND.
            cr_changeset_data->*-entity_data = ir_entity_data.
          ELSE.
            lo_table_descr = cl_abap_tabledescr=>create( p_line_type = lo_struct_descr ).
            CREATE DATA lr_target_table TYPE HANDLE lo_table_descr.
            ASSIGN lr_target_table->* TO <lt_target_table>.

            IF  ( lv_model_no_conv = abap_false )
            AND ( lo_complex_type->get_no_conversion( ) = abap_false ).
              /iwbep/cl_mgw_data_helper=>convert_complex_property_outb(
                EXPORTING
                  io_complex_type = lo_complex_type
                  is_source_data  = <lt_source_table>
                  iv_supports_move_corr = lv_supports_move_corr "for CT the support  for move_corr is calculated locally
                CHANGING
                  cs_target_data = <lt_target_table>
              ).
            ELSE.
              move_corresponding(
                EXPORTING
                  id_source_data = <lt_source_table>
                  iv_supports_move_corr = abap_false
                IMPORTING
                  ed_target_data = <lt_target_table>
              ).
            ENDIF.
            cr_changeset_data->*-entity_data = lr_target_table.
          ENDIF.
      ENDCASE.

    ELSEIF lv_entity_type IS NOT INITIAL.
      lo_expand_tree = /iwbep/cl_mgw_expand_tree=>create(
          iv_entity_set       = ls_request_context-target_entity_set
          iv_tech_entity_set  = ls_request_context-technical_request-target_entity_set
          iv_entity_type      = lv_entity_type
          iv_tech_entity_type = lv_tech_entity_type
          iv_multiplicity     = lv_multiplicity
          iv_expand           = cr_changeset_data->*-expand_string
          iv_tech_expand      = cr_changeset_data->*-tech_expand_string
      ).

      lo_expand_tree->add_metadata( lo_model ).
      lo_expand_tree->get_root( IMPORTING eo_root = lo_expand_root ).
      IF lv_model_no_conv = abap_false.
        lo_expand_root->check_conversions( ).
      ENDIF.
      lv_expand_no_conv = lo_expand_root->get_no_conversion( ).

      CASE lv_multiplicity.
        WHEN /iwbep/if_mgw_med_odata_types=>gcs_cardinality-cardinality_0_1 OR
             /iwbep/if_mgw_med_odata_types=>gcs_cardinality-cardinality_1_1.
          ASSIGN ir_entity_data->* TO <ls_source_structure>.

          lo_struct_descr ?= lo_expand_root->create_data_descriptor( iv_is_for_hub = abap_true ).
          CREATE DATA lr_target_struct TYPE HANDLE lo_struct_descr.
          ASSIGN lr_target_struct->* TO <ls_target_structure>.

          IF lv_expand_no_conv = abap_false OR cr_changeset_data->*-expand_string IS NOT INITIAL.
            /iwbep/cl_mgw_data_helper=>convert_entity_outb(
              EXPORTING
                io_expand_node      = lo_expand_root
                is_source_structure = <ls_source_structure>
                iv_supports_move_corr = iv_supports_move_corr
              CHANGING
                cs_target_structure = <ls_target_structure>
            ).
          ELSE.
            move_corresponding(
              EXPORTING
                id_source_data = <ls_source_structure>
                iv_supports_move_corr = abap_false
              IMPORTING
                ed_target_data = <ls_target_structure>
            ).
          ENDIF.
          cr_changeset_data->*-entity_data = lr_target_struct.

          IF cr_changeset_data->*-expand_string IS NOT INITIAL.
*-------------expand the entity (recursively if required)
            expand_entity(
              EXPORTING
                io_expand_node              = lo_expand_root
                iv_source_entity_type       = lv_entity_type
                iv_tech_source_entity_type  = lv_tech_entity_type
                iv_tech_source_entity_set   = ls_request_context-technical_request-target_entity_set
                is_original_request_details = ls_request_context
                iv_supports_move_corr       = iv_supports_move_corr
              CHANGING
                cs_entity                  = <ls_target_structure>
            ).
          ENDIF.

        WHEN /iwbep/if_mgw_med_odata_types=>gcs_cardinality-cardinality_0_n OR
             /iwbep/if_mgw_med_odata_types=>gcs_cardinality-cardinality_1_n.
          ASSIGN ir_entity_data->* TO <lt_source_table>.

          lo_table_descr ?= lo_expand_root->create_data_descriptor( iv_is_for_hub = abap_true ).
          CREATE DATA lr_target_table TYPE HANDLE lo_table_descr.
          ASSIGN lr_target_table->* TO <lt_target_table>.

          IF lv_expand_no_conv = abap_false OR cr_changeset_data->*-expand_string IS NOT INITIAL.
            /iwbep/cl_mgw_data_helper=>convert_entityset_outb(
              EXPORTING
                io_expand_node  = lo_expand_root
                it_source_table = <lt_source_table>
                iv_supports_move_corr = iv_supports_move_corr
              CHANGING
                ct_target_table = <lt_target_table>
            ).
          ELSE.
            move_corresponding(
              EXPORTING
                id_source_data = <lt_source_table>
                iv_supports_move_corr = abap_false
              IMPORTING
                ed_target_data = <lt_target_table>
            ).
          ENDIF.
          cr_changeset_data->*-entity_data = lr_target_table.

          IF cr_changeset_data->*-expand_string IS NOT INITIAL.
            LOOP AT <lt_target_table> ASSIGNING <ls_entity>.
*---------------expand the entity (recursively if required)
              expand_entity(
                EXPORTING
                  io_expand_node              = lo_expand_root
                  iv_source_entity_type       = lv_entity_type
                  iv_tech_source_entity_type  = lv_tech_entity_type
                  iv_tech_source_entity_set   = ls_request_context-technical_request-target_entity_set
                  is_original_request_details = ls_request_context
                  iv_supports_move_corr       = iv_supports_move_corr
                CHANGING
                  cs_entity                  = <ls_entity>
              ).
            ENDLOOP.
          ENDIF.

      ENDCASE.

      " Initial Inlines Handling: Same order as passed in Request URL
      IF cr_changeset_data->*-expand_string IS NOT INITIAL.
        create_inline_info(
          EXPORTING
            io_expand_node = lo_expand_root
            ir_data        = cr_changeset_data->*-entity_data
          CHANGING
            ct_inline_info = cr_changeset_data->*-inline_infos
        ).
        sort_inline_info(
          EXPORTING
            iv_expand_string   = cr_changeset_data->*-expand_string
            iv_entity_set_name = ls_request_context-technical_request-target_entity_set
          CHANGING
            ct_inline_info     = cr_changeset_data->*-inline_infos
        ).
      ENDIF.

    ELSE.
      RAISE EXCEPTION TYPE /iwbep/cx_mgw_med_exception
        EXPORTING
          textid      = /iwbep/cx_mgw_med_exception=>action_inconsistent
          entity_name = lv_action_name.

    ENDIF.

  ENDMETHOD.


  METHOD convert_entity_data.

    DATA: lo_model         TYPE REF TO /iwbep/if_mgw_odata_fw_model,
          lo_struct_descr  TYPE REF TO cl_abap_structdescr,
          lr_target_struct TYPE REF TO data,
          lv_model_no_conv TYPE abap_bool.

    FIELD-SYMBOLS:
      <ls_source_structure> TYPE any,
      <ls_target_structure> TYPE any.


    IF ir_entity_data IS NOT BOUND. EXIT. ENDIF.

    lo_model = me->get_model( ).

    ASSIGN ir_entity_data->* TO <ls_source_structure>.

    lo_struct_descr ?= cr_changeset_data->*-entity_descriptor->create_data_descriptor( iv_is_for_hub = abap_true ).
    CREATE DATA lr_target_struct TYPE HANDLE lo_struct_descr.
    ASSIGN lr_target_struct->* TO <ls_target_structure>.

    lv_model_no_conv = lo_model->get_no_conversion( ).

    cr_changeset_data->*-entity_descriptor->check_conversions( ).

    IF  ( lv_model_no_conv = abap_false )
    AND ( cr_changeset_data->*-entity_descriptor->get_no_conversion( ) = abap_false ).
      /iwbep/cl_mgw_data_helper=>convert_entity_outb(
        EXPORTING
          io_expand_node      = cr_changeset_data->*-entity_descriptor
          is_source_structure = <ls_source_structure>
          iv_supports_move_corr = iv_supports_move_corr
        CHANGING
          cs_target_structure = <ls_target_structure>
      ).
    ELSE.
      move_corresponding(
        EXPORTING
          id_source_data = <ls_source_structure>
          iv_supports_move_corr = abap_false
        IMPORTING
          ed_target_data = <ls_target_structure>
      ).
    ENDIF.

    cr_changeset_data->*-entity_data = lr_target_struct.

  ENDMETHOD.


  METHOD convert_filter_select_options.

    DATA: lo_model              TYPE REF TO /iwbep/if_mgw_odata_fw_model,
          ls_odata_property     TYPE /iwbep/if_mgw_odata_fw_prop=>ty_s_mgw_odata_property,
          lv_core_type          TYPE /iwbep/if_mgw_med_odata_types=>ty_e_med_edm_type,
          lv_entity_name        TYPE /iwbep/if_mgw_med_odata_types=>ty_e_med_entity_name,
          lo_target_entity_type TYPE REF TO /iwbep/if_mgw_odata_fw_etype,
          lv_internal_length    TYPE i,
          lv_length             TYPE i.

    FIELD-SYMBOLS:
      <ls_filter_select_option> TYPE /iwbep/s_mgw_select_option,
      <ls_range>                TYPE /iwbep/s_cod_select_option.

*    Convert filter select options
*
*    This conversion is only needed for filter select option with contains pattern
*    on character fields with length one. Conversion therefore is already
*    done in /IWFND/CL_SOADATA_PROCESSOR => CORRECT_STRING_VALUE
*    Conclusion  => only needed if the HUB is older and does not have this functionality


    IF cs_request_context-filter_select_options IS INITIAL.
      RETURN.
    ENDIF.

* Get Model
    lo_model = me->get_model( ).
    lv_entity_name = cs_request_context-target_entity.
    lo_target_entity_type = lo_model->get_entity_type( lv_entity_name ).

    LOOP AT cs_request_context-filter_select_options ASSIGNING <ls_filter_select_option>.
      LOOP AT <ls_filter_select_option>-select_options ASSIGNING <ls_range>.
        TRY.
            lo_target_entity_type->get_property_from_path_ext(
                                       EXPORTING iv_path = <ls_filter_select_option>-property
                                       IMPORTING es_odata_property = ls_odata_property ).
          CATCH /iwbep/cx_mgw_med_exception.
            CONTINUE.
        ENDTRY.

        IF ls_odata_property IS NOT INITIAL.
          lv_core_type = ls_odata_property-property->/iwbep/if_mgw_odata_re_prop~get_core_type( ).
          CASE lv_core_type.
            WHEN /iwbep/if_mgw_med_odata_types=>gcs_edm_data_types-string.
              lv_internal_length = ls_odata_property-property->get_internal_length( ).
              lv_length = lv_internal_length / 2.  "cl_abap_char_utilities=>charsize.
              IF lv_length = 1.
                <ls_range>-low = correct_substring(
                                   iv_value  = <ls_range>-low
                                   iv_option = <ls_range>-option
                                 ).
                IF <ls_range>-high IS NOT INITIAL.
                  <ls_range>-high = correct_substring(
                                      iv_value  = <ls_range>-high
                                      iv_option = <ls_range>-option
                                    ).
                ENDIF.
              ENDIF.
            WHEN OTHERS.
          ENDCASE.
        ENDIF.
      ENDLOOP.
    ENDLOOP.

  ENDMETHOD.


  METHOD copy_data_internal.

******************************************************************
*  OBSOLETE:  Use /iwbep/cl_mgw_data_helper=>move_corresponding  *
******************************************************************


    DATA: lv_xdoc          TYPE xstring,
          lo_xml_writer    TYPE REF TO if_sxml_writer,
          lo_string_writer TYPE REF TO cl_sxml_string_writer,
          lo_xml_reader    TYPE REF TO if_sxml_reader.

    FIELD-SYMBOLS: <ls_source_data> TYPE any,
                   <ls_target_data> TYPE any.

    ASSIGN ir_source_data->* TO <ls_source_data>.
    ASSIGN cr_target_data->* TO <ls_target_data>.

* Serialize Source Data
    lo_xml_writer = lo_string_writer = cl_sxml_string_writer=>create( ).
    lo_xml_writer->open_element( name = 'ANY_DATA' ).

    CALL TRANSFORMATION /iwbep/st_any_data
      OPTIONS initial_components = 'suppress'
              value_handling     = 'move'
      SOURCE  data               = <ls_source_data>
      RESULT  XML lo_xml_writer.                            "#EC NOTEXT

    lo_xml_writer->close_element( ).
    lv_xdoc = lo_string_writer->get_output( ).

* Deserialze to Target Data
    lo_xml_reader = cl_sxml_string_reader=>create( lv_xdoc ).
    lo_xml_reader->next_node( ).
    CALL TRANSFORMATION /iwbep/st_any_data
      SOURCE XML lo_xml_reader
      RESULT data = <ls_target_data>.

  ENDMETHOD.


  METHOD correct_select_options.

    DATA: lo_model                  TYPE REF TO /iwbep/if_mgw_odata_fw_model,
          ls_odata_property         TYPE /iwbep/if_mgw_odata_fw_prop=>ty_s_mgw_odata_property,
          lv_core_type              TYPE /iwbep/if_mgw_med_odata_types=>ty_e_med_edm_type,
          lv_entity_name            TYPE /iwbep/if_mgw_med_odata_types=>ty_e_med_entity_name,
          lo_target_entity_type     TYPE REF TO /iwbep/if_mgw_odata_fw_etype,
          lv_internal_length        TYPE i,
          lv_length                 TYPE i,
          ls_add_range              TYPE /iwbep/s_cod_select_option,
          lt_add_sel_options        TYPE STANDARD TABLE OF /iwbep/s_cod_select_option,
          lv_model_no_conversion    TYPE abap_bool,
          lv_property_no_conversion TYPE abap_bool.

    FIELD-SYMBOLS:
      <ls_filter_select_option> TYPE /iwbep/s_mgw_select_option,
      <ls_range>                TYPE /iwbep/s_cod_select_option.


*   This method corrects the filter select options for string values
*   The logic has been moved from the HUB (/IWFND/CL_SODATA_PROCESSOR->INIT_REQUEST) to the BEP
*   as there were numerous problems with the filter being cut too much, mainly due to incorrect property
*   length calculations on the hub

    IF cs_request_context-filter_select_options IS INITIAL.
      RETURN.
    ENDIF.

* Get Model
    lo_model = me->get_model( ).
    lv_entity_name = cs_request_context-target_entity.
    lo_target_entity_type = lo_model->get_entity_type( lv_entity_name ).
    lv_model_no_conversion = lo_model->get_no_conversion( ).

    "correct the filter_select_options
    LOOP AT cs_request_context-filter_select_options ASSIGNING <ls_filter_select_option>.
      CLEAR: lt_add_sel_options.

      TRY.
          lo_target_entity_type->get_property_from_path_ext(
                                     EXPORTING iv_path = <ls_filter_select_option>-property
                                     IMPORTING es_odata_property = ls_odata_property ).
        CATCH /iwbep/cx_mgw_med_exception.
          CONTINUE.
      ENDTRY.

      IF ls_odata_property IS NOT INITIAL.

        lv_core_type = ls_odata_property-property->/iwbep/if_mgw_odata_re_prop~get_core_type( ).

        LOOP AT <ls_filter_select_option>-select_options ASSIGNING <ls_range>.
          CASE lv_core_type.
            WHEN /iwbep/if_mgw_med_odata_types=>gcs_edm_data_types-string.

              lv_property_no_conversion = ls_odata_property-property->get_no_conversion( ).

              "If conversion is switched off, then take the internal length
              IF lv_model_no_conversion EQ abap_true OR
                 lv_property_no_conversion EQ abap_true.
                lv_internal_length = ls_odata_property-property->get_internal_length( ).
                lv_length = lv_internal_length / cl_abap_char_utilities=>charsize. "charsize is correct here - since we are in BEP (no hub involved here)
              ELSE.
                "If conversion is switched on, then take the output length
                lv_length = ls_odata_property-property->get_maxlength( ).
              ENDIF.

              correct_string_value(
                                  EXPORTING
                                    iv_length  = lv_length
                                    iv_is_high = abap_false
                                  IMPORTING
                                    es_extended_range = ls_add_range
                                  CHANGING
                                    cs_range   = <ls_range> ).
              IF ls_add_range IS NOT INITIAL.
                INSERT  ls_add_range INTO TABLE lt_add_sel_options.
              ENDIF.
              IF <ls_range>-high IS NOT INITIAL.
                correct_string_value(
                  EXPORTING
                    iv_length  = lv_length
                    iv_is_high = abap_true
                   IMPORTING
                  es_extended_range = ls_add_range
                  CHANGING
                    cs_range   = <ls_range> ).
              ENDIF.

            WHEN OTHERS.
          ENDCASE.
        ENDLOOP.
        LOOP AT lt_add_sel_options INTO ls_add_range.
          INSERT ls_add_range INTO TABLE <ls_filter_select_option>-select_options.
        ENDLOOP.
      ENDIF.
    ENDLOOP.


    "correct also the technical_request/filter_select_options
    "The property name is different (internal names, internal path) so another loop necessary
    LOOP AT cs_request_context-technical_request-filter_select_options ASSIGNING <ls_filter_select_option>.
      CLEAR: lt_add_sel_options.

      TRY.
          lo_target_entity_type->get_property_from_path(
                                     EXPORTING iv_path = <ls_filter_select_option>-property
                                     IMPORTING es_odata_property = ls_odata_property ).
        CATCH /iwbep/cx_mgw_med_exception.
          CONTINUE.
      ENDTRY.

      IF ls_odata_property IS NOT INITIAL.

        lv_core_type = ls_odata_property-property->/iwbep/if_mgw_odata_re_prop~get_core_type( ).

        LOOP AT <ls_filter_select_option>-select_options ASSIGNING <ls_range>.
          CASE lv_core_type.
            WHEN /iwbep/if_mgw_med_odata_types=>gcs_edm_data_types-string.

              lv_property_no_conversion = ls_odata_property-property->get_no_conversion( ).

              "If conversion is switched off, then take the internal length
              IF lv_model_no_conversion EQ abap_true OR
                 lv_property_no_conversion EQ abap_true.
                lv_internal_length = ls_odata_property-property->get_internal_length( ).
                lv_length = lv_internal_length / cl_abap_char_utilities=>charsize. "charsize is correct here - since we are in BEP (no hub involved here)
              ELSE.
                "If conversion is switched on, then take the output length
                lv_length = ls_odata_property-property->get_maxlength( ).
              ENDIF.

              correct_string_value(
                                  EXPORTING
                                    iv_length  = lv_length
                                    iv_is_high = abap_false
                                  IMPORTING
                                    es_extended_range = ls_add_range
                                  CHANGING
                                    cs_range   = <ls_range> ).
              IF ls_add_range IS NOT INITIAL.
                INSERT  ls_add_range INTO TABLE lt_add_sel_options.
              ENDIF.
              IF <ls_range>-high IS NOT INITIAL.
                correct_string_value(
                  EXPORTING
                    iv_length  = lv_length
                    iv_is_high = abap_true
                   IMPORTING
                  es_extended_range = ls_add_range
                  CHANGING
                    cs_range   = <ls_range> ).
              ENDIF.

            WHEN OTHERS.
          ENDCASE.
        ENDLOOP.
        LOOP AT lt_add_sel_options INTO ls_add_range.
          INSERT ls_add_range INTO TABLE <ls_filter_select_option>-select_options.
        ENDLOOP.
      ENDIF.
    ENDLOOP.

  ENDMETHOD.


  METHOD correct_string_value.

    DATA lv_leng   TYPE i.
    DATA lv_value  TYPE c LENGTH 1024.

    FIELD-SYMBOLS <lv_first_char>   TYPE char1.
    FIELD-SYMBOLS <lv_last_char>    TYPE char1.
    FIELD-SYMBOLS <lv_option_value> TYPE string.

    CLEAR es_extended_range.


    IF iv_length IS INITIAL. RETURN. ENDIF.

    " Remove '*' and also other characters if max. length is exceeded
    IF iv_is_high = abap_false.
      ASSIGN cs_range-low TO <lv_option_value>.
    ELSE.
      ASSIGN cs_range-high TO <lv_option_value>.
    ENDIF.

    lv_leng = strlen( <lv_option_value> ).
    IF lv_leng > iv_length.
      lv_value = <lv_option_value>.
      ASSIGN lv_value(1) TO <lv_first_char>.
      lv_leng = lv_leng - 1.
      ASSIGN lv_value+lv_leng(1) TO <lv_last_char>.
      IF <lv_last_char> = '*'.
        lv_value = lv_value(lv_leng).
        IF lv_leng = iv_length.
          <lv_option_value> = lv_value(iv_length).  " delete this line?
          IF cs_range-option = 'CP'.
            IF <lv_first_char> <> '*'.
              cs_range-option = 'EQ'.
            ELSE.
*              incident 1670281774 - if *text* is cut to *text because the data type length is not long enough,
*              then the select options are not correct anymore. Therefore an additional select option text*
*              needs to be inserted
              es_extended_range = cs_range.
              IF iv_is_high = abap_false.
                SHIFT es_extended_range-low CIRCULAR.
              ELSE.
                SHIFT es_extended_range-high CIRCULAR.
              ENDIF.
            ENDIF.
          ENDIF.
          RETURN.
        ENDIF.
      ELSE.
        lv_leng = lv_leng + 1.
      ENDIF.

      IF <lv_first_char> = '*'.
        lv_value = lv_value+1.
        lv_leng = lv_leng - 1.
        IF cs_range-option = 'CP'.
          cs_range-option = 'EQ'.
        ENDIF.
      ENDIF.

      IF lv_leng > iv_length.
        <lv_option_value> = lv_value(iv_length).
        IF cs_range-option = 'CP'.
          cs_range-option = 'EQ'.
        ENDIF.
      ELSE.
        <lv_option_value> = lv_value.
      ENDIF.
    ENDIF.

  ENDMETHOD.


  METHOD correct_substring.

    DATA: lv_leng  TYPE i.

* Special handling for substringof for a STRING property with length 1
    lv_leng = strlen( iv_value ).
    IF iv_option <> 'CP' OR lv_leng < 2.
      rv_value = iv_value.
      EXIT.
    ENDIF.

    IF iv_value(1) = '*'.
      rv_value = iv_value+1.
    ELSEIF iv_value+1(1) = '*'.
      rv_value = iv_value.
    ENDIF.

  ENDMETHOD.


  METHOD create_inline_info.

    DATA: lo_type_descr  TYPE REF TO cl_abap_typedescr,
          ls_inline_info TYPE /iwbep/if_mgw_core_srv_runtime=>ty_s_inline_info,
          lt_children    TYPE /iwbep/cl_mgw_expand_node=>ty_t_children.

    FIELD-SYMBOLS:
          <ls_data>       TYPE any.

* No Inline Info for GWFND Internal Version >= 10.
    IF ms_hub_version IS INITIAL.
      ms_hub_version = /iwbep/cl_mgw_util_versions=>get_hub_version( ).
    ENDIF.
    IF ms_hub_version-gwfnd_version >= '010'. EXIT. ENDIF.

* Get Children
    io_expand_node->get_children(
      IMPORTING
        et_children = lt_children
    ).
    IF lt_children IS INITIAL. EXIT. ENDIF.

    ASSIGN ir_data->* TO <ls_data>.
    IF <ls_data> IS INITIAL.
      ls_inline_info-is_inline_initial = abap_true.
      ls_inline_info-entry_no          = iv_entry_no.
      ls_inline_info-expand_part       = iv_expand_part.
      ls_inline_info-tech_expand_part  = iv_tech_expand_part.
      APPEND ls_inline_info TO ct_inline_info.
      EXIT.
    ENDIF.

* Structure or Table
    lo_type_descr = cl_abap_typedescr=>describe_by_data( <ls_data> ).
    IF lo_type_descr->kind = cl_abap_typedescr=>kind_struct.
      create_inline_info_entry(
        EXPORTING
          io_expand_node      = io_expand_node
          iv_expand_part      = iv_expand_part
          iv_tech_expand_part = iv_tech_expand_part
          ir_data             = ir_data
          iv_entry_no         = iv_entry_no
        CHANGING
          ct_inline_info      = ct_inline_info
      ).

    ELSEIF lo_type_descr->kind = cl_abap_typedescr=>kind_table.
      create_inline_info_feed(
        EXPORTING
          io_expand_node      = io_expand_node
          iv_expand_part      = iv_expand_part
          iv_tech_expand_part = iv_tech_expand_part
          ir_data             = ir_data
          iv_entry_no         = iv_entry_no
          iv_from_entry       = iv_from_entry
        CHANGING
          ct_inline_info      = ct_inline_info
      ).
    ENDIF.

  ENDMETHOD.


  METHOD create_inline_info_deep_insert.

    DATA: lv_expand_fragment     TYPE string,
          lv_sub_expand_fragment TYPE string,
          lt_expand_fragment     TYPE TABLE OF string,
          lt_sub_expand_fragment TYPE TABLE OF string,
          ls_inline_info         TYPE /iwbep/if_mgw_core_srv_runtime=>ty_s_inline_info.

    FIELD-SYMBOLS:
      <ls_source_structure> TYPE any,
      <ls_deep_component>   TYPE any.


    ASSIGN ir_entity_data->* TO <ls_source_structure>.
    SPLIT cr_changeset_data->*-expand_string AT '/' INTO TABLE lt_expand_fragment.

    LOOP AT lt_expand_fragment INTO lv_expand_fragment.
      SPLIT lv_expand_fragment AT ',' INTO TABLE lt_sub_expand_fragment.

      LOOP AT lt_sub_expand_fragment INTO lv_sub_expand_fragment.

        ASSIGN COMPONENT lv_sub_expand_fragment OF STRUCTURE <ls_source_structure> TO <ls_deep_component>.
        IF sy-subrc <> 0.
          ls_inline_info-is_inline_initial = abap_false.
          APPEND ls_inline_info TO cr_changeset_data->*-inline_infos.
          EXIT.
        ENDIF.
        IF <ls_deep_component> IS INITIAL.
          ls_inline_info-is_inline_initial = abap_true.
        ELSE.
          ls_inline_info-is_inline_initial = abap_false.
        ENDIF.
        APPEND ls_inline_info TO cr_changeset_data->*-inline_infos.
        ASSIGN COMPONENT lv_sub_expand_fragment OF STRUCTURE <ls_source_structure> TO <ls_source_structure>.

      ENDLOOP.

    ENDLOOP.

  ENDMETHOD.


  METHOD create_inline_info_entry.

    DATA: lv_component_name   TYPE /iwbep/mgw_tech_name,
          lv_external_name    TYPE string,
          lr_data             TYPE REF TO data,
          lt_children         TYPE /iwbep/cl_mgw_expand_node=>ty_t_children,
          lr_child            TYPE REF TO /iwbep/cl_mgw_expand_node=>ty_s_child,
          lo_type_descr       TYPE REF TO cl_abap_typedescr,
          ls_inline_info      TYPE /iwbep/if_mgw_core_srv_runtime=>ty_s_inline_info,
          lv_expand_part      TYPE string,
          lv_tech_expand_part TYPE string,
          lv_cardinality      TYPE /iwbep/if_mgw_med_odata_types=>ty_e_med_cardinality.

    FIELD-SYMBOLS:
      <ls_data>   TYPE any,
      <ls_inline> TYPE any.


* Get Children
    io_expand_node->get_children(
      IMPORTING
        et_children = lt_children
    ).
    IF lt_children IS INITIAL. EXIT. ENDIF.

    ASSIGN ir_data->* TO <ls_data>.
    IF <ls_data> IS INITIAL.
      ls_inline_info-is_inline_initial = abap_true.
      ls_inline_info-entry_no          = iv_entry_no.
      ls_inline_info-expand_part       = iv_expand_part.
      ls_inline_info-tech_expand_part  = iv_tech_expand_part.
      APPEND ls_inline_info TO ct_inline_info.
      EXIT.
    ENDIF.

* Handle Inlines
    LOOP AT lt_children REFERENCE INTO lr_child.
      lv_component_name = lr_child->*-node->/iwbep/if_mgw_tech_expand_node~get_nav_prop_name( ).
      lv_external_name  = lr_child->*-node->get_nav_prop_name( ).
      lv_cardinality    = lr_child->*-node->get_multiplicity( ).

      IF iv_expand_part IS INITIAL.
        lv_expand_part      = lv_external_name.
        lv_tech_expand_part = lv_component_name.
      ELSE.
        CONCATENATE iv_expand_part lv_external_name
          INTO lv_expand_part SEPARATED BY '/'.
        CONCATENATE iv_tech_expand_part lv_component_name
          INTO lv_tech_expand_part SEPARATED BY '/'.
      ENDIF.

      ASSIGN COMPONENT lv_component_name OF STRUCTURE <ls_data> TO <ls_inline>.
      IF sy-subrc <> 0.
        ls_inline_info-entry_no         = iv_entry_no.
        ls_inline_info-expand_part      = lv_expand_part.
        ls_inline_info-tech_expand_part = lv_tech_expand_part.
        ls_inline_info-is_inline_initial = abap_true.
        APPEND ls_inline_info TO ct_inline_info.
        EXIT.
      ENDIF.

      GET REFERENCE OF <ls_inline> INTO lr_data.

      lo_type_descr = cl_abap_typedescr=>describe_by_data( <ls_inline> ).

      " Structure Handling
      IF lo_type_descr->kind = cl_abap_typedescr=>kind_struct.
        ls_inline_info-entry_no         = iv_entry_no.
        ls_inline_info-expand_part      = lv_expand_part.
        ls_inline_info-tech_expand_part = lv_tech_expand_part.
        IF <ls_inline> IS INITIAL.
          ls_inline_info-is_inline_initial = abap_true.
        ELSE.
          ls_inline_info-is_inline_initial = abap_false.
        ENDIF.
        APPEND ls_inline_info TO ct_inline_info.

        IF <ls_inline> IS NOT INITIAL OR
           lv_cardinality <> /iwbep/if_mgw_med_odata_types=>gcs_cardinality-cardinality_0_1.
          create_inline_info(
            EXPORTING
              io_expand_node      = lr_child->*-node
              iv_expand_part      = lv_expand_part
              iv_tech_expand_part = lv_tech_expand_part
              ir_data             = lr_data
              iv_entry_no         = iv_entry_no
              iv_from_entry       = abap_true
            CHANGING
              ct_inline_info      = ct_inline_info
          ).
        ENDIF.

        " Table Handling
      ELSEIF lo_type_descr->kind = cl_abap_typedescr=>kind_table.
        create_inline_info_feed(
          EXPORTING
            io_expand_node      = lr_child->*-node
            iv_expand_part      = lv_expand_part
            iv_tech_expand_part = lv_tech_expand_part
            ir_data             = lr_data
            iv_entry_no         = iv_entry_no
            iv_from_entry       = abap_true
          CHANGING
            ct_inline_info      = ct_inline_info
        ).
      ENDIF.

    ENDLOOP.

  ENDMETHOD.


  METHOD create_inline_info_feed.

    DATA: lv_entry_no TYPE i,
          lr_data     TYPE REF TO data.

    FIELD-SYMBOLS:
          <lt_table>      TYPE ANY TABLE.


    ASSIGN ir_data->* TO <lt_table>.

    CREATE DATA lr_data LIKE LINE OF <lt_table>.

    lv_entry_no = iv_entry_no.

    LOOP AT <lt_table> REFERENCE INTO lr_data.
      create_inline_info_entry(
        EXPORTING
          io_expand_node      = io_expand_node
          iv_expand_part      = iv_expand_part
          iv_tech_expand_part = iv_tech_expand_part
          ir_data             = lr_data
          iv_entry_no         = lv_entry_no
        CHANGING
          ct_inline_info      = ct_inline_info
      ).
      IF iv_from_entry = abap_false.
        lv_entry_no = lv_entry_no + 1.
      ENDIF.
    ENDLOOP.

  ENDMETHOD.


  METHOD create_input_param_converter.

    DATA: lo_model       TYPE REF TO /iwbep/cl_mgw_odata_model,
          lo_entity_type TYPE REF TO /iwbep/if_mgw_odata_fw_etype,
          lr_function    TYPE REF TO /iwbep/if_mgw_med_odata_types=>ty_s_med_function.

* Get Entity Type for Action Input Parameters
    lo_model ?= mo_model.

    lr_function = lo_model->get_function( iv_action_name ).

* Only for Function Import with parameters
    IF lr_function->*-input_node IS NOT INITIAL.

      lo_entity_type = lo_model->get_entity_type_by_id( lr_function->*-input_node ).

      CREATE OBJECT cs_request_context-technical_request-key_converter
        TYPE
        /iwbep/cl_mgw_req_key_convert
        EXPORTING
          io_entity_type = lo_entity_type.

    ENDIF.

  ENDMETHOD.


  METHOD create_key_converters.

    DATA: lo_model                TYPE REF TO /iwbep/if_mgw_odata_fw_model,
          lo_entity_type          TYPE REF TO /iwbep/if_mgw_odata_fw_etype,
          lt_navi_property        TYPE /iwbep/if_mgw_med_odata_types=>ty_t_med_reference,
          lt_entity_type          TYPE /iwbep/if_mgw_med_odata_types=>ty_t_med_entity_types,
          lo_source_entity_id     TYPE /iwbep/med_entity_id,
          lo_source_entity_type   TYPE REF TO /iwbep/if_mgw_odata_fw_etype,
          lt_association          TYPE /iwbep/if_mgw_med_odata_types=>ty_t_med_reference,
          ls_association          LIKE LINE OF lt_association,
          lo_source_key_converter TYPE REF TO /iwbep/cl_mgw_req_key_convert.

    FIELD-SYMBOLS:
      <ls_navi_path>     TYPE /iwbep/s_mgw_tech_navi,
      <ls_navi_property> TYPE /iwbep/if_mgw_med_odata_types=>ty_s_med_reference,
      <ls_entity_type>   TYPE /iwbep/if_mgw_med_odata_types=>ty_s_med_entity_type.


* Not supported for ICF node sdata (legacy lib 0.2 version)
    IF ( cs_request_context-icf_root_node = gcs_icf_nodes-sdata ).
      RETURN.
    ENDIF.


* Get Model
    lo_model = me->get_model( ).

* No Navigation
    IF cs_request_context-technical_request-navigation_path IS INITIAL.
      lo_entity_type = lo_model->get_entity_type( cs_request_context-technical_request-source_entity_type ).

      CREATE OBJECT cs_request_context-technical_request-key_converter
        TYPE
        /iwbep/cl_mgw_req_key_convert
        EXPORTING
          io_entity_type = lo_entity_type.
    ENDIF.

    lo_source_entity_type = lo_model->get_entity_type( cs_request_context-technical_request-source_entity_type ).
    lo_source_entity_id = lo_source_entity_type->/iwbep/if_mgw_odata_item~get_id( ).

* One converter for each navigation
    LOOP AT cs_request_context-technical_request-navigation_path ASSIGNING <ls_navi_path>.

      " Get Source Entity Type
      lt_navi_property = lo_model->/iwbep/if_mgw_odata_re_model~get_navigation_properties( ).
      READ TABLE lt_navi_property ASSIGNING <ls_navi_property>
        WITH KEY name = <ls_navi_path>-nav_prop source_entity_id = lo_source_entity_id.
      IF sy-subrc <> 0. CONTINUE. ENDIF.


      "Get Source
      lt_entity_type = lo_model->/iwbep/if_mgw_odata_re_model~get_entity_types( ).
      READ TABLE lt_entity_type ASSIGNING <ls_entity_type>
        WITH KEY entity_id = <ls_navi_property>-source_entity_id.
      IF sy-subrc <> 0. CONTINUE. ENDIF.

      <ls_navi_path>-source_entity_type = <ls_entity_type>-name. "Set source


      "Create Source Key Converter in request Object
      IF cs_request_context-technical_request-key_converter IS NOT BOUND.
        lo_entity_type = lo_model->get_entity_type( <ls_navi_path>-source_entity_type ).

        CREATE OBJECT lo_source_key_converter
          EXPORTING
            io_entity_type = lo_entity_type.

        cs_request_context-technical_request-key_converter = lo_source_key_converter.
      ENDIF.


      "Get Target
      lt_association = lo_model->/iwbep/if_mgw_odata_re_model~get_associations( ).
      READ TABLE lt_association INTO ls_association WITH KEY entity_id = <ls_navi_property>-target_entity_id.
      IF sy-subrc <> 0. CONTINUE. ENDIF.

      lt_entity_type = lo_model->/iwbep/if_mgw_odata_re_model~get_entity_types( ).
      READ TABLE lt_entity_type ASSIGNING <ls_entity_type>
        WITH KEY entity_id = ls_association-target_entity_id.
      IF sy-subrc <> 0. CONTINUE. ENDIF.

      "Target is already calculated
*      <ls_navi_path>-target_entity_type =

      "Create Key Converter
      lo_entity_type = lo_model->get_entity_type( <ls_navi_path>-target_entity_type ).

      CREATE OBJECT <ls_navi_path>-key_converter
        TYPE
        /iwbep/cl_mgw_req_key_convert
        EXPORTING
          io_entity_type = lo_entity_type.



    ENDLOOP.

  ENDMETHOD.


  METHOD create_msg_container_and_merge.

    DATA:
      lo_msg_container TYPE REF TO /iwbep/if_message_container.

    " may be extended with operation ID to create unique message containers
    " per operation ID (see change set)
    ro_msg_container = /iwbep/cl_mgw_msg_container=>create_op_msg_container( ).

    " current main container -> merge
    lo_msg_container = /iwbep/cl_mgw_msg_container=>get_mgw_msg_container( ).
    ro_msg_container->add_messages_from_container( lo_msg_container ).

  ENDMETHOD.


  METHOD create_navi_key_converter.

    DATA lv_found             TYPE abap_bool.
    DATA lo_model             TYPE REF TO /iwbep/if_mgw_odata_fw_model.
    DATA lo_entity_type       TYPE REF TO /iwbep/if_mgw_odata_fw_etype.
    DATA lt_navi_property     TYPE /iwbep/if_mgw_med_odata_types=>ty_t_med_reference.
    DATA lt_entity_type       TYPE /iwbep/if_mgw_med_odata_types=>ty_t_med_entity_types.
    DATA ls_nav_target_buffer TYPE ty_s_nav_target_buffer.

    FIELD-SYMBOLS:
      <ls_navi_path>     TYPE /iwbep/s_mgw_tech_navi,
      <ls_navi_property> TYPE /iwbep/if_mgw_med_odata_types=>ty_s_med_reference,
      <ls_entity_type>   TYPE /iwbep/if_mgw_med_odata_types=>ty_s_med_entity_type.

* Get current navigation
    READ TABLE cs_request_context-technical_request-navigation_path ASSIGNING <ls_navi_path> INDEX 1.

    READ TABLE mt_nav_target_buffer INTO ls_nav_target_buffer
      WITH TABLE KEY source_entity_type_name  = cs_request_context-technical_request-source_entity_type
                     navigation_property_name = <ls_navi_path>-nav_prop.
    IF sy-subrc EQ 0.

      lo_entity_type = ls_nav_target_buffer-target_entity_type.
      <ls_navi_path>-source_entity_type = cs_request_context-technical_request-source_entity_type.

    ELSE.

* Get Model
      lo_model = me->get_model( ).

* Get Source Entity Types
      lt_entity_type = lo_model->/iwbep/if_mgw_odata_re_model~get_entity_types( ).

* Get Navigation Properties
      lt_navi_property = lo_model->/iwbep/if_mgw_odata_re_model~get_navigation_properties( ).

* Take care of navigations with the same name: Check ID and also Source Entity Type
      LOOP AT lt_navi_property ASSIGNING <ls_navi_property>
        WHERE name = <ls_navi_path>-nav_prop.
        READ TABLE lt_entity_type ASSIGNING <ls_entity_type>
          WITH KEY entity_id = <ls_navi_property>-source_entity_id
                   name      = cs_request_context-technical_request-source_entity_type.
        IF sy-subrc = 0.
          lv_found = abap_true.
          <ls_navi_path>-source_entity_type = <ls_entity_type>-name.
          EXIT.
        ENDIF.
      ENDLOOP.
      IF lv_found = abap_false.
        READ TABLE lt_navi_property ASSIGNING <ls_navi_property>
          WITH KEY name = <ls_navi_path>-nav_prop.
        READ TABLE lt_entity_type ASSIGNING <ls_entity_type>
          WITH KEY entity_id = <ls_navi_property>-source_entity_id.
        <ls_navi_path>-source_entity_type = <ls_entity_type>-name.
      ENDIF.

      lo_entity_type = lo_model->get_entity_type( <ls_navi_path>-source_entity_type ).

      ls_nav_target_buffer-source_entity_type_name  = cs_request_context-technical_request-source_entity_type.
      ls_nav_target_buffer-navigation_property_name = <ls_navi_path>-nav_prop.
      ls_nav_target_buffer-target_entity_type       = lo_entity_type.
      INSERT ls_nav_target_buffer INTO TABLE mt_nav_target_buffer.

    ENDIF.

    CREATE OBJECT <ls_navi_path>-key_converter TYPE /iwbep/cl_mgw_req_key_convert
      EXPORTING
        io_entity_type = lo_entity_type.

    cs_request_context-technical_request-key_converter = <ls_navi_path>-key_converter.

  ENDMETHOD.


  METHOD create_placeholder_info.

    " creates placeholder metadata that needs to be stored in the request cache
    " top, skip, inlinecount, skiptoken, select, orderby do not need to be handled

    DATA lo_filter_tree      TYPE REF TO /iwbep/if_mgw_expr_node.
    DATA lt_placeholder_info TYPE /iwbep/if_mgw_core_srv_runtime=>ty_t_placeholder_info.

    CLEAR cs_response_context-crp_placeholder_info.

    "filter
    lo_filter_tree = io_request->/iwbep/if_mgw_req_entityset~get_filter_expression_tree( ).
    IF lo_filter_tree IS BOUND.
      lo_filter_tree->get_placeholder_info( IMPORTING
                                              et_placeholder_info = lt_placeholder_info ).
      INSERT LINES OF lt_placeholder_info INTO TABLE cs_response_context-crp_placeholder_info.
    ENDIF.

  ENDMETHOD.


  METHOD create_request_object.

    TYPES: BEGIN OF ty_error_info,
             error_text    TYPE string,
             hub_timestamp TYPE tzntstmps,
             bep_timestamp TYPE tzntstmps,
           END OF ty_error_info.

    DATA: lo_model           TYPE REF TO /iwbep/if_mgw_odata_fw_model,
          lv_local_timestamp TYPE tzntstmps,
          ls_error_info      TYPE ty_error_info,
          ls_model_features	 TYPE /iwbep/if_mgw_appl_types=>ty_s_model_features,
          lo_logger          TYPE REF TO /iwbep/cl_cos_logger,
          lo_msg_container   TYPE REF TO /iwbep/if_message_container.

    FIELD-SYMBOLS: <ls_member_request_details> TYPE /iwbep/if_mgw_core_srv_runtime=>ty_s_mgw_request_context.


    lo_model = me->get_model( ).

* Check whether metadata cache on hub is outdated
    IF ( is_request_details-cache_timestamp IS NOT INITIAL ).
      lv_local_timestamp = lo_model->get_cache_timestamp( ).

      " Check GW Cache outdated
      IF ( lv_local_timestamp > is_request_details-cache_timestamp ).

        lo_model->get_model_features( IMPORTING es_model_features = ls_model_features ).

        " Raise Exception as required via HTTP hHeader
        IF ls_model_features-use_cache_handshake_busi_req EQ 'X'.
          RAISE EXCEPTION TYPE /iwbep/cx_mgw_gw_md_outdated
            EXPORTING
              textid = /iwbep/cx_mgw_gw_md_outdated=>cache_outdated.

          " Otherwise: Error Log and inform GW via Message Container
        ELSE.
          MESSAGE i003(/iwbep/cm_mgw_rt) INTO ls_error_info-error_text.
          ls_error_info-hub_timestamp = is_request_details-cache_timestamp.
          ls_error_info-bep_timestamp = lv_local_timestamp.
          lo_logger = /iwbep/cl_cos_logger=>get_logger( ).
          lo_logger->error_log_write(
            iv_main_entry = abap_false
            iv_error_info = ls_error_info
            iv_msgid      = '/IWBEP/CM_MGW_RT'
            iv_msgno      = '003'
          ).
          mo_context->get_parameter(
            EXPORTING
              iv_name  = /iwbep/if_mgw_context=>gc_param_msg_container
            IMPORTING
              ev_value = lo_msg_container
          ).
          lo_msg_container->add_message(
            iv_msg_type           = /iwbep/cl_cos_logger=>info
            iv_msg_id             = '/IWBEP/CM_MGW_RT'
            iv_msg_number         = '003'
            iv_error_category     = /iwbep/if_message_container=>gcs_error_category-no_error
            iv_is_leading_message = abap_false
          ).
        ENDIF.
      ENDIF.
    ENDIF.


    " Avoid freed object within deferred response creation
    " Hence copy the actual data otherwise requesting this variable
    " will fail within the BATCH_END method
    IF mv_batch_deferred_resp_crea = abap_true.
      CREATE DATA mr_request_details LIKE is_request_details.

      ASSIGN mr_request_details->* TO <ls_member_request_details>.

      <ls_member_request_details> = is_request_details.
    ELSE.
      GET REFERENCE OF is_request_details INTO mr_request_details.
    ENDIF.


    mt_headers = it_headers.

    CREATE OBJECT ro_request_object
      EXPORTING
        ir_request_details = mr_request_details
        it_headers         = it_headers
        io_model           = lo_model.

* Facade object only for one operation!
    CLEAR mo_facade.

  ENDMETHOD.


  METHOD expand_entity.

    DATA:  lv_tech_nav_prop_name    TYPE        string
          ,lr_deep_component        TYPE REF TO data
          ,lt_children              TYPE        /iwbep/cl_mgw_expand_node=>ty_t_children
          ,lr_child                 TYPE REF TO /iwbep/cl_mgw_expand_node=>ty_s_child
          ,lo_child                 TYPE REF TO /iwbep/cl_mgw_expand_node
          ,ls_request_context       TYPE        /iwbep/if_mgw_core_srv_runtime=>ty_s_mgw_request_context
          ,ls_navigation_path       TYPE        /iwbep/s_mgw_navigation_path
          ,lt_headers               TYPE        tihttpnvp " dummy for header
          ,lv_ctx_service_namespace TYPE        string " pass service namespace to app
          ,ls_paging                TYPE        /iwbep/s_mgw_paging
          ,lo_tech_request_context  TYPE REF TO /iwbep/cl_mgw_request
          ,ls_tech_navigation_path  TYPE        /iwbep/s_mgw_tech_navi
          ,lr_request_context       TYPE REF TO /iwbep/if_mgw_core_srv_runtime=>ty_s_mgw_request_context
          .

    CONSTANTS:
      BEGIN OF gcs_association_multiplicity,
        one         TYPE string VALUE '1',    " Indicates that exactly one entity type instance exists at the association end
        zero_or_one TYPE string VALUE '0..1', " Indicates that zero or one entity type instances exist at the association end
        many        TYPE string VALUE '*',    " Indicates that zero, one, or more entity type instances exist at the association end.
      END OF gcs_association_multiplicity .

    FIELD-SYMBOLS: <ls_deep_component> TYPE any.

* $top and $skip are only valid for the first collection
*  MOVE-CORRESPONDING mr_request_details->*-paging TO ls_paging.

*-get service namespace (basically service name) from application context object to fulfill API contract
    mo_context->get_parameter(
      EXPORTING
        iv_name  = /iwbep/if_mgw_context=>gc_param_service_namespace
      IMPORTING
        ev_value = lv_ctx_service_namespace ).

*-get child nodes of current expand node
    io_expand_node->get_children( IMPORTING et_children = lt_children ).

*-check whether current node has more children
    IF lt_children IS NOT INITIAL.

*---prepare request context

*---get key tab once for current entity
      ls_request_context-key_tab = get_key_tab(
          io_expand_node = io_expand_node
          is_data        = cs_entity ).
      ls_request_context-technical_request-key_tab = get_tech_key_tab(
          io_expand_node = io_expand_node
          is_data        = cs_entity ).

*---source entity which is to be extended
      ls_request_context-source_entity = iv_source_entity_type.
      ls_request_context-technical_request-source_entity_type = iv_tech_source_entity_type.
      ls_request_context-technical_request-source_entity_set = iv_tech_source_entity_set.

      IF is_original_request_details IS SUPPLIED.
        ls_request_context-if_modified_since = is_original_request_details-if_modified_since.
      ENDIF.

* $top and $skip are only valid for the first collection
*    ls_request_context-paging = mr_request_details->*-paging.

*---get children of current expand node
      LOOP AT lt_children REFERENCE INTO lr_child.
        lo_child = lr_child->*-node.

*-----create navigation property tab - properly fill structure to fulfill API contract
        ls_navigation_path-nav_prop = lo_child->get_nav_prop_name( ).
        ls_tech_navigation_path-nav_prop = lo_child->/iwbep/if_mgw_tech_expand_node~get_nav_prop_name( ).

        ls_navigation_path-target_type = lo_child->get_entity_type( ).
        ls_tech_navigation_path-target_entity_type = lo_child->/iwbep/if_mgw_tech_expand_node~get_entity_type_name( ).

        ls_navigation_path-target_type_namespace = lv_ctx_service_namespace.

        CASE lo_child->get_multiplicity( ).
          WHEN /iwbep/if_mgw_med_odata_types=>gcs_cardinality-cardinality_0_1.
            ls_navigation_path-multiplicity = gcs_association_multiplicity-zero_or_one.
          WHEN /iwbep/if_mgw_med_odata_types=>gcs_cardinality-cardinality_1_1.
            ls_navigation_path-multiplicity = gcs_association_multiplicity-one.
          WHEN OTHERS.
            ls_navigation_path-multiplicity = gcs_association_multiplicity-many.
        ENDCASE.
        ls_tech_navigation_path-multiplicity = ls_navigation_path-multiplicity.

*-----add navigation path
        INSERT ls_navigation_path INTO TABLE ls_request_context-navigation_path.
        INSERT ls_tech_navigation_path INTO TABLE ls_request_context-technical_request-navigation_path.

*-----set target entity type
        ls_request_context-target_entity = lo_child->get_entity_type( ).
        ls_request_context-technical_request-target_entity_type = lo_child->/iwbep/if_mgw_tech_expand_node~get_entity_type_name( ).

*-----set target entity set
        ls_request_context-target_entity_set = lo_child->get_entity_set( ).
        ls_request_context-technical_request-target_entity_set = lo_child->/iwbep/if_mgw_tech_expand_node~get_entity_set_name( ).

        " Select Properties
        ls_request_context-technical_request-select_strings = lo_child->get_select( ).
        IF lo_child->mv_select_path_separator EQ '-'.
          ls_request_context-technical_request-select_strings_h = lo_child->get_select( ).
        ENDIF.

*-----create technical request object
        GET REFERENCE OF ls_request_context INTO lr_request_context.
        CREATE OBJECT lo_tech_request_context
          EXPORTING
            ir_request_details = lr_request_context
            it_headers         = lt_headers
            io_model           = mo_model.

*-----create key converter for navigation
        me->create_navi_key_converter(
          CHANGING
            cs_request_context = ls_request_context
        ).

*-----get the technical navigation property name - used as component name in abap structure
        lv_tech_nav_prop_name = lo_child->/iwbep/if_mgw_tech_expand_node~get_nav_prop_name( ).

*-----assign the component of the current entity structure
        ASSIGN COMPONENT lv_tech_nav_prop_name OF STRUCTURE cs_entity TO <ls_deep_component>.

*-----get the data reference
        GET REFERENCE OF <ls_deep_component> INTO lr_deep_component.

*-----check cardinality - either call expanded feed or expanded entity method (recursion)
        CASE lo_child->get_multiplicity( ).
          WHEN /iwbep/if_mgw_med_odata_types=>gcs_cardinality-cardinality_0_1 OR /iwbep/if_mgw_med_odata_types=>gcs_cardinality-cardinality_1_1.
            read_expanded_entity(
              EXPORTING
                iv_entity_name           = ls_request_context-target_entity
                iv_tech_entity_name      = ls_request_context-technical_request-target_entity_type
                iv_source_name           = ls_request_context-source_entity
                is_request_details       = ls_request_context
                io_expand_node           = lo_child
                io_tech_request_context  = lo_tech_request_context
              CHANGING
                cr_entity                = lr_deep_component
                cs_response_context      = cs_response_context
            ).

          WHEN /iwbep/if_mgw_med_odata_types=>gcs_cardinality-cardinality_0_n OR /iwbep/if_mgw_med_odata_types=>gcs_cardinality-cardinality_1_n.
            read_expanded_entityset(
              EXPORTING
                iv_entity_name           = ls_request_context-target_entity
                iv_tech_entity_name      = ls_request_context-technical_request-target_entity_type
                iv_source_name           = ls_request_context-source_entity
                is_paging                = ls_paging
                it_order                 = ls_request_context-order
                it_filter_select_options = ls_request_context-filter_select_options
                is_request_details       = ls_request_context
                io_expand_node           = lo_child
                io_tech_request_context  = lo_tech_request_context
              CHANGING
                cr_entityset             = lr_deep_component
                cs_response_context      = cs_response_context
            ).
        ENDCASE.

        " Avoid duplicate keys etc. and clear navigation path of request context
        CLEAR: lt_headers, ls_request_context-navigation_path,
               ls_request_context-technical_request-navigation_path.

*-----finally set the expanded flag on the node to false to take it into account in next call
        lo_child->set_is_expanded( abap_false ).
      ENDLOOP.
    ENDIF. " end - children check



  ENDMETHOD.


  METHOD get_entity_descriptor.

    DATA: lo_expand_tree TYPE REF TO /iwbep/cl_mgw_expand_tree,
          lo_model       TYPE REF TO /iwbep/if_mgw_odata_fw_model.



    lo_expand_tree = /iwbep/cl_mgw_expand_tree=>create(
      iv_entity_set	      = is_request_details-target_entity_set
      iv_entity_type      = is_request_details-target_entity
      iv_tech_entity_set  = is_request_details-technical_request-target_entity_set
      iv_tech_entity_type = is_request_details-technical_request-target_entity_type
      iv_multiplicity     = iv_multiplicity
      iv_expand	          = iv_expand
      iv_tech_expand      = iv_tech_expand
    ).

    lo_model = me->get_model( ).
    lo_expand_tree->add_metadata(
      io_model = lo_model
    ).

    lo_expand_tree->get_root(
      IMPORTING
        eo_root = ro_entity_descriptor
     ).

  ENDMETHOD.


  METHOD get_expand_objects.

    DATA:
      lo_model              TYPE REF TO /iwbep/if_mgw_odata_fw_model,
      ls_parameter          TYPE /iwbep/s_mgw_name_value_pair,
      lv_expand_string      TYPE string,
      lv_tech_expand_string TYPE string.

* Create Technical Request Object

    CLEAR ls_parameter.
    READ TABLE is_request_details-parameters
      WITH KEY name = gcs_parameters-expand
      INTO ls_parameter.

    IF sy-subrc EQ 0.
      lv_expand_string      = ls_parameter-value.
      lv_tech_expand_string = is_request_details-technical_request-expand.
    ENDIF.

    lo_model = me->get_model( ).

    IF NOT is_request_details-technical_request-select_strings_h IS INITIAL.
      eo_expand_tree = /iwbep/cl_mgw_expand_tree=>create(
                      iv_entity_set            = is_request_details-target_entity_set
                      iv_entity_type           = is_request_details-target_entity
                      iv_tech_entity_set       = is_request_details-technical_request-target_entity_set
                      iv_tech_entity_type      = is_request_details-technical_request-target_entity_type
                      iv_multiplicity          = iv_cardinality
                      iv_expand                = lv_expand_string
                      iv_tech_expand           = lv_tech_expand_string
                      it_select_prop           = is_request_details-technical_request-select_strings_h
                      iv_select_path_separator = '-'
                      it_select_navi           = is_request_details-technical_request-select_navis
                      io_model                 = lo_model ).
    ELSE.
      eo_expand_tree = /iwbep/cl_mgw_expand_tree=>create(
                      iv_entity_set       = is_request_details-target_entity_set
                      iv_entity_type      = is_request_details-target_entity
                      iv_tech_entity_set  = is_request_details-technical_request-target_entity_set
                      iv_tech_entity_type = is_request_details-technical_request-target_entity_type
                      iv_multiplicity     = iv_cardinality
                      iv_expand           = lv_expand_string
                      iv_tech_expand      = lv_tech_expand_string
                      it_select_prop      = is_request_details-technical_request-select_strings
                      it_select_navi      = is_request_details-technical_request-select_navis
                      io_model            = lo_model ).
    ENDIF.

    eo_expand_tree->add_metadata(
      io_model = lo_model
    ).

    eo_expand_tree->get_root(
      IMPORTING
        eo_root = eo_expand_root
     ).

  ENDMETHOD.


  METHOD get_key_tab.
    DATA: lt_key_properties TYPE        /iwbep/cl_mgw_expand_node=>ty_t_key_properties,
          lr_key_property   TYPE REF TO /iwbep/cl_mgw_expand_node=>ty_s_key_property,
          ls_key            TYPE        /iwbep/s_mgw_name_value_pair,
          lt_properties     TYPE /iwbep/if_mgw_odata_fw_prop=>ty_t_mgw_odata_properties,
          ls_property       TYPE /iwbep/if_mgw_odata_fw_prop=>ty_s_mgw_odata_property,
          lo_entity_set     TYPE REF TO /iwbep/if_mgw_odata_re_eset,
          lx_med            TYPE REF TO /iwbep/cx_mgw_med_exception.

    FIELD-SYMBOLS: <lv_key_value> TYPE any.

    lt_key_properties = io_expand_node->get_key_properties( ).

    " Necessary information for conversion of key fields
    lt_properties = io_expand_node->get_properties( ).
    lo_entity_set ?= mo_model->/iwbep/if_mgw_odata_re_model~get_entity_set( io_expand_node->/iwbep/if_mgw_odata_expand~get_tech_entity_set( ) ).

    LOOP AT lt_key_properties REFERENCE INTO lr_key_property.
      ASSIGN COMPONENT lr_key_property->*-abap_name OF STRUCTURE is_data TO <lv_key_value>.
      ls_key-name  = lr_key_property->*-name.
      ls_key-value = <lv_key_value>.

      CLEAR ls_property.
      READ TABLE lt_properties INTO ls_property WITH KEY technical_name = lr_key_property->*-abap_name.

      " Check if conversion is needed
      IF  sy-subrc = 0
      AND ls_property-property->get_no_conversion( ) = abap_false
      AND lo_entity_set IS BOUND.

        TRY.
            /iwbep/cl_mgw_data_helper=>convert_key_property_outbound(
              EXPORTING
                iv_source                   = <lv_key_value>
                io_property                 = ls_property-property
                io_entity_set               = lo_entity_set
              IMPORTING
                ev_target                   = ls_key-value ).

          CATCH /iwbep/cx_mgw_med_exception INTO lx_med.
            RAISE EXCEPTION TYPE /iwbep/cx_mgw_tech_exception
              EXPORTING
                previous = lx_med.

        ENDTRY.

      ENDIF.

      INSERT ls_key INTO TABLE rt_key_tab.
    ENDLOOP.

  ENDMETHOD.


  METHOD get_model.

    DATA: lv_class_name                TYPE string,
          lv_internal_service_version  TYPE  /iwbep/med_grp_version,
          lv_internal_service_name     TYPE /iwbep/med_grp_technical_name,
          lo_metadata_provider         TYPE REF TO /iwbep/if_mgw_med_provider,
          ls_default_system_alias_info TYPE /iwbep/s_defi_alias_info.

    IF mo_model IS NOT BOUND.

*---get service details from context
      mo_context->get_parameter(
        EXPORTING
          iv_name  = /iwbep/if_mgw_context=>gc_param_isn
        IMPORTING
          ev_value = lv_internal_service_name ).

      mo_context->get_parameter(
        EXPORTING
          iv_name  = /iwbep/if_mgw_context=>gc_param_isv
        IMPORTING
          ev_value = lv_internal_service_version ).

      lo_metadata_provider = /iwbep/cl_mgw_med_provider=>get_med_provider( ).
      ls_default_system_alias_info = mo_context->get_system_alias_info( ).
      lo_metadata_provider->initialize(
        EXPORTING
          is_default_system_alias_info = ls_default_system_alias_info     " System Alias Information
          iv_is_busi_data_request      = abap_true                        " TRUE if the request is for busi data - smaller metadata
      ).

      CALL FUNCTION '/IWBEP/FM_MGW_MODEL_LOAD_SET'.

      mo_model ?= lo_metadata_provider->get_service_metadata(
                    iv_internal_service_name    = lv_internal_service_name
                    iv_internal_service_version = lv_internal_service_version
                  ).

      CALL FUNCTION '/IWBEP/FM_MGW_MODEL_LOAD_RESET'.

      " Set Model for handle_conversion_error() in data_helper
      /iwbep/cl_mgw_data_helper=>set_model( mo_model ).
    ENDIF.

    ro_model = mo_model.

    IF mo_sutil_runtime IS NOT BOUND.
      mo_sutil_runtime = /iwbep/cl_sutil_runtime=>get_instance( ).
    ENDIF.

    IF mv_provider_class IS INITIAL.
      lv_class_name = cl_abap_classdescr=>get_class_name( me ).
      SHIFT lv_class_name BY 7 PLACES.
      mv_provider_class = lv_class_name.
    ENDIF.

  ENDMETHOD.


  METHOD get_tech_key_tab.

    DATA:
      lt_key_properties TYPE        /iwbep/cl_mgw_expand_node=>ty_t_key_properties,
      lr_key_property   TYPE REF TO /iwbep/cl_mgw_expand_node=>ty_s_key_property,
      ls_key            TYPE        /iwbep/s_mgw_tech_pair,
      lt_properties     TYPE /iwbep/if_mgw_odata_fw_prop=>ty_t_mgw_odata_properties,
      ls_property       TYPE /iwbep/if_mgw_odata_fw_prop=>ty_s_mgw_odata_property,
      lo_entity_set     TYPE REF TO /iwbep/if_mgw_odata_re_eset,
      lx_med            TYPE REF TO /iwbep/cx_mgw_med_exception.

    FIELD-SYMBOLS: <lv_key_value> TYPE any.

    lt_key_properties = io_expand_node->get_key_properties( ).

    " Necessary information for conversion of key properties
    lt_properties = io_expand_node->get_properties( ).
    lo_entity_set ?= mo_model->/iwbep/if_mgw_odata_re_model~get_entity_set( io_expand_node->/iwbep/if_mgw_odata_expand~get_tech_entity_set( ) ).

    LOOP AT lt_key_properties REFERENCE INTO lr_key_property.
      ASSIGN COMPONENT lr_key_property->*-abap_name OF STRUCTURE is_data TO <lv_key_value>.
      ls_key-name  = lr_key_property->*-abap_name.
      ls_key-value = <lv_key_value>.

      CLEAR ls_property.
      READ TABLE lt_properties INTO ls_property WITH KEY technical_name = lr_key_property->*-abap_name.

      " Check if conversion is needed for specific key property
      IF  sy-subrc = 0
      AND ls_property-property->get_no_conversion( ) = abap_false
      AND lo_entity_set IS BOUND.
        TRY.
            /iwbep/cl_mgw_data_helper=>convert_key_property_outbound(
              EXPORTING
                iv_source                   = <lv_key_value>
                io_property                 = ls_property-property
                io_entity_set               = lo_entity_set
              IMPORTING
                ev_target                   = ls_key-value ).

          CATCH /iwbep/cx_mgw_med_exception INTO lx_med.
            RAISE EXCEPTION TYPE /iwbep/cx_mgw_tech_exception
              EXPORTING
                previous = lx_med.

        ENDTRY.
      ENDIF.

      INSERT ls_key INTO TABLE rt_key_tab.
    ENDLOOP.

  ENDMETHOD.


  METHOD move_entity_set.

    DATA lv_time_start TYPE i.
    DATA lv_time_stop  TYPE i.

    IF iv_apply_conversions EQ abap_true.
      GET RUN TIME FIELD lv_time_start.
      /iwbep/cl_mgw_data_helper=>convert_entityset_outb(
        EXPORTING
          io_expand_node        = io_expand_root
          it_source_table       = it_source_table
          iv_add_sap_origin     = is_request_details-technical_request-co_deployment_info-is_moc
          iv_system_alias       = is_request_details-system_alias_info-system_alias
          iv_supports_move_corr = iv_supports_move_corr
        CHANGING
          ct_target_table       = ct_target_table ).

      GET RUN TIME FIELD lv_time_stop.
      me->add_performance_data(
        iv_class      = '/IWBEP/CL_MGW_DATA_HELPER'
        iv_method     = 'CONVERT_ENTITYSET_OUTB'
        iv_agent      = 'Data Conversion'                   "#EC NOTEXT
        iv_time_start = lv_time_start
        iv_time_stop  = lv_time_stop ).

    ELSE.
      move_corresponding(
        EXPORTING
          id_source_data        = it_source_table
          iv_supports_move_corr = abap_false
        IMPORTING
          ed_target_data        = ct_target_table ).

      add_sap_origin_entityset(
          EXPORTING
            is_request_details = is_request_details
          CHANGING
            ct_entityset       = ct_target_table ).
    ENDIF.

  ENDMETHOD.


  METHOD post_process_read_entity.

    DATA:
      ls_request_context    TYPE /iwbep/if_mgw_core_srv_runtime=>ty_s_mgw_request_context,
      ls_parameter          TYPE /iwbep/s_mgw_name_value_pair,
      lv_expand_string      TYPE string,
      lv_if_modified_since  TYPE tzntstmps,
      lv_type_expected      TYPE string,
      lo_struct_descr       TYPE REF TO cl_abap_structdescr,
      lo_type_descr         TYPE REF TO cl_abap_typedescr,
      lr_target_struct      TYPE REF TO data,
      lv_model_no_conv      TYPE abap_bool,
      lv_supports_move_corr TYPE abap_bool.

    FIELD-SYMBOLS:
      <ls_source_structure> TYPE data,
      <ls_target_structure> TYPE data.

    ls_request_context = io_request_obj->get_request_details( ).
    READ TABLE ls_request_context-parameters
      WITH KEY name = gcs_parameters-expand
      INTO ls_parameter.
    IF sy-subrc EQ 0.
      lv_expand_string = ls_parameter-value.
    ENDIF.

    IF lv_expand_string IS NOT INITIAL.

      " Initial Inlines Handling: Same order as defined in Model Provider
      create_inline_info(
        EXPORTING
          io_expand_node = io_expand_root
          ir_data        = cr_entity
        CHANGING
          ct_inline_info = ct_inline_info ).

      sort_inline_info(
        EXPORTING
          iv_expand_string   = lv_expand_string
          iv_entity_set_name = ls_request_context-technical_request-target_entity_set
        CHANGING
          ct_inline_info     = ct_inline_info ).

    ENDIF.

    io_expand_root->is_move_corr_supported(
      IMPORTING
        ev_supports_move_corr = lv_supports_move_corr ).

    "Common handling and checks for Cache-Control and If-Modified-Since
    lv_if_modified_since = io_request_obj->/iwbep/if_mgw_req_entity~get_if_modified_since( ).
    /iwbep/cl_mgw_dp_util=>handle_cache_control(
      EXPORTING
        iv_if_modified_since     = lv_if_modified_since
        io_provider              = me
        it_header                = it_header
      CHANGING
        cs_response_entity_cntxt = cs_response_context ).

    "data does not need to be sent in case not modidied
    IF cs_response_context-is_not_modified EQ /iwbep/if_mgw_appl_types=>gcs_modification_status-is_not_modified.
      CLEAR cr_entity.
    ENDIF.

    IF cr_entity IS BOUND.

*   if cr_entity is bound it has to be a struct/flat type - nothing else is allowed here
      lo_type_descr = cl_abap_typedescr=>describe_by_data_ref( cr_entity ).
      IF ( lo_type_descr->kind <> cl_abap_typedescr=>kind_struct ) AND
         ( lo_type_descr->kind <> cl_abap_typedescr=>kind_elem ).
        lv_type_expected = TEXT-str.
        RAISE EXCEPTION TYPE /iwbep/cx_mgw_tech_exception
          EXPORTING
            textid        = /iwbep/cx_mgw_tech_exception=>wrong_data_container
            type_expected = lv_type_expected.
      ENDIF.

      ASSIGN cr_entity->* TO <ls_source_structure>.

      lo_struct_descr ?= io_expand_root->create_data_descriptor( iv_is_for_hub = abap_true
                                                                 iv_add_sap_origin = ls_request_context-technical_request-co_deployment_info-is_moc ).
      CREATE DATA lr_target_struct TYPE HANDLE lo_struct_descr.
      ASSIGN lr_target_struct->* TO <ls_target_structure>.

      lv_model_no_conv = io_model->get_no_conversion( ).

      IF lv_model_no_conv = abap_false.
        io_expand_root->check_conversions( ).
        IF io_expand_root->get_no_conversion( ) = abap_false.
          /iwbep/cl_mgw_data_helper=>convert_entity_outb(
            EXPORTING
              io_expand_node      = io_expand_root
              is_source_structure = <ls_source_structure>
              iv_supports_move_corr = lv_supports_move_corr
            CHANGING
              cs_target_structure = <ls_target_structure> ).
        ELSE.
          move_corresponding(
            EXPORTING
              id_source_data = <ls_source_structure>
              iv_supports_move_corr = abap_false
            IMPORTING
              ed_target_data = <ls_target_structure> ).

          add_sap_origin_entity(
            EXPORTING
             is_request_details = ls_request_context
            CHANGING
             cs_entity          = <ls_target_structure> ).
        ENDIF.
      ELSE.
        move_corresponding(
         EXPORTING
           id_source_data = <ls_source_structure>
           iv_supports_move_corr = abap_false
         IMPORTING
           ed_target_data = <ls_target_structure> ).

        add_sap_origin_entity(
          EXPORTING
           is_request_details = ls_request_context
          CHANGING
           cs_entity          = <ls_target_structure> ).
      ENDIF.
      cr_entity = lr_target_struct.
    ENDIF.

    ct_header = it_header.

  ENDMETHOD.


  METHOD post_process_read_entityset.

    DATA:
      ls_request_context       TYPE /iwbep/if_mgw_core_srv_runtime=>ty_s_mgw_request_context,
      lv_is_cache_and_page_ok  TYPE abap_bool,
      lv_expand_string         TYPE string,
      ls_parameter             TYPE /iwbep/s_mgw_name_value_pair,
      lv_if_modified_since     TYPE tzntstmps,
      lo_table_descr           TYPE REF TO cl_abap_tabledescr,
      lr_target_table          TYPE REF TO data,
      lr_deleted_target_table  TYPE REF TO data,
      lv_apply_conversions     TYPE abap_bool,
      lv_successful_serialized TYPE abap_bool,
      lv_supports_move_corr    TYPE abap_bool,
      lv_request_service_name  TYPE string.

    FIELD-SYMBOLS:
      <lt_source_table> TYPE ANY TABLE,
      <lt_target_table> TYPE ANY TABLE.



    ls_request_context = io_request_obj->get_request_details( ).

**********************************************************************
*   Expand
**********************************************************************
    ls_request_context = io_request_obj->get_request_details( ).
    READ TABLE ls_request_context-parameters
      WITH KEY name = gcs_parameters-expand
      INTO ls_parameter.

    IF sy-subrc EQ 0.
      lv_expand_string = ls_parameter-value.
      IF lv_expand_string IS NOT INITIAL.
        " Initial Inlines Handling: Same order as defined in Model Provider
        create_inline_info(
          EXPORTING
            io_expand_node = io_expand_root
            ir_data        = cr_entityset
          CHANGING
            ct_inline_info = ct_inline_info ).

        sort_inline_info(
          EXPORTING
            iv_expand_string   = lv_expand_string
            iv_entity_set_name = ls_request_context-technical_request-target_entity_set
          CHANGING
            ct_inline_info     = ct_inline_info ).

      ENDIF.
    ENDIF.


**********************************************************************
*   Common handling and checks for Cache-Control and If-Modified-Since
**********************************************************************
    lv_if_modified_since = io_request_obj->/iwbep/if_mgw_req_entityset~get_if_modified_since( ).
    /iwbep/cl_mgw_dp_util=>handle_cache_control(
      EXPORTING
        iv_if_modified_since = lv_if_modified_since
        io_provider          = me
        it_header            = it_header
      CHANGING
        cs_response_context  = cs_response_context ).

    " Data does not need to be sent in case not modified
    IF cs_response_context-is_not_modified EQ /iwbep/if_mgw_appl_types=>gcs_modification_status-is_not_modified.
      CLEAR cr_entityset.
    ENDIF.


**********************************************************************
*   sQRC - softstate based Query Result Cache
**********************************************************************
    " Check if caching has been requested "illegally"
    IF ( cs_response_context-do_cache_and_page_on_hub = abap_true ).
      lv_is_cache_and_page_ok = io_request_obj->/iwbep/if_mgw_req_entityset~is_cache_page_on_hb_allowed( ).
      IF ( lv_is_cache_and_page_ok = abap_false ). "BAD Data Provider. Check the flag before requesting cache and page on hub
        IF ls_request_context-technical_request-is_ral_relevant EQ abap_true.
          RAISE EXCEPTION TYPE /iwbep/cx_mgw_tech_exception
            EXPORTING
              textid = /iwbep/cx_mgw_tech_exception=>cache_on_hub_not_allowed_ral.
        ELSE.
          RAISE EXCEPTION TYPE /iwbep/cx_mgw_tech_exception
            EXPORTING
              textid = /iwbep/cx_mgw_tech_exception=>cache_on_hub_not_allowed.
        ENDIF.
      ENDIF.
    ENDIF.


**********************************************************************
*   CRP - Cache Request Processing
**********************************************************************
    " application intends to use cached request processing
    IF NOT cs_response_context-crp_provider_request IS INITIAL.
      IF io_request_obj->/iwbep/if_mgw_req_entityset~is_crp_request_caching_allowed( ) EQ abap_true.

        IF cs_response_context-do_cache_and_page_on_hub EQ abap_true OR
           cs_response_context-skiptoken IS NOT INITIAL.
          RAISE EXCEPTION TYPE /iwbep/cx_mgw_tech_exception
            EXPORTING
              textid = /iwbep/cx_mgw_tech_exception=>cache_on_hub_not_for_crp.
        ENDIF.

        " Depending on the status of the transformation
        " - ready     => set all information needed for cached request processing
        " - not ready => start async creation of transformation
        prepare_crp_handling(
          EXPORTING
            is_request_context           = ls_request_context
            io_model                     = io_model
            io_request                   = io_request_obj
          CHANGING
            cs_response_context          = cs_response_context
            cr_entityset                 = cr_entityset ).

      ELSE.
        RAISE EXCEPTION TYPE /iwbep/cx_mgw_tech_exception
          EXPORTING
            textid = /iwbep/cx_mgw_tech_exception=>request_caching_not_allowed.
      ENDIF.
    ENDIF.


    IF cr_entityset IS BOUND.

**********************************************************************
*     $count
**********************************************************************
      IF io_request_obj->/iwbep/if_mgw_req_entityset~has_count( ) EQ abap_true. " count request
        IF cs_response_context-count IS INITIAL.
          ASSIGN cr_entityset->* TO <lt_source_table>.
          cs_response_context-count = lines( <lt_source_table> ).
        ENDIF.
        ct_header = it_header.
        RETURN.
      ENDIF.


**********************************************************************
*     Serialize via ST
**********************************************************************
      IF io_request_obj->/iwbep/if_mgw_req_entityset~get_deltatoken( ) IS INITIAL.
        lv_request_service_name = ls_request_context-request_service_name.
        IF lv_request_service_name IS INITIAL.
          lv_request_service_name = ls_request_context-service_doc_name.
        ENDIF.
        serialize_with_transformation(
          EXPORTING
            is_request_details           = ls_request_context
            is_response_context          = cs_response_context
            iv_service_doc_name          = lv_request_service_name
            io_request                   = io_request_obj
            io_model                     = io_model
            iv_expand_string             = lv_expand_string
            io_expand_root               = io_expand_root
          IMPORTING
            ev_successful_serialized     = lv_successful_serialized
          CHANGING
            cr_entityset                 = cr_entityset
            cv_response_body             = cv_response_body  ).
      ENDIF.

      IF lv_successful_serialized = abap_true .
        ASSIGN cr_entityset->* TO <lt_source_table>.
        cs_response_context-is_target_format = abap_true.
        ASSIGN cr_entityset->* TO <lt_source_table>.
        cs_response_context-st_entityset_count = lines( <lt_source_table> ).
        cs_response_context-st_response_size = xstrlen( cv_response_body ).
        CLEAR cr_entityset.


      ELSE. "ST was not used successful:
**********************************************************************
*       Serialize via the lib on the hub
**********************************************************************
        io_expand_root->is_move_corr_supported( IMPORTING ev_supports_move_corr = lv_supports_move_corr ).

        IF io_model->get_no_conversion( ) = abap_false.
          io_expand_root->check_conversions( ).
          IF io_expand_root->get_no_conversion( ) = abap_false.
            lv_apply_conversions = abap_true.
          ENDIF.
        ENDIF.

        " Copy data to have the same structure as in hub system (needed for SHORTCUT)
        ASSIGN cr_entityset->* TO <lt_source_table>.
        " Create hub container
        lo_table_descr ?= io_expand_root->create_data_descriptor( iv_is_for_hub = abap_true
                                                                  iv_add_sap_origin = ls_request_context-technical_request-co_deployment_info-is_moc ).

        CREATE DATA lr_target_table TYPE HANDLE lo_table_descr.
        ASSIGN lr_target_table->* TO <lt_target_table>.

        move_entity_set(
          EXPORTING
            iv_apply_conversions         = lv_apply_conversions
            io_expand_root               = io_expand_root
            is_request_details           = ls_request_context
            it_source_table              = <lt_source_table>
            iv_supports_move_corr        = lv_supports_move_corr
          CHANGING
            ct_target_table              = <lt_target_table> ).

        cr_entityset = lr_target_table.
      ENDIF.
    ENDIF.


**********************************************************************
*   Delta Response
**********************************************************************
    IF cr_deleted_entityset IS BOUND.

      ASSIGN cr_deleted_entityset->* TO <lt_source_table>.

      " Create hub container only if cr_entityset was not processed
      IF lo_table_descr IS NOT BOUND.
        lo_table_descr ?= io_expand_root->create_data_descriptor( iv_is_for_hub = abap_true
                                                                  iv_add_sap_origin = ls_request_context-technical_request-co_deployment_info-is_moc ).
      ENDIF.

      CREATE DATA lr_deleted_target_table TYPE HANDLE lo_table_descr.
      ASSIGN lr_deleted_target_table->* TO <lt_target_table>.

      move_entity_set(
        EXPORTING
          iv_apply_conversions         = lv_apply_conversions
          io_expand_root               = io_expand_root
          is_request_details           = ls_request_context
          it_source_table              = <lt_source_table>
          iv_supports_move_corr        = lv_supports_move_corr
        CHANGING
          ct_target_table              = <lt_target_table> ).

      cr_deleted_entityset = lr_deleted_target_table.
    ENDIF.


    ct_header = it_header.

  ENDMETHOD.


  METHOD prepare_crp_handling.

    " is_request_context and io_request are redundant
    " both are part of the signature for performance reasons

    DATA lo_st_manager                TYPE REF TO /iwbep/if_mgw_st_man_runtime.
    DATA lv_last_modified             TYPE tzntstmps.
    DATA lv_is_st_ready               TYPE abap_bool.
    DATA lv_is_st_deactivated         TYPE abap_bool.
    DATA lo_entity_set                TYPE REF TO /iwbep/cl_mgw_odata_entity_set.
    DATA lt_select_complete           TYPE string_table.
    DATA lv_select                    TYPE string.
    DATA ls_request_uri               TYPE ihttpnvp.
    DATA ls_st_key                    TYPE /iwbep/s_st_service_ent_ident.



    lv_last_modified = io_model->get_cache_timestamp( ).

    ls_st_key-service_name     = is_request_context-technical_request-service_name.
    ls_st_key-service_version  = is_request_context-technical_request-service_version.
    ls_st_key-entity_type_name = is_request_context-technical_request-target_entity_type.

    lo_st_manager = /iwbep/cl_mgw_st_manager=>create_runtime_instance(
                    is_st_key        = ls_st_key
                    iv_last_modified = lv_last_modified ).

    lo_st_manager->get_status(
      IMPORTING
        ev_is_st_ready       = lv_is_st_ready
        ev_is_st_deactivated = lv_is_st_deactivated ).

    " whether the simple transformation can be used or not has already been checked
    " in IS_CRP_REQUEST_CACHING_ALLOWED - if there is a difference then the response context
    " has imposed additional restrictions -> framework error
    ASSERT lv_is_st_deactivated EQ abap_false.

    IF lv_is_st_ready EQ abap_true.

      cs_response_context-crp_service_info-service_technical_name = is_request_context-technical_request-service_name.
      cs_response_context-crp_service_info-service_version        = is_request_context-technical_request-service_version.
      cs_response_context-crp_service_info-data_provider_class    = mv_provider_class.
      cs_response_context-crp_service_info-model_provider_class   = io_model->get_model_provider_class_name( ).
      cs_response_context-crp_service_info-metadata_last_modified = lv_last_modified.

      create_placeholder_info(
        EXPORTING
          io_request          = io_request
        CHANGING
          cs_response_context = cs_response_context ).

      " add mandatory fields delta
      lt_select_complete = io_request->/iwbep/if_mgw_req_entityset~get_select_with_mandtry_fields( abap_true ).
      LOOP AT lt_select_complete INTO lv_select.
        READ TABLE is_request_context-technical_request-select_strings_h TRANSPORTING NO FIELDS
          WITH KEY table_line = lv_select.
        IF sy-subrc NE 0.
          APPEND lv_select TO cs_response_context-auto_add_selected_props.
        ENDIF.
      ENDLOOP.

      " store crp model information to check during cached request processing
      lo_entity_set ?= mo_model->/iwbep/if_mgw_odata_re_model~get_entity_set_by_tech_name( is_request_context-technical_request-target_entity_set ).
      IF lo_entity_set IS BOUND.
        cs_response_context-entity_set_crp_usage = lo_entity_set->/iwbep/if_mgw_odata_re_eset~get_use_crp( ).
      ENDIF.

    ELSEIF cr_entityset IS BOUND.

      " if ST still needs to be created the provider request cache must not be written
      " to avoid cache hits without having the ST at hand
      CLEAR cs_response_context-crp_provider_request.

      READ TABLE is_request_context-technical_request-request_header
        WITH KEY name = '~request_uri'
        INTO     ls_request_uri.

      lo_st_manager->create_transformation_async(
        EXPORTING
          iv_default_schema_namespace = is_request_context-service_doc_name
          iv_request_uri              = ls_request_uri-value
          iv_is_for_expand            = abap_false
          ir_entity_data              = cr_entityset ).

    ENDIF.

  ENDMETHOD.


  METHOD pre_process_read_entityset.

    DATA: ls_parameter      TYPE /iwbep/s_mgw_name_value_pair.
    DATA: lv_class_name     TYPE string.


    correct_select_options( CHANGING cs_request_context = cs_request_context ).

    IF /iwbep/cl_mgw_util_versions=>get_hub_version( )-gwfnd_version < '014'.
      convert_filter_select_options( CHANGING cs_request_context = cs_request_context ).
    ENDIF.


    eo_request_obj = create_request_object(
                       it_headers         = it_header
                       is_request_details = cs_request_context ).

    ev_search_string = eo_request_obj->/iwbep/if_mgw_req_entityset~get_search_string( ).


    IF mv_provider_class IS INITIAL.
      lv_class_name = cl_abap_classdescr=>get_class_name( me ).
      SHIFT lv_class_name BY 7 PLACES.
      mv_provider_class = lv_class_name.
    ENDIF.


    CLEAR ls_parameter.
    READ TABLE cs_request_context-parameters
      WITH KEY name = gcs_parameters-filter
      INTO ls_parameter.
    IF sy-subrc EQ 0.
      ev_filter_string = ls_parameter-value.
    ENDIF.


    CLEAR ls_parameter.
    READ TABLE cs_request_context-parameters
      WITH KEY name = gcs_parameters-expand
      INTO ls_parameter.
    IF sy-subrc EQ 0.
      ev_expand_string      = ls_parameter-value.
      ev_tech_expand_string = cs_request_context-technical_request-expand.
    ENDIF.


    IF cs_request_context-technical_request-expand_root IS NOT BOUND.
      get_expand_objects(
           EXPORTING
              is_request_details = cs_request_context
              iv_cardinality = /iwbep/if_mgw_med_odata_types=>gcs_cardinality-cardinality_0_n
           IMPORTING
              eo_expand_root = eo_expand_root
              eo_expand_tree = eo_expand_tree ).

      " Save EXPAND_ROOT for GET_SELECT_xxx
      cs_request_context-technical_request-expand_root = eo_expand_root.

    ELSE.
      eo_expand_root ?= cs_request_context-technical_request-expand_root.
      eo_expand_tree = /iwbep/cl_mgw_expand_tree=>create_from_root( io_root_node = eo_expand_root ).

    ENDIF.


    me->create_key_converters( CHANGING cs_request_context = cs_request_context ).


    IF eo_request_obj->/iwbep/if_mgw_req_entityset~get_deltatoken( ) IS NOT INITIAL.
      ev_method = '/IWBEP/IF_MGW_APPL_SRV_RUNTIME~GET_ENTITYSET_DELTA'.
    ELSEIF ev_expand_string IS NOT INITIAL.
      ev_method = '/IWBEP/IF_MGW_APPL_SRV_RUNTIME~GET_EXPANDED_ENTITYSET'.
    ELSE.
      ev_method = '/IWBEP/IF_MGW_APPL_SRV_RUNTIME~GET_ENTITYSET'.
    ENDIF.

  ENDMETHOD.


  METHOD read_expanded_entity.

    DATA: lt_expanded                   TYPE string_table,
          lt_expanded_tech_names        TYPE string_table,
          lv_tech_entity_set            TYPE /iwbep/mgw_tech_name,
          lr_entity                     TYPE REF TO data,
          ls_resp_entity_cntxt          TYPE /iwbep/if_mgw_core_srv_runtime=>ty_s_mgw_response_entity_cntxt,
          ls_respone_context            TYPE /iwbep/if_mgw_appl_srv_runtime=>ty_s_mgw_response_entity_cntxt,
          ls_response_context_old       TYPE /iwbep/if_mgw_core_srv_runtime=>ty_s_mgw_response_context,
          lv_sap_data_exists_calculated TYPE abap_bool VALUE abap_false.

    FIELD-SYMBOLS:
      <ls_entity>      TYPE any,
      <ls_entity_int>  TYPE any,
      <lv_data_exists> TYPE any.


*-assign local reference to cr_entity - either already expanded by app or expanded in next step
    lr_entity = cr_entity.


*-check whether current node is already expanded by app in step before
    IF io_expand_node->is_expanded( ) NE abap_true.

      ls_response_context_old = cs_response_context.

      me->/iwbep/if_mgw_appl_srv_runtime~get_expanded_entity(
        EXPORTING
          iv_entity_name            = iv_entity_name
          iv_entity_set_name        = is_request_details-target_entity_set
          iv_source_name            = iv_source_name
          it_key_tab                = is_request_details-key_tab
          it_navigation_path        = is_request_details-navigation_path
          io_expand                 = io_expand_node
          io_tech_request_context   = io_tech_request_context
        IMPORTING
          er_entity                 = lr_entity               " either new ref by app or given ref filled with data
          et_expanded_clauses       = lt_expanded             " obsolete, use et_expanded_tech_clauses instead
          et_expanded_tech_clauses  = lt_expanded_tech_names  " resolved expands (parts of it or whole expand) by application
          es_response_context       = ls_respone_context
      ).
      ls_resp_entity_cntxt-appl_response_context = ls_respone_context.

      lv_sap_data_exists_calculated = ls_resp_entity_cntxt-is_sap_data_exists_calculated.

      MOVE-CORRESPONDING ls_resp_entity_cntxt TO cs_response_context.

      "Choose response context for Expand in recursive call
      IF iv_top_level_context NE abap_true.
        select_expand_response_context(
          EXPORTING
            is_response_context_old = ls_response_context_old
          CHANGING
            cs_response_context     = cs_response_context ).
      ENDIF.

*---check lt_is_expanded and verify whether further processing is required
      IF ( lt_expanded_tech_names IS NOT INITIAL ). " check to save additional method call if nothing provided by app
        io_expand_node->handle_is_expanded_tech_names( lt_expanded_tech_names ).

      ELSEIF ( lt_expanded IS NOT INITIAL ). " obsolete coding supporting external names instead of internal names
        io_expand_node->handle_is_expanded( lt_expanded ).

      ENDIF.
    ENDIF.

*-if lr entity is not bound no entry was found - just skip
    IF lr_entity IS BOUND.
*---check wheter the given reference from the appl interface is the same - if yes app has filled the given struc ref
      ASSIGN cr_entity->* TO <ls_entity>.
      IF lr_entity NE cr_entity.
*-----it isn't the same ref - required to copy the data to the deep structure ref - deep copy if required
        IF go_rt_utility_750 IS BOUND AND
           iv_supports_move_corr EQ abap_true.
          ASSIGN lr_entity->* TO <ls_entity_int>.
          go_rt_utility_750->move_corresponding(
                              EXPORTING
                                ia_source_data = <ls_entity_int>
                              IMPORTING
                                ea_target_data = <ls_entity> ).
        ELSE.
          /iwbep/cl_mgw_data_helper=>move_corresponding(
            EXPORTING
              ir_source_data = lr_entity
            IMPORTING
              er_target_data = cr_entity
          ).
        ENDIF.
      ENDIF.

      " Set "SAP__DATA_EXISTS" flag for gateway system
      IF lt_expanded_tech_names IS INITIAL.
        IF lv_sap_data_exists_calculated EQ abap_false.
          "Don't change the value of SAP__DATA_EXISTS as it was already handled by the provider application
          ASSIGN COMPONENT /iwbep/cl_mgw_expand_node=>mc_sap_data_exists OF STRUCTURE <ls_entity> TO <lv_data_exists>.
          IF sy-subrc = 0.
            ASSIGN lr_entity->* TO <ls_entity>.
            IF <ls_entity> IS INITIAL.
              <lv_data_exists> = ' '.
            ELSE.
              <lv_data_exists> = 'X'.
            ENDIF.
          ENDIF.
        ENDIF.
      ELSE.
        IF lv_sap_data_exists_calculated EQ abap_false.
          "Don't change the value of SAP__DATA_EXISTS as it was already handled by the provider application
          set_sap_data_exists(
            EXPORTING
              it_expand = lt_expanded_tech_names
            CHANGING
              cv_entity = cr_entity
          ).
        ENDIF.
      ENDIF.

*---check whether current branch is fully handled e.g. completely expanded by application
      IF io_expand_node->is_branch_handled( ) = abap_true OR
         io_expand_node->/iwbep/if_mgw_odata_expand~is_expand_needed( ) = abap_false.
        RETURN.
      ENDIF.


*---dereference data
      ASSIGN cr_entity->* TO <ls_entity>.


*---expand the entity (recursively if required)
      lv_tech_entity_set = io_tech_request_context->get_entity_set_name( ).
      expand_entity(
        EXPORTING
          io_expand_node              = io_expand_node
          iv_source_entity_type       = iv_entity_name
          iv_tech_source_entity_type  = iv_tech_entity_name
          iv_tech_source_entity_set   = lv_tech_entity_set
          is_original_request_details = is_request_details
          iv_supports_move_corr       = iv_supports_move_corr
        CHANGING
          cs_entity                   = <ls_entity>
          cs_response_context         = cs_response_context
      ).

    ENDIF.


*-finally set the expanded flag on the node to false to take it into account in next call
    io_expand_node->set_is_expanded( abap_false ).

  ENDMETHOD.


  METHOD read_expanded_entityset.

    DATA: lv_class_name          TYPE string,
          lt_expanded            TYPE string_table,
          lt_expanded_tech_names TYPE string_table,
          lt_expand_skiptokens   TYPE string_table,
          lv_tech_entity_set     TYPE /iwbep/mgw_tech_name.

    DATA: lr_entityset                  TYPE REF TO data,
          lr_entity                     TYPE REF TO data,
          ls_response_context           TYPE /iwbep/if_mgw_appl_srv_runtime=>ty_s_mgw_response_context,
          ls_response_context_old       TYPE /iwbep/if_mgw_core_srv_runtime=>ty_s_mgw_response_context,
          lv_sap_data_exists_calculated TYPE abap_bool VALUE abap_false.

    FIELD-SYMBOLS: <lt_entityset>     TYPE ANY TABLE,
                   <lt_entityset_int> TYPE ANY TABLE,
                   <ls_entity>        TYPE any.



*-assign local reference to cr_entity - either already expanded by app or expanded in next step
    lr_entityset = cr_entityset.

*-check whether current node is already expanded by app in step before
    IF io_expand_node->is_expanded( ) NE abap_true.

      IF mo_sutil_runtime IS NOT BOUND.
        mo_sutil_runtime = /iwbep/cl_sutil_runtime=>get_instance( ).
      ENDIF.

      IF mv_provider_class IS INITIAL.
        lv_class_name = cl_abap_classdescr=>get_class_name( me ).
        SHIFT lv_class_name BY 7 PLACES.
        mv_provider_class = lv_class_name.
      ENDIF.

      ls_response_context_old = cs_response_context.

      me->/iwbep/if_mgw_appl_srv_runtime~get_expanded_entityset(
        EXPORTING
          iv_entity_name            = iv_entity_name
          iv_entity_set_name        = is_request_details-target_entity_set
          iv_source_name            = iv_source_name
          it_navigation_path        = is_request_details-navigation_path
          is_paging                 = is_paging
          it_order                  = it_order
          it_filter_select_options  = it_filter_select_options
          it_key_tab                = is_request_details-key_tab
          iv_filter_string          = iv_filter_string
          iv_search_string          = iv_search_string
          io_expand                 = io_expand_node
          io_tech_request_context   = io_tech_request_context
        IMPORTING
          er_entityset              = lr_entityset
          et_expanded_clauses       = lt_expanded             " obsolete, use et_expanded_tech_clauses instead
          et_expanded_tech_clauses  = lt_expanded_tech_names  " resolved expands (parts of it or whole expand) by application
          es_response_context       = ls_response_context ).

      " Add new skiptoken to the table of already expanded entityset
      lt_expand_skiptokens = cs_response_context-appl_response_context-expand_skiptokens.
      APPEND LINES OF ls_response_context-expand_skiptokens TO lt_expand_skiptokens.
      cs_response_context-appl_response_context = ls_response_context.
      cs_response_context-appl_response_context-expand_skiptokens = lt_expand_skiptokens.

      lv_sap_data_exists_calculated = ls_response_context-is_sap_data_exists_calculated.

      "Choose response context for Expand in recursive call
      IF iv_top_level_context NE abap_true.
        select_expand_response_context(
          EXPORTING
            is_response_context_old = ls_response_context_old
          CHANGING
            cs_response_context     = cs_response_context ).
      ENDIF.

*---check lt_is_expanded and verify whether further processing is required
      IF ( lt_expanded_tech_names IS NOT INITIAL ). " check to save additional method call if nothing provided by app
        io_expand_node->handle_is_expanded_tech_names( lt_expanded_tech_names ).

      ELSEIF ( lt_expanded IS NOT INITIAL ). " obsolete coding supporting external names instead of internal names
        io_expand_node->handle_is_expanded( lt_expanded ).

      ENDIF.

    ENDIF.

*---dereference data
    ASSIGN cr_entityset->* TO <lt_entityset>.

*-if lr entityset is not bound no data was found - just skip
    IF lr_entityset IS BOUND.
*---check wheter exported reference is the same
      IF lr_entityset NE cr_entityset.
*-----it isn't the same ref - required to copy the data to the deep structure ref
        IF go_rt_utility_750 IS BOUND AND
           iv_supports_move_corr EQ abap_true.
          ASSIGN lr_entityset->* TO <lt_entityset_int>.
          go_rt_utility_750->move_corresponding(
                              EXPORTING
                                ia_source_data = <lt_entityset_int>
                              IMPORTING
                                ea_target_data = <lt_entityset> ).
        ELSE.
          /iwbep/cl_mgw_data_helper=>move_corresponding(
            EXPORTING
              ir_source_data = lr_entityset
            IMPORTING
              er_target_data = cr_entityset
          ).
        ENDIF.
      ENDIF.

      IF    NOT lt_expanded_tech_names IS INITIAL
        AND lv_sap_data_exists_calculated EQ abap_false.
        "Don't change the value of SAP__DATA_EXISTS as it was already handled by the provider application
        LOOP AT <lt_entityset> REFERENCE INTO lr_entity.
          set_sap_data_exists(
            EXPORTING
              it_expand = lt_expanded_tech_names
            CHANGING
              cv_entity = lr_entity ).
        ENDLOOP.
      ENDIF.

*---check whether current branch is fully handled e.g. completely expanded by application
      IF io_expand_node->is_branch_handled( ) = abap_true OR
         io_expand_node->/iwbep/if_mgw_odata_expand~is_expand_needed( ) = abap_false.
        RETURN.
      ENDIF.

      lv_tech_entity_set = io_tech_request_context->get_entity_set_name( ).

      LOOP AT <lt_entityset> ASSIGNING <ls_entity>.

*-----expand the entity
        expand_entity(
          EXPORTING
            io_expand_node              = io_expand_node
            iv_source_entity_type       = iv_entity_name
            iv_tech_source_entity_type  = iv_tech_entity_name
            iv_tech_source_entity_set   = lv_tech_entity_set
            is_original_request_details = is_request_details
            iv_supports_move_corr       = iv_supports_move_corr
          CHANGING
            cs_entity                   = <ls_entity>
            cs_response_context         = cs_response_context
        ).

      ENDLOOP.
    ENDIF.

*-finally set the expanded flag on the node to false to take it into account in next call
    io_expand_node->set_is_expanded( abap_false ).

  ENDMETHOD.


  METHOD select_expand_response_context.

    DATA:
        lx_busi_exception   TYPE REF TO /iwbep/cx_mgw_busi_exception.


* count / inlinecount / do_cache_and_page_on_hub:
* only the top level value is valid
    IF cs_response_context-count <> is_response_context_old-count.
      cs_response_context-count = is_response_context_old-count.
    ENDIF.
    IF cs_response_context-inlinecount <> is_response_context_old-inlinecount.
      cs_response_context-inlinecount = is_response_context_old-inlinecount.
    ENDIF.
    IF cs_response_context-do_cache_and_page_on_hub <> is_response_context_old-do_cache_and_page_on_hub.
      cs_response_context-do_cache_and_page_on_hub = is_response_context_old-do_cache_and_page_on_hub.
    ENDIF.

** skiptoken / expand_skiptokens:
*  values should remain as they are in CS_RESPONSE_CONTEXT

* last modified
    IF is_response_context_old-last_modified <> cs_response_context-last_modified.
      "clear last modified if one is initial
      IF is_response_context_old-last_modified IS INITIAL OR
           cs_response_context-last_modified IS INITIAL.
        CLEAR cs_response_context-last_modified.
        "select the youngest last modified
      ELSEIF is_response_context_old-last_modified < cs_response_context-last_modified.
        cs_response_context-last_modified = is_response_context_old-last_modified.
      ENDIF.
    ENDIF.

* is not modified
    IF is_response_context_old-is_not_modified <> cs_response_context-is_not_modified.
      CREATE OBJECT lx_busi_exception
        TYPE
        /iwbep/cx_mgw_busi_exception
        EXPORTING
          textid      = /iwbep/cx_mgw_busi_exception=>is_not_modified_diff_values
          sap_note_id = gc_note_id_cache_control.
      RAISE EXCEPTION lx_busi_exception.
    ENDIF.

* max age
    IF is_response_context_old-max_age <> cs_response_context-max_age.
      "select the smallest max age
      IF is_response_context_old-max_age < cs_response_context-max_age.
        cs_response_context-max_age = is_response_context_old-max_age.
      ENDIF.
    ENDIF.

* do not cache on client
    IF is_response_context_old-do_not_cache_on_client <> cs_response_context-do_not_cache_on_client.
      cs_response_context-do_not_cache_on_client = /iwbep/if_mgw_appl_types=>gcs_cache_on_client-do_not_cache.
    ENDIF.

  ENDMETHOD.


  METHOD serialize_with_transformation.

    DATA lo_st_manager              TYPE REF TO /iwbep/if_mgw_st_man_runtime.
    DATA lv_is_st_ready             TYPE abap_bool.
    DATA lv_are_all_st_ready        TYPE abap_bool.
    DATA lv_is_st_deactivated       TYPE abap_bool.
    DATA lv_is_st_allowed           TYPE abap_bool.
    DATA lv_is_a_st_to_be_generated TYPE abap_bool.
    DATA lv_is_expand               TYPE abap_bool.
    DATA lv_last_modified           TYPE tzntstmps.
    DATA lv_entity_type_name        TYPE string.
    DATA ls_request_uri             TYPE ihttpnvp.
    DATA lt_involved_entity_type    TYPE /iwbep/t_mgw_tech_names.
    DATA ls_current_st_key          TYPE /iwbep/s_st_service_ent_ident.
    DATA ls_expand_source_st_key    TYPE /iwbep/s_st_service_ent_ident.



    ev_successful_serialized   = abap_false.

*   ST allowed in general?
    lv_is_st_allowed = /iwbep/cl_mgw_st_manager=>/iwbep/if_mgw_st_man_runtime~is_request_with_st_possible(
                            is_request_details  = is_request_details
                            is_response_context = is_response_context ).
    IF ( lv_is_st_allowed = abap_false ).
      RETURN.
    ENDIF.


*   Prepare
    lv_are_all_st_ready        = abap_true.
    lv_is_a_st_to_be_generated = abap_false.

    IF ( is_request_details-technical_request-expand IS INITIAL ).
      lv_is_expand = abap_false.
    ELSE.
      lv_is_expand = abap_true.
    ENDIF.

    lv_last_modified = io_model->get_cache_timestamp( ).
    io_expand_root->get_tech_entity_types( IMPORTING et_entity_type = lt_involved_entity_type ).

    ls_expand_source_st_key-service_name     = is_request_details-technical_request-service_name.
    ls_expand_source_st_key-service_version  = is_request_details-technical_request-service_version.
    ls_expand_source_st_key-is_for_expand    = lv_is_expand.
    ls_expand_source_st_key-entity_type_name = is_request_details-technical_request-target_entity_type.

    ls_current_st_key = ls_expand_source_st_key.


*   Checking the STs
    LOOP AT lt_involved_entity_type INTO ls_current_st_key-entity_type_name.
      lo_st_manager = /iwbep/cl_mgw_st_manager=>create_runtime_instance(
                    is_st_key        = ls_current_st_key
                    iv_last_modified = lv_last_modified ).

      lo_st_manager->get_status(
        IMPORTING
          ev_is_st_ready       = lv_is_st_ready
          ev_is_st_deactivated = lv_is_st_deactivated ).

      IF ( lv_is_st_ready = abap_false ).
        lv_are_all_st_ready = abap_false.
        IF ( lv_is_st_deactivated = abap_false ). "This means, that the ST has not been deactivated manually -> It is outdated or does not exist yet
          lv_is_a_st_to_be_generated = abap_true.
        ENDIF.
      ENDIF.

    ENDLOOP.


*   Serialization via ST
    IF ( lv_are_all_st_ready = abap_true ).
      TRY.
          " Call ST from source entity
          lo_st_manager = /iwbep/cl_mgw_st_manager=>get_runtime_instance( ls_expand_source_st_key ).
          lo_st_manager->call_transformation(
            EXPORTING
              ir_entity_data          = cr_entityset
              io_request              = io_request
              is_response_context     = is_response_context
              iv_expand_string        = iv_expand_string
              io_expand_node          = io_expand_root
              iv_base_url             = is_request_details-base_url
              iv_resource_from_uri    = is_request_details-resource_from_uri
              it_uri_query_parameter  = is_request_details-t_uri_query_parameter
            IMPORTING
              ev_result               = cv_response_body ).

          ev_successful_serialized = abap_true.

        CATCH /iwbep/cx_st /iwbep/cx_mgw_tech_exception INTO DATA(lx_error).
          lv_entity_type_name = ls_current_st_key-entity_type_name.
          RAISE EXCEPTION TYPE /iwbep/cx_mgw_tech_exception
            EXPORTING
              textid      = /iwbep/cx_mgw_tech_exception=>static_trans_usage_failed
              previous    = lx_error
              entity_type = lv_entity_type_name.
      ENDTRY.
    ENDIF.


*   Generate STs
    IF ( lv_is_a_st_to_be_generated = abap_true ).
      " Generate ST for / starting at  source entity
      lo_st_manager = /iwbep/cl_mgw_st_manager=>get_runtime_instance( ls_expand_source_st_key ).

      READ TABLE is_request_details-technical_request-request_header
                WITH KEY name = '~request_uri' INTO ls_request_uri.


      IF ( lv_is_expand = abap_false ).
        " Generate ST for simple list
        lo_st_manager->create_transformation_async(
                 EXPORTING
                   iv_default_schema_namespace = iv_service_doc_name
                   iv_request_uri              = ls_request_uri-value
                   iv_is_for_expand            = abap_false
                   ir_entity_data              = cr_entityset ).

      ELSE.
        " Generate ST for expand
        lo_st_manager->create_transformation_async(
                 EXPORTING
                   iv_default_schema_namespace = iv_service_doc_name
                   iv_request_uri              = ls_request_uri-value
                   io_expand_root              = io_expand_root
                   iv_is_for_expand            = abap_true
                   ir_entity_data              = cr_entityset ).

      ENDIF.
    ENDIF.

  ENDMETHOD.


  METHOD set_headers.
    IF ct_headers IS NOT INITIAL.
      mt_headers = ct_headers.
    ENDIF.
  ENDMETHOD.


  METHOD set_sap_data_exists.

    DATA: lv_expand     TYPE string,
          lv_sub_expand TYPE string,
          lv_rem_expand TYPE string,
          lt_sub_expand TYPE string_table,
          lv_type       TYPE c LENGTH 1,
          lr_sub_expand TYPE REF TO data.

    FIELD-SYMBOLS:
      <ls_expand>      TYPE any,
      <ls_sub_expand>  TYPE any,
      <lv_data_exists> TYPE any,
      <lt_sub_expand>  TYPE INDEX TABLE.


    " Set SAP__DATA_EXISTS for gateway system
    LOOP AT it_expand INTO lv_expand.
      ASSIGN cv_entity->* TO <ls_expand>.
      CLEAR lv_rem_expand.
      SPLIT lv_expand AT '/' INTO lv_sub_expand lv_rem_expand.

      ASSIGN COMPONENT lv_sub_expand OF STRUCTURE <ls_expand> TO <ls_sub_expand>.
      IF sy-subrc EQ 0.
        DESCRIBE FIELD <ls_sub_expand> TYPE lv_type.
        CASE lv_type.
          WHEN cl_abap_typedescr=>typekind_table.
            ASSIGN COMPONENT lv_sub_expand OF STRUCTURE <ls_expand> TO <lt_sub_expand>.
            IF sy-subrc EQ 0.
              IF NOT lv_rem_expand IS INITIAL.
                CLEAR lt_sub_expand.
                APPEND lv_rem_expand TO lt_sub_expand.
                LOOP AT <lt_sub_expand> REFERENCE INTO lr_sub_expand.
                  " Recursion
                  set_sap_data_exists(
                    EXPORTING
                      it_expand = lt_sub_expand
                    CHANGING
                      cv_entity = lr_sub_expand ).
                ENDLOOP.
              ENDIF.
            ENDIF.
          WHEN OTHERS.
            ASSIGN COMPONENT /iwbep/cl_mgw_expand_node=>mc_sap_data_exists OF STRUCTURE <ls_sub_expand> TO <lv_data_exists>.
            IF sy-subrc EQ 0.
              IF <ls_sub_expand> IS INITIAL.
                <lv_data_exists> = ' '.
              ELSE.
                <lv_data_exists> = 'X'.
              ENDIF.
            ENDIF.
            " Recursion
            IF NOT lv_rem_expand IS INITIAL.
              CLEAR lt_sub_expand.
              APPEND lv_rem_expand TO lt_sub_expand.
              GET REFERENCE OF <ls_sub_expand> INTO lr_sub_expand.
              set_sap_data_exists(
                EXPORTING
                  it_expand = lt_sub_expand
                CHANGING
                  cv_entity = lr_sub_expand ).
            ENDIF.
        ENDCASE.
      ENDIF.
    ENDLOOP.

  ENDMETHOD.


  METHOD sort_inline_info.

    DATA: lv_index_begin        TYPE i,
          lv_index_next         TYPE i,
          lv_inline_total       TYPE i,
          lv_entry_no           TYPE i,
          lv_expand_help        TYPE string,
          lv_expand_part        TYPE string,
          lt_expand_part        TYPE stringtab,
          lt_sorted_expand_part TYPE stringtab,
          ls_inline_info        TYPE /iwbep/if_mgw_core_srv_runtime=>ty_s_inline_info,
          lt_inline_info        TYPE /iwbep/if_mgw_core_srv_runtime=>ty_t_inline_info,
          lt_inline_entity      TYPE /iwbep/if_mgw_core_srv_runtime=>ty_t_inline_info,
          ls_nav_property       TYPE /iwbep/if_mgw_med_odata_types=>ty_s_med_reference,
          lt_nav_property       TYPE /iwbep/if_mgw_med_odata_types=>ty_t_med_reference,
          lo_model              TYPE REF TO /iwbep/cl_mgw_odata_model,
          lr_entity_set         TYPE REF TO /iwbep/if_mgw_med_odata_types=>ty_s_med_reference.


    IF ct_inline_info IS INITIAL. EXIT. ENDIF.

    lt_inline_info = ct_inline_info.

    CLEAR ct_inline_info.

* Create Expand Details
    SPLIT iv_expand_string AT ','  INTO TABLE lt_expand_part.
    SORT lt_expand_part ASCENDING.


********************************************************************
*  OData Lib calls expand components as defined in Model Provider  *
********************************************************************

* Get info of current entity set
    lo_model ?= mo_model.
    READ TABLE lo_model->mt_references REFERENCE INTO lr_entity_set
      WITH KEY
        external_name = iv_entity_set_name
        reference_type = /iwbep/if_mgw_med_odata_types=>gcs_reference_type-entity_set.
    IF sy-subrc <> 0. EXIT. ENDIF.

* Determine the order of navigations for this entity set as defined in Model Provider
    lt_nav_property = mo_model->/iwbep/if_mgw_odata_re_model~get_navigation_properties( ).
    LOOP AT lt_nav_property INTO ls_nav_property.

      " Additional check for Base Type
      IF ls_nav_property-source_entity_id <> lr_entity_set->*-target_entity_id.
        READ TABLE lo_model->mt_references
          WITH KEY source_entity_id = lr_entity_set->*-target_entity_id
                   target_entity_id = ls_nav_property-source_entity_id
                   reference_type   = /iwbep/if_mgw_med_odata_types=>gcs_reference_type-inheritance
          TRANSPORTING NO FIELDS.
        IF sy-subrc <> 0. CONTINUE. ENDIF.
      ENDIF.

      " found navigation!
      LOOP AT lt_expand_part INTO lv_expand_part.
        IF lv_expand_part = ls_nav_property-external_name.
          APPEND lv_expand_part TO lt_sorted_expand_part.
        ELSE.
          CONCATENATE ls_nav_property-external_name
                      '/'
            INTO lv_expand_help.
          IF lv_expand_part CS lv_expand_help AND sy-fdpos = 0.
            READ TABLE lt_sorted_expand_part
              WITH KEY table_line = lv_expand_part
              TRANSPORTING NO FIELDS.
            IF sy-subrc <> 0.
              APPEND lv_expand_part TO lt_sorted_expand_part.
            ENDIF.
          ENDIF.
        ENDIF.
      ENDLOOP.
    ENDLOOP.

* Create Result
    IF lt_sorted_expand_part IS INITIAL.
      ct_inline_info = lt_inline_info.
      EXIT.
    ENDIF.
    lv_index_begin = lv_index_next = 1.
    lv_inline_total = lines( lt_inline_info ).
    DO.

      " Get entries for one entity
      READ TABLE lt_inline_info INTO ls_inline_info INDEX lv_index_begin.
      lv_entry_no = ls_inline_info-entry_no.
      LOOP AT lt_inline_info INTO ls_inline_info FROM lv_index_begin.
        IF lv_entry_no <> ls_inline_info-entry_no. EXIT. ENDIF.
        APPEND ls_inline_info TO lt_inline_entity.
      ENDLOOP.
      lv_index_next = lv_index_next + lines( lt_inline_entity ).

      " Create result for one entity
      LOOP AT lt_sorted_expand_part INTO lv_expand_part.
        LOOP AT lt_inline_entity INTO ls_inline_info.
          IF lv_expand_part CS ls_inline_info-expand_part.
            DELETE lt_inline_entity INDEX sy-tabix.
            APPEND ls_inline_info TO ct_inline_info.
          ENDIF.
        ENDLOOP.
        IF lt_inline_entity IS INITIAL. EXIT. ENDIF.
      ENDLOOP.

      IF lv_index_next > lv_inline_total. EXIT. ENDIF.
      lv_index_begin = lv_index_next.
      CLEAR lt_inline_entity.
    ENDDO.

  ENDMETHOD.
ENDCLASS.