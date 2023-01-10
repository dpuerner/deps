*"* components of interface /IWBEP/IF_MGW_CONV_SRV_RUNTIME
"! <p class="shorttext synchronized" lang="en">OData Channel - Application Convenience Interface</p>
INTERFACE /iwbep/if_mgw_conv_srv_runtime
  PUBLIC .

  TYPES:
    BEGIN OF ty_s_soft_state_info,
      enabled TYPE abap_bool,   " X:   Active
      mode    TYPE /iwbep/if_mgw_core_types=>ty_e_soft_state_mode,  " I/D: Immediate/Delayed (see /IWBEP/IF_MGW_CONV_SRV_RUNTIME~GCS_SOFT_STATE_MODE)
    END OF ty_s_soft_state_info .

  CONSTANTS:
    BEGIN OF gcs_soft_state_mode,
      immediate TYPE /iwbep/if_mgw_core_types=>ty_e_soft_state_mode  VALUE /iwbep/if_mgw_core_types=>gcs_soft_state_mode-immediate,
      delayed   TYPE /iwbep/if_mgw_core_types=>ty_e_soft_state_mode VALUE /iwbep/if_mgw_core_types=>gcs_soft_state_mode-delayed,
    END OF gcs_soft_state_mode .

  "! <p class="shorttext synchronized" lang="en">Gets logger</p>
  "!
  "! @parameter ro_logger | <p class="shorttext synchronized" lang="en">Logger for local AppsLog and CCMS</p>
  METHODS get_logger
    RETURNING
      VALUE(ro_logger) TYPE REF TO /iwbep/cl_cos_logger .
  "! <p class="shorttext synchronized" lang="en">Gets message container</p>
  "!
  "! @parameter ro_message_container | <p class="shorttext synchronized" lang="en">Message Container Interface</p>
  METHODS get_message_container
    RETURNING
      VALUE(ro_message_container) TYPE REF TO /iwbep/if_message_container .
  "! <p class="shorttext synchronized" lang="en">Get Reference of data</p>
  METHODS copy_data_to_ref
    IMPORTING
      !is_data TYPE any
    CHANGING
      !cr_data TYPE REF TO data .
  "! <p class="shorttext synchronized" lang="en">Sets an header with key and value</p>
  "!
  "! @parameter is_header | <p class="shorttext synchronized" lang="en">HTTP Framework (iHTTP) Name/Value Pair</p>
  METHODS set_header
    IMPORTING
      !is_header TYPE ihttpnvp .
  "! <p class="shorttext synchronized" lang="en">Sets the etag to the HTTP response</p>
  METHODS set_etag
    IMPORTING
      !iv_value TYPE string .
  "! <p class="shorttext synchronized" lang="en">Gets the Data Provider Facade</p>
  "!
  "! @parameter ro_dp_facade                 | <p class="shorttext synchronized" lang="en">OData Channel - Data Provider Facade</p>
  "! @raising   /iwbep/cx_mgw_tech_exception | <p class="shorttext synchronized" lang="en">Technical Exception</p>
  METHODS get_dp_facade
    RETURNING
      VALUE(ro_dp_facade) TYPE REF TO /iwbep/if_mgw_dp_facade
    RAISING
      /iwbep/cx_mgw_tech_exception .
  "! <p class="shorttext synchronized" lang="en">Move Corresponding for simple or nested structure/table</p>
  "!
  "! @parameter id_source_data        | <p class="shorttext synchronized" lang="en">Source Data</p>
  "! @parameter iv_supports_move_corr | <p class="shorttext synchronized" lang="en">Is move-corresponding supported</p>
  "! @parameter ed_target_data        | <p class="shorttext synchronized" lang="en">Target Data</p>
  METHODS move_corresponding
    IMPORTING
      !id_source_data        TYPE any
      !iv_supports_move_corr TYPE abap_bool OPTIONAL
    EXPORTING
      !ed_target_data        TYPE any .
  "! <p class="shorttext synchronized" lang="en">Initializes a Data Provider Instance for Unit tests</p>
  "!
  "! @parameter ro_request_context | <p class="shorttext synchronized" lang="en">Unit test enabling  Request Context</p>
  METHODS init_dp_for_unit_test
    IMPORTING
      !is_request_context       TYPE /iwbep/cl_mgw_request_unittst=>ty_s_mgw_request_context_unit
    RETURNING
      VALUE(ro_request_context) TYPE REF TO /iwbep/cl_mgw_request_unittst .
  "! <p class="shorttext synchronized" lang="en">Check if is not modified (return TRUE or FALSE)</p>
  "!
  "! @parameter iv_if_modified_since | <p class="shorttext synchronized" lang="en">if-modified-since</p>
  "! @parameter iv_last_modified     | <p class="shorttext synchronized" lang="en">last-modified</p>
  "! @parameter rv_is_not_modified   | <p class="shorttext synchronized" lang="en">Is Not Modified</p>
  METHODS check_if_is_not_modified
    IMPORTING
      !iv_if_modified_since     TYPE tzntstmps
      !iv_last_modified         TYPE tzntstmps
    RETURNING
      VALUE(rv_is_not_modified) TYPE /iwbep/mgw_is_not_modified .
  "! <p class="shorttext synchronized" lang="en">Get Response Utility</p>
  "!
  "! @parameter ro_response_util | <p class="shorttext synchronized" lang="en">OData Channel - Response Utility</p>
  METHODS get_response_util
    RETURNING
      VALUE(ro_response_util) TYPE REF TO /iwbep/if_mgw_response_util .
  METHODS get_soft_state_info
    RETURNING
      VALUE(rs_soft_state_info) TYPE /iwbep/if_mgw_conv_srv_runtime=>ty_s_soft_state_info .
  "! <p class="shorttext synchronized" lang="en">End Soft-State Session</p>
  METHODS soft_state_session_end
    RAISING
      /iwbep/cx_mgw_tech_exception .
  "! <p class="shorttext synchronized" lang="en">Start Soft-State Session</p>
  METHODS soft_state_session_start
    RAISING
      /iwbep/cx_mgw_tech_exception .
ENDINTERFACE.