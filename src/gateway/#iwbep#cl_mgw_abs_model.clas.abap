*----------------------------------------------------------------------*
*       CLASS /IWBEP/CL_MGW_ABS_MODEL  DEFINITIO
*----------------------------------------------------------------------*
*
*----------------------------------------------------------------------*
class /IWBEP/CL_MGW_ABS_MODEL definition
  public
  abstract
  create public .

*"* public components of class /IWBEP/CL_MGW_ABS_MODEL
*"* do not include other source files here!!!
public section.
  type-pools ABAP .
  type-pools SEOP .

  interfaces /IWBEP/IF_MGW_MED_LOAD .

  constants CARDINALITY_ENTITY type /IWBEP/IF_MGW_MED_ODATA_TYPES=>TY_E_MED_CARDINALITY value /IWBEP/IF_MGW_MED_ODATA_TYPES=>GCS_CARDINALITY-CARDINALITY_1_1 ##NO_TEXT.   "EC NO_TEXT
  constants CARDINALITY_ENTITY_0 type /IWBEP/IF_MGW_MED_ODATA_TYPES=>TY_E_MED_CARDINALITY value /IWBEP/IF_MGW_MED_ODATA_TYPES=>GCS_CARDINALITY-CARDINALITY_0_1 ##NO_TEXT.   "EC NO_TEXT
  constants CARDINALITY_FEED type /IWBEP/IF_MGW_MED_ODATA_TYPES=>TY_E_MED_CARDINALITY value /IWBEP/IF_MGW_MED_ODATA_TYPES=>GCS_CARDINALITY-CARDINALITY_0_N ##NO_TEXT.   "EC NO_TEXT
  constants:
    BEGIN OF gcs_fc_target_path,
*      syndication_author_name  TYPE string VALUE 'SyndicationAuthorName', "#EC NOTEXT
*      syndication_author_uri   TYPE string VALUE 'SyndicationAuthorUri', "#EC NOTEXT
*      syndication_author_mail  TYPE string VALUE 'SyndicationAuthorEmail', "#EC NOTEXT
*      syndication_published    TYPE string VALUE 'SyndicationPublished', "#EC NOTEXT
*      syndication_rights       TYPE string VALUE 'SyndicationRights', "#EC NOTEXT
*      syndication_title        TYPE string VALUE 'SyndicationTitle', "#EC NOTEXT
*      syndication_updated      TYPE string VALUE 'SyndicationUpdated', "#EC NOTEXT
*      syndication_cntrbtr_name TYPE string VALUE 'SyndicationContributorName', "#EC NOTEXT
*      syndication_cntrbtr_mail TYPE string VALUE 'SyndicationContributorEmail', "#EC NOTEXT
*      syndication_cntrbtr_uri  TYPE string VALUE 'SyndicationContributorUri', "#EC NOTEXT
*      syndication_source       TYPE string VALUE 'SyndicationSource', "#EC NOTEXT
        media_content_src  TYPE string VALUE 'content/@src', "#EC NOTEXT
        media_content_type TYPE string VALUE 'content/@type', "#EC NOTEXT
      END OF gcs_fc_target_path .
  constants:
    BEGIN OF gcs_sap_semantic,
        bday             TYPE /iwbep/if_mgw_med_odata_types=>ty_e_med_semantic VALUE 'bday',             "  Birth date
        categories       TYPE /iwbep/if_mgw_med_odata_types=>ty_e_med_semantic VALUE 'categories',       " Calendar: comma-separated list of categories for cal. comp.
        city             TYPE /iwbep/if_mgw_med_odata_types=>ty_e_med_semantic VALUE 'city',             " Address: city
        class	           TYPE /iwbep/if_mgw_med_odata_types=>ty_e_med_semantic VALUE 'class',            " Calendar: access classification for a calendar component
        completed        TYPE /iwbep/if_mgw_med_odata_types=>ty_e_med_semantic VALUE 'completed',        "  Calendar: date and time a to-do was actually completed
        contact          TYPE /iwbep/if_mgw_med_odata_types=>ty_e_med_semantic VALUE 'contact',          " Calendar: contact info or reference to contact info
        country          TYPE /iwbep/if_mgw_med_odata_types=>ty_e_med_semantic VALUE 'country',          " Address: country
        currency_code    TYPE /iwbep/if_mgw_med_odata_types=>ty_e_med_semantic VALUE 'currency-code',    " Currency Code
        description      TYPE /iwbep/if_mgw_med_odata_types=>ty_e_med_semantic VALUE 'description',      " Calendar: descr. of a calendar component (summary detailing)
        dtend	           TYPE /iwbep/if_mgw_med_odata_types=>ty_e_med_semantic VALUE 'dtend',            " Calendar: the date and time that a calendar component ends
        dtstart          TYPE /iwbep/if_mgw_med_odata_types=>ty_e_med_semantic VALUE 'dtstart',          "  Calendar: date and time that a calendar component starts
        due	             TYPE /iwbep/if_mgw_med_odata_types=>ty_e_med_semantic VALUE 'due',              " Calendar: date and time a to-do is expected to be completed
        duration         TYPE /iwbep/if_mgw_med_odata_types=>ty_e_med_semantic VALUE 'duration',         " Calendar: duration as an alternative to dtend
        email            TYPE /iwbep/if_mgw_med_odata_types=>ty_e_med_semantic VALUE 'email',            "  Email Address
        familyname       TYPE /iwbep/if_mgw_med_odata_types=>ty_e_med_semantic VALUE 'familyname',       " Last name or family name of a person
        fbtype           TYPE /iwbep/if_mgw_med_odata_types=>ty_e_med_semantic VALUE 'fbtype',           " Calendar: free/busy time type
        geo_lat	         TYPE /iwbep/if_mgw_med_odata_types=>ty_e_med_semantic VALUE 'geo-lat',          " Geolocation: latitude
        geo_lon          TYPE /iwbep/if_mgw_med_odata_types=>ty_e_med_semantic VALUE 'geo-lon',          "  Geolocation: longitude
        givenname	       TYPE /iwbep/if_mgw_med_odata_types=>ty_e_med_semantic VALUE 'givenname',        " First name or given name of a person
        honorific        TYPE /iwbep/if_mgw_med_odata_types=>ty_e_med_semantic VALUE 'honorific',        "  P Title of a person (Ph.D., Dr.,…)
        location         TYPE /iwbep/if_mgw_med_odata_types=>ty_e_med_semantic VALUE 'location',         " Calendar: intended venue for activity defined by cal. comp.
        mail_from        TYPE /iwbep/if_mgw_med_odata_types=>ty_e_med_semantic VALUE 'from',             " Mail: author of message, see [RFC5322, section 3.6.2]
        mail_sender	     TYPE /iwbep/if_mgw_med_odata_types=>ty_e_med_semantic VALUE 'sender',           " Mail: mailbox of agent responsible for actual transmission
        mail_to	         TYPE /iwbep/if_mgw_med_odata_types=>ty_e_med_semantic VALUE 'to',               " Mail: comma-separated list of primary recipients, see [RFC5322, section 3.6.3]
        mail_cc	         TYPE /iwbep/if_mgw_med_odata_types=>ty_e_med_semantic VALUE 'cc',               " Mail: carbon copy, comma-separated
        mail_bcc         TYPE /iwbep/if_mgw_med_odata_types=>ty_e_med_semantic VALUE 'bcc',              " Mail: blind carbon copy, comma-separated
        mail_subject     TYPE /iwbep/if_mgw_med_odata_types=>ty_e_med_semantic VALUE 'subject',          " Mail: topic of the message
        mail_body	       TYPE /iwbep/if_mgw_med_odata_types=>ty_e_med_semantic VALUE 'body',             " Mail: message body
        mail_keywords	   TYPE /iwbep/if_mgw_med_odata_types=>ty_e_med_semantic VALUE 'keywords',         " Mail: comma-separated list of important words and phrases that might be useful for the recipient
        mail_received	   TYPE /iwbep/if_mgw_med_odata_types=>ty_e_med_semantic VALUE 'received',         " Mail: DateTime the message was received
        middlename       TYPE /iwbep/if_mgw_med_odata_types=>ty_e_med_semantic VALUE 'middlename',       " Middle name of a person
        name             TYPE /iwbep/if_mgw_med_odata_types=>ty_e_med_semantic VALUE 'name',             " Formatted text of the full name
        nickname         TYPE /iwbep/if_mgw_med_odata_types=>ty_e_med_semantic VALUE 'nickname',         " Descriptive name given instead of/in addition to "name"
        note             TYPE /iwbep/if_mgw_med_odata_types=>ty_e_med_semantic VALUE 'note',             " Supplemental information or comment associated with vCard
        org              TYPE /iwbep/if_mgw_med_odata_types=>ty_e_med_semantic VALUE 'org',              "  Organization name
        org_role         TYPE /iwbep/if_mgw_med_odata_types=>ty_e_med_semantic VALUE 'org-role',         " Organizational role
        org_unit         TYPE /iwbep/if_mgw_med_odata_types=>ty_e_med_semantic VALUE 'org-unit',         " Organizational unit
        percent_complete TYPE /iwbep/if_mgw_med_odata_types=>ty_e_med_semantic VALUE 'percent-complete', "  Calendar: percent completion of to-do, from 0 to 100
        photo            TYPE /iwbep/if_mgw_med_odata_types=>ty_e_med_semantic VALUE 'photo',            " URI of a photo of a person
        pobox            TYPE /iwbep/if_mgw_med_odata_types=>ty_e_med_semantic VALUE 'pobox',            "  Address: postal office box
        priority         TYPE /iwbep/if_mgw_med_odata_types=>ty_e_med_semantic VALUE 'priority',         " Calendar: relative prio (1 highest, 9 lowest, 0 undefined)
        region           TYPE /iwbep/if_mgw_med_odata_types=>ty_e_med_semantic VALUE 'region',           " Address: state or province
        status           TYPE /iwbep/if_mgw_med_odata_types=>ty_e_med_semantic VALUE 'status',           " Calendar: overall status or confirmation for the cal. comp.
        street           TYPE /iwbep/if_mgw_med_odata_types=>ty_e_med_semantic VALUE 'street',           " Address: street
        suffix           TYPE /iwbep/if_mgw_med_odata_types=>ty_e_med_semantic VALUE 'suffix',           " Suffix
        summary	         TYPE /iwbep/if_mgw_med_odata_types=>ty_e_med_semantic VALUE 'summary',          " Calendar: summary of a calendar component
        szip             TYPE /iwbep/if_mgw_med_odata_types=>ty_e_med_semantic VALUE 'zip',              " Address: postal/ZIP code
        tel              TYPE /iwbep/if_mgw_med_odata_types=>ty_e_med_semantic VALUE 'tel',              "  Telephone Number
        tel_cell         TYPE /iwbep/if_mgw_med_odata_types=>ty_e_med_semantic VALUE 'tel;type=cell',
        tel_cell_pref    TYPE /iwbep/if_mgw_med_odata_types=>ty_e_med_semantic VALUE 'tel;type=cell.pref',
        tel_work         TYPE /iwbep/if_mgw_med_odata_types=>ty_e_med_semantic VALUE 'tel;type=work',
        title            TYPE /iwbep/if_mgw_med_odata_types=>ty_e_med_semantic VALUE 'title',            "  P Job title
        transp           TYPE /iwbep/if_mgw_med_odata_types=>ty_e_med_semantic VALUE 'transp',           " Calendar: event is transparent to busy time searches
        unit_of_measure  TYPE /iwbep/if_mgw_med_odata_types=>ty_e_med_semantic VALUE 'unit-of-measure',  " Unit of Measure
        url              TYPE /iwbep/if_mgw_med_odata_types=>ty_e_med_semantic VALUE 'url',              "  Web URI
        vcard            TYPE /iwbep/if_mgw_med_odata_types=>ty_e_med_semantic VALUE 'vcard',            " Node: Contains contact information following the vCard standard
        vevent           TYPE /iwbep/if_mgw_med_odata_types=>ty_e_med_semantic VALUE 'vevent',           " Node: Contains event information following the iCalendar standard
        vtodo            TYPE /iwbep/if_mgw_med_odata_types=>ty_e_med_semantic VALUE 'vtodo',            " Node: Contains task information following the iCalendar standard
        wholeday         TYPE /iwbep/if_mgw_med_odata_types=>ty_e_med_semantic VALUE 'wholeday',         " “true” or “false”: Calendar event scheduled for whole day
      END OF gcs_sap_semantic .
  constants:
    BEGIN OF gcs_sap_text_object_types,
        text_symbol_class TYPE /iwbep/if_mgw_med_odata_types=>ty_e_med_text_obj_type VALUE 'BP',
      END   OF gcs_sap_text_object_types .
  constants GC_DEFAULT_SCHEMA_VERSION type /IWBEP/MED_SRV_SCHEMA_VERSION value '1' ##NO_TEXT.   "EC NO_TEXT
  data MODEL type ref to /IWBEP/IF_MGW_ODATA_MODEL .
  data VOCAB_ANNO_MODEL type ref to /IWBEP/IF_MGW_VOCAN_MODEL .

  methods DEFINE
  abstract
    raising
      /IWBEP/CX_MGW_MED_EXCEPTION .
  methods GET_LAST_MODIFIED
    returning
      value(RV_LAST_MODIFIED) type TIMESTAMP .
  methods GET_VOCAN_PROVIDER_TEXTS
    importing
      !IV_LANGUAGE type SY-LANGU
      !IT_VOCAN_TEXT_KEYS type /IWBEP/IF_MGW_MED_ODATA_TYPES=>TY_T_MED_VOCAN_TEXTS
    changing
      !CT_VOCAN_TEXTS_OBJ type /IWBEP/IF_MGW_MED_ODATA_TYPES=>TY_T_MED_OBJ_VOCAN_TEXTS
    raising
      /IWBEP/CX_MGW_MED_EXCEPTION .
  methods GET_VOCAN_TEXTS
    importing
      !IV_LANGUAGE type SY-LANGU
      !IT_VOCAN_TEXT_KEYS type /IWBEP/IF_MGW_MED_ODATA_TYPES=>TY_T_MED_VOCAN_TEXTS
    changing
      !CT_VOCAN_TEXTS_OBJ type /IWBEP/IF_MGW_MED_ODATA_TYPES=>TY_T_MED_OBJ_VOCAN_TEXTS
    raising
      /IWBEP/CX_MGW_MED_EXCEPTION .
protected section.

  methods GET_MODEL_VERSION
    returning
      value(RV_VERSION) type /IWBEP/MED_MDL_VERSION .
  methods GET_MODEL_NAME
    returning
      value(RV_MDL_NAME) type /IWBEP/MED_MDL_TECHNICAL_NAME .
  methods GET_MP_FACADE
    returning
      value(RO_MP_FACADE) type ref to /IWBEP/IF_MGW_MP_FACADE
    raising
      /IWBEP/CX_MGW_TECH_EXCEPTION .
*"* private components of class /IWBEP/CL_MGW_ABS_MODEL
*"* do not include other source files here!!!
  PRIVATE SECTION.

    CONSTANTS:
      BEGIN OF gcs_methods,
        get_vocan_provider_texts TYPE string VALUE 'GET_VOCAN_PROVIDER_TEXTS',
      END OF gcs_methods .
    DATA mo_facade TYPE REF TO /iwbep/cl_mgw_mp_facade .
    DATA mo_model TYPE REF TO /iwbep/cl_mgw_odata_model .
    DATA mo_vocan_model TYPE REF TO /iwbep/cl_mgw_vocan_model .
    DATA ms_default_system_alias_info TYPE /iwbep/s_defi_alias_info .
    DATA mv_last_modified TYPE timestamp .
    DATA mv_mdl_name TYPE /iwbep/med_mdl_technical_name .
    DATA mv_mdl_version TYPE /iwbep/med_mdl_version .
    DATA mv_service_tech_name TYPE /iwbep/med_grp_technical_name .
    DATA mv_service_version TYPE /iwbep/med_grp_version .
    DATA mv_vocan_tech_name TYPE /iwbep/med_va_file_tech_name .
    DATA mv_vocan_version TYPE /iwbep/med_va_file_version .

    METHODS set_service_release_status
      IMPORTING
        !iv_service_identifier TYPE /iwbep/med_mdl_technical_name .
    METHODS get_source_info_class
      RETURNING
        VALUE(rv_source_info_class) TYPE /iwbep/med_definition_class .
    METHODS set_application_component_id .
    METHODS set_ral_relevance .
    METHODS prepare_vl_search_info.
ENDCLASS.



CLASS /IWBEP/CL_MGW_ABS_MODEL IMPLEMENTATION.


  METHOD /iwbep/if_mgw_med_load~get_last_modified.

    mv_mdl_name    = iv_technical_name.
    mv_mdl_version = iv_version.

    IF mv_last_modified IS INITIAL.
      mv_last_modified = get_last_modified( ).
    ENDIF.

    IF mv_last_modified GT cv_last_modified.
      cv_last_modified = mv_last_modified.
    ENDIF.

  ENDMETHOD.


  METHOD /iwbep/if_mgw_med_load~get_vocan_texts.

    get_vocan_texts(
      EXPORTING
        iv_language                 = iv_language         " ABAP System Field: Language Key of Text Environment
        it_vocan_text_keys          = it_vocan_text_keys  " Vocabulary Annotation Text Keys
      CHANGING
        ct_vocan_texts_obj          = ct_vocan_texts_obj  " Vocabulary Annotation translatable texts
    ).

  ENDMETHOD.


  METHOD /iwbep/if_mgw_med_load~initialize.

    ms_default_system_alias_info = is_default_system_alias_info.
    mv_service_tech_name         = iv_service_technical_name.
    mv_service_version           = iv_service_version.
    mv_vocan_tech_name           = iv_vocan_technical_name.
    mv_vocan_version             = iv_vocan_version.

  ENDMETHOD.


  METHOD /iwbep/if_mgw_med_load~load_meta_data.

    DATA: ls_msg_hdl TYPE balmsghndl,
          lo_logger  TYPE REF TO /iwbep/cl_cos_logger.
    DATA: lv_source_info_class  TYPE /iwbep/med_definition_class.
    DATA: ls_vocan_model        TYPE /iwbep/if_mgw_med_odata_types=>ty_s_vocan_model.


    lo_logger = /iwbep/cl_cos_logger=>get_logger( ).
    ls_msg_hdl = lo_logger->log_step_init(
      iv_agent            = /iwbep/cl_mgw_odata_model=>gc_agent
      iv_msg_number       = 108
      iv_msg_id           = /iwbep/cl_mgw_odata_model=>gc_msg_class
      iv_msg_v1           = iv_technical_name
      iv_msg_v2           = iv_version
    ).

    CREATE OBJECT mo_model
      EXPORTING
        is_msg_handle                = ls_msg_hdl
        iv_service_version           = mv_service_version
        iv_service_technical_name    = mv_service_tech_name
        is_default_system_alias_info = ms_default_system_alias_info
        iv_model_version             = iv_version
        iv_model_technical_name      = iv_technical_name.

    model = mo_model.
    mv_mdl_version = iv_version.
    mv_mdl_name    = iv_technical_name.

* Begin Vocabulary Annotations
    CREATE OBJECT mo_vocan_model
      EXPORTING
        is_msg_handle = ls_msg_hdl.
    vocab_anno_model = mo_vocan_model.
    mo_model->set_vocan_model( io_vocan_model = mo_vocan_model ).

* Begin Vocabulary Annotations


* first check if structures already contain something then take it over
    mo_model->ms_header = cs_header.
    mo_model->mt_entities = ct_nodes.
    mo_model->mt_references = ct_references.
    mo_model->mt_operations = ct_operations.
    mo_model->mt_text_keys = ct_text_keys.
    mo_model->mt_documentation = ct_documentation.
    mo_model->mt_tags          = ct_tags.
    mo_model->mt_private_annotations = ct_private_annotations.
    mo_model->mt_public_annotations = ct_public_annotations.
    mo_model->mt_mapping = ct_mapping.
    mo_model->mt_mdl_usage = ct_model_usages.
    mo_model->mt_model_usage = ct_model_usage.

* set the default service schema version
    mo_model->/iwbep/if_mgw_odata_model~set_service_schema_version( iv_service_schema_version = gc_default_schema_version ).

    me->/iwbep/if_mgw_med_load~get_last_modified(
                                      EXPORTING
                                        iv_technical_name = iv_technical_name
                                        iv_version        = iv_version
                                      CHANGING
                                        cv_last_modified = mo_model->ms_header-changed_timestmp ).

    define( ).
    mo_model->check( ).
    mo_vocan_model->check( ).
    mo_model->/iwbep/if_mgw_odata_fw_model~finalize( ).

    prepare_vl_search_info( ).

    CONCATENATE iv_technical_name iv_version INTO mo_model->ms_header-ext_model_tname SEPARATED BY '_'.

    lv_source_info_class = get_source_info_class( ).
    IF ( NOT lv_source_info_class IS INITIAL ).
      IF ( NOT mo_model->ms_header-source_info_class IS INITIAL ).
*     Only one model provider class is allowed to implement interface /IWBEP/IF_MGW_MED_SOURCE_INFO. That needs to be unique
        ASSERT lv_source_info_class = mo_model->ms_header-source_info_class.
      ELSE.
        mo_model->ms_header-source_info_class = lv_source_info_class.
      ENDIF.
    ENDIF.

    " Set Application Component ID to Model Header
    set_application_component_id( ).
    " Set relevance for read access logging (includes use_batch)
    set_ral_relevance( ).

*   set the cloud release status of the service
    set_service_release_status( iv_service_identifier = iv_technical_name ).

    CLEAR ls_vocan_model.
    cs_header = mo_model->ms_header.
    ct_nodes                = mo_model->mt_entities.
    ct_references           = mo_model->mt_references.
    ct_operations           = mo_model->mt_operations.
    ct_text_keys            = mo_model->mt_text_keys.
    ct_documentation        = mo_model->mt_documentation.
    ct_tags                 = mo_model->mt_tags.
    ct_private_annotations  = mo_model->mt_private_annotations.
    ct_public_annotations   = mo_model->mt_public_annotations.
    ct_mapping              = mo_model->mt_mapping.
    ct_model_usages         = mo_model->mt_mdl_usage.
    ct_model_usage          = mo_model->mt_model_usage.

    mo_vocan_model->get_model_data( IMPORTING es_model_data = ls_vocan_model ).

* the vocan model can be part of the mo_vocan_model object or part of the mo_model (in case of service extension)
* hence both objects need to provide their data to the changing parameter cs_vocan_model
    IF ls_vocan_model-header IS NOT INITIAL AND mo_model->ms_vocan_model-header IS INITIAL.
      MOVE-CORRESPONDING ls_vocan_model-header TO mo_model->ms_vocan_model-header.
    ENDIF.
    IF ls_vocan_model-header IS INITIAL AND mo_model->ms_vocan_model-header IS NOT INITIAL.
      MOVE-CORRESPONDING mo_model->ms_vocan_model-header TO ls_vocan_model-header .
    ENDIF.
    IF ls_vocan_model-header IS NOT INITIAL AND mo_model->ms_vocan_model-header IS NOT INITIAL.
      MOVE-CORRESPONDING ls_vocan_model-header TO mo_model->ms_vocan_model-header.
    ENDIF.
* append the vocan model from the service extension to the model object of the extending service
    INSERT LINES OF ls_vocan_model-referenced_anno_files INTO TABLE    mo_model->ms_vocan_model-referenced_anno_files.
    INSERT LINES OF ls_vocan_model-vocab_references      INTO TABLE    mo_model->ms_vocan_model-vocab_references.
    INSERT LINES OF ls_vocan_model-annofile_references   INTO TABLE    mo_model->ms_vocan_model-annofile_references.
    INSERT LINES OF ls_vocan_model-referenced_services   INTO TABLE    mo_model->ms_vocan_model-referenced_services.
    INSERT LINES OF ls_vocan_model-annotation_targets    INTO TABLE    mo_model->ms_vocan_model-annotation_targets .
    INSERT LINES OF ls_vocan_model-terms                 INTO TABLE    mo_model->ms_vocan_model-terms .
    INSERT LINES OF ls_vocan_model-annotations           INTO TABLE    mo_model->ms_vocan_model-annotations .
    INSERT LINES OF ls_vocan_model-collections           INTO TABLE    mo_model->ms_vocan_model-collections .
    INSERT LINES OF ls_vocan_model-records               INTO TABLE    mo_model->ms_vocan_model-records .
    INSERT LINES OF ls_vocan_model-properties            INTO TABLE    mo_model->ms_vocan_model-properties .
    INSERT LINES OF ls_vocan_model-simple_values         INTO TABLE    mo_model->ms_vocan_model-simple_values .
    INSERT LINES OF ls_vocan_model-functions             INTO TABLE    mo_model->ms_vocan_model-functions .
    INSERT LINES OF ls_vocan_model-function_params       INTO TABLE    mo_model->ms_vocan_model-function_params.
    INSERT LINES OF ls_vocan_model-con_expressions       INTO TABLE    mo_model->ms_vocan_model-con_expressions .
    INSERT LINES OF ls_vocan_model-con_expression_params INTO TABLE    mo_model->ms_vocan_model-con_expression_params.
    INSERT LINES OF ls_vocan_model-urls                  INTO TABLE    mo_model->ms_vocan_model-urls .
    INSERT LINES OF ls_vocan_model-labeled_elements      INTO TABLE    mo_model->ms_vocan_model-labeled_elements  .
    INSERT LINES OF ls_vocan_model-vocan_text_keys       INTO TABLE    mo_model->ms_vocan_model-vocan_text_keys  .

* append the vocan model to the return structure
    IF mo_model->ms_vocan_model-header-has_vocan_texts EQ abap_true.
      cs_vocan_model-header-has_vocan_texts = abap_true.
    ENDIF.
    INSERT LINES OF  mo_model->ms_vocan_model-referenced_anno_files INTO TABLE  cs_vocan_model-referenced_anno_files.
    INSERT LINES OF  mo_model->ms_vocan_model-vocab_references      INTO TABLE  cs_vocan_model-vocab_references.
    INSERT LINES OF  mo_model->ms_vocan_model-annofile_references   INTO TABLE  cs_vocan_model-annofile_references.
    INSERT LINES OF  mo_model->ms_vocan_model-referenced_services   INTO TABLE  cs_vocan_model-referenced_services.
    INSERT LINES OF  mo_model->ms_vocan_model-annotation_targets    INTO TABLE  cs_vocan_model-annotation_targets .
    INSERT LINES OF  mo_model->ms_vocan_model-terms                 INTO TABLE  cs_vocan_model-terms .
    INSERT LINES OF  mo_model->ms_vocan_model-annotations           INTO TABLE  cs_vocan_model-annotations .
    INSERT LINES OF  mo_model->ms_vocan_model-collections           INTO TABLE  cs_vocan_model-collections .
    INSERT LINES OF  mo_model->ms_vocan_model-records               INTO TABLE  cs_vocan_model-records .
    INSERT LINES OF  mo_model->ms_vocan_model-properties            INTO TABLE  cs_vocan_model-properties .
    INSERT LINES OF  mo_model->ms_vocan_model-simple_values         INTO TABLE  cs_vocan_model-simple_values .
    INSERT LINES OF  mo_model->ms_vocan_model-functions             INTO TABLE  cs_vocan_model-functions .
    INSERT LINES OF  mo_model->ms_vocan_model-function_params       INTO TABLE  cs_vocan_model-function_params.
    INSERT LINES OF  mo_model->ms_vocan_model-con_expressions       INTO TABLE  cs_vocan_model-con_expressions.
    INSERT LINES OF  mo_model->ms_vocan_model-con_expression_params INTO TABLE  cs_vocan_model-con_expression_params.
    INSERT LINES OF  mo_model->ms_vocan_model-urls                  INTO TABLE  cs_vocan_model-urls .
    INSERT LINES OF  mo_model->ms_vocan_model-labeled_elements      INTO TABLE  cs_vocan_model-labeled_elements  .
    INSERT LINES OF  mo_model->ms_vocan_model-vocan_text_keys       INTO TABLE  cs_vocan_model-vocan_text_keys  .



    lo_logger->log_step_completion(
      iv_agent            = /iwbep/cl_mgw_odata_model=>gc_agent
      iv_msg_handle       = ls_msg_hdl
      iv_msg_type         = /iwbep/cl_cos_logger=>success
      iv_msg_number       = 109
      iv_msg_id           = /iwbep/cl_mgw_odata_model=>gc_msg_class
    ).

  ENDMETHOD.


  METHOD get_last_modified.

    DATA: lo_type_descr   TYPE REF TO cl_abap_typedescr.
    DATA: lv_type_name    TYPE abap_abstypename.
    DATA: lv_class_name   TYPE seoclsname.
    DATA: lv_timezone     TYPE tzonref-tzone.
    DATA: lv_include_name TYPE program.
    DATA: lv_sdate        TYPE rdir_sdate.
    DATA: lv_2_days_back  TYPE rdir_sdate.
    DATA: lv_stime        TYPE rdir_stime.
    DATA: lt_head         TYPE TABLE OF rhead.
    DATA: ls_head         TYPE rhead.
    DATA: lv_load_version_stamp TYPE timestamp.



*   Get time zone for timestamp
    CALL FUNCTION 'GET_SYSTEM_TIMEZONE'
      IMPORTING
        timezone = lv_timezone
      EXCEPTIONS
        OTHERS   = 0.           " initial lv_timezone means UTC in CONVERT ...


*   Get MPC name via type descriptor and type name
    lo_type_descr   = cl_abap_typedescr=>describe_by_object_ref( p_object_ref = me ).
    lv_type_name    = lo_type_descr->get_relative_name( ).
    lv_class_name   = lv_type_name.
    lv_include_name =  cl_oo_classname_service=>get_classpool_name( clsname = lv_class_name ). "Is enough for last_modified


    LOAD REPORT lv_include_name PART 'HEAD' INTO lt_head.
    IF sy-subrc = 0.
      "Got current load from program buffer
      READ TABLE lt_head INDEX 1 INTO ls_head.

      IF ( sy-subrc = 0 ).
        lv_load_version_stamp = ls_head-timest.
        CONVERT TIME STAMP lv_load_version_stamp
          TIME ZONE 'UTC   '
          INTO DATE lv_sdate
               TIME lv_stime.

*      The ABAP runtime load version timestamp is up to 120(?) seconds older than the actual change time stamp.
*      So if the MPC has been changed recently we assume it is currently under development.
*      In that case we use the most up to date version from table reposrc. Otherwise we use the runtime load
*      timestamp because it is faster.
        lv_2_days_back = sy-datum - 2.
        IF ( lv_sdate < lv_2_days_back ).
          CONVERT DATE lv_sdate TIME lv_stime
            INTO TIME STAMP rv_last_modified
            TIME ZONE lv_timezone.
        ENDIF.
      ENDIF.
    ENDIF.


    IF ( rv_last_modified IS INITIAL ).
      SELECT SINGLE sdate stime
        FROM reposrc
        INTO (lv_sdate, lv_stime)
        WHERE progname = lv_include_name
          AND r3state  = 'A'.

      CONVERT DATE lv_sdate TIME lv_stime
        INTO TIME STAMP rv_last_modified
        TIME ZONE lv_timezone.
    ENDIF.

  ENDMETHOD.


  METHOD get_model_name.
    rv_mdl_name = mv_mdl_name.
  ENDMETHOD.


  METHOD get_model_version.
    rv_version = mv_mdl_version.
  ENDMETHOD.


  METHOD get_mp_facade.

*  DATA: lo_logger   TYPE REF TO /iwbep/cl_cos_logger.
*  DATA: lx_mgw_tech TYPE REF TO /iwbep/cx_mgw_tech_exception.




    IF mo_facade IS NOT BOUND.

*    IF ( mv_service_tech_name IS INITIAL ) AND ( ms_default_system_alias_info IS INITIAL ).
*      "Check the call stack - The service ID or routing information is needed
*      CREATE OBJECT lx_mgw_tech
*        EXPORTING
*          textid = /iwbep/cx_mgw_tech_exception=>routing_information_missing.
*      lo_logger = /iwbep/cl_cos_logger=>get_logger( ).
*      lo_logger->log_step_completion_exception(
*        iv_agent        = /iwbep/cl_mgw_odata_model=>gc_agent
*        io_exception    = lx_mgw_tech
*      ).
*      RAISE EXCEPTION lx_mgw_tech.
*    ELSE.

      CREATE OBJECT mo_facade
        EXPORTING
          is_system_alias_info      = ms_default_system_alias_info
          iv_service_technical_name = mv_service_tech_name
          iv_service_version        = mv_service_version
          iv_vocan_technical_name   = mv_vocan_tech_name
          iv_vocan_version          = mv_vocan_version.

*    ENDIF.
    ENDIF.

    ro_mp_facade = mo_facade.

  ENDMETHOD.


  METHOD get_source_info_class.

    CONSTANTS: lc_source_info_interface TYPE /iwbep/med_definition_class VALUE '/IWBEP/IF_MGW_MED_SOURCE_INFO'.

    DATA: lo_descriptor TYPE REF TO cl_abap_classdescr.



* Get type descriptor based on self reference ME and cast it to class descriptor
    lo_descriptor ?= cl_abap_typedescr=>describe_by_object_ref( me ).

* Check if ME implements interface
    lo_descriptor->get_interface_type(
        EXPORTING
          p_name              = lc_source_info_interface
        EXCEPTIONS
          interface_not_found = 1
          OTHERS              = 2
             ).

* Return class name if the interface is implemented
    IF ( sy-subrc = 0 ). "ME implements the interface
      rv_source_info_class = lo_descriptor->get_relative_name( ).
    ELSE.
      CLEAR rv_source_info_class.
    ENDIF.

  ENDMETHOD.


  METHOD get_vocan_provider_texts.

    RAISE EXCEPTION TYPE /iwbep/cx_mgw_med_exception
      EXPORTING
        textid = /iwbep/cx_mgw_med_exception=>method_not_implemented_mod
        method = gcs_methods-get_vocan_provider_texts.

  ENDMETHOD.


  METHOD get_vocan_texts.

    DATA:
      lt_vocan_text_keys      TYPE /iwbep/if_mgw_med_odata_types=>ty_t_med_vocan_texts,
      lv_prev_txt_obj_type    TYPE /iwbep/if_mgw_med_odata_types=>ty_e_med_text_obj_type,
      lv_prev_txt_obj_id      TYPE string,
      ls_prev_vocan_text_obj  TYPE /iwbep/if_mgw_med_odata_types=>ty_s_med_obj_vocan_text,
      lv_program              TYPE rs38m-programm,
      lv_prev_program	        TYPE rs38m-programm,
      lt_vocan_text_keys_prov TYPE /iwbep/if_mgw_med_odata_types=>ty_t_med_vocan_texts,
      lt_vocan_text_keys_otr  TYPE /iwbep/if_mgw_med_odata_types=>ty_t_med_vocan_texts,
      lt_texts_pool           TYPE STANDARD TABLE OF textpool,
      ls_data_element_info    TYPE dfies,
      ls_vocan_text_obj       TYPE /iwbep/if_mgw_med_odata_types=>ty_s_med_obj_vocan_text,
      ls_vocan_text           TYPE /iwbep/if_mgw_med_odata_types=>ty_s_med_vocan_text.

    lt_vocan_text_keys = it_vocan_text_keys.
    SORT lt_vocan_text_keys BY txt_object_id.

    LOOP AT lt_vocan_text_keys INTO ls_vocan_text.
      CLEAR ls_vocan_text_obj.

      "Provider text type
      IF ls_vocan_text-txt_object_type EQ /iwbep/if_mgw_med_odata_types=>gcs_vocan_text_types-provider_text.
        "Clear the previous text type and text id - Performance improvement not possible here
        CLEAR: lv_prev_txt_obj_type, lv_prev_txt_obj_id.
        APPEND ls_vocan_text TO lt_vocan_text_keys_prov.

        "OTR text type
      ELSEIF ls_vocan_text-txt_object_type EQ /iwbep/if_mgw_med_odata_types=>gcs_vocan_text_types-otr_text.
        "Clear the previous text type and text id - Performance improvement not possible here
        CLEAR: lv_prev_txt_obj_type, lv_prev_txt_obj_id.
        APPEND ls_vocan_text TO lt_vocan_text_keys_otr.

        "Text Element and Data Element Text Types
      ELSEIF ls_vocan_text-txt_object_type EQ /iwbep/if_mgw_med_odata_types=>gcs_vocan_text_types-text_element OR
         ls_vocan_text-txt_object_type EQ /iwbep/if_mgw_med_odata_types=>gcs_vocan_text_types-data_element OR
         ls_vocan_text-txt_object_type EQ /iwbep/if_mgw_med_odata_types=>gcs_vocan_text_types-data_element_short OR
         ls_vocan_text-txt_object_type EQ /iwbep/if_mgw_med_odata_types=>gcs_vocan_text_types-data_element_medium OR
         ls_vocan_text-txt_object_type EQ /iwbep/if_mgw_med_odata_types=>gcs_vocan_text_types-data_element_long OR
         ls_vocan_text-txt_object_type EQ /iwbep/if_mgw_med_odata_types=>gcs_vocan_text_types-data_element_quickinfo OR
         ls_vocan_text-txt_object_type EQ /iwbep/if_mgw_med_odata_types=>gcs_vocan_text_types-data_element_heading.

        "Performance improvement: get previous data if possible
        IF ls_vocan_text-txt_object_id EQ lv_prev_txt_obj_id AND
           ls_vocan_text-txt_object_type EQ lv_prev_txt_obj_type.
          ls_vocan_text_obj-text = ls_prev_vocan_text_obj-text.

          "Text Element Text Type
        ELSEIF ls_vocan_text-txt_object_type EQ /iwbep/if_mgw_med_odata_types=>gcs_vocan_text_types-text_element.
          /iwbep/cl_mgw_med_model_util=>get_program_from_text_id(
                               EXPORTING
                                   iv_txt_object_id = ls_vocan_text-txt_object_id
                               IMPORTING
                                   ev_program = lv_program ).

          "Performance improvement: text symbol is different but text pool the same so no additional read of text elements required
          IF lv_program NE lv_prev_program.
            CLEAR lt_texts_pool.
          ENDIF.

          /iwbep/cl_mgw_med_model_util=>get_text_from_text_element(
                                EXPORTING
                                    iv_txt_object_id = ls_vocan_text-txt_object_id
                                    iv_language = iv_language
                                    iv_program = lv_program
                                IMPORTING
                                    ev_text = ls_vocan_text_obj-text
                                CHANGING
                                    ct_texts_pool = lt_texts_pool ).

          lv_prev_program = lv_program.

          "Data Element Text Types
        ELSE.

          "Performance improvement - txt_object_id is same but text type differs (but text type is still based on DDIC)
          IF ls_vocan_text-txt_object_id NE lv_prev_txt_obj_id.
            /iwbep/cl_mgw_med_model_util=>get_text_from_ddic(
                                    EXPORTING
                                        iv_txt_object_id = ls_vocan_text-txt_object_id
                                        iv_language = iv_language
                                    IMPORTING
                                        es_dfies = ls_data_element_info ).
          ENDIF.

          CASE ls_vocan_text-txt_object_type.
            WHEN /iwbep/if_mgw_med_odata_types=>gcs_vocan_text_types-data_element.
              IF ls_data_element_info-scrtext_l IS NOT INITIAL AND
                 ls_data_element_info-scrlen3 <= 20.
                ls_vocan_text_obj-text = ls_data_element_info-scrtext_l.
              ELSEIF ls_data_element_info-scrtext_m IS NOT INITIAL.
                ls_vocan_text_obj-text = ls_data_element_info-scrtext_m.
              ELSEIF ls_data_element_info-scrtext_s IS NOT INITIAL.
                ls_vocan_text_obj-text = ls_data_element_info-scrtext_s.
              ELSEIF ls_data_element_info-scrtext_l IS NOT INITIAL.
                ls_vocan_text_obj-text = ls_data_element_info-scrtext_l.
              ELSEIF ls_data_element_info-fieldtext IS NOT INITIAL.
                ls_vocan_text_obj-text = ls_data_element_info-fieldtext.
              ENDIF.
            WHEN /iwbep/if_mgw_med_odata_types=>gcs_vocan_text_types-data_element_short.
              ls_vocan_text_obj-text =  ls_data_element_info-scrtext_s.
            WHEN /iwbep/if_mgw_med_odata_types=>gcs_vocan_text_types-data_element_medium.
              ls_vocan_text_obj-text =  ls_data_element_info-scrtext_m.
            WHEN /iwbep/if_mgw_med_odata_types=>gcs_vocan_text_types-data_element_long.
              ls_vocan_text_obj-text = ls_data_element_info-scrtext_l.
            WHEN /iwbep/if_mgw_med_odata_types=>gcs_vocan_text_types-data_element_heading.
              ls_vocan_text_obj-text = ls_data_element_info-reptext.
            WHEN /iwbep/if_mgw_med_odata_types=>gcs_vocan_text_types-data_element_quickinfo.
              ls_vocan_text_obj-text = ls_data_element_info-fieldtext.
          ENDCASE.

        ENDIF.

        ls_vocan_text_obj-entity_id = ls_vocan_text-entity_id_ref.
        INSERT ls_vocan_text_obj INTO TABLE ct_vocan_texts_obj.

        "Performance improvement: save previous data
        ls_prev_vocan_text_obj = ls_vocan_text_obj.
        lv_prev_txt_obj_type = ls_vocan_text-txt_object_type.
        lv_prev_txt_obj_id = ls_vocan_text-txt_object_id.

        "Other text types are not supported
      ELSE.
        ASSERT 1 = 0.

      ENDIF.
    ENDLOOP.

    "Get OTR texts
    IF lt_vocan_text_keys_otr IS NOT INITIAL.
      /iwbep/cl_mgw_med_model_util=>get_texts_from_otr( EXPORTING
                                                         iv_language = iv_language
                                                         it_vocan_text_keys = lt_vocan_text_keys_otr
                                                        CHANGING
                                                         ct_vocan_texts_obj = ct_vocan_texts_obj ).
    ENDIF.

    "Only call the provider method if texts of type "provider" exists
    IF lt_vocan_text_keys_prov IS NOT INITIAL.
      get_vocan_provider_texts( EXPORTING
                                  iv_language = iv_language
                                  it_vocan_text_keys = lt_vocan_text_keys_prov
                                CHANGING
                                  ct_vocan_texts_obj = ct_vocan_texts_obj ).
    ENDIF.

  ENDMETHOD.


  METHOD prepare_vl_search_info.
    DATA: ls_vocan_model TYPE /iwbep/if_mgw_med_odata_types=>ty_s_vocan_model,
          ls_anno        LIKE LINE OF ls_vocan_model-annotations,
          ls_ann_target  LIKE LINE OF ls_vocan_model-annotation_targets,
          lv_found       TYPE abap_bool,
          lo_entity      TYPE REF TO /iwbep/if_mgw_odata_fw_etype.

    mo_vocan_model->get_model_data( IMPORTING es_model_data = ls_vocan_model ).

    LOOP AT ls_vocan_model-annotations INTO ls_anno WHERE is_value_list = abap_true.

      lv_found = abap_false.
      LOOP AT ls_vocan_model-annotation_targets INTO ls_ann_target.

        READ TABLE ls_ann_target-annotation_ids TRANSPORTING NO FIELDS WITH KEY annotation_id = ls_anno-entity_id.
        IF sy-subrc <> 0.
          CONTINUE.
        ELSE.
          lv_found = abap_true.
          EXIT.
        ENDIF.
      ENDLOOP.

      IF lv_found = abap_true.
        TRY.
            lo_entity = mo_model->get_entity_type( iv_name = ls_anno-value_list_entity_name ).
            lo_entity->add_annotation_target_for_vl( iv_target = ls_ann_target-target ).
          CATCH /iwbep/cx_mgw_med_exception.
            "handle exception
        ENDTRY.

      ENDIF.

    ENDLOOP.

  ENDMETHOD.


  METHOD set_application_component_id.

    DATA lv_type_name  TYPE abap_abstypename.
    DATA lv_class_name TYPE seoclname.
    DATA lv_package    TYPE devclass.
    DATA lv_appl_comp  TYPE uffctr.


    " Get MPC Class Name
    lv_type_name = cl_abap_classdescr=>get_class_name( me ).
    SHIFT lv_type_name BY 7 PLACES.
    lv_class_name = lv_type_name.

    " Get Package
    SELECT SINGLE devclass FROM tadir
      INTO lv_package
      WHERE pgmid    = 'R3TR'
        AND object   = 'CLAS'
        AND obj_name = lv_class_name.

    IF lv_package IS NOT INITIAL.

      " Get Application Component
      SELECT SINGLE component FROM tdevc
        INTO lv_appl_comp
        WHERE devclass = lv_package.
      IF lv_appl_comp IS NOT INITIAL.

        " Get and save Application Component ID
        SELECT SINGLE ps_posid FROM df14l
          INTO mo_model->ms_header-appl_comp_id
          WHERE fctr_id  = lv_appl_comp
            AND as4local = 'A'.
      ENDIF.
    ENDIF.

  ENDMETHOD.


  METHOD set_ral_relevance.

    DATA lo_ral_rt_facade    TYPE REF TO /iwbep/if_ral_rt_facade_v2.
    DATA ls_ral_service_key  TYPE /iwbep/s_ral_service_key.
    DATA lv_ral_has_act_conf TYPE abap_bool.
    DATA lv_last_modified    TYPE timestamp.

    "available if RAL is present (>=7.50) and enabled in client
    lo_ral_rt_facade = /iwbep/cl_mgw_runtime_factory=>get_ral_rt_facade( ).
    IF lo_ral_rt_facade IS BOUND.
      ls_ral_service_key-service_id      = mv_service_tech_name.
      ls_ral_service_key-service_version = mv_service_version.
      ls_ral_service_key-repository      = /iwbep/if_ral_rt_facade_v2=>gc_default_repository.
      ls_ral_service_key-odata_version   = /iwbep/if_ral_rt_facade_v2=>gc_odata_spec_version_v2.
      lo_ral_rt_facade->has_active_config(
        EXPORTING
          is_service_key       = ls_ral_service_key
        IMPORTING
          ev_has_active_config = lv_ral_has_act_conf
          ev_last_modified     = lv_last_modified ).
      IF lv_ral_has_act_conf EQ abap_true.
        mo_model->ms_header-is_ral_relevant = abap_true.
        mo_model->ms_header-use_batch       = abap_true.
        IF mo_model->ms_header-changed_timestmp < lv_last_modified.
          mo_model->ms_header-changed_timestmp = lv_last_modified.
        ENDIF.
      ELSE.
        mo_model->ms_header-is_ral_relevant = abap_false.
      ENDIF.
    ENDIF.

  ENDMETHOD.


  METHOD set_service_release_status.

    DATA: lv_release_status TYPE string.

    DATA(classification_key) = VALUE pak_object_key( trobjtype = /iwbep/cl_mgw_med_reg_api=>gc_object_type_iwsv
                                                     sobj_name = iv_service_identifier ).
    cl_cls_attr_value_assignment=>get_explicit_classification(
      EXPORTING
        im_object         = classification_key
        im_attribute      = 'RELEASE_STATE'
      IMPORTING
        ex_classification = DATA(classification)  ).

    READ TABLE classification-assignments INDEX 1 ASSIGNING FIELD-SYMBOL(<assignment>).
    IF sy-subrc = 0.
      lv_release_status  = <assignment>-value.
    ENDIF.

    mo_model->ms_header-release_status = lv_release_status.

  ENDMETHOD.
ENDCLASS.