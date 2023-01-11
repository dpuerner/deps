*"* components of interface /IWBEP/IF_MGW_ODATA_MODEL
"! <p class="shorttext synchronized" lang="en">Interface for a Script-Based Model</p>
INTERFACE /iwbep/if_mgw_odata_model
  PUBLIC .


  "! <p class="shorttext synchronized" lang="en">Single-Character Indicator</p>
  TYPES s TYPE char1 .

  "! <p class="shorttext synchronized" lang="en">Calculate the Entity ID of an included external Entity</p>
  "!
  "! @raising   /iwbep/cx_mgw_med_exception | <p class="shorttext synchronized" lang="en">Meta data exception</p>
  METHODS calculate_external_entity_id
    IMPORTING
      !iv_entity_name    TYPE /iwbep/if_mgw_med_odata_types=>ty_e_med_entity_name
    RETURNING
      VALUE(r_entity_id) TYPE /iwbep/if_mgw_med_odata_types=>ty_e_med_entity_id
    RAISING
      /iwbep/cx_mgw_med_exception .
  "! <p class="shorttext synchronized" lang="en">Creates an OData function import/action</p>
  "!
  "! @parameter iv_action_name | <p class="shorttext synchronized" lang="en">Name of the action as it will be shown in the service</p>
  "! @parameter ro_action      | <p class="shorttext synchronized" lang="en">Returns an instance of an action to do futher changes</p>
  METHODS create_action
    IMPORTING
      !iv_action_name  TYPE /iwbep/if_mgw_med_odata_types=>ty_e_med_entity_name
    RETURNING
      VALUE(ro_action) TYPE REF TO /iwbep/if_mgw_odata_action
    RAISING
      /iwbep/cx_mgw_med_exception .
  "! <p class="shorttext synchronized" lang="en">Creates an association between two Entity Types</p>
  "!
  "! @parameter iv_association_name | <p class="shorttext synchronized" lang="en">name of the association</p>
  "! @parameter iv_left_type        | <p class="shorttext synchronized" lang="en">name of the left entity</p>
  "! @parameter iv_right_type       | <p class="shorttext synchronized" lang="en">name of the left entity</p>
  "! @parameter iv_left_card        | <p class="shorttext synchronized" lang="en">cardinality of the rifht entity</p>
  "! @parameter iv_right_card       | <p class="shorttext synchronized" lang="en">cardinality of the left entity</p>
  "! @parameter iv_def_assoc_set    | <p class="shorttext synchronized" lang="en">if the default association set should be created</p>
  METHODS create_association
    IMPORTING
      !iv_association_name  TYPE /iwbep/if_mgw_med_odata_types=>ty_e_med_entity_name
      !iv_left_type         TYPE /iwbep/if_mgw_med_odata_types=>ty_e_med_entity_name
      !iv_right_type        TYPE /iwbep/if_mgw_med_odata_types=>ty_e_med_entity_name
      !iv_left_card         TYPE /iwbep/if_mgw_med_odata_types=>ty_e_med_cardinality
      !iv_right_card        TYPE /iwbep/if_mgw_med_odata_types=>ty_e_med_cardinality
      !iv_def_assoc_set     TYPE abap_bool DEFAULT abap_true
    RETURNING
      VALUE(ro_association) TYPE REF TO /iwbep/if_mgw_odata_assoc
    RAISING
      /iwbep/cx_mgw_med_exception .
  "! <p class="shorttext synchronized" lang="en">Creates an association set between two Entity Sets</p>
  "!
  "! @parameter ro_association_set | <p class="shorttext synchronized" lang="en">interface representing a script based odata association set</p>
  METHODS create_association_set
    IMPORTING
      !iv_association_set_name  TYPE /iwbep/if_mgw_med_odata_types=>ty_e_med_entity_name
      !iv_left_entity_set_name  TYPE /iwbep/if_mgw_med_odata_types=>ty_e_med_entity_name
      !iv_right_entity_set_name TYPE /iwbep/if_mgw_med_odata_types=>ty_e_med_entity_name
      !iv_association_name      TYPE /iwbep/if_mgw_med_odata_types=>ty_e_med_entity_name OPTIONAL
    RETURNING
      VALUE(ro_association_set) TYPE REF TO /iwbep/if_mgw_odata_assoc_set
    RAISING
      /iwbep/cx_mgw_med_exception .
  "! <p class="shorttext synchronized" lang="en">Creates a reusable OData complex type</p>
  "!
  "! @parameter iv_cplx_type_name | <p class="shorttext synchronized" lang="en">Name of the complex type</p>
  "! @parameter ro_complex_type   | <p class="shorttext synchronized" lang="en">Returns the metadata instance for the new complex type</p>
  METHODS create_complex_type
    IMPORTING
      !iv_cplx_type_name     TYPE /iwbep/if_mgw_med_odata_types=>ty_e_med_entity_name
    RETURNING
      VALUE(ro_complex_type) TYPE REF TO /iwbep/if_mgw_odata_cmplx_type
    RAISING
      /iwbep/cx_mgw_med_exception .
  "! <p class="shorttext synchronized" lang="en">Creates a Data Object / an OData Entity Type</p>
  "!
  "! @parameter iv_entity_type_name | <p class="shorttext synchronized" lang="en">Name of the new Data Object</p>
  "! @parameter iv_def_entity_set   | <p class="shorttext synchronized" lang="en">f the default entity set should be created</p>
  "! @parameter ro_entity           | <p class="shorttext synchronized" lang="en">Instance of the metadata representation of a Data Object</p>
  METHODS create_entity_type
    IMPORTING
      !iv_entity_type_name TYPE /iwbep/if_mgw_med_odata_types=>ty_e_med_entity_name
      !iv_def_entity_set   TYPE abap_bool DEFAULT abap_true
    RETURNING
      VALUE(ro_entity)     TYPE REF TO /iwbep/if_mgw_odata_entity_typ
    RAISING
      /iwbep/cx_mgw_med_exception .
  "! <p class="shorttext synchronized" lang="en">Creates a Service Tag (Keyword)</p>
  "!
  "! @parameter iv_tag_id | <p class="shorttext synchronized" lang="en">Tag as it will be shown in the service - same as the Tag ID</p>
  "! @parameter ro_tag    | <p class="shorttext synchronized" lang="en">Returns the instance of the newly created Service Tag</p>
  METHODS create_tag
    IMPORTING
      !iv_tag_id    TYPE /iwbep/if_mgw_med_odata_types=>ty_e_med_entity_id
    RETURNING
      VALUE(ro_tag) TYPE REF TO /iwbep/if_mgw_odata_tag
    RAISING
      /iwbep/cx_mgw_med_exception .
  "! <p class="shorttext synchronized" lang="en">Creates a long Service Tag (Keyword) - Might be truncated</p>
  "!
  "! @parameter iv_tag_id_long | <p class="shorttext synchronized" lang="en">Tag as it will be shown in the service - might be truncated</p>
  "! @parameter ro_tag         | <p class="shorttext synchronized" lang="en">Returns the instance of the newly created Service Tag</p>
  METHODS create_tag_long
    IMPORTING
      !iv_tag_id_long TYPE /iwbep/if_mgw_med_odata_types=>ty_e_med_tag
    RETURNING
      VALUE(ro_tag)   TYPE REF TO /iwbep/if_mgw_odata_tag
    RAISING
      /iwbep/cx_mgw_med_exception .
  "! <p class="shorttext synchronized" lang="en">extends a SAP Gateway ODC Model using the Model ID</p>
  "!
  "! @parameter iv_model_version | <p class="shorttext synchronized" lang="en">Model Version</p>
  METHODS extend_model
    IMPORTING
      !iv_model_name    TYPE /iwbep/med_mdl_technical_name
      !iv_model_version TYPE /iwbep/med_mdl_version DEFAULT '0001'
    RAISING
      /iwbep/cx_mgw_med_exception .
  "! <p class="shorttext synchronized" lang="en">Returns an OData function import/action</p>
  "!
  "! @parameter iv_action_name | <p class="shorttext synchronized" lang="en">Name of the action which shall be returned</p>
  "! @parameter ro_action      | <p class="shorttext synchronized" lang="en">Returns the action instance for the name</p>
  METHODS get_action
    IMPORTING
      !iv_action_name  TYPE /iwbep/if_mgw_med_odata_types=>ty_e_med_entity_name
    RETURNING
      VALUE(ro_action) TYPE REF TO /iwbep/if_mgw_odata_action
    RAISING
      /iwbep/cx_mgw_med_exception .
  "! <p class="shorttext synchronized" lang="en">Returns an association between two Entity Types</p>
  METHODS get_association
    IMPORTING
      !iv_association_name  TYPE /iwbep/if_mgw_med_odata_types=>ty_e_med_entity_name
    RETURNING
      VALUE(ro_association) TYPE REF TO /iwbep/if_mgw_odata_assoc
    RAISING
      /iwbep/cx_mgw_med_exception .
  "! <p class="shorttext synchronized" lang="en">Returns association set</p>
  "!
  "! @parameter ro_assoc_set | <p class="shorttext synchronized" lang="en">interface representing a script based odata association set</p>
  METHODS get_association_set
    IMPORTING
      !iv_assoc_set_name  TYPE /iwbep/if_mgw_med_odata_types=>ty_e_med_entity_name
    RETURNING
      VALUE(ro_assoc_set) TYPE REF TO /iwbep/if_mgw_odata_assoc_set .
  "! <p class="shorttext synchronized" lang="en">Returns a reusable ODdata complex type</p>
  "!
  "! @parameter iv_cplx_type_name | <p class="shorttext synchronized" lang="en">Name of the complex type which shall be returned</p>
  "! @parameter ro_complex_type   | <p class="shorttext synchronized" lang="en">Instance of the metadata representation for the type</p>
  METHODS get_complex_type
    IMPORTING
      !iv_cplx_type_name     TYPE /iwbep/if_mgw_med_odata_types=>ty_e_med_entity_name
    RETURNING
      VALUE(ro_complex_type) TYPE REF TO /iwbep/if_mgw_odata_cmplx_type
    RAISING
      /iwbep/cx_mgw_med_exception .
  "! <p class="shorttext synchronized" lang="en">Returns entity set</p>
  "!
  "! @parameter ro_entity_set | <p class="shorttext synchronized" lang="en">interface representing a script based odata entity set</p>
  METHODS get_entity_set
    IMPORTING
      !iv_entity_set_name  TYPE /iwbep/if_mgw_med_odata_types=>ty_e_med_entity_name
    RETURNING
      VALUE(ro_entity_set) TYPE REF TO /iwbep/if_mgw_odata_entity_set .
  "! <p class="shorttext synchronized" lang="en">Returns a Data Object / an OData Entity Type</p>
  METHODS get_entity_type
    IMPORTING
      !iv_entity_name       TYPE /iwbep/if_mgw_med_odata_types=>ty_e_med_entity_name
    RETURNING
      VALUE(ro_entity_type) TYPE REF TO /iwbep/if_mgw_odata_entity_typ
    RAISING
      /iwbep/cx_mgw_med_exception .
  "! <p class="shorttext synchronized" lang="en">gets the flag if conversions are executed on the model</p>
  METHODS get_no_conversion
    RETURNING
      VALUE(rv_no_conversion) TYPE abap_bool .
  "! <p class="shorttext synchronized" lang="en">Get the fixed value for the schema namespace if set</p>
  "!
  "! @parameter ev_namespace | <p class="shorttext synchronized" lang="en">Schema Namespace set by MPC or SPACE</p>
  METHODS get_schema_namespace
    EXPORTING
      !ev_namespace TYPE string .
  "! <p class="shorttext synchronized" lang="en">Include any SAP Gateway Model using the External Mapping ID</p>
  "!
  "! @parameter iv_external_mapping_id | <p class="shorttext synchronized" lang="en">External Mapping ID</p>
  METHODS include_model_by_mapping_id
    IMPORTING
      !iv_external_mapping_id TYPE /iwbep/med_external_mapping_id .
  "! <p class="shorttext synchronized" lang="en">Include a SAP GW ODC Model using the Service &amp; Model Name</p>
  "!
  "! @parameter iv_service_version       | <p class="shorttext synchronized" lang="en">Service Version</p>
  "! @parameter iv_model_version         | <p class="shorttext synchronized" lang="en">Model Version</p>
  "! @parameter iv_service_external_name | <p class="shorttext synchronized" lang="en">the optional external Service name</p>
  "! @parameter iv_model_tech_name       | <p class="shorttext synchronized" lang="en">the technical model name</p>
  METHODS include_model_by_name
    IMPORTING
      !iv_service_version       TYPE /iwbep/med_grp_version DEFAULT '0001'
      !iv_model_version         TYPE /iwbep/med_mdl_version DEFAULT '0001'
      !iv_service_external_name TYPE /iwbep/med_grp_technical_name OPTIONAL
      !iv_model_tech_name       TYPE /iwbep/med_mdl_technical_name .
  "! <p class="shorttext synchronized" lang="en">Include a SAP Gateway ODC Model using the Service &amp; Model ID</p>
  "!
  "! @parameter iv_service_identifier | <p class="shorttext synchronized" lang="en">Service Identifier</p>
  "! @parameter iv_service_version    | <p class="shorttext synchronized" lang="en">Service Version</p>
  "! @parameter iv_model_identifier   | <p class="shorttext synchronized" lang="en">Model Identifier</p>
  "! @parameter iv_model_version      | <p class="shorttext synchronized" lang="en">Model Version</p>
  METHODS include_model_by_service_id
    IMPORTING
      !iv_service_identifier TYPE /iwbep/med_grp_technical_name
      !iv_service_version    TYPE /iwbep/med_grp_version DEFAULT '0001'
      !iv_model_identifier   TYPE /iwbep/med_mdl_technical_name
      !iv_model_version      TYPE /iwbep/med_mdl_version DEFAULT '0001' .
  "! <p class="shorttext synchronized" lang="en">Set Model Features</p>
  "!
  "! @parameter is_model_features | <p class="shorttext synchronized" lang="en">Model features</p>
  METHODS set_model_features
    IMPORTING
      !is_model_features TYPE /iwbep/if_mgw_appl_types=>ty_s_model_features .
  "! <p class="shorttext synchronized" lang="en">sets a flag so that conversions are not executed on the mdl</p>
  METHODS set_no_conversion
    IMPORTING
      !iv_no_conversion TYPE abap_bool .
  "! <p class="shorttext synchronized" lang="en">Sets a fixed value for the schema namespace for model</p>
  METHODS set_schema_namespace
    IMPORTING
      !iv_namespace TYPE string .
  "! <p class="shorttext synchronized" lang="en">Sets a fixed value for the service schema version</p>
  "!
  "! @parameter iv_service_schema_version | <p class="shorttext synchronized" lang="en">Service Version</p>
  METHODS set_service_schema_version
    IMPORTING
      !iv_service_schema_version TYPE /iwbep/med_srv_schema_version .
  "! <p class="shorttext synchronized" lang="en">Gets the flag if the DPC has implemented the soft-state intf</p>
  "!
  "! @parameter eV_SOFT_STATE_ENABLED |  "! <p class="shorttext synchronized" lang="en">Enable Soft-State</p>Soft-State is per default disabled. Enable Soft-State with method session_start of interface /iwbep/if_mgw_sost_srv_runtime
  "! @parameter eV_delayed_invocation |  "! <p class="shorttext synchronized" lang="en">Enable delayed invocation</p>
  METHODS get_soft_state_enabled
    EXPORTING
      !ev_soft_state_enabled TYPE abap_bool
      !ev_delayed_invocation TYPE abap_bool.
  "! <p class="shorttext synchronized" lang="en">Sets the flag if the DPC has implemented the soft-state intf</p>
  "!
  "! @parameter IV_SOFT_STATE_ENABLED |  "! <p class="shorttext synchronized" lang="en">Enable Soft-State</p>Soft-State is per default disabled. Enable Soft-State with method session_start of interface /iwbep/if_mgw_sost_srv_runtime
  "! @parameter IV_mode |  "! <p class="shorttext synchronized" lang="en">Enable delayed invocation</p>
  METHODS set_soft_state_enabled
    IMPORTING
      !iv_soft_state_enabled TYPE abap_bool
      !iv_mode TYPE /iwbep/if_mgw_core_types=>ty_e_soft_state_mode DEFAULT /iwbep/if_mgw_core_types=>gcs_soft_state_mode-immediate.
  "! <p class="shorttext synchronized" lang="en">Sets a flag if use of batch is recommended</p>
  METHODS set_use_batch
    IMPORTING
      !iv_use_batch TYPE abap_bool .
ENDINTERFACE.