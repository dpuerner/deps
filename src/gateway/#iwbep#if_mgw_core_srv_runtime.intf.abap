*"* components of interface /IWBEP/IF_MGW_CORE_SRV_RUNTIME
INTERFACE /iwbep/if_mgw_core_srv_runtime
  PUBLIC .

  TYPE-POOLS abap .

  TYPES:
    ty_path_separator TYPE c LENGTH 1 .
  TYPES ty_s_mgw_response_entity_cntxt TYPE /iwbep/if_mgw_core_types=>ty_s_mgw_response_entity_cntxt .
  TYPES ty_s_media_resource TYPE /iwbep/if_mgw_core_types=>ty_s_media_resource .
  TYPES ty_s_mgw_response_context TYPE /iwbep/if_mgw_core_types=>ty_s_mgw_response_context .
  TYPES ty_s_mgw_response_context_com TYPE /iwbep/if_mgw_core_types=>ty_s_mgw_response_context_comm .
  TYPES:
    BEGIN OF ty_s_mgw_message_header,
      transaction_id     TYPE string,
      exception_category TYPE /iwbep/meco_error_category,
      exception_txt      TYPE string,
      exception_ltxt     TYPE string,
      exception_code     TYPE string,
      message_code       TYPE string,
      http_code          TYPE /iwbep/mgw_http_status_code,
      sap_note_id        TYPE /iwbep/mgw_sap_note_id,
    END OF ty_s_mgw_message_header .
  TYPES:
    BEGIN OF ty_s_mgw_msg_canister,
      message_header  TYPE ty_s_mgw_message_header,
      message_details TYPE /iwbep/t_mgw_odata_inner_error,
    END OF ty_s_mgw_msg_canister .
  TYPES:
    BEGIN OF ty_s_batch_response,
      operation_id                TYPE string,
      response_data               TYPE REF TO data,
      response_data_deleted       TYPE REF TO data, " only filled for entity set delta handling
      response_data_serialized    TYPE xstring,     " filled if ST has been used for serialization
      entity_response_context     TYPE ty_s_mgw_response_entity_cntxt,
      entity_set_response_context TYPE ty_s_mgw_response_context,
      expand_skiptokens           TYPE string_table, " for entity expands
      headers                     TYPE tihttpnvp,
      exception                   TYPE REF TO /iwbep/cx_mgw_base_exception, " exception for specific operation
      msg_container               TYPE ty_s_mgw_msg_canister, " operation-specific message container
    END OF ty_s_batch_response .
  TYPES:
    ty_t_batch_response TYPE SORTED TABLE OF ty_s_batch_response WITH UNIQUE KEY operation_id .
  TYPES:
    BEGIN OF parameter_values_s,
      name  TYPE string,
      value TYPE string,
    END OF parameter_values_s .
  TYPES:
    parameter_values_t TYPE STANDARD TABLE OF parameter_values_s WITH DEFAULT KEY .
  TYPES:
    BEGIN OF ty_s_mgw_expand_clause,
      entity_navigation_properties TYPE STANDARD TABLE OF string WITH DEFAULT KEY,
    END OF ty_s_mgw_expand_clause .
  TYPES:
    ty_t_mgw_expand_clause TYPE STANDARD TABLE OF ty_s_mgw_expand_clause WITH DEFAULT KEY .
  TYPES:
    BEGIN OF ty_s_mgw_paging,
      top  TYPE string,
      skip TYPE string,
    END OF ty_s_mgw_paging .
  TYPES:
    BEGIN OF nvp_s,
      name  TYPE string,
      value TYPE string,
    END OF nvp_s .
  TYPES:
    nvp_t TYPE STANDARD TABLE OF nvp_s WITH DEFAULT KEY .
  TYPES:
    BEGIN OF ty_s_placeholder_valuation,
      placeholder   TYPE string,
      value         TYPE string,
      pattern_value TYPE string,
    END OF ty_s_placeholder_valuation .
  TYPES:
    ty_t_placeholder_valuation TYPE STANDARD TABLE OF ty_s_placeholder_valuation WITH KEY placeholder .
  TYPES:
    BEGIN OF order_s,
      property TYPE string,
      order    TYPE string,
    END OF order_s .
  TYPES:
    order_t TYPE STANDARD TABLE OF order_s WITH DEFAULT KEY .
  TYPES:
    BEGIN OF nav_s,
      nav_prop              TYPE string,
      key                   TYPE string,
      key_tab               TYPE nvp_t,
      target_type           TYPE string,
      target_type_namespace TYPE string,
      multiplicity          TYPE string,
    END OF nav_s .
  TYPES:
    nav_t TYPE STANDARD TABLE OF nav_s WITH DEFAULT KEY .
  TYPES:
    abap_select_option_t TYPE RANGE OF string .
  TYPES:
    abap_select_option_s TYPE LINE OF abap_select_option_t .
  TYPES:
    BEGIN OF edm_select_option_s,
      property       TYPE string,
      select_options TYPE abap_select_option_t,
    END OF edm_select_option_s .
  TYPES:
    edm_select_option_t TYPE HASHED TABLE OF edm_select_option_s WITH UNIQUE  KEY  property .
  TYPES:
    BEGIN OF ty_expression,
      expression_id TYPE  sysuuid_c,
      l_operand	    TYPE  string,
      l_oprnd_int   TYPE  string,
      lop_id        TYPE  sysuuid_c,
      lop_type      TYPE  char1,
      operator      TYPE  string,
      r_operand	    TYPE  string,
      r_oprnd_int   TYPE  string,
      literal_type  TYPE  string,
      rop_id        TYPE  sysuuid_c,
      rop_type      TYPE  char1,
      is_null       TYPE  char1,
      variable      TYPE  string,
    END OF ty_expression .
  TYPES:
    tt_expressions TYPE STANDARD TABLE OF ty_expression WITH DEFAULT KEY .
  TYPES:
    BEGIN OF ty_parameter,
      param_id     TYPE  sysuuid_c,
      param_type   TYPE  char1,
      param_value	 TYPE  string,
      param_int    TYPE  string,
      literal_type TYPE  string,
      function_id  TYPE  sysuuid_c,
      variable     TYPE  string,
    END OF ty_parameter .
  TYPES:
    tt_parameters TYPE STANDARD TABLE OF ty_parameter WITH DEFAULT KEY .
  TYPES:
    BEGIN OF function_import_s,
      name        TYPE string,
      return_type TYPE string,
      entity_set  TYPE string,
      http_method TYPE string, "m:httpMethod
      "       annotation_attributes TYPE /IWCOR/if_atom_types=>ext_attribute_t,
      "       documentation TYPE documentation_s,
      "       parameters TYPE function_import_parameter_t,
      "       annotation_elements TYPE /IWCOR/if_atom_types=>ext_element_t,
    END OF function_import_s .
  TYPES:
    BEGIN OF ty_function,
      function_id TYPE  sysuuid_c,
      function    TYPE  string,
      param_tab	  TYPE  tt_parameters,
    END OF ty_function .
  TYPES:
    tt_functions TYPE STANDARD TABLE OF ty_function WITH DEFAULT KEY .
  TYPES:
    BEGIN OF ty_batch_info,
      content_id      TYPE string, " Content ID
      content_id_ref  TYPE string, " Content ID Reference
      first_operation TYPE abap_bool,
      last_operation  TYPE abap_bool,
      operation_id    TYPE string, " unique identification of an invididual batch operation (packet_no-operation_no)
    END OF ty_batch_info .
  TYPES:
    BEGIN OF ty_co_deployment_info,
      is_co_deployment TYPE abap_bool, " Is Co-Deployment Scenario
      is_batch         TYPE abap_bool, " is Batch
      is_moc           TYPE abap_bool, " generate sap origin in case of co-deployment + MOC
    END OF ty_co_deployment_info .
  TYPES:
    BEGIN OF technical_request_s,
      service_name               TYPE /iwbep/med_grp_technical_name,
      service_version	           TYPE /iwbep/med_grp_version,
      source_entity_type         TYPE /iwbep/mgw_tech_name,          " name of the entity from the first segment
      target_entity_type         TYPE /iwbep/mgw_tech_name,          " name of the entity from the last segment
      source_entity_set          TYPE /iwbep/mgw_tech_name,          " name of the entity set from the first segment
      target_entity_set          TYPE /iwbep/mgw_tech_name,          " name of the entity set from the last segment
      key                        TYPE string,                        " key for the first segment
      key_tab                    TYPE /iwbep/t_mgw_tech_pairs,       " key fields for the first segment
      navigation_path            TYPE /iwbep/t_mgw_tech_navi,        " navigation_path (navprop, key table)
      filter_select_options      TYPE /iwbep/t_mgw_select_option,    " filter as select options; empty if not available
      filter_select_placeholders TYPE /iwbep/t_mgw_select_option, " filter placeholders in select option representation
      filter_string              TYPE string,                        " filter string
      order                      TYPE /iwbep/t_mgw_tech_order,       " orderby=firstName [asc],lastName desc
      select                     TYPE /iwbep/t_mgw_tech_field_names, " select
      select_strings             TYPE string_table,                  " select property string table
      select_strings_h           TYPE string_table,                  " select property string table with - as a separator
      totals                     TYPE /iwbep/t_mgw_tech_field_names, " totals
      expand                     TYPE string,                        " expand
      components                 TYPE string_table,                  " list of components for PATCH -> partial update every line represents a property path
      components_h               TYPE string_table,                  " list of components for PATCH with - as a separator
      action_name                TYPE /iwbep/mgw_tech_name,          " name of the action (function import)
      action_parameters          TYPE /iwbep/t_mgw_name_value_pair,  " parameters of the action (function import)
      action_return_type         TYPE /iwbep/mgw_tech_name,          " return type of the action (function import)
      parameters                 TYPE /iwbep/t_mgw_name_value_pair,  " http header, request parameters, $select parameters, ...
      key_converter              TYPE REF TO object,                 " converter for URI keys
      filter_expressions         TYPE tt_expressions,                " $filter Expression in Tree Representation
      filter_functions           TYPE tt_functions,                  " Functions in $filter Expression
      request_header             TYPE tihttpnvp,                     " HTTP request header from OData consumer
      conditions                 TYPE /iwbep/if_mgw_core_types=>ty_s_conditions,  " conditions parameter for eTag handling
      verbose_metadata           TYPE /iwbep/mgw_verbose_metadata,   " $metadata?sap-documentation=all (X = true, - = false, space = unknown)
      operation_type             TYPE /iwbep/mgw_operation_type,     " operation type (update entity, create entity, read entity, ... )
      select_navis               TYPE string_table,                  " select navigation string table
      expand_root                TYPE REF TO object,                 " expand root
      is_ral_relevant            TYPE abap_bool,                     " request is relevant for read access logging (BEP only)
      batch_info                 TYPE ty_batch_info,                 " specific information related to batch
      co_deployment_info         TYPE ty_co_deployment_info,
    END OF technical_request_s .
  TYPES:
    BEGIN OF ty_s_mgw_request_context,
      service_doc_name      TYPE string,
      namespace             TYPE string,
      version               TYPE /iwbep/med_mdl_version,
      request_service_name  TYPE string,
      cache_timestamp       TYPE tzntstmps,
      base_url              TYPE string,
      http_method           TYPE string,                  " POST, PUT, DELETE, GET, ...
      icf_root_node         TYPE icfname,
      system_alias_info     TYPE /iwbep/s_defi_alias_info,
      context_params        TYPE /iwbep/t_mgw_name_value_pair,
      format                TYPE string,                  " atom, xml, json, etc.
      type                  TYPE string,                  " feed, entry, attribute, command
      operation             TYPE string,                  " create, read, update, delete, count, value, ..
      incoming_message      TYPE xstring,                 " the incoming entry (for post/put)
      source_entity         TYPE string,                  " name of the entity from the first segment
      target_entity         TYPE string,                  " name of the entity from the last segment
      target_entity_set     TYPE string,                  " name of the entity from the last segment
      source_entity_set     TYPE string,                  " name of the entity from the first segment
      key                   TYPE string,                  " key for the first segment
      key_tab               TYPE /iwbep/t_mgw_name_value_pair,      " key fields for the first segment
      navigation_path       TYPE /iwbep/t_mgw_navigation_path,      " navigation_path (navprop, key table)
      property_path         TYPE string_table,                      " e.g. name or address/street
      filter_select_options TYPE /iwbep/t_mgw_select_option,
      order                 TYPE /iwbep/t_mgw_sorting_order,        " $orderby=firstName [asc],lastName desc
      paging                TYPE ty_s_mgw_paging,
      function              TYPE function_import_s,       " service operation parameters
      parameters            TYPE /iwbep/t_mgw_name_value_pair,
      uri_parameters        TYPE /iwbep/t_mgw_name_value_pair,      " A.H. function import abuse parameters table for passing uri parameters - therefore introduce new field - redundancy.
      placeholder_valuation TYPE ty_t_placeholder_valuation, " ABAP values for fixed placeholders (skip, top, inlinecount, skiptoken)
      select_params         TYPE string_table,                      " $select=agencynum,NAME
      softstate_mode        TYPE abap_bool,  "Soft-State delay or immediate?
      softstate_enabled     TYPE abap_bool,               " Soft-State enabled in /iwfnd/maint_service?
      softstate_before      TYPE abap_bool,               " Was the last session Soft-State?
      reset_dp              TYPE abap_bool,
      crp_on_hub_allowed    TYPE abap_bool,               " FND layer allows for cached request processing
      if_modified_since     TYPE tzntstmps,
      termination_reason    TYPE i,                       " See /IWBEP/IF_MGW_SOST_SRV_RUNTIME=>GCS_TERMINATION_REASON
      resource_from_uri     TYPE string,                  " To build URI in BEP, e.g. ST with $skiptoken e.g. ET/Nav1/Nav2
      t_uri_query_parameter TYPE parameter_values_t,     " To build URI in BEP, e.g. ST with $skiptoken
      technical_request     TYPE technical_request_s,
    END OF ty_s_mgw_request_context .
  TYPES ty_t_catatalog_svc_info TYPE /iwbep/if_mgw_med_provider=>ty_t_service_model_info .
  TYPES:
    BEGIN OF ty_s_catatalog_svc_req,
      service_infos TYPE        /iwbep/if_mgw_med_provider=>ty_t_service_info,
      deltatoken    TYPE        tzntstmps,
    END OF ty_s_catatalog_svc_req .
  TYPES:
    BEGIN OF ty_s_inline_info,
      is_inline_initial TYPE char1,
      entry_no          TYPE i,
      expand_part       TYPE string,
      tech_expand_part  TYPE string,
    END OF ty_s_inline_info .
  TYPES:
    ty_t_inline_info  TYPE STANDARD TABLE OF ty_s_inline_info WITH DEFAULT KEY .
  TYPES:
    BEGIN OF ty_s_changeset_data.
      INCLUDE TYPE /iwbep/if_mgw_core_types=>ty_s_changeset_request.
  TYPES   entity_descriptor   TYPE REF TO /iwbep/cl_mgw_expand_node.
  TYPES   expand_string       TYPE string.
  TYPES   tech_expand_string  TYPE string.
  TYPES   entity_data         TYPE REF TO data.
  TYPES   headers             TYPE tihttpnvp.
  TYPES   inline_infos        TYPE ty_t_inline_info.
  TYPES END OF ty_s_changeset_data .
  TYPES:
    ty_t_changeset_data TYPE SORTED TABLE OF ty_s_changeset_data WITH UNIQUE KEY operation_no .
  TYPES:
    BEGIN OF ty_s_batch_request,
      packet_no       TYPE i,
      operation_no    TYPE i,
      changeset       TYPE char1,
      function_code   TYPE string,
      entity_set      TYPE string,
      entity_type     TYPE string,
      action_name     TYPE string,
      request_context TYPE /iwbep/if_mgw_core_srv_runtime=>ty_s_mgw_request_context,
      request_headers TYPE tihttpnvp,
      entity_data     TYPE xstring,
    END OF ty_s_batch_request .
  TYPES:
    ty_t_batch_request TYPE STANDARD TABLE OF ty_s_batch_request WITH DEFAULT KEY .
  TYPES:
    ty_placeholder_kind TYPE c LENGTH 1 .
 "Definitions now in interface /iwbep/if_mgw_core_types due to dictionary interface problems
  TYPES: ty_s_cached_service_info TYPE /iwbep/if_mgw_core_types=>ty_s_cached_service_info.
  TYPES: ty_s_placeholder_info TYPE /iwbep/if_mgw_core_types=>ty_s_placeholder_info.
  TYPES:
  ty_t_placeholder_info TYPE SORTED TABLE OF ty_s_placeholder_info WITH UNIQUE KEY placeholder .
  TYPES:
    BEGIN OF ty_s_cached_request_info,
      uri_pattern             TYPE string,                        " URI pattern calculated by the URI recognizer
      entity_set_name         TYPE /iwbep/mgw_tech_name,          " Entity set name
      entity_set_name_ext     TYPE /iwbep/med_external_name ,     " Entity set name External
      entity_type_name        TYPE /iwbep/mgw_tech_name,          " Entity type name
      entity_set_crp_usage    TYPE abap_bool,                     " CRP usage model information
      placeholder_info        TYPE ty_t_placeholder_info,         " Placeholder metadata (typing etc.)
      selected_properties     TYPE string_table,                  " $select - ABAP names (see select_strings_h) / no navigation
      auto_add_selected_props TYPE string_table,              " selected properties that have been added to the properties in $select (mandatory fields)
      order                   TYPE /iwbep/t_mgw_tech_order,       " $orderby - ABAP information
      provider_request        TYPE /iwbep/t_mgw_crp_prov_request, " Request information provided by the application
    END OF ty_s_cached_request_info .
  TYPES:
    BEGIN OF ty_s_cr_process_info,
      service_name      TYPE string,
      service_namespace TYPE string,
      service_version   TYPE n LENGTH 4,
      system_alias_info TYPE /iwbep/s_defi_alias_info,
      base_url          TYPE string,
      if_modified_since TYPE tzntstmps,
    END OF ty_s_cr_process_info .
  TYPES:
    BEGIN OF ty_s_cached_request,
      process_info          TYPE ty_s_cr_process_info,
      service_info          TYPE ty_s_cached_service_info,
      request_info          TYPE ty_s_cached_request_info,
      placeholder_valuation TYPE ty_t_placeholder_valuation,
    END OF ty_s_cached_request .

  CONSTANTS:
    BEGIN OF gcs_http_header_attributes ,
      repeatability_creation TYPE string VALUE 'RepeatabilityCreation',
      request_id             TYPE string VALUE 'RequestID',
      repeatability_result   TYPE string VALUE 'RepeatabilityResult',
    END OF gcs_http_header_attributes .
  CONSTANTS:
    BEGIN OF gcs_placeholder_kinds,
      resource_path TYPE ty_placeholder_kind VALUE 'R',
      top           TYPE ty_placeholder_kind VALUE 'T',
      skip          TYPE ty_placeholder_kind VALUE 'S',
      filter        TYPE ty_placeholder_kind VALUE 'F',
      orderby       TYPE ty_placeholder_kind VALUE 'O',
      inlinecount   TYPE ty_placeholder_kind VALUE 'I',
      skiptoken     TYPE ty_placeholder_kind VALUE 'K',
    END OF gcs_placeholder_kinds .
  CONSTANTS:
    BEGIN OF gcs_multiplicity,
      zero_one TYPE string VALUE '0..1',                    "#EC NOTEXT
      one      TYPE string VALUE '1',                       "#EC NOTEXT
      many     TYPE string VALUE '*',                       "#EC NOTEXT
    END OF gcs_multiplicity .
  CONSTANTS:
    BEGIN OF gcs_placeholder_pre_pattern,
      resource    TYPE string VALUE `%r*`,
      top         TYPE string VALUE `%t*`,
      skip        TYPE string VALUE `%s*`,
      filter      TYPE string VALUE `%f*`,
      orderby     TYPE string VALUE `%o*`,
      inlinecount TYPE string VALUE `%i*`,
      skiptoken   TYPE string VALUE `%k*`,
    END OF gcs_placeholder_pre_pattern .
  CONSTANTS:
    BEGIN OF gcs_selopt_function,
      startswith  TYPE c LENGTH 1 VALUE '1',
      endswith    TYPE c LENGTH 1 VALUE '2',
      substringof TYPE c LENGTH 1 VALUE '3',
    END OF gcs_selopt_function .

  METHODS read_entity
    IMPORTING
      !iv_entity_name      TYPE string
      !iv_source_name      TYPE string
      !is_request_details  TYPE ty_s_mgw_request_context
    CHANGING
      !ct_headers          TYPE tihttpnvp
      !cr_entity           TYPE REF TO data
      !cs_response_context TYPE ty_s_mgw_response_entity_cntxt OPTIONAL
      !ct_expand_skiptoken TYPE string_table OPTIONAL
      !ct_inline_info      TYPE ty_t_inline_info OPTIONAL
    RAISING
      /iwbep/cx_mgw_busi_exception
      /iwbep/cx_mgw_tech_exception .
  METHODS read_stream
    IMPORTING
      !iv_entity_name      TYPE string
      !iv_source_name      TYPE string
      !is_request_details  TYPE ty_s_mgw_request_context
    CHANGING
      !ct_headers          TYPE tihttpnvp
      !cr_stream           TYPE REF TO data
      !cs_response_context TYPE ty_s_mgw_response_entity_cntxt OPTIONAL
    RAISING
      /iwbep/cx_mgw_busi_exception
      /iwbep/cx_mgw_tech_exception .
  METHODS exec_service_operation
    IMPORTING
      !iv_action_name      TYPE string
      !iv_return_type      TYPE string
      !iv_multiplicity     TYPE char1
      !is_request_details  TYPE ty_s_mgw_request_context
    CHANGING
      !ct_headers          TYPE tihttpnvp
      !cr_data             TYPE REF TO data
      !ct_inline_info      TYPE ty_t_inline_info OPTIONAL
      !cs_response_context TYPE ty_s_mgw_response_context_com OPTIONAL
    RAISING
      /iwbep/cx_mgw_busi_exception
      /iwbep/cx_mgw_tech_exception .
  METHODS update_entity
    IMPORTING
      !iv_entity_name      TYPE string
      !iv_source_name      TYPE string
      !io_data_provider    TYPE REF TO /iwbep/if_mgw_entry_provider
      !is_request_details  TYPE ty_s_mgw_request_context
    CHANGING
      !ct_headers          TYPE tihttpnvp
      !cr_entity           TYPE REF TO data
      !cs_response_context TYPE ty_s_mgw_response_context_com OPTIONAL
    RAISING
      /iwbep/cx_mgw_busi_exception
      /iwbep/cx_mgw_tech_exception .
  METHODS create_entity
    IMPORTING
      !iv_entity_name      TYPE string
      !iv_source_name      TYPE string
      !io_data_provider    TYPE REF TO /iwbep/if_mgw_entry_provider
      !is_request_details  TYPE ty_s_mgw_request_context
    CHANGING
      !ct_headers          TYPE tihttpnvp
      !cr_entity           TYPE REF TO data
      !ct_inline_info      TYPE ty_t_inline_info OPTIONAL
      !cs_response_context TYPE ty_s_mgw_response_context_com OPTIONAL
    RAISING
      /iwbep/cx_mgw_busi_exception
      /iwbep/cx_mgw_tech_exception .
  METHODS delete_entity
    IMPORTING
      !iv_entity_name      TYPE string
      !iv_source_name      TYPE string
      !is_request_details  TYPE ty_s_mgw_request_context
    CHANGING
      !ct_headers          TYPE tihttpnvp
      !cs_response_context TYPE ty_s_mgw_response_context_com OPTIONAL
    RAISING
      /iwbep/cx_mgw_busi_exception
      /iwbep/cx_mgw_tech_exception .
  METHODS read_entityset
    IMPORTING
      !iv_entity_name           TYPE string
      !iv_source_name           TYPE string
      !is_paging                TYPE /iwbep/s_mgw_paging
      !it_order                 TYPE /iwbep/t_mgw_sorting_order
      !it_filter_select_options TYPE /iwbep/t_mgw_select_option
      !is_request_details       TYPE ty_s_mgw_request_context
    CHANGING
      !cv_response_body         TYPE xstring OPTIONAL
      !ct_headers               TYPE tihttpnvp
      !cr_entityset             TYPE REF TO data
      !cr_deleted_entityset     TYPE REF TO data OPTIONAL
      !cs_response_context      TYPE ty_s_mgw_response_context OPTIONAL
      !ct_inline_info           TYPE ty_t_inline_info OPTIONAL
    RAISING
      /iwbep/cx_mgw_busi_exception
      /iwbep/cx_mgw_tech_exception .
  METHODS init
    IMPORTING
      !iv_service_document_name TYPE string
      !iv_namespace             TYPE string
      !iv_version               TYPE numc4
      !io_context               TYPE REF TO /iwbep/if_mgw_context OPTIONAL
    RAISING
      /iwbep/cx_mgw_tech_exception .
  METHODS init_request_context
    IMPORTING
      !is_request_details TYPE /iwbep/if_mgw_core_srv_runtime=>ty_s_mgw_request_context
      !it_headers         TYPE tihttpnvp
    CHANGING
      !co_request_context TYPE REF TO /iwbep/cl_mgw_request OPTIONAL
    RAISING
      /iwbep/cx_mgw_tech_exception .
  METHODS set_context
    IMPORTING
      !io_context TYPE REF TO /iwbep/if_mgw_context .
  METHODS batch_begin
    IMPORTING
      !it_operation_info             TYPE /iwbep/t_mgw_operation_info
    CHANGING
      !cv_deferred_response_creation TYPE abap_bool
    RAISING
      /iwbep/cx_mgw_btc_exception .
  METHODS batch_end
    CHANGING
      !ct_batch_response TYPE ty_t_batch_response
    RAISING
      /iwbep/cx_mgw_btc_exception .
  METHODS changeset_begin
    IMPORTING
      !it_operation_info  TYPE /iwbep/t_mgw_operation_info
      !it_changeset_input TYPE /iwbep/if_mgw_core_srv_runtime=>ty_t_batch_request OPTIONAL
    CHANGING
      !cv_defer_mode      TYPE xsdboolean OPTIONAL
    RAISING
      /iwbep/cx_mgw_busi_exception
      /iwbep/cx_mgw_tech_exception .
  METHODS changeset_end
    RAISING
      /iwbep/cx_mgw_busi_exception
      /iwbep/cx_mgw_tech_exception .
  METHODS changeset_process
    CHANGING
      !ct_changeset_data TYPE /iwbep/if_mgw_core_srv_runtime=>ty_t_changeset_data
    RAISING
      /iwbep/cx_mgw_busi_exception
      /iwbep/cx_mgw_tech_exception .
  METHODS cleanup
    RAISING
      /iwbep/cx_mgw_tech_exception .
  METHODS get_expand_root
    IMPORTING
      !iv_cardinality     TYPE /iwbep/if_mgw_med_odata_types=>ty_e_med_cardinality
    CHANGING
      !cs_request_details TYPE ty_s_mgw_request_context
    RAISING
      /iwbep/cx_mgw_busi_exception
      /iwbep/cx_mgw_tech_exception .
  METHODS session_is_terminated
    IMPORTING
      !iv_reason TYPE i
    RAISING
      /iwbep/cx_mgw_tech_exception .
ENDINTERFACE.