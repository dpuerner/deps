*"* components of interface /IWBEP/IF_MGW_MED_ODATA_TYPES
interface /IWBEP/IF_MGW_MED_ODATA_TYPES
  public .

  type-pools ABAP .
  interface /IWBEP/IF_MGW_APPL_TYPES load .

*  INTERFACE /iwbep/if_mgw_odata_property LOAD .
  types TY_E_MED_ENTITY_NAME type /IWBEP/MED_EXTERNAL_NAME .
  types:
    ty_e_med_internal_name TYPE c LENGTH 40 .
  types TY_E_MED_TECHNICAL_NAME type TY_E_MED_INTERNAL_NAME .
  types:
    ty_e_med_conv_exit TYPE c LENGTH 5 .
  types:
    ty_e_med_edm_type TYPE c LENGTH 20 .
  types:
    ty_e_med_semantic TYPE c LENGTH 20 .
  types:
    ty_e_med_tag TYPE c LENGTH 78 .   "Till SP09 TY_E_MED_ENTITY_NAME was used for tags
  types TY_E_MED_ENTITY_ID type /IWBEP/MED_ENTITY_ID .
  types TY_E_MDL_TECH_NAME type /IWBEP/MED_MDL_TECHNICAL_NAME .
  types TY_E_MDL_VERSION type /IWBEP/MED_MDL_VERSION .
  types TY_E_MED_ON_DELETE_ACTION type TY_E_MED_ENTITY_NAME . "constants GCS_MED_ON_DELETE_ACTION
  types:
    ty_e_med_text_obj_type TYPE c LENGTH 2 .
  types TY_E_MED_TEXT_KEY type STRING .
  types:
    ty_e_med_text_element_type TYPE c LENGTH 1 .
  types:
    ty_t_med_ext_names TYPE STANDARD TABLE OF ty_e_med_entity_name WITH DEFAULT KEY .
  types:
    ty_t_med_internal_names TYPE STANDARD TABLE OF ty_e_med_internal_name WITH DEFAULT KEY .
  types:
    ty_e_med_cache_key TYPE c LENGTH 81 .
  types:
    BEGIN OF ty_s_extending_service,
      technical_name TYPE /iwbep/med_grp_technical_name,
      version        TYPE /iwbep/med_grp_version,
    END OF ty_s_extending_service .
  types:
    BEGIN OF ty_s_med_auto_expand,
      include_name TYPE string,
      dummy_field  TYPE fieldname,
    END OF ty_s_med_auto_expand .
  types:
    ty_t_med_auto_expand  TYPE STANDARD TABLE OF ty_s_med_auto_expand WITH DEFAULT KEY .
  types:
    BEGIN OF ty_s_med_extended_model,
      model_name    TYPE /iwbep/med_mdl_technical_name,
      model_version TYPE /iwbep/med_mdl_version,
    END OF ty_s_med_extended_model .
  types:
    ty_t_med_extended_model TYPE STANDARD TABLE OF ty_s_med_extended_model WITH DEFAULT KEY .
  types:
    BEGIN OF ty_s_med_header,
      ext_model_tname        TYPE ty_e_mdl_tech_name,          "technical name of the external model
      changed_timestmp       TYPE timestamp,
      no_conversions         TYPE abap_bool,
      source_info_class      TYPE /iwbep/med_definition_class, "Optional: Name of the model provider class if it implements interface /IWBEP/IF_MGW_MED_SOURCE_INFO
      schema_namespace       TYPE string,
      service_schema_version TYPE /iwbep/med_srv_schema_version,
      use_batch              TYPE abap_bool,
      soft_state_enabled     TYPE abap_bool,
      soft_state_mode        TYPE /iwbep/if_mgw_core_types=>ty_e_soft_state_mode,
      extending_service      TYPE ty_s_extending_service,      "Name of the extending service if this service is extended
      model_features         TYPE /iwbep/if_mgw_appl_types=>ty_s_model_features, "model features
      appl_comp_id           TYPE ufps_posid,                  " Application Component ID is "nearly" the same as CSN component!
      is_ral_relevant        TYPE abap_bool,
      model_provider_class   TYPE seoclsname,                  " Name of the MPC
      extendend_models       TYPE ty_t_med_extended_model,
      release_status         TYPE c LENGTH 184,
    END OF ty_s_med_header .
  types:
    BEGIN OF ty_s_med_text,
      entity_id	        TYPE ty_e_med_entity_id,
      txt_object_type	  TYPE ty_e_med_text_obj_type,
      txt_object_id     TYPE string,
      text_element_type TYPE ty_e_med_text_element_type,
    END OF ty_s_med_text .
  types:
    BEGIN OF ty_s_med_txt_elements,
      text_element_type TYPE c LENGTH 1,
      text              TYPE string,
    END OF ty_s_med_txt_elements .
  types:
    ty_t_med_txt_elements TYPE STANDARD TABLE OF ty_s_med_txt_elements WITH DEFAULT KEY .
  types:
    BEGIN OF ty_s_med_obj_texts,
      text_langu      TYPE langu,
      txt_object_type TYPE ty_e_med_text_obj_type,
      txt_object_id   TYPE ty_e_med_text_key,
      text_elements   TYPE ty_t_med_txt_elements,
    END OF ty_s_med_obj_texts .
  types:
    ty_t_med_obj_texts TYPE STANDARD TABLE OF ty_s_med_obj_texts WITH DEFAULT KEY .
  types:
    ty_t_med_texts TYPE STANDARD TABLE OF ty_s_med_text WITH DEFAULT KEY .
  types:
    BEGIN OF ty_s_med_vocan_text,
      entity_id_ref	  TYPE ty_e_med_entity_id,  " reference to entity id of simple value
      txt_object_type	TYPE ty_e_med_text_obj_type,  " the type of text (e.g. DDIC, text element, etc.), "TO DO: see constants..
      txt_object_id   TYPE string,                  " text id (e.g. data element name)
    END OF ty_s_med_vocan_text .
  types:
    ty_ts_med_vocan_texts TYPE SORTED TABLE OF ty_s_med_vocan_text WITH UNIQUE KEY entity_id_ref .
  types:
    ty_t_med_vocan_texts TYPE STANDARD TABLE OF ty_s_med_vocan_text WITH DEFAULT KEY .
  types:
    BEGIN OF ty_s_med_obj_vocan_text,
      entity_id	TYPE ty_e_med_entity_id,
      text      TYPE string,
    END OF ty_s_med_obj_vocan_text .
  types:
    ty_t_med_obj_vocan_texts TYPE SORTED TABLE OF ty_s_med_obj_vocan_text WITH UNIQUE KEY entity_id .
  types:
    BEGIN OF ty_s_mgw_odata_property_int,
      internal_name TYPE /iwbep/if_mgw_med_odata_types=>ty_e_med_internal_name, "Internal Property Name (= Field name in the corresponding structure)
      property      TYPE REF TO /iwbep/if_mgw_odata_property,
    END OF ty_s_mgw_odata_property_int .
  types:
    ty_t_mgw_odata_properties_int TYPE STANDARD TABLE OF ty_s_mgw_odata_property_int WITH DEFAULT KEY .
  types:
    BEGIN OF ty_s_mgw_odata_property,
      external_name TYPE /iwbep/med_external_name,
      name          TYPE /iwbep/if_mgw_med_odata_types=>ty_e_med_internal_name,
      property      TYPE REF TO /iwbep/if_mgw_odata_property,
    END OF ty_s_mgw_odata_property .
  types:
    ty_t_mgw_odata_properties TYPE STANDARD TABLE OF ty_s_mgw_odata_property WITH DEFAULT KEY .
  types:
    BEGIN OF ty_s_mgw_odata_property_info,
      name          TYPE /iwbep/if_mgw_med_odata_types=>ty_e_med_internal_name,
      external_name TYPE /iwbep/med_external_name,
      provider_info TYPE string,
    END OF ty_s_mgw_odata_property_info .
  types:
    ty_t_mgw_odata_properties_info TYPE SORTED TABLE OF ty_s_mgw_odata_property_info WITH UNIQUE KEY name .
  types:
    BEGIN OF ty_s_med_property,
      name                TYPE /iwbep/if_mgw_med_odata_types=>ty_e_med_internal_name,
      external_name       TYPE /iwbep/if_mgw_med_odata_types=>ty_e_med_entity_name,
      entity_id           TYPE /iwbep/if_mgw_med_odata_types=>ty_e_med_entity_id,
      decimals            TYPE i,
      length              TYPE i, "~max lenght
      core_type           TYPE /iwbep/if_mgw_med_odata_types=>ty_e_med_edm_type,
      conv_exit           TYPE /iwbep/if_mgw_med_odata_types=>ty_e_med_conv_exit,
      input_mask          TYPE string,
      is_key              TYPE boolean,
      is_optional         TYPE boolean, "~nullable
      is_read_only        TYPE boolean,
      value_list          TYPE /iwbep/mgw_med_prop_value_list,
      creatable           TYPE boolean,
      filterable          TYPE boolean,
      sortable            TYPE boolean,
      is_disabled         TYPE boolean,
      is_mandatory        TYPE boolean, " key, etag, media source, media type
      internal_type       TYPE abap_typekind,
      internal_length     TYPE i,
      semantic            TYPE /iwbep/if_mgw_med_odata_types=>ty_e_med_semantic,
      unit_property       TYPE /iwbep/if_mgw_med_odata_types=>ty_e_med_entity_name,
      no_conversions      TYPE abap_bool,
      is_uppercase        TYPE abap_bool,
      source_name         TYPE string,
      round_sign          TYPE char1,    "Unit amount only: + up, - down, X commercial, b no rounding)
      is_length_set       TYPE boolean, "Check flag whether the length is set by APIs
      is_decimals_set     TYPE boolean, "Check flag whether the decimal is set by APIs
      is_etag             TYPE boolean, "Property is declared as eTag
      internal_type_org   TYPE abap_typekind, " Original Internal Type, used for currency and unit code
      decimals_org        TYPE i,             " Original decimals, used for currency and unit code
      length_org          TYPE i, "the original length at property definition
      is_ext_field        TYPE boolean,
      edm_precision       TYPE i,
      edm_scale           TYPE i,
      auto_expand_include TYPE string, "Name of the auto-expand include
      provider_info       TYPE string,
      default_value       TYPE string, "Default value of a property as string
    END OF ty_s_med_property .
  types:
    ty_t_med_properties TYPE STANDARD TABLE OF ty_s_med_property WITH DEFAULT KEY .
  types:
    ty_e_med_entity_type TYPE c LENGTH 1 .
  types:
    ty_e_med_cardinality TYPE c LENGTH 1 .
  types:
    ty_e_reference_type  TYPE c LENGTH 1 .
  types:
    BEGIN OF ty_s_med_reference,
      name                    TYPE /iwbep/if_mgw_med_odata_types=>ty_e_med_internal_name,
      external_name           TYPE /iwbep/if_mgw_med_odata_types=>ty_e_med_entity_name,
      entity_id               TYPE /iwbep/if_mgw_med_odata_types=>ty_e_med_entity_id,
      set_names               TYPE /iwbep/if_mgw_med_odata_types=>ty_t_med_ext_names,
      source_entity_id        TYPE /iwbep/if_mgw_med_odata_types=>ty_e_med_entity_id,
      target_entity_id        TYPE /iwbep/if_mgw_med_odata_types=>ty_e_med_entity_id,
      target_mdl_ident        TYPE /iwbep/med_model_identifier,
      source_card             TYPE ty_e_med_cardinality,
      target_card             TYPE ty_e_med_cardinality,
      reference_type          TYPE ty_e_reference_type,
      is_disabled             TYPE boolean,
      semantic                TYPE /iwbep/if_mgw_med_odata_types=>ty_e_med_semantic,
      source_name             TYPE string,
      source_on_delete_action TYPE ty_e_med_on_delete_action,
      target_on_delete_action TYPE ty_e_med_on_delete_action,

      " Only for EntitySet
      use_crp                 TYPE /iwbep/crp_usage,
      use_error_tolerant_conv TYPE abap_bool, " Error tolerant conversion
    END OF ty_s_med_reference .
  types:
    ty_t_med_reference TYPE STANDARD TABLE OF ty_s_med_reference WITH DEFAULT KEY .
  types:
    BEGIN OF ty_s_med_documentation,
      documentation_id     TYPE  /iwbep/if_mgw_med_odata_types=>ty_e_med_entity_id,
      target_id            TYPE  /iwbep/if_mgw_med_odata_types=>ty_e_med_entity_id,
      target_external_name TYPE  /iwbep/if_mgw_med_odata_types=>ty_e_med_entity_name,
    END OF ty_s_med_documentation .
  types:
    ty_t_med_documentation TYPE STANDARD TABLE OF ty_s_med_documentation WITH DEFAULT KEY .
  types:
    BEGIN OF ty_s_med_service_tag,
      tag_id      TYPE  /iwbep/if_mgw_med_odata_types=>ty_e_med_entity_id,
      tag_id_long TYPE  /iwbep/if_mgw_med_odata_types=>ty_e_med_tag,
    END OF ty_s_med_service_tag .
  types:
    ty_t_med_service_tags TYPE STANDARD TABLE OF ty_s_med_service_tag WITH DEFAULT KEY .
  types:
    ty_e_med_container_type TYPE c LENGTH 1 .
  types:
    BEGIN OF ty_s_med_entity_type,
      name               TYPE  /iwbep/if_mgw_med_odata_types=>ty_e_med_internal_name,
      external_name      TYPE  /iwbep/if_mgw_med_odata_types=>ty_e_med_entity_name,
      entity_id          TYPE  /iwbep/if_mgw_med_odata_types=>ty_e_med_entity_id,
      set_names          TYPE /iwbep/if_mgw_med_odata_types=>ty_t_med_ext_names,
      abstract           TYPE abap_bool,
      subscribable       TYPE  boolean,
      creatable          TYPE  boolean,
      updatable          TYPE  boolean,
      deletable          TYPE  boolean,
      pageable           TYPE boolean,
      is_value_list      TYPE boolean,
      anno_target_for_vl TYPE string_table,
      addressable        TYPE boolean,
      attribute_struct   TYPE string,
      freetext_search    TYPE boolean,
      filter_required    TYPE boolean,
      type               TYPE  ty_e_med_container_type,
      is_media_type      TYPE  boolean,
      is_disabled        TYPE boolean,
      semantic           TYPE    /iwbep/if_mgw_med_odata_types=>ty_e_med_semantic,
      properties         TYPE  /iwbep/if_mgw_med_odata_types=>ty_t_med_properties,
      no_conversions     TYPE abap_bool,
      source_name        TYPE string,
      auto_expands       TYPE ty_t_med_auto_expand,                "Table of includes to be auto-expanded
      supports_move_corr TYPE abap_bool, "move-corresponding is supported
      finalized          TYPE abap_bool, "prevent freed memory when EXTEND_MODEL is used)
    END OF ty_s_med_entity_type .
  types:
    ty_t_med_entity_types TYPE STANDARD TABLE OF ty_s_med_entity_type WITH DEFAULT KEY .
  types:
    BEGIN OF ty_s_med_mdl_usage,
      service_name    TYPE /iwbep/med_grp_technical_name,
      service_version TYPE /iwbep/med_grp_version,
      model_name      TYPE /iwbep/med_mdl_technical_name,
      model_version   TYPE /iwbep/med_mdl_version,
    END OF ty_s_med_mdl_usage .
  types:
    ty_t_med_mdl_usage TYPE STANDARD TABLE OF ty_s_med_mdl_usage WITH DEFAULT KEY .
  types:
    BEGIN OF ty_s_med_ext_model_usage_bep,
      service_identifier TYPE /iwbep/med_grp_technical_name,
      service_version    TYPE /iwbep/med_grp_version,
      model_identifier   TYPE /iwbep/med_mdl_technical_name,
      model_version      TYPE /iwbep/med_mdl_version,
    END OF ty_s_med_ext_model_usage_bep .
  types:
    BEGIN OF ty_s_med_ext_model_usage_ext,
      external_mapping_id TYPE  /iwbep/med_external_mapping_id,
    END OF ty_s_med_ext_model_usage_ext .
  types:
    BEGIN OF ty_s_med_external_model_usage,
      bep_usage TYPE ty_s_med_ext_model_usage_bep,
      ext_usage TYPE ty_s_med_ext_model_usage_ext,
    END OF ty_s_med_external_model_usage .
  types:
    ty_t_med_external_model_usage TYPE STANDARD TABLE OF ty_s_med_external_model_usage WITH DEFAULT KEY .
  types:
    BEGIN OF ty_s_med_model_usage,
      external_t TYPE ty_t_med_external_model_usage,
    END OF ty_s_med_model_usage .
  types TY_E_MED_ANNO_VALUE type STRING .
  types TY_E_MED_ANNO_KEY type /IWBEP/MED_ANNOTATION_KEY .
  types TY_E_MED_ANNO_NSP type /IWBEP/MED_ANNO_NAMESPACE .
  types:
    BEGIN OF ty_s_vocan_header,
*      ext_model_tname       TYPE ty_e_mdl_tech_name, "technical name of the external model
      changed_timestmp TYPE timestamp,
      has_vocan_texts  TYPE abap_bool,                 "Indicator if vocan model contains texts for simple values
*      no_conversions        TYPE abap_bool,
*      source_info_class     TYPE /iwbep/med_definition_class, "Optional: Name of the model provider class if it implements interface /IWBEP/IF_MGW_MED_SOURCE_INFO
    END OF ty_s_vocan_header .
  types:
    ty_e_med_anno_map_type   TYPE c LENGTH 2 .
  types:
    BEGIN OF ty_s_med_anno_valuset,
      key   TYPE  ty_e_med_anno_key,
      value	TYPE ty_e_med_anno_value,
    END OF ty_s_med_anno_valuset .
  types:
    ty_t_med_anno_valuset TYPE STANDARD TABLE OF ty_s_med_anno_valuset WITH DEFAULT KEY .
  types:
    BEGIN OF ty_s_med_annotation_vs,
      key          TYPE  ty_e_med_anno_key,
      value	       TYPE ty_e_med_anno_value,
      mapping_type TYPE ty_e_med_anno_map_type,
      children     TYPE ty_t_med_anno_valuset,
      is_ref_anno  TYPE boolean,
    END OF ty_s_med_annotation_vs .
  types:
    ty_t_med_annotation_vs TYPE STANDARD TABLE OF ty_s_med_annotation_vs WITH DEFAULT KEY .
  types:
    BEGIN OF ty_s_med_annotation,
      namespace TYPE ty_e_med_anno_nsp,
      valueset  TYPE ty_t_med_annotation_vs,
    END OF ty_s_med_annotation .
  types:
    ty_t_med_annotation TYPE STANDARD TABLE OF ty_s_med_annotation WITH DEFAULT KEY .
  types:
    BEGIN OF ty_s_med_entity_id,
      uuid      TYPE ty_e_med_entity_id,
      uuid_type TYPE c LENGTH 1,
    END OF ty_s_med_entity_id .
  types:
    BEGIN OF ty_s_med_entity_annos,
      entity_id   TYPE ty_s_med_entity_id,
      annotations TYPE ty_t_med_annotation,
    END OF ty_s_med_entity_annos .
  types:
    ty_t_med_entity_annos TYPE STANDARD TABLE OF ty_s_med_entity_annos WITH DEFAULT KEY .
  types:
    ty_e_med_function_type TYPE c LENGTH 1 .
  types:
    BEGIN OF ty_s_med_entity_parameter,
      name      TYPE /iwbep/if_mgw_med_odata_types=>ty_e_med_entity_name,
      entity_id TYPE /iwbep/if_mgw_med_odata_types=>ty_e_med_entity_id,
    END OF ty_s_med_entity_parameter .
  types:
    BEGIN OF ty_s_med_function,
      name            TYPE /iwbep/if_mgw_med_odata_types=>ty_e_med_internal_name,
      external_name   TYPE /iwbep/if_mgw_med_odata_types=>ty_e_med_entity_name,
      entity_id       TYPE /iwbep/if_mgw_med_odata_types=>ty_e_med_entity_id,
      multiplicity    TYPE ty_e_med_cardinality,
      operation_type  TYPE ty_e_med_function_type,
      freetext_search TYPE  boolean,
      enabled         TYPE boolean,
      is_disabled     TYPE boolean,
      input_node      TYPE ty_e_med_entity_id,
      output_node     TYPE ty_e_med_entity_id,
      semantic        TYPE /iwbep/if_mgw_med_odata_types=>ty_e_med_semantic,
      source_name     TYPE string,
    END OF ty_s_med_function .
  types:
    ty_t_med_functions TYPE STANDARD TABLE OF ty_s_med_function WITH DEFAULT KEY .
  types:
    BEGIN OF ty_s_med_mapping,
      reference_id      TYPE ty_e_med_entity_id,
      target_path       TYPE string,
      source_path       TYPE string,
      is_disabled       TYPE boolean,
      is_principal_left TYPE boolean,
      target_ext_name   TYPE /iwbep/if_mgw_med_odata_types=>ty_e_med_entity_name,
      source_ext_name   TYPE /iwbep/if_mgw_med_odata_types=>ty_e_med_entity_name,
    END OF ty_s_med_mapping .
  types:
    ty_t_med_mapping TYPE STANDARD TABLE OF ty_s_med_mapping WITH DEFAULT KEY .
  types:
    BEGIN OF ty_s_med_abap_fddesc,
      type     TYPE  inttype,  "Internal data type (internal ABAP type)
      length   TYPE  intlen,   "Internal Length in Bytes
      decimals TYPE  decimals, "Number of Decimal Places
    END OF ty_s_med_abap_fddesc .
  types:
*  TYPES:
*    BEGIN OF ty_s_vocan_vocab_ref,
*      namespace       TYPE string,
*      alias           TYPE string,
*    END OF   ty_s_vocan_vocab_ref .
*  TYPES:
*     ty_t_vocan_vocab_refs TYPE STANDARD TABLE OF ty_s_vocan_vocab_ref WITH DEFAULT KEY .
*
*  TYPES:
* BEGIN OF ty_s_vocan_vocab_ref2,
*   vocab_id        TYPE /IWBEP/MED_VOCAB_ID,
*   vocab_version   TYPE /IWBEP/MED_VOCAB_VERSION,
* END OF   ty_s_vocan_vocab_ref2 .
*  TYPES:
*    ty_t_vocan_vocab_refs2 TYPE STANDARD TABLE OF ty_s_vocan_vocab_ref2 WITH DEFAULT KEY .
    BEGIN OF ty_s_vocan_vocab_include_s,
      namespace TYPE string,
      alias     TYPE string,
    END OF ty_s_vocan_vocab_include_s .
  types:
    ty_t_vocan_vocab_includes TYPE STANDARD TABLE OF ty_s_vocan_vocab_include_s WITH DEFAULT KEY .
  types:
    BEGIN OF ty_s_vocan_vocab_ref,
      vocab_id      TYPE /iwbep/med_vocab_id,
      vocab_version TYPE /iwbep/med_vocab_version,
      origin        TYPE string,
      includes      TYPE ty_t_vocan_vocab_includes,
    END OF ty_s_vocan_vocab_ref .
  types:
    ty_t_vocan_vocab_refs TYPE STANDARD TABLE OF ty_s_vocan_vocab_ref WITH DEFAULT KEY .
  types:
    BEGIN OF ty_s_vocan_anno_ref,
      annofile_id      TYPE /iwbep/med_vocab_id,
      annofile_version TYPE /iwbep/med_vocab_version,
      includes         TYPE ty_t_vocan_vocab_includes,
    END OF ty_s_vocan_anno_ref .
  types:
    ty_t_vocan_anno_refs TYPE STANDARD TABLE OF ty_s_vocan_anno_ref WITH DEFAULT KEY .
  types:
    BEGIN OF ty_s_vocan_ser2ann_ref,
      anno_tech_name  TYPE /iwbep/med_va_file_tech_name,
      anno_version    TYPE /iwbep/med_va_file_version,
      is_main_service	TYPE /iwbep/med_va_is_life_control,
      description     TYPE /iwbep/med_description.
  TYPES:  END OF ty_s_vocan_ser2ann_ref .
  types:
    ty_t_vocan_ser2ann_refs TYPE STANDARD TABLE OF ty_s_vocan_ser2ann_ref WITH DEFAULT KEY .
  types:
* Annotation file to services reference
    BEGIN OF ty_s_vocan_ann2ser_ref,
      serv_tech_name  TYPE /iwbep/med_grp_technical_name,
      serv_ext_name   TYPE /iwbep/med_grp_external_name,
      version         TYPE /iwbep/med_grp_version,
      namespace       TYPE /iwbep/med_grp_namespace,
      is_main_service	TYPE /iwbep/med_va_is_life_control,
      includes        TYPE ty_t_vocan_vocab_includes.
  TYPES:  END OF ty_s_vocan_ann2ser_ref .
  types:
    ty_t_vocan_ann2ser_refs TYPE STANDARD TABLE OF ty_s_vocan_ann2ser_ref WITH DEFAULT KEY .
  types:
    BEGIN OF ty_s_vocan_expression_key,
      expression_id   TYPE /iwbep/if_mgw_med_odata_types=>ty_e_med_entity_id,
      expression_type TYPE c LENGTH 10,   "See GCS_VOCAN_EXPRESSION_TYPES
    END OF   ty_s_vocan_expression_key .
  types:
    ty_t_vocan_expression_keys TYPE STANDARD TABLE OF ty_s_vocan_expression_key WITH DEFAULT KEY .
  types:
    BEGIN OF ty_s_vocan_annotation_id,
      annotation_id TYPE /iwbep/if_mgw_med_odata_types=>ty_e_med_entity_id,
    END OF   ty_s_vocan_annotation_id .
  types:
    ty_t_vocan_annotation_ids TYPE STANDARD TABLE OF ty_s_vocan_annotation_id WITH DEFAULT KEY .
  types:
    BEGIN OF ty_s_vocan_ann_target,
      entity_id           TYPE /iwbep/if_mgw_med_odata_types=>ty_e_med_entity_id,
      target              TYPE string,
      qualifier           TYPE string,  "used to discriminate between multiple bindings of the same property or type.
      namespace_qualifier TYPE string,  "used to store the namespace alias
      annotation_ids      TYPE ty_t_vocan_annotation_ids,
    END OF   ty_s_vocan_ann_target .
  types:
    ty_t_vocan_ann_targets TYPE STANDARD TABLE OF ty_s_vocan_ann_target WITH DEFAULT KEY .
  types:
    BEGIN OF ty_s_vocan_term,
      entity_id     TYPE /iwbep/if_mgw_med_odata_types=>ty_e_med_entity_id,
      name          TYPE /iwbep/mgw_med_vocan_name,
      type          TYPE /iwbep/mgw_med_vocan_type,
      base_term     TYPE /iwbep/mgw_med_vocan_base_term,
      nullable      TYPE /iwbep/mgw_med_vocan_nullable,
      default_value TYPE /iwbep/mgw_med_vocan_def_value,
      applies_to    TYPE /iwbep/mgw_med_vocan_appl_to,
      facets        TYPE /iwbep/s_mgw_vocan_facets,
    END OF ty_s_vocan_term .
  types:
    ty_t_vocan_terms TYPE STANDARD TABLE OF ty_s_vocan_term WITH DEFAULT KEY .
  types:
    BEGIN OF ty_s_vocan_annotation,
      entity_id              TYPE /iwbep/if_mgw_med_odata_types=>ty_e_med_entity_id,
      term                   TYPE string,  "the term name bound by the annotation.
      qualifier              TYPE string,  "used to discriminate between multiple bindings of the same property or type.
      child_annotation_ids   TYPE ty_t_vocan_annotation_ids, "IDs of annotation within an annotation
      is_value_list          TYPE abap_bool,
      value_list_entity_name TYPE /iwbep/if_mgw_med_odata_types=>ty_e_med_entity_name.
      INCLUDE TYPE /iwbep/if_mgw_med_odata_types=>ty_s_vocan_expression_key.
  TYPES: END OF   ty_s_vocan_annotation .
  types:
    ty_t_vocan_annotations TYPE STANDARD TABLE OF ty_s_vocan_annotation WITH DEFAULT KEY .
  types:
    BEGIN OF ty_s_vocan_collection,
      entity_id       TYPE /iwbep/if_mgw_med_odata_types=>ty_e_med_entity_id,
      expression_keys TYPE ty_t_vocan_expression_keys,
    END OF   ty_s_vocan_collection .
  types:
    ty_t_vocan_collections TYPE STANDARD TABLE OF ty_s_vocan_collection WITH DEFAULT KEY .
  types:
    BEGIN OF ty_s_vocan_property_id,
      property_id TYPE /iwbep/if_mgw_med_odata_types=>ty_e_med_entity_id,
    END OF   ty_s_vocan_property_id .
  types:
    ty_t_vocan_property_ids TYPE STANDARD TABLE OF ty_s_vocan_property_id WITH DEFAULT KEY .
  types:
    BEGIN OF ty_s_vocan_record,
      entity_id      TYPE /iwbep/if_mgw_med_odata_types=>ty_e_med_entity_id,
      property_ids   TYPE ty_t_vocan_property_ids,
      type           TYPE string,
      annotation_ids TYPE ty_t_vocan_annotation_ids,
    END OF   ty_s_vocan_record .
  types:
    ty_t_vocan_records TYPE STANDARD TABLE OF ty_s_vocan_record WITH DEFAULT KEY .
  types:
    BEGIN OF ty_s_vocan_property,
      entity_id      TYPE /iwbep/if_mgw_med_odata_types=>ty_e_med_entity_id,
      name           TYPE string,
      annotation_ids TYPE ty_t_vocan_annotation_ids.
      INCLUDE         TYPE ty_s_vocan_expression_key.
  TYPES: END OF    ty_s_vocan_property .
  types:
    ty_t_vocan_properties TYPE STANDARD TABLE OF ty_s_vocan_property WITH DEFAULT KEY .
  types:
    BEGIN OF ty_s_vocan_simple_val,
      entity_id            TYPE /iwbep/if_mgw_med_odata_types=>ty_e_med_entity_id,
      type                 TYPE c LENGTH 10 ,    " See GCS_VOCAN_SIMPLE_VALUES
      string_like_value    TYPE string,          " STRING value or PATH value
      integer_value        TYPE int4,
      boolean_value        TYPE abap_bool,
      date_value           TYPE dats,
      datetimeoffset_value TYPE p LENGTH 14 DECIMALS 12,
      decimal_value        TYPE p LENGTH 16 DECIMALS 14,
      float_value          TYPE float,
      is_text              TYPE abap_bool,       "contains a text that is defined in a separate text table
    END OF   ty_s_vocan_simple_val .
  types:
    BEGIN OF ty_s_vocan_cond_exp_param_id,
      cond_exp_parameter_id TYPE /iwbep/if_mgw_med_odata_types=>ty_e_med_entity_id,
    END OF   ty_s_vocan_cond_exp_param_id .
  types:
    ty_t_vocan_cond_exp_param_id TYPE STANDARD TABLE OF ty_s_vocan_cond_exp_param_id WITH DEFAULT KEY .
  types:
    ty_con_expression_operator TYPE c LENGTH 3 .
  types:
    BEGIN OF ty_s_vocan_cond_exp,
      entity_id               TYPE /iwbep/if_mgw_med_odata_types=>ty_e_med_entity_id,
      con_expression_operator TYPE ty_con_expression_operator,
      cond_exp_parameter      TYPE ty_t_vocan_cond_exp_param_id,
      annotation_ids          TYPE ty_t_vocan_annotation_ids,
    END OF   ty_s_vocan_cond_exp .
  types:
    ty_t_vocan_cond_exp TYPE STANDARD TABLE OF ty_s_vocan_cond_exp WITH DEFAULT KEY .
  types:
    BEGIN OF ty_s_vocan_cond_exp_param,
      entity_id TYPE /iwbep/if_mgw_med_odata_types=>ty_e_med_entity_id.
      INCLUDE TYPE ty_s_vocan_expression_key.
  TYPES:  END OF   ty_s_vocan_cond_exp_param .
  types:
    ty_t_vocan_cond_exp_param TYPE STANDARD TABLE OF ty_s_vocan_cond_exp_param WITH DEFAULT KEY .
  types:
    ty_t_vocan_simple_vals TYPE STANDARD TABLE OF ty_s_vocan_simple_val WITH DEFAULT KEY .
  types:
    BEGIN OF ty_s_vocan_fun_param_id,
      fun_param_id TYPE /iwbep/if_mgw_med_odata_types=>ty_e_med_entity_id,
    END OF   ty_s_vocan_fun_param_id .
  types:
    ty_t_vocan_fun_param_ids TYPE STANDARD TABLE OF ty_s_vocan_fun_param_id WITH DEFAULT KEY .
  types:
    BEGIN OF ty_s_vocan_function,
      entity_id     TYPE /iwbep/if_mgw_med_odata_types=>ty_e_med_entity_id,
      name          TYPE string,
      fun_param_ids TYPE ty_t_vocan_fun_param_ids,
    END OF   ty_s_vocan_function .
  types:
    ty_t_vocan_functions TYPE STANDARD TABLE OF ty_s_vocan_function WITH DEFAULT KEY .
  types:
    BEGIN OF ty_s_vocan_fun_param,
      entity_id TYPE /iwbep/if_mgw_med_odata_types=>ty_e_med_entity_id.
      INCLUDE TYPE ty_s_vocan_expression_key.
  TYPES:  END OF   ty_s_vocan_fun_param .
  types:
    ty_t_vocan_fun_params TYPE STANDARD TABLE OF ty_s_vocan_fun_param WITH DEFAULT KEY .
  types:
    BEGIN OF ty_s_vocan_label_elem,
      entity_id      TYPE /iwbep/if_mgw_med_odata_types=>ty_e_med_entity_id,
      name           TYPE string,
      annotation_ids TYPE ty_t_vocan_annotation_ids.
      INCLUDE TYPE ty_s_vocan_expression_key.
  TYPES:  END OF ty_s_vocan_label_elem .
  types:
    ty_t_vocan_label_elems TYPE STANDARD TABLE OF ty_s_vocan_label_elem WITH DEFAULT KEY .
  types:
    BEGIN OF ty_s_vocan_url,
      entity_id TYPE /iwbep/if_mgw_med_odata_types=>ty_e_med_entity_id.
      INCLUDE TYPE ty_s_vocan_expression_key.
  TYPES:  END OF   ty_s_vocan_url .
  types:
    ty_t_vocan_urls TYPE STANDARD TABLE OF ty_s_vocan_url WITH DEFAULT KEY .
  types:
    BEGIN OF ty_s_vocan_model,
      header                TYPE ty_s_vocan_header,         "Header information of the Vocan model
      referenced_anno_files TYPE ty_t_vocan_ser2ann_refs,   "References TO this Service defined in the Annotation Files Repository
      vocab_references      TYPE ty_t_vocan_vocab_refs,     "References TO an Vocabulary
      annofile_references   TYPE ty_t_vocan_anno_refs,      "References TO an Annnotaion File
      referenced_services   TYPE ty_t_vocan_ann2ser_refs,   "References TO Services of this annotation file
      annotation_targets    TYPE ty_t_vocan_ann_targets,    "Vocabulary Annotation Targets
      annotations           TYPE ty_t_vocan_annotations,    "Vocabulary Annotation
      collections           TYPE ty_t_vocan_collections,    "Vocabulary Annotation Collections
      records               TYPE ty_t_vocan_records,        "Vocabulary Annotation Records
      properties            TYPE ty_t_vocan_properties,     "Vocabulary Annotation Properties
      simple_values         TYPE ty_t_vocan_simple_vals,    "Vocabulary Annotation Simple Values
      functions             TYPE ty_t_vocan_functions,      "Vocabulary Annotation Functions
      function_params       TYPE ty_t_vocan_fun_params,     "Vocabulary Annotation Function Parameters
      con_expressions       TYPE ty_t_vocan_cond_exp,       "Vocabulary Annotation Conditional Expressions
      con_expression_params TYPE ty_t_vocan_cond_exp_param, "Vocabulary Annotation Conditional Expressions Parameter
      urls                  TYPE ty_t_vocan_urls,           "Vocabulary Annotation URLs
      labeled_elements      TYPE ty_t_vocan_label_elems,    "Vocabulary Annotation Labeled Elements
      terms                 TYPE ty_t_vocan_terms,          "Vocabulary Annotation Terms
      vocan_text_keys       TYPE ty_ts_med_vocan_texts,  "Texts for Vocabulary Annotation Simple Values
    END OF ty_s_vocan_model .
  types:
    BEGIN OF ty_s_med_model,
      entities            TYPE ty_t_med_entity_types,
      references          TYPE ty_t_med_reference,
      operations          TYPE ty_t_med_functions,
      text_keys           TYPE ty_t_med_texts,
      documentation       TYPE ty_t_med_documentation,
      tags                TYPE ty_t_med_service_tags,
      private_annotations TYPE ty_t_med_entity_annos,
      public_annotations  TYPE ty_t_med_entity_annos,
      mapping             TYPE ty_t_med_mapping,
      header              TYPE ty_s_med_header,
      model_usages        TYPE ty_t_med_mdl_usage,
      model_usage         TYPE ty_s_med_model_usage,
      vocan_model         TYPE ty_s_vocan_model,
    END OF ty_s_med_model .
  types:
    ty_e_med_http_method TYPE c LENGTH 6 .
  types TY_E_ANNO_VALUE type TY_E_MED_ANNO_VALUE .

  constants:
    BEGIN OF gcs_con_expression_operator,
      equals         TYPE /iwbep/if_mgw_med_odata_types=>ty_con_expression_operator VALUE 'EQ',
      not_equals     TYPE /iwbep/if_mgw_med_odata_types=>ty_con_expression_operator VALUE 'NE',
      greater_equals TYPE /iwbep/if_mgw_med_odata_types=>ty_con_expression_operator VALUE 'GE',
      greater_than   TYPE /iwbep/if_mgw_med_odata_types=>ty_con_expression_operator VALUE 'GT',
      less_equals    TYPE /iwbep/if_mgw_med_odata_types=>ty_con_expression_operator VALUE 'LE',
      less_than      TYPE /iwbep/if_mgw_med_odata_types=>ty_con_expression_operator VALUE 'LT',
      and            TYPE /iwbep/if_mgw_med_odata_types=>ty_con_expression_operator VALUE 'AND',
      or             TYPE /iwbep/if_mgw_med_odata_types=>ty_con_expression_operator VALUE 'OR',
      if             TYPE /iwbep/if_mgw_med_odata_types=>ty_con_expression_operator VALUE 'IF',
      not            TYPE /iwbep/if_mgw_med_odata_types=>ty_con_expression_operator VALUE 'NOT',
    END OF gcs_con_expression_operator .
  constants BOOLEAN_FALSE type BOOLEAN value '-' ##NO_TEXT.
  constants:
    BEGIN OF gcs_entity_type,
      property      TYPE ty_e_med_entity_type VALUE 'P',    "#EC NOTEXT
      operation     TYPE ty_e_med_entity_type VALUE 'O',    "#EC NOTEXT
      reference     TYPE ty_e_med_entity_type VALUE 'R',    "#EC NOTEXT
      entry         TYPE ty_e_med_entity_type VALUE 'N',    "#EC NOTEXT
      parameter     TYPE ty_e_med_entity_type VALUE 'I',    "#EC NOTEXT
      documentation TYPE ty_e_med_entity_type VALUE 'D',    "#EC NOTEXT
    END OF gcs_entity_type .
  constants:
    BEGIN OF gcs_text_e_type,
      member_title     TYPE ty_e_med_text_element_type VALUE 'N',
      collection       TYPE ty_e_med_text_element_type VALUE 'C',
      title            TYPE ty_e_med_text_element_type VALUE 'X',
      label            TYPE ty_e_med_text_element_type VALUE 'L',
      heading          TYPE ty_e_med_text_element_type VALUE 'H',
      quickinfo        TYPE ty_e_med_text_element_type VALUE 'Q',
      docu_summary     TYPE ty_e_med_text_element_type VALUE 'S',
      docu_description TYPE ty_e_med_text_element_type VALUE 'D',
      long_label       TYPE ty_e_med_text_element_type VALUE 'Z',
    END OF gcs_text_e_type .
  constants:
    BEGIN OF gcs_container_type,
      data_object     TYPE ty_e_med_container_type VALUE 'R',
      complex         TYPE ty_e_med_container_type VALUE 'X',
      param_container TYPE ty_e_med_container_type VALUE 'P',
    END OF gcs_container_type .
  constants:
    BEGIN OF gcs_cardinality,
      cardinality_0_1 TYPE ty_e_med_cardinality VALUE '0',
      cardinality_1_1 TYPE ty_e_med_cardinality VALUE '1',
      cardinality_0_n TYPE ty_e_med_cardinality VALUE 'M',
      cardinality_1_n TYPE ty_e_med_cardinality VALUE 'N',
    END OF gcs_cardinality .
  constants:
    BEGIN OF gcs_reference_type,
      nav_property      TYPE ty_e_reference_type  VALUE 'P',
      entity_set        TYPE ty_e_reference_type  VALUE 'S',
      assocset_to_es    TYPE ty_e_reference_type  VALUE 'E',
      assocset_to_assoc TYPE ty_e_reference_type  VALUE 'C',
      association       TYPE ty_e_reference_type  VALUE 'A',
      complex           TYPE ty_e_reference_type  VALUE 'X',
      containment       TYPE ty_e_reference_type  VALUE 'D',
      inheritance       TYPE ty_e_reference_type  VALUE 'I',
    END OF gcs_reference_type .
  constants:
    BEGIN OF gcs_edm_data_types,
      binary         TYPE ty_e_med_edm_type VALUE 'Edm.Binary',    " Contains binary data.
      boolean        TYPE ty_e_med_edm_type VALUE 'Edm.Boolean',   " Contains the value true or false.
      byte           TYPE ty_e_med_edm_type VALUE 'Edm.Byte',      " Contains an unsigned 8-bit integer value.
      date           TYPE ty_e_med_edm_type VALUE 'Edm.Date',      " Represents a date (ODATA V4)
      datetime       TYPE ty_e_med_edm_type VALUE 'Edm.DateTime',  " Represents a date and time.
      datetimeoffset TYPE ty_e_med_edm_type VALUE 'Edm.DateTimeOffset', " Contains a date and time as an offset in minutes from GMT.
      decimal        TYPE ty_e_med_edm_type VALUE 'Edm.Decimal',   " Contains a numeric value with fixed precision and scale.
      double         TYPE ty_e_med_edm_type VALUE 'Edm.Double',    " Contains a floating point number with 15 digit precision.
      float          TYPE ty_e_med_edm_type VALUE 'Edm.Float',     " Contains a floating point number with seven digit precision.
      single         TYPE ty_e_med_edm_type VALUE 'Edm.Single',    " Contains a floating point number with seven digit precision.
      guid           TYPE ty_e_med_edm_type VALUE 'Edm.Guid',      " Contains a 16-byte unique identifier.
      int16          TYPE ty_e_med_edm_type VALUE 'Edm.Int16',     " Contains a signed 16-bit integer value.
      int32          TYPE ty_e_med_edm_type VALUE 'Edm.Int32',     " Contains a signed 32-bit integer value.
      int64          TYPE ty_e_med_edm_type VALUE 'Edm.Int64',     " Contains a signed 64-bit integer value.
      sbyte          TYPE ty_e_med_edm_type VALUE 'Edm.SByte',     " Contains a signed 8-bit integer value.
      string         TYPE ty_e_med_edm_type VALUE 'Edm.String',    " Contains character data.
      time           TYPE ty_e_med_edm_type VALUE 'Edm.Time',      " Contains a time of day.
      timeofday      TYPE ty_e_med_edm_type VALUE 'Edm.TimeOfDay',  " Contains a time of day (ODATA V4)
    END OF gcs_edm_data_types .
  constants:
    BEGIN OF gcs_anno_map_type,
      collection          TYPE ty_e_med_anno_map_type VALUE 'CO',
      entity_set          TYPE ty_e_med_anno_map_type VALUE 'ES',
      entity_type         TYPE ty_e_med_anno_map_type VALUE 'ET',
      association_set     TYPE ty_e_med_anno_map_type VALUE 'AS',
      association         TYPE ty_e_med_anno_map_type VALUE 'AO',
      navigation_property TYPE ty_e_med_anno_map_type VALUE 'NP',
      property            TYPE ty_e_med_anno_map_type VALUE 'PR',
      function            TYPE ty_e_med_anno_map_type VALUE 'OP',
      documentation       TYPE ty_e_med_anno_map_type VALUE 'DO',
    END OF gcs_anno_map_type .
  constants FUNCTION_TYPE_SERVICE type TY_E_MED_FUNCTION_TYPE value 'X' ##NO_TEXT.
  constants:
    BEGIN OF gcs_med_http_methods,
      post   TYPE ty_e_med_http_method VALUE 'POST',
      put    TYPE ty_e_med_http_method VALUE 'PUT',
      get    TYPE ty_e_med_http_method VALUE 'GET',
      merge  TYPE ty_e_med_http_method VALUE 'MERGE',
      delete TYPE ty_e_med_http_method VALUE 'DELETE',
    END OF gcs_med_http_methods .
  constants:
    BEGIN OF gcs_vocan_expression_types,
      collection   TYPE c LENGTH 10 VALUE 'Collection',
      record       TYPE c LENGTH 10 VALUE 'Record',
      con_exp      TYPE c LENGTH 10 VALUE 'Con_Expr',
      function     TYPE c LENGTH 10 VALUE 'Function',
      simple_value TYPE c LENGTH 10 VALUE 'Simple_Val',
      url          TYPE c LENGTH 10 VALUE 'URL',
      label_elem   TYPE c LENGTH 10 VALUE 'Label_Elem',
    END   OF gcs_vocan_expression_types .
  constants:
    BEGIN OF gcs_vocan_simple_values,
      string         TYPE c LENGTH 10 VALUE 'String',
      path           TYPE c LENGTH 10 VALUE 'Path',
      prop_path      TYPE c LENGTH 10 VALUE 'PropPath',    "Property Path
      anno_path      TYPE c LENGTH 10 VALUE 'AnnoPath',    "Annotation Path
      nav_prop_path  TYPE c LENGTH 10 VALUE 'NavProPath',  "Navigation Property Path
      lab_elem_ref   TYPE c LENGTH 10 VALUE 'LabElemRef',  "Labeled Element Reference
      enum_member    TYPE c LENGTH 10 VALUE 'EnumMember',  "Enum Member Reference
      integer        TYPE c LENGTH 10 VALUE 'Integer',
      boolean        TYPE c LENGTH 10 VALUE 'Boolean',
      decimal        TYPE c LENGTH 10 VALUE 'Decimal',
      datetimeoffset TYPE c LENGTH 10 VALUE 'DateTimeOf',
      date           TYPE c LENGTH 10 VALUE 'Date',
      float          TYPE c LENGTH 10 VALUE 'Float',
    END   OF gcs_vocan_simple_values .
  constants GC_ANNO_TRUE type TY_E_MED_ANNO_VALUE value 'true' ##NO_TEXT.
  constants GC_ANNO_FALSE type TY_E_MED_ANNO_VALUE value 'false' ##NO_TEXT.
  constants GC_SAP_NAMESPACE type TY_E_MED_ANNO_NSP value 'sap' ##NO_TEXT.
  constants GC_MSFT_NAMESPACE type TY_E_MED_ANNO_NSP value 'm' ##NO_TEXT.
  constants GC_MSFT_HTTP_METHOD type TY_E_MED_ANNO_KEY value 'HttpMethod' ##NO_TEXT.
  constants GC_ANNO_SUFFIX type TY_E_MED_ANNO_VALUE value 'anno' ##NO_TEXT.
  constants:
    BEGIN OF gcs_anno_simple_value_text,
      has_text    TYPE boolean VALUE abap_true,
      has_no_text TYPE boolean VALUE abap_false,
    END OF gcs_anno_simple_value_text .
  constants:
    BEGIN OF gcs_vocan_text_types,
      text_element           TYPE ty_e_med_text_obj_type VALUE 'T',
      data_element           TYPE ty_e_med_text_obj_type VALUE 'D',
      data_element_short     TYPE ty_e_med_text_obj_type VALUE 'DS',
      data_element_medium    TYPE ty_e_med_text_obj_type VALUE 'DM',
      data_element_long      TYPE ty_e_med_text_obj_type VALUE 'DL',
      data_element_heading   TYPE ty_e_med_text_obj_type VALUE 'DH',
      data_element_quickinfo TYPE ty_e_med_text_obj_type VALUE 'DQ',
      otr_text               TYPE ty_e_med_text_obj_type VALUE 'O',
      provider_text          TYPE ty_e_med_text_obj_type VALUE 'P',
    END OF gcs_vocan_text_types .
  constants:
    BEGIN OF gcs_med_on_delete_action,
      cascade TYPE ty_e_med_on_delete_action VALUE 'Cascade', "#EC NOTEXT
      none    TYPE ty_e_med_on_delete_action VALUE 'None',  "#EC NOTEXT
    END OF gcs_med_on_delete_action .
  constants:
    BEGIN OF gcs_crp_usage_type,
      use         TYPE /iwbep/crp_usage VALUE 'U',
      do_not_use  TYPE /iwbep/crp_usage VALUE 'D',
      use_default TYPE /iwbep/crp_usage VALUE '',
    END OF gcs_crp_usage_type .
endinterface.