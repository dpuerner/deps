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



CLASS /SCMB/CL_BASE IMPLEMENTATION.


METHOD /scmb/if_ah_aspect~set_attributes.

  DATA:
    ls_fc  TYPE  ly_fcontrol.

  FIELD-SYMBOLS:
    <ls_aspect_key>  TYPE  ANY,
    <ls_fcontrol>    TYPE  ANY,
    <lt_fc>          TYPE  SORTED TABLE.

  create_data( ).

  ASSIGN:
    ms_fcontrol->*   TO <ls_fcontrol>,
    mt_fcontrol->*   TO <lt_fc>,
    io_aspect_key->* TO <ls_aspect_key>.

  MOVE-CORRESPONDING <ls_aspect_key> TO <ls_fcontrol>.
  ls_fc-property = iv_property.
  ls_fc-field    = iv_field.
  ls_fc-value    = iv_value.
  MOVE-CORRESPONDING ls_fc TO <ls_fcontrol>.
  INSERT <ls_fcontrol> INTO TABLE <lt_fc>.
  IF sy-subrc EQ 4.
    MODIFY TABLE <lt_fc> FROM <ls_fcontrol>.
  ENDIF.

ENDMETHOD.


METHOD /scmb/if_mh_aspect~set_focus.

  DATA:
    ls_celltab     TYPE  lvc_s_styl,
    lv_style       TYPE  char8,
    lv_set_dynpro  TYPE  abap_bool,
    lv_active_tab  TYPE  int4,
    lv_fieldname   TYPE  lvc_fname,
    ls_row         TYPE  lvc_s_row,
    ls_col         TYPE  lvc_s_col,
    lv_index       TYPE  lvc_index,
    lt_fieldcat    TYPE  lvc_t_fcat.

  FIELD-SYMBOLS:
    <lt_alv>        TYPE  STANDARD TABLE,
    <lt_keys_sel>   TYPE  STANDARD TABLE,
    <lt_celltab>    TYPE  lvc_t_styl,
    <ls_celltab>    TYPE  lvc_s_styl,
    <ls_fieldcat>   TYPE  lvc_s_fcat,
    <ls_table>      TYPE  ANY,
    <ls_alv>        TYPE  ANY,
    <ls_keys_comp>  TYPE  ANY,
    <ls_keys>       TYPE  ANY.

  create_data( ).

  ASSIGN:
    ms_table->*     TO <ls_table>,
    mt_alv->*       TO <lt_alv>,
    mt_keys_sel->*  TO <lt_keys_sel>,
    ms_keys_comp->* TO <ls_keys_comp>,
    ms_alv->*       TO <ls_alv>.

  ASSIGN is_key->* TO <ls_keys>.

* If tabstrip is not the selected tabstrip => select it ----------------
  lv_active_tab = get_active_tab( ).
  IF mv_tab_number NE lv_active_tab.
    set_active_tab( ).
    lv_set_dynpro = abap_true.
*   Remove buffered cursor setting (required or else the basis might
*   switch back to the old tabstrip)
    clear_cursor( ).
*   Hide/unhide ODP2 if required
    IF mv_classname = sv_class_name_odp1
    AND ss_data-s_odp2_handling IS NOT INITIAL.
      hide_odp2( ).
    ENDIF.
  ENDIF.

* Check (FV) if key is displayed ---------------------------------------
  IF mv_view_mode = /scmb/if_constant=>sc_form_view.
    MOVE-CORRESPONDING <ls_table> TO <ls_keys_comp>.
    IF <ls_keys_comp> NE <ls_keys>.
*     Form view displays different key -> check if key is
*     available in the list view
      MOVE-CORRESPONDING <ls_keys> TO <ls_alv>.
      READ TABLE <lt_alv> FROM <ls_alv> TRANSPORTING NO FIELDS.
      IF sy-subrc EQ 0.
        mv_view_mode = /scmb/if_constant=>sc_table_view.
        lv_set_dynpro = abap_true.
      ELSE.
*       No entry for this key -> display appropriate message
*       Message handler can't be used at this point
        MESSAGE i015(/scmb/esa_emulation).
        RETURN.
      ENDIF.
    ENDIF.
  ENDIF.

* Set dynpro if required -----------------------------------------------
  IF lv_set_dynpro = abap_true.
    set_dynpro_for_tabstrip( ).
    update_pager_state( ).
  ENDIF.

  IF mv_view_mode = /scmb/if_constant=>sc_table_view.
*   Get the row
    MOVE-CORRESPONDING <ls_keys> TO <ls_alv>.
    READ TABLE <lt_alv> FROM <ls_alv> ASSIGNING <ls_alv>.
    IF sy-subrc EQ 0.
      lv_index     = sy-tabix.
      ls_row-index = lv_index.
    ELSE.
*     No entry for this key -> display appropriate message
*     Message handler can't be used at this point
      MESSAGE i015(/scmb/esa_emulation).
      RETURN.
    ENDIF.

*   Check if ALV was already initialized, if not initialize now
    IF mv_grid_initialized = abap_false.
      soft_refresh( ).
    ENDIF.

*   Get field catalog and sort it by column position
    mo_alv_grid->get_frontend_fieldcatalog(
      IMPORTING et_fieldcatalog = lt_fieldcat ).
    SORT lt_fieldcat BY col_pos ASCENDING.

*   If field is supplied check if it is shown in the grid
    IF NOT iv_field_name IS INITIAL.
      READ TABLE lt_fieldcat
        WITH KEY fieldname = iv_field_name
                 no_out    = abap_false
                 icon      = abap_false
                 tech      = abap_false
        TRANSPORTING NO FIELDS.
      IF sy-subrc EQ 0.
        lv_fieldname = iv_field_name.
      ENDIF.
    ENDIF.

*   Column still initial -> try default if supplied
    IF lv_fieldname IS INITIAL.
      IF NOT mv_pref_navi_col IS INITIAL.
        READ TABLE lt_fieldcat
          WITH KEY fieldname = mv_pref_navi_col
                   no_out    = abap_false
                   tech      = abap_false
        TRANSPORTING NO FIELDS.
        IF sy-subrc EQ 0.
          lv_fieldname = mv_pref_navi_col.
        ENDIF.
      ENDIF.
    ENDIF.

*   Column still initial -> take first displayed column
    IF lv_fieldname IS INITIAL.
      READ TABLE lt_fieldcat
        WITH KEY no_out = abap_false
                 tech   = abap_false
        ASSIGNING <ls_fieldcat>.
      IF sy-subrc EQ 0.
        lv_fieldname = <ls_fieldcat>-fieldname.
      ENDIF.
    ENDIF.

*   Clear old focus settings
    RAISE EVENT clear_focus.

*   Get Celltab
    ASSIGN COMPONENT sc_component_celltab
      OF STRUCTURE <ls_alv> TO <lt_celltab>.

*   Change or add celltab entry for focus field
    READ TABLE <lt_celltab> ASSIGNING <ls_celltab>
      WITH KEY fieldname = lv_fieldname.
    IF sy-subrc EQ 0.
      <ls_celltab>-style = <ls_celltab>-style + sc_color_focus.
    ELSE.
      ls_celltab-fieldname = lv_fieldname.
      ls_celltab-style     = sc_color_focus.
      INSERT ls_celltab INTO TABLE <lt_celltab>.
    ENDIF.

*   Set focus flag and refresh ALV
    mv_focus_alv = abap_true.
    soft_refresh( ).

*   Set cursor to ensure that field is visible
    ls_col-fieldname = lv_fieldname.
    mo_alv_grid->set_current_cell_via_id(
      EXPORTING is_row_id    = ls_row
                is_column_id = ls_col ).

  ELSE.
*   Note: no navigation in form view if fieldname is not supplied or
*         preferred navigation column is not maintained
    lv_fieldname = iv_field_name.
    IF lv_fieldname IS INITIAL.
      lv_fieldname = mv_pref_navi_col.
    ENDIF.
    mv_set_focus = lv_fieldname.
  ENDIF.

ENDMETHOD.


METHOD action .

  DATA:
    lv_mandatory       TYPE         abap_bool,
    lv_rejected        TYPE         abap_bool,
    lt_return_codes    TYPE         /scmb/t_sp_return_code,
    ls_parameters      TYPE         /scmb/s_action_parameters,
    lv_lines           TYPE         i,
    lv_answer          TYPE         c,
    lv_cancel          TYPE         abap_char1,
    lv_cancel_dyn      TYPE         abap_bool,
    ls_inparam         TYPE REF TO  data,
    lt_keys_created    TYPE REF TO  data,
    lt_asp_created     TYPE REF TO  data,
    lv_text            TYPE         string.                 "#EC NEEDED

  FIELD-SYMBOLS:
    <ls_rel_outrecord>  TYPE  ANY,
    <ls_keys_rel>       TYPE  ANY,
    <ls_keys>           TYPE  ANY,
    <ls_table>          TYPE  ANY,
    <ls_inparam>        TYPE  ANY,
    <ls_aspect>         TYPE  ANY,
    <ls_alv>            TYPE  ANY,
    <lt_alv>            TYPE  STANDARD TABLE,
    <lt_alv_backup>     TYPE  STANDARD TABLE,
    <lt_asp_created>    TYPE  STANDARD TABLE,
    <lt_keys_created>   TYPE  STANDARD TABLE,
    <lt_keys_lock>      TYPE  STANDARD TABLE,
    <lt_keys_sel>       TYPE  STANDARD TABLE,
    <lt_keys_work>      TYPE  STANDARD TABLE,
    <lt_keys_rel>       TYPE  STANDARD TABLE,
    <lt_aspect>         TYPE  STANDARD TABLE.

  create_data( ).

  ASSIGN:
    mt_keys_sel->*   TO <lt_keys_sel>,
    mt_keys_rel->*   TO <lt_keys_rel>,
    ms_keys_rel->*   TO <ls_keys_rel>,
    mt_keys_lock->*  TO <lt_keys_lock>,
    mt_keys_work->*  TO <lt_keys_work>,
    mt_alv->*        TO <lt_alv>,
    ms_alv->*        TO <ls_alv>,
    mt_alv_backup->* TO <lt_alv_backup>,
    ms_keys->*       TO <ls_keys>,
    ms_aspect->*     TO <ls_aspect>,
    mt_aspect->*     TO <lt_aspect>,
    ms_table->*      TO <ls_table>.

* Execute updates ------------------------------------------------------
  RAISE EVENT execute_update.

* Clear field-symbols --------------------------------------------------
  CLEAR:
    <ls_keys>,
    <lt_keys_work>,
    <lt_aspect>.

* Pattern level specific coding necessary ------------------------------
  IF mv_classname NE sv_class_name_oip.
    IF <lt_keys_rel> IS INITIAL AND
       iv_superior_obj_required = abap_true.
      MESSAGE e005(/scmb/esa_emulation) INTO lv_text.
      add_system_message( ).
      ev_cancel = abap_true.
      RETURN.
    ENDIF.
  ENDIF.

* View dependent coding ------------------------------------------------
  CASE mv_view_mode.
    WHEN /scmb/if_constant=>sc_table_view.
*     Check if saving is necessary
      CHECK check_selection_change( is_insert-v_insert ) = abap_true.
      IF mv_selection_changed = abap_true  AND
        mv_classname = sv_class_name_oip.
        lv_mandatory = abap_false.
        IF is_implicit_locking IS SUPPLIED.
          IF is_implicit_locking-v_multilocking = abap_false.
            lv_mandatory = abap_true.
          ENDIF.
        ENDIF.
        IF check_for_unsaved_data( lv_mandatory ) = abap_false.
          ev_cancel = abap_true.
          RETURN.
        ENDIF.
      ENDIF.
      lv_cancel = check_table_view_selection(
        iv_no_message   = abap_true
        iv_index_filled = abap_true ).
      <lt_keys_work> = <lt_keys_sel>.
    WHEN /scmb/if_constant=>sc_form_view.
      IF NOT <ls_table> IS INITIAL.
        MOVE-CORRESPONDING <ls_table> TO <ls_keys>.
        APPEND <ls_keys> TO <lt_keys_work>.
        lv_cancel = select( <lt_keys_work> ).
      ENDIF.
  ENDCASE.

* Exit if SELECT resulted in a REJECTED --------------------------------
  IF lv_cancel EQ sc_cancel_rejected.
    ev_cancel = abap_true.
    RETURN.
  ENDIF.

* Evaluate select ------------------------------------------------------
  DESCRIBE TABLE <lt_keys_work> LINES lv_lines.
  IF lv_lines EQ 0 OR (
    mv_multiple_selection = abap_false AND lv_lines > 1 ).
    RAISE EVENT initialize_odp
      EXPORTING iv_class_name  = mv_classname
                iv_aspect_name = mv_aspect_name.
  ELSE.
    RAISE EVENT trigger_sbr
      EXPORTING iv_class_name        = mv_classname
                is_relation_key      = mt_keys_work
                iv_aspect_name       = mv_aspect_name
                iv_selection_changed = mv_selection_changed.
  ENDIF.

* Check for mutliselection ---------------------------------------------
  IF iv_no_multiselection = abap_true AND lv_lines > 1.
    MESSAGE s010(/scmb/esa_emulation) INTO lv_text.
    add_system_message( ).
    ev_cancel = abap_true.
    RETURN.
  ENDIF.

* Exit if nothing is selected and no selection is not allowed ----------
  IF iv_no_selection_allowed = abap_false AND lv_lines = 0.
    MESSAGE s007(/scmb/esa_emulation) INTO lv_text.
    add_system_message( ).
    ev_cancel = abap_true.
    RETURN.
  ENDIF.

* Check for erroneous data ---------------------------------------------
  IF check_update_errors(
    iv_check_upd_errors = iv_check_upd_errors ) = abap_true.
    MESSAGE e041(/scmb/esa_emulation) INTO lv_text.
    add_system_message( ).
    ev_cancel = abap_true.
    RETURN.
  ENDIF.

* Request user confirmation --------------------------------------------
  IF NOT iv_request_confirmation IS INITIAL.
    CALL FUNCTION 'POPUP_TO_CONFIRM'
      EXPORTING
        text_question         = iv_request_confirmation
        default_button        = /scmb/if_constant=>sc_no
        display_cancel_button = abap_false
      IMPORTING
        answer                = lv_answer
      EXCEPTIONS
        text_not_found        = 1
        OTHERS                = 2.
    IF lv_answer = /scmb/if_constant=>sc_no.
      ev_cancel = abap_true.
      RETURN.
    ENDIF.
  ENDIF.

* React on deleted selected keys ---------------------------------------
  IF lv_cancel = sc_cancel_delete.
    MESSAGE e008(/scmb/esa_emulation) INTO lv_text.
    add_system_message( ).
    ev_cancel = abap_true.
    RETURN.
  ENDIF.

* If preset data is available -> use it --------------------------------
  IF is_inparam IS SUPPLIED.
    ASSIGN is_inparam TO <ls_inparam>.
  ENDIF.

* Call popup if parameters are requested -------------------------------
  READ TABLE mt_action_parameters INTO ls_parameters
    WITH KEY v_action = iv_action.
  IF sy-subrc EQ 0.
*   Generate popup
    CALL FUNCTION '/SCMB/EES_DYNGEN'
      EXPORTING
        iv_structure        = ls_parameters-v_structure_name
        iv_title_text       = ls_parameters-v_popup_title_text
        is_data             = is_inparam
        it_display_only     = ls_parameters-t_display_only
        it_mandatory_fields = ls_parameters-t_mandatory_fields
        it_readonly_fields  = ls_parameters-t_readonly_fields
        it_no_dropdown_conv = ls_parameters-t_no_dropdown_conv
        it_display_order    = ls_parameters-t_display_order
        it_display_checkbox = ls_parameters-t_display_checkbox
        it_clear_memoryid   = ls_parameters-t_clear_memoryid
        it_combined_fields  = ls_parameters-t_combined_fields
        io_message_handler  = so_message_handler
      IMPORTING
        ev_cancel           = lv_cancel_dyn
        es_structure        = ls_inparam.
    IF lv_cancel_dyn = abap_true.
      ev_cancel = abap_true.
      RETURN.
    ENDIF.
    ASSIGN ls_inparam->* TO <ls_inparam>.
  ENDIF.

* Lock superior object -------------------------------------------------
  IF NOT is_lock_superior_object IS INITIAL
    AND NOT <lt_keys_rel> IS INITIAL.
    IF trigger_lock_superior_obj( is_lock_superior_object ) = abap_true.
      ev_cancel = abap_true.
      RETURN.
    ENDIF.
  ENDIF.

* Implicit locking -----------------------------------------------------
  IF NOT is_implicit_locking IS INITIAL.
    implicit_locking(
      EXPORTING is_locking       = is_implicit_locking
      IMPORTING ev_cancel        = ev_cancel
                ev_rcodes_failed = ev_rcodes_failed
      CHANGING  ct_keys          = <lt_keys_work> ).
    IF ev_cancel = abap_true
    OR ev_rcodes_failed = sc_failed_completly.
      RETURN.
    ENDIF.
  ENDIF.

* Buffer ALV content before ACTION call --------------------------------
* (Required for later check on changed data for INSERT sctions)
  <lt_alv_backup> = <lt_alv>.

* Different SP calls depending on parameters ---------------------------
* Clear ACTION IMPORTING parameters
  CLEAR:
    lv_rejected,
    lt_return_codes,
    <lt_aspect>.
  IF <ls_inparam> IS ASSIGNED.
    CASE mv_classname.
*     Call ACTION method of service provider w/o relation, with inparam
      WHEN sv_class_name_oip.
        CALL METHOD ss_data-o_sp->('EXECUTE')
          EXPORTING
            aspect       = mv_aspect_name
            inkeys       = <lt_keys_work>
            inparam      = <ls_inparam>
            action       = iv_action
          IMPORTING
            outrecords   = <lt_aspect>
            rejected     = lv_rejected
            return_codes = lt_return_codes.
*     Call ACTION method of service provider with relation, with inparam
      WHEN OTHERS.
        ASSIGN ms_aspect_sup->* TO <ls_rel_outrecord>.
        CLEAR:
          <ls_rel_outrecord>,
          <ls_keys_rel>.
        IF LINES( <lt_keys_rel> ) EQ 1.
          READ TABLE <lt_keys_rel> INTO <ls_keys_rel> INDEX 1.
        ENDIF.

        CALL METHOD ss_data-o_sp->('EXECUTE')
          EXPORTING
            aspect             = mv_aspect_name
            inkeys             = <lt_keys_work>
            inparam            = <ls_inparam>
            action             = iv_action
            relation_inkey     = <ls_keys_rel>
            relation           = mv_relation
          IMPORTING
            outrecords         = <lt_aspect>
            relation_outrecord = <ls_rel_outrecord>
            rejected           = lv_rejected
            return_codes       = lt_return_codes.
    ENDCASE.

  ELSE.
    CASE mv_classname.
*     Call ACTION method of service provider w/o relation, w/o inparam
      WHEN sv_class_name_oip.
        CALL METHOD ss_data-o_sp->('EXECUTE')
          EXPORTING
            aspect       = mv_aspect_name
            inkeys       = <lt_keys_work>
            action       = iv_action
          IMPORTING
            outrecords   = <lt_aspect>
            rejected     = lv_rejected
            return_codes = lt_return_codes.
*     Call ACTION method of service provider with relation, w/o inparam
      WHEN OTHERS.
        ASSIGN ms_aspect_sup->* TO <ls_rel_outrecord>.
        CLEAR:
          <ls_rel_outrecord>,
          <ls_keys_rel>.
        IF LINES( <lt_keys_rel> ) EQ 1.
          READ TABLE <lt_keys_rel> INTO <ls_keys_rel> INDEX 1.
        ENDIF.

        CALL METHOD ss_data-o_sp->('EXECUTE')
          EXPORTING
            aspect             = mv_aspect_name
            inkeys             = <lt_keys_work>
            action             = iv_action
            relation_inkey     = <ls_keys_rel>
            relation           = mv_relation
          IMPORTING
            outrecords         = <lt_aspect>
            relation_outrecord = <ls_rel_outrecord>
            rejected           = lv_rejected
            return_codes       = lt_return_codes.
    ENDCASE.
  ENDIF.

* Check the return codes -----------------------------------------------
  ev_rcodes_failed = check_rcodes(
    it_inkeys = <lt_keys_work>
    it_rcodes = lt_return_codes ).

* Check the exporting parameter ----------------------------------------
  IF lv_rejected = abap_true OR
     ev_rcodes_failed = sc_failed_completly.
*   Do side effects
    CASE iv_sideeffect.
      WHEN /scmb/if_constant=>sc_se_undefined.
        set_undefined_se_flag( ).
      WHEN /scmb/if_constant=>sc_se_aspect.
        mv_do_sideeffect_aspect = abap_true.
    ENDCASE.
    ev_cancel = abap_true.
    RETURN.
  ENDIF.

* Set unsaved data flag ------------------------------------------------
  READ TABLE mt_action_not_save_relevant
    WITH KEY table_line = iv_action TRANSPORTING NO FIELDS.
  IF sy-subrc EQ 4.
    set_unsaved_data_flag( ).
  ENDIF.

* Update superior aspect if necessary ----------------------------------
  IF <ls_rel_outrecord> IS ASSIGNED.
    IF NOT <ls_rel_outrecord> IS INITIAL.
      RAISE EVENT upd_superior_aspect
        EXPORTING is_aspect_structure = <ls_rel_outrecord>
                  iv_aspect_name      = mv_superior_aspect.
    ENDIF.
  ENDIF.

* Convert service provider table into ALV table and FV -----------------
  do_sideeffect_outrecords(
    EXPORTING it_aspect = <lt_aspect> ).

* Check if action creates new lines ------------------------------------
  IF is_insert-v_insert = abap_true.
    CREATE DATA:
      lt_keys_created LIKE <lt_keys_work>,
      lt_asp_created  LIKE <lt_aspect>.
    ASSIGN:
      lt_keys_created->* TO <lt_keys_created>,
      lt_asp_created->*  TO <lt_asp_created>.
*   Check if new lines were created
    LOOP AT <lt_aspect> INTO <ls_aspect>.
      MOVE-CORRESPONDING <ls_aspect> TO <ls_alv>.
      READ TABLE <lt_alv_backup> FROM <ls_alv> TRANSPORTING NO FIELDS.
      IF sy-subrc EQ 4.
        MOVE-CORRESPONDING <ls_aspect> TO <ls_keys>.
        APPEND:
          <ls_keys>   TO <lt_keys_created>,
          <ls_aspect> TO <lt_asp_created>.
        IF is_insert-v_locked = abap_true.
          APPEND <ls_keys> TO <lt_keys_lock>.
        ENDIF.
      ENDIF.
    ENDLOOP.
    IF NOT <lt_keys_created> IS INITIAL.
*     Add a row to ALV grid to set focus correctly
      mo_alv_grid->append_rows( ).
      CASE mv_view_mode.
        WHEN /scmb/if_constant=>sc_form_view.
*         Select the first new line
          READ TABLE <lt_asp_created> INDEX 1 INTO <ls_aspect>.
          MOVE-CORRESPONDING <ls_aspect> TO <ls_table>.
          APPEND LINES OF <lt_keys_created> TO <lt_keys_sel>.
          get_data_for_form_view( ).
        WHEN /scmb/if_constant=>sc_table_view.
          <lt_keys_sel> = <lt_keys_created>.
          DESCRIBE TABLE <lt_keys_sel> LINES lv_lines.
          IF lv_lines EQ 1 OR (
            mv_multiple_selection = abap_true AND lv_lines > 1 ).
            RAISE EVENT trigger_sbr
              EXPORTING iv_class_name        = mv_classname
                        is_relation_key      = mt_keys_sel
                        iv_aspect_name       = mv_aspect_name
                        iv_selection_changed = abap_true.
          ENDIF.
      ENDCASE.
    ENDIF.
  ENDIF.

* Do side effects ------------------------------------------------------
  CASE iv_sideeffect.
    WHEN /scmb/if_constant=>sc_se_outrecords.
*     already done
    WHEN /scmb/if_constant=>sc_se_undefined.
      set_undefined_se_flag( ).
    WHEN /scmb/if_constant=>sc_se_aspect.
      mv_do_sideeffect_aspect = abap_true.
  ENDCASE.

ENDMETHOD.


METHOD address_dialog .

  DATA:
    lv_error        TYPE  abap_bool,
    lv_updateflag   TYPE  ad_updflag,
    lv_cancel       TYPE  abap_char1,
    lv_edit_hidden  TYPE  raw4,
    lv_lines        TYPE  i,
    lv_text         TYPE  string,
    lv_edit_mode    TYPE  abap_bool,
    ls_but000       TYPE  but000,
    ls_ad_handle    TYPE  ly_adress_handle,
    lv_appl_key     TYPE  ad_applkey,
    lv_addrnum_ref  TYPE  ad_addrnum.

  "blocked BP check
  DATA:
    lt_return   TYPE bapiret2_t,
    ls_return   TYPE bapiret2,
    lv_partner  TYPE bupa_partner.

  FIELD-SYMBOLS:
    <lt_celltab>          TYPE  lvc_t_styl,
    <lt_alv>              TYPE  STANDARD TABLE,
    <lt_keys_sel>         TYPE  STANDARD TABLE,
    <lt_keys_work>        TYPE  STANDARD TABLE,
    <lt_aspect>           TYPE  STANDARD TABLE,
    <ls_celltab>          TYPE  lvc_s_styl,
    <lv_addrnum>          TYPE  ad_addrnum,
    <lv_appl_key>         TYPE  ad_applkey,
    <lv_addrnum_ref>      TYPE  ad_addrnum,
    <lv_partyno>          TYPE  ANY,
    <lv_address_changed>  TYPE  ANY,
    <lv_handle>           TYPE  ANY,
    <ls_aspect>           TYPE  ANY,
    <ls_alv>              TYPE  ANY,
    <ls_keys>             TYPE  ANY,
    <ls_table>            TYPE  ANY,
    <ls_fv>               TYPE  ANY.

  create_data( ).

  ASSIGN:
    mt_alv->*       TO <lt_alv>,
    ms_alv->*       TO <ls_alv>,
    mt_keys_sel->*  TO <lt_keys_sel>,
    mt_keys_work->* TO <lt_keys_work>,
    ms_keys->*      TO <ls_keys>,
    ms_fv->*        TO <ls_fv>,
    ms_aspect->*    TO <ls_aspect>,
    mt_aspect->*    TO <lt_aspect>,
    ms_table->*     TO <ls_table>.

  CLEAR:
    <lt_keys_work>.

* Execute updates ------------------------------------------------------
  RAISE EVENT execute_update.

* Initial checks and assigns -------------------------------------------
  ASSIGN COMPONENT:
    sc_component_celltab OF STRUCTURE <ls_alv> TO <lt_celltab>,
    iv_addrnum           OF STRUCTURE <ls_alv> TO <lv_addrnum>,
    iv_address_handle    OF STRUCTURE <ls_alv> TO <lv_handle>,
    iv_partyno           OF STRUCTURE <ls_alv> TO <lv_partyno>,
    iv_addrnum_ref       OF STRUCTURE <ls_alv> TO <lv_addrnum_ref>,
    iv_log_appl_key      OF STRUCTURE <ls_alv> TO <lv_appl_key>.

* Check if required fields exist in the aspect ------------------------
  IF NOT <lv_addrnum> IS ASSIGNED.
    MESSAGE e017(/scmb/esa_emulation) WITH iv_addrnum INTO lv_text.
    add_system_message( ).
    RETURN.
  ENDIF.
  IF NOT <lv_handle> IS ASSIGNED.
    MESSAGE e017(/scmb/esa_emulation)
      WITH iv_address_handle INTO lv_text.
    add_system_message( ).
    RETURN.
  ENDIF.

* Build hidden + edit raw4 value ---------------------------------------
  lv_edit_hidden = cl_gui_alv_grid=>mc_style_hotspot_no.
  lv_edit_hidden = lv_edit_hidden + cl_gui_alv_grid=>mc_style_disabled.

* View dependent coding ------------------------------------------------
  CASE mv_view_mode.
    WHEN /scmb/if_constant=>sc_table_view.
*     Check if saving is necessary
      CHECK check_selection_change( ) = abap_true.
      IF mv_selection_changed = abap_true  AND
        mv_classname = sv_class_name_oip.
        IF check_for_unsaved_data( abap_false ) = abap_false.
          EXIT.
        ENDIF.
      ENDIF.
      lv_cancel = check_table_view_selection(
        iv_no_message   = abap_true
        iv_index_filled = abap_true ).
      DESCRIBE TABLE <lt_keys_sel> LINES lv_lines.
      IF lv_lines EQ 0.
        MESSAGE s007(/scmb/esa_emulation) INTO lv_text.
        add_system_message( ).
        RETURN.
      ENDIF.
      IF lv_lines NE 1.
        MESSAGE s010(/scmb/esa_emulation) INTO lv_text.
        add_system_message( ).
        RETURN.
      ENDIF.
      <lt_keys_work> = <lt_keys_sel>.
    WHEN /scmb/if_constant=>sc_form_view.
      IF <ls_table> IS INITIAL.
        RETURN.
      ENDIF.
      MOVE-CORRESPONDING <ls_table> TO <ls_keys>.
      APPEND <ls_keys> TO <lt_keys_work>.
      lv_cancel = select( <lt_keys_work> ).
  ENDCASE.

* Exit if SELECT resulted in a REJECTED --------------------------------
  CHECK lv_cancel NE sc_cancel_rejected.

* Evaluate select ------------------------------------------------------
  DESCRIBE TABLE <lt_keys_work> LINES lv_lines.
  IF lv_lines = 1.
    RAISE EVENT trigger_sbr
      EXPORTING iv_class_name        = mv_classname
                is_relation_key      = mt_keys_work
                iv_aspect_name       = mv_aspect_name
                iv_selection_changed = mv_selection_changed.
  ELSE.
    RAISE EVENT initialize_odp
      EXPORTING iv_class_name  = mv_classname
                iv_aspect_name = mv_aspect_name.
    RETURN.
  ENDIF.

* React on deleted selected keys ---------------------------------------
  IF lv_cancel = sc_cancel_delete.
    MESSAGE e008(/scmb/esa_emulation) INTO lv_text.
    add_system_message( ).
    RETURN.
  ENDIF.

* Get data from ALV ----------------------------------------------------
  READ TABLE <lt_keys_work> INTO <ls_keys> INDEX 1.
  MOVE-CORRESPONDING <ls_keys> TO <ls_alv>.
  READ TABLE <lt_alv> FROM <ls_alv> INTO <ls_alv>.
  IF sy-subrc NE 0.
    MESSAGE e016(/scmb/esa_emulation) INTO lv_text.
    add_system_message( ).
    RETURN.
  ENDIF.

* Set optional fields --------------------------------------------------
  IF <lv_addrnum_ref> IS ASSIGNED.
    lv_addrnum_ref = <lv_addrnum_ref>.
  ENDIF.
  IF <lv_appl_key> IS ASSIGNED.
    lv_appl_key = <lv_appl_key>.
  ENDIF.

* Check if UI is in display or edit mode -------------------------------
  READ TABLE <lt_celltab> ASSIGNING <ls_celltab>
    WITH KEY fieldname = iv_addrnum.
  IF sy-subrc EQ 0.
    CASE <ls_celltab>-style.
      WHEN cl_gui_alv_grid=>mc_style_disabled
        OR lv_edit_hidden.
        lv_edit_mode = abap_false.
      WHEN cl_gui_alv_grid=>mc_style_enabled.
        lv_edit_mode = abap_true.
    ENDCASE.
  ELSE.
    lv_edit_mode = abap_false.
  ENDIF.

* If the BP is blocked, document address should not be displayed/changed
  IF <lv_partyno> IS ASSIGNED AND <lv_partyno> IS NOT INITIAL AND
      iv_addrnum = 'ADDRESSID'.
    lv_partner = <lv_partyno>.
    CALL FUNCTION 'BUPA_DP_AUTHCHECK'
      EXPORTING
        iv_partner                = lv_partner
        iv_check_chng_actvt       = lv_edit_mode
      TABLES
        et_return                 = lt_return.
    IF lt_return IS NOT INITIAL.
      LOOP AT lt_return INTO ls_return.
        MESSAGE ID ls_return-id TYPE ls_return-type NUMBER ls_return-number
          WITH ls_return-message_v1 INTO lv_text.
        add_system_message( ).
      ENDLOOP.
      RETURN.
    ENDIF.
  ENDIF.

* Call address dialog preparation --------------------------------------
  CALL FUNCTION 'ADDR_DIALOG_PREPARE'
    EXCEPTIONS
      internal_error = 1
      OTHERS         = 2.
  IF sy-subrc <> 0.
    add_system_message( <ls_keys> ).
    RETURN.
  ENDIF.

* Check if the address is a person address -----------------------------
  IF <lv_partyno> IS ASSIGNED.
    CALL FUNCTION 'BUP_BUT000_SELECT_SINGLE'
      EXPORTING
        i_partner = <lv_partyno>
      IMPORTING
        e_but000  = ls_but000
      EXCEPTIONS
        not_found = 1
        OTHERS    = 2.
    IF sy-subrc <> 0 AND sy-subrc <> 1.
      add_system_message( <ls_keys> ).
      RETURN.
    ENDIF.
  ENDIF.

* Person address maintenace --------------------------------------------
  IF NOT ls_but000-persnumber IS INITIAL
  AND    iv_allow_personal = abap_true.
    address_personal(
      EXPORTING iv_edit_mode       = lv_edit_mode
                iv_persnum         = ls_but000-persnumber
                iv_addrnum_ref     = lv_addrnum_ref
                iv_addrnum         = <lv_addrnum>
                iv_handle          = <lv_handle>
                iv_log_tabname     = iv_log_tabname
                iv_log_appl_key    = lv_appl_key
                iv_log_fieldname   = iv_log_fieldname
      IMPORTING ev_update_flag     = lv_updateflag
                es_address_handle  = ls_ad_handle
                ev_error           = lv_error ).
    IF lv_error = abap_true.
      RETURN.
    ENDIF.
* Special case: 'Normal' address for persons----------------------------
  ELSEIF NOT ls_but000-persnumber IS INITIAL
  AND        iv_allow_personal = abap_false.
    address_normal_for_person(
      EXPORTING iv_edit_mode      = lv_edit_mode
                iv_persnum        = ls_but000-persnumber
                iv_address_group  = iv_address_group
                iv_addrnum_ref    = lv_addrnum_ref
                iv_addrnum        = <lv_addrnum>
                iv_handle         = <lv_handle>
                iv_log_tabname    = iv_log_tabname
                iv_log_appl_key   = lv_appl_key
                iv_log_fieldname  = iv_log_fieldname
      IMPORTING ev_update_flag    = lv_updateflag
                es_address_handle = ls_ad_handle
                ev_error          = lv_error ).
    IF lv_error = abap_true.
      RETURN.
    ENDIF.
* 'Normal' address maintenance -----------------------------------------
  ELSE.
    address_normal(
      EXPORTING iv_edit_mode      = lv_edit_mode
                iv_address_group  = iv_address_group
                iv_addrnum_ref    = lv_addrnum_ref
                iv_addrnum        = <lv_addrnum>
                iv_handle         = <lv_handle>
                iv_log_tabname    = iv_log_tabname
                iv_log_appl_key   = lv_appl_key
                iv_log_fieldname  = iv_log_fieldname
      IMPORTING ev_update_flag    = lv_updateflag
                es_address_handle = ls_ad_handle
                ev_error          = lv_error ).
    IF lv_error = abap_true.
      RETURN.
    ENDIF.
  ENDIF.

* Set update flag if requested -----------------------------------------
  IF iv_address_changed IS SUPPLIED.
    ASSIGN COMPONENT iv_address_changed
      OF STRUCTURE <ls_alv> TO <lv_address_changed>.
    CASE lv_updateflag.
      WHEN sc_updateflg_insert.
        <lv_address_changed> = abap_true.
        <lv_handle> = ls_ad_handle.
      WHEN sc_updateflg_delete.
        <lv_address_changed> = abap_true.
        CLEAR:
          <lv_addrnum>,
          <lv_handle>.
      WHEN sc_updateflg_update.
        <lv_address_changed> = abap_true.
    ENDCASE.
  ENDIF.

* Call update of service provider --------------------------------------
  IF lv_updateflag = sc_updateflg_insert   OR
     lv_updateflag = sc_updateflg_delete   OR
     lv_updateflag = sc_updateflg_update.
    CLEAR <lt_aspect>.
    MOVE-CORRESPONDING <ls_alv> TO <ls_aspect>.
    APPEND <ls_aspect> TO <lt_aspect>.
    update( EXPORTING it_inrecords = <lt_aspect> ).
  ENDIF.

ENDMETHOD.


METHOD address_normal.

  DATA:
    lv_okcode         TYPE           syucomm,
    lv_guid           TYPE           guid_32,
    lv_text           TYPE           string,
    lt_addr_dia1      TYPE TABLE OF  addr1_dia,
    ls_addr_dia1      TYPE           addr1_dia,
    ls_addr_ref       TYPE           szadr_addr1_complete,
    ls_addr_dia1_ref  TYPE           szadr_addr1_line.

* Set address group ----------------------------------------------------
  ls_addr_dia1-addr_group = iv_address_group.

* Set maintenance mode -------------------------------------------------
  IF  iv_addrnum IS INITIAL
  AND iv_handle  IS INITIAL.
    IF iv_edit_mode = abap_true.
      es_address_handle-table = iv_log_tabname.
      es_address_handle-field = iv_log_fieldname.
      ls_addr_dia1-maint_mode = sc_maintmode_create.
      CALL FUNCTION 'GUID_CREATE'
        IMPORTING
          ev_guid_32 = lv_guid.
      es_address_handle-handle = lv_guid.
      ls_addr_dia1-handle = es_address_handle.
*     Create with reference - try to read reference address data
      IF NOT iv_addrnum_ref IS INITIAL.
        IF sy-subrc EQ 0.
          CALL FUNCTION 'ADDR_GET_COMPLETE'
            EXPORTING
              addrnumber              = iv_addrnum_ref
            IMPORTING
              addr1_complete          = ls_addr_ref
            EXCEPTIONS
              parameter_error         = 1
              address_not_exist       = 2
              internal_error          = 3
              wrong_access_to_archive = 4
              OTHERS                  = 5.
          IF sy-subrc EQ 0.
            READ TABLE ls_addr_ref-addr1_tab INTO ls_addr_dia1_ref
              WITH KEY nation = space.
            IF sy-subrc EQ 0.
              MOVE-CORRESPONDING ls_addr_dia1_ref-data TO ls_addr_dia1.
            ENDIF.
          ENDIF.
        ENDIF.
      ENDIF.
    ELSE.
      MESSAGE s018(/scmb/esa_emulation) INTO lv_text.
      add_system_message( ).
      ev_error = abap_true.
      RETURN.
    ENDIF.
  ELSE.
*   Set address number/handle
    IF iv_addrnum IS INITIAL.
      ls_addr_dia1-handle = iv_handle.
    ELSE.
      ls_addr_dia1-addrnumber = iv_addrnum.
    ENDIF.
    IF iv_edit_mode = abap_true.
      ls_addr_dia1-maint_mode = sc_maintmode_change.
*     Allow delete if relevant fields are filled
      IF NOT iv_log_tabname   IS INITIAL   AND
         NOT iv_log_fieldname IS INITIAL   AND
         NOT iv_log_appl_key  IS INITIAL.
        ls_addr_dia1-appl_table = iv_log_tabname.
        ls_addr_dia1-appl_field = iv_log_fieldname.
        ls_addr_dia1-appl_key   = iv_log_appl_key.
      ENDIF.
    ELSE.
      ls_addr_dia1-maint_mode = sc_maintmode_display.
    ENDIF.
  ENDIF.

* Call address dialog --------------------------------------------------
  APPEND ls_addr_dia1 TO lt_addr_dia1.
  CALL FUNCTION 'ADDR_DIALOG'
    IMPORTING
      ok_code           = lv_okcode
    TABLES
      number_handle_tab = lt_addr_dia1
    EXCEPTIONS
      address_not_exist = 1
      group_not_valid   = 2
      parameter_error   = 3
      internal_error    = 4
      OTHERS            = 5.
  IF sy-subrc <> 0.
    add_system_message( ).
    ev_error = abap_true.
    RETURN.
  ENDIF.

* Check if address was changed -----------------------------------------
  READ TABLE lt_addr_dia1 INTO ls_addr_dia1 INDEX 1.
  IF sy-subrc EQ 0.
    ev_update_flag = ls_addr_dia1-updateflag.
  ENDIF.

ENDMETHOD.


METHOD ADDRESS_NORMAL_FOR_PERSON.
* Special scenario for SCM EWM: the party (typically the ship-to) is a person
* but person-address maintenance is not supported currently. Because of that
* only the 'normal' address dialog is displayed to the EWM end user.

* In order to prefill the address dialog window, we have to read the address
* data via the person address maintenance functions but we have to raise
* the normal address maintenance popup by supplying the selected data.

  DATA:
    lv_okcode         TYPE           syucomm,
    lv_guid           TYPE           guid_32,
    lv_text           TYPE           string,
    lt_adrp           TYPE TABLE OF  adrp,
    ls_addr_ref2      TYPE           szadr_addr2_complete,
    ls_addr_dia2_ref  TYPE           szadr_addr2_line,
    lt_addr_dia1      TYPE TABLE OF  addr1_dia,
    ls_addr_dia1      TYPE           addr1_dia.

* Set address group ----------------------------------------------------
  ls_addr_dia1-addr_group = iv_address_group.

* If there is no address yet
  IF  iv_addrnum IS INITIAL
  AND iv_handle  IS INITIAL.
    IF iv_edit_mode = abap_true.

      es_address_handle-table = iv_log_tabname.
      es_address_handle-field = iv_log_fieldname.
      ls_addr_dia1-maint_mode = sc_maintmode_create.
      CALL FUNCTION 'GUID_CREATE'
        IMPORTING
          ev_guid_32 = lv_guid.
      es_address_handle-handle = lv_guid.
      ls_addr_dia1-handle = es_address_handle.

*     Create with reference - try to read reference address data to fill the address dialog pop-up
      IF NOT iv_addrnum_ref IS INITIAL.
        IF sy-subrc EQ 0.
          CALL FUNCTION 'ADDR_PERSONAL_GET_COMPLETE'
            EXPORTING
              addrnumber              = iv_addrnum_ref
              persnumber              = iv_persnum
            IMPORTING
              addr2_complete          = ls_addr_ref2
            EXCEPTIONS
              parameter_error         = 1
              address_not_exist       = 2
              person_not_exist        = 3
              internal_error          = 4
              wrong_access_to_archive = 5
              OTHERS                  = 6.
          IF sy-subrc EQ 0.
            READ TABLE ls_addr_ref2-addr2_tab INTO ls_addr_dia2_ref
              WITH KEY nation = space.
            IF sy-subrc EQ 0.
              MOVE-CORRESPONDING ls_addr_dia2_ref-data TO ls_addr_dia1.
              ls_addr_dia1-title  = ls_addr_dia2_ref-data-title_p.
              ls_addr_dia1-name1  = ls_addr_dia2_ref-data-name_first.
              IF ls_addr_dia2_ref-data-namemiddle IS NOT INITIAL.
                ls_addr_dia1-name2 = ls_addr_dia2_ref-data-namemiddle.
                ls_addr_dia1-name3 = ls_addr_dia2_ref-data-name_last.
              ELSE.
                ls_addr_dia1-name2  = ls_addr_dia2_ref-data-name_last.
              ENDIF.
            ENDIF.
          ENDIF.
        ENDIF.
      ENDIF.
    ELSE.
      MESSAGE s018(/scmb/esa_emulation) INTO lv_text.
*      add_system_message( ).
      ev_error = abap_true.
      RETURN.
    ENDIF.
  ELSE.
*   Set address number/handle
    IF iv_addrnum IS INITIAL.
      ls_addr_dia1-handle = iv_handle.
    ELSE.
      ls_addr_dia1-addrnumber = iv_addrnum.
    ENDIF.
    IF iv_edit_mode = abap_true.
      ls_addr_dia1-maint_mode = sc_maintmode_change.
*     Allow delete if relevant fields are filled
      IF  NOT iv_log_tabname   IS INITIAL
      AND NOT iv_log_fieldname IS INITIAL
      AND NOT iv_log_appl_key  IS INITIAL.
        ls_addr_dia1-appl_table = iv_log_tabname.
        ls_addr_dia1-appl_field = iv_log_fieldname.
        ls_addr_dia1-appl_key   = iv_log_appl_key.
      ENDIF.
    ELSE.
      ls_addr_dia1-maint_mode = sc_maintmode_display.
    ENDIF.
  ENDIF.

  APPEND ls_addr_dia1 TO lt_addr_dia1.

** Call normal address dialog ---------------------------------------------
  CALL FUNCTION 'ADDR_DIALOG'
    IMPORTING
      ok_code           = lv_okcode
    TABLES
      number_handle_tab = lt_addr_dia1
    EXCEPTIONS
      address_not_exist = 1
      group_not_valid   = 2
      parameter_error   = 3
      internal_error    = 4
      OTHERS            = 5.
  IF sy-subrc <> 0.
*    add_system_message( ).
    ev_error = abap_true.
    RETURN.
  ENDIF.
*
* Check if address was changed -----------------------------------------
  READ TABLE lt_addr_dia1 INTO ls_addr_dia1 INDEX 1.
  IF sy-subrc EQ 0.
    ev_update_flag = ls_addr_dia1-updateflag.
  ENDIF.

ENDMETHOD.


METHOD address_personal.

  DATA:
    lv_okcode         TYPE           syucomm,
    lv_guid           TYPE           guid_32,
    lv_text           TYPE           string,
    lt_adrp           TYPE TABLE OF  adrp,
    ls_addr_ref2      TYPE           szadr_addr2_complete,
    ls_addr_dia2_ref  TYPE           szadr_addr2_line,
    lt_addr_dia2      TYPE TABLE OF  addr2_dia,
    ls_addr_dia2      TYPE           addr2_dia.

  FIELD-SYMBOLS:
    <ls_adrp>  TYPE  adrp.

* Get address group ----------------------------------------------------
  CALL FUNCTION 'ADDR_SELECT_ADRP_SINGLE'
    EXPORTING
      persnumber       = iv_persnum
    TABLES
      et_adrp          = lt_adrp
    EXCEPTIONS
      person_not_exist = 1
      parameter_error  = 2
      internal_error   = 3
      OTHERS           = 4.
  IF sy-subrc <> 0 AND sy-subrc <> 1.
    add_system_message( ).
    ev_error = abap_true.
    RETURN.
  ENDIF.

  READ TABLE lt_adrp ASSIGNING <ls_adrp> INDEX 1.
  IF  iv_addrnum IS INITIAL
  AND iv_handle  IS INITIAL.
    IF iv_edit_mode = abap_true.
      ls_addr_dia2-maint_mode = sc_maintmode_create.
*     Get GUID for handle
      CALL FUNCTION 'GUID_CREATE'
        IMPORTING
          ev_guid_32 = lv_guid.
      es_address_handle-table  = iv_log_tabname.
      es_address_handle-field  = iv_log_fieldname.
      es_address_handle-handle = lv_guid.
      ls_addr_dia2-addrhandle  = es_address_handle.
*     Create with reference - try to read reference address data
      IF NOT iv_addrnum_ref IS INITIAL.
        IF sy-subrc EQ 0.
          CALL FUNCTION 'ADDR_PERSONAL_GET_COMPLETE'
            EXPORTING
              addrnumber              = iv_addrnum_ref
            IMPORTING
              addr2_complete          = ls_addr_ref2
            EXCEPTIONS
              parameter_error         = 1
              address_not_exist       = 2
              person_not_exist        = 3
              internal_error          = 4
              wrong_access_to_archive = 5
              OTHERS                  = 6.
          IF sy-subrc EQ 0.
            READ TABLE ls_addr_ref2-addr2_tab INTO ls_addr_dia2_ref
              WITH KEY nation = space.
            IF sy-subrc EQ 0.
              MOVE-CORRESPONDING ls_addr_dia2_ref-data TO ls_addr_dia2.
            ENDIF.
          ENDIF.
        ENDIF.
      ENDIF.
    ELSE.
      MESSAGE s018(/scmb/esa_emulation) INTO lv_text.
      add_system_message( ).
      ev_error = abap_true.
      RETURN.
    ENDIF.
  ELSE.
*   Set address number/handle
    IF iv_addrnum IS INITIAL.
      ls_addr_dia2-addrhandle = iv_handle.
    ELSE.
      ls_addr_dia2-addrnumber = iv_addrnum.
    ENDIF.
    IF iv_edit_mode = abap_true.
      ls_addr_dia2-maint_mode = sc_maintmode_change.
*     Allow delete if relevant fields are filled
      IF  NOT iv_log_tabname   IS INITIAL
      AND NOT iv_log_fieldname IS INITIAL
      AND NOT iv_log_appl_key  IS INITIAL.
        ls_addr_dia2-appl_table = iv_log_tabname.
        ls_addr_dia2-appl_field = iv_log_fieldname.
        ls_addr_dia2-appl_key   = iv_log_appl_key.
      ENDIF.
    ELSE.
      ls_addr_dia2-maint_mode = sc_maintmode_display.
    ENDIF.
  ENDIF.
  ls_addr_dia2-pers_group = <ls_adrp>-pers_group.
  ls_addr_dia2-persnumber = <ls_adrp>-persnumber.
  ls_addr_dia2-addrnumber = iv_addrnum.
  APPEND ls_addr_dia2 TO lt_addr_dia2.

* Call dialog ----------------------------------------------------------
  CALL FUNCTION 'ADDR_PERSONAL_DIALOG'
    IMPORTING
      ok_code           = lv_okcode
    TABLES
      number_handle_tab = lt_addr_dia2
    EXCEPTIONS
      address_not_exist = 1
      group_not_valid   = 2
      parameter_error   = 3
      internal_error    = 4
      OTHERS            = 5.
  IF sy-subrc <> 0.
    add_system_message( ).
    ev_error = abap_true.
    RETURN.
  ENDIF.

* Check if address has changed -----------------------------------------
  READ TABLE lt_addr_dia2 INTO ls_addr_dia2
    WITH KEY persnumber = iv_persnum.
  IF sy-subrc EQ 0.
    ev_update_flag = ls_addr_dia2-updateflag.
  ENDIF.

ENDMETHOD.


METHOD ADD_SYSTEM_MESSAGE.

  DATA:
    ls_msg  TYPE  symsg.

* Fill message structure -----------------------------------------------
  ls_msg-msgty = sy-msgty.
  ls_msg-msgid = sy-msgid.
  ls_msg-msgno = sy-msgno.
  ls_msg-msgv1 = sy-msgv1.
  ls_msg-msgv2 = sy-msgv2.
  ls_msg-msgv3 = sy-msgv3.
  ls_msg-msgv4 = sy-msgv4.

* Add the message to the message handler w/o aspect information --------
  IF is_keys IS INITIAL.
    so_message_handler->add_system_message( ls_msg ).
  ELSE.
    so_message_handler->add_message(
      EXPORTING msg        = ls_msg
                aspect     = mv_aspect_name
                aspect_key = is_keys ).
  ENDIF.

ENDMETHOD.


METHOD advanced_search .

  DATA:
    lv_rejected  TYPE  abap_bool.

  FIELD-SYMBOLS:
    <lt_keys_del>    TYPE  STANDARD TABLE,
    <lt_selections>  TYPE  /scmb/t_sp_selection,
    <lt_aspect>      TYPE  STANDARD TABLE.

  create_data( ).

* Assign field symbols -------------------------------------------------
  ASSIGN:
    mt_keys_del->*   TO <lt_keys_del>,
    io_selections->* TO <lt_selections>,
    mt_aspect->*     TO <lt_aspect>.

  CLEAR <lt_aspect>.

* Execute updates ------------------------------------------------------
  RAISE EVENT execute_update.

* Check for unsaved data -----------------------------------------------
  IF mv_classname = sv_class_name_oip.
    CHECK check_for_unsaved_data( abap_true ) = abap_true.
  ENDIF.

* Resets ---------------------------------------------------------------
  IF mv_classname = sv_class_name_oip.
    reset_all(
      EXPORTING iv_keep_selection     = abap_false
                iv_keep_relation_keys = abap_false
                iv_keep_error_keys    = abap_false
                iv_init_inactive_rel  = abap_true ).
  ELSE.
    reset_all(
      EXPORTING iv_keep_selection     = abap_false
                iv_keep_relation_keys = abap_true
                iv_keep_error_keys    = abap_false
                iv_init_inactive_rel  = abap_true ).
  ENDIF.
  IF ss_data-o_ppf_manager IS BOUND.
    ss_data-o_ppf_manager->refresh( EXPORTING clear_all = abap_true ).
  ENDIF.

* Call CLEANUP method of service provider ------------------------------
  IF mv_classname = sv_class_name_oip.
    CALL METHOD ss_data-o_sp->('CLEANUP')
      EXPORTING
        reason = /scmb/if_sp_transaction=>sc_cleanup_end.
    CLEAR <lt_keys_del>.
    RAISE EVENT clear_lock_table.
  ENDIF.

* Start service provider query -----------------------------------------
* Clear ACTION IMPORTING parameters
  CLEAR:
    lv_rejected,
    <lt_aspect>.
  IF is_options IS SUPPLIED.
    CALL METHOD ss_data-o_sp->('QUERY')
      EXPORTING
        query      = mv_query
        selections = <lt_selections>
        OPTIONS    = is_options
      IMPORTING
        outrecords = <lt_aspect>
        rejected   = lv_rejected.
  ELSE.
    CALL METHOD ss_data-o_sp->('QUERY')
      EXPORTING
        query      = mv_query
        selections = <lt_selections>
      IMPORTING
        outrecords = <lt_aspect>
        rejected   = lv_rejected.
  ENDIF.
  CHECK lv_rejected = abap_false.

* Convert data ---------------------------------------------------------
  convert_data_for_alv( <lt_aspect> ).
  IF mv_classname = sv_class_name_oip.
    mv_refresh_necessary = sc_refresh_normal.
  ELSE.
    set_undefined_se_flag( ).
  ENDIF.

* Check number of results ----------------------------------------------
  check_query_result( ).

ENDMETHOD.


METHOD change_fieldcat.

  DATA:
    ls_column_position  TYPE  /scmb/s_column_pos,
    lv_field            TYPE  lvc_fname,
    ls_col_properties   TYPE  /scmb/s_column_properties,
    lt_fields           TYPE  ddfields,
    ls_fields           TYPE  dfies.

  FIELD-SYMBOLS:
    <ls_fieldcat>  TYPE  lvc_s_fcat.

  lt_fields = io_struc->get_ddic_field_list( ).

* Set fields as check boxes --------------------------------------------
  LOOP AT lt_fields INTO ls_fields
    WHERE domname = sc_boolean_field OR domname = sc_xfeld.
    READ TABLE ct_fieldcat
      WITH KEY fieldname = ls_fields-fieldname
      ASSIGNING <ls_fieldcat>.
    IF sy-subrc = 0.
      <ls_fieldcat>-checkbox = abap_true.
    ENDIF.
  ENDLOOP.

* Set checkbox property (additionally defined) -------------------------
  LOOP AT it_checkbox_fields INTO lv_field.
    READ TABLE ct_fieldcat
      WITH KEY fieldname = lv_field
      ASSIGNING <ls_fieldcat>.
    IF sy-subrc = 0.
      <ls_fieldcat>-checkbox = abap_true.
    ENDIF.
  ENDLOOP.

* Set icon fields ------------------------------------------------------
  LOOP AT it_icon_fields INTO lv_field.
    READ TABLE ct_fieldcat
      WITH KEY fieldname = lv_field
      ASSIGNING <ls_fieldcat>.
    IF sy-subrc = 0.
      <ls_fieldcat>-icon = abap_true.
    ENDIF.
  ENDLOOP.

* Set column position --------------------------------------------------
  LOOP AT it_column_pos INTO ls_column_position.
    READ TABLE ct_fieldcat
      WITH KEY fieldname = ls_column_position-v_component_name
      ASSIGNING <ls_fieldcat>.
    IF sy-subrc EQ 0.
      <ls_fieldcat>-col_pos = ls_column_position-v_column_position.
    ENDIF.
  ENDLOOP.

* Emphasize column -----------------------------------------------------
  LOOP AT it_emph_fields INTO lv_field.
    READ TABLE ct_fieldcat
      WITH KEY fieldname = lv_field
      ASSIGNING <ls_fieldcat>.
    IF sy-subrc EQ 0.
      <ls_fieldcat>-emphasize = abap_true.
    ENDIF.
  ENDLOOP.

* Exclude fields -------------------------------------------------------
  LOOP AT it_exclude_fields INTO lv_field.
    READ TABLE ct_fieldcat
      WITH KEY fieldname = lv_field
      ASSIGNING <ls_fieldcat>.
    IF sy-subrc = 0.
      <ls_fieldcat>-tech = abap_true.
    ENDIF.
  ENDLOOP.

* Hide fields ----------------------------------------------------------
  LOOP AT it_hide_fields INTO lv_field.
    READ TABLE ct_fieldcat
      WITH KEY fieldname = lv_field
      ASSIGNING <ls_fieldcat>.
    IF sy-subrc = 0.
      <ls_fieldcat>-no_out = abap_true.
    ENDIF.
  ENDLOOP.

* Key fields -----------------------------------------------------------
  LOOP AT it_key_fields INTO lv_field.
    READ TABLE ct_fieldcat
      WITH KEY fieldname = lv_field
      ASSIGNING <ls_fieldcat>.
    IF sy-subrc = 0.
      <ls_fieldcat>-key = abap_true.
      <ls_fieldcat>-style = '00000005'.
    ENDIF.
  ENDLOOP.

* Set column properties ------------------------------------------------
  LOOP AT it_col_properties INTO ls_col_properties.
    READ TABLE ct_fieldcat
      WITH KEY fieldname = ls_col_properties-v_fieldname
      ASSIGNING <ls_fieldcat>.
    IF sy-subrc = 0.
      IF NOT ls_col_properties-v_coltext IS INITIAL.
        <ls_fieldcat>-colddictxt = ls_col_properties-v_coltext.
      ENDIF.
      IF NOT ls_col_properties-v_own_coltext IS INITIAL.
        <ls_fieldcat>-coltext = ls_col_properties-v_own_coltext.
      ENDIF.
      IF NOT ls_col_properties-v_column_width IS INITIAL.
        <ls_fieldcat>-outputlen = ls_col_properties-v_column_width.
      ENDIF.
      IF NOT ls_col_properties-v_tooltip IS INITIAL.
        <ls_fieldcat>-tooltip = ls_col_properties-v_tooltip.
      ENDIF.
    ENDIF.
  ENDLOOP.

ENDMETHOD.


METHOD check_form_view_selection .

  FIELD-SYMBOLS:
    <ls_table>     TYPE  ANY,
    <ls_keys>      TYPE  ANY,
    <lt_keys_work> TYPE  STANDARD TABLE.

  create_data( ).

  ASSIGN:
    ms_table->*     TO <ls_table>,
    mt_keys_work->* TO <lt_keys_work>,
    ms_keys->*      TO <ls_keys>.

  CLEAR <lt_keys_work>.

  IF <ls_table> IS INITIAL.
*   Blank form displayed -> clear ODP1/2
    RAISE EVENT initialize_odp
      EXPORTING iv_class_name  = mv_classname
                iv_aspect_name = mv_aspect_name.
  ELSE.
    MOVE-CORRESPONDING <ls_table> TO <ls_keys>.
    APPEND <ls_keys> TO <lt_keys_work>.
*   Send keys to ODP1/2
    RAISE EVENT trigger_sbr
      EXPORTING iv_class_name        = mv_classname
                is_relation_key      = mt_keys_work
                iv_aspect_name       = mv_aspect_name
                iv_selection_changed = mv_selection_changed.
  ENDIF.

ENDMETHOD.


METHOD check_for_errors_on_selection.

  DATA:
    ls_mapper      TYPE  /scmb/s_mapper,
    ls_aspect_map  TYPE  /scmb/s_aspect_relations.

  FIELD-SYMBOLS:
    <lt_keys_error>  TYPE  STANDARD TABLE.

  LOOP AT ss_data-t_aspect_mapping INTO ls_aspect_map
    WHERE v_aspect_sup = mv_aspect_name.
*   Get instance of related aspect
    READ TABLE ss_data-t_mapper
      WITH KEY v_aspect = ls_aspect_map-v_aspect
      INTO ls_mapper.
    IF NOT ls_mapper-o_pattern IS BOUND OR sy-subrc NE 0.
      ASSERT ID /scmb/pattern_framework CONDITION 1 = 0.
      CONTINUE.
    ENDIF.
    ls_mapper-o_pattern->create_data( ).
    ASSIGN ls_mapper-o_pattern->mt_keys_error->* TO <lt_keys_error>.
    IF NOT <lt_keys_error> IS INITIAL.
      RAISE EXCEPTION TYPE /scmb/cx_base.
    ENDIF.
    ls_mapper-o_pattern->check_for_errors_on_selection( ).
  ENDLOOP.

ENDMETHOD.


METHOD check_for_unsaved_data.

  DATA:
    lv_answer  TYPE  c,
    lv_cancel  TYPE  abap_bool.

  ev_continue = abap_true.

* Check the unsaved data flag ------------------------------------------
  CHECK ss_data-v_unsaved_data = abap_true.

* If saving is not requested for changes of the OIP selection => exit --
  IF iv_mandatory = abap_false AND ss_data-v_save_standard = abap_false.
    RETURN.
  ENDIF.

  CALL FUNCTION 'POPUP_TO_CONFIRM'
    EXPORTING
      text_question               = text-005
      default_button              = '1'
      display_cancel_button       = abap_true
    IMPORTING
      answer                      = lv_answer
    EXCEPTIONS
      text_not_found              = 1
      OTHERS                      = 2.

* Continue dependent on user interaction -------------------------------
  CASE lv_answer.
*   Call SAVE
    WHEN /scmb/if_constant=>sc_yes.
      lv_cancel = save( ).
      IF lv_cancel = abap_true.
        ev_continue = abap_false.
      ENDIF.
*   Continue without saving
    WHEN /scmb/if_constant=>sc_no.
*     Call CLEANUP method of service provider
      CALL METHOD ss_data-o_sp->('CLEANUP')
        EXPORTING
          reason = /scmb/if_sp_transaction=>sc_cleanup_end.
      ROLLBACK WORK.
      IF ss_data-o_ppf_manager IS BOUND.
        ss_data-o_ppf_manager->refresh(
          EXPORTING clear_all = abap_true ).
      ENDIF.
      clear_unsaved_data_flag( ).
      RAISE EVENT clear_lock_table.

*     Start undefined sideeffect
      set_undefined_se_flag( abap_true ).
      ev_continue = abap_true.

*     Call additional END_OF_QUEUE to ensure all messages are sent -----
*     to the message handler => these can be deleted to ensure the user
*     is not bothered with old messages (e.g. message of an update due
*     to buffered error keys
      CALL METHOD ss_data-o_sp->('END_OF_QUEUE').
      so_message_handler->delete_messages( ).
      so_message_handler->destroy_old_log( ).

*   Cancel
    WHEN /scmb/if_constant=>sc_cancel.
      ev_continue = abap_false.
  ENDCASE.

ENDMETHOD.


METHOD check_query_result .

  DATA:
    lv_element     TYPE  /scmb/de_duselement,
    lv_active      TYPE  /scmb/de_dusactive,
    lv_active_tab  TYPE  int4.

  FIELD-SYMBOLS:
    <lv_subscreen>  TYPE  sydynnr,
    <ls_table>      TYPE  ANY,
    <lt_keys_sel>   TYPE  STANDARD TABLE,
    <ls_keys>       TYPE  ANY,
    <lt_alv>        TYPE  STANDARD TABLE,
    <ls_alv>        TYPE  ANY.

  create_data( ).

  ASSIGN:
    mv_subscreen->* TO <lv_subscreen>,
    mt_keys_sel->*  TO <lt_keys_sel>,
    ms_keys->*      TO <ls_keys>,
    ms_table->*     TO <ls_table>,
    mt_alv->*       TO <lt_alv>,
    ms_alv->*       TO <ls_alv>.

* Get maintained ALV layout settings -----------------------------------
* If not available => use list view
  IF ss_data-o_esdus_manager IS BOUND.
    lv_element = sc_element_query_mode.
    lv_active  = ss_data-o_esdus_manager->get( lv_element ).
  ENDIF.

* Set view mode (subscreen is replaced by Tr.Mng.) ---------------------
  IF  mv_view_mode = /scmb/if_constant=>sc_form_view
  AND lv_active = abap_false.
    <lv_subscreen> = mv_dynpro_list->*.
    mv_view_mode = /scmb/if_constant=>sc_table_view.
  ENDIF.

* Update pagers, and toggle icon ---------------------------------------
  IF mo_toolbar IS BOUND.
    mo_toolbar->switch_toggle_icon( ).
  ENDIF.
  update_pager_state( ).

* For UIs with more than one OIP additional checks are required --------
  lv_active_tab = get_active_tab( ).
  IF mv_tab_number NE lv_active_tab.
    multiple_query_preparations( ).
    RETURN.
  ENDIF.

* If query returned exactly one line or OIP is displayed in FV ---------
  IF LINES( <lt_alv> ) = 1
  OR mv_view_mode = /scmb/if_constant=>sc_form_view.
*   Fill key table for SELECT
    IF mv_view_mode = /scmb/if_constant=>sc_form_view.
*     Only display the first 999 entries to prevent a short dump
      LOOP AT <lt_alv> INTO <ls_alv> TO 999.
        MOVE-CORRESPONDING <ls_alv> TO <ls_keys>.
        APPEND <ls_keys> TO <lt_keys_sel>.
      ENDLOOP.
    ELSE.
      READ TABLE <lt_alv> INDEX 1 INTO <ls_alv>.
      MOVE-CORRESPONDING:
        <ls_alv> TO <ls_table>,
        <ls_alv> TO <ls_keys>.
      APPEND <ls_keys> TO <lt_keys_sel>.
    ENDIF.
*   Call SP select to communicate line selection
    CHECK select( <lt_keys_sel> ) NE sc_cancel_rejected.

*   Fill form view if query triggered in FV mode
    IF mv_view_mode = /scmb/if_constant=>sc_form_view.
      get_data_for_form_view( ).
*     Exit, SBR already executed in GET_DATA_FOR_FORM_VIEW
*     Since in the FV only the hierarchical data of the displayed object
*     should be seen in the ODP, the upcoming call would be wrong
      RETURN.
    ENDIF.
  ENDIF.

* Fill ODP1 if result is still valid -----------------------------------
  IF LINES( <lt_keys_sel> ) = 1
  OR mv_multiple_selection = abap_true.
    RAISE EVENT trigger_sbr
      EXPORTING iv_class_name        = mv_classname
                is_relation_key      = mt_keys_sel
                iv_aspect_name       = mv_aspect_name
                iv_selection_changed = mv_selection_changed.
  ENDIF.

ENDMETHOD.


METHOD check_rcodes.

  DATA:
    lv_error  TYPE  abap_bool,
    lv_good   TYPE  abap_bool.

  FIELD-SYMBOLS:
    <ls_inkeys>  TYPE  ANY.

* Exit if no keys are supplied -----------------------------------------
  IF it_inkeys IS INITIAL.
*   Allow return code failed even for action without keys
    READ TABLE it_rcodes
      WITH KEY failed = abap_true
      TRANSPORTING NO FIELDS.
    IF sy-subrc EQ 0.
      ev_rcodes_failed = sc_failed_completly.
    ELSE.
      ev_rcodes_failed = abap_false.
    ENDIF.
    RETURN.
  ENDIF.

* Check return code table ----------------------------------------------
  LOOP AT it_inkeys ASSIGNING <ls_inkeys>.
    READ TABLE it_rcodes
      WITH KEY inrecord = sy-tabix
               failed   = abap_true
      TRANSPORTING NO FIELDS.
    IF sy-subrc EQ 0.
      lv_error = abap_true.
    ELSE.
      lv_good = abap_true.
    ENDIF.
  ENDLOOP.

* Set returning parameter ----------------------------------------------
  IF lv_error = abap_false.
    ev_rcodes_failed = abap_false.
  ELSEIF lv_error = abap_true AND lv_good = abap_false.
    ev_rcodes_failed = sc_failed_completly.
  ELSEIF lv_error = abap_true AND lv_good = abap_true.
    ev_rcodes_failed = sc_failed_partly.
  ENDIF.

ENDMETHOD.


METHOD check_selection_change .

  DATA:
    ls_index_rows  TYPE  lvc_s_row.

  FIELD-SYMBOLS:
    <lt_keys_work>   TYPE  STANDARD TABLE,
    <lt_keys_sel>    TYPE  STANDARD TABLE,
    <ls_keys>        TYPE  ANY,
    <lt_alv>         TYPE  STANDARD TABLE,
    <ls_alv>         TYPE  ANY.

  create_data( ).

  ASSIGN:
    mt_alv->*        TO <lt_alv>,
    ms_alv->*        TO <ls_alv>,
    mt_keys_work->*  TO <lt_keys_work>,
    mt_keys_sel->*   TO <lt_keys_sel>,
    ms_keys->*       TO <ls_keys>.

  CLEAR <lt_keys_work>.

* Get selection and default returning parameter ------------------------
  mt_index_rows = get_selected_rows( ).
  ev_continue = abap_true.

* Compare previous selection with new selection ------------------------
  LOOP AT mt_index_rows INTO ls_index_rows.
    READ TABLE <lt_alv> INDEX ls_index_rows-index INTO <ls_alv> .
    MOVE-CORRESPONDING <ls_alv> TO <ls_keys>.
    APPEND <ls_keys> TO <lt_keys_work>.
  ENDLOOP.

* Sort and compare key tables ------------------------------------------
  SORT:
    <lt_keys_work>,
    <lt_keys_sel>.
  IF <lt_keys_work> NE <lt_keys_sel>.
    mv_selection_changed = abap_true.
  ENDIF.

* Check for erroneous data ---------------------------------------------
  CHECK mv_selection_changed = abap_true
     OR iv_new_selection = abap_true.
  ev_continue = trigger_error_checks( ).

ENDMETHOD.


METHOD check_selection_change_ext .

  DATA:
    ls_index_rows  TYPE  lvc_s_row.

  FIELD-SYMBOLS:
    <lt_keys_work>   TYPE  STANDARD TABLE,
    <lt_keys_sel>    TYPE  STANDARD TABLE,
    <ls_keys>        TYPE  ANY,
    <ls_keys_comp>   TYPE  ANY,
    <lt_alv>         TYPE  STANDARD TABLE,
    <ls_alv>         TYPE  ANY.

  create_data( ).

  ASSIGN:
    mt_alv->*        TO <lt_alv>,
    ms_alv->*        TO <ls_alv>,
    mt_keys_work->*  TO <lt_keys_work>,
    mt_keys_sel->*   TO <lt_keys_sel>,
    ms_keys_comp->*  TO <ls_keys_comp>,
    ms_keys->*       TO <ls_keys>.

  CLEAR <lt_keys_work>.

* Get selection and default returning parameter ------------------------
  mt_index_rows = get_selected_rows( ).
  ev_continue = abap_true.

* Compare previous selection with new selection ------------------------
  LOOP AT mt_index_rows INTO ls_index_rows.
    READ TABLE <lt_alv> INDEX ls_index_rows-index INTO <ls_alv>.
    MOVE-CORRESPONDING <ls_alv> TO <ls_keys>.
    APPEND <ls_keys> TO <lt_keys_work>.
  ENDLOOP.

* Extended check: if previously a single line was selected and is the
* first line in the new selection it has to be ensured that the
* selection keys of the ODP below are kept; in all the other cases a
* INTIALIZE_ODP has to be triggered in GET_DATA_FOR_FORM_VIEW ----------
  IF LINES( <lt_keys_sel> ) EQ 1.
    READ TABLE mt_index_rows INDEX 1 INTO ls_index_rows.
    IF sy-subrc EQ 0.
      READ TABLE <lt_alv> INDEX ls_index_rows-index INTO <ls_alv> .
      IF sy-subrc EQ 0.
        MOVE-CORRESPONDING <ls_alv> TO <ls_keys_comp>.
        READ TABLE <lt_keys_sel> INDEX 1 INTO <ls_keys>.
        IF <ls_keys_comp> EQ <ls_keys>.
          ev_line_kept = abap_true.
        ENDIF.
      ENDIF.
    ENDIF.
  ENDIF.

* Sort and compare key tables ------------------------------------------
  SORT:
    <lt_keys_work>,
    <lt_keys_sel>.
  IF <lt_keys_work> NE <lt_keys_sel>.
    mv_selection_changed = abap_true.
  ENDIF.

* Check for erroneous data ---------------------------------------------
  CHECK mv_selection_changed = abap_true.
  ev_continue = trigger_error_checks( ).

ENDMETHOD.


METHOD check_table_view_selection .

  DATA:
    lv_lines       TYPE  i,
    lv_sbr         TYPE  abap_bool,
    ls_index_rows  TYPE  lvc_s_row.

  FIELD-SYMBOLS:
    <ls_table>     TYPE  ANY,
    <lt_keys_sel>  TYPE  STANDARD TABLE,
    <lt_alv>       TYPE  STANDARD TABLE,
    <ls_alv>       TYPE  ANY.

  create_data( ).

  ASSIGN:
    mt_alv->*      TO <lt_alv>,
    ms_alv->*      TO <ls_alv>,
    ms_table->*    TO <ls_table>,
    mt_keys_sel->* TO <lt_keys_sel>.

  CLEAR <ls_alv>.

* Get selected rows ----------------------------------------------------
  IF iv_index_filled = abap_false.
    mt_index_rows = get_selected_rows( ).
  ENDIF.

* Set itab with keys for select lines ----------------------------------
  set_keys_for_selection( mt_index_rows ).
  DESCRIBE TABLE mt_index_rows LINES lv_lines.

* Call SP select -------------------------------------------------------
  ev_cancel =  select( <lt_keys_sel> ).
  CHECK ev_cancel NE sc_cancel_rejected.

* Fill the form view structure to allow display of selected key --------
  IF lv_lines = 1.
    IF ev_cancel = sc_cancel_ok.
      READ TABLE mt_index_rows INDEX 1 INTO ls_index_rows.
      READ TABLE <lt_alv> INDEX ls_index_rows-index INTO <ls_alv>.
      MOVE-CORRESPONDING <ls_alv> TO <ls_table>.
    ELSE.
      CLEAR <ls_table>.
      RAISE EVENT initialize_odp
        EXPORTING iv_class_name  = mv_classname
                  iv_aspect_name = mv_aspect_name.
      RETURN.
    ENDIF.
  ENDIF.

* Don't send any message to ODP1 if flag is set ------------------------
  CHECK NOT iv_no_message = abap_true.

* Check if SBR or initialization of ODP is necessary -------------------
  IF ( mv_multiple_selection = abap_false AND lv_lines EQ 1 ) OR
     ( mv_multiple_selection = abap_true  AND lv_lines NE 0 ).
    lv_sbr = abap_true.
  ELSE.
    lv_sbr = abap_false.
  ENDIF.

  CASE lv_sbr.
    WHEN abap_true.
*     Read items for this line
      RAISE EVENT trigger_sbr
        EXPORTING iv_class_name        = mv_classname
                  is_relation_key      = mt_keys_sel
                  iv_aspect_name       = mv_aspect_name
                  iv_selection_changed = mv_selection_changed.
    WHEN abap_false.
      CLEAR <ls_table>.
      RAISE EVENT initialize_odp
        EXPORTING iv_class_name  = mv_classname
                  iv_aspect_name = mv_aspect_name.
  ENDCASE.

ENDMETHOD.


METHOD check_update_errors.

  DATA:
    lv_aspect_rel  TYPE         string,
    ls_mapper      TYPE         /scmb/s_mapper,
    ls_mapping     TYPE         /scmb/s_aspect_relations,
    lo_keys_check  TYPE REF TO  data.

  FIELD-SYMBOLS:
    <ls_keys_rel>    TYPE  ANY,
    <ls_keys>        TYPE  ANY,
    <ls_alv>         TYPE  ANY,
    <lt_alv>         TYPE  STANDARD TABLE,
    <lt_keys_work>   TYPE  STANDARD TABLE,
    <lt_keys_error>  TYPE  STANDARD TABLE,
    <lt_keys_check>  TYPE  STANDARD TABLE,
    <lt_keys_rel>    TYPE  STANDARD TABLE.

  create_data( ).

  ASSIGN:
    mt_alv->*        TO <lt_alv>,
    ms_alv->*        TO <ls_alv>,
    mt_keys_rel->*   TO <lt_keys_rel>,
    ms_keys_rel->*   TO <ls_keys_rel>,
    mt_keys_work->*  TO <lt_keys_work>,
    mt_keys_error->* TO <lt_keys_error>,
    ms_keys->*       TO <ls_keys>.

* Note: <lt_keys_work> contains the keys evaluated in the calling method

* Default error flag ---------------------------------------------------
  rv_error = abap_false.

* Distinguish between required checks ----------------------------------
  CASE iv_check_upd_errors.
*   Check all data
    WHEN /scmb/if_constant=>sc_check_upd_complete.
      RAISE EVENT check_for_erroneous_data.
      IF ss_data-v_erroneous_data EQ abap_true.
        rv_error = abap_true.
        ss_data-v_erroneous_data = abap_false.
      ENDIF.
      RETURN.
*   Check complete aspect (w/wo relations)
    WHEN /scmb/if_constant=>sc_check_upd_aspect
      OR /scmb/if_constant=>sc_check_upd_aspect_wo_rel.
      CREATE DATA lo_keys_check LIKE <lt_keys_work>.
      ASSIGN lo_keys_check->* TO <lt_keys_check>.
*     Get all aspect keys
      LOOP AT <lt_alv> INTO <ls_alv>.
        MOVE-CORRESPONDING <ls_alv> TO <ls_keys>.
        APPEND <ls_keys> TO <lt_keys_check>.
      ENDLOOP.
*   Check given (=work) keys (w/wo relations)
    WHEN /scmb/if_constant=>sc_check_upd_key
      OR /scmb/if_constant=>sc_check_upd_key_wo_rel.
      CREATE DATA lo_keys_check LIKE <lt_keys_work>.
      ASSIGN lo_keys_check->* TO <lt_keys_check>.
      <lt_keys_check> = <lt_keys_work>.
    WHEN /scmb/if_constant=>sc_check_upd_no.
*     Don't check, continue
      RETURN.
  ENDCASE.

* Check for mode 'aspect' and 'keys' -----------------------------------
* (1) Check own aspect
  LOOP AT <lt_keys_check> INTO <ls_keys>.
    READ TABLE <lt_keys_error> FROM <ls_keys> TRANSPORTING NO FIELDS.
    IF sy-subrc EQ 0.
      rv_error = abap_true.
      RETURN.
    ENDIF.
  ENDLOOP.

* Stop here if relations should not be checked
  IF iv_check_upd_errors = /scmb/if_constant=>sc_check_upd_aspect_wo_rel
  OR iv_check_upd_errors = /scmb/if_constant=>sc_check_upd_key_wo_rel.
    RETURN.
  ENDIF.

* (2) Check superior aspect(s) - if applicable
  IF  mv_classname NE sv_class_name_oip
  AND NOT <lt_keys_rel> IS INITIAL.
    READ TABLE ss_data-t_aspect_mapping
      WITH KEY v_aspect = mv_aspect_name
      INTO     ls_mapping.
    READ TABLE ss_data-t_mapper
      WITH KEY v_aspect = ls_mapping-v_aspect_sup
      INTO     ls_mapper.
    ls_mapper-o_pattern->create_data( ).
    ASSIGN ls_mapper-o_pattern->mt_keys_error->* TO <lt_keys_error>.
    LOOP AT <lt_keys_rel> INTO <ls_keys_rel>.
      READ TABLE <lt_keys_error> FROM <ls_keys_rel>
        TRANSPORTING NO FIELDS.
      IF sy-subrc EQ 0.
        rv_error = abap_true.
        RETURN.
      ENDIF.
    ENDLOOP.
*   For ODP2-patterns the top-most aspect has to be checked as well
    IF mv_classname EQ sv_class_name_odp2.
      ASSIGN ls_mapper-o_pattern->mt_keys_rel->* TO <lt_keys_rel>.
      IF NOT <lt_keys_rel> IS INITIAL.
        ASSIGN ls_mapper-o_pattern->ms_keys_rel->* TO <ls_keys_rel>.
        lv_aspect_rel = ls_mapping-v_aspect_sup.
        READ TABLE ss_data-t_aspect_mapping
          WITH KEY v_aspect = lv_aspect_rel
          INTO     ls_mapping.
        READ TABLE ss_data-t_mapper
          WITH KEY v_aspect = ls_mapping-v_aspect_sup
          INTO     ls_mapper.
        ls_mapper-o_pattern->create_data( ).
        ASSIGN ls_mapper-o_pattern->mt_keys_error->* TO <lt_keys_error>.
        LOOP AT <lt_keys_rel> INTO <ls_keys_rel>.
          READ TABLE <lt_keys_error> FROM <ls_keys_rel>
            TRANSPORTING NO FIELDS.
          IF sy-subrc EQ 0.
            rv_error = abap_true.
            RETURN.
          ENDIF.
        ENDLOOP.
      ENDIF.
    ENDIF.
  ENDIF.

* (3) Check related aspects
  READ TABLE ss_data-t_aspect_mapping
    WITH KEY v_aspect_sup = mv_aspect_name
    INTO     ls_mapping.
  IF sy-subrc EQ 0.
    READ TABLE ss_data-t_mapper
      WITH KEY v_aspect = ls_mapping-v_aspect
      INTO     ls_mapper.
*   No specific key check required, related aspects only contain data
*   for the 'check' keys
    ls_mapper-o_pattern->create_data( ).
    ASSIGN ls_mapper-o_pattern->mt_keys_error->* TO <lt_keys_error>.
    IF NOT <lt_keys_error> IS INITIAL.
      rv_error = abap_true.
      RETURN.
    ENDIF.
*   Check next/last hierarchy (if available)
    lv_aspect_rel = ls_mapping-v_aspect.
    READ TABLE ss_data-t_aspect_mapping
      WITH KEY v_aspect_sup = lv_aspect_rel
      INTO     ls_mapping.
    IF sy-subrc EQ 0.
      READ TABLE ss_data-t_mapper
        WITH KEY v_aspect = ls_mapping-v_aspect
        INTO     ls_mapper.
*     No specific key check required, related aspects only contain data
*     for the 'check' keys
      ls_mapper-o_pattern->create_data( ).
      ASSIGN ls_mapper-o_pattern->mt_keys_error->* TO <lt_keys_error>.
      IF NOT <lt_keys_error> IS INITIAL.
        rv_error = abap_true.
        RETURN.
      ENDIF.
    ENDIF.
  ENDIF.

ENDMETHOD.


METHOD cleanup.

  FIELD-SYMBOLS:
    <lt_keys_del>  TYPE  STANDARD TABLE.

  create_data( ).

  ASSIGN:
    mt_keys_del->* TO <lt_keys_del>.

* Initialize data ------------------------------------------------------
  clear_unsaved_data_flag( ).
  RAISE EVENT clear_lock_table.
  CLEAR mt_fv_attributes.

* Clear buffer table for deleted keys ----------------------------------
  IF <lt_keys_del> IS ASSIGNED.
    CLEAR <lt_keys_del>.
  ENDIF.

ENDMETHOD.


METHOD cleanup_end.

* Execute updates
  RAISE EVENT execute_update.

  CALL METHOD ss_data-o_sp->('CLEANUP')
    EXPORTING
      reason = /scmb/if_sp_transaction=>sc_cleanup_end.
  RAISE EVENT clear_lock_table.
  set_undefined_se_flag( ).
  IF ss_data-o_ppf_manager IS BOUND.
    ss_data-o_ppf_manager->refresh( EXPORTING clear_all = abap_true ).
  ENDIF.

ENDMETHOD.


METHOD clear_cursor.

  CLEAR ss_cursor.

ENDMETHOD.


METHOD clear_static.

* Free picture controls and container ----------------------------------
  IF ss_data-o_container_pic_oip IS BOUND.
    ss_data-o_picture_oip->free( ).
    ss_data-o_container_pic_oip->free( ).
    FREE:
      ss_data-o_container_pic_oip,
      ss_data-o_picture_oip.
  ENDIF.
  IF ss_data-o_container_pic_odp1 IS BOUND.
    ss_data-o_picture_odp1->free( ).
    ss_data-o_container_pic_odp1->free( ).
    FREE:
      ss_data-o_container_pic_odp1,
      ss_data-o_picture_odp1.
  ENDIF.
  IF ss_data-o_container_pic_odp2 IS BOUND.
    ss_data-o_picture_odp2->free( ).
    ss_data-o_container_pic_odp2->free( ).
    FREE:
      ss_data-o_container_pic_odp2,
      ss_data-o_picture_odp2.
  ENDIF.

* Free static instances ------------------------------------------------
  FREE:
    ss_data-o_attribute_handler,
    ss_data-o_ppf_manager,
    ss_data-o_sp,
    ss_data-o_esdus_manager,
    so_controller,
    so_message_handler.

* Clear static attributes ----------------------------------------------
  CLEAR:
    ss_data,
    sv_process,
    sv_class_name_oip,
    sv_class_name_odp1,
    sv_class_name_odp2.

ENDMETHOD.


METHOD clear_text_control.

  IF mv_category = /scmb/if_constant=>sc_cat_text  AND
     mo_text IS BOUND.
    mo_text->delete_text( ).
  ENDIF.

ENDMETHOD.


METHOD clear_undefined_se_flag.

  ss_data-v_do_undefined_se = sc_und_se_none.

ENDMETHOD.


METHOD clear_unsaved_data_flag.

  FIELD-SYMBOLS:
    <lt_keys_lock>  TYPE  STANDARD TABLE.

  create_data( ).

  ASSIGN mt_keys_lock->* TO <lt_keys_lock>.

  CLEAR:
    ss_data-v_unsaved_data,
    <lt_keys_lock>.

ENDMETHOD.


METHOD constructor .

  DATA:
    ls_mapper          TYPE  /scmb/s_mapper,
    ls_tab_counter     TYPE  /scmb/s_tab_counter,
    ls_aspect_mapping  TYPE  /scmb/s_aspect_relations,
    ls_active_tab      TYPE  /scmb/s_active_tabstrips.

* General data (relevant for all kinds of tabstrips) -------------------
  mv_classname        = cl_abap_classdescr=>get_class_name( me ).
  mv_category         = is_definition-v_category.
  mv_tabstrip_okcode  = is_definition-v_ok_tabstrip.
  mv_aspect_name      = is_definition-v_aspect_name.
  mv_relation         = is_definition-v_relation.
  mv_superior_aspect  = is_definition-v_aspect_name_sup.
  mv_sbr_for_inactive = is_definition-v_sbr_for_inactive.
  mv_sbr_wo_relkey    = is_definition-v_sbr_wo_relkey.
  mv_pref_navi_col    = is_definition-v_pref_navi_col.
  IF NOT is_definition-v_process IS INITIAL.
    sv_process = is_definition-v_process.
  ENDIF.

* Suppress saving if no data has changed -------------------------------
  IF is_definition-v_suppress_save = abap_true.
    ss_data-v_suppress_save = abap_true.
  ENDIF.

* Fill mapping table ---------------------------------------------------
  ls_mapper-v_aspect           = mv_aspect_name.
  ls_mapper-v_aspect_structure = is_definition-v_aspect_structure.
  ls_mapper-o_pattern          = me.
  ls_mapper-v_tabstrip_name    = is_definition-v_tabstrip_name.
  ls_mapper-v_class_name       = mv_classname.
  APPEND ls_mapper TO ss_data-t_mapper.

* Fill relation table --------------------------------------------------
  READ TABLE ss_data-t_aspect_mapping TRANSPORTING NO FIELDS
    WITH KEY v_aspect = is_definition-v_aspect_name.
  IF sy-subrc EQ 4.
    ls_aspect_mapping-v_aspect     = is_definition-v_aspect_name.
    ls_aspect_mapping-v_aspect_sup = is_definition-v_aspect_name_sup.
    ls_aspect_mapping-v_structure  = is_definition-v_aspect_structure.
    APPEND ls_aspect_mapping TO ss_data-t_aspect_mapping.
  ELSE.
    ASSERT ID /scmb/pattern_framework CONDITION 1 = 0.
  ENDIF.

* Event handler --------------------------------------------------------
  SET HANDLER:
    on_end_of_init,
    on_end_of_queue,
    on_initialize_instances,
    on_upd_superior_aspect   FOR ALL INSTANCES,
    on_initialize_odp        FOR ALL INSTANCES,
    on_trigger_sbr           FOR ALL INSTANCES,
    on_undefined_sideeffect  FOR ALL INSTANCES.

* Register only once ---------------------------------------------------
  IF ss_data-v_first_instance = abap_false.
    ss_data-v_first_instance = abap_true.
    SET HANDLER:
      on_exit_framework,
      on_publish_repid,
      on_default_values_changed.
  ENDIF.

* Register only OIPs ---------------------------------------------------
  IF is_definition-v_pattern_type = /scmb/if_constant=>sc_oip.
    SET HANDLER:
      on_initial_select,
      on_initial_query.
  ENDIF.

* Set class names and count tabstrips ----------------------------------
  CASE is_definition-v_pattern_type.
    WHEN /scmb/if_constant=>sc_oip.
      IF sv_class_name_oip IS INITIAL.
        sv_class_name_oip = mv_classname.
      ENDIF.
      READ TABLE ss_data-t_tab_counter INTO ls_tab_counter
        WITH KEY v_classname = sv_class_name_oip.
      IF sy-subrc EQ 0.
        ls_tab_counter-v_counter = ls_tab_counter-v_counter + 1.
        MODIFY TABLE ss_data-t_tab_counter FROM ls_tab_counter.
      ELSE.
        ls_tab_counter-v_classname = sv_class_name_oip.
        ls_tab_counter-v_counter   = 1.
        APPEND ls_tab_counter TO ss_data-t_tab_counter.
      ENDIF.
    WHEN /scmb/if_constant=>sc_odp1.
      IF sv_class_name_odp1 IS INITIAL.
        sv_class_name_odp1 = mv_classname.
      ENDIF.
      READ TABLE ss_data-t_tab_counter INTO ls_tab_counter
        WITH KEY v_classname = sv_class_name_odp1.
      IF sy-subrc EQ 0.
        ls_tab_counter-v_counter = ls_tab_counter-v_counter + 1.
        MODIFY TABLE ss_data-t_tab_counter FROM ls_tab_counter.
      ELSE.
        ls_tab_counter-v_classname = sv_class_name_odp1.
        ls_tab_counter-v_counter   = 1.
        APPEND ls_tab_counter TO ss_data-t_tab_counter.
      ENDIF.
    WHEN /scmb/if_constant=>sc_odp2.
      IF sv_class_name_odp2 IS INITIAL.
        sv_class_name_odp2 = mv_classname.
      ENDIF.
      READ TABLE ss_data-t_tab_counter INTO ls_tab_counter
        WITH KEY v_classname = sv_class_name_odp2.
      IF sy-subrc EQ 0.
        ls_tab_counter-v_counter = ls_tab_counter-v_counter + 1.
        MODIFY TABLE ss_data-t_tab_counter FROM ls_tab_counter.
      ELSE.
        ls_tab_counter-v_classname = sv_class_name_odp2.
        ls_tab_counter-v_counter   = 1.
        APPEND ls_tab_counter TO ss_data-t_tab_counter.
      ENDIF.
    WHEN OTHERS.
*     Assert
  ENDCASE.

* Set tab number
  mv_tab_number = ls_tab_counter-v_counter.

* Fill active tabstrip table
  READ TABLE ss_data-t_active_tab TRANSPORTING NO FIELDS
    WITH KEY  v_classname         = mv_classname
              v_superior_relation = is_definition-v_aspect_name_sup.
  IF sy-subrc = 4.
    ls_active_tab-v_classname         = mv_classname.
    ls_active_tab-v_superior_relation = is_definition-v_aspect_name_sup.
    ls_active_tab-v_active_tabstrip   = mv_tab_number.
    APPEND ls_active_tab TO ss_data-t_active_tab.
  ENDIF.

* Set active tab on tabcontrol
  IF is_definition-v_active_tab = abap_true.
    set_tabstrip( ).
    set_active_tab( ).
  ENDIF.

* Create data typization dynamically
  ms_create_data-keys   = is_definition-v_keys.
  ms_create_data-keys_r = is_definition-v_keys_sup.
  ms_create_data-aspect = is_definition-v_aspect_structure.

* Create picture control for collapsed pattern
  IF NOT is_definition-v_container_pic IS INITIAL.
    CASE mv_classname.
      WHEN sv_class_name_oip.
        create_picture(
          EXPORTING iv_container_name = is_definition-v_container_pic
          CHANGING  co_container      = ss_data-o_container_pic_oip
                    co_picture        = ss_data-o_picture_oip ).
      WHEN sv_class_name_odp1.
        create_picture(
          EXPORTING iv_container_name = is_definition-v_container_pic
          CHANGING  co_container      = ss_data-o_container_pic_odp1
                    co_picture        = ss_data-o_picture_odp1 ).
      WHEN sv_class_name_odp2.
        create_picture(
          EXPORTING iv_container_name = is_definition-v_container_pic
          CHANGING  co_container      = ss_data-o_container_pic_odp2
                    co_picture        = ss_data-o_picture_odp2 ).
    ENDCASE.
  ENDIF.

* Settings relevant for ALV and text tabstrips -------------------------
  CASE mv_category.
    WHEN /scmb/if_constant=>sc_cat_standard  OR
         /scmb/if_constant=>sc_cat_text.
      constructor_standard( is_definition ).
    WHEN /scmb/if_constant=>sc_cat_ppf.
      SET HANDLER on_ppf_grid_changed FOR ALL INSTANCES.
      IF NOT ss_data-o_ppf_manager IS BOUND.
        ss_data-o_ppf_manager = cl_manager_ppf=>get_instance( ).
      ENDIF.
  ENDCASE.

ENDMETHOD.


METHOD constructor_standard.

  DATA:
    lv_element  TYPE  /scmb/de_duselement,
    lv_active   TYPE  /scmb/de_dusactive.

  FIELD-SYMBOLS:
    <lv_subscreen>  TYPE  sydynnr.

* Set general data -----------------------------------------------------
  mv_subscreen                = is_definition-v_subscreen.
  ms_table                    = is_definition-s_table.
  mv_sideeffect_update        = is_definition-v_sideeffect_update.
  mv_query                    = is_definition-v_query.
  mv_multiple_selection       = is_definition-v_multiple_selection.
  mt_action_parameters        = is_definition-t_action_parameters.
  ms_insert-v_structure_name  = is_definition-v_insert_structure.
  ms_insert-t_clear_memoryid  = is_definition-t_insert_clear_memoryid.
  ms_insert-t_combined_fields = is_definition-t_insert_combined_fields.
  ms_insert-t_display_only    = is_definition-t_insert_display_only.
  mt_action_not_save_relevant = is_definition-t_act_not_save_relevant.
  ms_insert-t_display_order   = is_definition-t_insert_display_order.
  ms_insert-t_readonly_fields = is_definition-t_insert_readonly_fields.
  ms_insert-v_popup_title_text =
    is_definition-v_insert_popup_title_text.
  ms_insert-t_mandatory_fields =
    is_definition-t_insert_mandatory_fields.
  ms_insert-t_no_dropdown_conv =
    is_definition-t_insert_no_dropdown_conv.
  ms_insert-t_display_checkbox =
    is_definition-t_insert_display_checkbox.
  GET REFERENCE OF:
    is_definition-v_dynpro_list INTO mv_dynpro_list,
    is_definition-v_dynpro_form INTO mv_dynpro_form.
  IF is_definition-v_not_save_relevant = abap_true.
    mv_save_relevant = abap_false.
  ELSE.
    mv_save_relevant = abap_true.
  ENDIF.

* Set toolbar data -----------------------------------------------------
  ms_toolbar-s_toolbar      = is_definition-s_toolbar.
  ms_toolbar-o_controller   = so_controller.
  ms_toolbar-v_pattern_type = is_definition-v_pattern_type.
  ms_toolbar-o_pattern      = me.

* Get ALV layout settings (OIP only ------------------------------------
  IF mv_classname = sv_class_name_oip.
    IF ss_data-o_esdus_manager IS BOUND.
      lv_element = sc_element_query_mode.
      lv_active  = ss_data-o_esdus_manager->get( lv_element ).
    ENDIF.
  ENDIF.

* Set view mode and dynpros --------------------------------------------
  ASSIGN mv_subscreen->* TO <lv_subscreen>.
  IF  mv_classname = sv_class_name_oip
  AND lv_active = abap_true.
    mv_view_mode = /scmb/if_constant=>sc_form_view.
    <lv_subscreen> = is_definition-v_dynpro_form.
    ms_toolbar-v_form_view = abap_true.
  ELSEIF is_definition-v_dynpro_list IS INITIAL
     AND is_definition-v_dynpro_form IS NOT INITIAL.
    IF mv_classname = sv_class_name_oip.
      ASSERT ID /scmb/pattern_framework CONDITION 1 = 0.
    ENDIF.
    mv_view_mode = /scmb/if_constant=>sc_form_view.
    mv_fv_only = abap_true.
    <lv_subscreen> = is_definition-v_dynpro_form.
    ms_toolbar-v_form_view = abap_true.
    ms_toolbar-v_inactive  = abap_true.
  ELSEIF is_definition-v_dynpro_list IS NOT INITIAL AND
         is_definition-v_dynpro_form IS INITIAL.
    mv_view_mode = /scmb/if_constant=>sc_table_view.
    <lv_subscreen> = is_definition-v_dynpro_list.
    ms_toolbar-v_inactive  = abap_true.
  ELSEIF is_definition-v_dynpro_list IS INITIAL AND
         is_definition-v_dynpro_form IS INITIAL.
    ASSERT ID /scmb/pattern_framework CONDITION 1 = 0.
  ELSE.
    mv_view_mode = /scmb/if_constant=>sc_table_view.
    <lv_subscreen> = is_definition-v_dynpro_list.
  ENDIF.

* Fill ALV structure ---------------------------------------------------
  MOVE-CORRESPONDING is_definition TO ms_definition_alv.
  ms_definition_alv-s_properties = is_definition-s_alv_properties.
  ms_definition_alv-s_layout-smalltitle =
    is_definition-s_alv_title-v_smalltitle.
  ms_definition_alv-s_layout-grid_title =
   is_definition-s_alv_title-v_text.

* Set handlers ---------------------------------------------------------
  SET HANDLER:
    on_check_for_erroneous_data,
    on_refresh_display,
    on_clear_focus,
    on_set_relations    FOR ALL INSTANCES,
    on_clear_lock_table FOR ALL INSTANCES.

* Register at attribute handler ----------------------------------------
  ss_data-o_attribute_handler->register_aspect(
    EXPORTING
      iv_aspect_name              = mv_aspect_name
      io_aspect_reference         = me
      it_field_mapping            = is_definition-t_field_mapping
      it_aspect_composition       = is_definition-t_aspect_composition
    EXCEPTIONS
      aspect_must_be_specified    = 1
      reference_must_be_specified = 2
      aspect_already_registered   = 3
      OTHERS                      = 4 ).
  IF sy-subrc <> 0.
    ASSERT ID /scmb/pattern_framework CONDITION 1 = 0.
  ENDIF.

* Register at message handler ------------------------------------------
  so_message_handler->register_aspect(
    iv_aspect             = mv_aspect_name
    io_aspect             = me
    iv_structure          = is_definition-v_keys
    it_field_mapping      = is_definition-t_field_mapping
    it_aspect_composition = is_definition-t_aspect_composition ).

* For text patterns additional coding is necessary ---------------------
  CHECK mv_category = /scmb/if_constant=>sc_cat_text.
  mv_container_text = is_definition-v_container_text.

ENDMETHOD.


METHOD constructor_text .

  create_data( ).

  FIELD-SYMBOLS:
    <ls_table>  TYPE ANY.

* Create text control and container ------------------------------------
  IF  NOT mo_container_text IS BOUND
  AND NOT mv_container_text IS INITIAL.

    ASSIGN ms_table->* TO <ls_table>.
    CREATE DATA ms_fv LIKE <ls_table>.

*   Create container for text control
    CREATE OBJECT mo_container_text
      EXPORTING
        container_name = mv_container_text.

*   Create text control
    CREATE OBJECT mo_text
      EXPORTING
        parent = mo_container_text.

*   Set read only mode, hide toolbar
    mo_text->set_readonly_mode( 1 ).
    mo_text->set_toolbar_mode( 0 ).

  ELSE.
    ASSERT ID /scmb/pattern_framework CONDITION 1 = 0.
  ENDIF.

ENDMETHOD.


METHOD continue_action .

  DATA:
    lv_text    TYPE  char80,
    lv_answer  TYPE  c.

* Set text for popup ---------------------------------------------------
  IF NOT iv_text IS INITIAL.
    lv_text = iv_text.
  ELSE.
    lv_text = text-006.
  ENDIF.

* Call popup -----------------------------------------------------------
  CALL FUNCTION 'POPUP_TO_CONFIRM'
    EXPORTING
      text_question         = text-006
      default_button        = /scmb/if_constant=>sc_no
      display_cancel_button = abap_false
    IMPORTING
      answer                = lv_answer
    EXCEPTIONS
      text_not_found        = 1
      OTHERS                = 2.

* Export answer --------------------------------------------------------
  IF lv_answer = /scmb/if_constant=>sc_yes.
    ev_continue = abap_true.
  ELSE.
    ev_continue = abap_false.
  ENDIF.

ENDMETHOD.


METHOD convert_data_for_alv .

  FIELD-SYMBOLS:
    <lt_alv>     TYPE  STANDARD TABLE,
    <ls_alv>     TYPE  data,
    <ls_aspect>  TYPE  data.

  create_data( ).

  ASSIGN:
    mt_alv->* TO <lt_alv>,
    ms_alv->* TO <ls_alv>.

  CLEAR <ls_alv>.

* Move aspect table content to ALV table -------------------------------
  LOOP AT it_aspect ASSIGNING <ls_aspect>.
    MOVE-CORRESPONDING <ls_aspect> TO <ls_alv>.
    INSERT <ls_alv> INTO TABLE <lt_alv>.
  ENDLOOP.

ENDMETHOD.


METHOD create_alv.

  DATA:
    lo_struc  TYPE REF TO  cl_abap_structdescr.

  FIELD-SYMBOLS:
    <ls_fcat>  TYPE   lvc_s_fcat.

* Create ALV and container only once -----------------------------------
  CHECK NOT mo_container_alv IS BOUND.

* Create container and ALV grid ----------------------------------------
  CREATE OBJECT mo_container_alv
    EXPORTING
      container_name = ms_definition_alv-v_container.
  CREATE OBJECT mo_alv_grid
    EXPORTING
      i_parent      = mo_container_alv
      i_appl_events = abap_true.

* Fill layout structure -----------------------------------------------
  ms_definition_alv-s_layout-stylefname = 'CELLTAB'.
  ms_definition_alv-s_layout-sel_mode   = 'D'.
  ms_definition_alv-s_layout-no_rowins  = abap_true.
  ms_definition_alv-s_layout-no_rowmove = abap_true.
  IF ms_definition_alv-v_disable_colopt = abap_true.
    ms_definition_alv-s_layout-cwidth_opt = abap_false.
  ELSE.
    ms_definition_alv-s_layout-cwidth_opt = abap_true.
  ENDIF.

* Enable ALV layout saving ---------------------------------------------
  IF NOT ms_definition_alv-v_alv_handle IS INITIAL.
*   Safety step, ensure that sv_repid is filled (if not use sy-cprog)
    IF sv_repid is initial.
      sv_repid = sy-cprog.
    endif.
    ms_definition_alv-s_disvariant-report = sv_repid.
    ms_definition_alv-s_disvariant-handle =
      ms_definition_alv-v_alv_handle.
  ENDIF.

* Create field catalogue -----------------------------------------------
  CALL FUNCTION 'LVC_FIELDCATALOG_MERGE'
    EXPORTING
      i_structure_name = ms_definition_alv-v_aspect_structure
    CHANGING
      ct_fieldcat      = ms_definition_alv-t_fieldcat.

* Change fieldcat (settings for all columns!) --------------------------
  LOOP AT ms_definition_alv-t_fieldcat ASSIGNING <ls_fcat>.
*  Disable empty field check
*  Note: if a field has domain values without 'space' as valid value
*        the ALV will consider it as an error if such a field contains
*        a valid value and the user deletes this value => inital = error
*        Fixed by value X or B for NO_INIT_CH
*  Note: initial values are taken into account by ALV for search helps,
*        this is a different behaviour than on dynpros
*        Fixed by value F or B for NO_INIT_CH
*  ==>   Value B is set per default
    <ls_fcat>-no_init_ch = 'B'.
*  're-hide' fields (ALV automatically hides all columns over 90)
    IF sy-tabix GT 90.
      <ls_fcat>-no_out = abap_false.
    ENDIF.
  ENDLOOP.

* Exclude ALV toolbar buttons ------------------------------------------
  APPEND:
   mo_alv_grid->mc_fc_refresh  TO ms_definition_alv-t_toolbar_excluding,
   mo_alv_grid->mc_fc_graph    TO ms_definition_alv-t_toolbar_excluding,
   mo_alv_grid->mc_fc_info     TO ms_definition_alv-t_toolbar_excluding,
   mo_alv_grid->mc_fc_loc_undo TO ms_definition_alv-t_toolbar_excluding,
   mo_alv_grid->mc_fc_loc_cut  TO ms_definition_alv-t_toolbar_excluding,
   mo_alv_grid->mc_fc_loc_copy TO ms_definition_alv-t_toolbar_excluding,
   mo_alv_grid->mc_fc_print    TO ms_definition_alv-t_toolbar_excluding,
   mo_alv_grid->mc_fc_check    TO ms_definition_alv-t_toolbar_excluding,
   mo_alv_grid->mc_mb_paste    TO ms_definition_alv-t_toolbar_excluding,
   mo_alv_grid->mc_mb_view     TO ms_definition_alv-t_toolbar_excluding.

* Check if the aspect has a related aspect
  READ TABLE ss_data-t_aspect_mapping
    WITH KEY v_aspect_sup = mv_aspect_name
    TRANSPORTING NO FIELDS.
  IF sy-subrc NE 0.
    APPEND cl_gui_alv_grid=>mc_fc_detail
      TO ms_definition_alv-t_toolbar_excluding.
  ENDIF.

* Get description object -----------------------------------------------
  lo_struc ?= cl_abap_typedescr=>describe_by_name(
    ms_definition_alv-v_aspect_structure ).

* Change field catalogue -----------------------------------------------
  change_fieldcat(
    EXPORTING io_struc           = lo_struc
              it_column_pos      = ms_definition_alv-t_column_position
              it_emph_fields     = ms_definition_alv-t_emphasize_column
              it_exclude_fields  = ms_definition_alv-t_exclude_fields
              it_hide_fields     = ms_definition_alv-t_hide_fields
              it_key_fields      = ms_definition_alv-t_key_fields
              it_col_properties  = ms_definition_alv-t_column_properties
              it_checkbox_fields = ms_definition_alv-t_checkbox_fields
              it_icon_fields     = ms_definition_alv-t_icon_fields
    CHANGING  ct_fieldcat        = ms_definition_alv-t_fieldcat ).

* Register F4 Help -----------------------------------------------------
  register_alv_f4(
    EXPORTING io_struc = lo_struc ).

* Make grid editable and register <enter> edit event -------------------
  mo_alv_grid->set_ready_for_input( 1 ).
  mo_alv_grid->register_edit_event( cl_gui_alv_grid=>mc_evt_enter ).

* Set handlers ---------------------------------------------------------
  SET HANDLER:
    on_changed_data_checks,
    on_execute_update,
    on_process_fcontrol,
    on_alv_toolbar           FOR mo_alv_grid,
    on_f4                    FOR mo_alv_grid,
    on_user_command          FOR mo_alv_grid,
    on_data_changed          FOR mo_alv_grid,
    on_before_user_command   FOR mo_alv_grid,
    on_data_changed_finished FOR mo_alv_grid,
    on_double_click          FOR mo_alv_grid.

ENDMETHOD.


METHOD create_data.

  DATA:
    lo_table_descr  TYPE REF TO  cl_abap_tabledescr,
    lo_struc        TYPE REF TO  cl_abap_structdescr,
    lo_struc_keys   TYPE REF TO  cl_abap_structdescr,
    lt_components   TYPE         cl_abap_structdescr=>component_table,
    lt_fields       TYPE         ddfields,
    lt_add_keys     TYPE         lvc_t_fnam.

  IF NOT mt_keys_sel IS BOUND.
*   Create data typization dynamically ---------------------------------
    CREATE DATA:
      mt_keys_sel   TYPE TABLE OF (ms_create_data-keys),
      mt_keys_work  TYPE TABLE OF (ms_create_data-keys),
      mt_keys_error TYPE TABLE OF (ms_create_data-keys),
      mt_keys_lock  TYPE TABLE OF (ms_create_data-keys),
      mt_keys_del   TYPE TABLE OF (ms_create_data-keys),
      ms_keys       TYPE          (ms_create_data-keys),
      ms_keys_comp  TYPE          (ms_create_data-keys),
      ms_fv         TYPE          (ms_create_data-aspect),
      ms_aspect     TYPE          (ms_create_data-aspect),
      mt_aspect     TYPE TABLE OF (ms_create_data-aspect),
      mt_delete     TYPE TABLE OF (ms_create_data-aspect),
      mt_update     TYPE TABLE OF (ms_create_data-aspect).

*   Create relation key table (fake for OIP)
    CASE mv_classname.
      WHEN sv_class_name_oip.
        CREATE DATA:
          mt_keys_rel  TYPE TABLE OF (ms_create_data-keys),
          ms_keys_rel  TYPE          (ms_create_data-keys).
      WHEN sv_class_name_odp1 OR sv_class_name_odp2.
        CREATE DATA:
          mt_keys_rel  TYPE TABLE OF (ms_create_data-keys_r),
          ms_keys_rel  TYPE          (ms_create_data-keys_r).
      WHEN OTHERS.
        ASSERT ID /scmb/pattern_framework CONDITION 1 = 0.
    ENDCASE.

*   Create field control structures and tables -------------------------
    APPEND:
      sc_component_field    TO lt_add_keys,
      sc_component_property TO lt_add_keys.
*   Get components and fields of key aspect
    lo_struc_keys ?=
      cl_abap_typedescr=>describe_by_name( ms_create_data-keys ).
    lt_components = lo_struc_keys->get_components( ).
    lt_fields = lo_struc_keys->get_ddic_field_list( ).
*   Create handles and data types
    lo_struc = get_fct_struc_handle( lt_components ).
    CREATE DATA ms_fcontrol TYPE HANDLE lo_struc.
    lo_table_descr = get_table_handle(
      it_fields          = lt_fields
      io_strucdescr      = lo_struc
      iv_tablekind       = cl_abap_tabledescr=>tablekind_sorted
      iv_unique_key      = abap_true
      it_additional_keys = lt_add_keys ).
    CREATE DATA mt_fcontrol TYPE HANDLE lo_table_descr.

*   Create ALV structures and tables -----------------------------------
    lo_struc =
      get_alv_struc_handle( ms_create_data-aspect ).
    CREATE DATA ms_alv TYPE HANDLE lo_struc.
    lo_table_descr = get_table_handle(
      it_fields     = lt_fields
      io_strucdescr = lo_struc
      iv_tablekind  = cl_abap_tabledescr=>tablekind_std ).
    CREATE DATA:
      mt_alv        TYPE HANDLE lo_table_descr,
      mt_alv_backup TYPE HANDLE lo_table_descr.
  ENDIF.

ENDMETHOD.


METHOD create_picture.

  DATA:
    lv_alt_text  TYPE  string,
    lt_img_blob  TYPE  w3mimetabtype.

* Note: for performance reason the picture controls are not created
*       anymore, however the coding remains if required later on
  CHECK 1 = 0.
  CHECK NOT co_container IS BOUND.

* Create container and picture control ---------------------------------
  CREATE OBJECT co_container
    EXPORTING
      container_name = iv_container_name.
  CREATE OBJECT co_picture
    EXPORTING
      parent = co_container.

* Set the display mode to 'STRETCH' ------------------------------------
  co_picture->set_display_mode( co_picture->display_mode_stretch ).

* Get the URL ----------------------------------------------------------
  IF mv_url IS INITIAL.
    IMPORT table1 = lt_img_blob
      FROM DATABASE /scmb/sapgui_gif(aa) ID 'bar'.
    CALL FUNCTION 'DP_CREATE_URL'
      EXPORTING
        type     = 'image/gif'
        subtype  = 'gif'
*       size     =
        lifetime = cndp_lifetime_transaction
      TABLES
        data     = lt_img_blob
      CHANGING
        url      = mv_url.
  ENDIF.

* Set alternative text for screen-reader -------------------------------
  lv_alt_text = text-010.
  co_picture->set_alt_text(
    EXPORTING  text   = lv_alt_text
    EXCEPTIONS ERROR  = 1
               others = 2 ).
  IF sy-subrc <> 0.
    add_system_message( ).
  ENDIF.

* Load the picture -----------------------------------------------------
  co_picture->load_picture_from_url( EXPORTING url = mv_url ).

ENDMETHOD.


METHOD create_toolbar.

  DATA:
    ls_tab_counter  TYPE  /scmb/s_tab_counter.

* Create toolbar only once ---------------------------------------------
  CHECK NOT mo_toolbar IS BOUND.

* Set flag for adding OIP layout functionality -------------------------
* Note: offered functionality is restricted - up to now - to allow the
*       user to set a flag that will switch the OIP to the form view in
*       case of queries with exactly one result line. Therefore this
*       button is only displayed for UIs with exactly one OIP.
*       If this layout is enhanced by additional functionality the
*       button should also be displayed for UIs with multiple OIPs
  IF ss_data-o_esdus_manager IS BOUND.
    IF mv_classname = sv_class_name_oip.
      READ TABLE ss_data-t_tab_counter
        WITH KEY v_classname = sv_class_name_oip
        INTO ls_tab_counter.
      IF ls_tab_counter-v_counter = 1.
        ms_toolbar-v_add_layout = abap_true.
      ENDIF.
    ENDIF.
  ENDIF.

* Create toolbar -------------------------------------------------------
  CREATE OBJECT mo_toolbar
    EXPORTING
      is_toolbar_def = ms_toolbar.

* Set handlers ---------------------------------------------------------
  SET HANDLER:
    on_toggle_view FOR mo_toolbar,
    on_pager_up    FOR mo_toolbar,
    on_pager_down  FOR mo_toolbar.

ENDMETHOD.


METHOD delete .

  DATA:
    lv_failed         TYPE  abap_char1,
    lv_rcodes_failed  TYPE  abap_char1,
    lt_return_codes   TYPE  /scmb/t_sp_return_code,
    ls_return_codes   TYPE  /scmb/s_sp_return_code,
    lv_rejected       TYPE  boole_d,
    lv_cancel         TYPE  abap_char1,
    lv_lines          TYPE  i,
    lv_text           TYPE  string.                   "#EC NEEDED

  FIELD-SYMBOLS:
    <lt_alv>         TYPE  STANDARD TABLE,
    <lt_keys_del>    TYPE  STANDARD TABLE,
    <lt_keys_sel>    TYPE  STANDARD TABLE,
    <lt_keys_rel>    TYPE  STANDARD TABLE,
    <lt_keys_work>   TYPE  STANDARD TABLE,
    <lt_keys_error>  TYPE  STANDARD TABLE,
    <lt_delete>      TYPE  STANDARD TABLE,
    <lt_update>      TYPE  STANDARD TABLE,
    <ls_update>      TYPE  ANY,
    <ls_alv>         TYPE  ANY,
    <ls_keys>        TYPE  ANY,
    <ls_table>       TYPE  ANY.

  create_data( ).

  ASSIGN:
    mt_alv->*        TO <lt_alv>,
    ms_alv->*        TO <ls_alv>,
    mt_keys_rel->*   TO <lt_keys_rel>,
    mt_keys_sel->*   TO <lt_keys_sel>,
    mt_keys_del->*   TO <lt_keys_del>,
    mt_keys_work->*  TO <lt_keys_work>,
    mt_keys_error->* TO <lt_keys_error>,
    mt_delete->*     TO <lt_delete>,
    mt_update->*     TO <lt_update>,
    ms_aspect->*     TO <ls_update>,
    ms_keys->*       TO <ls_keys>,
    ms_table->*      TO <ls_table>.

  CLEAR:
    ev_deleted,
    <lt_keys_work>,
    <lt_delete>.

* View dependent coding ------------------------------------------------
  CASE mv_view_mode.
    WHEN /scmb/if_constant=>sc_table_view.
*     Check if saving is necessary
      CHECK check_selection_change( ) = abap_true.
      IF mv_selection_changed = abap_true  AND
        mv_classname = sv_class_name_oip.
        IF check_for_unsaved_data( abap_false ) = abap_false.
          RETURN.
        ENDIF.
      ENDIF.
      lv_cancel = check_table_view_selection(
        iv_no_message   = abap_true
        iv_index_filled = abap_true ).
      IF <lt_keys_sel> IS INITIAL.
        MESSAGE s007(/scmb/esa_emulation) INTO lv_text.
        add_system_message( ).
        RETURN.
      ENDIF.
      <lt_keys_work> = <lt_keys_sel>.
    WHEN /scmb/if_constant=>sc_form_view.
      IF <ls_table> IS INITIAL.
        MESSAGE s007(/scmb/esa_emulation) INTO lv_text.
        add_system_message( ).
        RETURN.
      ENDIF.
      MOVE-CORRESPONDING <ls_table> TO <ls_keys>.
      APPEND <ls_keys> TO <lt_keys_work>.
      lv_cancel = select( <lt_keys_work> ).
  ENDCASE.

* Exit if SELECT resulted in a REJECTED --------------------------------
  CHECK lv_cancel NE sc_cancel_rejected.

* Fill/clear ODP -------------------------------------------------------
  DESCRIBE TABLE <lt_keys_work> LINES lv_lines.
  IF lv_lines EQ 0 OR (
    mv_multiple_selection = abap_false AND lv_lines > 1 ).
    RAISE EVENT initialize_odp
      EXPORTING iv_class_name  = mv_classname
                iv_aspect_name = mv_aspect_name.
  ELSE.
    RAISE EVENT trigger_sbr
      EXPORTING iv_class_name        = mv_classname
                is_relation_key      = mt_keys_work
                iv_aspect_name       = mv_aspect_name
                iv_selection_changed = mv_selection_changed.
  ENDIF.

* React on deleted selected lines --------------------------------------
  IF lv_cancel = sc_cancel_delete.
    MESSAGE e008(/scmb/esa_emulation) INTO lv_text.
    add_system_message( ).
    RETURN.
  ENDIF.

* Remove lines from update table, that will be deleted -----------------
* Buffer them if deletion fails!
  LOOP AT <lt_update> INTO <ls_update>.
    MOVE-CORRESPONDING <ls_update> TO <ls_keys>.
    READ TABLE <lt_keys_work> FROM <ls_keys> TRANSPORTING NO FIELDS.
    IF sy-subrc EQ 0.
      DELETE <lt_update>.
      APPEND <ls_update> TO <lt_delete>.
    ENDIF.
  ENDLOOP.

* Remove update lines from related aspects -----------------------------
  IF NOT <lt_keys_work> IS INITIAL.
    modify_related_updates( iv_mode = 'B' ).
  ENDIF.

* Execute updates ------------------------------------------------------
  RAISE EVENT execute_update.

* Lock superior object -------------------------------------------------
  IF NOT is_lock_superior_object IS INITIAL
    AND NOT <lt_keys_rel> IS INITIAL.
    IF trigger_lock_superior_obj( is_lock_superior_object ) = abap_true.
      RETURN.
    ENDIF.
  ENDIF.

* Implicit locking -----------------------------------------------------
  IF NOT is_implicit_locking IS INITIAL.
    implicit_locking(
      EXPORTING is_locking       = is_implicit_locking
      IMPORTING ev_cancel        = lv_cancel
                ev_rcodes_failed = lv_rcodes_failed
      CHANGING  ct_keys          = <lt_keys_work> ).
    IF lv_cancel = abap_true
    OR lv_rcodes_failed = sc_failed_completly.
      RETURN.
    ENDIF.
  ENDIF.

* Call service provider delete method ----------------------------------
* Clear DELETE IMPORTING parameters
  CLEAR:
    lv_rejected,
    lt_return_codes.
  CALL METHOD ss_data-o_sp->('DELETE')
    EXPORTING
      inkeys       = <lt_keys_work>
      aspect       = mv_aspect_name
    IMPORTING
      rejected     = lv_rejected
      return_codes = lt_return_codes.
  lv_failed = check_rcodes(
    it_inkeys = <lt_keys_work>
    it_rcodes = lt_return_codes ).

* With 'FAILED' marked lines must not be removed from the UI -----------
* keys of successfully deleted lines have to be buffered
* Restore update lines
  CLEAR <lt_update>.
  SORT lt_return_codes BY inrecord DESCENDING.
  LOOP AT lt_return_codes INTO ls_return_codes
    WHERE failed = abap_true.
    READ TABLE <lt_keys_work> INTO <ls_keys>
      INDEX ls_return_codes-inrecord.
    MOVE-CORRESPONDING <ls_keys> TO <ls_update>.
    READ TABLE <lt_delete> FROM <ls_update> INTO <ls_update>.
    IF sy-subrc EQ 0.
      APPEND <ls_update> TO <lt_update>.
    ENDIF.
    modify_related_updates( iv_mode = 'A' ).
    DELETE <lt_keys_work> INDEX ls_return_codes-inrecord.
  ENDLOOP.
  <lt_keys_del> = <lt_keys_work>.

* Evaluate export parameters -------------------------------------------
  IF lv_rejected = abap_true OR
     lv_failed = sc_failed_completly.
*   Do side effects
    CASE iv_sideeffect.
      WHEN /scmb/if_constant=>sc_se_undefined.
        set_undefined_se_flag( ).
      WHEN /scmb/if_constant=>sc_se_aspect.
        mv_do_sideeffect_aspect = abap_true.
    ENDCASE.
    RETURN.
  ELSEIF lv_failed = abap_false.
    ev_deleted = abap_true.
  ELSEIF lv_failed = sc_failed_partly.
    ev_deleted = sc_failed_partly.
  ENDIF.

* Set unsaved data flag ------------------------------------------------
  set_unsaved_data_flag( ).

* View dependent coding ------------------------------------------------
  CASE mv_view_mode.
    WHEN /scmb/if_constant=>sc_table_view.
*     Remove deleted lines from the UI and the sel. keys + error itab
      LOOP AT <lt_keys_work> INTO <ls_keys>.
        MOVE-CORRESPONDING <ls_keys> TO <ls_alv>.
        DELETE TABLE:
          <lt_keys_sel>   FROM <ls_keys>,
          <lt_alv>        FROM <ls_alv>,
          <lt_keys_error> FROM <ls_keys>.
      ENDLOOP.
      CLEAR <ls_table>.
      mv_refresh_necessary = sc_refresh_normal.
      RAISE EVENT initialize_odp
        EXPORTING iv_class_name  = mv_classname
                  iv_aspect_name = mv_aspect_name.
    WHEN /scmb/if_constant=>sc_form_view.
      IF NOT <lt_keys_work> IS INITIAL.
*       Method will remove ALV data and key selection, too
        get_data_for_form_view( sc_delete ).
      ENDIF.
  ENDCASE.

* Do side effects ------------------------------------------------------
  CASE iv_sideeffect.
    WHEN /scmb/if_constant=>sc_se_outrecords.
*     Not possible for delete method of service provider
    WHEN /scmb/if_constant=>sc_se_undefined.
      set_undefined_se_flag( ).
    WHEN /scmb/if_constant=>sc_se_aspect.
      mv_do_sideeffect_aspect = abap_true.
    WHEN /scmb/if_constant=>sc_se_none.
*     Do nothing!
  ENDCASE.

* Refresh immediately --------------------------------------------------
  IF iv_immediate_refresh = abap_true.
    soft_refresh( ).
  ENDIF.

ENDMETHOD.


METHOD display_alv_line_details.

  DATA:
    lv_text        TYPE           string,
    lv_index       TYPE           numc10,
    ls_row         TYPE           lvc_s_row,
    ls_msg         TYPE           symsg,
    lt_sval        TYPE TABLE OF  sval,
    ls_sval        TYPE           sval,
    lv_returncode  TYPE           c,
    lv_alv_detail  TYPE           /scmb/s_alv_line_details,
    lv_lines       TYPE           i,
    lt_index_rows  TYPE           lvc_t_row.

  FIELD-SYMBOLS:
    <lt_alv>  TYPE  STANDARD TABLE.

  create_data( ).

  ASSIGN:
    mt_alv->* TO <lt_alv>.

* Get number of lines --------------------------------------------------
  DESCRIBE TABLE <lt_alv> LINES lv_lines.
  lv_alv_detail-number_all_lines = lv_lines.
  lt_index_rows = get_selected_rows( ).
  DESCRIBE TABLE lt_index_rows LINES lv_lines.
  lv_alv_detail-number_selected_lines = lv_lines.

* Fill table for popup -------------------------------------------------
  CLEAR ls_sval.
  ls_sval-tabname    = '/SCMB/S_ALV_LINE_DETAILS'.
  ls_sval-fieldname  = 'NAVIGATE_TO_LINE'.
  APPEND ls_sval TO lt_sval.
  CLEAR ls_sval.
  ls_sval-tabname    = '/SCMB/S_ALV_LINE_DETAILS'.
  ls_sval-fieldname  = 'NUMBER_ALL_LINES'.
  ls_sval-field_attr = '02'.
  ls_sval-value      = lv_alv_detail-number_all_lines.
  APPEND ls_sval TO lt_sval.
  CLEAR ls_sval.
  ls_sval-tabname    = '/SCMB/S_ALV_LINE_DETAILS'.
  ls_sval-fieldname  = 'NUMBER_SELECTED_LINES'.
  ls_sval-field_attr = '02'.
  ls_sval-value      = lv_alv_detail-number_selected_lines.
  APPEND ls_sval TO lt_sval.

* Call popup -----------------------------------------------------------
  CALL FUNCTION 'POPUP_GET_VALUES'
    EXPORTING
      popup_title     = text-007
      start_column    = '15'
      start_row       = '5'
    IMPORTING
      returncode      = lv_returncode
    TABLES
      fields          = lt_sval
    EXCEPTIONS
      error_in_fields = 1
      OTHERS          = 2.
  IF sy-subrc <> 0.
    MOVE-CORRESPONDING sy TO ls_msg.
    so_message_handler->add_system_message( ls_msg ).
    RETURN.
  ENDIF.
  CHECK lv_returncode NE 'A'.

* Check if navigation is required --------------------------------------
  READ TABLE lt_sval INTO ls_sval
    WITH KEY fieldname = 'NAVIGATE_TO_LINE'.
  CHECK NOT ls_sval-value IS INITIAL.
  IF ls_sval-value > lv_alv_detail-number_all_lines.
    MESSAGE e023(/scmb/esa_emulation) INTO lv_text.
    add_system_message( ).
  ENDIF.
  lv_index = ls_sval-value.
  ls_row-index = lv_index.
  mo_alv_grid->set_current_cell_via_id(
    EXPORTING is_row_id = ls_row ).

ENDMETHOD.


METHOD do_sideeffect_aspect .

* NOTE: we refresh the pattern for its actual key! If user has changed
* the selection in the superior pattern this will have no effect!

* Do sideeffect depending on the pattern
  CASE mv_classname.
    WHEN sv_class_name_odp1 OR sv_class_name_odp2.
      select_by_relation(
        iv_keep_selection  = abap_true
        iv_keep_error_keys = abap_true ).
    WHEN sv_class_name_oip.
      refresh_oip( abap_false ).
  ENDCASE.

ENDMETHOD.


METHOD do_sideeffect_outrecords .

* Update the ALV table -------------------------------------------------
  modify_alv_table( it_aspect ).
  mv_refresh_necessary = sc_refresh_normal.

* Update form view -----------------------------------------------------
  IF mv_view_mode = /scmb/if_constant=>sc_form_view.
    modify_form_view( ).
  ENDIF.

ENDMETHOD.


METHOD do_sideeffect_undefined .

  RAISE EVENT undefined_sideeffect.

ENDMETHOD.


METHOD end_of_initialization.

  DATA:
    lv_type TYPE  abap_char1.

* Check user default values --------------------------------------------
  IF NOT ss_data-s_default_values-v_identifier IS INITIAL.
    /scmb/cl_ees_defaults=>check(
     EXCEPTIONS not_initialized = 1
                OTHERS          = 2 ).
    IF sy-subrc <> 0.
      ASSERT ID /scmb/pattern_framework CONDITION 1 = 0.
    ENDIF.
  ENDIF.

* Raise events ---------------------------------------------------------
  RAISE EVENT:
    end_of_init,
    default_data_changed.

* Trigger cleanup -----------------------------------------------------
  CALL METHOD ss_data-o_sp->('CLEANUP')
    EXPORTING
      reason = /scmb/if_sp_transaction=>sc_cleanup_end.

* Show message log if warning or error messages occured ----------------
  IF iv_no_message_display = abap_false.
    lv_type = so_message_handler->check_log( ).
    IF lv_type = /scmb/if_constant=>sc_message_type_warning
    OR lv_type = /scmb/if_constant=>sc_message_type_error.
      so_message_handler->display_messages( ).
    ENDIF.
  ENDIF.

ENDMETHOD.


METHOD end_of_pai.

  RAISE EVENT clear_focus.
  RAISE EVENT execute_update.
  RAISE EVENT end_of_queue.
  CALL METHOD ss_data-o_sp->('END_OF_QUEUE').
  RAISE EVENT process_fcontrol.
  RAISE EVENT refresh_display.

ENDMETHOD.


METHOD event_exit.
                                                            "#EC NEEDED
ENDMETHOD.


METHOD exit .

* Check if called by framework transaction, if not (e.g. during query
* maintenance) exit the method and indicate success --------------------
  IF ss_data-t_mapper IS INITIAL.
    ev_continue = abap_true.
    RETURN.
  ENDIF.

* Trigger OIP to check for save popup relevance ------------------------
  RAISE EVENT execute_update.
  RAISE EVENT exit_framework
    EXPORTING iv_refresh = iv_refresh.
  ev_continue = ss_data-v_continue.
  CLEAR ss_data-v_continue.

* Call CLEANUP method of service provider ------------------------------
* Note: if already saved or popup answered with yes, this cleanup will
*       now be executed a second time -> should not be critical;
*       call is necessary to ensure that cleanup is executed
  IF ev_continue = abap_true.
    CALL METHOD ss_data-o_sp->('CLEANUP')
      EXPORTING
        reason = /scmb/if_sp_transaction=>sc_cleanup_end.
  ENDIF.

* Refresh UI immediately -----------------------------------------------
  IF  iv_refresh_immediate = abap_true
  AND ev_continue          = abap_true.
    RAISE EVENT end_of_queue.
  ENDIF.

ENDMETHOD.


METHOD fill_form_view.

  DATA:
    lt_index_rows  TYPE  lvc_t_row,
    ls_index_rows  TYPE  lvc_s_row,
    lv_index       TYPE  lvc_index,
    lv_lines       TYPE  i.

  FIELD-SYMBOLS:
    <lt_keys_sel>  TYPE  STANDARD TABLE,
    <lt_alv>       TYPE  STANDARD TABLE,
    <ls_alv>       TYPE  ANY,
    <ls_aspect>    TYPE  ANY,
    <ls_table>     TYPE  ANY.

  create_data( ).

  ASSIGN:
    mt_keys_sel->* TO <lt_keys_sel>,
    mt_alv->*      TO <lt_alv>,
    ms_alv->*      TO <ls_alv>,
    ms_aspect->*   TO <ls_aspect>,
    ms_table->*    TO <ls_table>.

  DESCRIBE TABLE <lt_alv> LINES lv_lines.
  DO lv_lines TIMES.
    lv_index = sy-index.
    ls_index_rows-index = lv_index.
    APPEND ls_index_rows TO lt_index_rows.
  ENDDO.

  IF mv_dynpro_list->* IS INITIAL.
*   Select all
    set_selected_rows( lt_index_rows ).
    set_keys_for_selection( lt_index_rows ).
*   Try to display previously displayed line
    IF NOT <ls_table> IS INITIAL.
      MOVE-CORRESPONDING <ls_table> TO <ls_alv>.
      READ TABLE <lt_alv> FROM <ls_alv> INTO <ls_alv>.
      IF sy-subrc NE 0.
        CLEAR <ls_table>.
      ENDIF.
    ENDIF.
  ELSE.
*   Select rows dependent on previous selection
    IF <lt_keys_sel> IS INITIAL.
      CLEAR <ls_table>.
      set_selected_rows( lt_index_rows ).
      set_keys_for_selection( lt_index_rows ).
    ELSE.
      select_rows_for_keytable( ).
      IF NOT <ls_table> IS INITIAL.
        MOVE-CORRESPONDING <ls_table> TO <ls_alv>.
        READ TABLE <lt_alv> FROM <ls_alv> INTO <ls_alv>.
        IF sy-subrc NE 0.
          CLEAR <ls_table>.
        ENDIF.
      ENDIF.
    ENDIF.
  ENDIF.
  get_data_for_form_view( ).

ENDMETHOD.


METHOD fill_text_edit_control.

  DATA:
    lt_text_itf    TYPE  tline_tab,
    lt_text_ascii  TYPE  tdtab_c132.

* Get import parameter -------------------------------------------------
  lt_text_itf = it_text.

  CALL FUNCTION 'CONVERT_ITF_TO_ASCII'
    IMPORTING
      c_datatab         = lt_text_ascii
    TABLES
      itf_lines         = lt_text_itf
    EXCEPTIONS
      invalid_tabletype = 1
      OTHERS            = 2.
  IF sy-subrc <> 0.
    ASSERT ID /scmb/pattern_framework CONDITION 1 = 0.
  ENDIF.

  mo_text->set_text_as_r3table( lt_text_ascii ).

ENDMETHOD.


METHOD get_active_tab.

  DATA:
    ls_active_tab  TYPE  /scmb/s_active_tabstrips.

  CHECK mv_relation_active = abap_true.

  READ TABLE ss_data-t_active_tab INTO ls_active_tab
    WITH KEY v_classname         = mv_classname
             v_superior_relation = mv_superior_aspect.
  ev_active_tab = ls_active_tab-v_active_tabstrip.

ENDMETHOD.


METHOD get_alv_struc_handle.

  DATA:
    lo_strucdescr  TYPE REF TO   cl_abap_structdescr,
    lo_tabledescr  TYPE REF TO   cl_abap_tabledescr,
    lt_comp        TYPE          cl_abap_structdescr=>component_table,
    ls_comp        LIKE LINE OF  lt_comp.

  lo_strucdescr ?= cl_abap_typedescr=>describe_by_name( iv_aspect ).
  lt_comp        = lo_strucdescr->get_components( ).
  lo_tabledescr ?= cl_abap_typedescr=>describe_by_name( sc_lvc_t_styl ).
  ls_comp-name = sc_component_celltab.
  ls_comp-type = lo_tabledescr.
  APPEND ls_comp TO lt_comp.
  eo_strucdescr ?= cl_abap_structdescr=>create(
    p_components = lt_comp
    p_strict     = abap_false ).

ENDMETHOD.


METHOD get_confirmed_selection .

  FIELD-SYMBOLS:
    <lt_alv>        TYPE  STANDARD TABLE,
    <lt_keys_sel>   TYPE  STANDARD TABLE,
    <ls_aspect>     TYPE  ANY,
    <ls_alv>        TYPE  ANY,
    <ls_keys>       TYPE  ANY.

  create_data( ).

  ASSIGN:
    mt_alv->*       TO <lt_alv>,
    ms_alv->*       TO <ls_alv>,
    mt_keys_sel->*  TO <lt_keys_sel>,
    ms_keys->*      TO <ls_keys>,
    ms_aspect->*    TO <ls_aspect>.

* Get data for selected keys -------------------------------------------
  CLEAR et_aspect.
  LOOP AT <lt_keys_sel> INTO <ls_keys>.
    MOVE-CORRESPONDING <ls_keys> TO <ls_alv>.
    READ TABLE <lt_alv> FROM <ls_alv> INTO <ls_alv>.
    MOVE-CORRESPONDING <ls_alv> TO <ls_aspect>.
    APPEND <ls_aspect> TO et_aspect.
  ENDLOOP.

ENDMETHOD.


METHOD get_cursor.

  DATA:
    lv_field(61)  TYPE  c.

  GET CURSOR FIELD lv_field.
  IF sy-subrc EQ 0.
    ss_cursor-field = lv_field.
    ss_cursor-dynnr = sy-dynnr.
    ss_cursor-repid = iv_repid.
  ENDIF.

ENDMETHOD.


METHOD get_data_for_form_view .

  DATA:
    lv_index   TYPE  sytabix,
    lv_lines   TYPE  i,
    lv_cancel  TYPE  abap_char1,
    lt_text    TYPE  tline_tab,
    ls_header  TYPE  thead.

  FIELD-SYMBOLS:
    <lt_alv>         TYPE  STANDARD TABLE,
    <lt_keys_sel>    TYPE  STANDARD TABLE,
    <lt_keys_work>   TYPE  STANDARD TABLE,
    <lt_keys_error>  TYPE  STANDARD TABLE,
    <lt_text>        TYPE  tline_tab,
    <ls_fv>          TYPE  ANY,
    <ls_keys>        TYPE  ANY,
    <ls_table>       TYPE  ANY,
    <ls_alv>         TYPE  ANY.

  create_data( ).

  ASSIGN:
    mt_alv->*        TO <lt_alv>,
    ms_alv->*        TO <ls_alv>,
    mt_keys_sel->*   TO <lt_keys_sel>,
    mt_keys_work->*  TO <lt_keys_work>,
    mt_keys_error->* TO <lt_keys_error>,
    ms_keys->*       TO <ls_keys>,
    ms_fv->*         TO <ls_fv>,
    ms_table->*      TO <ls_table>.

  CLEAR:
    <lt_keys_work>,
    <ls_alv>.


  DESCRIBE TABLE <lt_keys_sel> LINES lv_lines.
  IF lv_lines = '0'.
*   Nothing is selected -> show blank form and exit
    CLEAR:
      mt_fv_attributes,
      <ls_table>,
      <ls_fv>.
*   Send message to clear ODP
    RAISE EVENT initialize_odp
      EXPORTING iv_class_name  = mv_classname
                iv_aspect_name = mv_aspect_name.
    clear_text_control( ).
    set_pager_state( ).
    RETURN.
  ENDIF.

* Set default index ----------------------------------------------------
  lv_index = '1'.

* If form view is not empty index has to be determined
  IF NOT <ls_table> IS INITIAL.
*   Pattern was already in form view -> get "old" key
    MOVE-CORRESPONDING <ls_table> TO <ls_keys>.
    READ TABLE <lt_keys_sel>
      FROM <ls_keys>
      TRANSPORTING NO FIELDS.
    lv_index = sy-tabix.

*   Determine depending on used mode
    CASE iv_mode.
      WHEN sc_pager_up.
        lv_index = lv_index - 1.
      WHEN sc_pager_down.
        lv_index = lv_index + 1.
      WHEN sc_delete.
        DELETE TABLE:
          <lt_keys_sel>   FROM <ls_keys>,
          <lt_keys_error> FROM <ls_keys>.
        MOVE-CORRESPONDING <ls_keys> TO <ls_alv>.
        DELETE TABLE <lt_alv> FROM <ls_alv>.
        IF lv_index > 1.
          lv_index = lv_index - 1.
        ELSEIF NOT ( lv_index = 1 AND lv_lines > 1 ).
*         Last entity of list view selection was deleted
*         -> clear and exit
          CLEAR:
            mt_fv_attributes,
            <ls_table>,
            <ls_fv>.
          clear_text_control( ).
          RAISE EVENT initialize_odp
            EXPORTING iv_class_name  = mv_classname
                      iv_aspect_name = mv_aspect_name.
          set_pager_state( ).
          RETURN.
        ENDIF.
    ENDCASE.
  ENDIF.

* Read selected row and fill key table ---------------------------------
  READ TABLE <lt_keys_sel> INDEX lv_index INTO <ls_keys>.
  MOVE-CORRESPONDING <ls_keys> TO <ls_alv>.
  READ TABLE <lt_alv> FROM <ls_alv> INTO <ls_alv>.
  APPEND <ls_keys> TO <lt_keys_work>.

* Set the form view data -----------------------------------------------
  MOVE-CORRESPONDING <ls_alv> TO <ls_fv>.
  MOVE <ls_fv> TO <ls_table>.

* Fill textedit control (text pattern only) ----------------------------
  IF mv_category = /scmb/if_constant=>sc_cat_text.
*   Get header
    MOVE-CORRESPONDING <ls_alv> TO ls_header.
*   Get lines
    ASSIGN COMPONENT sc_component_text_lines
      OF STRUCTURE <ls_alv> TO <lt_text>.
    lt_text = <lt_text>.
*   Fill the text control
    fill_text_edit_control( lt_text ).
  ENDIF.

* SELECT of SP ---------------------------------------------------------
  lv_cancel = select( <lt_keys_work> ).
  CASE lv_cancel.
    WHEN sc_cancel_rejected.
      RETURN.
    WHEN sc_cancel_delete.
*     Get next data
      get_data_for_form_view( sc_delete ).
    WHEN sc_cancel_ok.
*     Continue
  ENDCASE.

* Initialize ODPs for pager up/down event ------------------------------
  IF iv_mode = sc_pager_up
  OR iv_mode = sc_pager_down
  OR iv_mode = sc_toggle_init.
    RAISE EVENT initialize_odp
      EXPORTING
        iv_class_name  = mv_classname
        iv_aspect_name = mv_aspect_name.
  ENDIF.

* Set the attributes for the formview ----------------------------------
  set_attributes_for_form_view( ).

* Check the selection for triggering ODP reads -------------------------
  check_form_view_selection( ).
  set_pager_state( ).

ENDMETHOD.


METHOD get_default_values.

  /scmb/cl_ees_defaults=>get(
    IMPORTING  es_values       = es_values
    EXCEPTIONS internal_error  = 1
               not_initialized = 2
               OTHERS          = 3 ).
  IF sy-subrc <> 0.
    ASSERT ID /scmb/pattern_framework CONDITION 1 = 0.
  ENDIF.

ENDMETHOD.


METHOD get_fct_struc_handle.

  DATA:
    lo_strucdescr  TYPE REF TO  cl_abap_structdescr,
    lt_comp        TYPE         cl_abap_structdescr=>component_table.

  lt_comp = it_components.
  IF st_comp_fct IS INITIAL.
    lo_strucdescr ?= cl_abap_typedescr=>describe_by_name( sc_fc_struc ).
    st_comp_fct = lo_strucdescr->get_components( ).
  ENDIF.
  APPEND LINES OF st_comp_fct TO lt_comp.
  eo_strucdescr ?= cl_abap_structdescr=>create(
    p_components = lt_comp
    p_strict     = abap_false ).

ENDMETHOD.


METHOD get_lines.

  FIELD-SYMBOLS:
    <lt_alv>     TYPE  STANDARD TABLE,
    <ls_alv>     TYPE  ANY,
    <lt_aspect>  TYPE  STANDARD TABLE,
    <ls_aspect>  TYPE  ANY.

  create_data( ).

  ASSIGN:
    mt_alv->*    TO <lt_alv>,
    ms_alv->*    TO <ls_alv>,
    mt_aspect->* TO <lt_aspect>,
    ms_aspect->* TO <ls_aspect>.

  CLEAR <lt_aspect>.

* Move ALV content to itab of aspect structure -------------------------
  LOOP AT <lt_alv> INTO <ls_alv>.
    MOVE-CORRESPONDING <ls_alv> TO <ls_aspect>.
    APPEND <ls_aspect> TO <lt_aspect>.
  ENDLOOP.

* Fill export parameter ------------------------------------------------
  et_aspect = <lt_aspect>.

ENDMETHOD.


METHOD get_odp2_dynpro.

  DATA:
    lv_active  TYPE  /scmb/de_dusactive.

  CLEAR rv_dynnr_used.

* Check import parameters: all must be supplied, therefore an assertion
* is used. The dump can only occur during development and is wanted.
  IF iv_ta_identifier IS INITIAL
  OR iv_dynnr_open    IS INITIAL
  OR iv_dynnr_closed  IS INITIAL.
    ASSERT 1 = 0.
*   Dear developer, please supply the required import parameters!
  ENDIF.

* Separate (logically) ESDUS management for ODP2 screen handling from
* the ESDUS as used by the user defaults
  so_esdus_odp2 = /scmb/cl_esdus_manager=>get_instance(
    iv_uname  = sy-uname
    iv_action = iv_ta_identifier ).

* Check if screen number is already maintained -------------------------
  lv_active = so_esdus_odp2->get(
    iv_element = sc_element_dynnr_odp2 ).
  IF lv_active IS INITIAL
  OR ( lv_active NE iv_dynnr_open AND
       lv_active NE iv_dynnr_closed ).
    lv_active = iv_dynnr_closed.
    so_esdus_odp2->set(
      EXPORTING iv_element = sc_element_dynnr_odp2
                iv_active  = lv_active ).
    so_esdus_odp2->flush( ).
    rv_dynnr_used = iv_dynnr_closed.
  ELSE.
    rv_dynnr_used = lv_active.
  ENDIF.

ENDMETHOD.


METHOD get_selected_line.

  DATA:
    lt_index_rows  TYPE  lvc_t_row,
    ls_index_rows  TYPE  lvc_s_row,
    lv_lines       TYPE  i,
    lv_text        TYPE  string.                   "#EC NEEDED

  FIELD-SYMBOLS:
    <lt_alv>        TYPE  STANDARD TABLE,
    <lt_keys_sel>   TYPE  STANDARD TABLE,
    <lt_keys_work>  TYPE  STANDARD TABLE,
    <ls_aspect>     TYPE  ANY,
    <ls_alv>        TYPE  ANY,
    <ls_keys>       TYPE  ANY,
    <ls_table>      TYPE  ANY.

  create_data( ).

  ASSIGN:
    mt_alv->*       TO <lt_alv>,
    ms_alv->*       TO <ls_alv>,
    mt_keys_sel->*  TO <lt_keys_sel>,
    mt_keys_work->* TO <lt_keys_work>,
    ms_keys->*      TO <ls_keys>,
    ms_aspect->*    TO <ls_aspect>,
    ms_table->*     TO <ls_table>.

  CLEAR:
    es_aspect,
    <lt_keys_work>.

  ev_failed = abap_false.

* Execute updates ------------------------------------------------------
  RAISE EVENT execute_update.

* View dependent coding ------------------------------------------------
  IF iv_data_only = abap_false.
    CASE mv_view_mode.
*     List view
      WHEN /scmb/if_constant=>sc_table_view.
        check_table_view_selection(
          iv_no_message   = abap_true
          iv_index_filled = abap_false ).
        IF <lt_keys_sel> IS INITIAL.
          ev_failed = abap_true.
        ENDIF.
        <lt_keys_work> = <lt_keys_sel>.
*     Form view
      WHEN /scmb/if_constant=>sc_form_view.
        IF <ls_table> IS INITIAL.
          ev_failed = abap_true.
        ELSE.
          MOVE-CORRESPONDING <ls_table> TO <ls_keys>.
          APPEND <ls_keys> TO <lt_keys_work>.
          select( <lt_keys_work> ).
        ENDIF.
    ENDCASE.
  ELSE.
    CASE mv_view_mode.
*     List view
      WHEN /scmb/if_constant=>sc_table_view.
        lt_index_rows = get_selected_rows( ).
        IF LINES( lt_index_rows ) = 1.
          READ TABLE:
            lt_index_rows INDEX 1 INTO ls_index_rows,
            <lt_alv> INDEX ls_index_rows-index INTO <ls_alv>.
          MOVE-CORRESPONDING <ls_alv> TO es_aspect.
        ELSE.
          ev_failed = abap_true.
        ENDIF.
*     Form view
      WHEN /scmb/if_constant=>sc_form_view.
        IF <ls_table> IS INITIAL.
          ev_failed = abap_true.
        ELSE.
          MOVE-CORRESPONDING <ls_table> TO <ls_aspect>.
          es_aspect = <ls_aspect>.
        ENDIF.
    ENDCASE.
  ENDIF.

* Exit if nothing is selected ------------------------------------------
  IF ev_failed = abap_true.
    IF iv_suppress_message = abap_false.
      MESSAGE s007(/scmb/esa_emulation) INTO lv_text.
      add_system_message( ).
    ENDIF.
    RETURN.
  ENDIF.

* Exit if only data was requested --------------------------------------
  CHECK iv_data_only = abap_false.

* Fill/clear ODP -------------------------------------------------------
  DESCRIBE TABLE <lt_keys_work> LINES lv_lines.
  IF lv_lines EQ 0 OR (
    mv_multiple_selection = abap_false AND lv_lines > 1 ).
    RAISE EVENT initialize_odp
      EXPORTING iv_class_name  = mv_classname
                iv_aspect_name = mv_aspect_name.
  ELSE.
    RAISE EVENT trigger_sbr
      EXPORTING iv_class_name        = mv_classname
                is_relation_key      = mt_keys_work
                iv_aspect_name       = mv_aspect_name
                iv_selection_changed = mv_selection_changed.
  ENDIF.

* Raise message and set failed flag ----------------------------------
  IF lv_lines > 1.
    IF iv_suppress_message = abap_false.
      MESSAGE s010(/scmb/esa_emulation) INTO lv_text.
      add_system_message( ).
    ENDIF.
    ev_failed = abap_true.
    RETURN.
  ELSEIF lv_lines = 0.
    ev_failed = abap_true.
    RETURN.
  ENDIF.

* Fill export parameter ------------------------------------------------
  READ TABLE <lt_keys_work> INTO <ls_keys> INDEX 1.
  MOVE-CORRESPONDING <ls_keys> TO <ls_alv>.
  READ TABLE <lt_alv> FROM <ls_alv> INTO <ls_alv>.
  MOVE-CORRESPONDING <ls_alv> TO <ls_aspect>.
  es_aspect = <ls_aspect>.

ENDMETHOD.


METHOD get_selected_lines .

  DATA:
    lv_cancel  TYPE  abap_char1,
    lv_lines   TYPE  i,
    lv_text    TYPE  string.

  FIELD-SYMBOLS:
    <lt_alv>        TYPE  STANDARD TABLE,
    <lt_keys_sel>   TYPE  STANDARD TABLE,
    <lt_keys_work>  TYPE  STANDARD TABLE,
    <lt_aspect>     TYPE  STANDARD TABLE,
    <ls_aspect>     TYPE  ANY,
    <ls_alv>        TYPE  ANY,
    <ls_keys>       TYPE  ANY,
    <ls_table>      TYPE  ANY.

  create_data( ).

  ASSIGN:
    mt_alv->*       TO <lt_alv>,
    ms_alv->*       TO <ls_alv>,
    mt_keys_sel->*  TO <lt_keys_sel>,
    mt_keys_work->* TO <lt_keys_work>,
    mt_aspect->*    TO <lt_aspect>,
    ms_keys->*      TO <ls_keys>,
    ms_aspect->*    TO <ls_aspect>,
    ms_table->*     TO <ls_table>.

  CLEAR:
    et_aspect,
    <lt_keys_work>.

  ev_failed = abap_false.

* Execute updates ------------------------------------------------------
  RAISE EVENT execute_update.

* Quick data retrieval without selection -------------------------------
  IF iv_no_select = abap_true.
    get_selected_lines_wo_sel(
      EXPORTING iv_suppress_message = iv_suppress_message
      IMPORTING et_aspect           = et_aspect
                ev_failed           = ev_failed ).
    RETURN.
  ENDIF.

* View dependent coding ------------------------------------------------
  CASE mv_view_mode.
    WHEN /scmb/if_constant=>sc_table_view.
      lv_cancel = check_table_view_selection(
        iv_no_message   = abap_true
        iv_index_filled = abap_false ).
      IF <lt_keys_sel> IS INITIAL.
        ev_failed = abap_true.
      ENDIF.
      <lt_keys_work> = <lt_keys_sel>.
    WHEN /scmb/if_constant=>sc_form_view.
      IF <ls_table> IS INITIAL.
        ev_failed = abap_true.
      ELSE.
        MOVE-CORRESPONDING <ls_table> TO <ls_keys>.
        APPEND <ls_keys> TO <lt_keys_work>.
        lv_cancel = select( <lt_keys_work> ).
      ENDIF.
  ENDCASE.
  IF lv_cancel = sc_cancel_rejected.
    ev_failed = abap_true.
    RETURN.
  ENDIF.

* Exit if nothing is selected ------------------------------------------
  IF ev_failed = abap_true.
    IF iv_suppress_message = abap_false.
      MESSAGE s007(/scmb/esa_emulation) INTO lv_text.
      add_system_message( ).
    ENDIF.
    RETURN.
  ENDIF.

* Fill/clear ODP -------------------------------------------------------
  DESCRIBE TABLE <lt_keys_work> LINES lv_lines.
  IF lv_lines EQ 0 OR (
    mv_multiple_selection = abap_false AND lv_lines > 1 ).
    RAISE EVENT initialize_odp
      EXPORTING iv_class_name  = mv_classname
                iv_aspect_name = mv_aspect_name.
    IF lv_lines = 0.
      ev_failed = abap_true.
      RETURN.
    ENDIF.
  ELSE.
    RAISE EVENT trigger_sbr
      EXPORTING iv_class_name        = mv_classname
                is_relation_key      = mt_keys_work
                iv_aspect_name       = mv_aspect_name
                iv_selection_changed = mv_selection_changed.
  ENDIF.

* Fill export parameter ------------------------------------------------
  CLEAR <lt_aspect>.
  LOOP AT <lt_keys_work> INTO <ls_keys>.
    MOVE-CORRESPONDING <ls_keys> TO <ls_alv>.
    READ TABLE <lt_alv> FROM <ls_alv> INTO <ls_alv>.
    MOVE-CORRESPONDING <ls_alv> TO <ls_aspect>.
    APPEND <ls_aspect> TO <lt_aspect>.
  ENDLOOP.
  et_aspect = <lt_aspect>.

ENDMETHOD.


METHOD get_selected_lines_wo_sel.

  DATA:
    lv_text   TYPE  string,
    lt_index  TYPE  lvc_t_row,
    ls_index  TYPE  lvc_s_row.

  FIELD-SYMBOLS:
    <ls_table>   TYPE  ANY,
    <ls_aspect>  TYPE  ANY,
    <lt_alv>     TYPE  STANDARD TABLE,
    <ls_alv>     TYPE  ANY.

  create_data( ).

  ASSIGN:
    ms_aspect->* TO <ls_aspect>,
    ms_table->*  TO <ls_table>,
    mt_alv->*    TO <lt_alv>,
    ms_alv->*    TO <ls_alv>.

  CLEAR <ls_aspect>.

* Retrieve data (view dependent) ---------------------------------------
  CASE mv_view_mode.
    WHEN /scmb/if_constant=>sc_table_view.
      lt_index = get_selected_rows( ).
*     Get ALV data for selected lines
      LOOP AT lt_index INTO ls_index.
        READ TABLE <lt_alv>
          INDEX ls_index-index
          INTO <ls_alv>.
        MOVE-CORRESPONDING <ls_alv> TO <ls_aspect>.
        APPEND <ls_aspect> TO et_aspect.
      ENDLOOP.
    WHEN /scmb/if_constant=>sc_form_view.
      IF NOT <ls_table> IS INITIAL.
        MOVE-CORRESPONDING <ls_table> TO <ls_aspect>.
        APPEND <ls_aspect> TO et_aspect.
      ENDIF.
  ENDCASE.

* Set success flag -----------------------------------------------------
  IF et_aspect IS INITIAL.
    IF iv_suppress_message = abap_false.
      MESSAGE s007(/scmb/esa_emulation) INTO lv_text.
      add_system_message( ).
    ENDIF.
    ev_failed = abap_true.
  ENDIF.

ENDMETHOD.


METHOD get_selected_rows.

  DATA:
    lt_index  TYPE  lvc_t_row.

* Get selected rows from ALV grid --------------------------------------
  IF mo_alv_grid IS BOUND.
    mo_alv_grid->get_selected_rows(
      IMPORTING et_index_rows = lt_index ).
  ENDIF.

* Remove sum rows ------------------------------------------------------
  DELETE lt_index
    WHERE ( NOT rowtype IS INITIAL ).
  et_index = lt_index.

ENDMETHOD.


METHOD get_superior_data_by_key.

  DATA:
    ls_mapper  TYPE         /scmb/s_mapper,
    lv_text    TYPE         string,
    ls_data    TYPE REF TO  data.

  FIELD-SYMBOLS:
    <lt_keys_rel>  TYPE  STANDARD TABLE,
    <ls_keys_rel>  TYPE  ANY,
    <ls_data>      TYPE  ANY.

  create_data( ).

  ASSIGN:
    mt_keys_rel->*  TO  <lt_keys_rel>,
    ms_keys_rel->*  TO  <ls_keys_rel>.

* Evaluate selected superior lines -------------------------------------
  CASE lines( <lt_keys_rel> ).
    WHEN 1.
*     Continue
    WHEN OTHERS.
      IF iv_suppress_message = abap_false.
        MESSAGE s005(/scmb/esa_emulation) INTO lv_text.
        add_system_message( ).
      ENDIF.
      ev_failed = abap_true.
      RETURN.
  ENDCASE.

* Get data for selection -----------------------------------------------
  READ TABLE <lt_keys_rel> INTO <ls_keys_rel> INDEX 1.
  IF sy-subrc EQ 0.
    READ TABLE ss_data-t_mapper INTO ls_mapper
      WITH KEY v_aspect = mv_superior_aspect.
    CREATE DATA ls_data TYPE (ls_mapper-v_aspect_structure).
    ASSIGN ls_data->* TO <ls_data>.
    IF sy-subrc EQ 0.
      ls_mapper-o_pattern->get_superior_data_int(
        EXPORTING is_key  = <ls_keys_rel>
        IMPORTING es_data = <ls_data> ).
      GET REFERENCE OF <ls_data> INTO es_data.
    ENDIF.
  ENDIF.

ENDMETHOD.


METHOD get_superior_data_int .

  FIELD-SYMBOLS:
    <lt_alv>     TYPE  STANDARD TABLE,
    <ls_alv>     TYPE  ANY,
    <ls_aspect>  TYPE  ANY.

  create_data( ).

  ASSIGN:
    ms_alv->*    TO  <ls_alv>,
    mt_alv->*    TO  <lt_alv>,
    ms_aspect->* TO  <ls_aspect>.

  MOVE-CORRESPONDING is_key TO <ls_alv>.

  READ TABLE <lt_alv> FROM <ls_alv> INTO <ls_alv>.
  IF sy-subrc EQ 0.
    MOVE-CORRESPONDING <ls_alv> TO <ls_aspect>.
    es_data = <ls_aspect>.
  ENDIF.

ENDMETHOD.


METHOD get_table_handle .

  DATA:
    lt_key     TYPE  abap_keydescr_tab,
    ls_dfies   TYPE  dfies,
    lt_fields  TYPE  ddfields.

  LOOP AT it_fields INTO ls_dfies.
    APPEND ls_dfies-fieldname TO lt_key.
  ENDLOOP.

  IF NOT it_additional_keys IS INITIAL.
    APPEND LINES OF it_additional_keys TO lt_key.
  ENDIF.

  eo_tabledescr = cl_abap_tabledescr=>create(
    p_line_type  = io_strucdescr
    p_table_kind = iv_tablekind
    p_unique     = iv_unique_key
    p_key        = lt_key
    p_key_kind   = cl_abap_tabledescr=>keydefkind_user ).

ENDMETHOD.


METHOD hide_odp2.

  DATA:
    ls_active_tab  TYPE  /scmb/s_active_tabstrips,
    ls_mapper      TYPE  /scmb/s_mapper.

* Check if aspect has a related aspect ---------------------------------
  READ TABLE ss_data-t_aspect_mapping TRANSPORTING NO FIELDS
    WITH KEY v_aspect_sup = mv_aspect_name.
  IF sy-subrc EQ 0.
    IF ss_data-s_odp2_handling-o_subscreen->* =
      ss_data-s_odp2_handling-v_dynpro_dummy.
      ss_data-s_odp2_handling-o_subscreen->* =
        ss_data-v_odp2_dynpro_buffer.
    ENDIF.
  ELSE.
    IF ss_data-s_odp2_handling-o_subscreen->* NE
      ss_data-s_odp2_handling-v_dynpro_dummy.
      ss_data-v_odp2_dynpro_buffer =
        ss_data-s_odp2_handling-o_subscreen->*.
      ss_data-s_odp2_handling-o_subscreen->* =
        ss_data-s_odp2_handling-v_dynpro_dummy.
    ENDIF.
  ENDIF.

* Ensure that correct tabstrip is displayed ----------------------------
  READ TABLE ss_data-t_active_tab INTO ls_active_tab
    WITH KEY v_classname = sv_class_name_odp2
             v_superior_relation = mv_aspect_name.
  LOOP AT ss_data-t_mapper INTO ls_mapper
    WHERE v_class_name = sv_class_name_odp2.
    IF ls_mapper-o_pattern->mv_tab_number =
      ls_active_tab-v_active_tabstrip.
      ls_mapper-o_pattern->set_dynpro_for_tabstrip( ).
    ENDIF.
  ENDLOOP.

ENDMETHOD.


METHOD implicit_locking.

  DATA:
    lv_rejected        TYPE         abap_bool,
    lt_return_codes    TYPE         /scmb/t_sp_return_code,
    ls_return_codes    TYPE         /scmb/s_sp_return_code,
    lv_answer          TYPE         c,
    lt_keys_unlock     TYPE REF TO  data,
    lt_keys_lock       TYPE REF TO  data,
    lv_text            TYPE         string.

  FIELD-SYMBOLS:
    <ls_keys>           TYPE  ANY,
    <lt_keys_unlock>    TYPE  STANDARD TABLE,
    <lt_keys_lock>      TYPE  STANDARD TABLE,
    <lt_keys_lock_new>  TYPE  STANDARD TABLE,
    <lt_keys_sel>       TYPE  STANDARD TABLE.

  create_data( ).

  ASSIGN:
    mt_keys_sel->*  TO <lt_keys_sel>,
    mt_keys_lock->* TO <lt_keys_lock>,
    ms_keys->*      TO <ls_keys>.

  CHECK NOT ct_keys IS INITIAL.

* Create unlock table --------------------------------------------------
  CREATE DATA:
    lt_keys_unlock LIKE ct_keys,
    lt_keys_lock   LIKE ct_keys.
  ASSIGN:
    lt_keys_unlock->* TO <lt_keys_unlock>,
    lt_keys_lock->*   TO <lt_keys_lock_new>.

* Implicit locking -----------------------------------------------------
  IF is_locking-v_multilocking = abap_false.
    IF LINES( ct_keys ) > 1.
      MESSAGE e009(/scmb/esa_emulation) INTO lv_text.
      add_system_message( ).
      ev_cancel = abap_true.
      RETURN.
    ENDIF.
  ENDIF.

* Evaluate lock table
  <lt_keys_lock_new> = ct_keys.
  LOOP AT <lt_keys_lock> INTO <ls_keys>.
    READ TABLE <lt_keys_lock_new> FROM <ls_keys> TRANSPORTING NO FIELDS.
    IF sy-subrc EQ 0.
      DELETE TABLE <lt_keys_lock_new> FROM <ls_keys>.
    ELSE.
      APPEND <ls_keys> TO <lt_keys_unlock>.
    ENDIF.
  ENDLOOP.

* Continue only if locking keys remain
  CHECK NOT <lt_keys_lock_new> IS INITIAL.

* Unlock lines that weren't changed and are not required for ACTION
* (not relevant in multi-locking)
  IF NOT <lt_keys_unlock> IS INITIAL AND
    is_locking-v_multilocking = abap_false.
    CALL METHOD ss_data-o_sp->('UNLOCK')
      EXPORTING
        inkeys   = <lt_keys_unlock>
        aspect   = mv_aspect_name
      IMPORTING
        rejected = lv_rejected.
    IF lv_rejected = abap_true.
      ev_cancel = abap_true.
      RETURN.
    ELSE.
      CLEAR <lt_keys_lock>.
    ENDIF.
  ENDIF.

* Request locks
  CALL METHOD ss_data-o_sp->('LOCK')
    EXPORTING
      inkeys       = <lt_keys_lock_new>
      aspect       = mv_aspect_name
      lockmode     = is_locking-v_lockmode
    IMPORTING
      rejected     = lv_rejected
      return_codes = lt_return_codes.
  IF lv_rejected = abap_true.
    ev_cancel = abap_true.
    RETURN.
  ENDIF.
  set_undefined_se_flag( ).
* Check export parameters
  ev_rcodes_failed = check_rcodes(
    it_inkeys = ct_keys
    it_rcodes = lt_return_codes ).
  IF ev_rcodes_failed = sc_failed_completly.
    RETURN.
  ENDIF.

* Remember keys of locked objects
  SORT lt_return_codes BY inrecord DESCENDING.
  LOOP AT lt_return_codes INTO ls_return_codes.
    IF ls_return_codes-failed = abap_true.
      READ TABLE <lt_keys_lock_new> INDEX ls_return_codes-inrecord
        INTO <ls_keys>.
      DELETE TABLE ct_keys FROM <ls_keys>.
      DELETE <lt_keys_lock_new> INDEX ls_return_codes-inrecord.
    ELSE.
      DELETE lt_return_codes.
    ENDIF.
  ENDLOOP.
  APPEND LINES OF <lt_keys_lock_new> TO <lt_keys_lock>.
  SORT <lt_keys_lock>.
  DELETE ADJACENT DUPLICATES FROM <lt_keys_lock>.

* Not all requested locks were granted => react as defined
  IF NOT lt_return_codes IS INITIAL.
    CASE is_locking-v_partial_locking.
      WHEN /scmb/if_constant=>sc_part_lock_cancel.
        MESSAGE e022(/scmb/esa_emulation) INTO lv_text.
        add_system_message( ).
        ev_cancel = abap_true.
        RETURN.
      WHEN /scmb/if_constant=>sc_part_lock_continue.
*       Continue
      WHEN /scmb/if_constant=>sc_part_lock_popup.
        CLEAR lv_answer.
        CALL FUNCTION 'POPUP_TO_CONFIRM'
          EXPORTING
            text_question         = text-003
            default_button        = '2'
            display_cancel_button = ' '
          IMPORTING
            answer                = lv_answer
          EXCEPTIONS
            text_not_found        = 1
            OTHERS                = 2.
        IF sy-subrc NE 0.
          add_system_message( ).
        ENDIF.
        IF lv_answer = /scmb/if_constant=>sc_no.
          ev_cancel = abap_true.
          RETURN.
        ENDIF.
    ENDCASE.
  ENDIF.

* Trigger undefined sideeffect
  set_undefined_se_flag( ).

ENDMETHOD.


METHOD init.

  RAISE EVENT initialize_instances.
  clear_static( ).

ENDMETHOD.


METHOD insert .

  DATA:
    lv_failed        TYPE         abap_char1,
    lv_rejected      TYPE         abap_bool,
    lv_cancel        TYPE         abap_bool,
    lv_continue      TYPE         abap_bool,
    lv_text          TYPE         string,                   "#EC NEEDED
    lt_return_codes  TYPE         /scmb/t_sp_return_code,
    lt_inrecords     TYPE REF TO  data,
    ls_inparam       TYPE REF TO  data.

  FIELD-SYMBOLS:
    <ls_rel_outrecord>  TYPE ANY,
    <lt_inrecords>      TYPE STANDARD TABLE,
    <lt_aspect>         TYPE STANDARD TABLE,
    <lt_keys_work>      TYPE STANDARD TABLE,
    <lt_keys_lock>      TYPE STANDARD TABLE,
    <lt_keys_sel>       TYPE STANDARD TABLE,
    <lt_keys_rel>       TYPE STANDARD TABLE,
    <ls_inparam>        TYPE ANY,
    <ls_aspect>         TYPE ANY,
    <ls_keys>           TYPE ANY,
    <ls_table>          TYPE ANY,
    <ls_keys_rel>       TYPE ANY.

  create_data( ).

* Assign field symbols
  ASSIGN:
    mt_keys_sel->*  TO <lt_keys_sel>,
    mt_keys_rel->*  TO <lt_keys_rel>,
    ms_keys_rel->*  TO <ls_keys_rel>,
    mt_keys_work->* TO <lt_keys_work>,
    mt_keys_lock->* TO <lt_keys_lock>,
    ms_aspect->*    TO <ls_aspect>,
    mt_aspect->*    TO <lt_aspect>,
    ms_keys->*      TO <ls_keys>,
    ms_table->*     TO <ls_table>.

* Execute updates ------------------------------------------------------
  RAISE EVENT execute_update.

* Check for erroneous data ---------------------------------------------
  CHECK trigger_error_checks( ) = abap_true.

* Pattern level specific coding necessary ------------------------------
  IF mv_classname = sv_class_name_oip.
*   Check for unsaved data
    lv_continue = check_for_unsaved_data( abap_false ).
  ELSE.
    IF NOT <lt_keys_rel> IS INITIAL
    OR iv_superior_obj_required = abap_false.
      lv_continue = abap_true.
    ELSE.
      MESSAGE e005(/scmb/esa_emulation) INTO lv_text.
      add_system_message( ).
    ENDIF.
  ENDIF.

  CHECK lv_continue = abap_true.

* Unlock lines, that were locked but not changed -----------------------
  IF NOT <lt_keys_lock> IS INITIAL AND mv_classname = sv_class_name_oip
     AND iv_multilock = abap_false.
    CALL METHOD ss_data-o_sp->('UNLOCK')
      EXPORTING
        inkeys   = <lt_keys_lock>
        aspect   = mv_aspect_name
      IMPORTING
        rejected = lv_rejected.
*   Evaluate export parameters
    IF lv_rejected = abap_true.
      RETURN.
    ELSE.
      CLEAR <lt_keys_lock>.
    ENDIF.
  ENDIF.

  CLEAR:
    <lt_aspect>,
    <ls_aspect>.

* If preset data is available -> use it --------------------------------
  IF is_inrecord IS SUPPLIED.
    <ls_aspect> = is_inrecord.
  ENDIF.

* Call popup if requested ----------------------------------------------
  IF NOT ms_insert-v_structure_name IS INITIAL.
*   Generate popup (new)
    CALL FUNCTION '/SCMB/EES_DYNGEN'
      EXPORTING
        iv_structure        = ms_insert-v_structure_name
        iv_title_text       = ms_insert-v_popup_title_text
        is_data             = is_inrecord
        it_display_only     = ms_insert-t_display_only
        it_mandatory_fields = ms_insert-t_mandatory_fields
        it_readonly_fields  = ms_insert-t_readonly_fields
        it_no_dropdown_conv = ms_insert-t_no_dropdown_conv
        it_display_order    = ms_insert-t_display_order
        it_display_checkbox = ms_insert-t_display_checkbox
        it_clear_memoryid   = ms_insert-t_clear_memoryid
        it_combined_fields  = ms_insert-t_combined_fields
        io_message_handler  = so_message_handler
      IMPORTING
        ev_cancel           = lv_cancel
        es_structure        = ls_inparam.
    IF lv_cancel = abap_true.
      RETURN.
    ENDIF.
    ASSIGN ls_inparam->* TO <ls_inparam>.
    MOVE-CORRESPONDING <ls_inparam> TO <ls_aspect>.
  ENDIF.

* Lock superior object -------------------------------------------------
  IF NOT is_lock_superior_object IS INITIAL
    AND NOT <lt_keys_rel> IS INITIAL.
    IF trigger_lock_superior_obj( is_lock_superior_object ) = abap_true.
      RETURN.
    ENDIF.
  ENDIF.

* Create aspect table --------------------------------------------------
  CREATE DATA lt_inrecords LIKE <lt_aspect>.
  ASSIGN lt_inrecords->* TO <lt_inrecords>.
  APPEND <ls_aspect> TO <lt_inrecords>.

* Call INSERT method of service provider (w/o relation) ----------------
  CLEAR:
    lv_rejected,
    lt_return_codes,
    <lt_aspect>.
  CASE mv_classname.
    WHEN sv_class_name_oip.
      CALL METHOD ss_data-o_sp->('INSERT')
        EXPORTING
          inrecords    = <lt_inrecords>
          aspect       = mv_aspect_name
        IMPORTING
          outrecords   = <lt_aspect>
          rejected     = lv_rejected
          return_codes = lt_return_codes.
    WHEN OTHERS.
      ASSIGN ms_aspect_sup->* TO <ls_rel_outrecord>.
      CLEAR:
        <ls_rel_outrecord>,
        <ls_keys_rel>.
*     Fill a structure of type: relation keys with the selected rel keys
      IF LINES( <lt_keys_rel> ) EQ 1.
        READ TABLE <lt_keys_rel> INTO <ls_keys_rel> INDEX 1.
      ENDIF.

      CALL METHOD ss_data-o_sp->('INSERT')
        EXPORTING
          inrecords          = <lt_inrecords>
          aspect             = mv_aspect_name
          relation           = mv_relation
          relation_inkey     = <ls_keys_rel>
        IMPORTING
          outrecords         = <lt_aspect>
          relation_outrecord = <ls_rel_outrecord>
          rejected           = lv_rejected
          return_codes       = lt_return_codes.
  ENDCASE.

* Check the return codes -----------------------------------------------
  lv_failed = check_rcodes(
    it_inkeys = <lt_inrecords>
    it_rcodes = lt_return_codes ).

* Check the exporting parameter ----------------------------------------
  IF lv_rejected = abap_true OR
     lv_failed = sc_failed_completly.
    CASE iv_sideeffect.
      WHEN /scmb/if_constant=>sc_se_undefined.
        set_undefined_se_flag( ).
      WHEN /scmb/if_constant=>sc_se_aspect.
        mv_do_sideeffect_aspect = abap_true.
    ENDCASE.
    RETURN.
  ENDIF.

* Set unsaved data flag ------------------------------------------------
  set_unsaved_data_flag( ).

* Set keys for locked lines --------------------------------------------
  IF iv_locked = abap_true.
    LOOP AT <lt_aspect> INTO <ls_aspect>.
      MOVE-CORRESPONDING <ls_aspect> TO <ls_keys>.
      APPEND <ls_keys> TO <lt_keys_lock>.
    ENDLOOP.
*   Should not be necessary
    SORT <lt_keys_lock>.
    DELETE ADJACENT DUPLICATES FROM <lt_keys_lock>.
  ENDIF.

* Update superior aspect if necessary ----------------------------------
  IF <ls_rel_outrecord> IS ASSIGNED.
    IF NOT <ls_rel_outrecord> IS INITIAL.
      RAISE EVENT upd_superior_aspect
        EXPORTING is_aspect_structure = <ls_rel_outrecord>
                  iv_aspect_name      = mv_superior_aspect.
    ENDIF.
  ENDIF.

* Only if aspect data was returned -------------------------------------
  IF NOT <lt_aspect> IS INITIAL.
*   Convert service provider table into ALV table
    convert_data_for_alv( <lt_aspect> ).

*   Add a row to ALV grid to set focus correctly
    mo_alv_grid->append_rows( ).

*   Select the new line
    READ TABLE <lt_aspect> INDEX 1 INTO <ls_aspect>.
    IF sy-subrc EQ 0.
      CLEAR <lt_keys_work>.
      MOVE-CORRESPONDING <ls_aspect> TO <ls_keys>.
      APPEND <ls_keys> TO <lt_keys_work>.
      RAISE EVENT trigger_sbr
        EXPORTING iv_class_name        = mv_classname
                  is_relation_key      = mt_keys_work
                  iv_aspect_name       = mv_aspect_name
                  iv_selection_changed = abap_true.

*     View dependent coding
      MOVE-CORRESPONDING <ls_aspect> TO <ls_table>.
      CASE mv_view_mode.
        WHEN /scmb/if_constant=>sc_table_view.
          CLEAR <lt_keys_sel>.
          <lt_keys_sel> = <lt_keys_work>.
        WHEN /scmb/if_constant=>sc_form_view.
          APPEND <ls_keys> TO <lt_keys_sel>.
          get_data_for_form_view( ).
      ENDCASE.
    ENDIF.
  ENDIF.

* Do side effects ------------------------------------------------------
  CASE iv_sideeffect.
    WHEN /scmb/if_constant=>sc_se_outrecords.
      mv_refresh_necessary = sc_refresh_normal.
    WHEN /scmb/if_constant=>sc_se_undefined.
      set_undefined_se_flag( ).
    WHEN /scmb/if_constant=>sc_se_aspect.
      mv_do_sideeffect_aspect = abap_true.
    WHEN /scmb/if_constant=>sc_se_none.
*     Doesn't make sense
  ENDCASE.

* Save if requested and all went ok ------------------------------------
  IF lv_rejected = abap_false AND
     lv_failed = abap_false AND iv_save = abap_true.
    save( ).
  ENDIF.

ENDMETHOD.


METHOD lock .

  DATA:
    lv_mandatory     TYPE         abap_bool,
    lv_filled        TYPE         abap_bool,
    lv_index         TYPE         sytabix,
    lv_lines         TYPE         i,
    lt_keys_unlock   TYPE REF TO  data,
    lv_cancel        TYPE         abap_char1,
    lv_rejected      TYPE         boole_d,
    lt_return_codes  TYPE         /scmb/t_sp_return_code,
    lv_text          TYPE         string.                   "#EC NEEDED

  FIELD-SYMBOLS:
    <ls_keys>          TYPE  ANY,
    <ls_table>         TYPE  ANY,
    <ls_return_codes>  TYPE  /scmb/s_sp_return_code,
    <lt_keys_lock>     TYPE  STANDARD TABLE,
    <lt_keys_unlock>   TYPE  STANDARD TABLE,
    <lt_keys_sel>      TYPE  STANDARD TABLE,
    <lt_keys_work>     TYPE  STANDARD TABLE.

  create_data( ).

  ASSIGN:
    mt_keys_sel->*  TO <lt_keys_sel>,
    mt_keys_lock->* TO <lt_keys_lock>,
    mt_keys_work->* TO <lt_keys_work>,
    ms_keys->*      TO <ls_keys>,
    ms_table->*     TO <ls_table>.

  CLEAR <lt_keys_work>.

* Preset rejected flag -------------------------------------------------
  ev_rejected = abap_true.

* Execute updates ------------------------------------------------------
  RAISE EVENT execute_update.

* Create unlock table --------------------------------------------------
  CREATE DATA lt_keys_unlock LIKE <lt_keys_sel>.
  ASSIGN lt_keys_unlock->* TO <lt_keys_unlock>.

  CASE mv_view_mode.
*   List view ----------------------------------------------------------
    WHEN /scmb/if_constant=>sc_table_view.
*     Check if save popup is necessary
      CHECK check_selection_change( ) = abap_true.
      IF mv_selection_changed = abap_true  AND
        mv_classname = sv_class_name_oip.
        IF iv_multilock = abap_true.
          lv_mandatory = abap_false.
        ELSE.
          lv_mandatory = abap_true.
        ENDIF.
        IF check_for_unsaved_data( lv_mandatory ) = abap_false.
          RETURN.
        ENDIF.
      ENDIF.

*     Check for multilocks
      DESCRIBE TABLE <lt_keys_work> LINES lv_lines.
      IF lv_lines > 1 AND iv_multilock = abap_false.
        MESSAGE e009(/scmb/esa_emulation) INTO lv_text.
        add_system_message( ).
        RETURN.
      ENDIF.

*     Get new keys
      IF mv_classname = sv_class_name_oip.
        lv_filled = abap_true.
      ENDIF.
      lv_cancel = check_table_view_selection(
        iv_no_message   = abap_false
        iv_index_filled = lv_filled ).
      IF <lt_keys_sel> IS INITIAL.
        MESSAGE s007(/scmb/esa_emulation) INTO lv_text.
        add_system_message( ).
        RETURN.
      ELSE.
        <lt_keys_work> = <lt_keys_sel>.
      ENDIF.

*   Form view ----------------------------------------------------------
    WHEN /scmb/if_constant=>sc_form_view.
      IF <ls_table> IS INITIAL.
        MESSAGE s007(/scmb/esa_emulation) INTO lv_text.
        add_system_message( ).
        RETURN.
      ELSE.
        MOVE-CORRESPONDING <ls_table> TO <ls_keys>.
        APPEND <ls_keys> TO <lt_keys_work>.
      ENDIF.
      lv_cancel = select( <lt_keys_work> ).
*     Check for multilocks
      IF NOT <lt_keys_lock> IS INITIAL.
        READ TABLE <lt_keys_lock> FROM <ls_keys> TRANSPORTING NO FIELDS.
        IF sy-subrc NE 0 AND iv_multilock = abap_false.
          IF check_for_unsaved_data( abap_true ) = abap_false.
            RETURN.
          ENDIF.
        ENDIF.
      ENDIF.
  ENDCASE.

* Exit if SELECT resulted in a REJECTED --------------------------------
  CHECK lv_cancel NE sc_cancel_rejected.

* Remove already locked lines ------------------------------------------
  LOOP AT <lt_keys_lock> INTO <ls_keys>.
    READ TABLE <lt_keys_work> FROM <ls_keys> TRANSPORTING NO FIELDS.
    lv_index = sy-tabix.
    IF sy-subrc EQ 0.
      DELETE <lt_keys_work> INDEX lv_index.
    ELSE.
      APPEND <ls_keys> TO <lt_keys_unlock>.
    ENDIF.
  ENDLOOP.

* Clear rejected flag --------------------------------------------------
  ev_rejected = abap_false.

* Exit if no new lock is requested -------------------------------------
  CHECK <lt_keys_work> IS NOT INITIAL.

* Unlock lines, that were locked but not changed -----------------------
* Not in multilocking case!
  IF NOT <lt_keys_unlock> IS INITIAL AND iv_multilock = abap_false.
    CALL METHOD ss_data-o_sp->('UNLOCK')
      EXPORTING
        inkeys   = <lt_keys_unlock>
        aspect   = mv_aspect_name
      IMPORTING
        rejected = lv_rejected.
*   Evaluate export parameters
    IF lv_rejected = abap_true.
      ev_rejected = abap_true.
      RETURN.
    ELSE.
      CLEAR <lt_keys_lock>.
    ENDIF.
  ENDIF.

* Request locks --------------------------------------------------------
* Clear LOCK IMPORTING parameters
  CLEAR:
    lv_rejected,
    lt_return_codes.
  CALL METHOD ss_data-o_sp->('LOCK')
    EXPORTING
      inkeys       = <lt_keys_work>
      aspect       = mv_aspect_name
      lockmode     = iv_lockmode
    IMPORTING
      rejected     = lv_rejected
      return_codes = lt_return_codes.
* Evaluate export parameters
  IF lv_rejected = abap_true.
    ev_rejected = abap_true.
    RETURN.
  ENDIF.

* Do side effects ------------------------------------------------------
  CASE iv_sideeffect.
    WHEN /scmb/if_constant=>sc_se_outrecords.
*     Note: LOCK and UNLOCK definition do not allow outrecords,
*           therefore an additional SELECT is called to retrieve
*           the new data
      select( it_keys = <lt_keys_work> ).
    WHEN /scmb/if_constant=>sc_se_undefined.
      set_undefined_se_flag( ).
    WHEN /scmb/if_constant=>sc_se_aspect.
      mv_do_sideeffect_aspect = abap_true.
    WHEN /scmb/if_constant=>sc_se_none.
*     Do nothing
  ENDCASE.

* Remember keys of locked objects --------------------------------------
  SORT lt_return_codes BY inrecord DESCENDING.
  LOOP AT lt_return_codes ASSIGNING <ls_return_codes>
    WHERE failed = abap_true.
    DELETE <lt_keys_work> INDEX <ls_return_codes>-inrecord.
  ENDLOOP.
  APPEND LINES OF <lt_keys_work> TO <lt_keys_lock>.
  SORT <lt_keys_lock>.
  DELETE ADJACENT DUPLICATES FROM <lt_keys_lock>.

ENDMETHOD.


METHOD LOCK_SUPERIOR_OBJECT .

  DATA:
    lv_text          TYPE         string,
    lv_index         TYPE         sytabix,
    lt_keys_unlock   TYPE REF TO  data,
    lv_rejected      TYPE         boole_d,
    lt_return_codes  TYPE         /scmb/t_sp_return_code.

  FIELD-SYMBOLS:
    <ls_keys>         TYPE ANY,
    <lt_keys_lock>    TYPE STANDARD TABLE,
    <lt_keys_unlock>  TYPE STANDARD TABLE,
    <lt_keys_sel>     TYPE STANDARD TABLE,
    <lt_keys_work>    TYPE STANDARD TABLE.

  create_data( ).

  ASSIGN:
    mt_keys_sel->*  TO <lt_keys_sel>,
    mt_keys_lock->* TO <lt_keys_lock>,
    mt_keys_work->* TO <lt_keys_work>,
    ms_keys->*      TO <ls_keys>.

* Create unlock table --------------------------------------------------
  CREATE DATA lt_keys_unlock LIKE <lt_keys_sel>.
  ASSIGN lt_keys_unlock->* TO <lt_keys_unlock>.

* Set keys -------------------------------------------------------------
  CLEAR <lt_keys_work>.
  <lt_keys_work> = it_keys.

* Separate already locked lines ----------------------------------------
  LOOP AT <lt_keys_lock> INTO <ls_keys>.
    READ TABLE <lt_keys_work> FROM <ls_keys> TRANSPORTING NO FIELDS.
    lv_index = sy-tabix.
    IF sy-subrc EQ 0.
      DELETE <lt_keys_work> INDEX lv_index.
    ELSE.
      IF iv_multilock = abap_false.
        APPEND <ls_keys> TO <lt_keys_unlock>.
      ENDIF.
    ENDIF.
  ENDLOOP.

* Exit if no new lock is requested; check multilocking -----------------
  CHECK <lt_keys_work> IS NOT INITIAL.

* Check if saving is necessary -----------------------------------------
  IF mv_classname = sv_class_name_oip  AND
     NOT <lt_keys_unlock> IS INITIAL.
    IF check_for_unsaved_data( abap_true ) = abap_false.
      RETURN.
    ENDIF.
  ENDIF.

* Call unlock ----------------------------------------------------------
  IF NOT <lt_keys_unlock> IS INITIAL.
    CALL METHOD ss_data-o_sp->('UNLOCK')
      EXPORTING
        inkeys   = <lt_keys_unlock>
        aspect   = mv_aspect_name
      IMPORTING
        rejected = lv_rejected.
    IF lv_rejected = abap_true.
      RETURN.
    ELSE.
      set_undefined_se_flag( ).
    ENDIF.
  ENDIF.

* Request locks --------------------------------------------------------
  CALL METHOD ss_data-o_sp->('LOCK')
    EXPORTING
      inkeys       = <lt_keys_work>
      aspect       = mv_aspect_name
      lockmode     = iv_lockmode
    IMPORTING
      rejected     = lv_rejected
      return_codes = lt_return_codes.
* Evaluate export parameters
  IF lv_rejected = abap_true.
    ev_lock_error = abap_true.
    RETURN.
  ENDIF.

* Remember keys of locked objects --------------------------------------
  READ TABLE lt_return_codes TRANSPORTING NO FIELDS
    WITH KEY failed = abap_true.
  IF sy-subrc EQ 0.
    ev_lock_error = abap_true.
    RETURN.
  ENDIF.
  APPEND LINES OF <lt_keys_work> TO <lt_keys_lock>.
  SORT <lt_keys_lock>.
  DELETE ADJACENT DUPLICATES FROM <lt_keys_lock>.

* Trigger undefined sideeffect -----------------------------------------
  set_undefined_se_flag( ).

ENDMETHOD.


METHOD MODIFY_ALV_TABLE .

  DATA:
    lt_new_lines  TYPE REF TO  data.

  FIELD-SYMBOLS:
    <ls_keys>        TYPE  any,
    <lt_keys_error>  TYPE  STANDARD TABLE,
    <lt_alv>         TYPE  STANDARD TABLE,
    <ls_alv>         TYPE  any,
    <ls_outtab_svp>  TYPE  any,
    <lt_new_lines>   TYPE  STANDARD TABLE.

  CREATE DATA lt_new_lines LIKE it_outtab_svp.

  create_data( ).

  ASSIGN:
    mt_alv->*         TO  <lt_alv>,
    ms_alv->*         TO  <ls_alv>,
    ms_keys->*        TO  <ls_keys>,
    mt_keys_error->*  TO  <lt_keys_error>,
    lt_new_lines->*   TO  <lt_new_lines>.

  LOOP AT it_outtab_svp ASSIGNING <ls_outtab_svp>.
    CLEAR <ls_alv>.
    MOVE-CORRESPONDING:
      <ls_outtab_svp> TO <ls_alv>,
      <ls_outtab_svp> TO <ls_keys>.
*   Do not update error marked lines
    READ TABLE <lt_keys_error> FROM <ls_keys> TRANSPORTING NO FIELDS.
    IF sy-subrc NE 0.
      READ TABLE <lt_alv> FROM <ls_alv> ASSIGNING <ls_alv>.
      IF sy-subrc = 0.
*       Modify old entries (implicit by assigned field symbol!)
        MOVE-CORRESPONDING <ls_outtab_svp> TO <ls_alv>.
      ELSE.
*       If the line doesn't exist -> insert it
        APPEND <ls_outtab_svp> TO <lt_new_lines>.
        convert_data_for_alv( <lt_new_lines> ).
        CLEAR <lt_new_lines>.
      ENDIF.
*     Remove assignment of field symbol from alv table
      ASSIGN ms_alv->* TO <ls_alv>.
    ENDIF.
  ENDLOOP.

ENDMETHOD.


METHOD modify_form_view .

  FIELD-SYMBOLS:
    <ls_fv>     TYPE  ANY,
    <lt_alv>    TYPE  STANDARD TABLE,
    <ls_alv>    TYPE  ANY,
    <ls_table>  TYPE  ANY.

  create_data( ).

  ASSIGN:
    ms_fv->*    TO <ls_fv>,
    ms_table->* TO <ls_table>,
    ms_alv->*   TO <ls_alv>,
    mt_alv->*   TO <lt_alv>.

  CLEAR <ls_alv>.

* Update form view -----------------------------------------------------
  MOVE-CORRESPONDING <ls_table> TO <ls_alv>.
  READ TABLE <lt_alv> FROM <ls_alv> INTO <ls_alv>.
  IF sy-subrc = 0.
    MOVE-CORRESPONDING:
      <ls_alv> TO <ls_table>,
      <ls_alv> TO <ls_fv>.
  ENDIF.

ENDMETHOD.


METHOD modify_fv_dynpro .

  DATA:
    ls_fv_attributes   TYPE  /scmb/s_fieldcontrol,
    lv_fieldname(132)  TYPE  c.

* Only if in form view mode
  CHECK mv_view_mode = /scmb/if_constant=>sc_form_view.

  LOOP AT SCREEN.
*   Determine fieldname
    lv_fieldname = screen-name.
    SHIFT lv_fieldname UP TO '-' LEFT.
    CHECK sy-subrc EQ 0.
    SHIFT lv_fieldname BY 1 PLACES LEFT.
*   Set focus if required
    IF NOT mv_set_focus IS INITIAL.
      IF mv_set_focus = lv_fieldname.
        screen-intensified = 1.
        MODIFY SCREEN.
      ENDIF.
    ENDIF.
*   Get the attributes for currently looped field
    READ TABLE mt_fv_attributes WITH TABLE KEY field = lv_fieldname
      INTO ls_fv_attributes.                                "#EC *
    IF sy-subrc IS INITIAL.
*     Attribute: display
      CASE ls_fv_attributes-display.
        WHEN abap_false.
          screen-invisible = 1.
        WHEN abap_true.
          screen-invisible = 0.
      ENDCASE.
*     Attribute: read-only
      CASE ls_fv_attributes-edit.
        WHEN abap_true.
          screen-input = 1.
        WHEN abap_false.
          screen-input = 0.
      ENDCASE.
      MODIFY SCREEN.
    ENDIF.
  ENDLOOP.

  CLEAR mv_set_focus.

ENDMETHOD.


METHOD modify_odp_tabstrip.

  DATA:
    ls_mapper       TYPE  /scmb/s_mapper,
    ls_active_tab   TYPE  /scmb/s_active_tabstrips,
    ls_aspect_map   TYPE  /scmb/s_aspect_relations,
    lv_oip_aspect   TYPE  string,
    lv_odp1_aspect  TYPE  string.

  CHECK iv_level = /scmb/if_constant=>sc_odp2.

* Get active OIP aspect ------------------------------------------------
  READ TABLE ss_data-t_active_tab INTO ls_active_tab
    WITH KEY v_classname = sv_class_name_oip.
  LOOP AT ss_data-t_mapper INTO ls_mapper
    WHERE v_class_name = sv_class_name_oip.
    IF ls_mapper-o_pattern->mv_tab_number =
      ls_active_tab-v_active_tabstrip.
      lv_oip_aspect = ls_mapper-v_aspect.
    ENDIF.
  ENDLOOP.

* Get active ODP1 aspect -----------------------------------------------
  READ TABLE ss_data-t_active_tab INTO ls_active_tab
    WITH KEY v_classname = sv_class_name_odp1
             v_superior_relation = lv_oip_aspect.
  IF sy-subrc NE 0.
    ASSERT ID /scmb/pattern_framework CONDITION 1 = 0.
  ENDIF.
  LOOP AT ss_data-t_mapper INTO ls_mapper
    WHERE v_class_name = sv_class_name_odp1.
    IF ls_mapper-o_pattern->mv_tab_number =
      ls_active_tab-v_active_tabstrip.
      lv_odp1_aspect = ls_mapper-v_aspect.
    ENDIF.
  ENDLOOP.

* Check if ODP1 Tabstrip has relations ---------------------------------
  CHECK NOT lv_odp1_aspect IS INITIAL.

* Hide/show ODP tabstrip -----------------------------------------------
  LOOP AT SCREEN.
    CASE iv_level.
      WHEN /scmb/if_constant=>sc_odp1.
*     Directly only supported for ODP2, since OIP tabstrips are not
*     standard functionality of the framework; ODP1 tabstrip handling
*     however can be implemented by the UI itself (see /SCWM/TODLV or
*     /SCWM/CANCPICK)
      WHEN /scmb/if_constant=>sc_odp2.
        READ TABLE ss_data-t_mapper INTO ls_mapper
          WITH KEY v_class_name    = sv_class_name_odp2
                   v_tabstrip_name = screen-name.
*       Note: tabstrips names have to be maintained
        IF sy-subrc EQ 0.
          READ TABLE ss_data-t_aspect_mapping INTO ls_aspect_map
            WITH KEY v_aspect = ls_mapper-v_aspect.
          IF ls_aspect_map-v_aspect_sup = lv_odp1_aspect.
            screen-invisible = 0.
          ELSE.
            screen-invisible = 1.
          ENDIF.
          MODIFY SCREEN.
        ENDIF.
    ENDCASE.
  ENDLOOP.

ENDMETHOD.


METHOD modify_related_updates.

  DATA:
    ls_mapper      TYPE  /scmb/s_mapper,
    ls_aspect_map  TYPE  /scmb/s_aspect_relations.

  FIELD-SYMBOLS:
    <lt_delete>  TYPE  STANDARD TABLE,
    <lt_update>  TYPE  STANDARD TABLE.

  LOOP AT ss_data-t_aspect_mapping INTO ls_aspect_map
    WHERE v_aspect_sup = mv_aspect_name.
*   Get instance of related aspect
    READ TABLE ss_data-t_mapper INTO ls_mapper
      WITH KEY v_aspect = ls_aspect_map-v_aspect.
    IF NOT ls_mapper-o_pattern IS BOUND OR sy-subrc NE 0.
      ASSERT ID /scmb/pattern_framework CONDITION 1 = 0.
      CONTINUE.
    ENDIF.
    ls_mapper-o_pattern->modify_related_updates( iv_mode = iv_mode ).
*   Buffer update lines
    ls_mapper-o_pattern->create_data( ).
    ASSIGN:
      ls_mapper-o_pattern->mt_delete->* TO <lt_delete>,
      ls_mapper-o_pattern->mt_update->* TO <lt_update>.
    IF iv_mode = sc_mode_before_delete.
      <lt_delete> = <lt_update>.
      CLEAR <lt_update>.
    ELSEIF iv_mode = sc_mode_after_delete.
      <lt_update> = <lt_delete>.
      CLEAR <lt_delete>.
    ELSE.
      ASSERT ID /scmb/pattern_framework CONDITION 1 = 0.
      CONTINUE.
    ENDIF.
  ENDLOOP.

ENDMETHOD.


METHOD multiple_query_preparations.

  FIELD-SYMBOLS:
    <lt_alv>       TYPE  STANDARD TABLE,
    <lt_keys_sel>  TYPE  STANDARD TABLE,
    <ls_alv>       TYPE  ANY,
    <ls_keys>      TYPE  ANY.

  create_data( ).

  ASSIGN:
    mt_alv->*      TO <lt_alv>,
    mt_keys_sel->* TO <lt_keys_sel>,
    ms_keys->*     TO <ls_keys>,
    ms_alv->*      TO <ls_alv>.

  CHECK LINES( <lt_alv> ) = 1.
  IF mo_alv_grid IS BOUND.
    select_single_row( ).
  ENDIF.
  READ TABLE <lt_alv> INDEX 1 INTO <ls_alv>.
  MOVE-CORRESPONDING <ls_alv> TO <ls_keys>.
  APPEND <ls_keys> TO <lt_keys_sel>.

ENDMETHOD.


METHOD odp_tabstrip_selected .

* Set relations active/inactive ----------------------------------------
  RAISE EVENT set_relations
    EXPORTING iv_class_name  = mv_classname
              iv_aspect_name = mv_aspect_name.

* Execute updates ------------------------------------------------------
  RAISE EVENT execute_update.

* For standard patterns create the ALV grid ----------------------------
  IF mv_category = /scmb/if_constant=>sc_cat_standard  OR
     mv_category = /scmb/if_constant=>sc_cat_text.
    create_toolbar( ).
    create_alv( ).
    IF mv_category = /scmb/if_constant=>sc_cat_text.
      constructor_text( ).
    ENDIF.
  ENDIF.

* Set new tab number ---------------------------------------------------
  set_active_tab( ).
  IF mv_data_valid = abap_false.
*   Start 'SELECT BY RELATION'
    select_by_relation(
      iv_keep_selection  = abap_false
      iv_keep_error_keys = abap_true ).
  ENDIF.

* Set new dynpro and pagers --------------------------------------------
  set_dynpro_for_tabstrip( ).
  update_pager_state( ).

* Remove buffered cursor setting (required or else the basis might
* switch back to the old tabstrip) -------------------------------------
  clear_cursor( ).

* Hide/Show ODP2 -------------------------------------------------------
  CHECK mv_classname = sv_class_name_odp1
    AND ss_data-s_odp2_handling IS NOT INITIAL.
  hide_odp2( ).

ENDMETHOD.


METHOD OIP_LAYOUT_SETTINGS.

  DATA:
    lt_sval      TYPE TABLE OF  sval,
    ls_sval      TYPE           sval,
    ls_msg       TYPE           symsg,
    lv_element   TYPE           /scmb/de_duselement,
    lv_active    TYPE           /scmb/de_dusactive,
    lv_active_p  TYPE           /scmb/de_dusactive,
    lv_return.

* Only if default values are used -------------------------------------
  CHECK ss_data-o_esdus_manager IS BOUND.

* Fill table for popup -------------------------------------------------
  CLEAR ls_sval.
  lv_element        = sc_element_query_mode.
  ls_sval-tabname   = '/SCMB/S_EES_ALV_LAYOUT'.
  ls_sval-fieldname = 'QUERY_MODE'.

* Get already saved values to preset popup fields ----------------------
  lv_active_p = ss_data-o_esdus_manager->get( lv_element ).
  ls_sval-value = lv_active_p.
  APPEND ls_sval TO lt_sval.

* Request values -------------------------------------------------------
  CALL FUNCTION 'POPUP_GET_VALUES'
    EXPORTING
      popup_title     = text-012
      start_column    = '15'
      start_row       = '5'
    IMPORTING
      returncode      = lv_return
    TABLES
      fields          = lt_sval
    EXCEPTIONS
      error_in_fields = 1
      OTHERS          = 2.
  IF sy-subrc <> 0.
    MOVE-CORRESPONDING sy TO ls_msg.
    so_message_handler->add_system_message( ls_msg ).
    RETURN.
  ENDIF.

* Set values (if filled) -----------------------------------------------
  READ TABLE lt_sval INDEX 1 INTO ls_sval.
  lv_element = sc_element_query_mode.
  lv_active  = ls_sval-value.
  ss_data-o_esdus_manager->set(
    EXPORTING iv_element = lv_element
              iv_active  = lv_active ).
  ss_data-o_esdus_manager->flush( ).

* Apply new view directly ----------------------------------------------
  IF lv_active NE lv_active_p.
    toggle_view( ).
  ENDIF.

ENDMETHOD.


METHOD oip_tabstrip_selected.

  DATA:
    lv_lines  TYPE  i.

  FIELD-SYMBOLS:
    <ls_table>     TYPE  ANY,
    <lt_keys_sel>  TYPE  STANDARD TABLE,
    <lt_alv>       TYPE  STANDARD TABLE,
    <ls_keys>      TYPE  ANY,
    <ls_alv>       TYPE  ANY.

  create_data( ).

  ASSIGN:
    ms_table->*    TO <ls_table>,
    mt_keys_sel->* TO <lt_keys_sel>,
    ms_keys->*     TO <ls_keys>,
    mt_alv->*      TO <lt_alv>,
    ms_alv->*      TO <ls_alv>.

* Execute updates ------------------------------------------------------
  RAISE EVENT execute_update.

* For standard patterns create the ALV grid ----------------------------
  IF mv_category = /scmb/if_constant=>sc_cat_standard  OR
     mv_category = /scmb/if_constant=>sc_cat_text.
    create_toolbar( ).
    create_alv( ).
    IF mv_category = /scmb/if_constant=>sc_cat_text.
      constructor_text( ).
    ENDIF.
  ENDIF.

* Set pagers, dynpro and tabstrip --------------------------------------
  update_pager_state( ).
  set_dynpro_for_tabstrip( ).
  set_active_tab( ).

* Remove buffered cursor setting (required or else the basis might
* switch back to the old tabstrip) -------------------------------------
  clear_cursor( ).

* Start SBR for a single line (necessary for 'multi-queries') ----------
* E.g. TA /scwm/todlv
  DESCRIBE TABLE <lt_keys_sel> LINES lv_lines.
  IF lv_lines = 1.
    CHECK select( <lt_keys_sel> ) = sc_cancel_ok.

*   Fill FV structure (needed if fields are displayed outside FV)
    READ TABLE <lt_keys_sel> INDEX 1 INTO <ls_keys>.
    MOVE-CORRESPONDING <ls_keys> TO <ls_alv>.
    READ TABLE <lt_alv> FROM <ls_alv> INTO <ls_alv>.
    IF sy-subrc EQ 0.
      MOVE-CORRESPONDING <ls_alv> TO <ls_table>.
    ENDIF.

*   Trigger SBR
    RAISE EVENT trigger_sbr
      EXPORTING iv_class_name        = mv_classname
                is_relation_key      = mt_keys_sel
                iv_aspect_name       = mv_aspect_name
                iv_selection_changed = mv_selection_changed.
  ENDIF.

ENDMETHOD.


METHOD on_alv_toolbar.

  DATA:
    ls_button       TYPE  stb_button,
    ls_tab_counter  TYPE  /scmb/s_tab_counter.

* Add separator to toolbar ---------------------------------------------
  CLEAR ls_button.
  ls_button-butn_type = '3'.
  INSERT ls_button INTO TABLE e_object->mt_toolbar.

* Add "details" button to the grid -------------------------------------
* (used for triggering popup display with number of lines...)
  CLEAR ls_button.
  ls_button-function  = sc_ok_alv_line_details.
  ls_button-icon      = icon_doc_item_detail.
  ls_button-quickinfo = text-007.
  ls_button-butn_type = '0'.
  INSERT ls_button INTO TABLE e_object->mt_toolbar.

ENDMETHOD.


METHOD on_before_user_command .

  DATA:
    lv_okcode  TYPE  syucomm.

  CASE e_ucomm.
    WHEN cl_gui_alv_grid=>mc_fc_detail.
      show_details( ).
      mo_alv_grid->set_user_command( lv_okcode ).
  ENDCASE.

ENDMETHOD.


METHOD on_changed_data_checks.

  DATA:
    lv_valid         TYPE  boole_d.

  FIELD-SYMBOLS:
    <ls_fv>          TYPE  any,
    <ls_table>       TYPE  any,
    <ls_keys>        TYPE  any,
    <ls_alv>         TYPE  any,
    <ls_aspect>      TYPE  any,
    <lt_alv>         TYPE  STANDARD TABLE,
    <lt_keys_error>  TYPE  STANDARD TABLE,
    <lt_update>      TYPE  STANDARD TABLE,
    <lt_aspect>      TYPE  STANDARD TABLE.

  create_data( ).

  ASSIGN:
    ms_fv->*         TO <ls_fv>,
    ms_alv->*        TO <ls_alv>,
    ms_keys->*       TO <ls_keys>,
    mt_update->*     TO <lt_update>,
    mt_aspect->*     TO <lt_aspect>,
    ms_aspect->*     TO <ls_aspect>,
    ms_table->*      TO <ls_table>,
    mt_alv->*        TO <lt_alv>,
    mt_keys_error->* TO <lt_keys_error>.

  CLEAR:
    <lt_aspect>,
    <lt_update>.

* View mode depending --------------------------------------------------
  CASE mv_view_mode.
*   In table view the ALV check_changed_data method is called
    WHEN /scmb/if_constant=>sc_table_view.
*     Set process flag
      mv_process_alv_event = abap_true.
*     Event 'DATA_CHANGED' is triggered -> see method ON_DATA_CHANGED
      mo_alv_grid->check_changed_data( IMPORTING e_valid = lv_valid ).
*     Abort the roundtrip if the data validation of the ALV grid fails
      IF lv_valid = abap_false.
        MESSAGE e014(/scmb/gen_messages).
      ENDIF.

*   Form view mode
    WHEN /scmb/if_constant=>sc_form_view.
      IF <ls_table> NE <ls_fv>.
*       Adjust backup structure
        MOVE <ls_table> TO <ls_fv>.
        CLEAR <ls_alv>.
*       Modify ALV table
        MOVE-CORRESPONDING <ls_table> TO <ls_alv>.
        READ TABLE <lt_alv> FROM <ls_alv> ASSIGNING <ls_alv>.
        MOVE-CORRESPONDING <ls_table> TO <ls_alv>.
        ASSIGN ms_alv->* TO <ls_alv>.

*       For text patterns specific coding is necessary
        IF mv_category = /scmb/if_constant=>sc_cat_text.
*         Append new line to update table
          MOVE-CORRESPONDING <ls_alv> TO <ls_aspect>.
          APPEND <ls_aspect> TO <lt_aspect>.
        ELSE.
          APPEND <ls_fv> TO <lt_aspect>.
        ENDIF.

*       If line was erroneous -> remove it from error itab
        MOVE-CORRESPONDING <ls_table> TO <ls_keys>.
        READ TABLE <lt_keys_error> FROM <ls_keys>
          TRANSPORTING NO FIELDS.
        IF sy-subrc EQ 0.
          DELETE <lt_keys_error> INDEX sy-tabix.
        ENDIF.
      ENDIF.

*     Add the lines marked as erroneous
      LOOP AT <lt_keys_error> INTO <ls_keys>.
        MOVE-CORRESPONDING <ls_keys> TO <ls_alv>.
        READ TABLE <lt_alv> FROM <ls_alv> INTO <ls_alv>.
        IF sy-subrc EQ 0.
          MOVE-CORRESPONDING <ls_alv> TO <ls_aspect>.
          APPEND <ls_aspect> TO <lt_aspect>.
        ENDIF.
        DELETE <lt_keys_error>.
      ENDLOOP.

*     Update only if changed/erroneous data is available
      CHECK NOT <lt_aspect> IS INITIAL.
      <lt_update> = <lt_aspect>.
  ENDCASE.

ENDMETHOD.


METHOD on_check_for_erroneous_data.

  FIELD-SYMBOLS:
    <lt_keys_error>  TYPE  STANDARD TABLE.

  create_data( ).

  ASSIGN mt_keys_error->* TO <lt_keys_error>.

  IF NOT <lt_keys_error> IS INITIAL.
    ss_data-v_erroneous_data = abap_true.
  ENDIF.

ENDMETHOD.


METHOD on_clear_focus.

  DATA:
    ls_celltab  TYPE  lvc_s_styl,
    lv_style    TYPE  char8.

  FIELD-SYMBOLS:
    <lt_alv>      TYPE  STANDARD TABLE,
    <lt_celltab>  TYPE  lvc_t_styl,
    <ls_celltab>  TYPE  lvc_s_styl,
    <ls_alv>      TYPE  ANY.

  create_data( ).

  ASSIGN:
    mt_alv->* TO <lt_alv>.

* Only if tabstrip has a focus -----------------------------------------
  CHECK NOT mv_focus_alv = abap_false.

* Find 'focused' ALV line ----------------------------------------------
  LOOP AT <lt_alv> ASSIGNING <ls_alv>.
    ASSIGN COMPONENT sc_component_celltab
      OF STRUCTURE <ls_alv> TO <lt_celltab>.

    LOOP AT <lt_celltab> ASSIGNING <ls_celltab>.
*     Remove old focus style
      lv_style = <ls_celltab>-style.
      FIND 'F' IN SECTION OFFSET 7 OF lv_style.
      IF sy-subrc EQ 0.
        REPLACE 'F' IN SECTION OFFSET 7 OF lv_style WITH '0'.
        <ls_celltab>-style = lv_style.
*       Remove celltab line if focus color was the only property
        IF <ls_celltab>-style = '00000000'.
          DELETE <lt_celltab>.
        ENDIF.
      ENDIF.
    ENDLOOP.

  ENDLOOP.

* Ensure refresh -------------------------------------------------------
  mv_refresh_necessary = abap_true.
  mv_focus_alv = abap_false.

ENDMETHOD.


METHOD on_clear_lock_table.

  FIELD-SYMBOLS:
    <lt_keys_error>  TYPE  STANDARD TABLE,
    <lt_keys_lock>   TYPE  STANDARD TABLE.

  create_data( ).

  ASSIGN:
    mt_keys_error->* TO <lt_keys_error>,
    mt_keys_lock->*  TO <lt_keys_lock>.

  CLEAR:
    <lt_keys_lock>,
    <lt_keys_error>.

ENDMETHOD.


METHOD ON_DATA_CHANGED .

  DATA:
    lv_index  TYPE  lvc_index.

  FIELD-SYMBOLS:
    <ls_good_cell>  TYPE  lvc_s_modi,
    <ls_protocol>   TYPE  lvc_s_msg1.

  CHECK NOT er_data_changed IS INITIAL.

* Get changed ALV rows -------------------------------------------------
  LOOP AT er_data_changed->mt_good_cells ASSIGNING <ls_good_cell>.
    lv_index = <ls_good_cell>-row_id.
    APPEND lv_index TO mt_alv_changed_index.
  ENDLOOP.

* Delete rows counted several times ------------------------------------
  SORT mt_alv_changed_index.
  DELETE ADJACENT DUPLICATES FROM mt_alv_changed_index.
  CLEAR lv_index.

* Delete those rows that contain errors --------------------------------
  LOOP AT er_data_changed->mt_protocol ASSIGNING <ls_protocol>.
    lv_index = <ls_protocol>-row_id.
    DELETE mt_alv_changed_index
      WHERE table_line = lv_index.
  ENDLOOP.

ENDMETHOD.


METHOD on_data_changed_finished .

  DATA:
    lv_new_update  TYPE  abap_bool.

  FIELD-SYMBOLS:
    <lt_keys_error>   TYPE  STANDARD TABLE,
    <ls_keys>         TYPE  ANY,
    <ls_keys_comp>    TYPE  ANY,
    <lt_alv>          TYPE  STANDARD TABLE,
    <ls_alv>          TYPE  data,
    <lt_update>       TYPE  STANDARD TABLE,
    <lt_aspect>       TYPE  STANDARD TABLE,
    <ls_aspect>       TYPE  data,
    <ls_aspect_comp>  TYPE  ANY,
    <lv_index>        TYPE  lvc_index.

  create_data( ).

  ASSIGN:
    mt_alv->*        TO <lt_alv>,
    ms_alv->*        TO <ls_alv>,
    mt_update->*     TO <lt_update>,
    mt_aspect->*     TO <lt_aspect>,
    ms_aspect->*     TO <ls_aspect>,
    ms_keys->*       TO <ls_keys>,
    ms_keys_comp->*  TO <ls_keys_comp>,
    mt_keys_error->* TO <lt_keys_error>.

  CLEAR:
    <lt_aspect>,
    <ls_aspect>,
    <ls_alv>.

* Check and set the process flag --------------------------------------
  CHECK mv_process_alv_event = abap_true
     OR mv_f4_help           = abap_true.
  mv_process_alv_event = abap_false.
  mv_f4_help           = abap_false.

* Execute only if data was modified -----------------------------------
  IF e_modified = abap_true.
    LOOP AT mt_alv_changed_index ASSIGNING <lv_index>.
*     Get the changed ALV itab rows and move them to SP itab
      READ TABLE <lt_alv> INDEX <lv_index> INTO <ls_alv>.
      MOVE-CORRESPONDING <ls_alv> TO <ls_aspect>.
      APPEND <ls_aspect> TO <lt_aspect>.
*     If line was erroneous -> remove it from error itab
      MOVE-CORRESPONDING <ls_alv> TO <ls_keys>.
      READ TABLE <lt_keys_error> FROM <ls_keys>
        TRANSPORTING NO FIELDS.
      IF sy-subrc EQ 0.
        DELETE <lt_keys_error> INDEX sy-tabix.
      ENDIF.
    ENDLOOP.
  ENDIF.

* Get lines marked as error -------------------------------------------
  LOOP AT <lt_keys_error> INTO <ls_keys>.
    MOVE-CORRESPONDING <ls_keys> TO <ls_alv>.
    READ TABLE <lt_alv> FROM <ls_alv> INTO <ls_alv>.
    IF sy-subrc EQ 0.
      MOVE-CORRESPONDING <ls_alv> TO <ls_aspect>.
      APPEND <ls_aspect> TO <lt_aspect>.
    ENDIF.
    DELETE <lt_keys_error>.
  ENDLOOP.

  CHECK NOT <lt_aspect> IS INITIAL.

* Buffer changed data -------------------------------------------------
  IF <lt_update> IS INITIAL.
    <lt_update> = <lt_aspect>.
  ELSE.
*   In case of F4 usage in the ALV grid it can happen that this method
*   is called twice; in that case is has to be ensured, that the new
*   values created are taken over; since the aspect table is defined
*   without keys the comparison has to be done with two loops
    LOOP AT <lt_aspect> INTO <ls_aspect>.
      lv_new_update = abap_true.
      MOVE-CORRESPONDING <ls_aspect> TO <ls_keys>.
      LOOP AT <lt_update> ASSIGNING <ls_aspect_comp>.
        MOVE-CORRESPONDING <ls_aspect_comp> TO <ls_keys_comp>.
        IF <ls_keys_comp> = <ls_keys>.
          <ls_aspect_comp> = <ls_aspect>.
          lv_new_update = abap_false.
          EXIT.
        ENDIF.
      ENDLOOP.
      IF lv_new_update = abap_true.
        APPEND <ls_aspect> TO <lt_update>.
      ENDIF.
    ENDLOOP.
  ENDIF.

  CLEAR mt_alv_changed_index.

ENDMETHOD.


METHOD on_default_values_changed.

  RAISE EVENT default_data_changed.

ENDMETHOD.


METHOD ON_DOUBLE_CLICK .

  DATA:
    ls_index_rows  TYPE  lvc_s_row.

  FIELD-SYMBOLS:
    <lt_keys_work>  TYPE  STANDARD TABLE,
    <lt_keys_sel>   TYPE  STANDARD TABLE,
    <ls_keys>       TYPE  ANY,
    <lt_alv>        TYPE  STANDARD TABLE,
    <ls_alv>        TYPE  ANY.

  create_data( ).

  ASSIGN:
    mt_alv->*        TO <lt_alv>,
    ms_alv->*        TO <ls_alv>,
    mt_keys_work->*  TO <lt_keys_work>,
    mt_keys_sel->*   TO <lt_keys_sel>,
    ms_keys->*       TO <ls_keys>.

* Check for double click on column title or SELECT ALL -----------------
  CHECK NOT e_row IS INITIAL.

* Execute updates ------------------------------------------------------
  RAISE EVENT execute_update.

* Set selected line ----------------------------------------------------
  CLEAR mt_index_rows.
  APPEND e_row TO mt_index_rows.
  set_selected_rows( mt_index_rows ).

* Check if selection has changed ---------------------------------------
  LOOP AT mt_index_rows INTO ls_index_rows.
    READ TABLE <lt_alv> INTO <ls_alv> INDEX ls_index_rows-index.
    MOVE-CORRESPONDING <ls_alv> TO <ls_keys>.
    APPEND <ls_keys> TO <lt_keys_work>.
  ENDLOOP.

* Sort and compare key tables ------------------------------------------
  SORT:
    <lt_keys_work>,
    <lt_keys_sel>.
  IF <lt_keys_work> NE <lt_keys_sel>.
    mv_selection_changed = abap_true.
    IF trigger_error_checks( ) = abap_false.
      RETURN.
    ENDIF.
  ENDIF.

* If OIP involved, check for selection change --------------------------
  IF mv_classname = sv_class_name_oip AND
     mv_selection_changed = abap_true.
    IF check_for_unsaved_data( abap_false ) = abap_false.
      RETURN.
    ENDIF.
  ENDIF.

* Refresh ODPs first, to ensure that lower FVs are filled -------------
  RAISE EVENT initialize_odp
    EXPORTING
      iv_class_name        = mv_classname
      iv_aspect_name       = mv_aspect_name
      iv_init_inactive_rel = abap_true.

* Trigger data reads for ODP(s) ---------------------------------------
  check_table_view_selection( iv_index_filled = abap_true ).

ENDMETHOD.


METHOD on_end_of_init.

  DATA:
    ls_aspect_mapping  TYPE  /scmb/s_aspect_relations.

* Create superior aspect structure -------------------------------------
  READ TABLE ss_data-t_aspect_mapping
    WITH KEY v_aspect = mv_superior_aspect
    INTO ls_aspect_mapping.
  IF sy-subrc EQ 0.
    CREATE DATA ms_aspect_sup TYPE (ls_aspect_mapping-v_structure).
  ENDIF.
* Set relations --------------------------------------------------------
  IF  mv_classname = sv_class_name_odp1
  AND mv_tab_number = get_active_tab( ).
    RAISE EVENT set_relations
      EXPORTING iv_class_name  = mv_classname
                iv_aspect_name = mv_aspect_name.
    IF ss_data-s_odp2_handling IS NOT INITIAL.
      hide_odp2( ).
    ENDIF.
  ENDIF.

* Create ALV grid -----------------------------------------------------
  IF mv_category = /scmb/if_constant=>sc_cat_standard
  OR mv_category = /scmb/if_constant=>sc_cat_text.
    IF get_active_tab( ) = mv_tab_number.
      create_toolbar( ).
      create_alv( ).
      IF mv_category = /scmb/if_constant=>sc_cat_text.
        constructor_text( ).
      ENDIF.
    ENDIF.
  ENDIF.

ENDMETHOD.


METHOD on_end_of_queue.

* Sideeffect 'UNDEFINED' -----------------------------------------------
  IF ss_data-v_do_undefined_se = sc_und_se_normal  OR
     ss_data-v_do_undefined_se = sc_und_se_delete.
    do_sideeffect_undefined( ).
    clear_undefined_se_flag( ).
  ENDIF.

* Sideeffect 'ASPECT' --------------------------------------------------
  IF mv_do_sideeffect_aspect = abap_true.
    mv_do_sideeffect_aspect = abap_false.
    do_sideeffect_aspect( ).
  ENDIF.

* Clear roundtrip relevant attributes ----------------------------------
  CLEAR:
    mv_selection_changed.

ENDMETHOD.


METHOD on_execute_update.

  FIELD-SYMBOLS:
    <lt_update>  TYPE  STANDARD TABLE.

  create_data( ).

  ASSIGN:
    mt_update->* TO <lt_update>.

  CHECK NOT <lt_update> IS INITIAL.
  update( <lt_update> ).
  CLEAR <lt_update>.

ENDMETHOD.


METHOD on_exit_framework.

  ss_data-v_continue = check_for_unsaved_data( abap_true ).
  IF iv_refresh = abap_true.
    set_undefined_se_flag( ).
  ENDIF.

ENDMETHOD.


METHOD on_f4.

* Remember F4 Event ----------------------------------------------------
  mv_f4_help = abap_true.

ENDMETHOD.


METHOD on_initialize_instances.

  FIELD-SYMBOLS:
    <ls_table>  TYPE  ANY.

  ASSIGN ms_table->* TO <ls_table>.

* Free registered instances --------------------------------------------
  SET HANDLER on_exit_framework         ACTIVATION ' '.
  SET HANDLER on_default_values_changed ACTIVATION ' '.

  IF mv_classname = sv_class_name_oip.
    SET HANDLER:
      on_publish_repid  ACTIVATION ' ',
      on_initial_select ACTIVATION ' ',
      on_initial_query  ACTIVATION ' '.
  ENDIF.
  SET HANDLER:
    on_check_for_erroneous_data ACTIVATION ' ',
    on_end_of_init              ACTIVATION ' ',
    on_end_of_queue             ACTIVATION ' ',
    on_process_fcontrol         ACTIVATION ' ',
    on_changed_data_checks      ACTIVATION ' ',
    on_execute_update           ACTIVATION ' ',
    on_refresh_display          ACTIVATION ' ',
    on_initialize_instances     ACTIVATION ' ',
    on_clear_focus              ACTIVATION ' ',
    on_upd_superior_aspect      FOR ALL INSTANCES ACTIVATION ' ',
    on_set_relations            FOR ALL INSTANCES ACTIVATION ' ',
    on_clear_lock_table         FOR ALL INSTANCES ACTIVATION ' ',
    on_initialize_odp           FOR ALL INSTANCES ACTIVATION ' ',
    on_trigger_sbr              FOR ALL INSTANCES ACTIVATION ' ',
    on_undefined_sideeffect     FOR ALL INSTANCES ACTIVATION ' '.

* Catgory specific coding ----------------------------------------------
  CASE mv_category.
    WHEN /scmb/if_constant=>sc_cat_text
      OR /scmb/if_constant=>sc_cat_standard.
      CLEAR <ls_table>.
    WHEN /scmb/if_constant=>sc_cat_ppf.
      SET HANDLER on_ppf_grid_changed FOR ALL INSTANCES ACTIVATION ' '.
  ENDCASE.

* Free ALV grid and control --------------------------------------------
  IF mo_alv_grid IS BOUND.
    mo_alv_grid->free( ).
    mo_container_alv->free( ).
  ENDIF.
  IF mo_toolbar IS BOUND.
    mo_toolbar->free( ).
  ENDIF.
  FREE:
    mo_alv_grid,
    mo_toolbar,
    mo_container_alv.

* Free text control and container --------------------------------------
  IF mo_text IS BOUND.
    mo_text->free( ).
    mo_container_text->free( ).
    FREE:
      mo_text,
      mo_container_text.
  ENDIF.

ENDMETHOD.


METHOD on_initialize_odp.

  DATA:
    lv_classname_compare  TYPE  abap_abstypename.

  FIELD-SYMBOLS:
    <lt_keys_rel>  TYPE  STANDARD TABLE.

  create_data( ).

  ASSIGN:
    mt_keys_rel->*  TO <lt_keys_rel>.

* Only for active relations --------------------------------------------
  CHECK mv_relation_active   = abap_true
     OR iv_init_inactive_rel = abap_true.

* Set comparison class names for raising class -------------------------
  CASE mv_classname.
    WHEN sv_class_name_odp1.
      lv_classname_compare = sv_class_name_oip.
    WHEN sv_class_name_odp2.
      lv_classname_compare = sv_class_name_odp1.
    WHEN OTHERS.
      RETURN.
  ENDCASE.

* Only for superior aspect and correct relation ------------------------
  CHECK iv_class_name  = lv_classname_compare.
  CHECK iv_aspect_name = mv_superior_aspect.

  IF mv_sbr_wo_relkey = abap_false.
*   Reset data of ODP tabstrips
    CASE mv_category.
      WHEN /scmb/if_constant=>sc_cat_standard  OR
           /scmb/if_constant=>sc_cat_text.
        reset_all(
          iv_keep_selection     = iv_keep_selection
          iv_keep_relation_keys = abap_false
          iv_keep_error_keys    = abap_false
          iv_init_inactive_rel  = iv_init_inactive_rel ).
        update_pager_state( ).
      WHEN /scmb/if_constant=>sc_cat_ppf.
        reset_ppf( ).
    ENDCASE.
* SBR allowed even without relation keys
  ELSE.
    CLEAR <lt_keys_rel>.
    select_by_relation(
      iv_keep_selection  = abap_true
      iv_keep_error_keys = abap_true ).
  ENDIF.

ENDMETHOD.


METHOD on_initial_query.

  DATA:
    lv_rejected  TYPE  abap_bool.

  FIELD-SYMBOLS:
    <lt_aspect>  TYPE  STANDARD TABLE.

  create_data( ).

* Assign field symbols -------------------------------------------------
  ASSIGN:
    mt_aspect->* TO <lt_aspect>.

  CLEAR <lt_aspect>.

* Resets ---------------------------------------------------------------
  reset_all( iv_keep_selection     = abap_false
             iv_keep_relation_keys = abap_false
             iv_keep_error_keys    = abap_false
             iv_init_inactive_rel  = abap_true ).
  IF ss_data-o_ppf_manager IS BOUND.
    ss_data-o_ppf_manager->refresh( EXPORTING clear_all = abap_true ).
  ENDIF.

* Start service provider query -----------------------------------------
* Clear ACTION IMPORTING parameters
  CLEAR:
    lv_rejected,
    <lt_aspect>.
  IF NOT is_options IS INITIAL.
    CALL METHOD ss_data-o_sp->('QUERY')
      EXPORTING
        query      = mv_query
        selections = it_selection
        OPTIONS    = is_options
      IMPORTING
        outrecords = <lt_aspect>
        rejected   = lv_rejected.
  ELSE.
    CALL METHOD ss_data-o_sp->('QUERY')
      EXPORTING
        query      = mv_query
        selections = it_selection
      IMPORTING
        outrecords = <lt_aspect>
        rejected   = lv_rejected.
  ENDIF.
  IF lv_rejected = abap_true.
    so_message_handler->display_messages( ).
    RETURN.
  ENDIF.

* Convert data ---------------------------------------------------------
  convert_data_for_alv( <lt_aspect> ).
  mv_refresh_necessary = sc_refresh_normal.

* Check number of results ----------------------------------------------
  check_query_result( ).

ENDMETHOD.


METHOD on_initial_select.

  DATA:
    lv_text          TYPE  string,                          "#EC NEEDED
    lv_rejected      TYPE  boole_d,
    lt_return_codes  TYPE  /scmb/t_sp_return_code.          "#EC NEEDED

  FIELD-SYMBOLS:
    <lt_svp>   TYPE  STANDARD TABLE,
    <lt_keys>  TYPE  STANDARD TABLE,
    <ls_keys>  TYPE  ANY.

  create_data( ).

  ASSIGN:
    mt_keys_work->* TO <lt_keys>,
    ms_keys->*      TO <ls_keys>,
    mt_aspect->*    TO <lt_svp>.

  CLEAR <lt_svp>.

* Execute only for active tabstrip -------------------------------------
  CHECK mv_tab_number = get_active_tab( ).

* Resets ---------------------------------------------------------------
  reset_all(
    iv_keep_selection     = abap_false
    iv_keep_relation_keys = abap_false
    iv_keep_error_keys    = abap_false
    iv_init_inactive_rel  = abap_true ).
  IF ss_data-o_ppf_manager IS BOUND.
    ss_data-o_ppf_manager->refresh( EXPORTING clear_all = abap_true ).
  ENDIF.

* Fill key table -------------------------------------------------------
  IF is_key IS SUPPLIED.
    APPEND is_key TO <lt_keys>.
  ELSE.
    <lt_keys> = it_keys.
  ENDIF.

* Read objects ---------------------------------------------------------
* Clear ACTION IMPORTING parameters
  CLEAR:
    <lt_svp>.
  CALL METHOD ss_data-o_sp->('SELECT')
    EXPORTING
      inkeys       = <lt_keys>
      aspect       = mv_aspect_name
    IMPORTING
      outrecords   = <lt_svp>
      rejected     = lv_rejected
      return_codes = lt_return_codes.
  IF lv_rejected = abap_true.
    so_message_handler->display_messages( ).
    RETURN.
  ENDIF.

* Output message if no data is found -----------------------------------
  IF <lt_svp> IS INITIAL.
    MESSAGE s020(/scmb/esa_emulation) INTO lv_text.
    add_system_message( ).
*   This method should only be called initially at transaction start
*   -> this means that no PAI is executed and therefore the transaction
*      will not call 'display_messages'
*   -> framework has to trigger the message display
    so_message_handler->display_messages( ).
    RETURN.
  ENDIF.

* Convert data ---------------------------------------------------------
  convert_data_for_alv( <lt_svp> ).
  mv_refresh_necessary = sc_refresh_normal.

* Check query result and display data ----------------------------------
  check_query_result( ).

ENDMETHOD.


METHOD on_pager_down.

* Execute updates ------------------------------------------------------
  RAISE EVENT execute_update.

* Get data -------------------------------------------------------------
  get_data_for_form_view( sc_pager_down ).
  event_exit( /scmb/if_constant=>sc_event_pager_down ).

ENDMETHOD.


METHOD on_pager_up.

* Execute updates ------------------------------------------------------
  RAISE EVENT execute_update.

* Get data -------------------------------------------------------------
  get_data_for_form_view( sc_pager_up ).
  event_exit( /scmb/if_constant=>sc_event_pager_up ).

ENDMETHOD.


METHOD on_ppf_grid_changed.

  IF cause <>  'PAI_STARTED'.
    set_unsaved_data_flag( ).
  ENDIF.

ENDMETHOD.


METHOD on_process_fcontrol.

  FIELD-SYMBOLS:
    <lt_fc>  TYPE SORTED TABLE.

  create_data( ).

* Assign field symbols -------------------------------------------------
  ASSIGN mt_fcontrol->* TO <lt_fc>.

* Exit if no fieldcontrol information is available ---------------------
  CHECK NOT <lt_fc> IS INITIAL.

* Fieldcontrol for the list view ---------------------------------------
  set_attributes_for_lv( CHANGING ct_fieldcontrol = <lt_fc> ).

* Set form view attributes if necessary --------------------------------
  IF mv_view_mode = /scmb/if_constant=>sc_form_view.
    set_attributes_for_form_view( ).
  ENDIF.

ENDMETHOD.


METHOD on_publish_repid.

  sv_repid = repid.

ENDMETHOD.


METHOD on_refresh_display.

* Exit if refresh is not required --------------------------------------
  CHECK mo_alv_grid IS BOUND
    AND mv_refresh_necessary NE sc_refresh_none
    AND mv_tab_number = get_active_tab( )
    AND mv_view_mode  = /scmb/if_constant=>sc_table_view.

  CASE mv_refresh_necessary.
    WHEN sc_refresh_normal.
      soft_refresh( ).
    WHEN sc_refresh_complete.
      set_table_for_first_display( ).
  ENDCASE.

* Select lines only if no focus is set ---------------------------------
  IF mv_focus_alv EQ abap_false.
    select_rows_for_keytable( ).
  ENDIF.

ENDMETHOD.


METHOD on_set_relations.

  DATA:
    lv_class_compare  TYPE  abap_abstypename,
    lv_active         TYPE  abap_bool.

* Determine class name to compare with ---------------------------------
  CASE iv_class_name.
    WHEN sv_class_name_oip.
      lv_class_compare = sv_class_name_odp1.
    WHEN sv_class_name_odp1.
      lv_class_compare = sv_class_name_odp2.
  ENDCASE.

  CHECK lv_class_compare = mv_classname.

* Set flags dependent on relation to sending aspect --------------------
  IF iv_aspect_name = mv_superior_aspect.
    mv_relation_active = abap_true.
    lv_active = abap_true.
  ELSE.
    mv_relation_active = abap_false.
    lv_active = abap_false.
  ENDIF.

* Activate ODP2 if actual tabstrip is the active tabstrip --------------
  CHECK mv_tab_number = get_active_tab( ).
**  RAISE EVENT odp2_active EXPORTING iv_active = lv_active.
**  Should not be used anymore
  IF mv_relation_active = abap_true.
    IF mv_category = /scmb/if_constant=>sc_cat_standard
    OR mv_category = /scmb/if_constant=>sc_cat_text.
      create_toolbar( ).
      create_alv( ).
      IF mv_category = /scmb/if_constant=>sc_cat_text.
        constructor_text( ).
      ENDIF.
    ENDIF.
  ENDIF.

ENDMETHOD.


METHOD on_toggle_view.

  toggle_view( ).
  event_exit( /scmb/if_constant=>sc_event_toggle ).

ENDMETHOD.


METHOD on_trigger_sbr.

  DATA:
    lv_class_compare    TYPE  abap_abstypename,
    lv_keep_error_keys  TYPE  abap_bool.

  FIELD-SYMBOLS:
    <lt_new_key>    TYPE STANDARD TABLE,
    <lt_keys_rel>   TYPE STANDARD TABLE.

* Only for active relations --------------------------------------------
  CHECK mv_relation_active  = abap_true
     OR mv_sbr_for_inactive = abap_true.

  create_data( ).

* Assign field symbols -------------------------------------------------
  ASSIGN:
    is_relation_key->* TO <lt_new_key>,
    mt_keys_rel->*     TO <lt_keys_rel>.

* Determine the correct class name to compare with io_sender -----------
  CASE mv_classname.
    WHEN sv_class_name_odp1.
      lv_class_compare = sv_class_name_oip.
    WHEN sv_class_name_odp2.
      lv_class_compare = sv_class_name_odp1.
  ENDCASE.

* Check on relation ----------------------------------------------------
  CHECK iv_aspect_name = mv_superior_aspect.

* Exit if the message is send not by directly superior pattern ---------
  CHECK iv_class_name = lv_class_compare.

* Save the new keys ----------------------------------------------------
  <lt_keys_rel> = <lt_new_key>.

* Force new SBR by setting the valid data flag to 'false' --------------
  mv_data_valid = abap_false.

* Exit for non-active tabstrips ----------------------------------------
  CHECK mv_tab_number = get_active_tab( )
    OR mv_sbr_for_inactive = abap_true.

* Start 'SELECT BY RELATION' -------------------------------------------
  IF iv_selection_changed = abap_true.
    lv_keep_error_keys = abap_false.
  ELSE.
    lv_keep_error_keys = abap_true.
  ENDIF.
  select_by_relation(
    iv_keep_selection  = abap_true
    iv_keep_error_keys = lv_keep_error_keys ).

ENDMETHOD.


METHOD on_undefined_sideeffect.

  DATA:
    lv_include_deleted  TYPE  abap_bool.

  CHECK mv_relation_active = abap_true.

* Do sideeffect depending on the pattern type --------------------------
  CASE mv_classname.
    WHEN sv_class_name_odp1 OR sv_class_name_odp2.
      mv_do_sideeffect_aspect = abap_false.
      refresh_odp( ).
    WHEN sv_class_name_oip.
      IF ss_data-v_do_undefined_se = sc_und_se_delete.
        lv_include_deleted = abap_true.
      ELSE.
        lv_include_deleted = abap_false.
      ENDIF.
      refresh_oip( lv_include_deleted ).
  ENDCASE.

ENDMETHOD.


METHOD on_upd_superior_aspect.

  FIELD-SYMBOLS:
    <lt_aspect>    TYPE  STANDARD TABLE,
    <ls_keys>      TYPE  ANY,
    <ls_keys_comp> TYPE  ANY,
    <ls_table>     TYPE  ANY.

  create_data( ).

  ASSIGN:
    mt_aspect->*    TO <lt_aspect>,
    ms_table->*     TO <ls_table>,
    ms_keys_comp->* TO <ls_keys_comp>,
    ms_keys->*      TO <ls_keys>.

* Only relevant for the superior aspect of the calling aspect ----------
  CHECK mv_aspect_name = iv_aspect_name.

* Clear and fill aspect table, modify ALV table ------------------------
  CLEAR <lt_aspect>.
  APPEND is_aspect_structure TO <lt_aspect>.
  modify_alv_table( <lt_aspect> ).

* Always update TABLES structure ---------------------------------------
  MOVE-CORRESPONDING:
    <ls_table> TO <ls_keys>,
    is_aspect_structure TO <ls_keys_comp>.
  IF <ls_keys_comp> = <ls_keys>.
    <ls_table> = is_aspect_structure.
  ENDIF.

ENDMETHOD.


METHOD ON_USER_COMMAND .

  CASE e_ucomm.
*   ALV details functionality (number of lines...)
    WHEN sc_ok_alv_line_details.
      display_alv_line_details( ).
*   OIP layout functionality
    WHEN OTHERS.
      so_controller->okcode_dispatch(
        CHANGING cv_okcode = e_ucomm ).
  ENDCASE.

ENDMETHOD.


METHOD preset_default_values.

  /scmb/cl_ees_defaults=>preset(
    EXPORTING  is_values      = is_default_data
    EXCEPTIONS internal_error = 1
               OTHERS         = 2 ).
  IF sy-subrc <> 0.
    ASSERT ID /scmb/pattern_framework CONDITION 1 = 0.
  ENDIF.

ENDMETHOD.


METHOD refresh_odp.

  DATA:
    lv_active_tab  TYPE  int4.

  mv_data_valid = abap_false.

* Check if SBR is required ---------------------------------------------
  lv_active_tab = get_active_tab( ).
  CHECK mv_tab_number = lv_active_tab
    OR mv_sbr_for_inactive = abap_true.

* Start 'SELECT BY RELATION' -------------------------------------------
  select_by_relation(
    iv_keep_selection  = abap_true
    iv_keep_error_keys = abap_true ).

ENDMETHOD.


METHOD refresh_oip .

  DATA:
    lv_select  TYPE  char1,
    lv_lines   TYPE  i.

  FIELD-SYMBOLS:
    <lt_alv>        TYPE  STANDARD TABLE,
    <lt_keys_work>  TYPE  STANDARD TABLE,
    <lt_keys_sel>   TYPE  STANDARD TABLE,
    <lt_keys_del>   TYPE  STANDARD TABLE,
    <ls_table>      TYPE  ANY,
    <ls_alv>        TYPE  ANY,
    <ls_keys>       TYPE  ANY.

  create_data( ).

  ASSIGN:
    ms_table->*     TO <ls_table>,
    mt_alv->*       TO <lt_alv>,
    mt_keys_work->* TO <lt_keys_work>,
    mt_keys_sel->*  TO <lt_keys_sel>,
    mt_keys_del->*  TO <lt_keys_del>,
    ms_alv->*       TO <ls_alv>,
    ms_keys->*      TO <ls_keys>.

* Remove old data ------------------------------------------------------
  CLEAR:
    <lt_keys_work>,
    <ls_alv>.

* Get the keys of all OIP items ----------------------------------------
  LOOP AT <lt_alv> INTO <ls_alv>.
    MOVE-CORRESPONDING <ls_alv> TO <ls_keys>.
    APPEND <ls_keys> TO <lt_keys_work>.
  ENDLOOP.
  IF <lt_keys_work> IS INITIAL.
    RETURN.
  ENDIF.

* Add keys of deleted lines if required --------------------------------
  IF iv_include_deleted = abap_true.
    LOOP AT <lt_keys_del> INTO <ls_keys>.
      READ TABLE <lt_keys_work> FROM <ls_keys> TRANSPORTING NO FIELDS.
      IF sy-subrc EQ 4.
        APPEND <ls_keys> TO <lt_keys_work>.
      ENDIF.
    ENDLOOP.
    CLEAR <lt_keys_del>.
  ENDIF.

* Select ---------------------------------------------------------------
  lv_select = select( <lt_keys_work> ).
  DESCRIBE TABLE <lt_keys_sel> LINES lv_lines.
  IF lv_select = sc_cancel_delete AND lv_lines = 0.
    RAISE EVENT initialize_odp
      EXPORTING
        iv_class_name  = mv_classname
        iv_aspect_name = mv_aspect_name.
  ENDIF.

* Update aspect structure ----------------------------------------------
  IF lv_lines = 1.
    READ TABLE <lt_keys_sel> INDEX 1 INTO <ls_keys>.
    MOVE-CORRESPONDING <ls_keys> TO <ls_alv>.
    READ TABLE <lt_alv> FROM <ls_alv> INTO <ls_alv>.
    IF sy-subrc EQ 0.
      MOVE-CORRESPONDING <ls_alv> TO <ls_table>.
    ENDIF.
  ENDIF.

ENDMETHOD.


METHOD register_alv_f4.

  DATA:
    lt_f4    TYPE  lvc_t_f4,
    ls_f4    TYPE  lvc_s_f4,
    ls_comp  TYPE  abap_compdescr.

* Fill table for ALV method --------------------------------------------
  LOOP AT io_struc->components INTO ls_comp.
    ls_f4-fieldname  = ls_comp-name.
    ls_f4-register   = abap_true.
    ls_f4-chngeafter = abap_true.
    INSERT ls_f4 INTO TABLE lt_f4.
  ENDLOOP.

* Register at ALV ------------------------------------------------------
  IF mo_alv_grid IS BOUND.
    mo_alv_grid->register_f4_for_fields( lt_f4 ).
  ENDIF.

ENDMETHOD.


METHOD reset_all .

  FIELD-SYMBOLS:
    <lt_alv>         TYPE  STANDARD TABLE,
    <lt_keys_sel>    TYPE  STANDARD TABLE,
    <lt_keys_rel>    TYPE  STANDARD TABLE,
    <lt_keys_work>   TYPE  STANDARD TABLE,
    <lt_keys_error>  TYPE  STANDARD TABLE,
    <ls_fv>          TYPE  ANY,
    <ls_table>       TYPE  ANY,
    <ls_alv>         TYPE  ANY,
    <lt_aspect>      TYPE  STANDARD TABLE.

  create_data( ).

  ASSIGN:
    mt_alv->*        TO <lt_alv>,
    mt_keys_sel->*   TO <lt_keys_sel>,
    ms_fv->*         TO <ls_fv>,
    mt_keys_rel->*   TO <lt_keys_rel>,
    mt_keys_work->*  TO <lt_keys_work>,
    mt_keys_error->* TO <lt_keys_error>,
    ms_alv->*        TO <ls_alv>,
    ms_table->*      TO <ls_table>,
    mt_aspect->*     TO <lt_aspect>.

  CLEAR:
    <ls_fv>,
    <ls_alv>,
    <lt_keys_work>,
    <lt_aspect>,
    mt_index_rows,
    mt_fv_attributes.

* Check for active relation --------------------------------------------
  CHECK mv_relation_active   = abap_true
     OR iv_init_inactive_rel = abap_true.

* Clear keys of erroneous lines ----------------------------------------
  IF iv_keep_error_keys = abap_false.
    CLEAR <lt_keys_error>.
  ENDIF.

* Clear selection key table if requested -------------------------------
  IF iv_keep_selection = abap_false.
    CLEAR:
      <lt_keys_sel>,
      <ls_table>.
  ENDIF.

* For text pattern clear the text edit control -------------------------
  IF  mv_category = /scmb/if_constant=>sc_cat_text
  AND mo_text is BOUND.
    mo_text->delete_text( ).
  ENDIF.

  IF iv_keep_relation_keys = abap_false.
*   Clear the relation key table (obsolete for OIP)
    CLEAR <lt_keys_rel>.
  ENDIF.

* Set the valid data flag to false -------------------------------------
  mv_data_valid = abap_false.

* For performance reasons clear the grid only if it contains data ------
  IF NOT <lt_alv> IS INITIAL.
    CLEAR <lt_alv>.
    mv_refresh_necessary = sc_refresh_normal.
  ENDIF.

* Determine the correct class name to compare with io_sender -----------
  CHECK NOT mv_classname = sv_class_name_odp2.
  RAISE EVENT initialize_odp
    EXPORTING
      iv_class_name        = mv_classname
      iv_aspect_name       = mv_aspect_name
      iv_keep_selection    = iv_keep_selection
      iv_init_inactive_rel = iv_init_inactive_rel.

ENDMETHOD.


METHOD reset_ppf.

  FIELD-SYMBOLS:
    <lt_keys_rel>  TYPE  STANDARD TABLE.

  create_data( ).

  ASSIGN:
    mt_keys_rel->*  TO <lt_keys_rel>.

* Check for active relation --------------------------------------------
  CHECK mv_relation_active = abap_true.

  IF iv_keep_relation_keys = abap_false.
*   Clear the relation key table (obsolete for OIP)
    CLEAR <lt_keys_rel>.
  ENDIF.

  mv_data_valid = abap_false.

* Avoid unnecessary round trips ----------------------------------------
  CHECK mv_tab_number = get_active_tab( ).
  CALL FUNCTION 'SPPF_VIEW_END_CRM'
    EXPORTING
      ip_free_grid = abap_true.

ENDMETHOD.


METHOD rollback.

* Rollback work, refresh PPF manager -----------------------------------
  ROLLBACK WORK.
  IF ss_data-o_ppf_manager IS BOUND.
    ss_data-o_ppf_manager->refresh( EXPORTING clear_all = abap_true ).
  ENDIF.

* Call CLEANUP method of service provider ------------------------------
  CALL METHOD ss_data-o_sp->('CLEANUP')
    EXPORTING
      reason = /scmb/if_sp_transaction=>sc_cleanup_commit.
  cleanup( ).

* Trigger undefined SE -------------------------------------------------
  set_undefined_se_flag( ).

* Delete dynpros (dynpro generation) -----------------------------------
*  CALL FUNCTION '/SCMB/EES_DYNCLEANUP'.

ENDMETHOD.


METHOD sapscript_editor.

  DATA:
    lv_cancel    TYPE  abap_char1,
    lv_lines     TYPE  i,
    lv_text      TYPE  string,
    lt_text_old  TYPE  tline_tab,
    lt_text_new  TYPE  tline_tab,
    lv_display   TYPE  abap_bool,
    ls_header    TYPE  thead.

  FIELD-SYMBOLS:
    <lt_alv>         TYPE  STANDARD TABLE,
    <lt_keys_sel>    TYPE  STANDARD TABLE,
    <lt_keys_work>   TYPE  STANDARD TABLE,
    <lt_aspect>      TYPE  STANDARD TABLE,
    <lt_text>        TYPE  tline_tab,
    <ls_aspect>      TYPE  ANY,
    <lv_changemode>  TYPE  ANY,
    <ls_alv>         TYPE  ANY,
    <ls_keys>        TYPE  ANY,
    <ls_table>       TYPE  ANY,
    <ls_fv>          TYPE  ANY.

  create_data( ).

  ASSIGN:
    mt_alv->*       TO <lt_alv>,
    ms_alv->*       TO <ls_alv>,
    mt_keys_sel->*  TO <lt_keys_sel>,
    mt_keys_work->* TO <lt_keys_work>,
    ms_keys->*      TO <ls_keys>,
    ms_fv->*        TO <ls_fv>,
    ms_aspect->*    TO <ls_aspect>,
    mt_aspect->*    TO <lt_aspect>,
    ms_table->*     TO <ls_table>.

  CLEAR:
    <lt_keys_work>.

* Execute updates ------------------------------------------------------
  RAISE EVENT execute_update.

* View dependent coding ------------------------------------------------
  CASE mv_view_mode.
    WHEN /scmb/if_constant=>sc_table_view.
*     Check if saving is necessary
      CHECK check_selection_change( ) = abap_true.
      IF mv_selection_changed = abap_true  AND
        mv_classname = sv_class_name_oip.
        IF check_for_unsaved_data( abap_false ) = abap_false.
          EXIT.
        ENDIF.
      ENDIF.
      lv_cancel = check_table_view_selection(
        iv_no_message   = abap_true
        iv_index_filled = abap_true ).
      DESCRIBE TABLE <lt_keys_sel> LINES lv_lines.
      IF lv_lines EQ 0.
        MESSAGE s007(/scmb/esa_emulation) INTO lv_text.
        add_system_message( ).
        RETURN.
      ENDIF.
      IF lv_lines NE 1.
        MESSAGE s010(/scmb/esa_emulation) INTO lv_text.
        add_system_message( ).
        RETURN.
      ENDIF.
      <lt_keys_work> = <lt_keys_sel>.
    WHEN /scmb/if_constant=>sc_form_view.
      IF <ls_table> IS INITIAL.
        RETURN.
      ENDIF.
      MOVE-CORRESPONDING <ls_table> TO <ls_keys>.
      APPEND <ls_keys> TO <lt_keys_work>.
      lv_cancel = select( <lt_keys_work> ).
  ENDCASE.

* Evaluate select ------------------------------------------------------
  CHECK lv_cancel NE sc_cancel_rejected.
  DESCRIBE TABLE <lt_keys_work> LINES lv_lines.
* Fill/clear ODPs
  IF lv_lines EQ 0 OR (
    mv_multiple_selection = abap_false AND lv_lines > 1 ).
    RAISE EVENT initialize_odp
      EXPORTING iv_class_name  = mv_classname
                iv_aspect_name = mv_aspect_name.
  ELSE.
    RAISE EVENT trigger_sbr
      EXPORTING iv_class_name        = mv_classname
                is_relation_key      = mt_keys_work
                iv_aspect_name       = mv_aspect_name
                iv_selection_changed = mv_selection_changed.
  ENDIF.

* One line selected ----------------------------------------------------
  IF lv_lines = 1.
*   Prepare data for sapscript function module
    READ TABLE <lt_keys_work> INTO <ls_keys> INDEX 1.
    MOVE-CORRESPONDING <ls_keys> TO <ls_alv>.
    READ TABLE <lt_alv> FROM <ls_alv> INTO <ls_alv>.
    IF sy-subrc EQ 0.
*     Set header
      MOVE-CORRESPONDING <ls_alv> TO ls_header.
*     Set lines
      ASSIGN COMPONENT sc_component_text_lines
        OF STRUCTURE <ls_alv> TO <lt_text>.
      lt_text_old = <lt_text>.
      lt_text_new = lt_text_old.
*     Set display mode
      ASSIGN COMPONENT sc_component_changemode
        OF STRUCTURE <ls_alv> TO <lv_changemode>.
      IF <lv_changemode> = abap_true.
        lv_display = abap_false.
      ELSE.
        lv_display = abap_true.
      ENDIF.
    ELSE.
      ASSERT ID /scmb/pattern_framework CONDITION 1 = 0.
    ENDIF.
  ENDIF.
  IF lv_cancel = sc_cancel_delete.
    MESSAGE s008(/scmb/esa_emulation) INTO lv_text.
    add_system_message( ).
    RETURN.
  ENDIF.

* Call sapscript editor ------------------------------------------------
  CALL FUNCTION 'EDIT_TEXT'
    EXPORTING
      display             = lv_display
      header              = ls_header
      save                = abap_false
    TABLES
      lines               = lt_text_new
    EXCEPTIONS
      id                  = 1
      language            = 2
      linesize            = 3
      name                = 4
      object              = 5
      textformat          = 6
      communication       = 7
      error_message       = 8
      OTHERS              = 9.
  IF sy-subrc <> 0.
    ASSERT ID /scmb/pattern_framework CONDITION 1 = 0.
  ENDIF.

* Update the aspect ----------------------------------------------------
  IF lt_text_new NE lt_text_old.
    <lt_text> = lt_text_new.
    MOVE-CORRESPONDING <ls_alv> TO <ls_aspect>.
    MODIFY TABLE <lt_alv> FROM <ls_alv>.
    CLEAR <lt_aspect>.
    APPEND <ls_aspect> TO <lt_aspect>.
    update( <lt_aspect> ).
  ENDIF.

ENDMETHOD.


METHOD save .

  DATA:
    lv_question  TYPE  char80,
    lv_answer    TYPE  c,
    lv_msg_type  TYPE  abap_char1,
    lv_rejected  TYPE  boole_d,
    lv_text      TYPE  string.                              "#EC NEEDED

* Execute updates ------------------------------------------------------
  RAISE EVENT execute_update.

* Check for erroneous data ---------------------------------------------
  RAISE EVENT check_for_erroneous_data.
  IF ss_data-v_erroneous_data EQ abap_true.
    MESSAGE e006(/scmb/esa_emulation) INTO lv_text.
    add_system_message( ).
    ss_data-v_erroneous_data = abap_false.
    ev_cancel = abap_true.
    RETURN.
  ENDIF.

* Allow saving only if unsaved data exists -----------------------------
  IF iv_force_saving = abap_false.
    IF ss_data-v_unsaved_data = abap_false AND
       ss_data-v_suppress_save = abap_true.
      MESSAGE s019(/scmb/esa_emulation) INTO lv_text.
      add_system_message( ).
      ss_data-v_erroneous_data = abap_false.
      ev_cancel = abap_true.
      RETURN.
    ENDIF.
  ENDIF.

* Call BEFORE SAVE method of service provider --------------------------
  CALL METHOD ss_data-o_sp->('BEFORE_SAVE')
    IMPORTING
      rejected = lv_rejected.

  IF lv_rejected = abap_false.
*   Check for warning messages
    IF iv_check_message_log = abap_true.
      CLEAR lv_question.
      lv_msg_type = so_message_handler->check_log( ).
      CASE lv_msg_type.
        WHEN /scmb/if_constant=>sc_message_type_error.
          lv_question = text-009.
        WHEN /scmb/if_constant=>sc_message_type_warning.
          lv_question = text-008.
      ENDCASE.
      IF NOT lv_question IS INITIAL.
        CALL FUNCTION 'POPUP_TO_CONFIRM'
          EXPORTING
            text_question         = lv_question
            default_button        = /scmb/if_constant=>sc_no
            display_cancel_button = abap_false
          IMPORTING
            answer                = lv_answer
          EXCEPTIONS
            text_not_found        = 1
            OTHERS                = 2.
        IF lv_answer = /scmb/if_constant=>sc_no.
          ev_cancel = abap_true.
          RETURN.
        ENDIF.
      ENDIF.
    ENDIF.

*   Call SAVE method of service provider
    CALL METHOD ss_data-o_sp->('SAVE')
      EXPORTING
        synchronously = iv_synchronously
      IMPORTING
        rejected      = lv_rejected.
    CASE lv_rejected.
      WHEN abap_false.
        COMMIT WORK AND WAIT.
*       Call CLEANUP method of service provider
        CALL METHOD ss_data-o_sp->('CLEANUP')
          EXPORTING
            reason = /scmb/if_sp_transaction=>sc_cleanup_commit.
        cleanup( ).
      WHEN abap_true.
        ROLLBACK WORK.
        IF ss_data-o_ppf_manager IS BOUND.
          ss_data-o_ppf_manager->refresh(
            EXPORTING clear_all = abap_true ).
        ENDIF.
*       Call CLEANUP method of service provider
        CALL METHOD ss_data-o_sp->('CLEANUP')
          EXPORTING
            reason = /scmb/if_sp_transaction=>sc_cleanup_commit.
        cleanup( ).
        MESSAGE e021(/scmb/esa_emulation) INTO lv_text.
        add_system_message( ).
        ev_cancel = abap_true.
    ENDCASE.
*   Start undefined sideeffect
    set_undefined_se_flag( ).
  ELSE.
    set_undefined_se_flag( ).
    ev_cancel = abap_true.
  ENDIF.

ENDMETHOD.


METHOD save_fieldcontrol_information .

  FIELD-SYMBOLS:
    <ls_aspect_key>  TYPE  ANY,
    <ls_fcontrol>    TYPE  ANY,
    <lt_fcontrol>    TYPE  STANDARD TABLE,
    <lv_value>       TYPE  ANY.

  create_data( ).

  ASSIGN:
    ms_fcontrol->*   TO <ls_fcontrol>,
    mt_fcontrol->*   TO <lt_fcontrol>,
    io_aspect_key->* TO <ls_aspect_key>.

  MOVE-CORRESPONDING <ls_aspect_key> TO <ls_fcontrol>.

* Assign field symbols -------------------------------------------------
  ASSIGN COMPONENT sc_component_field
    OF STRUCTURE <ls_fcontrol> TO <lv_value>.
  <lv_value> = iv_field.
  ASSIGN COMPONENT sc_component_property
    OF STRUCTURE <ls_fcontrol> TO <lv_value>.
  <lv_value> = iv_property.
  ASSIGN COMPONENT sc_component_value
    OF STRUCTURE <ls_fcontrol> TO <lv_value>.
  <lv_value> = iv_value.

* If fc information for the same key is already supplied -> overwrite it
  READ TABLE <lt_fcontrol> FROM <ls_fcontrol> TRANSPORTING NO FIELDS.
  IF sy-subrc EQ 0.
    DELETE <lt_fcontrol> INDEX sy-tabix.
  ENDIF.
  APPEND <ls_fcontrol> TO <lt_fcontrol>.

ENDMETHOD.


METHOD select .

  DATA:
    lv_counter       TYPE         int4,
    lv_rejected      TYPE         boole_d,
    lt_return_codes  TYPE         /scmb/t_sp_return_code,
    ls_return_codes  TYPE         /scmb/s_sp_return_code,
    lt_keys_ind      TYPE REF TO  data.

  FIELD-SYMBOLS:
    <lt_keys_error>  TYPE STANDARD TABLE,
    <lt_keys_sel>    TYPE STANDARD TABLE,
    <lt_keys_temp>   TYPE STANDARD TABLE,
    <lt_alv>         TYPE STANDARD TABLE,
    <ls_alv>         TYPE ANY,
    <ls_keys>        TYPE ANY,
    <ls_keys_comp>   TYPE ANY,
    <ls_svp>         TYPE ANY,
    <lt_svp>         TYPE STANDARD TABLE,
    <ls_table>       TYPE ANY.

  create_data( ).

  ASSIGN:
    mt_keys_error->* TO <lt_keys_error>,
    mt_keys_sel->*   TO <lt_keys_sel>,
    ms_keys->*       TO <ls_keys>,
    ms_keys_comp->*  TO <ls_keys_comp>,
    mt_aspect->*     TO <lt_svp>,
    ms_aspect->*     TO <ls_svp>,
    ms_table->*      TO <ls_table>,
    mt_alv->*        TO <lt_alv>,
    ms_alv->*        TO <ls_alv>.

  CLEAR:
    <lt_svp>,
    <ls_alv>.

* Set return parameter default value -----------------------------------
  ev_cancel = sc_cancel_ok.

* Copy inkeys to independent key table ---------------------------------
  CREATE DATA lt_keys_ind LIKE it_keys.
  ASSIGN lt_keys_ind->* TO <lt_keys_temp>.
  <lt_keys_temp> = it_keys.
  CHECK NOT <lt_keys_temp> IS INITIAL.

* Read objects and trigger attribute handler (implicit) ----------------
  CALL METHOD ss_data-o_sp->('SELECT')
    EXPORTING
      inkeys       = <lt_keys_temp>
      aspect       = mv_aspect_name
    IMPORTING
      outrecords   = <lt_svp>
      rejected     = lv_rejected
      return_codes = lt_return_codes.

* Evaluate export parameters -------------------------------------------
  IF lv_rejected = abap_true.
    ev_cancel = sc_cancel_rejected.
    RETURN.
  ENDIF.

* Evaluate lines to be removed from the UI -> remove all 'valid' keys --
* only the keys of items to be removed remain in <lt_keys_temp>
  CLEAR lv_counter.
  LOOP AT <lt_keys_temp> INTO <ls_keys>.
    READ TABLE <lt_keys_error> FROM <ls_keys> TRANSPORTING NO FIELDS.
    IF sy-subrc EQ 0.
      LOOP AT <lt_svp> INTO <ls_svp>.
        MOVE-CORRESPONDING <ls_svp> TO <ls_keys_comp>.
        IF <ls_keys_comp> = <ls_keys>.
          DELETE <lt_svp>.
        ENDIF.
      ENDLOOP.
    ENDIF.
    lv_counter = lv_counter + 1.
    READ TABLE lt_return_codes
      WITH KEY inrecord = lv_counter
      INTO ls_return_codes.
    IF sy-subrc NE 0 OR ls_return_codes-failed = abap_false.
      DELETE <lt_keys_temp>.
    ELSEIF sy-subrc EQ 0 AND ls_return_codes-failed = abap_true.
      READ TABLE <lt_keys_error> FROM <ls_keys>
        TRANSPORTING NO FIELDS.
      IF sy-subrc EQ 0.
        DELETE TABLE <lt_keys_error> FROM <ls_keys>.
      ENDIF.
    ENDIF.
  ENDLOOP.

* If table contains lines, return code errors were received from SP ----
  IF NOT <lt_keys_temp> IS INITIAL.
*   Set return parameter
    ev_cancel = sc_cancel_delete.

*   Remove deleted lines from the UI and the selected keys itab
    LOOP AT <lt_keys_temp> INTO <ls_keys>.
      MOVE-CORRESPONDING <ls_keys> TO <ls_alv>.
      DELETE TABLE:
        <lt_keys_sel>  FROM <ls_keys>,
        <lt_alv>       FROM <ls_alv>.
    ENDLOOP.

*   View dependent coding
    IF mv_view_mode = /scmb/if_constant=>sc_form_view.
*     Method will remove ALV data, mt_keys_sel and mt_keys_work
      get_data_for_form_view( sc_delete ).
    ENDIF.
  ENDIF.

* Start sideeffect outrecords (other sideeffects are not allowed) ------
  do_sideeffect_outrecords( <lt_svp> ).

ENDMETHOD.


METHOD SELECT_BY_RELATION .

  DATA:
    lv_lines          TYPE  i,
    ls_index_rows     TYPE  lvc_s_row,
    ls_query_options  TYPE  /scmb/s_sp_query_options,
    lv_rejected       TYPE  boole_d.

  FIELD-SYMBOLS:
    <lt_alv>         TYPE  STANDARD TABLE,
    <lt_svp>         TYPE  STANDARD TABLE,
    <lt_keys_rel>    TYPE  STANDARD TABLE,
    <lt_keys_sel>    TYPE  STANDARD TABLE,
    <lt_keys_error>  TYPE  STANDARD TABLE,
    <lt_alv_backup>  TYPE  STANDARD TABLE,
    <ls_alv>         TYPE  ANY,
    <ls_keys>        TYPE  ANY.

  create_data( ).

  ASSIGN:
    mt_alv->*        TO <lt_alv>,
    ms_alv->*        TO <ls_alv>,
    mt_aspect->*     TO <lt_svp>,
    mt_keys_sel->*   TO <lt_keys_sel>,
    mt_keys_rel->*   TO <lt_keys_rel>,
    ms_keys->*       TO <ls_keys>,
    mt_alv_backup->* TO <lt_alv_backup>,
    mt_keys_error->* TO <lt_keys_error>.

* SBR depends on category ----------------------------------------------
  IF mv_category = /scmb/if_constant=>sc_cat_ppf.
    select_by_relation_ppf( ).
    RETURN.
  ENDIF.

  CLEAR:
    <lt_alv_backup>,
    <lt_svp>.

* Save error marked lines ----------------------------------------------
  LOOP AT <lt_keys_error> INTO <ls_keys>.
    MOVE-CORRESPONDING <ls_keys> TO <ls_alv>.
    READ TABLE <lt_alv> FROM <ls_alv> INTO <ls_alv>.
    APPEND <ls_alv> TO <lt_alv_backup>.
  ENDLOOP.

* Reset data of ODP tabstrip -------------------------------------------
  reset_all( iv_keep_selection     = iv_keep_selection
             iv_keep_relation_keys = abap_true
             iv_keep_error_keys    = iv_keep_error_keys
             iv_init_inactive_rel  = abap_true ).

* If no information of current selection is available -> exit ----------
  IF <lt_keys_rel> IS INITIAL AND mv_sbr_wo_relkey = abap_false.
    RETURN.
  ENDIF.

* Call service provider SBR --------------------------------------------
* Clear ACTION IMPORTING parameters
  CLEAR:
    lv_rejected,
    <lt_svp>.
  CALL METHOD ss_data-o_sp->('SELECT_BY_RELATION')
    EXPORTING
      relation   = mv_relation
      inrecords  = <lt_keys_rel>
      aspect     = mv_superior_aspect
      OPTIONS    = ls_query_options
    IMPORTING
      outrecords = <lt_svp>
      rejected   = lv_rejected.
*     return_codes = lt_return_codes.

* Exit if request was rejected -----------------------------------------
  IF lv_rejected = abap_true.
    RETURN.
  ENDIF.

* Fill grid (erroneous lines have priority) ----------------------------
  convert_data_for_alv( <lt_svp> ).
  LOOP AT <lt_alv_backup> INTO <ls_alv>.
*   Note: if erroneous line exists no longer this modify fails (correct)
    MODIFY TABLE <lt_alv> FROM <ls_alv>.
  ENDLOOP.

* Display --------------------------------------------------------------
  mv_refresh_necessary = sc_refresh_normal.
  mv_data_valid = abap_true.

  CASE mv_view_mode.
    WHEN /scmb/if_constant=>sc_table_view.
      DESCRIBE TABLE <lt_alv> LINES lv_lines.
      CASE lv_lines.
        WHEN 1.
          CLEAR mt_index_rows.
          ls_index_rows-index = 1.
          APPEND ls_index_rows TO mt_index_rows.
          set_selected_rows( mt_index_rows ).
        WHEN OTHERS.
          IF NOT <lt_keys_sel> IS INITIAL.
            select_rows_for_keytable( ).
          ENDIF.
      ENDCASE.
*     Trigger ODP1 clear/fill methods
      check_table_view_selection( iv_index_filled = abap_true ).
    WHEN /scmb/if_constant=>sc_form_view.
      fill_form_view( ).
  ENDCASE.

* Call event exit ------------------------------------------------------
  IF mv_view_mode = /scmb/if_constant=>sc_form_view.
    event_exit( /scmb/if_constant=>sc_event_sbr ).
  ENDIF.

ENDMETHOD.


METHOD select_by_relation_ppf .

  DATA:
    lv_fcode     TYPE  ui_func,
    lv_rejected  TYPE  boole_d,
    lt_context   TYPE  ppftcntxts,
    lv_show_in   TYPE  boole_d,
    ls_ppf       TYPE  /scmb/s_ppf_aspect.

  FIELD-SYMBOLS:
    <lt_svp>       TYPE  STANDARD TABLE,
    <ls_svp>       TYPE  ANY,
    <lt_keys_rel>  TYPE  STANDARD TABLE,
    <ls_keys>      TYPE  ANY.

  create_data( ).

  ASSIGN:
    mt_aspect->*   TO <lt_svp>,
    ms_aspect->*   TO <ls_svp>,
    mt_keys_rel->* TO <lt_keys_rel>,
    ms_keys->*     TO <ls_keys>.

* If no information of current selection is available -> exit ----------
  IF <lt_keys_rel> IS INITIAL.
    reset_ppf( ).
    RETURN.
  ENDIF.

  CLEAR:
    <lt_svp>.

* Call service provider ------------------------------------------------
* Clear ACTION IMPORTING parameters
  CLEAR:
    lv_rejected,
    <lt_svp>.
  CALL METHOD ss_data-o_sp->('SELECT_BY_RELATION')
    EXPORTING
      relation     = mv_relation
      inrecords    = <lt_keys_rel>
      aspect       = mv_superior_aspect
    IMPORTING
      outrecords   = <lt_svp>
      rejected     = lv_rejected.
* Exit if request was rejected or no data was returned
  IF lv_rejected = abap_true OR <lt_svp> IS INITIAL.
    RETURN.
  ENDIF.

* Set the valid data flag to 'true' ------------------------------------
  mv_data_valid = abap_true.

* Get data for function module -----------------------------------------
* NOTE: if multiple context objects are used, data like the application
*       key, proxmode etc. have to be taken from the last loop!
  LOOP AT <lt_svp> INTO <ls_svp>.
    MOVE-CORRESPONDING <ls_svp> TO ls_ppf.
    APPEND ls_ppf-context TO lt_context.
  ENDLOOP.

* For test purposes allow changing of 'ip_show_inactive' in debug mode -
  lv_show_in = abap_false.

* Display PPF data -----------------------------------------------------
  CALL FUNCTION 'SPPF_VIEW_START_CRM'
    EXPORTING
      it_context             = lt_context
      ip_applkey             = ls_ppf-applkey
      ip_viewmode            = ls_ppf-proxmode
      ip_detlog              = ls_ppf-detlog
      ip_show_inactive       = lv_show_in
      ip_structure           = ls_ppf-structure.

ENDMETHOD.


METHOD select_rows_for_keytable .

  DATA:
    ls_index_rows  TYPE  lvc_s_row.

  FIELD-SYMBOLS:
    <lt_alv>       TYPE  STANDARD TABLE,
    <ls_alv>       TYPE  data,
    <lt_keys_sel>  TYPE  STANDARD TABLE,
    <ls_keys>      TYPE  data.

  create_data( ).

  ASSIGN:
    mt_alv->*       TO  <lt_alv>,
    ms_alv->*       TO  <ls_alv>,
    mt_keys_sel->*  TO  <lt_keys_sel>.

  CLEAR mt_index_rows.

* Fill index table -----------------------------------------------------
  LOOP AT <lt_keys_sel> ASSIGNING <ls_keys>.
    MOVE-CORRESPONDING <ls_keys> TO <ls_alv>.
    READ TABLE <lt_alv> FROM <ls_alv> TRANSPORTING NO FIELDS.
    IF sy-subrc = 0.
      ls_index_rows-index = sy-tabix.
      APPEND ls_index_rows TO mt_index_rows.
    ELSE.
*     Remove keys that are not available in the ALV table
      DELETE <lt_keys_sel>.
    ENDIF.
  ENDLOOP.

* Set selected rows ----------------------------------------------------
  set_selected_rows( mt_index_rows ).

ENDMETHOD.


METHOD select_single_row.

  DATA:
    lt_index_rows  TYPE  lvc_t_row,
    ls_index_row   TYPE  lvc_s_row.

* Select the first row -------------------------------------------------
  ls_index_row-index = 1.
  APPEND ls_index_row TO lt_index_rows.
  set_selected_rows( lt_index_rows ).

ENDMETHOD.


METHOD set_active_tab.

  FIELD-SYMBOLS:
    <ls_active_tab>  TYPE  /scmb/s_active_tabstrips.

  READ TABLE ss_data-t_active_tab
    WITH KEY v_classname         = mv_classname
             v_superior_relation = mv_superior_aspect
    ASSIGNING <ls_active_tab>.
  IF sy-subrc EQ 0.
    <ls_active_tab>-v_active_tabstrip = mv_tab_number.
  ELSE.
    ASSERT ID /scmb/pattern_framework CONDITION 1 = 0.
  ENDIF.

ENDMETHOD.


METHOD SET_ATTRIBUTES_FOR_FORM_VIEW .

  DATA:
    ls_fv_attributes  TYPE  /scmb/s_fieldcontrol,
    lv_edit_hidden    TYPE  raw4,
    ls_celltab        TYPE  lvc_s_styl.

  FIELD-SYMBOLS:
    <lt_alv>        TYPE STANDARD TABLE,
    <ls_alv>        TYPE ANY,
    <ls_table>      TYPE ANY,
    <lt_celltab>    TYPE lvc_t_styl.

  create_data( ).

  ASSIGN:
    mt_alv->*   TO <lt_alv>,
    ms_alv->*   TO <ls_alv>,
    ms_table->* TO <ls_table>.

* Build hidden + edit raw4 value ---------------------------------------
  lv_edit_hidden = cl_gui_alv_grid=>mc_style_hotspot_no.
  lv_edit_hidden = lv_edit_hidden + cl_gui_alv_grid=>mc_style_disabled.

* Clear old form view attributes table ---------------------------------
  CLEAR:
    mt_fv_attributes,
    <ls_alv>.

  MOVE-CORRESPONDING <ls_table> TO <ls_alv>.

* Get celltab of displayed line ----------------------------------------
  READ TABLE <lt_alv> ASSIGNING <ls_alv> FROM <ls_alv>.
  ASSIGN COMPONENT sc_component_celltab
    OF STRUCTURE <ls_alv> TO <lt_celltab>.

* Set attributes -------------------------------------------------------
  LOOP AT <lt_celltab> INTO ls_celltab.
    ls_fv_attributes-field = ls_celltab-fieldname.
    CASE ls_celltab-style.
*     Read only
      WHEN cl_gui_alv_grid=>mc_style_disabled.
        ls_fv_attributes-edit    = abap_false.
        ls_fv_attributes-display = abap_true.
*     Editable
      WHEN cl_gui_alv_grid=>mc_style_enabled.
        ls_fv_attributes-edit    = abap_true.
        ls_fv_attributes-display = abap_true.
*     Hidden
      WHEN lv_edit_hidden.
        ls_fv_attributes-edit    = abap_false.
        ls_fv_attributes-display = abap_false.
    ENDCASE.
*   Fill the attributes table
    APPEND ls_fv_attributes TO mt_fv_attributes.
    CLEAR ls_fv_attributes.
  ENDLOOP.

ENDMETHOD.


METHOD set_attributes_for_lv .

  TYPES:
    BEGIN OF ly_fieldcontrol,
      field TYPE lvc_fname,
      property TYPE string,
      value TYPE char1,
    END OF ly_fieldcontrol.

  DATA:
    lv_initial_run        TYPE  abap_bool,
    lt_celltab            TYPE  lvc_t_styl,
    ls_celltab            TYPE  lvc_s_styl,
    ls_fieldcontrol_data  TYPE  ly_fieldcontrol.

  FIELD-SYMBOLS:
    <ls_fieldcat>      TYPE  lvc_s_fcat,
    <ls_fieldcontrol>  TYPE  ANY,
    <lt_alv>           TYPE  STANDARD TABLE,
    <ls_alv>           TYPE  ANY,
    <lt_keys>          TYPE  STANDARD TABLE,
    <ls_keys>          TYPE  ANY,
    <ls_keys_comp>     TYPE  ANY,
    <lt_celltab>       TYPE  lvc_t_styl.

  create_data( ).

  ASSIGN:
    mt_alv->*       TO <lt_alv>,
    ms_alv->*       TO <ls_alv>,
    mt_keys_work->* TO <lt_keys>,
    ms_keys_comp->* TO <ls_keys_comp>,
    ms_keys->*      TO <ls_keys>.

  CLEAR:
    <lt_keys>,
    <ls_keys_comp>,
    <ls_keys>.

* Set refresh indicator ------------------------------------------------
  mv_refresh_necessary = sc_refresh_normal.

* Check for column hiding ----------------------------------------------
* NOTE: the ALV grid does not know the state hidden or deactivated
*       on cell level -> decision was taken that the whole column will
*       be hidden if the cell should be hidden for all displayed lines.
*       As soon as only one has to be displayed the column remains
*       visible.

* Evaluate field control information -----------------------------------
  lv_initial_run = abap_true.
  LOOP AT ct_fieldcontrol ASSIGNING <ls_fieldcontrol>.
    MOVE-CORRESPONDING:
      <ls_fieldcontrol> TO <ls_keys>,
      <ls_fieldcontrol> TO ls_fieldcontrol_data.

*   Set comparison keys and field name on first loop
    IF lv_initial_run = abap_true.
      <ls_keys_comp> = <ls_keys>.
      ls_celltab-fieldname = ls_fieldcontrol_data-field.
      lv_initial_run = abap_false.
    ENDIF.

    IF ls_celltab-fieldname NE ls_fieldcontrol_data-field
    OR <ls_keys> NE <ls_keys_comp>.
*     Fieldname has changed -> fill celltab and initialize
      INSERT ls_celltab INTO TABLE lt_celltab.
      CLEAR ls_celltab.
      ls_celltab-fieldname = ls_fieldcontrol_data-field.
    ENDIF.

    IF <ls_keys> NE <ls_keys_comp>.
*     New aspect key -> modify ALV grid
      MOVE-CORRESPONDING <ls_keys_comp> TO <ls_alv>.
      READ TABLE <lt_alv> INTO <ls_alv>
        FROM <ls_alv>.
      IF sy-subrc EQ 0.
*       Set new celltab
        ASSIGN COMPONENT sc_component_celltab
          OF STRUCTURE <ls_alv> TO <lt_celltab>.
        <lt_celltab> = lt_celltab.
*       Modify ALV outtab from the table line
        MODIFY TABLE <lt_alv> FROM <ls_alv>.
      ENDIF.
*     Set new comparison keys
      <ls_keys_comp> = <ls_keys>.
      CLEAR lt_celltab.
    ENDIF.

*   Check for different properties
    CASE ls_fieldcontrol_data-property.
*    View mode
      WHEN 'COL_READ_ONLY'.                                 "#EC NOTEXT
*       Only relevant if style isn't already 'DEACTIVATED'
        IF ls_celltab-style IS INITIAL.
          CASE ls_fieldcontrol_data-value.
            WHEN abap_true.
              ls_celltab-style = cl_gui_alv_grid=>mc_style_disabled.
            WHEN abap_false.
              ls_celltab-style = cl_gui_alv_grid=>mc_style_enabled.
          ENDCASE.
        ENDIF.
*     Hidden/deactivated mode
      WHEN 'COL_DEACTIVATED'.                               "#EC NOTEXT
        IF ls_fieldcontrol_data-value = abap_true.
*         Apply a specific cell style to identify those cells for
*         form view dynpro adjustment
          ls_celltab-style = cl_gui_alv_grid=>mc_style_hotspot_no.
          ls_celltab-style = ls_celltab-style +
            cl_gui_alv_grid=>mc_style_disabled.
*         If HIDE flag was set, adjust the field catalog
          IF ss_data-v_hide_column = abap_true.
            READ TABLE ms_definition_alv-t_fieldcat
              WITH KEY fieldname = ls_fieldcontrol_data-field
              ASSIGNING <ls_fieldcat>.
            IF sy-subrc EQ 0.
              <ls_fieldcat>-tech = abap_true.
            ENDIF.
            mv_refresh_necessary = sc_refresh_complete.
          ENDIF.
        ELSE.
*         If HIDE flag was set, adjust the field catalog
          IF ss_data-v_hide_column = abap_true.
            READ TABLE ms_definition_alv-t_fieldcat
              WITH KEY fieldname = ls_fieldcontrol_data-field
              ASSIGNING <ls_fieldcat>.
            IF sy-subrc EQ 0.
              <ls_fieldcat>-tech = abap_false.
            ENDIF.
            mv_refresh_necessary = sc_refresh_complete.
          ENDIF.
        ENDIF.
    ENDCASE.
  ENDLOOP.

  CLEAR ct_fieldcontrol.

* Fill ALV grid for last loop
  INSERT ls_celltab INTO TABLE lt_celltab.
  MOVE-CORRESPONDING <ls_keys_comp> TO <ls_alv>.
  READ TABLE <lt_alv> INTO <ls_alv>
    FROM <ls_alv>.
  IF sy-subrc EQ 0.
*   Set field-symbol on ALV celltab
    ASSIGN COMPONENT sc_component_celltab
      OF STRUCTURE <ls_alv> TO <lt_celltab>.
*   Set new celltab
    <lt_celltab> = lt_celltab.
    MODIFY TABLE <lt_alv> FROM <ls_alv>.
  ENDIF.

ENDMETHOD.


METHOD set_cursor.

  IF  sy-dynnr EQ ss_cursor-dynnr
  AND iv_repid EQ ss_cursor-repid.
    SET CURSOR FIELD ss_cursor-field.
    clear_cursor( ).
  ENDIF.

ENDMETHOD.


METHOD set_default_values.

  /scmb/cl_ees_defaults=>set(
    IMPORTING  ev_continue    = ev_continue
    EXCEPTIONS internal_error = 1
               OTHERS         = 2 ).
  IF sy-subrc <> 0.
    ASSERT ID /scmb/pattern_framework CONDITION 1 = 0.
  ENDIF.

ENDMETHOD.


METHOD set_dynpro_for_tabstrip .

  FIELD-SYMBOLS:
    <lv_subscreen>  TYPE  sydynnr.

  ASSIGN:
    mv_subscreen->* TO <lv_subscreen>.

* Set the correct tabstrip ---------------------------------------------
  set_tabstrip( ).

* Set the dynpro -------------------------------------------------------
  CASE mv_view_mode.
    WHEN /scmb/if_constant=>sc_table_view.
      <lv_subscreen> = mv_dynpro_list->*.
    WHEN /scmb/if_constant=>sc_form_view.
      <lv_subscreen> = mv_dynpro_form->*.
  ENDCASE.

ENDMETHOD.


METHOD set_keys_for_selection .

  FIELD-SYMBOLS:
    <lt_alv>        TYPE  STANDARD TABLE,
    <lt_keys_sel>   TYPE  STANDARD TABLE,
    <ls_index_row>  TYPE  lvc_s_row,
    <ls_alv>        TYPE  data,
    <ls_keys>       TYPE  data.

  create_data( ).

  ASSIGN:
    mt_alv->*      TO <lt_alv>,
    mt_keys_sel->* TO <lt_keys_sel>,
    ms_alv->*      TO <ls_alv>,
    ms_keys->*     TO <ls_keys>.

  CLEAR:
    <lt_keys_sel>.

* Fill key table -------------------------------------------------------
  LOOP AT it_index_rows ASSIGNING <ls_index_row>.
    READ TABLE <lt_alv>
      INDEX <ls_index_row>-index
      INTO <ls_alv>.
    MOVE-CORRESPONDING <ls_alv> TO <ls_keys>.
    APPEND <ls_keys> TO <lt_keys_sel>.
  ENDLOOP.

ENDMETHOD.


METHOD set_odp2_dynpro.

  DATA:
    lv_active  TYPE  /scmb/de_dusactive.

* Check import parameter: must be supplied, therefore an assertion
* is used. The dump can only occur during development and is wanted.
* Also dump if SO_ESDUS_ODP2 is not bound, in that case the developer
* called this method before calling the GET_ODP2_DYNPRO method, which
* is mandatory
  IF iv_dynnr IS INITIAL.
    ASSERT 1 = 0.
*   Dear developer, please supply the required import parameter!
  ENDIF.
  IF NOT so_esdus_odp2 IS BOUND.
    ASSERT 1 = 0.
*   Dear developer, method GET_ODP2_DYNPRO has to be called first!
  ENDIF.

* Set the new screen number --------------------------------------------
  lv_active = iv_dynnr.
  so_esdus_odp2->set(
    EXPORTING iv_element = sc_element_dynnr_odp2
              iv_active  = lv_active ).
  so_esdus_odp2->flush( ).

ENDMETHOD.


METHOD set_pager_state .

  DATA:
    lv_lines  TYPE  i,
    lv_index  TYPE  lvc_index.

  FIELD-SYMBOLS:
    <lt_keys_sel>     TYPE  STANDARD TABLE,
    <ls_keys>         TYPE  ANY,
    <ls_table>        TYPE  ANY,
    <lv_numerator>    TYPE  ANY,
    <lv_denominator>  TYPE  ANY.

  create_data( ).

  ASSIGN:
    mt_keys_sel->* TO <lt_keys_sel>,
    ms_keys->*     TO <ls_keys>,
    ms_table->*    TO <ls_table>.

* Assign field symbols dependent on pattern type (OIP, ODP1, ODP2 ) ----
  CASE mv_classname.
    WHEN sv_class_name_oip.
      ASSIGN:
        ss_data-s_dynpro_data-v_numerator_oip->*   TO <lv_numerator>,
        ss_data-s_dynpro_data-v_denominator_oip->* TO <lv_denominator>.
    WHEN sv_class_name_odp1.
      ASSIGN:
        ss_data-s_dynpro_data-v_numerator_odp1->*   TO <lv_numerator>,
        ss_data-s_dynpro_data-v_denominator_odp1->* TO <lv_denominator>.
    WHEN sv_class_name_odp2.
      ASSIGN:
        ss_data-s_dynpro_data-v_numerator_odp2->*   TO <lv_numerator>,
        ss_data-s_dynpro_data-v_denominator_odp2->* TO <lv_denominator>.
  ENDCASE.

* Get total lines of key table -----------------------------------------
  DESCRIBE TABLE <lt_keys_sel> LINES lv_lines.
* Set denominator (only for active tabstrip)
  IF get_active_tab( ) = mv_tab_number.
    <lv_denominator> = lv_lines.
  ENDIF.
  CASE lv_lines.
*   If no or only one header is selected -> deactivate pagers
    WHEN 0 OR 1.
      RAISE EVENT deactivate_pager_down.
      RAISE EVENT deactivate_pager_up.
*   Set numerator (only for active tabstrip)
    IF get_active_tab( ) = mv_tab_number.
      <lv_numerator> = lv_lines.
    ENDIF.
*   If more than one header is selected
*   -> pager state depends on index of selected header
    WHEN OTHERS.
      MOVE-CORRESPONDING <ls_table> TO <ls_keys>.
*     Get index with the key table of displayed entity
      READ TABLE <lt_keys_sel> FROM <ls_keys> TRANSPORTING NO FIELDS.
*        WITH TABLE KEY table_line = <ls_keys>.
      lv_index = sy-tabix.
*     Set numerator (only for active tabstrip)
      IF get_active_tab( ) = mv_tab_number.
        <lv_numerator> = lv_index.
      ENDIF.
      CASE lv_index.
        WHEN 1.
          RAISE EVENT activate_pager_down.
          RAISE EVENT deactivate_pager_up.
        WHEN lv_lines.
          RAISE EVENT deactivate_pager_down.
          RAISE EVENT activate_pager_up.
        WHEN OTHERS.
          RAISE EVENT activate_pager_down.
          RAISE EVENT activate_pager_up.
      ENDCASE.
  ENDCASE.

ENDMETHOD.


METHOD set_process_data.

* Initialize static framework data -------------------------------------
  clear_static( ).

* Set static data ------------------------------------------------------
  ss_data-o_attribute_handler  = io_attribute_handler.
  so_message_handler           = io_message_handler.
  ss_data-s_dynpro_data        = is_dynpro_data.
  ss_data-o_sp                 = io_service_provider.
  so_controller                = /scmb/cl_controller=>get_instance( ).
  so_controller->set_message_handler( so_message_handler ).
  ss_data-s_default_values     = is_default_values.
  ss_data-s_odp2_handling      = is_odp2_handling.
  IF is_odp2_handling IS SUPPLIED.
    ss_data-v_odp2_dynpro_buffer = is_odp2_handling-o_subscreen->*.
  ENDIF.
  IF iv_disable_standard_save = abap_true.
    ss_data-v_save_standard = abap_false.
  ELSE.
    ss_data-v_save_standard = abap_true.
  ENDIF.
  ss_data-v_hide_column = iv_hide_column.

* Initialize default values management ---------------------------------
  IF NOT ss_data-s_default_values-v_identifier IS INITIAL.
    /scmb/cl_ees_defaults=>init(
     EXPORTING
       iv_identifier       = ss_data-s_default_values-v_identifier
       iv_extended         = ss_data-s_default_values-v_extended
       iv_values_structure = ss_data-s_default_values-v_values_structure
       it_combined_fields  = ss_data-s_default_values-t_combined_fields
       it_values_definition = ss_data-s_default_values-t_details
     IMPORTING
       eo_esdus_manager    = ss_data-o_esdus_manager
     EXCEPTIONS
       missing_import_parameter = 1
       OTHERS                   = 2 ).
    IF sy-subrc <> 0.
      ASSERT ID /scmb/pattern_framework CONDITION 1 = 0.
    ENDIF.
  ENDIF.

* Set message handler in callback function group -----------------------
* Required for callbacks from application log (MESSAGE HANDLER)
  PERFORM set_mh_instance IN PROGRAM /scmb/saplmh_callback
    USING so_message_handler.

ENDMETHOD.


METHOD set_selected_rows .

  IF mo_alv_grid IS BOUND.
    mo_alv_grid->set_selected_rows( it_index_rows = it_index ).
  ENDIF.

ENDMETHOD.


METHOD set_sequence_by_key.

  FIELD-SYMBOLS:
    <ls_keys>        TYPE  ANY,
    <ls_alv>         TYPE  ANY,
    <lt_alv>         TYPE  STANDARD TABLE,
    <lt_alv_backup>  TYPE  STANDARD TABLE.

  create_data( ).

  ASSIGN:
    mt_alv_backup->* TO <lt_alv_backup>,
    mt_alv->*        TO <lt_alv>,
    ms_alv->*        TO <ls_alv>.

* Adapt ALV sequence to given key sequence -----------------------------
  <lt_alv_backup> = <lt_alv>.
  CLEAR <lt_alv>.
  LOOP AT it_keys ASSIGNING <ls_keys>.
    MOVE-CORRESPONDING <ls_keys> TO <ls_alv>.
    READ TABLE <lt_alv_backup> FROM <ls_alv> INTO <ls_alv>.
    IF sy-subrc EQ 0.
      DELETE <lt_alv_backup> INDEX sy-tabix.
      APPEND <ls_alv> TO <lt_alv>.
    ENDIF.
  ENDLOOP.
  IF sy-subrc EQ 0.
    APPEND LINES OF <lt_alv_backup> TO <lt_alv>.
    mv_do_sideeffect_aspect = abap_true.
  ENDIF.

ENDMETHOD.


METHOD set_table_for_first_display.

  FIELD-SYMBOLS:
    <lt_alv>  TYPE  STANDARD TABLE.

  create_data( ).

  ASSIGN:
    mt_alv->* TO <lt_alv>.

  IF mo_alv_grid IS BOUND.
    mo_alv_grid->set_table_for_first_display(
      EXPORTING
        is_variant           = ms_definition_alv-s_disvariant
        i_save               = sc_alv_variant_save
        is_layout            = ms_definition_alv-s_layout
        it_toolbar_excluding = ms_definition_alv-t_toolbar_excluding
      CHANGING
        it_outtab            = <lt_alv>
        it_fieldcatalog      = ms_definition_alv-t_fieldcat ).
    mv_refresh_necessary = sc_refresh_none.
  ENDIF.

ENDMETHOD.


METHOD set_tabstrip .

  FIELD-SYMBOLS:
    <lv_active_tab>  TYPE  ANY.

* Set activetab dependent on pattern type (OIP, ODP1, ODP2 ) -----------
  CASE mv_classname.
    WHEN sv_class_name_oip.
      ASSIGN ss_data-s_dynpro_data-v_tabstrip_oip->*
        TO <lv_active_tab>.
    WHEN sv_class_name_odp1.
      ASSIGN ss_data-s_dynpro_data-v_tabstrip_odp1->*
        TO <lv_active_tab>.
    WHEN sv_class_name_odp2.
      ASSIGN ss_data-s_dynpro_data-v_tabstrip_odp2->*
        TO <lv_active_tab>.
  ENDCASE.
  IF <lv_active_tab> IS ASSIGNED.
    <lv_active_tab> = mv_tabstrip_okcode.
  ENDIF.

ENDMETHOD.


METHOD set_undefined_se_flag.

* Only if flag isn't already set for 'include deleted' -----------------
  IF ss_data-v_do_undefined_se NE sc_und_se_delete.
    IF iv_include_deleted = abap_false.
      ss_data-v_do_undefined_se = sc_und_se_normal.
    ELSE.
      ss_data-v_do_undefined_se = sc_und_se_delete.
    ENDIF.
  ENDIF.

ENDMETHOD.


METHOD set_unsaved_data_flag.

  IF mv_save_relevant = abap_true.
    ss_data-v_unsaved_data = abap_true.
  ENDIF.

ENDMETHOD.


METHOD show_details.

  DATA:
    lv_filled  TYPE  abap_bool.

* Execute updates ------------------------------------------------------
  RAISE EVENT execute_update.

* Check if saving is necessary -----------------------------------------
  CHECK check_selection_change( ) = abap_true.
  IF mv_selection_changed = abap_true  AND
    mv_classname = sv_class_name_oip.
    IF check_for_unsaved_data( abap_false ) = abap_false.
      RETURN.
    ENDIF.
  ENDIF.

* Refresh ODPs first, to ensure that lower FVs are filled -------------
  RAISE EVENT initialize_odp
    EXPORTING iv_class_name        = mv_classname
              iv_aspect_name       = mv_aspect_name
              iv_init_inactive_rel = abap_true.

* Index für OIP gefüllt ------------------------------------------------
  IF mv_classname = sv_class_name_oip.
    lv_filled = abap_true.
  ENDIF.
  check_table_view_selection( iv_index_filled = lv_filled ).

ENDMETHOD.


METHOD simple_search .

  DATA:
    lv_rejected  TYPE  abap_bool.

  FIELD-SYMBOLS:
    <lt_keys_del>   TYPE  STANDARD TABLE,
    <lt_keys_work>  TYPE  STANDARD TABLE,
    <lt_svp>        TYPE  STANDARD TABLE,
    <ls_inparam>    TYPE  ANY.

  create_data( ).

  ASSIGN:
    mt_keys_del->*  TO <lt_keys_del>,
    mt_keys_work->* TO <lt_keys_work>,
    mt_aspect->*    TO <lt_svp>.

  CLEAR:
    <lt_svp>,
    <lt_keys_work>.

* Execute updates ------------------------------------------------------
  RAISE EVENT execute_update.

* Check for unsaved data -----------------------------------------------
  IF mv_classname = sv_class_name_oip.
    CHECK check_for_unsaved_data( abap_true ) = abap_true.
  ENDIF.

* Set field symbol on imparam structure --------------------------------
  ASSIGN io_inparam->* TO <ls_inparam>.

* Resets ---------------------------------------------------------------
  IF mv_classname = sv_class_name_oip.
    reset_all(
      EXPORTING iv_keep_selection     = abap_false
                iv_keep_relation_keys = abap_false
                iv_keep_error_keys    = abap_false
                iv_init_inactive_rel  = abap_true ).
  ELSE.
    reset_all(
      EXPORTING iv_keep_selection     = abap_false
                iv_keep_relation_keys = abap_true
                iv_keep_error_keys    = abap_false
                iv_init_inactive_rel  = abap_true ).
  ENDIF.
  IF ss_data-o_ppf_manager IS BOUND.
    ss_data-o_ppf_manager->refresh( EXPORTING clear_all = abap_true ).
  ENDIF.

* Call CLEANUP method of service provider ------------------------------
  IF mv_classname = sv_class_name_oip.
    CALL METHOD ss_data-o_sp->('CLEANUP')
      EXPORTING
        reason = /scmb/if_sp_transaction=>sc_cleanup_end.
    RAISE EVENT clear_lock_table.
    CLEAR <lt_keys_del>.
  ENDIF.

* Start service provider query -----------------------------------------
* Clear QUERY IMPORTING parameters
  CLEAR:
    lv_rejected,
    <lt_svp>.
  IF is_options IS SUPPLIED.
    CALL METHOD ss_data-o_sp->('QUERY')
      EXPORTING
        inparam     = <ls_inparam>
        query       = mv_query
        OPTIONS     = is_options
      IMPORTING
        outrecords  = <lt_svp>
        rejected    = lv_rejected.
  ELSE.
    CALL METHOD ss_data-o_sp->('QUERY')
      EXPORTING
        inparam     = <ls_inparam>
        query       = mv_query
      IMPORTING
        outrecords  = <lt_svp>
        rejected    = lv_rejected.
  ENDIF.
  CHECK lv_rejected = abap_false.

* Convert data ---------------------------------------------------------
  convert_data_for_alv( <lt_svp> ).
  IF mv_classname = sv_class_name_oip.
    mv_refresh_necessary = sc_refresh_normal.
  ELSE.
    set_undefined_se_flag( ).
  ENDIF.

* Check number of results ----------------------------------------------
  check_query_result( ).

ENDMETHOD.


METHOD soft_refresh .

  DATA:
    ls_stable  TYPE  lvc_s_stbl.

* Use SET_TABLE_FOR_FIRST_DISPLAY if required --------------------------
  IF mv_grid_initialized = abap_false.
    mv_grid_initialized = abap_true.
    set_table_for_first_display( ).
    RETURN.
  ENDIF.

* Execute a stable refresh to keep coulmn widths etc. ------------------
  ls_stable-row = abap_true.
  ls_stable-col = abap_true.

  IF mo_alv_grid IS BOUND.
    mo_alv_grid->refresh_table_display( is_stable = ls_stable ).
    mv_refresh_necessary = sc_refresh_none.
  ENDIF.

ENDMETHOD.


METHOD start_query.

  DATA:
    ls_options  TYPE  /scmb/s_sp_query_options.

* Ensure that ODP grids are refreshed immediately ----------------------
  ls_options = is_options.
  RAISE EVENT initial_query
    EXPORTING it_selection = it_selection
              is_options   = ls_options.
  RAISE EVENT process_fcontrol.
  RAISE EVENT refresh_display.

* Display messages -----------------------------------------------------
  so_message_handler->display_messages( ).

ENDMETHOD.


METHOD start_select.

* Ensure that ODP grids are refreshed immediately ----------------------
  IF is_key IS SUPPLIED.
    RAISE EVENT initial_select EXPORTING is_key = is_key.
  ELSEIF it_keys IS SUPPLIED.
    RAISE EVENT initial_select EXPORTING it_keys = it_keys.
  ENDIF.
  RAISE EVENT process_fcontrol.
  RAISE EVENT refresh_display.

* Display messages -----------------------------------------------------
  so_message_handler->display_messages( ).

ENDMETHOD.


METHOD toggle_view .

  DATA:
    lv_kept      TYPE  abap_bool,
    lv_continue  TYPE  abap_bool,
    lv_filled    TYPE  abap_bool,
    lv_count     TYPE  i.

  FIELD-SYMBOLS:
    <ls_fv>         TYPE  ANY,
    <ls_table>      TYPE  ANY,
    <lv_subscreen>  TYPE  sydynnr,
    <lt_keys_sel>   TYPE  STANDARD TABLE.

  create_data( ).

  ASSIGN:
    ms_fv->*        TO <ls_fv>,
    mt_keys_sel->*  TO <lt_keys_sel>,
    ms_table->*     TO <ls_table>,
    mv_subscreen->* TO <lv_subscreen>.

* Execute updates ------------------------------------------------------
  RAISE EVENT execute_update.

  CASE mv_view_mode.
*   Coding for table view mode
    WHEN /scmb/if_constant=>sc_table_view.
*     Check if save popup is needed
      check_selection_change_ext(
        IMPORTING ev_continue  = lv_continue
                  ev_line_kept = lv_kept ).
      CHECK lv_continue = abap_true.
      IF mv_selection_changed = abap_true  AND
        mv_classname = sv_class_name_oip.
        IF check_for_unsaved_data( abap_false ) = abap_false.
          RETURN.
        ENDIF.
      ENDIF.

*     Reduce selection to a maximum of 999 lines; this is required due
*     to the FRW using UIs. Here often a typization of INT1 (screen
*     field with resulting length 3) is used, which would result in
*     short dumps. Anyhow it is not meaningful from a user point of
*     to open a form view with so many selected lines.
      DELETE mt_index_rows FROM 1000.

*     Set new dynpro and mode
      <lv_subscreen> = mv_dynpro_form->*.
      CLEAR:
        <ls_table>,
        <ls_fv>.
      mv_view_mode = /scmb/if_constant=>sc_form_view.

*     Get data to be displayed in form view
      IF mv_classname = sv_class_name_oip.
        lv_filled = abap_true.
      ENDIF.
      IF check_table_view_selection(
        iv_no_message   = abap_true
        iv_index_filled = lv_filled ) EQ sc_cancel_rejected.
*       If SELECTED was REJECTED display empty FV
        CLEAR <ls_table>.
      ELSE.
        IF lv_kept = abap_true.
          get_data_for_form_view( ).
        ELSE.
          get_data_for_form_view( sc_toggle_init ).
        ENDIF.
      ENDIF.

*   Coding for form view mode
    WHEN /scmb/if_constant=>sc_form_view.
*     Set new dynpro and mode
      <lv_subscreen> = mv_dynpro_list->*.
      mv_view_mode = /scmb/if_constant=>sc_table_view.
      mv_refresh_necessary = sc_refresh_normal.

*     Deactivate pagers
      RAISE EVENT:
        deactivate_pager_down,
        deactivate_pager_up.

*     Clear ODP1/2 if necessary
      DESCRIBE TABLE <lt_keys_sel> LINES lv_count.
      IF ( mv_multiple_selection = abap_false
           AND lv_count NE 1 )
      OR ( mv_multiple_selection = abap_true
           AND lv_count EQ 0 ).
        RAISE EVENT initialize_odp
          EXPORTING
            iv_class_name  = mv_classname
            iv_aspect_name = mv_aspect_name.
        CLEAR <ls_table>.
      ENDIF.
  ENDCASE.

ENDMETHOD.


METHOD trigger_changed_data_checks.

  RAISE EVENT changed_data_checks.

ENDMETHOD.


METHOD trigger_error_checks.

  DATA:
    lv_answer  TYPE  c,
    lv_errors  TYPE  abap_bool.

  ev_continue = abap_true.

* Check related aspects for errors -------------------------------------
  TRY.
      check_for_errors_on_selection( ).
    CATCH /scmb/cx_base .
      lv_errors = abap_true.
  ENDTRY.

* In error case output message popup -----------------------------------
  CHECK lv_errors = abap_true.
  IF mv_classname NE sv_class_name_oip OR
     ss_data-v_save_standard = abap_false.
    CALL FUNCTION 'POPUP_TO_CONFIRM'
      EXPORTING
        text_question         = text-004
        default_button        = '2'
        display_cancel_button = ' '
      IMPORTING
        answer                = lv_answer
      EXCEPTIONS
        text_not_found        = 1
        OTHERS                = 2.
    IF sy-subrc NE 0.
      add_system_message( ).
    ENDIF.
    CASE lv_answer.
      WHEN /scmb/if_constant=>sc_no.
        ev_continue = abap_false.
      WHEN /scmb/if_constant=>sc_yes.
        ev_continue = abap_true.
    ENDCASE.
  ENDIF.

ENDMETHOD.


METHOD trigger_lock_superior_obj.

  DATA:
    ls_mapper  TYPE  /scmb/s_mapper,
    lv_text    TYPE  string.

  FIELD-SYMBOLS:
    <lt_keys_rel>  TYPE  STANDARD TABLE.

  create_data( ).

  ASSIGN:
    mt_keys_rel->*  TO  <lt_keys_rel>.

* Check if superior object is available --------------------------------
  IF mv_classname = sv_class_name_oip.
    MESSAGE e029(/scmb/esa_emulation) INTO lv_text.
    add_system_message( ).
    ASSERT ID /scmb/pattern_framework CONDITION 1 = 0.
    ev_error = abap_true.
    RETURN.
  ENDIF.

* Get superior object --------------------------------------------------
  READ TABLE ss_data-t_mapper INTO ls_mapper
    WITH KEY v_aspect = mv_superior_aspect.
  IF is_locking-v_lock_top = abap_true  AND
     mv_classname = sv_class_name_odp2.
    ls_mapper-o_pattern->create_data( ).
    ASSIGN ls_mapper-o_pattern->mt_keys_rel->* TO <lt_keys_rel>.
    READ TABLE ss_data-t_mapper INTO ls_mapper
      WITH KEY v_aspect = ls_mapper-o_pattern->mv_superior_aspect.
  ENDIF.

* Lock object ----------------------------------------------------------
  ev_error = ls_mapper-o_pattern->lock_superior_object(
    it_keys      = <lt_keys_rel>
    iv_lockmode  = is_locking-v_lockmode
    iv_multilock = is_locking-v_multilock ).
  IF ev_error = abap_false.
    set_undefined_se_flag( ).
  ENDIF.

ENDMETHOD.


METHOD trigger_refresh.

* Execute updates ------------------------------------------------------
  RAISE EVENT execute_update.

  set_undefined_se_flag( ).

ENDMETHOD.


METHOD trigger_set_relation .

  RAISE EVENT set_relations
    EXPORTING iv_class_name  = mv_classname
              iv_aspect_name = mv_aspect_name.

ENDMETHOD.


METHOD unlock .

  DATA:
    lv_text      TYPE  string,                              "#EC NEEDED
    lv_save      TYPE  abap_bool,
    lv_cancel    TYPE  abap_char1,
    lv_rejected  TYPE  boole_d.

  FIELD-SYMBOLS:
    <ls_keys>       TYPE  ANY,
    <ls_table>      TYPE  ANY,
    <lt_keys_lock>  TYPE  STANDARD TABLE,
    <lt_keys_sel>   TYPE  STANDARD TABLE,
    <lt_keys_work>  TYPE  STANDARD TABLE.

  create_data( ).

  ASSIGN:
    mt_keys_sel->*  TO <lt_keys_sel>,
    mt_keys_lock->* TO <lt_keys_lock>,
    mt_keys_work->* TO <lt_keys_work>,
    ms_keys->*      TO <ls_keys>,
    ms_table->*     TO <ls_table>.

  CLEAR <lt_keys_work>.

* Preset rejected flag -------------------------------------------------
  ev_rejected = abap_true.

* Execute updates ------------------------------------------------------
  RAISE EVENT execute_update.

  CASE mv_view_mode.
* View dependent coding ------------------------------------------------
    WHEN /scmb/if_constant=>sc_table_view.
      CHECK check_selection_change( ) = abap_true.
      lv_cancel = check_table_view_selection(
        iv_no_message   = abap_false
        iv_index_filled = abap_false ).
      IF <lt_keys_sel> IS INITIAL.
        MESSAGE s007(/scmb/esa_emulation) INTO lv_text.
        add_system_message( ).
        RETURN.
      ELSE.
        <lt_keys_work> = <lt_keys_sel>.
      ENDIF.
    WHEN /scmb/if_constant=>sc_form_view.
      IF <ls_table> IS INITIAL.
        MESSAGE s007(/scmb/esa_emulation) INTO lv_text.
        add_system_message( ).
        RETURN.
      ELSE.
        MOVE-CORRESPONDING <ls_table> TO <ls_keys>.
        APPEND <ls_keys> TO <lt_keys_work>.
      ENDIF.
      lv_cancel = select( <lt_keys_work> ).
  ENDCASE.

* Exit if SELECT resulted in a REJECTED --------------------------------
  CHECK lv_cancel NE sc_cancel_rejected.

* Check if save popup is necessary -------------------------------------
  LOOP AT <lt_keys_work> INTO <ls_keys>.
    READ TABLE <lt_keys_lock> FROM <ls_keys> TRANSPORTING NO FIELDS.
    IF sy-subrc EQ 0.
      lv_save = abap_true.
    ELSE.
      IF iv_check_lock = abap_true.
        DELETE <lt_keys_work>.
      ELSE.
        lv_save = abap_true.
      ENDIF.
    ENDIF.
  ENDLOOP.
  IF lv_save = abap_true.
*   Call save popup
    IF check_for_unsaved_data( abap_true ) = abap_false.
      RETURN.
    ENDIF.
  ENDIF.

* Clear rejected flag --------------------------------------------------
  ev_rejected = abap_false.

* Check if SP has to be called -----------------------------------------
  CHECK NOT <lt_keys_work> IS INITIAL.
  CHECK NOT <lt_keys_lock> IS INITIAL OR iv_check_lock = abap_false.

* Call unlock ----------------------------------------------------------
* Note: not necessary since save popup will clear all locks anyhow
  CALL METHOD ss_data-o_sp->('UNLOCK')
    EXPORTING
      inkeys   = <lt_keys_work>
      aspect   = mv_aspect_name
    IMPORTING
      rejected = lv_rejected.
  IF lv_rejected = abap_true.
    ev_rejected = abap_true.
    RETURN.
  ENDIF.

* Do side effects ------------------------------------------------------
  CASE iv_sideeffect.
    WHEN /scmb/if_constant=>sc_se_outrecords.
*     Note: LOCK and UNLOCK definition do not allow outrecords,
*           therefore an additional SELECT is called to retrieve
*           the new data
      select( it_keys = <lt_keys_work> ).
    WHEN /scmb/if_constant=>sc_se_undefined.
      set_undefined_se_flag( ).
    WHEN /scmb/if_constant=>sc_se_aspect.
      mv_do_sideeffect_aspect = abap_true.
    WHEN /scmb/if_constant=>sc_se_none.
*     Do nothing
  ENDCASE.

* Remove lines from locktable ------------------------------------------
  LOOP AT <lt_keys_lock> ASSIGNING <ls_keys>.
    READ TABLE <lt_keys_work> FROM <ls_keys>
      TRANSPORTING NO FIELDS.
    IF sy-subrc EQ 0.
      DELETE <lt_keys_lock>.
    ENDIF.
  ENDLOOP.

ENDMETHOD.


METHOD update .

  DATA:
    lv_rejected      TYPE         boole_d,
    lt_return_codes  TYPE         /scmb/t_sp_return_code,
    ls_return_codes  TYPE         /scmb/s_sp_return_code,
    lt_outrecords    TYPE REF TO  data.

  FIELD-SYMBOLS:
    <lt_alv>         TYPE  STANDARD TABLE,
    <ls_alv>         TYPE  data,
    <lt_keys_error>  TYPE  STANDARD TABLE,
    <lt_aspect>      TYPE  STANDARD TABLE,
    <ls_keys_comp>   TYPE  ANY,
    <ls_aspect>      TYPE  data,
    <ls_keys>        TYPE  ANY.

* Create a data object with the correct SP outrecords type
  CREATE DATA lt_outrecords LIKE it_inrecords.

  create_data( ).

* Assign field symbols
  ASSIGN:
    ms_aspect->*     TO <ls_aspect>,
    mt_alv->*        TO <lt_alv>,
    ms_alv->*        TO <ls_alv>,
    lt_outrecords->* TO <lt_aspect>,
    ms_keys->*       TO <ls_keys>,
    ms_keys_comp->*  TO <ls_keys_comp>,
    mt_keys_error->* TO <lt_keys_error>.

* Call service provider ------------------------------------------------
  CALL METHOD ss_data-o_sp->('UPDATE')
    EXPORTING
      aspect       = mv_aspect_name
      inrecords    = it_inrecords
    IMPORTING
      outrecords   = <lt_aspect>
      rejected     = lv_rejected
      return_codes = lt_return_codes.

* Evaluate rejected flag -----------------------------------------------
  IF lv_rejected = abap_true.
    RETURN.
  ENDIF.

* Set unsaved data flag ------------------------------------------------
  set_unsaved_data_flag( ).

* Evaluate the return codes
* NOTE: SP must ensure, that outrecords contain only valid data
  LOOP AT lt_return_codes INTO ls_return_codes
    WHERE failed = abap_true.
*   Remember lines with errors
    READ TABLE it_inrecords
      INDEX ls_return_codes-inrecord INTO <ls_aspect>.
    IF sy-subrc = 0.
      MOVE-CORRESPONDING <ls_aspect> TO <ls_keys>.
*     Remove line if part of outrecords
      LOOP AT <lt_aspect> INTO <ls_aspect>.
        MOVE-CORRESPONDING <ls_aspect> TO <ls_keys_comp>.
        IF <ls_keys_comp> EQ <ls_keys>.
          DELETE <lt_aspect>.
          EXIT.
        ENDIF.
      ENDLOOP.
      READ TABLE <lt_keys_error> FROM <ls_keys>
        TRANSPORTING NO FIELDS.
      IF sy-subrc = 4.
        APPEND <ls_keys> TO <lt_keys_error>.
      ENDIF.
    ELSE.
      ASSERT ID /scmb/pattern_framework CONDITION 0 = 1.
    ENDIF.
  ENDLOOP.

* Always evaluate outrecords -------------------------------------------
  do_sideeffect_outrecords( <lt_aspect> ).

* Do aspect specific sideeffect ----------------------------------------
  CASE mv_sideeffect_update.
    WHEN /scmb/if_constant=>sc_se_aspect.
      mv_do_sideeffect_aspect = abap_true.
    WHEN /scmb/if_constant=>sc_se_undefined.
      set_undefined_se_flag( ).
  ENDCASE.

ENDMETHOD.


METHOD UPDATE_PAGER_STATE .

* Set pagers correct ---------------------------------------------------
  CASE mv_view_mode.
    WHEN /scmb/if_constant=>sc_table_view.
      RAISE EVENT deactivate_pager_down.
      RAISE EVENT deactivate_pager_up.
    WHEN /scmb/if_constant=>sc_form_view.
      set_pager_state( ).
  ENDCASE.

ENDMETHOD.
ENDCLASS.