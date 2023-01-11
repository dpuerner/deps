*"* components of interface /IWBEP/IF_MGW_CORE_TYPES
"! <p class="shorttext synchronized" lang="en">OData Channel - Core Runtime Types</p>
INTERFACE /iwbep/if_mgw_core_types
  PUBLIC .


  TYPES:
    "! <p class="shorttext synchronized" lang="en">Common response context</p>
    BEGIN OF ty_s_mgw_response_context_comm,
      dummy TYPE abap_bool,
    END OF ty_s_mgw_response_context_comm.
  TYPES ty_s_conditions TYPE /iwbep/if_mgw_appl_types=>ty_s_conditions .
  TYPES ty_s_etag TYPE /iwbep/if_mgw_appl_types=>ty_s_etag .
  TYPES ty_s_etag_value TYPE /iwbep/if_mgw_appl_types=>ty_s_etag_value .
  TYPES BEGIN OF ty_s_mgw_response_entity_cntxt.
  INCLUDE TYPE /iwbep/if_mgw_appl_types=>ty_s_mgw_response_entity_cntxt AS appl_response_context.
  INCLUDE TYPE ty_s_mgw_response_context_comm.
  TYPES END OF ty_s_mgw_response_entity_cntxt.
  TYPES ty_t_etag TYPE /iwbep/if_mgw_appl_types=>ty_t_etag .
  TYPES ty_t_etag_value TYPE /iwbep/if_mgw_appl_types=>ty_t_etag_value .
  "! <p class="shorttext synchronized" lang="en">Media Resource information</p>
  TYPES ty_s_media_resource TYPE /iwbep/if_mgw_appl_types=>ty_s_media_resource .
  "! <p class="shorttext synchronized" lang="en">Soft-State Mode</p>
  TYPES ty_e_soft_state_mode TYPE char1.
  TYPES:
  ty_placeholder_kind TYPE c LENGTH 1 .
  TYPES:
    BEGIN OF ty_s_placeholder_info,
      kind               TYPE ty_placeholder_kind,
      placeholder        TYPE string,
      "internal abap type information
      int_abap_type_kind TYPE abap_typekind,
      int_abap_length    TYPE i,
      int_abap_decimals  TYPE i,
      "provider abap type information
      pro_abap_type_kind TYPE abap_typekind,
      pro_abap_length    TYPE i,
      pro_abap_decimals  TYPE i,
      edm_type_name      TYPE string,
      "conversion information
      conversion_type    TYPE /iwbep/if_mgw_odata_fw_prop=>ty_conversion_type,
      conversion_exit    TYPE convexit,
      function           TYPE c LENGTH 1,
      is_uppercase       TYPE abap_bool,
      ref_placeholder    TYPE string,
    END OF ty_s_placeholder_info .
  TYPES:
    BEGIN OF ty_s_cached_service_info,
      service_technical_name TYPE /iwbep/med_grp_technical_name,
      service_version        TYPE /iwbep/med_grp_version,
      data_provider_class    TYPE seoclsname,
      model_provider_class   TYPE seoclsname,
      metadata_last_modified TYPE timestamp,
    END OF ty_s_cached_service_info .
  TYPES:
  ty_t_placeholder_info TYPE SORTED TABLE OF ty_s_placeholder_info WITH UNIQUE KEY placeholder .
  TYPES:
    BEGIN OF ty_s_mgw_frw_response_context,
      crp_service_info        TYPE ty_s_cached_service_info,
      crp_placeholder_info    TYPE ty_t_placeholder_info,
      auto_add_selected_props TYPE string_table,              " selected properties that have been added to the properties in $select (mandatory fields)
      entity_set_crp_usage    TYPE abap_bool,
      is_target_format        TYPE abap_bool, "The response is already in the target format (i.e. JSON)
      is_cache_hit            TYPE boolean,
      is_cache_hit_shm        TYPE boolean,
      st_entityset_count      TYPE i,
      st_response_size        TYPE i.
      INCLUDE TYPE ty_s_mgw_response_context_comm AS common_response_context.
  TYPES END OF ty_s_mgw_frw_response_context.
  TYPES:
    "! <p class="shorttext synchronized" lang="en">Feed request response information</p>
    BEGIN OF ty_s_mgw_response_context.
      INCLUDE TYPE  /iwbep/if_mgw_appl_types=>ty_s_mgw_response_context AS appl_response_context.
      INCLUDE TYPE  ty_s_mgw_frw_response_context AS frw_response_context.
  TYPES END OF ty_s_mgw_response_context .
  TYPES ty_s_changeset_request TYPE /iwbep/if_mgw_appl_types=>ty_s_changeset_request .
  TYPES ty_t_changeset_request TYPE /iwbep/if_mgw_appl_types=>ty_t_changeset_request .
  TYPES ty_s_changeset_response TYPE /iwbep/if_mgw_appl_types=>ty_s_changeset_response .
  TYPES ty_t_changeset_response TYPE /iwbep/if_mgw_appl_types=>ty_t_changeset_response .

  CONSTANTS gcs_modification_status LIKE /iwbep/if_mgw_appl_types=>gcs_modification_status VALUE /iwbep/if_mgw_appl_types=>gcs_modification_status. "#EC NOTEXT
  CONSTANTS:
    BEGIN OF gcs_verbose_metadata,
      label                     TYPE /iwbep/mgw_verbose_metadata VALUE 'TA', "#EC NOTEXT
      label_heading_quickinfo   TYPE /iwbep/mgw_verbose_metadata VALUE 'TB', "#EC NOTEXT
      all                       TYPE /iwbep/mgw_verbose_metadata VALUE 'TC', "#EC NOTEXT
      metadata_extent_undefined TYPE /iwbep/mgw_verbose_metadata VALUE ' ', "#EC NOTEXT
    END OF gcs_verbose_metadata .
  CONSTANTS:
    BEGIN OF gcs_soft_state_mode,
      immediate TYPE char1 VALUE 'I',
      delayed   TYPE char1 VALUE 'D',
    END OF gcs_soft_state_mode .
  "! <p class="shorttext synchronized" lang="en">SAP Origin field name</p>
  CONSTANTS gc_sap_origin TYPE string VALUE 'SAP__ORIGIN'.  "#EC NOTEXT
  TYPES:
    BEGIN OF ty_s_soft_state_info,
      enabled TYPE abap_bool,             " X: enabled (from /IWFND/MAINT_SERVICE)
      mode    TYPE ty_e_soft_state_mode,  " Immediate/Delayed
      before  TYPE abap_bool,             " Soft State Status of last request
    END OF ty_s_soft_state_info .
  TYPES:
    BEGIN OF ty_s_soft_state_session_info,
      session_start TYPE abap_bool,  " Start Soft State session with the next request
      session_end   TYPE abap_bool,  " End Soft State session at the end of this current request
    END OF ty_s_soft_state_session_info .
ENDINTERFACE.