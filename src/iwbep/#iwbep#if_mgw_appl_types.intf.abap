*"* components of interface /IWBEP/IF_MGW_APPL_TYPES
INTERFACE /iwbep/if_mgw_core_srv_runtime LOAD.

INTERFACE /iwbep/if_mgw_appl_types
  PUBLIC .

  TYPES:
    BEGIN OF ty_s_media_resource,
      mime_type TYPE string,
      value     TYPE xstring,
    END OF ty_s_media_resource .
  TYPES:
    BEGIN OF ty_s_mgw_response_context,
      count                         TYPE string,                         "OData - $count
      inlinecount                   TYPE string,                         "OData - inline count
      skiptoken                     TYPE string,                         "OData - skip token
      deltatoken                    TYPE string,                         "OData - delta token
      expand_skiptokens             TYPE string_table,                   "OData - skip token for expanded entities
      last_modified                 TYPE tzntstmps,                      "http header - last modified
      max_age                       TYPE int4,                           "http header - max-age - in seconds
      is_not_modified               TYPE /iwbep/mgw_is_not_modified,     "constants: GCS_MODIFICATION_STATUS
      do_not_cache_on_client        TYPE /iwbep/mgw_do_not_cache_on_cnt, "constants: GCS_CACHE_ON_CLIENT
      do_cache_and_page_on_hub      TYPE /iwbep/mgw_do_cache_page_on_hb, "Do Cache and Page on Hub IF softstate is enabled
      age                           TYPE i,                              "http header - age - in seconds
      crp_provider_request          TYPE /iwbep/t_mgw_crp_prov_request,
      is_sap_data_exists_calculated TYPE abap_bool,                      "sap__data_exists for optional relations was already calculated by provider application
    END OF ty_s_mgw_response_context .
  TYPES:
    BEGIN OF ty_s_mgw_response_entity_cntxt,
      last_modified                 TYPE tzntstmps,
      max_age                       TYPE int4,
      is_not_modified               TYPE /iwbep/mgw_is_not_modified,     "constants: GCS_MODIFICATION_STATUS
      do_not_cache_on_client        TYPE /iwbep/mgw_do_not_cache_on_cnt, "constants: GCS_CACHE_ON_CLIENT
      age                           TYPE i,
      no_content                    TYPE abap_bool,
      is_sap_data_exists_calculated TYPE abap_bool,                      "sap__data_exists for optional relations was already calculated by provider application
    END OF ty_s_mgw_response_entity_cntxt .
  TYPES:
    BEGIN OF ty_s_component,
      property   TYPE fieldname,   " technical name of property - either complex or simple
      components TYPE REF TO data, " components of type ty_t_components for nested complex properties
    END OF ty_s_component .
  TYPES:
    ty_t_components TYPE STANDARD TABLE OF ty_s_component WITH KEY  property .
  TYPES:
    BEGIN OF ty_s_etag_value,
      name  TYPE string,
      value TYPE string,
    END OF ty_s_etag_value .
  TYPES:
    ty_t_etag_value TYPE STANDARD TABLE OF ty_s_etag_value WITH DEFAULT KEY .
  TYPES:
    BEGIN OF ty_s_etag,
      tag_values TYPE ty_t_etag_value,
      weak       TYPE boole_d,
      any_value  TYPE boole_d,
    END OF ty_s_etag .
  TYPES:
    ty_t_etag       TYPE STANDARD TABLE OF ty_s_etag WITH DEFAULT KEY .
  TYPES:
    BEGIN OF ty_s_conditions,
      if_match      TYPE ty_t_etag,
      if_none_match TYPE ty_t_etag,
    END OF ty_s_conditions .
  TYPES:
    BEGIN OF ty_s_changeset_request,
      operation_type  TYPE /iwbep/mgw_operation_type,    " See GCS_OPERATION_TYPE
      operation_no    TYPE i,
      media_resource  TYPE ty_s_media_resource,  " CREATE_STREAM and UPDATE_STREAM only
      slug            TYPE string,               " CREATE_STREAM only
      request_headers TYPE tihttpnvp,
      request_context TYPE REF TO object,
      entry_provider  TYPE REF TO /iwbep/if_mgw_entry_provider,
      expand_node     TYPE REF TO /iwbep/if_mgw_odata_expand,
      msg_container   TYPE REF TO /iwbep/if_message_container,
      content_id      TYPE string,  " Condent ID
      content_id_ref  TYPE string,  " Condent ID Reference
    END OF ty_s_changeset_request .
  TYPES:
    ty_t_changeset_request TYPE STANDARD TABLE OF ty_s_changeset_request WITH KEY operation_no .
  TYPES:
    BEGIN OF ty_s_changeset_response,
      operation_no TYPE i,
      entity_data  TYPE REF TO data,
      headers      TYPE tihttpnvp,
    END OF ty_s_changeset_response .
  TYPES:
    ty_t_changeset_response TYPE SORTED TABLE OF ty_s_changeset_response WITH UNIQUE KEY operation_no .
  TYPES:
    BEGIN OF ty_s_batch_response,
      operation_id                TYPE string,
      response_data               TYPE REF TO data,
      response_data_deleted       TYPE REF TO data,  " for entity set delta handling only
      entity_response_context     TYPE ty_s_mgw_response_entity_cntxt,
      entity_set_response_context TYPE ty_s_mgw_response_context,
      expand_skiptokens           TYPE string_table, " for entity expands only
      headers                     TYPE tihttpnvp,
      exception                   TYPE REF TO /iwbep/cx_mgw_base_exception, " exception for specific operation
      msg_container               TYPE REF TO /iwbep/if_message_container,  " message container for individual operation
    END OF ty_s_batch_response.
  TYPES:
    ty_t_batch_response TYPE SORTED TABLE OF ty_s_batch_response WITH UNIQUE KEY operation_id.
  TYPES:
    BEGIN OF ty_s_model_features,
      use_cache_handshake_busi_req TYPE abap_bool, " Activates the cache handshake for business requests
      use_long_label_for_property  TYPE abap_bool, " Label for properties based on DDIC elements will be taken from long description
      use_edm_type_mapping_sp10    TYPE abap_bool, " Use the EDM type mapping as developed in SP10
      use_edm_type_mapping_v15     TYPE abap_bool, " Use all RAW16 based domains as Edm.Guid (use_edm_type_mapping_sp10 will be set automatically)
      use_shorttext_for_exceptions TYPE abap_bool, " For T100 Exception texts always use the shorttext and not the longtext
      use_crp_by_default           TYPE abap_bool, " All entity sets of this service supports "Cache Request Processing" (CRP) by
      " default. Can be overwritten via /IWBEP/IF_MGW_ODATA_ENTITY_SET->set_use_crp
      use_auto_uppercase_conv      TYPE abap_bool, " Automatically determine uppercase properties and translate to uppercase during inbound processing
      renounce_anno_use_in_dpc     TYPE abap_bool, " The DPC doesn´t read the annotations
      use_deferred_batch_resp_crea TYPE abap_bool, " Use deferred batch response creation (disables CRP and parallelization in $batch)
    END OF ty_s_model_features .
  TYPES:
    BEGIN OF ty_s_entity_set_features,
      use_error_tolerant_conv TYPE abap_bool, " Conversion is error tolerant
    END OF ty_s_entity_set_features .

  CONSTANTS:
    BEGIN OF gcs_operation_type,
      create_deep_entity  TYPE /iwbep/mgw_operation_type VALUE 'CD', "#EC NOTEXT
      create_entity       TYPE /iwbep/mgw_operation_type VALUE 'CE', "#EC NOTEXT
      create_stream       TYPE /iwbep/mgw_operation_type VALUE 'CM', "#EC NOTEXT
      delete_entity       TYPE /iwbep/mgw_operation_type VALUE 'DE', "#EC NOTEXT
      delete_stream       TYPE /iwbep/mgw_operation_type VALUE 'DM', "#EC NOTEXT
      execute_action      TYPE /iwbep/mgw_operation_type VALUE 'EA', "#EC NOTEXT
      expand_entity       TYPE /iwbep/mgw_operation_type VALUE 'XE', "#EC NOTEXT
      expand_entityset    TYPE /iwbep/mgw_operation_type VALUE 'XS', "#EC NOTEXT
      get_entity          TYPE /iwbep/mgw_operation_type VALUE 'GE', "#EC NOTEXT
      get_entityset       TYPE /iwbep/mgw_operation_type VALUE 'GS', "#EC NOTEXT
      get_entityset_delta TYPE /iwbep/mgw_operation_type VALUE 'GD', "#EC NOTEXT
      get_stream          TYPE /iwbep/mgw_operation_type VALUE 'GM', "#EC NOTEXT
      patch_entity        TYPE /iwbep/mgw_operation_type VALUE 'PE', "#EC NOTEXT
      update_entity       TYPE /iwbep/mgw_operation_type VALUE 'UE', "#EC NOTEXT
      update_stream       TYPE /iwbep/mgw_operation_type VALUE 'UM', "#EC NOTEXT
      changeset_begin     TYPE /iwbep/mgw_operation_type VALUE 'HB', "#EC NOTEXT
      changeset_end       TYPE /iwbep/mgw_operation_type VALUE 'HE', "#EC NOTEXT
      changeset_process   TYPE /iwbep/mgw_operation_type VALUE 'HP', "#EC NOTEXT
      get_is_cond_impl    TYPE /iwbep/mgw_operation_type VALUE 'IC', "#EC NOTEXT
    END OF gcs_operation_type .
  CONSTANTS:
    BEGIN OF gcs_modification_status,
      is_not_modified TYPE /iwbep/mgw_is_not_modified VALUE 'X', "#EC NOTEXT
      is_modified     TYPE /iwbep/mgw_is_not_modified VALUE '-', "#EC NOTEXT
      is_undefined    TYPE /iwbep/mgw_is_not_modified VALUE ' ', "#EC NOTEXT
    END OF gcs_modification_status .
  CONSTANTS:
    BEGIN OF gcs_cache_on_client,
      do_not_cache    TYPE /iwbep/mgw_do_not_cache_on_cnt VALUE 'X', "#EC NOTEXT
      can_be_cached   TYPE /iwbep/mgw_do_not_cache_on_cnt VALUE '-', "#EC NOTEXT
      cache_undefined TYPE /iwbep/mgw_do_not_cache_on_cnt VALUE ' ', "#EC NOTEXT
    END OF gcs_cache_on_client .
ENDINTERFACE.