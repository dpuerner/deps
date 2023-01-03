class /SCMB/CL_BASE definition
  public
  abstract
  create public

  global friends /SCMB/CL_MESSAGE_HANDLER
                 /SCMB/CL_TOOLBAR .

*"* public components of class /SCMB/CL_BASE
*"* do not include other source files here!!!
public section.
  type-pools ABAP .
  type-pools CNDP .
  type-pools SZADR .

  interfaces /SCMB/IF_AH_ASPECT .
  interfaces /SCMB/IF_MH_ASPECT .

  events ACTIVATE_PAGER_DOWN .
  events ACTIVATE_PAGER_UP .
  events DEACTIVATE_PAGER_DOWN .
  events DEACTIVATE_PAGER_UP .
  class-events DEFAULT_DATA_CHANGED .
  class-events ODP2_ACTIVE
    exporting
      value(IV_ACTIVE) type ABAP_BOOL .

  class-methods CLEAR_CURSOR .
  methods CONSTRUCTOR
    importing
      !IS_DEFINITION type /SCMB/S_CONSTRUCTOR_PATTERN .
  class-methods END_OF_INITIALIZATION
    importing
      !IV_NO_MESSAGE_DISPLAY type ABAP_BOOL default ABAP_FALSE .
  class-methods END_OF_PAI .
  class-methods EXIT
    importing
      !IV_REFRESH type ABAP_BOOL default ABAP_TRUE
      !IV_REFRESH_IMMEDIATE type ABAP_BOOL default ABAP_FALSE
    returning
      value(EV_CONTINUE) type ABAP_BOOL .
  class-methods GET_CURSOR
    importing
      !IV_REPID type SYREPID .
  class-methods GET_DEFAULT_VALUES
    exporting
      !ES_VALUES type ANY .
  class-methods GET_ODP2_DYNPRO
    importing
      !IV_TA_IDENTIFIER type /SCMB/DE_DUSACTION
      !IV_DYNNR_OPEN type SYDYNNR
      !IV_DYNNR_CLOSED type SYDYNNR
    returning
      value(RV_DYNNR_USED) type SYDYNNR .
  class-methods INIT .
  methods MODIFY_FV_DYNPRO .
  class-methods MODIFY_ODP_TABSTRIP
    importing
      !IV_LEVEL type CHAR4 .
  class-methods PRESET_DEFAULT_VALUES
    importing
      !IS_DEFAULT_DATA type ANY .
  class-methods SET_CURSOR
    importing
      !IV_REPID type SYREPID .
  class-methods SET_DEFAULT_VALUES
    returning
      value(EV_CONTINUE) type ABAP_BOOL .
  class-methods SET_ODP2_DYNPRO
    importing
      !IV_DYNNR type SYDYNNR .
  class-methods SET_PROCESS_DATA
    importing
      !IO_ATTRIBUTE_HANDLER type ref to /SCMB/CL_ATTRIBUTE_HANDLER
      !IO_SERVICE_PROVIDER type ref to OBJECT
      !IO_MESSAGE_HANDLER type ref to /SCMB/CL_MESSAGE_HANDLER
      !IS_DYNPRO_DATA type /SCMB/S_DYNPRO_DATA
      !IS_DEFAULT_VALUES type /SCMB/S_DEFAULT_VALUES optional
      !IS_ODP2_HANDLING type /SCMB/S_ODP_HANDLING optional
      !IV_DISABLE_STANDARD_SAVE type ABAP_BOOL optional
      !IV_HIDE_COLUMN type ABAP_BOOL default ABAP_FALSE .
  class-methods START_QUERY
    importing
      !IT_SELECTION type /SCMB/T_SP_SELECTION
      !IS_OPTIONS type /SCMB/S_SP_QUERY_OPTIONS optional .
  class-methods START_SELECT
    importing
      !IS_KEY type ANY optional
      !IT_KEYS type INDEX TABLE optional
    preferred parameter IS_KEY .
  class-methods TRIGGER_CHANGED_DATA_CHECKS .
protected section.
*"* protected components of class /SCMB/CL_BASE
*"* do not include other source files here!!!

  data MS_INSERT type /SCMB/S_INSERT_PARAMETERS .
  data MS_TABLE type ref to DATA .
  data MT_ACTION_PARAMETERS type /SCMB/T_ACTION_PARAMETERS .
  data MT_KEYS_SEL type ref to DATA .
  data MT_KEYS_WORK type ref to DATA .
  data MV_ASPECT_NAME type STRING .
  type-pools ABAP .
  data MV_CLASSNAME type ABAP_ABSTYPENAME .
  data MV_SUPERIOR_ASPECT type STRING .
  data MV_TABSTRIP_OKCODE type SYUCOMM value ABAP_TRUE. "#EC NOTEXT .
  data MV_TAB_NUMBER type I .
  data MV_VIEW_MODE type /SCMB/DE_VIEW_MODE .
  class-data SO_CONTROLLER type ref to /SCMB/CL_CONTROLLER .
  class-data SO_MESSAGE_HANDLER type ref to /SCMB/CL_MESSAGE_HANDLER .
  class-data SV_CLASS_NAME_ODP1 type ABAP_ABSTYPENAME .
  class-data SV_CLASS_NAME_ODP2 type ABAP_ABSTYPENAME .
  class-data SV_CLASS_NAME_OIP type ABAP_ABSTYPENAME .
  class-data SV_PROCESS type /SCMB/DE_PROCESS .

  events UNDEFINED_SIDEEFFECT .

  methods ACTION
    importing
      !IV_ACTION type STRING
      !IV_SIDEEFFECT type ABAP_CHAR1
      !IS_INPARAM type ANY optional
      !IS_IMPLICIT_LOCKING type /SCMB/S_IMPLICIT_LOCKING optional
      !IS_LOCK_SUPERIOR_OBJECT type /SCMB/S_LOCK_SUPERIOR_OBJECT optional
      !IV_NO_SELECTION_ALLOWED type ABAP_BOOL default ABAP_TRUE
      !IV_SUPERIOR_OBJ_REQUIRED type ABAP_BOOL default ABAP_FALSE
      !IV_NO_MULTISELECTION type ABAP_BOOL default ABAP_FALSE
      !IS_INSERT type /SCMB/S_ACTION_INSERT optional
      !IV_REQUEST_CONFIRMATION type CHAR200 optional
      !IV_CHECK_UPD_ERRORS type /SCMB/DE_EES_UPDATE_ERROR_CH default 'N'
    exporting
      !EV_CANCEL type ABAP_BOOL
      !EV_RCODES_FAILED type ABAP_CHAR1 .
  methods ADDRESS_DIALOG
    importing
      !IV_ADDRESS_GROUP type AD_GROUP optional
      !IV_LOG_TABNAME type AD_APPLTAB optional
      !IV_LOG_APPL_KEY type LVC_FNAME optional
      !IV_LOG_FIELDNAME type AD_APPLFLD optional
      !IV_ADDRNUM type LVC_FNAME
      !IV_ADDRNUM_REF type LVC_FNAME optional
      !IV_ADDRESS_HANDLE type LVC_FNAME
      !IV_ADDRESS_CHANGED type LVC_FNAME optional
      !IV_PARTYNO type LVC_FNAME optional
      !IV_ALLOW_PERSONAL type ABAP_BOOL optional .
  methods ADD_SYSTEM_MESSAGE
    importing
      !IS_KEYS type ANY optional .
  methods ADVANCED_SEARCH
    importing
      !IO_SELECTIONS type ref to DATA
      !IS_OPTIONS type /SCMB/S_SP_QUERY_OPTIONS optional .
  methods CLEANUP_END .
  methods CONTINUE_ACTION
    importing
      !IV_TEXT type CHAR80 optional
    returning
      value(EV_CONTINUE) type BOOLE_D .
  methods DELETE
    importing
      !IV_SIDEEFFECT type ABAP_CHAR1
      !IS_IMPLICIT_LOCKING type /SCMB/S_IMPLICIT_LOCKING optional
      !IS_LOCK_SUPERIOR_OBJECT type /SCMB/S_LOCK_SUPERIOR_OBJECT optional
      !IV_IMMEDIATE_REFRESH type ABAP_BOOL default ABAP_FALSE
    exporting
      !EV_DELETED type ABAP_CHAR1 .
  methods EVENT_EXIT
    importing
      !IV_EVENT_TYPE type ABAP_CHAR1 .
  methods GET_ACTIVE_TAB
    returning
      value(EV_ACTIVE_TAB) type I .
  methods GET_CONFIRMED_SELECTION
    exporting
      !ET_ASPECT type INDEX TABLE .
  methods GET_LINES
    exporting
      !ET_ASPECT type INDEX TABLE .
  methods GET_SELECTED_LINE
    importing
      !IV_SUPPRESS_MESSAGE type ABAP_BOOL default ABAP_FALSE
      !IV_DATA_ONLY type ABAP_BOOL default ABAP_FALSE
    exporting
      !ES_ASPECT type ANY
      !EV_FAILED type ABAP_BOOL .
  methods GET_SELECTED_LINES
    importing
      !IV_SUPPRESS_MESSAGE type ABAP_BOOL default ABAP_FALSE
      !IV_NO_SELECT type ABAP_BOOL default ABAP_FALSE
    exporting
      !ET_ASPECT type INDEX TABLE
      !EV_FAILED type ABAP_BOOL .
  methods GET_SUPERIOR_DATA_BY_KEY
    importing
      !IV_SUPPRESS_MESSAGE type ABAP_BOOL default ABAP_TRUE
    exporting
      !ES_DATA type ref to DATA
      !EV_FAILED type ABAP_BOOL .
  methods INSERT
    importing
      !IV_SIDEEFFECT type ABAP_CHAR1
      !IV_LOCKED type ABAP_BOOL default ABAP_FALSE
      !IS_INRECORD type ANY optional
      !IV_SAVE type ABAP_BOOL default ABAP_FALSE
      !IV_MULTILOCK type ABAP_BOOL default ABAP_FALSE
      !IS_LOCK_SUPERIOR_OBJECT type /SCMB/S_LOCK_SUPERIOR_OBJECT optional
      !IV_SUPERIOR_OBJ_REQUIRED type ABAP_BOOL default ABAP_TRUE
    preferred parameter IV_SIDEEFFECT .
  methods LOCK
    importing
      !IV_MULTILOCK type ABAP_BOOL default ABAP_FALSE
      !IV_LOCKMODE type /SCMB/SP_LOCKMODE default 'SP'
      !IV_SIDEEFFECT type ABAP_CHAR1 default 'U'
    exporting
      !EV_REJECTED type ABAP_BOOL .
  methods LOCK_SUPERIOR_OBJECT
    importing
      !IT_KEYS type INDEX TABLE
      !IV_LOCKMODE type /SCMB/SP_LOCKMODE default 'SP'
      !IV_MULTILOCK type ABAP_BOOL
    returning
      value(EV_LOCK_ERROR) type ABAP_BOOL .
  methods ODP_TABSTRIP_SELECTED .
  methods OIP_TABSTRIP_SELECTED .
  methods ROLLBACK .
  methods SAPSCRIPT_EDITOR .
  methods SAVE
    importing
      !IV_SYNCHRONOUSLY type ABAP_BOOL optional
      !IV_FORCE_SAVING type ABAP_BOOL default ABAP_FALSE
      !IV_CHECK_MESSAGE_LOG type ABAP_BOOL default ABAP_FALSE
    returning
      value(EV_CANCEL) type ABAP_BOOL .
  methods SET_SEQUENCE_BY_KEY
    importing
      !IT_KEYS type INDEX TABLE .
  methods SET_UNSAVED_DATA_FLAG .
  methods SIMPLE_SEARCH
    importing
      !IO_INPARAM type ref to DATA
      !IS_OPTIONS type /SCMB/S_SP_QUERY_OPTIONS optional .
  methods TRIGGER_REFRESH .
  methods TRIGGER_SET_RELATION .
  methods UNLOCK
    importing
      !IV_CHECK_LOCK type ABAP_BOOL default ABAP_TRUE
      !IV_SIDEEFFECT type ABAP_CHAR1 default 'U'
    preferred parameter IV_CHECK_LOCK
    returning
      value(EV_REJECTED) type ABAP_BOOL .
private section.
*"* private components of class /SCMB/CL_BASE
*"* do not include other source files here!!!

  data MO_ALV_GRID type ref to CL_GUI_ALV_GRID .
  data MO_CONTAINER_ALV type ref to CL_GUI_CUSTOM_CONTAINER .
  data MO_CONTAINER_TEXT type ref to CL_GUI_CUSTOM_CONTAINER .
  data MO_TEXT type ref to CL_GUI_TEXTEDIT .
  data MO_TOOLBAR type ref to /SCMB/CL_TOOLBAR .
  data MS_ALV type ref to DATA .
  data MS_ASPECT type ref to DATA .
  data MS_ASPECT_SUP type ref to DATA .
  data MS_CREATE_DATA type LY_CREATE_DATA .
  data MS_DEFINITION_ALV type /SCMB/S_CONSTRUCTOR_ALV .
  data MS_FCONTROL type ref to DATA .
  data MS_FV type ref to DATA .
  data MS_KEYS type ref to DATA .
  data MS_KEYS_COMP type ref to DATA .
  data MS_KEYS_REL type ref to DATA .
  data MS_TOOLBAR type /SCMB/S_CONSTRUCTOR_TB_INT .
  data MT_ACTION_NOT_SAVE_RELEVANT type /SCMB/T_ACT_NOT_SAVE_RELEVANT .
  data MT_ALV type ref to DATA .
  data MT_ALV_BACKUP type ref to DATA .
  data MT_ALV_CHANGED_INDEX type LVC_T_TABX .
  data MT_ASPECT type ref to DATA .
  data MT_DELETE type ref to DATA .
  data MT_FCONTROL type ref to DATA .
  data MT_FV_ATTRIBUTES type /SCMB/T_FIELDCONTROL .
  data MT_INDEX_ROWS type LVC_T_ROW .
  data MT_KEYS_DEL type ref to DATA .
  data MT_KEYS_ERROR type ref to DATA .
  data MT_KEYS_LOCK type ref to DATA .
  data MT_KEYS_REL type ref to DATA .
  data MT_UPDATE type ref to DATA .
  data MV_CATEGORY type CHAR1 .
  data MV_CONTAINER_TEXT type CHAR30 .
  data MV_DATA_VALID type ABAP_BOOL value ABAP_FALSE ##NO_TEXT.
  data MV_DO_SIDEEFFECT_ASPECT type ABAP_BOOL value ABAP_FALSE ##NO_TEXT.
  data MV_DYNPRO_FORM type ref to SYDYNNR .
  data MV_DYNPRO_LIST type ref to SYDYNNR .
  data MV_F4_HELP type ABAP_BOOL value ABAP_FALSE ##NO_TEXT.
  data MV_FOCUS_ALV type ABAP_BOOL .
  data MV_FV_ONLY type ABAP_BOOL .
  data MV_GRID_INITIALIZED type ABAP_BOOL value ABAP_FALSE ##NO_TEXT.
  data MV_MULTIPLE_SELECTION type ABAP_BOOL .
  data MV_PREF_NAVI_COL type CHAR30 .
  data MV_PROCESS_ALV_EVENT type ABAP_BOOL .
  data MV_QUERY type STRING .
  data MV_REFRESH_NECESSARY type /SCMB/DE_REFRESH_NECESSARY .
  data MV_RELATION type STRING .
  data MV_RELATION_ACTIVE type ABAP_BOOL value ABAP_TRUE ##NO_TEXT.
  data MV_SAVE_RELEVANT type ABAP_BOOL value ABAP_TRUE ##NO_TEXT.
  data MV_SBR_FOR_INACTIVE type ABAP_BOOL value ABAP_FALSE ##NO_TEXT.
  data MV_SBR_WO_RELKEY type /SCMB/DE_SBR_WO_RELKEY value ABAP_FALSE ##NO_TEXT.
  data MV_SELECTION_CHANGED type ABAP_BOOL value ABAP_FALSE ##NO_TEXT.
  data MV_SET_FOCUS type CHAR30 .
  data MV_SIDEEFFECT_UPDATE type CHAR1 .
  data MV_SUBSCREEN type ref to SYDYNNR .
  data MV_URL type W3URL .
  constants SC_ALV_VARIANT_SAVE type ABAP_CHAR1 value 'A' ##NO_TEXT.
  constants SC_BOOLEAN_FIELD type REFNAME value 'BOOLE' ##NO_TEXT.
  constants SC_CANCEL_DELETE type ABAP_CHAR1 value 'D' ##NO_TEXT.
  constants SC_CANCEL_OK type ABAP_CHAR1 value 'O' ##NO_TEXT.
  constants SC_CANCEL_REJECTED type ABAP_CHAR1 value 'R' ##NO_TEXT.
  constants SC_COLOR_FOCUS type RAW4 value '0000000F' ##NO_TEXT.
  constants SC_COMPONENT_CELLTAB type NAME_KOMP value 'CELLTAB' ##NO_TEXT.
  constants SC_COMPONENT_CHANGEMODE type NAME_KOMP value 'CHANGEMODE' ##NO_TEXT.
  constants SC_COMPONENT_FIELD type NAME_KOMP value 'FIELD' ##NO_TEXT.
  constants SC_COMPONENT_PROPERTY type NAME_KOMP value 'PROPERTY' ##NO_TEXT.
  constants SC_COMPONENT_TEXT_LINES type NAME_KOMP value 'TEXT_LINES' ##NO_TEXT.
  constants SC_COMPONENT_VALUE type NAME_KOMP value 'VALUE' ##NO_TEXT.
  constants SC_DELETE type CHAR2 value 'DE' ##NO_TEXT.
  constants SC_ELEMENT_QUERY_MODE type /SCMB/DE_DUSELEMENT value '/SCMB/QUERY_MODE' ##NO_TEXT.
  constants SC_ELEMENT_DYNNR_ODP2 type /SCMB/DE_DUSELEMENT value '/SCMB/DYNNR_ODP2' ##NO_TEXT.
  constants SC_ELEMENT_RELEASE type /SCMB/DE_DUSELEMENT value '/SCMB/RELEASE' ##NO_TEXT.
  constants SC_FAILED_COMPLETLY type CHAR1 value 'C' ##NO_TEXT.
  constants SC_FAILED_PARTLY type CHAR1 value 'P' ##NO_TEXT.
  constants SC_FC_STRUC type TABNAME value 'LY_FCONTROL' ##NO_TEXT.
  constants SC_FOCUS_NEW type CHAR1 value 'N' ##NO_TEXT.
  constants SC_FOCUS_NONE type CHAR1 value ' ' ##NO_TEXT.
  constants SC_FOCUS_OLD type CHAR1 value 'O' ##NO_TEXT.
  constants SC_LVC_T_STYL type TABNAME value 'LVC_T_STYL' ##NO_TEXT.
  constants SC_MAINTMODE_CHANGE type AD_MNTMD value 'CHANGE' ##NO_TEXT.
  constants SC_MAINTMODE_CREATE type AD_MNTMD value 'CREATE' ##NO_TEXT.
  constants SC_MAINTMODE_DISPLAY type AD_MNTMD value 'DISPLAY' ##NO_TEXT.
  constants SC_MODE_AFTER_DELETE type ABAP_CHAR1 value 'A' ##NO_TEXT.
  constants SC_MODE_BEFORE_DELETE type ABAP_CHAR1 value 'B' ##NO_TEXT.
  constants SC_OK_ALV_LAYOUT type UI_FUNC value '/SCMB/OK_ALV_LAYOUT' ##NO_TEXT.
  constants SC_OK_ALV_LINE_DETAILS type UI_FUNC value '/SCMB/OK_ALV_LINE_DETAILS' ##NO_TEXT.
  constants SC_PAGER_DOWN type CHAR2 value 'PD' ##NO_TEXT.
  constants SC_PAGER_UP type CHAR2 value 'PU' ##NO_TEXT.
  constants SC_REFRESH_COMPLETE type /SCMB/DE_REFRESH_NECESSARY value 'S' ##NO_TEXT.
  constants SC_REFRESH_NONE type /SCMB/DE_REFRESH_NECESSARY value ' ' ##NO_TEXT.
  constants SC_REFRESH_NORMAL type /SCMB/DE_REFRESH_NECESSARY value 'X' ##NO_TEXT.
  constants SC_TOGGLE_INIT type CHAR2 value 'TI' ##NO_TEXT.
  constants SC_UND_SE_DELETE type /SCMB/DE_UNDEFINED_SE value 'D' ##NO_TEXT.
  constants SC_UND_SE_NONE type /SCMB/DE_UNDEFINED_SE value ' ' ##NO_TEXT.
  constants SC_UND_SE_NORMAL type /SCMB/DE_UNDEFINED_SE value 'X' ##NO_TEXT.
  constants SC_UPDATEFLG_DELETE type AD_UPDFLAG value 'D' ##NO_TEXT.
  constants SC_UPDATEFLG_INSERT type AD_UPDFLAG value 'I' ##NO_TEXT.
  constants SC_UPDATEFLG_UPDATE type AD_UPDFLAG value 'U' ##NO_TEXT.
  constants SC_XFELD type REFNAME value 'XFELD' ##NO_TEXT.
  class-data SO_ESDUS_ODP2 type ref to /SCMB/CL_ESDUS_MANAGER .
  class-data SS_DATA type /SCMB/S_FRAMEWORK_ATTRIBUTES .
  class-data SS_CURSOR type LY_CURSOR .
  class-data ST_COMP_FCT type CL_ABAP_STRUCTDESCR=>COMPONENT_TABLE .
  class-data SV_REPID type SYREPID .

  class-events CHANGED_DATA_CHECKS .
  class-events CHECK_FOR_ERRONEOUS_DATA .
  class-events CLEAR_FOCUS .
  events CLEAR_LOCK_TABLE .
  class-events END_OF_INIT .
  class-events END_OF_QUEUE .
  class-events EXECUTE_UPDATE .
  class-events EXIT_FRAMEWORK
    exporting
      value(IV_REFRESH) type ABAP_BOOL default ABAP_TRUE .
  class-events INITIALIZE_INSTANCES .
  events INITIALIZE_ODP
    exporting
      value(IV_ASPECT_NAME) type STRING
      value(IV_CLASS_NAME) type ABAP_ABSTYPENAME
      value(IV_INIT_INACTIVE_REL) type ABAP_BOOL default ABAP_FALSE
      value(IV_KEEP_SELECTION) type ABAP_BOOL optional .
  class-events INITIAL_QUERY
    exporting
      value(IS_OPTIONS) type /SCMB/S_SP_QUERY_OPTIONS optional
      value(IT_SELECTION) type /SCMB/T_SP_SELECTION .
  class-events INITIAL_SELECT
    exporting
      value(IS_KEY) type ANY optional
      value(IT_KEYS) type TABLE optional .
  class-events PROCESS_FCONTROL .
  class-events REFRESH_DISPLAY .
  events SET_RELATIONS
    exporting
      value(IV_ASPECT_NAME) type STRING
      value(IV_CLASS_NAME) type ABAP_ABSTYPENAME .
  events TRIGGER_SBR
    exporting
      value(IS_RELATION_KEY) type ref to DATA
      value(IV_ASPECT_NAME) type STRING
      value(IV_CLASS_NAME) type ABAP_ABSTYPENAME
      value(IV_SELECTION_CHANGED) type ABAP_BOOL .
  events UPD_SUPERIOR_ASPECT
    exporting
      value(IS_ASPECT_STRUCTURE) type ANY
      value(IV_ASPECT_NAME) type /SCMB/SP_ASPECT .

  methods ADDRESS_NORMAL_FOR_PERSON
    importing
      !IV_EDIT_MODE type ABAP_BOOL
      !IV_PERSNUM type AD_PERSNUM
      !IV_ADDRNUM_REF type AD_ADDRNUM
      !IV_ADDRNUM type AD_ADDRNUM
      !IV_HANDLE type ANY
      !IV_LOG_TABNAME type AD_APPLTAB
      !IV_LOG_APPL_KEY type AD_APPLKEY
      !IV_LOG_FIELDNAME type AD_APPLFLD
      !IV_ADDRESS_GROUP type AD_GROUP
    exporting
      !EV_UPDATE_FLAG type AD_UPDFLAG
      !ES_ADDRESS_HANDLE type LY_ADRESS_HANDLE
      !EV_ERROR type ABAP_BOOL .
  methods ADDRESS_NORMAL
    importing
      !IV_EDIT_MODE type ABAP_BOOL
      !IV_ADDRESS_GROUP type AD_GROUP
      !IV_ADDRNUM_REF type AD_ADDRNUM
      !IV_ADDRNUM type AD_ADDRNUM
      !IV_HANDLE type ANY
      !IV_LOG_TABNAME type AD_APPLTAB
      !IV_LOG_APPL_KEY type AD_APPLKEY
      !IV_LOG_FIELDNAME type AD_APPLFLD
    exporting
      !EV_UPDATE_FLAG type AD_UPDFLAG
      !ES_ADDRESS_HANDLE type LY_ADRESS_HANDLE
      !EV_ERROR type ABAP_BOOL .
  methods ADDRESS_PERSONAL
    importing
      !IV_EDIT_MODE type ABAP_BOOL
      !IV_PERSNUM type AD_PERSNUM
      !IV_ADDRNUM_REF type AD_ADDRNUM
      !IV_ADDRNUM type AD_ADDRNUM
      !IV_HANDLE type ANY
      !IV_LOG_TABNAME type AD_APPLTAB
      !IV_LOG_APPL_KEY type AD_APPLKEY
      !IV_LOG_FIELDNAME type AD_APPLFLD
    exporting
      !EV_UPDATE_FLAG type AD_UPDFLAG
      !ES_ADDRESS_HANDLE type LY_ADRESS_HANDLE
      !EV_ERROR type ABAP_BOOL .
  methods CHANGE_FIELDCAT
    importing
      !IO_STRUC type ref to CL_ABAP_STRUCTDESCR
      !IT_COLUMN_POS type /SCMB/T_COLUMN_POS
      !IT_EMPH_FIELDS type LVC_T_FNAM
      !IT_EXCLUDE_FIELDS type LVC_T_FNAM
      !IT_HIDE_FIELDS type LVC_T_FNAM
      !IT_KEY_FIELDS type LVC_T_FNAM
      !IT_CHECKBOX_FIELDS type LVC_T_FNAM
      !IT_COL_PROPERTIES type /SCMB/T_COLUMN_PROPERTIES
      !IT_ICON_FIELDS type LVC_T_FNAM optional
    changing
      !CT_FIELDCAT type LVC_T_FCAT .
  methods CHECK_FORM_VIEW_SELECTION .
  methods CHECK_FOR_ERRORS_ON_SELECTION
    raising
      /SCMB/CX_BASE .
  methods CHECK_FOR_UNSAVED_DATA
    importing
      !IV_MANDATORY type ABAP_BOOL
    returning
      value(EV_CONTINUE) type ABAP_BOOL .
  methods CHECK_QUERY_RESULT .
  methods CHECK_RCODES
    importing
      !IT_INKEYS type INDEX TABLE
      !IT_RCODES type /SCMB/T_SP_RETURN_CODE
    returning
      value(EV_RCODES_FAILED) type ABAP_CHAR1 .
  methods CHECK_SELECTION_CHANGE
    importing
      !IV_NEW_SELECTION type ABAP_BOOL default ABAP_FALSE
    returning
      value(EV_CONTINUE) type ABAP_BOOL .
  methods CHECK_SELECTION_CHANGE_EXT
    exporting
      !EV_CONTINUE type ABAP_BOOL
      !EV_LINE_KEPT type ABAP_BOOL .
  methods CHECK_TABLE_VIEW_SELECTION
    importing
      !IV_NO_MESSAGE type ABAP_BOOL default ABAP_FALSE
      !IV_INDEX_FILLED type ABAP_BOOL
    preferred parameter IV_NO_MESSAGE
    returning
      value(EV_CANCEL) type ABAP_CHAR1 .
  methods CHECK_UPDATE_ERRORS
    importing
      !IV_CHECK_UPD_ERRORS type /SCMB/DE_EES_UPDATE_ERROR_CH
    returning
      value(RV_ERROR) type ABAP_BOOL .
  methods CLEANUP .
  class-methods CLEAR_STATIC .
  methods CLEAR_TEXT_CONTROL .
  methods CLEAR_UNDEFINED_SE_FLAG .
  methods CLEAR_UNSAVED_DATA_FLAG .
  methods CONSTRUCTOR_STANDARD
    importing
      !IS_DEFINITION type /SCMB/S_CONSTRUCTOR_PATTERN .
  methods CONSTRUCTOR_TEXT .
  methods CONVERT_DATA_FOR_ALV
    importing
      !IT_ASPECT type ANY TABLE .
  methods CREATE_ALV .
  methods CREATE_DATA .
  methods CREATE_PICTURE
    importing
      !IV_CONTAINER_NAME type CHAR30
    changing
      !CO_CONTAINER type ref to CL_GUI_CUSTOM_CONTAINER
      !CO_PICTURE type ref to CL_GUI_PICTURE .
  methods CREATE_TOOLBAR .
  methods DISPLAY_ALV_LINE_DETAILS .
  methods DO_SIDEEFFECT_ASPECT .
  methods DO_SIDEEFFECT_OUTRECORDS
    importing
      !IT_ASPECT type STANDARD TABLE .
  methods DO_SIDEEFFECT_UNDEFINED .
  methods FILL_FORM_VIEW .
  methods FILL_TEXT_EDIT_CONTROL
    importing
      !IT_TEXT type TLINE_TAB .
  methods GET_ALV_STRUC_HANDLE
    importing
      !IV_ASPECT type TABNAME
    returning
      value(EO_STRUCDESCR) type ref to CL_ABAP_STRUCTDESCR .
  methods GET_DATA_FOR_FORM_VIEW
    importing
      !IV_MODE type CHAR2 optional .
  methods GET_FCT_STRUC_HANDLE
    importing
      !IT_COMPONENTS type CL_ABAP_STRUCTDESCR=>COMPONENT_TABLE
    returning
      value(EO_STRUCDESCR) type ref to CL_ABAP_STRUCTDESCR .
  methods GET_SELECTED_LINES_WO_SEL
    importing
      !IV_SUPPRESS_MESSAGE type ABAP_BOOL
    exporting
      !ET_ASPECT type INDEX TABLE
      !EV_FAILED type ABAP_BOOL .
  methods GET_SELECTED_ROWS
    returning
      value(ET_INDEX) type LVC_T_ROW .
  methods GET_SUPERIOR_DATA_INT
    importing
      !IS_KEY type ANY
    exporting
      !ES_DATA type ANY .
  methods GET_TABLE_HANDLE
    importing
      !IT_FIELDS type DDFIELDS
      !IO_STRUCDESCR type ref to CL_ABAP_STRUCTDESCR
      !IV_TABLEKIND type ABAP_TABLEKIND
      !IT_ADDITIONAL_KEYS type LVC_T_FNAM optional
      !IV_UNIQUE_KEY type ABAP_BOOL default ABAP_FALSE
    returning
      value(EO_TABLEDESCR) type ref to CL_ABAP_TABLEDESCR .
  methods HIDE_ODP2 .
  methods IMPLICIT_LOCKING
    importing
      !IS_LOCKING type /SCMB/S_IMPLICIT_LOCKING
    exporting
      !EV_CANCEL type ABAP_BOOL
      !EV_RCODES_FAILED type ABAP_CHAR1
    changing
      !CT_KEYS type STANDARD TABLE .
  methods MODIFY_ALV_TABLE
    importing
      !IT_OUTTAB_SVP type ANY TABLE .
  methods MODIFY_FORM_VIEW .
  methods MODIFY_RELATED_UPDATES
    importing
      !IV_MODE type ABAP_CHAR1 .
  methods MULTIPLE_QUERY_PREPARATIONS .
  methods OIP_LAYOUT_SETTINGS .
  methods ON_ALV_TOOLBAR
    for event TOOLBAR of CL_GUI_ALV_GRID
    importing
      !E_OBJECT
      !E_INTERACTIVE .
  methods ON_BEFORE_USER_COMMAND
    for event BEFORE_USER_COMMAND of CL_GUI_ALV_GRID
    importing
      !E_UCOMM .
  methods ON_CHANGED_DATA_CHECKS
    for event CHANGED_DATA_CHECKS of /SCMB/CL_BASE .
  methods ON_CHECK_FOR_ERRONEOUS_DATA
    for event CHECK_FOR_ERRONEOUS_DATA of /SCMB/CL_BASE .
  methods ON_CLEAR_FOCUS
    for event CLEAR_FOCUS of /SCMB/CL_BASE .
  methods ON_CLEAR_LOCK_TABLE
    for event CLEAR_LOCK_TABLE of /SCMB/CL_BASE .
  methods ON_DATA_CHANGED
    for event DATA_CHANGED of CL_GUI_ALV_GRID
    importing
      !ER_DATA_CHANGED
      !E_ONF4
      !E_ONF4_BEFORE
      !E_ONF4_AFTER
      !E_UCOMM
      !SENDER .
  methods ON_DATA_CHANGED_FINISHED
    for event DATA_CHANGED_FINISHED of CL_GUI_ALV_GRID
    importing
      !E_MODIFIED
      !ET_GOOD_CELLS .
  class-methods ON_DEFAULT_VALUES_CHANGED
    for event DEFAULTS_CHANGED of /SCMB/CL_EES_DEFAULTS .
  methods ON_DOUBLE_CLICK
    for event DOUBLE_CLICK of CL_GUI_ALV_GRID
    importing
      !E_ROW
      !E_COLUMN
      !SENDER .
  methods ON_END_OF_INIT
    for event END_OF_INIT of /SCMB/CL_BASE .
  methods ON_END_OF_QUEUE
    for event END_OF_QUEUE of /SCMB/CL_BASE .
  methods ON_EXECUTE_UPDATE
    for event EXECUTE_UPDATE of /SCMB/CL_BASE .
  methods ON_EXIT_FRAMEWORK
    for event EXIT_FRAMEWORK of /SCMB/CL_BASE
    importing
      !IV_REFRESH .
  methods ON_F4
    for event ONF4 of CL_GUI_ALV_GRID
    importing
      !E_FIELDNAME
      !E_FIELDVALUE
      !ES_ROW_NO
      !ER_EVENT_DATA
      !ET_BAD_CELLS
      !E_DISPLAY .
  methods ON_INITIALIZE_INSTANCES
    for event INITIALIZE_INSTANCES of /SCMB/CL_BASE .
  methods ON_INITIALIZE_ODP
    for event INITIALIZE_ODP of /SCMB/CL_BASE
    importing
      !IV_CLASS_NAME
      !IV_ASPECT_NAME
      !IV_KEEP_SELECTION
      !IV_INIT_INACTIVE_REL .
  methods ON_INITIAL_QUERY
    for event INITIAL_QUERY of /SCMB/CL_BASE
    importing
      !IT_SELECTION
      !IS_OPTIONS .
  methods ON_INITIAL_SELECT
    for event INITIAL_SELECT of /SCMB/CL_BASE
    importing
      !IS_KEY
      !IT_KEYS .
  methods ON_PAGER_DOWN
    for event PAGER_DOWN of /SCMB/CL_TOOLBAR .
  methods ON_PAGER_UP
    for event PAGER_UP of /SCMB/CL_TOOLBAR .
  methods ON_PPF_GRID_CHANGED
    for event GRID_CHANGED of CL_MANAGER_PPF
    importing
      !CAUSE .
  methods ON_PROCESS_FCONTROL
    for event PROCESS_FCONTROL of /SCMB/CL_BASE .
  class-methods ON_PUBLISH_REPID
    for event PUBLISH_REPID of /SCMB/CL_SEARCH
    importing
      !REPID .
  methods ON_REFRESH_DISPLAY
    for event REFRESH_DISPLAY of /SCMB/CL_BASE .
  methods ON_SET_RELATIONS
    for event SET_RELATIONS of /SCMB/CL_BASE
    importing
      !IV_CLASS_NAME
      !IV_ASPECT_NAME .
  methods ON_TOGGLE_VIEW
    for event TOGGLE_VIEW of /SCMB/CL_TOOLBAR .
  methods ON_TRIGGER_SBR
    for event TRIGGER_SBR of /SCMB/CL_BASE
    importing
      !IV_CLASS_NAME
      !IS_RELATION_KEY
      !IV_ASPECT_NAME
      !IV_SELECTION_CHANGED .
  methods ON_UNDEFINED_SIDEEFFECT
    for event UNDEFINED_SIDEEFFECT of /SCMB/CL_BASE .
  methods ON_UPD_SUPERIOR_ASPECT
    for event UPD_SUPERIOR_ASPECT of /SCMB/CL_BASE
    importing
      !IS_ASPECT_STRUCTURE
      !IV_ASPECT_NAME .
  methods ON_USER_COMMAND
    for event USER_COMMAND of CL_GUI_ALV_GRID
    importing
      !E_UCOMM
      !SENDER .
  methods REFRESH_ODP .
  methods REFRESH_OIP
    importing
      !IV_INCLUDE_DELETED type ABAP_BOOL .
  methods REGISTER_ALV_F4
    importing
      !IO_STRUC type ref to CL_ABAP_STRUCTDESCR .
  methods RESET_ALL
    importing
      !IV_KEEP_SELECTION type ABAP_BOOL default ABAP_FALSE
      !IV_KEEP_RELATION_KEYS type ABAP_BOOL default ABAP_FALSE
      !IV_KEEP_ERROR_KEYS type ABAP_BOOL default ABAP_TRUE
      !IV_INIT_INACTIVE_REL type ABAP_BOOL default ABAP_FALSE .
  methods RESET_PPF
    importing
      !IV_KEEP_RELATION_KEYS type ABAP_BOOL default ABAP_FALSE .
  methods SAVE_FIELDCONTROL_INFORMATION
    importing
      !IO_ASPECT_KEY type ref to DATA
      !IV_FIELD type STRING
      !IV_PROPERTY type STRING
      !IV_VALUE type CHAR1 .
  methods SELECT
    importing
      !IT_KEYS type STANDARD TABLE
    returning
      value(EV_CANCEL) type ABAP_CHAR1 .
  methods SELECT_BY_RELATION
    importing
      !IV_KEEP_SELECTION type ABAP_BOOL
      !IV_KEEP_ERROR_KEYS type ABAP_BOOL .
  methods SELECT_BY_RELATION_PPF .
  methods SELECT_ROWS_FOR_KEYTABLE .
  methods SELECT_SINGLE_ROW .
  methods SET_ACTIVE_TAB .
  methods SET_ATTRIBUTES_FOR_FORM_VIEW .
  methods SET_ATTRIBUTES_FOR_LV
    changing
      !CT_FIELDCONTROL type INDEX TABLE .
  methods SET_DYNPRO_FOR_TABSTRIP .
  methods SET_KEYS_FOR_SELECTION
    importing
      !IT_INDEX_ROWS type LVC_T_ROW .
  methods SET_PAGER_STATE .
  methods SET_SELECTED_ROWS
    importing
      !IT_INDEX type LVC_T_ROW .
  methods SET_TABLE_FOR_FIRST_DISPLAY .
  methods SET_TABSTRIP .
  methods SET_UNDEFINED_SE_FLAG
    importing
      !IV_INCLUDE_DELETED type ABAP_BOOL default ABAP_FALSE .
  methods SHOW_DETAILS .
  methods SOFT_REFRESH .
  methods TOGGLE_VIEW .
  methods TRIGGER_ERROR_CHECKS
    returning
      value(EV_CONTINUE) type ABAP_BOOL .
  methods TRIGGER_LOCK_SUPERIOR_OBJ
    importing
      !IS_LOCKING type /SCMB/S_LOCK_SUPERIOR_OBJECT
    returning
      value(EV_ERROR) type ABAP_BOOL .
  methods UPDATE
    importing
      !IT_INRECORDS type INDEX TABLE .
  methods UPDATE_PAGER_STATE .
ENDCLASS.