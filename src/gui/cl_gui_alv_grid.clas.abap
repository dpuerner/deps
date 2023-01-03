class CL_GUI_ALV_GRID definition
  public
  inheriting from CL_GUI_ALV_GRID_BASE
  create public

  global friends IF_ALV_RM_GRID_FRIEND .

public section.
*"* public components of class CL_GUI_ALV_GRID
*"* do not include other source files here!!!
  type-pools ICON .

  interfaces IF_DRAGDROP .

  constants EVT_DROP_EXTERNAL_FILES type I value 35 ##NO_TEXT.
  constants MC_EVT_DELAYED_CHANGE_SELECT type I value 7 ##NO_TEXT.
  constants MC_EVT_DELAYED_MOVE_CURR_CELL type I value 5 ##NO_TEXT.
  constants MC_EVT_ENTER type I value 19 ##NO_TEXT.
  constants MC_EVT_MODIFIED type I value 18 ##NO_TEXT.
  constants MC_FC_AUF type UI_FUNC value '&AUF' ##NO_TEXT.
  constants MC_FC_AVERAGE type UI_FUNC value '&AVERAGE' ##NO_TEXT.
  constants MC_FC_BACK_CLASSIC type UI_FUNC value '&F03' ##NO_TEXT.
  constants MC_FC_CALL_ABC type UI_FUNC value '&ABC' ##NO_TEXT.
  constants MC_FC_CALL_CHAIN type UI_FUNC value '&BEBN' ##NO_TEXT.
  constants MC_FC_CALL_CRBATCH type UI_FUNC value '&CRBATCH' ##NO_TEXT.
  constants MC_FC_CALL_CRWEB type UI_FUNC value '&CRWEB' ##NO_TEXT.
  constants MC_FC_CALL_LINEITEMS type UI_FUNC value '&BEB1' ##NO_TEXT.
  constants MC_FC_CALL_MASTER_DATA type UI_FUNC value '&BEB2' ##NO_TEXT.
  constants MC_FC_CALL_MORE type UI_FUNC value '&BEB3' ##NO_TEXT.
  constants MC_FC_CALL_REPORT type UI_FUNC value '&BEB9' ##NO_TEXT.
  constants MC_FC_CALL_XINT type UI_FUNC value '&XINT' ##NO_TEXT.
  constants MC_FC_CALL_XML_EXPORT type SYUCOMM value '&XML' ##NO_TEXT.
  constants MC_FC_CALL_XXL type UI_FUNC value '&XXL' ##NO_TEXT.
  constants MC_FC_CHECK type UI_FUNC value '&CHECK' ##NO_TEXT.
  constants MC_FC_COL_INVISIBLE type UI_FUNC value '&COL_INV' ##NO_TEXT.
  constants MC_FC_COL_OPTIMIZE type UI_FUNC value '&OPTIMIZE' ##NO_TEXT.
  constants MC_FC_COUNT type UI_FUNC value '&COUNT' ##NO_TEXT.
  constants MC_FC_CURRENT_VARIANT type UI_FUNC value '&COL0' ##NO_TEXT.
  constants MC_FC_DATA_SAVE type UI_FUNC value '&DATA_SAVE' ##NO_TEXT.
  constants MC_FC_DELETE_FILTER type UI_FUNC value '&DELETE_FILTER' ##NO_TEXT.
  constants MC_FC_DESELECT_ALL type UI_FUNC value '&SAL' ##NO_TEXT.
  constants MC_FC_DETAIL type UI_FUNC value '&DETAIL' ##NO_TEXT.
  constants MC_FC_EXCL_ALL type UI_FUNC value '&EXCLALLFC' ##NO_TEXT.
  constants MC_FC_EXPCRDATA type UI_FUNC value '&CRDATA' ##NO_TEXT.
  constants MC_FC_EXPCRDESIG type UI_FUNC value '&CRDESIG' ##NO_TEXT.
  constants MC_FC_EXPCRTEMPL type UI_FUNC value '&CRTEMPL' ##NO_TEXT.
  constants MC_FC_EXPMDB type UI_FUNC value '&MDB' ##NO_TEXT.
  constants MC_FC_EXTEND type UI_FUNC value '&EXT' ##NO_TEXT.
  constants MC_FC_F4 type UI_FUNC value '&F4' ##NO_TEXT.
  constants MC_FC_FILTER type UI_FUNC value '&FILTER' ##NO_TEXT.
  constants MC_FC_FIND type UI_FUNC value '&FIND' ##NO_TEXT.
  constants MC_FC_FIND_MORE type UI_FUNC value '&FIND_MORE' ##NO_TEXT.
  constants MC_FC_FIX_COLUMNS type UI_FUNC value '&CFI' ##NO_TEXT.
  constants MC_FC_GRAPH type UI_FUNC value '&GRAPH' ##NO_TEXT.
  constants MC_FC_HELP type UI_FUNC value '&HELP' ##NO_TEXT.
  constants MC_FC_HTML type UI_FUNC value '&HTML' ##NO_TEXT.
  constants MC_FC_INFO type UI_FUNC value '&INFO' ##NO_TEXT.
  constants MC_FC_LOAD_VARIANT type UI_FUNC value '&LOAD' ##NO_TEXT.
  constants MC_FC_LOC_APPEND_ROW type UI_FUNC value '&LOCAL&APPEND' ##NO_TEXT.
  constants MC_FC_LOC_COPY type UI_FUNC value '&LOCAL&COPY' ##NO_TEXT.
  constants MC_FC_LOC_COPY_ROW type UI_FUNC value '&LOCAL&COPY_ROW' ##NO_TEXT.
  constants MC_FC_LOC_CUT type UI_FUNC value '&LOCAL&CUT' ##NO_TEXT.
  constants MC_FC_LOC_DELETE_ROW type UI_FUNC value '&LOCAL&DELETE_ROW' ##NO_TEXT.
  constants MC_FC_LOC_INSERT_ROW type UI_FUNC value '&LOCAL&INSERT_ROW' ##NO_TEXT.
  constants MC_FC_LOC_MOVE_ROW type UI_FUNC value '&LOCAL&MOVE_ROW' ##NO_TEXT.
  constants MC_FC_LOC_PASTE type UI_FUNC value '&LOCAL&PASTE' ##NO_TEXT.
  constants MC_FC_LOC_PASTE_NEW_ROW type UI_FUNC value '&LOCAL&PASTE_NEW_ROW' ##NO_TEXT.
  constants MC_FC_LOC_UNDO type UI_FUNC value '&LOCAL&UNDO' ##NO_TEXT.
  constants MC_FC_MAINTAIN_VARIANT type UI_FUNC value '&MAINTAIN' ##NO_TEXT.
  constants MC_FC_MAXIMUM type UI_FUNC value '&MAXIMUM' ##NO_TEXT.
  constants MC_FC_MINIMUM type UI_FUNC value '&MINIMUM' ##NO_TEXT.
  constants MC_FC_PC_FILE type UI_FUNC value '&PC' ##NO_TEXT.
  constants MC_FC_PRINT type UI_FUNC value '&PRINT' ##NO_TEXT.
  constants MC_FC_PRINT_BACK type UI_FUNC value '&PRINT_BACK' ##NO_TEXT.
  constants MC_FC_PRINT_PREV type UI_FUNC value '&PRINT_BACK_PREVIEW' ##NO_TEXT.
  constants MC_FC_REFRESH type UI_FUNC value '&REFRESH' ##NO_TEXT.
  constants MC_FC_REPREP type UI_FUNC value '&REPREP' ##NO_TEXT.
  constants MC_FC_SAVE_VARIANT type UI_FUNC value '&SAVE' ##NO_TEXT.
  constants MC_FC_SELECT_ALL type UI_FUNC value '&ALL' ##NO_TEXT.
  constants MC_FC_SEND type UI_FUNC value '&SEND' ##NO_TEXT.
  constants MC_FC_SEPARATOR type UI_FUNC value '&&SEP' ##NO_TEXT.
  constants MC_FC_SORT type UI_FUNC value '&SORT' ##NO_TEXT.
  constants MC_FC_SORT_ASC type UI_FUNC value '&SORT_ASC' ##NO_TEXT.
  constants MC_FC_SORT_DSC type UI_FUNC value '&SORT_DSC' ##NO_TEXT.
  constants MC_FC_SUBTOT type UI_FUNC value '&SUBTOT' ##NO_TEXT.
  constants MC_FC_SUM type UI_FUNC value '&SUMC' ##NO_TEXT.
  constants MC_FC_TO_OFFICE type UI_FUNC value '&ML' ##NO_TEXT.
  constants MC_FC_TO_REP_TREE type UI_FUNC value '&SERP' ##NO_TEXT.
  constants MC_FC_UNFIX_COLUMNS type UI_FUNC value '&CDF' ##NO_TEXT.
  constants MC_FC_URL_COPY_TO_CLIPBOARD type UI_FUNC value '&URL_COPY_TO_CLIPBOARD' ##NO_TEXT.
  constants MC_FC_VARIANT_ADMIN type UI_FUNC value '&VARI_ADMIN' ##NO_TEXT.
  constants MC_FC_VIEWS type UI_FUNC value '&VIEW' ##NO_TEXT.
  constants MC_FC_VIEW_CRYSTAL type UI_FUNC value '&VCRYSTAL' ##NO_TEXT.
  constants MC_FC_VIEW_EXCEL type UI_FUNC value '&VEXCEL' ##NO_TEXT.
  constants MC_FC_VIEW_GRID type UI_FUNC value '&VGRID' ##NO_TEXT.
  constants MC_FC_VIEW_LOTUS type UI_FUNC value '&VLOTUS' ##NO_TEXT.
  constants MC_FC_WORD_PROCESSOR type UI_FUNC value '&AQW' ##NO_TEXT.
  constants MC_FG_EDIT type UI_FUNC value '&FG_EDIT' ##NO_TEXT.
  constants MC_FG_SORT type UI_FUNC value '&FG_SORT' ##NO_TEXT.
  constants MC_LYSTYLE_DRAG_DROP_ROWS type RAW4 value '00000001' ##NO_TEXT.
  constants MC_LYSTYLE_NO_DELETE_ROWS type RAW4 value '00000004' ##NO_TEXT.
  constants MC_LYSTYLE_NO_INSERT_ROWS type RAW4 value '00000002' ##NO_TEXT.
  constants MC_LY_DRAG_DROP_ROWS type RAW4 value '00000001' ##NO_TEXT.
  constants MC_LY_NO_DELETE_ROWS type RAW4 value '00000004' ##NO_TEXT.
  constants MC_LY_NO_INSERT_ROWS type RAW4 value '00000002' ##NO_TEXT.
  constants MC_MB_EXPORT type UI_FUNC value '&MB_EXPORT' ##NO_TEXT.
  constants MC_MB_FILTER type UI_FUNC value '&MB_FILTER' ##NO_TEXT.
  constants MC_MB_PASTE type UI_FUNC value '&MB_PASTE' ##NO_TEXT.
  constants MC_MB_SUBTOT type UI_FUNC value '&MB_SUBTOT' ##NO_TEXT.
  constants MC_MB_SUM type UI_FUNC value '&MB_SUM' ##NO_TEXT.
  constants MC_MB_VARIANT type UI_FUNC value '&MB_VARIANT' ##NO_TEXT.
  constants MC_MB_VIEW type UI_FUNC value '&MB_VIEW' ##NO_TEXT.
  constants MC_STYLE4_LINK type RAW4 value '00000004' ##NO_TEXT.
  constants MC_STYLE4_LINK_NO type RAW4 value '00000008' ##NO_TEXT.
  constants MC_STYLE_BUTTON type RAW4 value '20000000' ##NO_TEXT.
  constants MC_STYLE_DISABLED type RAW4 value '00100000' ##NO_TEXT.
  constants MC_STYLE_ENABLED type RAW4 value '00080000' ##NO_TEXT.
  constants MC_STYLE_F4 type RAW4 value '02000000' ##NO_TEXT.
  constants MC_STYLE_F4_NO type RAW4 value '04000000' ##NO_TEXT.
  constants MC_STYLE_HOTSPOT type RAW4 value '00200000' ##NO_TEXT.
  constants MC_STYLE_HOTSPOT_NO type RAW4 value '00400000' ##NO_TEXT.
  constants MC_STYLE_NO_DELETE_ROW type RAW4 value '10000000' ##NO_TEXT.
  class-data M_BUFA_SYNC type CHAR01 .
  class-data M_BUFFER_INACTIVE type CHAR01 .
  class-data M_CRYSTAL_ACTIVE type CHAR01 value SPACE ##NO_TEXT.
  data M_DISPLAY_PROTOCOL type CHAR01 value 'X' ##NO_TEXT.
  class-data M_MULTIBYTE type CHAR1 .
  class-data M_THIRD_PARTY type STRING value 'ELO' ##NO_TEXT.
  class-data M_THIRD_PARTY_WEB type STRING value 'ECL' ##NO_TEXT.
  data _MR_PRINT_DATA_CONTAINER type ref to IF_ALV_PRINT_PARAMETER_PROXY read-only .

  events ONF1
    exporting
      value(E_FIELDNAME) type LVC_FNAME optional
      value(ES_ROW_NO) type LVC_S_ROID optional
      value(ER_EVENT_DATA) type ref to CL_ALV_EVENT_DATA optional .
  events ONF4
    exporting
      value(E_FIELDNAME) type LVC_FNAME optional
      value(E_FIELDVALUE) type LVC_VALUE optional
      value(ES_ROW_NO) type LVC_S_ROID optional
      value(ER_EVENT_DATA) type ref to CL_ALV_EVENT_DATA optional
      value(ET_BAD_CELLS) type LVC_T_MODI optional
      value(E_DISPLAY) type CHAR01 optional .
  events DATA_CHANGED
    exporting
      value(ER_DATA_CHANGED) type ref to CL_ALV_CHANGED_DATA_PROTOCOL optional
      value(E_ONF4) type CHAR01 optional
      value(E_ONF4_BEFORE) type CHAR01 optional
      value(E_ONF4_AFTER) type CHAR01 optional
      value(E_UCOMM) type SY-UCOMM optional .
  events ONDROPGETFLAVOR
    exporting
      value(E_ROW) type LVC_S_ROW optional
      value(E_COLUMN) type LVC_S_COL optional
      value(ES_ROW_NO) type LVC_S_ROID optional
      value(E_DRAGDROPOBJ) type ref to CL_DRAGDROPOBJECT optional
      value(E_FLAVORS) type CNDD_FLAVORS optional .
  events ONDRAG
    exporting
      value(E_ROW) type LVC_S_ROW optional
      value(E_COLUMN) type LVC_S_COL optional
      value(ES_ROW_NO) type LVC_S_ROID optional
      value(E_DRAGDROPOBJ) type ref to CL_DRAGDROPOBJECT optional .
  events ONDROP
    exporting
      value(E_ROW) type LVC_S_ROW optional
      value(E_COLUMN) type LVC_S_COL optional
      value(ES_ROW_NO) type LVC_S_ROID optional
      value(E_DRAGDROPOBJ) type ref to CL_DRAGDROPOBJECT optional .
  events ONDROPCOMPLETE
    exporting
      value(E_ROW) type LVC_S_ROW optional
      value(E_COLUMN) type LVC_S_COL optional
      value(ES_ROW_NO) type LVC_S_ROID optional
      value(E_DRAGDROPOBJ) type ref to CL_DRAGDROPOBJECT optional .
  events SUBTOTAL_TEXT
    exporting
      value(ES_SUBTOTTXT_INFO) type LVC_S_STXT optional
      value(EP_SUBTOT_LINE) type ref to DATA optional
      value(E_EVENT_DATA) type ref to CL_ALV_EVENT_DATA optional .
  events BEFORE_USER_COMMAND
    exporting
      value(E_UCOMM) type SY-UCOMM optional .
  events USER_COMMAND
    exporting
      value(E_UCOMM) type SY-UCOMM optional .
  events AFTER_USER_COMMAND
    exporting
      value(E_UCOMM) type SY-UCOMM optional
      value(E_SAVED) type CHAR01 optional
      value(E_NOT_PROCESSED) type CHAR01 optional .
  events DOUBLE_CLICK
    exporting
      value(E_ROW) type LVC_S_ROW optional
      value(E_COLUMN) type LVC_S_COL optional
      value(ES_ROW_NO) type LVC_S_ROID optional .
  events DELAYED_CALLBACK .
  events DELAYED_CHANGED_SEL_CALLBACK .
  events PRINT_TOP_OF_PAGE
    exporting
      value(TABLE_INDEX) type SYINDEX optional .
  events PRINT_TOP_OF_LIST .
  events PRINT_END_OF_PAGE .
  events PRINT_END_OF_LIST .
  events TOP_OF_PAGE
    exporting
      value(E_DYNDOC_ID) type ref to CL_DD_DOCUMENT optional
      value(TABLE_INDEX) type SYINDEX optional .
  events CONTEXT_MENU_REQUEST
    exporting
      value(E_OBJECT) type ref to CL_CTMENU optional .
  events MENU_BUTTON
    exporting
      value(E_OBJECT) type ref to CL_CTMENU optional
      value(E_UCOMM) type SY-UCOMM optional .
  events TOOLBAR
    exporting
      value(E_OBJECT) type ref to CL_ALV_EVENT_TOOLBAR_SET optional
      value(E_INTERACTIVE) type CHAR01 optional .
  events HOTSPOT_CLICK
    exporting
      value(E_ROW_ID) type LVC_S_ROW optional
      value(E_COLUMN_ID) type LVC_S_COL optional
      value(ES_ROW_NO) type LVC_S_ROID optional .
  events END_OF_LIST
    exporting
      value(E_DYNDOC_ID) type ref to CL_DD_DOCUMENT optional .
  events AFTER_REFRESH .
  events BUTTON_CLICK
    exporting
      value(ES_COL_ID) type LVC_S_COL optional
      value(ES_ROW_NO) type LVC_S_ROID optional .
  events DATA_CHANGED_FINISHED
    exporting
      value(E_MODIFIED) type CHAR01 optional
      value(ET_GOOD_CELLS) type LVC_T_MODI optional .
  events DROP_EXTERNAL_FILES
    exporting
      value(FILES) type STRING .

  methods _GET_MASKING
    exporting
      !VALUE type STRING
      !ACTIVE type CHAR3 .
  class-methods _GET_PATH
    importing
      !IR_CONTAINER type ref to CL_GUI_CONTAINER
    returning
      value(VALUE) type STRING
    raising
      CX_SY_DYN_CALL_ILLEGAL_CLASS .
  methods _GET_COL_POS
    returning
      value(ET_COL_POS) type LVC_T_COLL .
  methods _GET_SRAL
  final
    exporting
      !ER_SRAL type ref to IF_SRAL_RT_CTRL_ALVGRID_DYNP .
  class-methods CELL_DISPLAY
    importing
      value(IS_DATA) type ANY
      value(I_INT_VALUE) type ANY
    exporting
      !E_EXT_VALUE type ANY
    changing
      !CS_FIELDCAT type LVC_S_FCAT .
  class-methods OFFLINE
    returning
      value(E_OFFLINE) type INT4 .
  class-methods TRANSFER_FCODE_LVC_TO_SLIS
    importing
      !IT_FCODES_LVC type UI_FUNCTIONS optional
      !I_FCODE_LVC type SY-UCOMM optional
    exporting
      !ET_FCODES_SLIS type SLIS_T_EXTAB
      !E_FCODE_SLIS type SY-UCOMM
    exceptions
      NO_MATCH_FOUND .
  class-methods TRANSFER_FCODE_SLIS_TO_LVC
    importing
      value(IT_FCODES_SLIS) type SLIS_T_EXTAB optional
      !I_FCODE_SLIS type SY-UCOMM optional
    exporting
      value(ET_FCODES_LVC) type UI_FUNCTIONS
      !E_FCODE_LVC type SY-UCOMM
    exceptions
      NO_MATCH_FOUND .
  class-methods _GET_TEXTS
    exporting
      !VALUE type IF_ALV_Z=>YT_TEXTS .
  methods ACTIVATE_DISPLAY_PROTOCOL
    importing
      value(I_DIALOG) type CHAR01 default 'X' .
  methods ACTIVATE_REPREP_INTERFACE
    importing
      value(IS_REPREP) type LVC_S_RPRP
    exceptions
      NO_SENDER .
  methods APPEND_ROWS
    importing
      value(I_ROW_COUNT) type INT4 default 1 .
  methods CHANGE_DATA_FROM_INSIDE
    importing
      value(IT_STYLE_CELLS) type LVC_T_MODI optional
      value(IT_CELLS) type LVC_T_POS optional
    exporting
      value(ET_BAD_CELLS) type LVC_T_MODI
      value(ET_MSG) type LVC_T_MSG1 .
  methods CHECK_CHANGED_DATA
    exporting
      !E_VALID type CHAR01
    changing
      !C_REFRESH type CHAR01 default 'X' .
  methods CONSTRUCTOR
    importing
      value(I_SHELLSTYLE) type I default 0
      value(I_LIFETIME) type I optional
      value(I_PARENT) type ref to CL_GUI_CONTAINER
      value(I_APPL_EVENTS) type CHAR01 default space
      !I_PARENTDBG type ref to CL_GUI_CONTAINER optional
      !I_APPLOGPARENT type ref to CL_GUI_CONTAINER optional
      !I_GRAPHICSPARENT type ref to CL_GUI_CONTAINER optional
      value(I_NAME) type STRING optional
      !I_FCAT_COMPLETE type SAP_BOOL default SPACE
    exceptions
      ERROR_CNTL_CREATE
      ERROR_CNTL_INIT
      ERROR_CNTL_LINK
      ERROR_DP_CREATE .
  methods FCODE_BOUNCER .
  methods GET_ACTUAL_VIEW
    exporting
      !E_VIEW type UI_FUNC .
  methods GET_BACKEND_FIELDCATALOG
    exporting
      !ET_FIELDCATALOG type LVC_T_FCAT .
  methods GET_CURRENT_CELL
    exporting
      !E_ROW type I
      !E_VALUE type C
      !E_COL type I
      !ES_ROW_ID type LVC_S_ROW
      !ES_COL_ID type LVC_S_COL
      !ES_ROW_NO type LVC_S_ROID .
  methods GET_FILTERED_ENTRIES
    exporting
      !ET_FILTERED_ENTRIES type LVC_T_FIDX .
  methods GET_FILTER_CRITERIA
    exporting
      !ET_FILTER type LVC_T_FILT .
  methods GET_FRONTEND_FIELDCATALOG
    exporting
      !ET_FIELDCATALOG type LVC_T_FCAT .
  methods GET_FRONTEND_LAYOUT
    exporting
      !ES_LAYOUT type LVC_S_LAYO .
  methods GET_FRONTEND_PRINT
    exporting
      !ES_PRINT type LVC_S_PRNT .
  methods GET_SCROLL_INFO_VIA_ID
    exporting
      !ES_ROW_NO type LVC_S_ROID
      !ES_ROW_INFO type LVC_S_ROW
      !ES_COL_INFO type LVC_S_COL .
  methods GET_SEARCH_DATA
    returning
      value(R_SEARCH) type ref to IF_ALV_LVC_SEARCH .
  methods GET_SELECTED_CELLS
    exporting
      !ET_CELL type LVC_T_CELL .
  methods GET_SELECTED_CELLS_ID
    exporting
      !ET_CELLS type LVC_T_CENO .
  methods GET_SELECTED_COLUMNS
    exporting
      !ET_INDEX_COLUMNS type LVC_T_COL .
  methods GET_SELECTED_ROWS
    exporting
      !ET_INDEX_ROWS type LVC_T_ROW
      !ET_ROW_NO type LVC_T_ROID .
  methods GET_SORT_CRITERIA
    exporting
      !ET_SORT type LVC_T_SORT .
  methods GET_SUBTOTALS
    exporting
      !EP_COLLECT00 type REF TO DATA
      !EP_COLLECT01 type REF TO DATA
      !EP_COLLECT02 type REF TO DATA
      !EP_COLLECT03 type REF TO DATA
      !EP_COLLECT04 type REF TO DATA
      !EP_COLLECT05 type REF TO DATA
      !EP_COLLECT06 type REF TO DATA
      !EP_COLLECT07 type REF TO DATA
      !EP_COLLECT08 type REF TO DATA
      !EP_COLLECT09 type REF TO DATA
      !ET_GROUPLEVELS type LVC_T_GRPL .
  methods GET_VARIANT
    exporting
      !ES_VARIANT type DISVARIANT
      !E_SAVE type CHAR1 .
  methods IS_READY_FOR_INPUT
    importing
      !I_ROW_ID type INT4 optional
      !IS_COL_ID type LVC_S_COL optional
    returning
      value(READY_FOR_INPUT) type INT4 .
  methods LIST_PROCESSING_EVENTS
    importing
      value(I_EVENT_NAME) type CHAR30
      !I_DYNDOC_ID type ref to CL_DD_DOCUMENT optional
      value(IS_SUBTOTTXT_INFO) type LVC_S_STXT optional
      !IP_SUBTOT_LINE type ref to DATA optional
      value(I_TABLE_INDEX) type SYINDEX optional
    changing
      !C_SUBTOTTXT type LVC_DISTXT optional .
  methods PROCESS_UCOMM_ON_INVALID_INPUT
    importing
      value(IT_UCOMMS) type UI_FUNCTIONS .
  methods RAISE_EVENT
    importing
      value(I_UCOMM) type SY-UCOMM optional
      value(I_USER_COMMAND) type CHAR01 optional
      value(I_NOT_PROCESSED) type CHAR01 optional
    preferred parameter I_UCOMM .
  methods REFRESH_TABLE_DISPLAY
    importing
      value(IS_STABLE) type LVC_S_STBL optional
      value(I_SOFT_REFRESH) type CHAR01 optional
    exceptions
      FINISHED .
  methods REGISTER_DELAYED_EVENT
    importing
      value(I_EVENT_ID) type I
    exceptions
      ERROR .
  methods REGISTER_EDIT_EVENT
    importing
      value(I_EVENT_ID) type I
    exceptions
      ERROR .
  methods REGISTER_F4_FOR_FIELDS
    importing
      value(IT_F4) type LVC_T_F4 .
  methods SAVE_GRID_VARIANTS_SIMUL
    importing
      value(IT_GRIDS) type LVC_T_SAVE optional .
  methods SAVE_VARIANT
    importing
      value(I_DIALOG) type CHAR01 default 'X'
    exporting
      value(E_EXIT) type CHAR01 .
  methods SAVE_VARIANT_DARK
    importing
      value(IS_VARIANT) type DISVARIANT optional
      value(I_ACTIVE) type CHAR01 default 'X' .
  methods SELECT_TEXT_IN_CURR_CELL .
  methods SET_3D_BORDER
    importing
      value(BORDER) type I
    exceptions
      ERROR .
  methods SET_AUTOREDRAW
    importing
      value(I_ENABLE) type INT4 .
  methods SET_CURRENT_CELL_VIA_ID
    importing
      value(IS_ROW_ID) type LVC_S_ROW optional
      value(IS_COLUMN_ID) type LVC_S_COL optional
      value(IS_ROW_NO) type LVC_S_ROID optional .
  methods SET_DELTA_CELLS
    importing
      value(IT_DELTA_CELLS) type LVC_T_MODI
      value(I_MODIFIED) type CHAR01 optional
      value(I_FRONTEND_ONLY) type CHAR01 optional .
  methods SET_DROP_DOWN_TABLE
    importing
      value(IT_DROP_DOWN) type LVC_T_DROP optional
      value(IT_DROP_DOWN_ALIAS) type LVC_T_DRAL optional .
  methods SET_ERROR_LOG
    importing
      !IR_ALV type ref to CL_GUI_ALV_GRID .
  methods SET_FILTER_CRITERIA
    importing
      value(IT_FILTER) type LVC_T_FILT
    exceptions
      NO_FIELDCATALOG_AVAILABLE .
  methods SET_FRONTEND_FIELDCATALOG
    importing
      value(IT_FIELDCATALOG) type LVC_T_FCAT .
  methods SET_FRONTEND_LAYOUT
    importing
      value(IS_LAYOUT) type LVC_S_LAYO .
  methods SET_FRONTEND_PRINT
    importing
      value(IS_PRINT) type LVC_S_PRNT .
  methods SET_FUNCTION_CODE
    changing
      !C_UCOMM type SY-UCOMM .
  methods SET_GRAPHICS_CONTAINER
    importing
      value(I_GRAPHICS_CONTAINER) type ref to CL_GUI_CONTAINER .
  methods SET_GRIDTITLE
    importing
      value(I_GRIDTITLE) type LVC_TITLE .
  methods SET_HEADER_TRANSPORT
    importing
      value(I_HEADER_TRANSPORT) type CHAR30 .
  methods SET_HTML_HEADER .
  methods SET_LAYOUT_OF_DOUBLEGRID
    importing
      value(IS_DTC_LAYOUT) type DTC_S_LAYO .
  methods SET_PRINT_DATA_CONTAINER
    importing
      !VALUE type ref to IF_ALV_PRINT_PARAMETER_PROXY .
  methods SET_READY_FOR_INPUT
    importing
      value(I_READY_FOR_INPUT) type INT4 default 1 .
  methods SET_SCROLL_INFO_VIA_ID
    importing
      value(IS_ROW_INFO) type LVC_S_ROW optional
      value(IS_COL_INFO) type LVC_S_COL
      value(IS_ROW_NO) type LVC_S_ROID optional .
  methods SET_SELECTED_CELLS
    importing
      value(IT_CELLS) type LVC_T_CELL .
  methods SET_SELECTED_CELLS_ID
    importing
      value(IT_CELLS) type LVC_T_CENO .
  methods SET_SELECTED_COLUMNS
    importing
      value(IT_COL_TABLE) type LVC_T_COL
      value(IS_KEEP_OTHER_SELECTIONS) type CHAR01 optional .
  methods SET_SELECTED_ROWS
    importing
      value(IT_INDEX_ROWS) type LVC_T_ROW optional
      value(IT_ROW_NO) type LVC_T_ROID optional
      value(IS_KEEP_OTHER_SELECTIONS) type CHAR01 optional .
  methods SET_SORT_CRITERIA
    importing
      value(IT_SORT) type LVC_T_SORT
    exceptions
      NO_FIELDCATALOG_AVAILABLE .
  methods SET_TABLE_FOR_FIRST_DISPLAY
    importing
      value(I_BUFFER_ACTIVE) type ANY optional
      value(I_BYPASSING_BUFFER) type CHAR01 optional
      value(I_CONSISTENCY_CHECK) type CHAR1 optional
      value(I_STRUCTURE_NAME) type DD02L-TABNAME optional
      value(IS_VARIANT) type DISVARIANT optional
      value(I_SAVE) type CHAR01 optional
      value(I_DEFAULT) type CHAR01 default 'X'
      value(IS_LAYOUT) type LVC_S_LAYO optional
      value(IS_PRINT) type LVC_S_PRNT optional
      value(IT_SPECIAL_GROUPS) type LVC_T_SGRP optional
      value(IT_TOOLBAR_EXCLUDING) type UI_FUNCTIONS optional
      value(IT_HYPERLINK) type LVC_T_HYPE optional
      value(IT_ALV_GRAPHICS) type DTC_T_TC optional
      value(IT_EXCEPT_QINFO) type LVC_T_QINF optional
      !IR_SALV_ADAPTER type ref to IF_SALV_ADAPTER optional
    changing
      !IT_OUTTAB type STANDARD TABLE
      value(IT_FIELDCATALOG) type LVC_T_FCAT optional
      value(IT_SORT) type LVC_T_SORT optional
      value(IT_FILTER) type LVC_T_FILT optional
    exceptions
      INVALID_PARAMETER_COMBINATION
      PROGRAM_ERROR
      TOO_MANY_LINES .
  methods SET_TOOLBAR_INTERACTIVE .
  methods SET_USER_COMMAND
    importing
      value(I_UCOMM) type SY-UCOMM .
  methods SET_VARIANT
    importing
      value(IS_VARIANT) type DISVARIANT
      value(I_SAVE) type CHAR1 optional .
  methods DRAG_ACCEPT_FILES
    importing
      !B_ACCEPT type I
    exceptions
      ERROR .
  methods GET_DROPPED_EXTERNAL_FILES
    exporting
      !FILES type FILETABLE
      !ROW_ID type I
      !COL_ID type I
    exceptions
      NOT_SUPPORTED_BY_GUI
      ERROR .

  methods DISPATCH
    redefinition .
  methods FREE
    redefinition .
  methods SET_REGISTERED_EVENTS
    redefinition .
protected section.

*"* protected components of class CL_GUI_ALV_GRID
*"* do not include other source files here!!!
  data MS_PRINT_INFO type LVC_S_PRNT .
  data MS_REPREP type LVC_S_RPRP .
  data MT_CT00 type ref to DATA .
  data MT_CT01 type ref to DATA .
  data MT_CT02 type ref to DATA .
  data MT_CT03 type ref to DATA .
  data MT_CT04 type ref to DATA .
  data MT_CT05 type ref to DATA .
  data MT_CT06 type ref to DATA .
  data MT_CT07 type ref to DATA .
  data MT_CT08 type ref to DATA .
  data MT_CT09 type ref to DATA .
  data MT_DATA type LVC_T_DATA .
  data MT_DELTA_CELLS_INSERTED type LVC_T_MODI .
  data MT_DETAIL type LVC_T_DETM .
  data MT_EXCLUDING_TOOLBAR type UI_FUNCTIONS .
  data MT_IDPO type LVC_T_IDPO .
  data MT_INFO type LVC_T_INFO .
  data MT_MENUENTRIES type LVC_T_TBME .
  data MT_MENUENTRIES_SET type LVC_T_TBME .
  data MT_OUTTAB type ref to DATA .
  data MT_POID type LVC_T_POID .
  data MT_REPREP_FCCLS type LVC_T_FCCL .
  data MT_SPECIAL_GROUPS type LVC_T_SGRP .
  data MT_TOOLBAR type TTB_BUTTON .
  data MT_TOOLBAR_SET type TTB_BUTTON .
  data MT_UNIT_VALUES type LVC_T_DEPS .
  data MT_VALUE_UNIT type LVC_T_REFS .
  data M_APPL_EVENTS type CHAR01 .
  data M_CL_CONTEXT_MENU type ref to CL_CTMENU .
  data M_CL_GRAPHICS_CONTAINER type ref to CL_GUI_CONTAINER .
  data M_CL_MENU_BUTTON_EXPORT type ref to CL_CTMENU .
  data M_CL_MENU_BUTTON_FILTER type ref to CL_CTMENU .
  data M_CL_MENU_BUTTON_PASTE type ref to CL_CTMENU .
  data M_CL_MENU_BUTTON_PRINT type ref to CL_CTMENU .
  data M_CL_MENU_BUTTON_REPREP type ref to CL_CTMENU .
  data M_CL_MENU_BUTTON_SUBTOT type ref to CL_CTMENU .
  data M_CL_MENU_BUTTON_SUM type ref to CL_CTMENU .
  data M_CL_MENU_BUTTON_VARIANT type ref to CL_CTMENU .
  data M_CL_MENU_BUTTON_VIEW type ref to CL_CTMENU .
  data M_CL_SUBMENU_EXPCRYSTAL type ref to CL_CTMENU .
  data M_CL_TOOLBAR type ref to CL_ALV_EVENT_TOOLBAR_SET .
  data M_COMPLEX_TYPE type CHAR01 .
  data M_EVENTID type I .
  data M_FCODE_CLICK_HEADER type SY-UCOMM value '&SORT' ##NO_TEXT.
  data M_FIRST type CHAR01 .
  data M_INVALID_FRONTEND_FIELDCAT type CHAR01 .
  data M_INVALID_INPUT type CHAR01 .
  data M_REPREP_ACTIVE type LVC_REPREP .
  data M_REPREP_CALLED type CHAR01 .
  data M_STRUCTURE_NAME type DD02L-TABNAME .
  data M_UCOMM type SY-UCOMM .
  data M_VERY_FIRST type CHAR01 .
  data ORG_M_CL_GRAPHICS type ref to CL_ALV_GRAPHICS .

  methods GET_INTERNAL_FIELDCAT
    exporting
      !ET_FIELDCATALOG type LVC_T_FCAT .
  methods GET_INTERNAL_FILTER
    exporting
      !ET_FILTER type LVC_T_FILT .
  methods GET_INTERNAL_LAYOUT
    exporting
      !ES_LAYOUT type LVC_S_LAYO .
  methods GET_INTERNAL_SORT
    exporting
      !ET_SORT type LVC_T_SORT .
  methods GET_INTERNAL_VARIANT
    exporting
      !ES_VARIANT type DISVARIANT .
  methods ON_TOOLBARMENU_CHANGED
    for event CHANGED of CL_CTMENU
    importing
      !SENDER .
  methods _GET_INTERNAL_MEMBER_VALUE
    importing
      !NAME type STRING
    returning
      value(VALUE) type STRING .
  methods _SET_INTERNAL_MEMBER_VALUE
    importing
      !NAME type STRING
      !VALUE type STRING .

  methods ON_BEFORE_SEND
    redefinition .
  methods ON_OI_CUSTOM_EVENT
    redefinition .
private section.

  types:
*"* private components of class CL_GUI_ALV_GRID
*"* do not include other source files here!!!
    begin of l_type_s_search_criteria,
      new     type sap_bool,
      value   type lvc_value,
      order   type char01,
      as_word type char1,
      all     type char1,
      info    type lvc_string,
    end   of l_type_s_search_criteria .
  types:
    begin of l_type_s_search_position,
      row           type i,
      column        type i,
      index         type i,
      start_offset  type i,
      end_offset    type i,
    end   of l_type_s_search_position .
  types:
    l_type_t_search_position type sorted table of l_type_s_search_position
         with unique key row column .
  types:
    begin of l_type_s_search_package,
      start_index    type i,
      end_index      type i,
      t_data         type lvc_t_data,
      position_index type i,
      size           type i,
      lines          type i,
    end   of l_type_s_search_package .
  types:
    begin of l_type_s_search_result,
      t_result       type l_type_t_search_position,
      position_index type i,
    end   of l_type_s_search_result .
  types:
    begin of l_type_s_search_area,
      mtdata_lines type i,
      columns      type i,
      t_area       type lvc_t_coll,
    end   of l_type_s_search_area .
  types:
    BEGIN OF l_type_s_back_front_map,  ">>>>>>>>>>Y6BK069609
           back  TYPE i,
           front TYPE I,
    END   OF l_type_s_back_front_map .
  types:
    l_type_t_back_front_map type standard table of
        l_type_s_back_front_map with default key .
  types:
    begin of l_type_s_search,
      s_criteria   type l_type_s_search_criteria,
      s_position   type l_type_s_search_position,
      s_result     type l_type_s_search_result,
      s_area       type l_type_s_search_area,
      t_col_pos    type l_type_t_back_front_map,
      s_package    type l_type_s_search_package,
    end   of l_type_s_search .

  data M_SYS_TYPE type CHAR1 .
  data FILES_STR type STRING .
  constants:
    begin of lc_s_search_order,
      top_to_bottom    type i value 0,
      bottom_to_top    type i value 1,
      cursor_to_bottom type i value 2,
      cursor_to_top    type i value 3,
    end   of lc_s_search_order .
  constants MC_FC_RECORD type UI_FUNC value '&RECORD' ##NO_TEXT.
  constants MC_FC_REC_DEL type UI_FUNC value '&REC_DEL' ##NO_TEXT.
  constants MC_FC_SOS type UI_FUNC value '&SOS' ##NO_TEXT.
  constants MC_FULL type CHAR01 value 'F' ##NO_TEXT.
  constants MC_MULTIBYTE type CHAR01 value 'X' ##NO_TEXT.
  constants MC_SOFT type CHAR01 value 'S' ##NO_TEXT.
  data MR_APPLOG_CONTAINER type ref to CL_GUI_CONTAINER .
  data MR_DATA_CHANGED type ref to CL_ALV_CHANGED_DATA_PROTOCOL .
  data MR_GRAPHICS_CONTAINER type ref to CL_GUI_CONTAINER .
  data MR_SEARCH type ref to CL_ALV_LVC_SEARCH_DIALOG .
  data MR_TRACE type ref to CL_ALV_TRACE .
  data MS_LAYOUT_LOCAL type LVC_S_LAYL .
  data MS_SEARCH type L_TYPE_S_SEARCH .
  data MT_ALV_GRAPHICS type DTC_T_TC .
  data MT_BIDI_FLAG type LVC_T_BIDI_FLAG .
  data MT_CELL_DATA type LVC_T_CELL .
  data MT_COL_POS_ID_TABLE type LVC_T_COLL .
  data MT_DELETED_ROWS type LVC_T_MOCE .
  data MT_EXCEPT_QINFO type LVC_T_QINF .
  data MT_F4 type LVC_T_F4 .
  data MT_FIELDCAT_LOCAL type LVC_T_FCAT .
  data MT_HYPERLINKS type LVC_T_HYPE .
  data MT_MSG type LVC_T_MSG1 .
  data MT_ROID type LVC_T_ROID .
  data MT_ROID_FRONT type LVC_T_ROID .
  data MT_START_INDEX type LVC_T_STIN .
  data MT_UCOMMS_ONINVINPUT type UI_FUNCTIONS .
  data M_BUFFER_ACTIVE type CHAR01 .
  data M_BYPASSING_BUFFER type CHAR01 .
  data M_CELL_EDIT type CHAR01 .
  class-data M_CHECK_CRYSTAL type CHAR01 .
  data M_CL_SRAL type ref to IF_SRAL_RT_CTRL_ALVGRID_DYNP .
  data M_CL_VARIANT type ref to CL_ALV_VARIANT .
  data M_COL_CLICK_REGISTERED type CHAR01 .
  data M_DIALOGBOX_LEFT type INT4 .
  data M_DIALOGBOX_TOP type INT4 .
  data M_DISABLE_SAVE type CHAR01 .
  data M_DROPDOWN_ALIASES type LVC_T_DRAL .
  data M_EDIT type CHAR01 .
  data M_EDIT_COLS type CHAR01 .
  data M_EDIT_GLOBAL type CHAR01 .
  data M_FCAT_COMPLETE type SAP_BOOL .
  data M_FULL type CHAR01 .
  data M_HEADER_TRANSPORT type CHAR30 .
  data M_INIT_TOOLBAR type CHAR1 .
  data M_MEMORY type BOOLEAN .
  data M_NEXT_ALV_BDS type LVC_S_BDS .
  data M_NEXT_VIEW type UI_FUNC .
  data M_PATH type STRING .
  data M_PERFORMANCE type CHAR1 .
  data M_REPREP_FOR_SUMLINE type CHAR1 .
  data M_ROIDS_SENT type CHAR1 .
  data M_SAVE_IN_PROCESS type CHAR01 .
  data M_SCROLL_TO_BOTTOM type SAP_BOOL .
  data M_WWW type CHAR01 .
  data R_SALV_ADAPTER type ref to IF_SALV_ADAPTER .
  data:
    begin of _bridge_flags,
      suppress_bridge_once type abap_bool,
      continue_after_return type abap_bool,
    end of _bridge_flags .
  data _FULLSCREEN_MODE type ABAP_BOOL .
  data _R_BRIDGE type ref to IF_ALV_RM_GRID_BRIDGE .
  data _MO_AMC_RECEIVER type ref to LCL_AMC_PUSH_CHANNEL .
  data _M_UIM type CHAR3 .

  events _BEFORE_REFRESH .

  class-methods SET_HTML_LOADER_TO_MEMORY
    importing
      !I_URL type CHAR1024
    exceptions
      NO_TEMPLATE_FOUND .
  methods ABC_ANALYSIS .
  methods ADD_BIDI_FLAG
    importing
      !FIELDNAME type LVC_FNAME
    changing
      !VALUE type LVC_VALUE .
  methods ADD_BIDI_FLAGS
    importing
      !IT_FIELDCATALOG type LVC_T_FCAT optional .
  methods APPLY_FILTER .
  methods APPLY_SORT .
  methods AUTHORITY_CHECK .
  methods BUILD_COMPLETE_TOOLBAR
    importing
      !I_SAVE type CHAR01
      !IS_VARIANT type DISVARIANT
      !I_INTERACTIVE type CHAR01 default SPACE
      !IT_TOOLBAR_EXCLUDING type UI_FUNCTIONS .
  methods CELL_ID_IN_POSITION_RANGE
    importing
      !IT_CELLS type LVC_T_CEL1
    exporting
      !ET_CELL_IDS type LVC_T_CELL .
  methods CHANGE_OUTLINE
    exceptions
      EXIT .
  methods CHANGE_VIEW
    importing
      !I_NEW_VIEW type UI_FUNC
    exceptions
      NEW_VIEW_NOT_SUPPORTED .
  methods CHECK_FIELD_FILTER_CRITERIA
    importing
      value(I_CELL) type LVC_S_MODI optional
      value(IT_CELLS) type LVC_T_MODI optional
    exporting
      value(E_YES) type CHAR01 .
  methods CHECK_FIELD_SORT_CRITERIA
    importing
      value(I_CELL) type LVC_S_MODI optional
      value(IT_CELLS) type LVC_T_MODI optional
    exporting
      value(E_YES) type CHAR01 .
  methods CHECK_FIELD_TOTAL_CRITERIA
    importing
      value(I_CELL) type LVC_S_MODI optional
      value(IT_CELLS) type LVC_T_MODI optional
    exporting
      value(E_YES) type CHAR01 .
  methods CHECK_FOR_BIDI_FLAG .
  methods CHECK_REFRESH_REQUIRED
    importing
      value(I_CELL) type LVC_S_MODI optional
      value(IT_CELLS) type LVC_T_MODI optional
    exporting
      value(E_YES) type CHAR01 .
  methods CONSISTENCY_CHECK .
  methods CREATE_EX_RESULT
    returning
      value(ER_RESULT_TABLE) type ref to CL_SALV_EX_RESULT_DATA_TABLE .
  methods DELTA_REFRESH
    importing
      !IT_GOOD_CELLS type LVC_T_MODI
      !IFLG_ORDER_CHANGED type I optional
    exporting
      !EFLG_FULL_REFRESH type CHAR01
    changing
      !CT_CONVERSION type LVC_T_ROID optional
      !CT_DELETED_ROWS type LVC_T_MOCE optional .
  methods DELTA_REFRESH_F4
    importing
      !IT_GOOD_CELLS type LVC_T_MODI .
  methods DETERMINE_M_EDIT .
  methods DETERMINE_READONLY_SIMPLE
    exporting
      value(E_READONLY) type INT4 .
  methods DISPLAY_GRAPHICS .
  methods DISPLAY_PROTOCOL .
  methods DO_RUNTIME_INFO .
  methods DROPDOWN_VALUE_CHANGE
    importing
      !IS_FIELDCAT type LVC_S_FCAT
    changing
      !CS_CELL type LVC_S_MOCE .
  methods EXECUTE_FCODE
    importing
      value(I_UCOMM) type SY-UCOMM
    exporting
      !E_STABLE_ROW type CHAR01
      !E_STABLE_COL type CHAR01
      !E_REFRESH_MODE type CHAR01
      !E_SAVE type CHAR01 .
  methods EXPORT_BACKEND
    importing
      !I_PREVIEW type CHAR1 optional
      !I_EXPORT type CHAR01 optional
      !I_EXPCODE type UI_FUNC
      !IT_TEMPLATE type SBDST_CONTENT optional
      !I_TEMPLATE_FILESIZE type INT4 optional
      !IS_ALV_BDS type LVC_S_BDS optional
    exporting
      !E_URL type CHAR1024
    exceptions
      CANCELLED
      FAILED .
  methods EXPORT_TO_CRBATCH
    importing
      !IS_ALV_BDS type LVC_S_BDS optional
      value(I_OFFLINE) type FLAG optional
    exporting
      !E_URL type CHAR1024
    exceptions
      CANCELLED
      FAILED
      NO_TEMPLATE_FOUND .
  methods EXPORT_TO_CRWEB
    importing
      !IT_CONTENT type SBDST_CONTENT
      !I_FILESIZE type INT4
      !IS_ALV_BDS type LVC_S_BDS
    exporting
      !E_URL type CHAR1024
    exceptions
      CANCELLED
      FAILED
      NO_TEMPLATE_FOUND .
  methods EXPORT_TO_LOCAL_FILE .
  methods EXPORT_TO_OFFICE .
  methods EXPORT_TO_REPORTING_TREE .
  methods EXPORT_TO_SPREAD_SHEET .
  methods EXPORT_TO_WORD_PROCESSOR .
  methods EXPORT_TO_XINT
    exceptions
      CANCELLED
      FAILED .
  methods EXPORT_TO_XML
    importing
      value(I_MODE) type SY-UCOMM optional .
  methods F4 .
  methods FILTER_TABLE
    exceptions
      NO_CHANGE .
  methods FIX_COLUMNS .
  methods FOREIGN_KEY_CHECK
    importing
      !I_ROW_ID type INT4
    exporting
      !E_INVALID type CHAR01
    changing
      !CS_WA type ANY
      !CT_MOD_CELLS type LVC_T_MODI
      !CT_GOOD_CELLS type LVC_T_MODI
      !CT_CHECK type LVC_T_CHCK
      !CT_MSG type LVC_T_MSG1 .
  methods FORMAL_FIELD_CHECK_DDIC
    importing
      !I_CURRENCY type C
      !I_VALUE type C
      !I_ROW_ID type I
      !I_TABIX type I
      !IS_FIELDCAT type LVC_S_FCAT
    exporting
      !EFLG_INVALID type CHAR01
    changing
      !C_FIELD type ANY
      !CT_MOD_CELLS type LVC_T_MODI
      !CT_GOOD_CELLS type LVC_T_MODI .
  methods FORMAL_FIELD_CHECK_NO_DDIC
    importing
      !I_CURRENCY type C
      !I_VALUE type C
      !I_ROW_ID type I
      !I_TABIX type I
      !IS_FIELDCAT type LVC_S_FCAT
    exporting
      !EFLG_INVALID type CHAR01
    changing
      !C_FIELD type ANY
      !CT_MOD_CELLS type LVC_T_MODI
      !CT_GOOD_CELLS type LVC_T_MODI .
  methods GET_BDS_TEMPLATE_CRYSTAL
    importing
      !I_TABLE_REQUESTED type FLAG optional
      !I_OFFLINE type FLAG optional
      !I_CURRENT_TEMPLATE_VALID type FLAG optional
      value(I_SUPRESS_MESSAGE) type FLAG optional
    exporting
      !ES_ALV_BDS type LVC_S_BDS
      !ET_CONTENT type SBDST_CONTENT
      !E_FILESIZE type INT4
    exceptions
      CANCEL_SELECT
      NEW_VIEW_NOT_SUPPORTED
      NO_TEMPLATE_FOUND
      NO_UNIQUE_TEMPLATE .
  methods GET_CELL_DATA
    importing
      !I_FROM_ROW type I optional
      !I_TO_ROW type I optional
    changing
      !CT_CELLS type LVC_T_CELL .
  methods GET_CHANGED_DATA
    importing
      value(IT_STYLE_CELLS) type LVC_T_MODI
    exporting
      !ET_CELLS type LVC_T_MODI
    changing
      !ET_BAD_CELLS type LVC_T_MODI
      !ET_MSG type LVC_T_MSG1
      !LT_CONVERSION type LVC_T_ROID .
  methods GET_CRYSTAL_URL
    importing
      !IS_ALV_BDS type LVC_S_BDS
    exporting
      !E_URL type CHAR1024
    exceptions
      CANCELLED
      FAILED
      NO_TEMPLATE_FOUND .
  methods GET_GROUPLEVELS .
  methods GET_OTHER_CHECKFIELDS
    importing
      !IS_FIELDCAT type LVC_S_FCAT
    exporting
      !ET_CHECK type LVC_T_CHCK .
  methods GET_ROW_FROM_ID
    importing
      !IS_ROW_INFO type LVC_S_ROW
    exporting
      !E_ROW type INT4
    exceptions
      NOT_FOUND .
  methods GET_TOTALS .
  methods GET_UNVALIDATED_DATA
    importing
      !IT_CELLS type LVC_T_POS
      value(IT_STYLE_CELLS) type LVC_T_MODI optional
    exporting
      !ET_CELLS type LVC_T_MODI .
  methods ID_IN_POSITION
    importing
      !IS_ROW_ID type LVC_S_ROW
    exporting
      !E_POSITION type INT4
    exceptions
      NOT_FOUND .
  methods INIT_CONTEXT_MENU
    importing
      !IT_TOOLBAR_EXCLUDING type UI_FUNCTIONS
    exceptions
      ERROR_REGIST_EVENT .
  methods INIT_TOOLBAR
    importing
      !I_SAVE type CHAR01
      !IS_VARIANT type DISVARIANT
      !I_INTERACTIVE type CHAR01 default SPACE
      !IT_TOOLBAR_EXCLUDING type UI_FUNCTIONS .
  methods LAYOUT_ADMINISTRATION .
  methods LAYOUT_COLWIDTH_OPTIMIZE .
  methods LVC_TABLE_FILL
    importing
      !FIRSTLINE type I
      !LASTLINE type I
      !DELETE_ENTRIES_NOT_IN_RANGE type ABAP_BOOL default ABAP_TRUE .
  methods MAINTAIN_ALL_VARIANTS .
  methods MAINTAIN_VARIANT
    exporting
      !E_SAVED type CHAR1
    exceptions
      NO_CHANGE .
  methods MAP_ROID_TO_ROW
    importing
      value(IT_ROW_NO) type LVC_T_ROID
    exporting
      value(ET_INDEX_ROWS) type LVC_T_ROW .
  methods MAP_ROW_TO_ROID
    importing
      value(IT_INDEX_ROWS) type LVC_T_ROW
    exporting
      value(ET_ROW_NO) type LVC_T_ROID .
  methods MERGE_STATIC_MENUS
    importing
      !IT_TOOLBAR type TTB_BUTTON
    changing
      !CT_BTNMNU type TTB_BTNMNU .
  methods ON_BEFORE_SEND_IMPL
    for event BEFORE_SEND of CL_DATAPTABLECACHE
    importing
      !FIRSTLINE
      !LASTLINE .
  methods ON_CLOSE
    for event CLOSE of CL_GUI_DIALOGBOX_CONTAINER .
  methods ON_CLOSE_GRAPHICS
    for event ONCLOSE of CL_ALV_GRAPHICS .
  methods ON_CLOSE_OBJ
    for event ON_CLOSE_OBJ of CL_ALV_CHANGED_DATA_PROTOCOL .
  methods ON_HOTSPOT_CLICK
    for event HOTSPOT_CLICK of CL_GUI_ALV_GRID
    importing
      !E_ROW_ID
      !ES_ROW_NO .
  methods ON_MATCH_FOUND
    for event MATCH_FOUND of CL_ALV_LVC_SEARCH_DIALOG
    importing
      !E_MODUS
      !ET_SEARCH_ENTRIES
      !E_NUMBER_OF_HITS
      !E_CURRENT_HIT .
  methods OPTIMIZE_COLUMNS
    importing
      !I_ALL_COLUMNS type CHAR01 default SPACE .
  methods POSITION_IN_ID
    importing
      !I_POSITION type INT4
    exporting
      !ES_ROW_ID type LVC_S_ROW
    exceptions
      NOT_FOUND .
  methods POSITION_IN_ID_RANGE
    importing
      !IT_POSITION type LVC_T_SELE
    exporting
      !ET_ROW_ID type LVC_T_ROW .
  methods PREPARE_EXPORT .
  methods PRINT_BACKEND
    importing
      !I_PREVIEW type CHAR1 optional
      !I_EXPORT type CHAR01 optional
      !I_NOCRYSTAL type CHAR01 default SPACE
      value(I_UCOMM) type UI_FUNC optional .
  methods PROCESS_HELP_REQUEST .
  methods PROCESS_INFO_REQUEST .
  methods PUT_PARAMETERS .
  methods REFRESH_MODE_DECISION
    importing
      value(IT_GOOD_CELLS) type LVC_T_MODI
      !I_REFRESH type CHAR01
      !I_MODIFIED type CHAR01 optional .
  methods REMOVE_BIDI_FLAGS
    changing
      !IT_CELLS type LVC_T_MOCE .
  methods REPREP_EXIT_CHECK
    exporting
      !E_SUBRC type SYSUBRC .
  methods REPREP_INTERFACE
    importing
      value(I_UCOMM) type SYUCOMM .
  methods REPREP_STACK_CHECK
    importing
      !IS_REPREP type LVC_S_RPRP
    exporting
      !E_CALLED type CHAR1 .
  methods REPREP_TRSTI_CHECK
    importing
      !IS_REPREP type LVC_S_RPRP
    exporting
      !ET_FCCLS type LVC_T_FCCL
      !E_SUBRC type SYSUBRC .
  methods SALV_AT_SOFT_REFRESH .
  methods SALV_AT_TOOLBAR .
  methods SAVE_DATA
    importing
      !I_F4 type CHAR01 optional
      !I_F4_BEFORE type CHAR01 optional
      !I_F4_AFTER type CHAR01 optional
    exporting
      !ET_BAD_CELLS type LVC_T_MODI
    changing
      !C_REFRESH type CHAR01 optional
    exceptions
      DELTA_REFRESH
      INVALID_INPUT
      SAVE_NOT_ALLOWED .
  methods SEARCH .
  methods SEARCH2 .
  methods SEARCH_BACKEND
    importing
      !I_UCOMM type SY-UCOMM .
  methods SEARCH_DEFINE .
  methods SEARCH_START
    changing
      !CS_SEARCH type L_TYPE_S_SEARCH optional .
  methods SELECT_VARIANT
    exceptions
      CANCELED
      NOT_FOUND .
  methods SELFIELD_GET
    exporting
      !ES_SELFIELD_KKBLO type KKBLO_SELFIELD
      !ES_SELFIELD type LVC_S_SELF .
  methods SEND_DATA_OF_GRID .
  methods SET_COLUMNS_INVISIBLE .
  methods SET_CURRENT_CELL
    importing
      value(I_ROW) type I
      value(I_COLUMN) type I
      value(I_START_POSITION) type I
      value(I_END_POSITION) type I .
  methods SET_FIELDCATALOG
    importing
      value(IT_FIELDCATALOG) type LVC_T_FCAT .
  methods SET_FIELD_REFERENCES .
  methods SET_FILTER_INDEX
    importing
      value(IT_FILTER_INDEX) type LVC_T_FIDX .
  methods SET_FLAG_TOTAL_COLUMN
    importing
      value(I_UCOMM) type SY-UCOMM optional
    exceptions
      NO_COLUMNS_SELECTED
      NO_COLUMN_THAT_CAN_BE_TOTALED .
  methods SET_HYPERLINK_TABLE
    importing
      !IT_HYPERLINK type LVC_T_HYPE .
  methods SET_LAYOUT_PROPERTIES .
  methods SET_READY_FOR_INPUT_INTERNAL
    exporting
      !E_RDONLY type INT4 .
  methods SET_REGISTERED_EVENTS_INTERNAL
    importing
      value(EVENTS) type CNTL_SIMPLE_EVENTS
    exceptions
      CNTL_ERROR
      CNTL_SYSTEM_ERROR
      ILLEGAL_EVENT_COMBINATION .
  methods SET_SCROLL_INFO
    importing
      value(I_ROW) type I optional
      value(I_COL) type I optional .
  methods SET_SCROLL_INFO_COMBINED
    importing
      value(I_ROW) type I optional
      value(IS_COL_INFO) type LVC_S_COL optional .
  methods SET_SCROLL_INFO_ID
    importing
      value(IS_ROW_NO) type LVC_S_ROID
      value(IS_COL_ID) type LVC_S_COL .
  methods SET_TOOLBAR
    importing
      value(I_INTERACTIVE) type CHAR01 default SPACE .
  methods SET_TOOLTIPS .
  methods SHOW_DETAIL .
  methods SHOW_GRAPHICS
    importing
      value(IT_GRAPHICS_COLUMNS) type LVC_T_FNAM
      value(IT_GRAPHICS_ROID) type LVC_T_ROID .
  methods SHOW_VIEW
    importing
      value(IS_ALV_BDS) type LVC_S_BDS
      value(I_NEW_VIEW) type UI_FUNC
    exceptions
      NEW_VIEW_NOT_SUPPORTED
      NO_VALID_DOCUMENT .
  methods SOFT_REFRESH_TABLE_DISPLAY
    importing
      !IS_STABLE type LVC_S_STBL optional
      !IS_INFO type LVC_S_ADDI optional
    exceptions
      TOO_MANY_LINES .
  methods SORT_TABLE
    importing
      !I_ASCENDING type CHAR01
      !I_SUBTOTALS type CHAR01 optional
      !I_SINGLE_CLICK_EVENT type CHAR01 optional
    exceptions
      NO_CHANGE .
  methods SORT_TABLE_UP_OR_DOWN
    importing
      !I_COLUMN type LVC_S_COL optional .
  methods SPLIT_GOOD_AND_BAD
    importing
      !IT_CELLS type LVC_T_MOCE
    exporting
      !ET_MOD_CELLS type LVC_T_MODI
      !ET_GOOD_CELLS type LVC_T_MODI
      !ET_DELETED_ROWS type LVC_T_MOCE
      !ET_INSERTED_ROWS type LVC_T_MOCE
      !E_REFRESH type CHAR01
      !EFLG_INVALID type CHAR01
    changing
      !CT_TAB2 type STANDARD TABLE .
  methods TOOLBAR_BUILD .
  methods TOOLBAR_INIT .
  methods TOOLBAR_MENUS_CREATE .
  methods TOOLBAR_MENUS_INIT .
  methods TOOLBAR_MODIFY .
  methods UNFIX_COLUMNS .
  methods URL_COPY_TO_CLIPBOARD .
  methods WWW_ALV_CALL .
  methods _CONTINUE_AFTER_RETURN .
  methods _CREATE_BRIDGE .
  methods _HANDLE_GRID_EVENTS
    importing
      !NAME type STRING
      !ACTION type STRING .
  methods _HANDLE_TOOLBAR_EVENTS
    importing
      !NAME type STRING
      !I_INTERACTIVE type CHAR01 optional
      !R_TOOLBAR type ref to CL_ALV_EVENT_TOOLBAR_SET optional
      !ACTION type STRING
      !R_CTMENU type ref to CL_CTMENU optional .
  methods _IS_BRIDGE_ACTIVE
    returning
      value(BRIDGE_ACTIVE) type ABAP_BOOL .
  methods _IS_CONTINUE_REQUESTED
    returning
      value(CONTINUE_REQUESTED) type ABAP_BOOL .
  methods _SUPPRESS_BRIDGE_ONCE .
ENDCLASS.