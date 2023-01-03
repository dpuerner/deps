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



CLASS CL_GUI_ALV_GRID IMPLEMENTATION.


method abc_analysis .
return.

endmethod.


method activate_display_protocol.
return.
endmethod.


method activate_reprep_interface .
return.
endmethod.


method ADD_BIDI_FLAG .
return.
endmethod.


method ADD_BIDI_FLAGS .
return.
endmethod.


method APPEND_ROWS .
return.
endmethod.


method apply_filter .
return.
endmethod.


method apply_sort.
return.
endmethod.


method authority_check.
return.
endmethod.


method build_complete_toolbar.
return.
endmethod.


method cell_display.
return.
endmethod.


method cell_id_in_position_range .
return.
endmethod.


method change_data_from_inside.
return.
endmethod.


method change_outline.
return.
endmethod.


method change_view.
return.
endmethod.


method check_changed_data.
return.
endmethod.


method check_field_filter_criteria.
return.
endmethod.


method check_field_sort_criteria.
return.
endmethod.


method check_field_total_criteria.
return.
endmethod.


method CHECK_FOR_BIDI_FLAG.
return.
endmethod.


method check_refresh_required.
return.
endmethod.


method consistency_check.
return.
endmethod.


method constructor.
return.
endmethod.

method CREATE_EX_RESULT.
return.
endmethod.

method delta_refresh.
return.
endmethod.

method delta_refresh_f4 .
return.
endmethod.

method determine_m_edit.
return.
endmethod.

method determine_readonly_simple .
return.
endmethod.

method dispatch.
return.
endmethod.

method display_graphics .
return.
endmethod.

method display_protocol.
endmethod.

method do_runtime_info.
return.
endmethod.

method DRAG_ACCEPT_FILES.
return.
endmethod.


method DROPDOWN_VALUE_CHANGE .
return.
endmethod.


METHOD execute_fcode.
return.
ENDMETHOD.                    "execute_fcode


method export_backend .
endmethod.


method export_to_crbatch .

endmethod.


method export_to_crweb .


endmethod.


method export_to_local_file .


endmethod.


method export_to_office .


endmethod.


method export_to_reporting_tree.


endmethod.


method export_to_spread_sheet .


endmethod.


method export_to_word_processor .


endmethod.


method export_to_xint .


endmethod.


method EXPORT_TO_XML.


endmethod.


method f4.

endmethod.                    "f4


method fcode_bouncer.

endmethod.


method filter_table .

endmethod.


method fix_columns.


endmethod.


METHOD foreign_key_check.


ENDMETHOD.


method formal_field_check_ddic.


endmethod.


method formal_field_check_no_ddic.


endmethod.                    "formal_field_check_no_ddic


method free.

endmethod.                    "free


method get_actual_view.

endmethod.


method get_backend_fieldcatalog.

endmethod.


method get_bds_template_crystal .


endmethod.


method get_cell_data .

endmethod.


method get_changed_data.

endmethod.


method get_crystal_url .

* -crystal-reports-html-gui-processing.

  clear m_crystal_return_url.

  field-symbols: <lt_data>         type standard table,
                 <lt_clean_data>   type standard table.

  data: lt_fieldcat_kkblo       type kkblo_t_fieldcat,
        lt_aqfieldcat     type table of rsaqldesc,
        lt_aqfpairs       type table of rsaqfpairs,
        lt_aqfieldlist    type standard table of rsaqrflist,
        lt_aqrqlist       type standard table of rsaqrqlist,
        lt_convexits      type standard table of lvcdincl,
        dref              type ref to data,
        l_cancel          type c,
        ref               type ref to data,
        lp_table          type ref to data.


  data lt_template type sbdst_content.
  data l_template_filesize type int4.
  data ls_alv_bds type lvc_s_bds.
*... Crystal-VIEW switch ! (not view switch, see above).
*   call method soft_refresh_table_display.

  assign mt_outtab->* to <lt_data>.

  call method me->get_bds_template_crystal
            exporting i_offline = ' '
                      i_table_requested = 'X'
                      i_current_template_valid = 'X'
            importing es_alv_bds = ls_alv_bds
                      et_content = lt_template
                      e_filesize = l_template_filesize
            exceptions cancel_select = 1
                       no_template_found = 1
                       others = 1.
  if ( sy-subrc ne 0 ).
    raise no_template_found.
  endif.

  call function 'LVC_TRANSFER_TO_KKBLO'
       exporting
            it_fieldcat_lvc   = m_cl_variant->mt_fieldcatalog
       importing
            et_fieldcat_kkblo = lt_fieldcat_kkblo.

  call function 'ALV_AQ_XINT_CONVERSION'
       exporting
            it_fieldcat             = lt_fieldcat_kkblo
            it_filter_index         = m_cl_variant->mt_filter_index
            i_currency_shift        = 'X'
       importing
            ep_new_table            = lp_table
       tables
*             ct_outtab = <lt_clean_data> " changing!
            ct_outtab               = <lt_data>
            et_aqfieldcat           = lt_aqfieldcat[]
            et_aqfpairs             = lt_aqfpairs[]
            et_aqfieldlist          = lt_aqfieldlist[]
            et_aqrqlist             = lt_aqrqlist[]
            et_convexits            = lt_convexits[]
       exceptions
            conversion_not_possible = 0
            others                  = 0.

  assign lp_table->* to <lt_clean_data>.

  assign lp_table->* to <lt_clean_data>.

  call function 'SLVC_EXPORT_CRWEB2'
               exporting
                    new                 = 'X'
*                        filename  = l_filename
                    i_layout            = m_cl_variant
                    repid               =
                         m_cl_variant->ms_variant-report
                    it_template         = lt_template
                    is_alv_bds          = ls_alv_bds
                    i_template_filesize = l_template_filesize
               importing e_url = e_url
               tables
                    listdesc               = lt_aqfieldcat[]
                    fpairs                 = lt_aqfpairs[]
                    it_outtab              = <lt_clean_data>
                    it_aqfieldlist         = lt_aqfieldlist[]
                    it_aqrqlist            = lt_aqrqlist[]
                    it_convexits           = lt_convexits[]
              exceptions
                    cancel                 = 1
                    error                  = 2
                    gui_type_not_supported = 3
                    others                 = 4.
  case sy-subrc.
    when 0.
      me->m_crystal_return_url = e_url.
    when 1.
      raise cancelled.
    when others.
      raise failed.
  endcase.

endmethod.


METHOD get_current_cell .

  if _is_bridge_active( ) = abap_true.
    macro_bridge_call_data.
    macro_bridge_method_name cl_gui_alv_grid get_current_cell.
    macro_bridge_opt_parameter importing: e_row     e_row,
                                          e_value   e_value,
                                          e_col     e_col,
                                          es_row_id es_row_id,
                                          es_col_id es_col_id,
                                          es_row_no es_row_no.
    macro_bridge_call.
    exit.
  endif.

  DATA: l_position TYPE i,
        ls_poid TYPE lvc_s_roro,
        l_field(30) TYPE c.

  DATA: lt_areas       TYPE soi_area_table,
        lt_columnids   TYPE soi_map_table,
        lt_rowids      TYPE soi_map_table,
        ls_area        TYPE soi_area_item,
        ls_rowid       TYPE soi_map_item,
        ls_columnid    TYPE soi_map_item,
        ls_colitem     TYPE lvc_s_col,
        ls_rowitem     TYPE lvc_s_roid,
        l_rowcount     TYPE i,
        l_columncount  TYPE i,
        l_zeilen       TYPE i.

*... Initialization
  CLEAR: e_row,
         e_value,
         e_col,
         es_row_id,
         es_col_id,
         es_row_no.

  IF NOT m_oi_proxy       IS INITIAL          AND
     NOT m_oi_spreadsheet IS INITIAL          AND
         m_view           EQ mc_fc_view_excel.
    CALL METHOD m_oi_spreadsheet->get_selected_areas
      IMPORTING
        areas     = lt_areas
        columnsid = lt_columnids
        rowsid    = lt_rowids.

    DESCRIBE TABLE lt_areas LINES l_zeilen.
    IF l_zeilen EQ 1.
      READ TABLE lt_areas INTO ls_area INDEX 1.
      IF ls_area-rows    EQ 1 AND
         ls_area-columns EQ 1.
        IF es_row_no IS REQUESTED OR
           es_row_id IS REQUESTED.
          READ TABLE lt_rowids INTO ls_rowid WITH KEY id = ls_area-top.

          IF ls_rowid-type EQ 'Row'.
            es_row_no-row_id = 0.
          ELSE.
            es_row_no-row_id = ls_rowid-type.
          ENDIF.

          IF ls_rowid-subtype EQ 'SubRow'.
            es_row_no-sub_row_id = 0.
          ELSE.
            es_row_no-sub_row_id = ls_rowid-subtype.
          ENDIF.

          IF es_row_id IS REQUESTED.
            IF me->is_cache_valid( ) NE abap_true or www_active eq abap_true.

              CALL METHOD cl_gui_cfw=>flush.

            ENDIF.
            IF es_row_no-row_id GT 0 OR
               es_row_no-sub_row_id IS INITIAL.
              es_row_id-index = es_row_no-row_id.
            ELSE.
              READ TABLE mt_poid INTO ls_poid
                    WITH TABLE KEY row_id     = es_row_no-row_id
                                   sub_row_id = es_row_no-sub_row_id.
              IF sy-subrc NE 0.
                MESSAGE x000(0k).
              ENDIF.
              es_row_id-rowtype = ls_poid-rowtype.
              es_row_id-index   = ls_poid-index  .
            ENDIF.
          ENDIF.
        ENDIF.

        IF es_col_id IS REQUESTED.
          READ TABLE lt_columnids INTO ls_columnid
                     WITH KEY id = ls_area-left.
          es_col_id-fieldname = ls_columnid-type.
        ENDIF.
      ENDIF.
    ENDIF.
  ELSE.
    IF es_row_no IS REQUESTED OR es_row_id IS REQUESTED.
      IF me->m_performance EQ 'X' AND
         me->m_roids_sent  EQ space.
        CALL METHOD me->set_row_id
          EXPORTING
            row_id_table = mt_roid.
        me->m_roids_sent = 'X'.
*        IF me->is_cache_valid( ) NE abap_true.

          CALL METHOD cl_gui_cfw=>flush.

*        ENDIF.
      ENDIF.

      CALL METHOD me->get_current_cell_id2
        IMPORTING
          row_id = es_row_no.

      IF es_row_id IS REQUESTED.
        IF me->is_cache_valid( ) NE abap_true or www_active eq abap_true.

          CALL METHOD cl_gui_cfw=>flush.

        ENDIF.

        IF es_row_no-row_id     GT 0 OR
          es_row_no-sub_row_id IS INITIAL.
          es_row_id-index = es_row_no-row_id.
        ELSE.
          READ TABLE mt_poid INTO ls_poid
                     WITH TABLE KEY row_id     = es_row_no-row_id
                                    sub_row_id = es_row_no-sub_row_id.
          IF sy-subrc NE 0.
            MESSAGE x000(0k).
          ENDIF.
          es_row_id-rowtype = ls_poid-rowtype.
          es_row_id-index   = ls_poid-index  .
        ENDIF.
      ENDIF.
    ENDIF.
  ENDIF.

  IF es_col_id IS REQUESTED.
    CALL METHOD me->get_current_cell_col_id
      IMPORTING
        col_id = es_col_id.
  ENDIF.

  IF e_row IS REQUESTED.
    CALL METHOD me->get_current_cell_row
      IMPORTING
        row = e_row.
  ENDIF.

  IF e_col IS REQUESTED.
    CALL METHOD me->get_current_cell_col
      IMPORTING
        col = e_col.
  ENDIF.

  IF e_value IS REQUESTED.
    CALL METHOD me->get_current_cell_text
      IMPORTING
        text = e_value.

  ENDIF.

  IF me->is_cache_valid( ) NE abap_true or www_active eq abap_true.

    CALL METHOD cl_gui_cfw=>flush.


  ENDIF.

ENDMETHOD.                    "get_current_cell


method GET_DROPPED_EXTERNAL_FILES.

DATA RET_VAL  TYPE ABAP_BOOL.

*check if feature is supported...........................
  CALL METHOD CL_GUI_FRONTEND_SERVICES=>CHECK_GUI_SUPPORT
      EXPORTING
        COMPONENT            = 'treeandgrid'
        FEATURE_NAME         = 'getdroppedexternalfiles'
      RECEIVING
        RESULT               = RET_VAL
      EXCEPTIONS
        CNTL_ERROR           = 1
        ERROR_NO_GUI         = 2
        WRONG_PARAMETER      = 3
        NOT_SUPPORTED_BY_GUI = 4
        UNKNOWN_ERROR        = 5
        others               = 6.

    IF SY-SUBRC <> 0 OR RET_VAL NE ABAP_TRUE.
      RAISE NOT_SUPPORTED_BY_GUI.
    ENDIF.

    CALL METHOD get_property
         EXPORTING
              property         = 'DroppedFiles'
         IMPORTING
              value            = FILES_STR
         EXCEPTIONS
              cntl_system_error = 1
              cntl_error        = 2
              OTHERS            = 3.
    IF sy-subrc <> 0.
      RAISE ERROR.
    ENDIF.

    IF row_id IS REQUESTED.
      CALL METHOD get_property
           EXPORTING
                property         = 'DroppedFilesRow'
           IMPORTING
                value            = ROW_ID
           EXCEPTIONS
                cntl_system_error = 1
                cntl_error        = 2
                OTHERS            = 3.

      IF sy-subrc <> 0.
        RAISE ERROR.
      ENDIF.
    ENDIF.

    IF COL_ID IS REQUESTED.
      CALL METHOD get_property
           EXPORTING
                property         = 'DroppedFilesColumn'
           IMPORTING
                value            = COL_ID
           EXCEPTIONS
                cntl_system_error = 1
                cntl_error        = 2
                OTHERS            = 3.

      IF sy-subrc <> 0.
        RAISE ERROR.
      ENDIF.
    ENDIF.

    CALL METHOD CL_GUI_CFW=>FLUSH
      EXCEPTIONS
        CNTL_SYSTEM_ERROR = 1
        CNTL_ERROR        = 2
        others            = 3.
    IF SY-SUBRC <> 0.
      RAISE ERROR.
    ENDIF.

    SPLIT FILES_STR AT CL_ABAP_CHAR_UTILITIES=>NEWLINE INTO TABLE FILES.

endmethod.


method get_filtered_entries.

  et_filtered_entries = m_cl_variant->mt_filter_index.

endmethod.


method get_filter_criteria.

  et_filter = m_cl_variant->mt_filter.

endmethod.


METHOD get_frontend_fieldcatalog.

  FIELD-SYMBOLS: <ls_fcat> TYPE lvc_s_fcat.

  DATA: ls_col_pos_id TYPE lvc_s_coll.

  et_fieldcatalog = m_cl_variant->mt_fieldcatalog.

  CHECK m_invalid_frontend_fieldcat IS INITIAL.
  CHECK m_batch_mode IS INITIAL.                            "Y9BK004132

  CALL METHOD me->get_col_pos_id_base
    IMPORTING
      col_pos_table = mt_col_pos_id_table.

  IF m_dp_on_demand_writable IS INITIAL.
*    IF me->is_cache_valid( ) NE abap_true.

      CALL METHOD cl_gui_cfw=>flush.

*    ENDIF.
  ENDIF.

  LOOP AT et_fieldcatalog ASSIGNING <ls_fcat>.
    IF <ls_fcat>-no_out EQ 'X'.
      READ TABLE mt_col_pos_id_table INTO ls_col_pos_id
        WITH KEY col_id-fieldname = <ls_fcat>-fieldname.
      IF sy-subrc EQ 0.
        <ls_fcat>-no_out    = space.
        <ls_fcat>-col_pos   = ls_col_pos_id-col_pos.
        <ls_fcat>-outputlen = ls_col_pos_id-outputlen.
        IF <ls_fcat>-outputlen EQ 0.
          <ls_fcat>-outputlen = 1.
        ENDIF.
      ENDIF.
    ELSE.
      READ TABLE mt_col_pos_id_table INTO ls_col_pos_id
        WITH KEY col_id-fieldname = <ls_fcat>-fieldname.
      IF sy-subrc NE 0.
        <ls_fcat>-no_out = 'X'.
      ELSE.
        <ls_fcat>-outputlen = ls_col_pos_id-outputlen.
        <ls_fcat>-col_pos   = ls_col_pos_id-col_pos.
        IF <ls_fcat>-outputlen EQ 0.
          <ls_fcat>-outputlen = 1.
        ENDIF.
      ENDIF.
    ENDIF.
  ENDLOOP.

ENDMETHOD.


method get_frontend_layout.

  es_layout = m_cl_variant->ms_layout.

endmethod.


method get_frontend_print .

  es_print = m_cl_variant->ms_print.

endmethod.


method get_grouplevels .

  field-symbols: <tab1> type standard table.

  data: lt_sort type kkblo_t_sortinfo,
        lt_grouplevels type kkblo_t_grouplevels.

  data: lflg_subtotals_only type c.

*... Initialization
  lflg_subtotals_only = 'X'.

*... Check Outtab
  assign mt_outtab->* to <tab1>.
  if not sy-subrc is initial.
    message a534(0k).
  endif.

  check not m_cl_variant->mt_sort[] is initial.

  call function 'LVC_TRANSFER_TO_KKBLO'
       exporting
*           IT_FIELDCAT_LVC           =
            it_sort_lvc               = m_cl_variant->mt_sort
*           IT_FILTER_LVC             =
*           IT_SELECTED_COLS          =
*           IT_SPECIAL_GROUPS_LVC     =
*           it_filter_index_lvc       = mt_filter_index
            it_grouplevels_lvc        = m_cl_variant->mt_grouplevels
       importing
*           ET_FIELDCAT_KKBLO         =
            et_sort_kkblo             = lt_sort
*           ET_FILTER_KKBLO           =
*           ET_SPECIAL_GROUPS_KKBLO   =
*           et_filtered_entries_kkblo =
            et_grouplevels_kkblo      = lt_grouplevels.

  call function 'ALV_GROUPLEVELS_GET'
       exporting
            i_subtotals_only    = lflg_subtotals_only
            it_sort             = lt_sort
            i_subtract_counter  = 'X'
*           it_filtered_entries =
       importing
            et_groups           = lt_grouplevels
       tables
            t_outtab            = <tab1>.

  call function 'LVC_TRANSFER_FROM_KKBLO'
       exporting
*           IT_FIELDCAT_KKBLO         =
*           IT_SORT_KKBLO             =
*           IT_FILTER_KKBLO           =
*           IT_SPECIAL_GROUPS_KKBLO   =
*           IT_FILTERED_ENTRIES_KKBLO =
            it_grouplevels_kkblo      = lt_grouplevels
       importing
*           ET_FIELDCAT_LVC           =
*           ET_SORT_LVC               =
*           ET_FILTER_LVC             =
*           ET_SPECIAL_GROUPS_LVC     =
*           ET_FILTER_INDEX_LVC       =
            et_grouplevels_lvc        = m_cl_variant->mt_grouplevels.

  data: l_sumlevel      type i,
        l_sumlevel_unit type i.

  call function 'LVC_SUMLEVEL_TRANSLATE'
    changing
      ct_sort           = m_cl_variant->mt_sort
      ct_grouplevels    = m_cl_variant->mt_grouplevels
      c_sumlevel_global = l_sumlevel
      c_sumlevel_unit   = l_sumlevel_unit.

endmethod.


method get_internal_fieldcat .

  et_fieldcatalog = m_cl_variant->mt_fieldcatalog.

endmethod.                    "GET_INTERNAL_FIELDCAT


method get_internal_filter .

  et_filter = m_cl_variant->mt_filter.

endmethod.                    "GET_INTERNAL_FILTER


method get_internal_layout .

  es_layout = m_cl_variant->ms_layout.

endmethod.                    "GET_INTERNAL_LAYOUT


method get_internal_sort .

  et_sort = m_cl_variant->mt_sort.

endmethod.                    "GET_INTERNAL_SORT


method get_internal_variant .

  es_variant = m_cl_variant->ms_variant.

endmethod.                    "GET_INTERNAL_VARIANT


method get_other_checkfields.

  field-symbols: <ls_fieldcat> type lvc_s_fcat.

  data: ls_check  type lvc_s_chck,
        ls_fields type lvc_s_flds.

  if not is_fieldcat-checktable is initial and
     not is_fieldcat-checktable = '!'.
    clear ls_check.

    read table et_check with key ref_table = is_fieldcat-ref_table
                        transporting no fields.
    if sy-subrc ne 0.
      loop at m_cl_variant->mt_fieldcatalog assigning <ls_fieldcat>
              where ref_table  = is_fieldcat-ref_table and
                    checktable ne '!'                  and
                    checktable ne space                and
                    inttype ca 'CNDT'.
        ls_fields-fieldname  = <ls_fieldcat>-fieldname.
        ls_fields-ref_field  = <ls_fieldcat>-ref_field.
        ls_fields-checktable = <ls_fieldcat>-checktable.
        append ls_fields to ls_check-t_fields.
      endloop.
      ls_check-ref_table  = is_fieldcat-ref_table.
      append ls_check to et_check.
    endif.
  endif.

endmethod.


method get_row_from_id.

  data: ls_data      type lvc_s_data,
        ls_row_info  type lvc_s_row,
        l_value      type lvc_s_data-value.

  if not is_row_info is initial.
    move is_row_info to l_value.

    read table mt_data into ls_data
               with key col_pos = -1
                        value   = l_value
               transporting row_pos.
    if sy-subrc eq 0.
      e_row = ls_data-row_pos.
    else.
      ls_row_info = is_row_info.

      if ls_row_info-rowtype(1) eq 'S'.
        ls_row_info-rowtype(1) = 'A'.
      elseif ls_row_info-rowtype(1) eq 'A'.
        ls_row_info-rowtype(1) = 'S'.
      endif.

      move ls_row_info to l_value.

      read table mt_data into ls_data
                 with key col_pos = -1
                           value   = l_value
                 transporting row_pos.
      if sy-subrc eq 0.
        e_row = ls_data-row_pos.
      else.
        raise not_found.
      endif.
    endif.
  endif.

endmethod.


METHOD get_scroll_info_via_id.

*... Initialization
  CLEAR: es_row_no,
         es_row_info,
         es_col_info.

  IF me->m_performance EQ 'X' AND
     me->m_roids_sent  EQ space.
    CALL METHOD me->set_row_id
      EXPORTING
        row_id_table = mt_roid.
    me->m_roids_sent = 'X'.
*    IF me->is_cache_valid( ) NE abap_true.

      CALL METHOD cl_gui_cfw=>flush.

*    ENDIF.
  ENDIF.

  IF es_row_info IS REQUESTED.
    CALL METHOD me->get_first_visible_row_id
      IMPORTING
        row_id = es_row_info.
  ENDIF.

  IF es_row_no IS REQUESTED.
    CALL METHOD me->get_first_visible_row_id2
      IMPORTING
        row_id = es_row_no.
  ENDIF.

  IF es_col_info IS REQUESTED.
    CALL METHOD me->get_first_visible_col_id
      IMPORTING
        col_id = es_col_info.
  ENDIF.

ENDMETHOD.                    "get_scroll_info_via_id


method GET_SEARCH_DATA.

*<<< YI2K009535
   if mr_search is bound.
     r_search = mr_search->get_model( ).
   endif.
*>>> YI2K009535

endmethod.


METHOD get_selected_cells .

  if _is_bridge_active( ) = abap_true.
    macro_bridge_call_data.
    macro_bridge_method_name cl_gui_alv_grid get_selected_cells.
    macro_bridge_opt_parameter importing: et_cell et_cell.
    macro_bridge_call.
    exit.
  endif.

  DATA: lt_ceno      TYPE lvc_t_ceno,
        ls_ceno      TYPE lvc_s_ceno,
        lt_cells     TYPE lvc_t_cell,
        ls_cells     TYPE lvc_s_cell,
        ls_cells_old TYPE lvc_s_cell,
        ls_poid      TYPE lvc_s_roro,
        ls_fieldcat  TYPE lvc_s_fcat.

*>>Y6BK072932
DATA: lt_areas      TYPE soi_area_table,
        lt_columnids  TYPE soi_map_table,
        lt_rowids     TYPE soi_map_table,
        ls_area       TYPE soi_area_item,
        ls_rowid      TYPE soi_map_item,
        ls_columnid   TYPE soi_map_item,
        ls_item       TYPE lvc_s_ceno,
        l_rowcount    TYPE i,
        l_columncount TYPE i.

*... Initialization
  CLEAR: et_cell.

  IF NOT m_oi_proxy       IS INITIAL          AND
     NOT m_oi_spreadsheet IS INITIAL          AND
         ( m_view           EQ mc_fc_view_excel
         OR m_view          EQ mc_fc_view_lotus ).
    CALL METHOD m_oi_spreadsheet->get_selected_areas
      IMPORTING
        areas     = lt_areas
        columnsid = lt_columnids
        rowsid    = lt_rowids.

    LOOP AT lt_areas INTO ls_area.
      IF ls_area-index NE 'R' AND
         ls_area-index NE 'C'.
        l_rowcount = ls_area-top.
        DO ls_area-rows TIMES.
          LOOP AT lt_rowids INTO ls_rowid WHERE id EQ l_rowcount.
          ENDLOOP.
          l_columncount = ls_area-left.
          DO ls_area-columns TIMES.
            LOOP AT lt_columnids INTO ls_columnid
                                 WHERE id EQ l_columncount.
            ENDLOOP.
            ls_cells-row_id     = ls_rowid-type.
*            ls_cells-sub_row_id = ls_rowid-subtype.
            ls_cells-col_id     = ls_columnid-type.
            APPEND ls_cells TO et_cell.
            ADD 1 TO l_columncount.
          ENDDO.
          ADD 1 TO l_rowcount.
        ENDDO.
      ENDIF.
    ENDLOOP.
  ELSE.
*<<Y6BK072932
  IF me->m_performance EQ 'X' AND
     me->m_roids_sent  EQ space.
    CALL METHOD me->set_row_id
      EXPORTING
        row_id_table = mt_roid.
    me->m_roids_sent = 'X'.
*    IF me->is_cache_valid( ) NE abap_true.

      CALL METHOD cl_gui_cfw=>flush.

*    ENDIF.
  ENDIF.

  CALL METHOD me->get_selected_cells_base_id2
    IMPORTING
      cell_table = lt_ceno.

  IF me->is_cache_valid( ) NE abap_true or www_active eq abap_true.

    CALL METHOD cl_gui_cfw=>flush.

  ENDIF.

  LOOP AT lt_ceno INTO ls_ceno.
    CLEAR ls_cells_old.
    READ TABLE m_cl_variant->mt_fieldcatalog INTO ls_fieldcat
               WITH KEY col_id = ls_ceno-col_id.
    IF sy-subrc EQ 0.
      ls_cells_old-col_id-fieldname = ls_fieldcat-fieldname.
    ENDIF.
    IF ls_ceno-row_id GT 0.
      ls_cells_old-row_id-index = ls_ceno-row_id.
    ELSE.
      READ TABLE mt_poid INTO ls_poid
                 WITH TABLE KEY row_id     = ls_ceno-row_id
                                sub_row_id = ls_ceno-sub_row_id.
      IF sy-subrc NE 0.
*        raise negative_index.
        MESSAGE x000(0k).
      ENDIF.
      ls_cells_old-row_id-rowtype = ls_poid-rowtype.
      ls_cells_old-row_id-index   = ls_poid-index.
    ENDIF.
    APPEND ls_cells_old TO et_cell.
  ENDLOOP.
  endif.  "Y6BK072932

ENDMETHOD.                    "get_selected_cells


METHOD get_selected_cells_id.

  if _is_bridge_active( ) = abap_true.
    macro_bridge_call_data.
    macro_bridge_method_name cl_gui_alv_grid get_selected_cells_id.
    macro_bridge_opt_parameter importing: et_cells et_cells.
    macro_bridge_call.
    exit.
  endif.

  DATA: lt_areas      TYPE soi_area_table,
        lt_columnids  TYPE soi_map_table,
        lt_rowids     TYPE soi_map_table,
        ls_area       TYPE soi_area_item,
        ls_rowid      TYPE soi_map_item,
        ls_columnid   TYPE soi_map_item,
        ls_item       TYPE lvc_s_ceno,
        l_rowcount    TYPE i,
        l_columncount TYPE i,
*>>> INSERT BRAUNMI PERFORMANCE
        ls_fieldcat   TYPE lvc_s_fcat,
        lt_cells      TYPE lvc_t_cell,
        ls_cell       TYPE lvc_s_cell,
        lt_ceno       TYPE lvc_t_ceno,
        ls_ceno       TYPE lvc_s_ceno,
        ls_poid       TYPE lvc_s_roro.
*<<< INSERT BRAUNMI PERFORMANCE

*... Initialization
  CLEAR: et_cells.

  IF NOT m_oi_proxy       IS INITIAL          AND
     NOT m_oi_spreadsheet IS INITIAL          AND
         ( m_view           EQ mc_fc_view_excel
         OR m_view          EQ mc_fc_view_lotus ).
    CALL METHOD m_oi_spreadsheet->get_selected_areas
      IMPORTING
        areas     = lt_areas
        columnsid = lt_columnids
        rowsid    = lt_rowids.

    LOOP AT lt_areas INTO ls_area.
      IF ls_area-index NE 'R' AND
         ls_area-index NE 'C'.
        l_rowcount = ls_area-top.
        DO ls_area-rows TIMES.
          LOOP AT lt_rowids INTO ls_rowid WHERE id EQ l_rowcount.
          ENDLOOP.
          l_columncount = ls_area-left.
          DO ls_area-columns TIMES.
            LOOP AT lt_columnids INTO ls_columnid
                                 WHERE id EQ l_columncount.
            ENDLOOP.
            ls_item-row_id     = ls_rowid-type.
            ls_item-sub_row_id = ls_rowid-subtype.
            ls_item-col_id     = ls_columnid-subtype.
            APPEND ls_item TO et_cells.
            ADD 1 TO l_columncount.
          ENDDO.
          ADD 1 TO l_rowcount.
        ENDDO.
      ENDIF.
    ENDLOOP.
  ELSE.
    IF me->m_performance EQ 'X' AND
       me->m_roids_sent  EQ space.
      CALL METHOD me->set_row_id
        EXPORTING
          row_id_table = mt_roid.
      me->m_roids_sent = 'X'.
*      IF me->is_cache_valid( ) NE abap_true.

        CALL METHOD cl_gui_cfw=>flush.

*      ENDIF.
    ENDIF.

    CALL METHOD me->get_selected_cells_base_id2
      IMPORTING
        cell_table = et_cells.
  ENDIF.

ENDMETHOD.                    "get_selected_cells_id


METHOD get_selected_columns .

  if _is_bridge_active( ) = abap_true.
    macro_bridge_call_data.
    macro_bridge_method_name cl_gui_alv_grid get_selected_columns.
    macro_bridge_opt_parameter importing: et_index_columns et_index_columns.
    macro_bridge_call.
    exit.
  endif.

  DATA: lt_areas     TYPE soi_area_table,
        l_area       TYPE soi_area_item,
        lt_columnids TYPE soi_map_table,
        l_columnid   TYPE soi_map_item,
        lt_rowids    TYPE soi_map_table,
        l_item       TYPE lvc_s_col.

  DATA: l_help TYPE i.

*----------------------------------------------------
*Webdynpro Conversion Runtime
*----------------------------------------------------
  "private Atribute: mr_alv_model type ref to cl_alv_model
*  if cl_dynp_global_control=>is_wdpmode( ) eq
*     cl_dynp_global_control=>co_conversion_mode.
*    if mr_alv_model is initial.
*      create object mr_alv_model
*             exporting
*                  i_cntl_handle = me->h_control
*                  ir_alv_grid = me.
*    endif.
*    call method mr_alv_model->get_selected_columns
*                     importing
*                        et_index_columns = et_index_columns .
*  endif.
*  if not mr_alv_model is initial.
*    check mr_alv_model->get_wdcomp( ) > 0.
*  endif.
*----------------------------------------------------
*  End of Webdynpro Conversion Runtime
*----------------------------------------------------

*... Initialization
  CLEAR: et_index_columns.

  IF NOT m_oi_proxy       IS INITIAL AND
     NOT m_oi_spreadsheet IS INITIAL AND
     ( m_view           EQ mc_fc_view_excel
     OR m_view          EQ mc_fc_view_lotus ).

    CALL METHOD m_oi_spreadsheet->get_selected_areas
      IMPORTING
        areas     = lt_areas
        columnsid = lt_columnids
        rowsid    = lt_rowids.

    LOOP AT lt_areas INTO l_area.
      IF l_area-index EQ 'C'.
        DO l_area-columns TIMES.
          l_help = sy-index + l_area-left - 1.
          LOOP AT lt_columnids INTO l_columnid
                               WHERE id = l_help.
          ENDLOOP.
          l_item-fieldname = l_columnid-type.
          APPEND l_item TO et_index_columns.
        ENDDO.
      ENDIF.
    ENDLOOP.
  ELSE.
    CALL METHOD me->get_selected_columns_base
      IMPORTING
        col_table = et_index_columns.
  ENDIF.
  IF me->is_cache_valid( ) NE abap_true or www_active eq abap_true.

    CALL METHOD cl_gui_cfw=>flush.

  ENDIF.

ENDMETHOD.


METHOD get_selected_rows .

  if _is_bridge_active( ) = abap_true.
    macro_bridge_call_data.
    macro_bridge_method_name cl_gui_alv_grid get_selected_rows.
    macro_bridge_opt_parameter importing: et_index_rows et_index_rows,
                                          et_row_no     et_row_no.
    macro_bridge_call.
    exit.
  endif.

  DATA: lt_row_no TYPE lvc_t_roid,
        ls_row_no TYPE lvc_s_roid,
        ls_row_id TYPE lvc_s_row,
        ls_poid TYPE lvc_s_roro.

  DATA: lt_areas      TYPE soi_area_table,
        lt_columnids  TYPE soi_map_table,
        lt_rowids     TYPE soi_map_table,
        ls_area       TYPE soi_area_item,
        ls_rowid      TYPE soi_map_item,
        ls_item       TYPE lvc_s_roid,
        wa_row_index TYPE LVC_S_ROID.

  DATA: l_help TYPE i.

*----------------------------------------------------
*Webdynpro Conversion Runtime
*----------------------------------------------------
  "private Atribute: mr_alv_model type ref to cl_alv_model
*  if cl_dynp_global_control=>is_wdpmode( ) eq
*     cl_dynp_global_control=>co_conversion_mode.
*    if mr_alv_model is initial.
*      create object mr_alv_model
*             exporting
*                  i_cntl_handle = me->h_control
*                  ir_alv_grid = me.
*    endif.
*    call method mr_alv_model->get_selected_rows
*                     importing
*                        et_index_rows = et_index_rows .
*  endif.
*  if not mr_alv_model is initial.
*    check mr_alv_model->get_wdcomp( ) > 0.
*  endif.
*----------------------------------------------------
*  End of Webdynpro Conversion Runtime
*----------------------------------------------------

*... Initialization
  CLEAR: et_row_no,
         et_index_rows.

  IF NOT m_oi_proxy       IS INITIAL          AND
     NOT m_oi_spreadsheet IS INITIAL          AND
       ( m_view           EQ mc_fc_view_excel
       OR m_view          EQ mc_fc_view_lotus ).
    CALL METHOD m_oi_spreadsheet->get_selected_areas
      IMPORTING
        areas     = lt_areas
        columnsid = lt_columnids
        rowsid    = lt_rowids.

    data: initial_lines_max type i value 10.        "Y7AK083582
    data: initial_lines_counter type i.

    LOOP AT lt_areas INTO ls_area.
      IF ls_area-index EQ 'R'.
        DO ls_area-rows TIMES.
          l_help = ls_area-top + sy-index - 1.
          LOOP AT lt_rowids INTO ls_rowid WHERE id = l_help.
          ENDLOOP.
          if ls_rowid-type is not initial.          "Y7AK083582
            ls_item-row_id     = ls_rowid-type.
            ls_item-sub_row_id = ls_rowid-subtype.
            APPEND ls_item TO et_row_no.
          else.
            add 1 to initial_lines_counter.
            if initial_lines_counter > initial_lines_max.
              exit.
            endif.
          endif.                                    "Y7AK083582
        ENDDO.
      ENDIF.
    ENDLOOP.
    IF et_index_rows IS REQUESTED.                          "B20K8A113Q
      CALL METHOD me->map_roid_to_row
        EXPORTING
          it_row_no     = et_row_no
        IMPORTING
          et_index_rows = et_index_rows.
    ENDIF.
  ELSE.
    IF me->m_performance EQ 'X' AND
       me->m_roids_sent  EQ space.
      CALL METHOD me->set_row_id
        EXPORTING
          row_id_table = mt_roid.
      me->m_roids_sent = 'X'.
      IF me->is_cache_valid( ) NE abap_true.

        CALL METHOD cl_gui_cfw=>flush.

      ENDIF.
    ENDIF.

    CALL METHOD me->get_selected_rows_id_base
      IMPORTING
        row_table = et_row_no.

    IF et_index_rows IS REQUESTED.
      IF me->is_cache_valid( ) NE abap_true or www_active eq abap_true.

        CALL METHOD cl_gui_cfw=>flush.

      ENDIF.

      CALL METHOD me->map_roid_to_row
        EXPORTING
          it_row_no     = et_row_no
        IMPORTING
          et_index_rows = et_index_rows.
    ENDIF.
  ENDIF.
  IF me->is_cache_valid( ) NE abap_true or www_active eq abap_true.

    CALL METHOD cl_gui_cfw=>flush.

  ENDIF.

ENDMETHOD.                    "get_selected_rows


method get_sort_criteria.

  et_sort = m_cl_variant->mt_sort.

endmethod.


method get_subtotals.

  ep_collect00 = mt_ct00.
  ep_collect01 = mt_ct01.
  ep_collect02 = mt_ct02.
  ep_collect03 = mt_ct03.
  ep_collect04 = mt_ct04.
  ep_collect05 = mt_ct05.
  ep_collect06 = mt_ct06.
  ep_collect07 = mt_ct07.
  ep_collect08 = mt_ct08.
  ep_collect09 = mt_ct09.

  et_grouplevels[] = m_cl_variant->mt_grouplevels_filter.

endmethod.


method get_totals .
* not in use while import/export from memory has to be used for
* saving the internal tables. Therfore the function module
* LVC_TOTALS_GET is used.
* ...
endmethod.


method get_unvalidated_data.
*---------------------------------------------------------------------*
*       METHOD GET_UNVALIDATED_DATA                                   *
*---------------------------------------------------------------------*
*       ........                                                      *
*---------------------------------------------------------------------*
* ... data are changed directly without validation

  data: is_cells type lvc_s_pos,
        is_style_cells type lvc_s_modi,
        lp_wa type ref to data,
        lp_wa1 type ref to data,
        value type string,
        ls_msg type lvc_s_msg1,
        i_tabix like sy-tabix.

  field-symbols: <tab> type standard table,
                 <ls_wa> type any,
                 <ls_comp1> type any,
                 <ls_comp> type any,
                 <ls_cell> type any.

  assign mt_outtab->* to <tab>.
  create data lp_wa like line of <tab>.
  create data lp_wa1 like line of <tab>.
  assign lp_wa->* to <ls_wa>.
  assign lp_wa1->* to <ls_comp1>.

  loop at it_cells into is_cells.
    unassign <ls_comp>.
    read table <tab> index is_cells-row_id assigning <ls_wa>.
    assign component is_cells-fieldname of structure <ls_wa> to
<ls_comp>.
    value = <ls_comp>.
    is_style_cells-value = value.
    is_style_cells-row_id = is_cells-row_id.
    is_style_cells-fieldname = is_cells-fieldname.
    i_tabix = sy-tabix.
    is_style_cells-tabix = i_tabix.
    append is_style_cells to et_cells.
  endloop.

  loop at it_style_cells into is_style_cells.

    add 1 to i_tabix.
    is_style_cells-tabix = i_tabix.
    append is_style_cells to et_cells.

    unassign <ls_comp>.

    read table <tab> index is_style_cells-row_id assigning <ls_wa>.
    <ls_comp1> = <ls_wa>.
    assign component is_style_cells-fieldname of structure
<ls_wa> to <ls_comp>.
    assign is_style_cells-value to <ls_cell>.
    <ls_comp> = <ls_cell>.

  endloop.



endmethod.                    "GET_UNVALIDATED_DATA


method get_variant.

  es_variant = m_cl_variant->ms_variant.

  e_save = m_cl_variant->m_variant_save.

endmethod.


method id_in_position.
* ...
*  data: ls_idpo type lvc_s_idpo.
*  data: ls_row_id type lvc_s_row.
*
*  read table mt_idpo into ls_idpo
*                     with table key row_id = is_row_id.
*  if sy-subrc = 0.
*    e_position = ls_idpo-position.
*  else.
*    ls_row_id = is_row_id.
*    if ls_row_id-rowtype(1) = 'S'.
*      ls_row_id-rowtype(1) = 'A'.
*    elseif ls_row_id-rowtype(1) = 'A'.
*      ls_row_id-rowtype(1) = 'S'.
*    endif.
*    read table mt_idpo into ls_idpo
*                     with table key row_id = is_row_id.
*    if sy-subrc = 0.
*      e_position = ls_idpo-position.
*    ELSE.
*      RAISE NOT_FOUND.
*    ENDIF.
*  endif.
endmethod.


method if_dragdrop~ondrag.

  data : l_key type cndd_propvalue.
  data : ls_row_no type lvc_s_roid.
  data : l_col_id type i.
  data : ls_row type lvc_s_row.
  data : ls_col type lvc_s_col.
* Get drag source properties of list control. The number of properties
* and the names are control specific and have to be used by the
* control encapsulation to get the parameters for the drag event.
* In this demo there is only 1 property which is the key of the item
  call method properties->get_prop
                       exporting
                          propname = 'RowID'
                       changing
                          propvalue = l_key.
  ls_row = l_key.
  clear l_key.

  call method properties->get_prop
                       exporting
                          propname = 'ColumnID'
                       changing
                          propvalue = l_key.

  ls_col = l_key.
*
  clear l_key.
  call method properties->get_prop
                       exporting
                          propname = 'RowIDNum'
                       changing
                          propvalue = l_key.
  ls_row_no-row_id = l_key.
*
  clear l_key.
  call method properties->get_prop
                       exporting
                          propname = 'RowIDNumSub'
                       changing
                          propvalue = l_key.
  ls_row_no-sub_row_id = l_key.
* Raise ondrag event with key as parameter. The application has to
* provide an object that either describes the item with KEY key or
* the object that is represented by key itself. The application
* assigns this object to the attribute DRAGDROPOBJ->OBJECT. Therefore
* always pass the parameter DRAGDROPOBJECT to the application.
*... Trace?
  if not mr_trace is initial.
    call method mr_trace->add_trace_item
      exporting
        i_trace_item = 'EVENT: ONDRAG'
        ir_variant   = m_cl_variant
        it_data      = mt_data
        it_info      = mt_info.
  endif.
  raise event ondrag
              exporting e_row = ls_row
                        e_column = ls_col
                        es_row_no = ls_row_no
                        e_dragdropobj = dragdropobject.
endmethod.


method if_dragdrop~ondrop.


  data : l_key type cndd_propvalue.
  data : ls_row type lvc_s_row.
  data : ls_col type lvc_s_col.
  data : ls_row_no type lvc_s_roid.
  data : l_col_id type i.

  call method properties->get_prop
                       exporting
                          propname = 'RowID'
                       changing
                          propvalue = l_key.
  ls_row = l_key.
  clear l_key.

  call method properties->get_prop
                       exporting
                          propname = 'ColumnID'
                       changing
                          propvalue = l_key.

  ls_col = l_key.
*
  clear l_key.
  call method properties->get_prop
                       exporting
                          propname = 'RowIDNum'
                       changing
                          propvalue = l_key.
  ls_row_no-row_id = l_key.
*
  clear l_key.
  call method properties->get_prop
                       exporting
                          propname = 'RowIDNumSub'
                       changing
                          propvalue = l_key.
  ls_row_no-sub_row_id = l_key.

*... Trace?
  if not mr_trace is initial.
    call method mr_trace->add_trace_item
      exporting
        i_trace_item = 'EVENT: ONDROP'
        ir_variant   = m_cl_variant
        it_data      = mt_data
        it_info      = mt_info.
  endif.
  raise event ondrop
              exporting e_row = ls_row
                        e_column = ls_col
                        es_row_no = ls_row_no
                        e_dragdropobj = dragdropobject.
endmethod.


method if_dragdrop~ondropcomplete.

  data : l_key type cndd_propvalue.
  data : ls_row type lvc_s_row.
  data : ls_col type lvc_s_col.
  data : ls_row_no type lvc_s_roid.
  data : l_col_id type i.
* Get drag source properties of list control. The number of properties
* and the names are control specific and have to be used by the
* control encapsulation to get the parameters for the drag event.
* In this demo there is only 1 property which is the key of the item
  call method properties->get_prop
                       exporting
                          propname = 'RowID'
                       changing
                          propvalue = l_key.
  ls_row = l_key.
  clear l_key.

  call method properties->get_prop
                       exporting
                          propname = 'ColumnID'
                       changing
                          propvalue = l_key.

  ls_col = l_key.
*
  clear l_key.
  call method properties->get_prop
                       exporting
                          propname = 'RowIDNum'
                       changing
                          propvalue = l_key.
  ls_row_no-row_id = l_key.
*
  clear l_key.
  call method properties->get_prop
                       exporting
                          propname = 'RowIDNumSub'
                       changing
                          propvalue = l_key.
  ls_row_no-sub_row_id = l_key.
* Raise ondrag event with key as parameter. The application has to
* provide an object that either describes the item with KEY key or
* the object that is represented by key itself. The application
* assigns this object to the attribute DRAGDROPOBJ->OBJECT. Therefore
* always pass the parameter DRAGDROPOBJECT to the application.
*... Trace?
  if not mr_trace is initial.
    call method mr_trace->add_trace_item
      exporting
        i_trace_item = 'EVENT: ONDROPCOMPLETE'
        ir_variant   = m_cl_variant
        it_data      = mt_data
        it_info      = mt_info.
  endif.
  raise event ondropcomplete
              exporting e_row = ls_row
                        e_column = ls_col
                        es_row_no = ls_row_no
                        e_dragdropobj = dragdropobject.

endmethod.


method if_dragdrop~ongetflavor.


  data : l_key type cndd_propvalue.
  data : ls_row type lvc_s_row.
  data : ls_col type lvc_s_col.
  data : ls_row_no type lvc_s_roid.
  data : l_col_id type i.
*
  call method properties->get_prop
                       exporting
                          propname = 'RowID'
                       changing
                          propvalue = l_key.
  ls_row = l_key.
*
  clear l_key.
  call method properties->get_prop
                       exporting
                          propname = 'ColumnID'
                       changing
                          propvalue = l_key.

  ls_col = l_key.
*
  clear l_key.
  call method properties->get_prop
                       exporting
                          propname = 'RowIDNum'
                       changing
                          propvalue = l_key.
  ls_row_no-row_id = l_key.
*
  clear l_key.
  call method properties->get_prop
                       exporting
                          propname = 'RowIDNumSub'
                       changing
                          propvalue = l_key.
  ls_row_no-sub_row_id = l_key.
*
*... Trace?
  if not mr_trace is initial.
    call method mr_trace->add_trace_item
      exporting
        i_trace_item = 'EVENT: ONDROPGETFLAVOR'
        ir_variant   = m_cl_variant
        it_data      = mt_data
        it_info      = mt_info.
  endif.
  raise event ondropgetflavor
              exporting e_row = ls_row
                        e_column = ls_col
                        es_row_no = ls_row_no
                        e_dragdropobj = dragdropobject
                        e_flavors      = flavors.

endmethod.


method init_context_menu .

  data: ls_toolbar_excluding type ui_func,
        l_text               type gui_text,
        l_off                type char1.

*... Toolbar is not to be displayed and therefore none of its
*    funtionality in the context menu
  read table it_toolbar_excluding with key table_line = mc_fc_excl_all
             transporting no fields.
  if sy-subrc eq 0.
    l_off = 'X'.
  endif.

*...No_toolbar set -> no functionality in the context menu
*... is not a reliable criteria, simple case of new API is wrong!!!!!
*  if m_cl_variant->ms_layout-no_toolbar is not initial.
*    l_off = 'X'.
*  endif.

  create object m_cl_context_menu.

  read table it_toolbar_excluding into ls_toolbar_excluding
               with key table_line = mc_fc_loc_cut.
    if sy-subrc ne 0.
      l_text = text-046.
      call method m_cl_context_menu->add_function
        exporting
          fcode = mc_fc_loc_cut
          text  = l_text.             "Cut
    endif.

  read table it_toolbar_excluding into ls_toolbar_excluding
             with key table_line = mc_fc_loc_copy.
  if sy-subrc ne 0.
    l_text = text-045.
    call method m_cl_context_menu->add_function
      exporting
        fcode = mc_fc_loc_copy
        text  = l_text. "Copy
  endif.

  read table it_toolbar_excluding into ls_toolbar_excluding
               with key table_line = mc_fc_loc_paste.
    if sy-subrc ne 0.
      l_text = text-047.
      call method m_cl_context_menu->add_function
        exporting
          fcode = mc_fc_loc_paste
          text  = l_text. "Paste
  endif.

  call method m_cl_context_menu->add_separator.

*...Detail aus dem Context_Menu herausnehmen
  if l_off eq space.
    read table it_toolbar_excluding into ls_toolbar_excluding
             with key table_line = mc_fc_detail.
    if sy-subrc ne 0.
      l_text = text-037.
      call method m_cl_context_menu->add_function
        exporting
          fcode = mc_fc_detail
          text  = l_text. "Details
      call method m_cl_context_menu->add_separator.
    endif.
  endif.

*...Ausblenden aus dem Context_Menu herausnehmen
  read table it_toolbar_excluding into ls_toolbar_excluding
           with key table_line = mc_fc_col_invisible.
  if sy-subrc ne 0.
    l_text = text-005.
    call method m_cl_context_menu->add_function
      exporting
        fcode = mc_fc_col_invisible
        text  = l_text. "'Ausblenden
  endif.

*...Einblenden aus dem Context_Menu herausnehmen
  read table it_toolbar_excluding into ls_toolbar_excluding
           with key table_line = mc_fc_current_variant.
  if sy-subrc ne 0.
    l_text = text-003.
    call method m_cl_context_menu->add_function
      exporting
        fcode = mc_fc_current_variant
        text  = l_text. "Einblenden
  endif.

*...Optimale Breite aus dem Context_Menu herausnehmen
  read table it_toolbar_excluding into ls_toolbar_excluding
           with key table_line = mc_fc_col_optimize.
  if sy-subrc ne 0.
    l_text = text-006.
    call method m_cl_context_menu->add_function
      exporting
        fcode = mc_fc_col_optimize
        text  = l_text. "Optimale Breite
  endif.

*...Fix aus dem Context_Menu herausnehmen
  read table it_toolbar_excluding into ls_toolbar_excluding
           with key table_line = mc_fc_fix_columns.
  if sy-subrc ne 0.
    l_text = text-041.
    call method m_cl_context_menu->add_function
      exporting
        fcode = mc_fc_fix_columns
        text  = l_text. "fix
*...Unfix aus dem Context_Menu herausnehmen
    read table it_toolbar_excluding into ls_toolbar_excluding
               with key table_line = mc_fc_unfix_columns.
    if sy-subrc ne 0.
      l_text = text-042.
      call method m_cl_context_menu->add_function
        exporting
          fcode = mc_fc_unfix_columns
          text  = l_text. "unfix
    endif.
  endif.

  check l_off eq space.

  call method m_cl_context_menu->add_separator.

*...Sort/asc/dsc aus dem Context_Menu herausnehmen
  read table it_toolbar_excluding into ls_toolbar_excluding
           with key table_line = mc_fg_sort.
  if sy-subrc ne 0.
    read table it_toolbar_excluding into ls_toolbar_excluding
               with key table_line = mc_fc_sort_asc.
    if sy-subrc ne 0.
      l_text = text-021.
      call method m_cl_context_menu->add_function
        exporting
          fcode = mc_fc_sort_asc
          text  = l_text. "Aufsteigend sortieren
    endif.

    read table it_toolbar_excluding into ls_toolbar_excluding
               with key table_line = mc_fc_sort_dsc.
    if sy-subrc ne 0.
      l_text = text-022.
      call method m_cl_context_menu->add_function
        exporting
          fcode = mc_fc_sort_dsc
          text  = l_text. "Absteigend sortieren
    endif.
  endif.

*...Find aus dem Context_Menu herausnehmen
  read table it_toolbar_excluding into ls_toolbar_excluding
             with key table_line = mc_fc_find.
  if sy-subrc ne 0.
    l_text = text-036.
    call method m_cl_context_menu->add_function
      exporting
        fcode = mc_fc_find
        text  = l_text. "Suchen
    l_text = text-071.
    call method m_cl_context_menu->add_function
      exporting
        fcode    = mc_fc_find_more
        text     = l_text  "Find Next
        disabled = abap_true.
  endif.

*...Filter aus dem Context_Menu herausnehmen
  loop at it_toolbar_excluding into ls_toolbar_excluding
          where table_line = mc_mb_filter
             or table_line = mc_fc_filter.
  endloop.
  if sy-subrc ne 0.
    l_text = text-008.
    call method m_cl_context_menu->add_function
      exporting
        fcode = mc_fc_filter
        text  = l_text. "Filter
  endif.

  call method m_cl_context_menu->add_separator.

*...Summe aus dem Context_Menu herausnehmen
  loop at it_toolbar_excluding into ls_toolbar_excluding
          where table_line = mc_mb_sum
             or table_line = mc_fc_sum.
  endloop.
  if sy-subrc ne 0.
    l_text = text-023.
    call method m_cl_context_menu->add_function
      exporting
        fcode = mc_fc_sum
        text  = l_text. "Summe

*...Zwischensumme aus dem Context_Menu herausnehmen
    loop at it_toolbar_excluding into ls_toolbar_excluding
            where table_line = mc_mb_subtot
               or table_line = mc_fc_subtot.
    endloop.
    if sy-subrc ne 0.
      l_text = text-024.
      call method m_cl_context_menu->add_function
        exporting
          fcode = mc_fc_subtot
          text  = l_text. "Zwischensumme
    endif.
  endif.

*...XXL aus dem Context_Menu herausnehmen  Y7AK044553
  loop at it_toolbar_excluding into ls_toolbar_excluding
          where table_line = mc_fc_call_xxl.
  endloop.
  if sy-subrc ne 0.
    l_text = text-034.
    call method m_cl_context_menu->add_function
      exporting
        fcode = mc_fc_call_xxl
        text  = l_text. "Tabellenkalkulation
  endif.

*<<< YI3K135475 RAL protocolling design time: YI3K200062: commented because of application interference....
*  data: l_field type  sral_alv_recorder_field,
*        l_enabled type abap_bool,
*        l_prot_name type sral_recording_name,
*        lr_recorder_instance type ref to if_sral_recorder_alv,
*        lcl_context_menu type ref to cl_ctmenu.       "YI3K151379
*
*
** is RAL designtime active?
*  try.
*   CL_SRAL_RECORDER_FACTORY_ALV=>is_recorder_enabled( importing e_is_enabled    = l_enabled
*                                                                e_recording_name = l_prot_name ).
*     catch cx_sral.
*  endtry.
*
** add context menu 'RECORD' in case of RAL design time
*  if l_enabled eq abap_true.
*
*    call method m_cl_context_menu->add_separator.
*
** build submenu of RAL: YI3K151379
*
*    create object lcl_context_menu.
*
*    l_text = text-174.
*    call method lcl_context_menu->add_function
*      exporting
*        fcode = mc_fc_record
*        text  = l_text.
*
*    l_text = text-175.
*    call method lcl_context_menu->add_function
*      exporting
*        fcode = MC_FC_REC_DEL
*        text  = l_text.
*
*
*    l_text = text-170.
*    call method m_cl_context_menu->add_submenu
*      exporting
*            menu  = lcl_context_menu
*            text  = l_text.
*  endif.
*>>> YI3K135475

endmethod.                    "init_context_menu


method init_toolbar .

  data: ls_toolbar           type stb_button,
        ls_toolbar_excluding type ui_func,
        l_disabled           type cua_active,
        l_lin                type i,
        l_fccls              type c.

*... init toolbar
  clear m_init_toolbar.
  mt_excluding_toolbar = it_toolbar_excluding.

*... Menus anlegen
  call method me->toolbar_menus_create.

  check m_cl_variant->ms_layout-no_toolbar eq space.

  if _is_bridge_active( ) = abap_false.
    call method me->toolbar_build.
  endif.

endmethod.


method is_ready_for_input.

*... (1) Trace?
  if not mr_trace is initial.
    call method mr_trace->add_trace_item
      exporting
        i_trace_item = 'IS_READY_FOR_INPUT'
        ir_variant   = m_cl_variant
        it_data      = mt_data
        it_info      = mt_info.
  endif.

  field-symbols: <tab1> type standard table.
  field-symbols: <ls_wa> type any.
  field-symbols: <l_field> type lvc_t_styl.

  data: lp_wa type ref to data.
  data: lt_style type lvc_t_styl.
  data: ls_style type lvc_s_styl.
  data: ls_fieldcat type lvc_s_fcat.

*Hinweis 320712
  if not ( offline( ) is initial ) .
    ready_for_input = 0.
    exit.
  endif.
*Ende Hinweis 320712

  if m_edit_global eq '1'.
    ready_for_input = 1.
  elseif m_edit_global eq '0'.
    ready_for_input = 0.
  elseif m_edit eq 'X'.
    ready_for_input = 1.
  else.
    ready_for_input = 0.
  endif.

  check ready_for_input eq 1.

  if not i_row_id is initial and
     not is_col_id is initial and
     not m_cl_variant->ms_layout-stylefname is initial.
*... Prüfen ob Grid auf ZELLENEBENE eingabebereit
    assign mt_outtab->* to <tab1>.
    if not sy-subrc is initial.
      message a534(0k).
    endif.

    create data lp_wa like line of <tab1>.
    assign lp_wa->* to <ls_wa>.

    read table <tab1> into <ls_wa> index i_row_id.
    assign component m_cl_variant->ms_layout-stylefname
           of structure <ls_wa> to <l_field>.
    read table <l_field> into ls_style
            with table key fieldname = is_col_id-fieldname.
    if sy-subrc eq 0.
      if ls_style-style o mc_style_enabled.
        ready_for_input = 1.
        exit.
      elseif ls_style-style o mc_style_disabled.
        ready_for_input = 0.
        exit.
      endif.
    else.
      read table <l_field> into ls_style
           with table key fieldname = space.
      if sy-subrc eq 0.
        if ls_style-style o mc_style_enabled.
          ready_for_input = 1.
          exit.
        elseif ls_style-style o mc_style_disabled.
          ready_for_input = 0.
          exit.
        endif.
      else.
        if m_cl_variant->ms_layout-edit eq 'X'.
          ready_for_input = 1.
          exit.
        endif.
      endif.
    endif.
  endif.

* Dieser Teil kann nur durchlaufen werden, wenn Eingabebereitschaft
* nicht auf Zellenebene gesteuert (sonst wird Methode durch EXIT
* verlassen)

  if m_cl_variant->ms_layout-edit = 'X'.
    ready_for_input = '1'.
    exit.
  endif.

  if not i_row_id is initial and
     not is_col_id is initial.
*... Prüfen ob Grid auf Spaltenebene eingabebereit
    read table m_cl_variant->mt_fieldcatalog
            into ls_fieldcat
            with key fieldname = is_col_id-fieldname.
    if sy-subrc eq 0.
      if ls_fieldcat-edit = 'X'.
        ready_for_input = 1.
        exit.
      else.
        ready_for_input = 0.
        exit.
      endif.
    endif.
  endif.

endmethod.


method layout_administration.

  call method me->m_cl_variant->layout_administration.

endmethod.


method layout_colwidth_optimize.

  field-symbols: <ls_fcat> type lvc_s_fcat.

  data: ls_col  type lvc_s_col.

*... optimize all columns in catalog
  if m_cl_variant->ms_layout-cwidth_opt eq 'X' or
     m_cl_variant->ms_layout-cwidth_opt eq 'A'.
    call method me->optimize_columns
                exporting i_all_columns = 'X'.
    if m_cl_variant->ms_layout-cwidth_opt eq 'X'.
      m_cl_variant->ms_layout-cwidth_opt = '1'.
    endif.
  endif.

* ... optimize only columns described in field catalog
  if m_cl_variant->ms_layout-cwidth_opt eq 'O'.
    loop at m_cl_variant->mt_fieldcatalog assigning <ls_fcat>
            where ( col_opt eq 'X' or
                    col_opt eq 'A' ) and
                  ( no_out eq space and tech eq space ).
*      call method me->optimize_col
*           exporting include_header = 1
*                     col            = <ls_fcat>-col_pos.
      ls_col-fieldname = <ls_fcat>-fieldname.
      call method me->optimize_col_id
           exporting include_header = 1
                     col_id         = ls_col.
      if <ls_fcat>-col_opt eq 'X'.
        <ls_fcat>-col_opt = '1'.
      endif.
    endloop.
  endif.

endmethod.


method list_processing_events .
*---------------------------------------------------------------------*
*  METHOD list_processing_events
*---------------------------------------------------------------------*
*
*---------------------------------------------------------------------*

  data: l_event_data type ref to cl_alv_event_data.

  case i_event_name.
    when 'TOP_OF_LIST'.
      if m_cl_variant is initial.
        raise event print_top_of_list.
      else.
        if m_cl_variant->ms_print-prnt_title is initial
        or m_cl_variant->ms_print-prnt_title = '0'.
*      IF MS_PRINT_INFO-PRNT_TITLE IS INITIAL
*      OR MS_PRINT_INFO-PRNT_TITLE = '0'.
          write / m_cl_variant->ms_layout-grid_title.
        endif.
        raise event print_top_of_list.
        if m_cl_variant->ms_print-prnt_title = '1'.
          write / m_cl_variant->ms_layout-grid_title.
*      IF MS_PRINT_INFO-PRNT_TITLE = '1'.
*        WRITE / MS_LAYOUT-GRID_TITLE.
        endif.
      endif.

    when 'TOP_OF_PAGE'.
      if m_cl_variant is initial.
        if not i_dyndoc_id is initial.
          raise event top_of_page
            exporting
              table_index = i_table_index
              e_dyndoc_id = i_dyndoc_id.
        else.
          raise event print_top_of_page
            exporting
              table_index = i_table_index.
        endif.
      else.
        if m_cl_variant->ms_print-prnt_title = '2'.
*    IF MS_PRINT_INFO-PRNT_TITLE = '2'.
          write / m_cl_variant->ms_layout-grid_title.
        endif.
        if not i_dyndoc_id is initial.
          raise event top_of_page
            exporting
              table_index = i_table_index
              e_dyndoc_id = i_dyndoc_id.
        else.
          raise event print_top_of_page
            exporting
              table_index = i_table_index.
        endif.
        if m_cl_variant->ms_print-prnt_title = '3'.
          write / m_cl_variant->ms_layout-grid_title.
*     IF MS_PRINT_INFO-PRNT_TITLE = '3'.
*        WRITE / MS_LAYOUT-GRID_TITLE.

        endif.
      endif.

    when 'END_OF_PAGE'.
      raise event print_end_of_page.

    when 'END_OF_LIST'.
      if not i_dyndoc_id is initial.
        raise event end_of_list exporting e_dyndoc_id = i_dyndoc_id.
      else.
        raise event print_end_of_list.
      endif.

    when 'SUBTOTAL_TEXT'.
      create object l_event_data.
      get reference of c_subtottxt into l_event_data->m_data.

      raise event subtotal_text
                  exporting es_subtottxt_info = is_subtottxt_info
                            e_event_data      = l_event_data
                            ep_subtot_line    = ip_subtot_line.
  endcase.

endmethod.                    "list_processing_events


method lvc_table_fill.

  field-symbols: <tab1> type standard table,
                 <lt_ct00> type standard table,
                 <lt_ct01> type standard table,
                 <lt_ct02> type standard table,
                 <lt_ct03> type standard table,
                 <lt_ct04> type standard table,
                 <lt_ct05> type standard table,
                 <lt_ct06> type standard table,
                 <lt_ct07> type standard table,
                 <lt_ct08> type standard table,
                 <lt_ct09> type standard table.

  data: l_view type ui_func.
  if m_next_view is initial.
    l_view = m_view.
  else.
    l_view = m_next_view.
  endif.

 try.
    assign mt_outtab->* to <tab1>.
    catch CX_SY_RMC_COMM_FAILURE.    "Y1AK061396
  endtry.
*  if not sy-subrc is initial.
**    message a534(0k).
*    raise system-exceptions rmc_communication_failure.
*  endif.

  if me->m_memory eq 'X'.
    assign mt_ct00->* to <lt_ct00>.
    assign mt_ct01->* to <lt_ct01>.
    assign mt_ct02->* to <lt_ct02>.
    assign mt_ct03->* to <lt_ct03>.
    assign mt_ct04->* to <lt_ct04>.
    assign mt_ct05->* to <lt_ct05>.
    assign mt_ct06->* to <lt_ct06>.
    assign mt_ct07->* to <lt_ct07>.
    assign mt_ct08->* to <lt_ct08>.
    assign mt_ct09->* to <lt_ct09>.

    call function 'LVC_FILL_DATA_TABLE'
      exporting
        i_view            = l_view
        i_gui_type        = m_gui_type
        i_grid            = me
        is_layout         = m_cl_variant->ms_layout
        i_start_index     = firstline
        i_end_index       = lastline
        is_layout_local   = ms_layout_local
        is_total_options  = m_cl_variant->ms_total_options
        it_except_qinfo   = mt_except_qinfo
        it_fieldcat       = m_cl_variant->mt_fieldcatalog
        it_fieldcat_local = mt_fieldcat_local
        it_roid           = mt_roid
        it_poid           = mt_poid
        it_fidx           = m_cl_variant->mt_filter_index
        it_grouplevels    = m_cl_variant->mt_grouplevels_filter
        ir_salv_adapter   = r_salv_adapter
        i_delete_entries_not_in_range = delete_entries_not_in_range
      tables
        it_data           = <tab1>
        it_collect00      = <lt_ct00>
        it_collect01      = <lt_ct01>
        it_collect02      = <lt_ct02>
        it_collect03      = <lt_ct03>
        it_collect04      = <lt_ct04>
        it_collect05      = <lt_ct05>
        it_collect06      = <lt_ct06>
        it_collect07      = <lt_ct07>
        it_collect08      = <lt_ct08>
        it_collect09      = <lt_ct09>
      changing
        ct_start_index    = mt_start_index
        ct_lvc_data       = mt_data[].
  else.
    call function 'LVC_TABLE_FOR_DISPLAY_FILL'
      exporting
        i_view            = l_view
        i_gui_type        = m_gui_type                      "#EC *
        i_grid            = me
        is_layout         = m_cl_variant->ms_layout
        i_start_index     = firstline
        i_end_index       = lastline
        is_layout_local   = ms_layout_local
        it_except_qinfo   = mt_except_qinfo
        ir_salv_adapter   = r_salv_adapter
      tables
        it_data           = <tab1>
      changing
        ct_fieldcat_local = mt_fieldcat_local
        ct_lvc_data       = mt_data[]
        ct_start_index    = mt_start_index.
  endif.

  add_bidi_flags( ).

endmethod.                    "lvc_table_fill


method maintain_all_variants .

  call method m_cl_variant->set_header_transport
                                       exporting i_header_transport
                                                = m_header_transport.
*<<< Y7AK114455
  data: l_offl type INT4.   "specific for grids without own container (fullscreen mode)
  clear l_offl.
  l_offl = offline( ).
  if l_offl is initial.
    call method set_visible
        exporting
          visible = cl_gui_control=>visible_false.
  endif.
*>>> Y7AK114455

  if m_cl_variant is initial.
    create object m_cl_variant
           exporting
             it_outtab             = mt_outtab
             it_fieldcatalog       = m_cl_variant->mt_fieldcatalog
             it_sort               = m_cl_variant->mt_sort
             it_filter             = m_cl_variant->mt_filter
             it_grouplevels_filter = m_cl_variant->mt_grouplevels_filter
             is_variant            = m_cl_variant->ms_variant
             i_variant_save        = m_cl_variant->m_variant_save
             i_variant_default     = m_cl_variant->m_variant_default
             is_layout             = m_cl_variant->ms_layout
             i_www_active          = m_www
             is_print              = m_cl_variant->ms_print
             ir_salv_adapter       = me->r_salv_adapter
             i_fcat_complete       = m_fcat_complete.
  else.
    call method m_cl_variant->set_values
         exporting
             it_outtab             = mt_outtab
             i_www_active          = m_www.
  endif.

  call method m_cl_variant->maintain_all_variants
       exporting i_variant_default = m_cl_variant->m_variant_default.

*<<< Y7AK114455
 if l_offl is initial.
  call method set_visible
      exporting
        visible = cl_gui_control=>visible_true.
  endif.
*>>> Y7AK114455

endmethod.


method maintain_variant .

  data: lt_fieldcat_slis type slis_t_fieldcat_alv,
        lt_selected_cols type lvc_t_col,
        ls_stable        type lvc_s_stbl,
        lt_fieldcat      type lvc_t_fcat,
        l_flg_type       type c value 'V',
        ls_new_view      type ui_func,
        ls_bds_with_url  type lvc_s_bds,
        ls_dtc_layout    type dtc_s_layo.

  field-symbols:
    <tab1>         type standard table.

*... Check Outtab
  assign mt_outtab->* to <tab1>.
  if not sy-subrc is initial.
    message a534(0k).
  endif.

*... Check if Fullscreen
  if me->_fullscreen_mode eq abap_true.
    data: lr_grid           type ref to cl_gui_alv_grid,
          lt_excluding_slis type slis_t_extab,
          lt_excluding_lvc  type ui_functions.

    call function 'GET_GLOBALS_FROM_SLVC_FULLSCR'
      importing
        et_excluding = lt_excluding_slis
        e_grid       = lr_grid.
    if lt_excluding_slis is not initial.
      call method transfer_fcode_slis_to_lvc
        exporting
          it_fcodes_slis = lt_excluding_slis
        importing
          et_fcodes_lvc  = lt_excluding_lvc.
      delete adjacent duplicates from lt_excluding_lvc.
    endif.
  endif.

  call method get_selected_columns
    importing
      et_index_columns = lt_selected_cols.

  if m_cl_variant is initial.
    create object m_cl_variant
         exporting
           it_outtab             = mt_outtab
           it_fieldcatalog       = m_cl_variant->mt_fieldcatalog
           it_sort               = m_cl_variant->mt_sort
           it_filter             = m_cl_variant->mt_filter
           it_grouplevels_filter = m_cl_variant->mt_grouplevels_filter
           is_variant            = m_cl_variant->ms_variant
           i_variant_save        = m_cl_variant->m_variant_save
           i_variant_default     = m_cl_variant->m_variant_default
           is_total_options      = m_cl_variant->ms_total_options
           is_layout             = m_cl_variant->ms_layout
           it_selected_cols      = lt_selected_cols
           i_www_active          = m_www
           is_print              = m_cl_variant->ms_print
           i_cl_alv_grid         = me
           ir_salv_adapter       = me->r_salv_adapter
           i_fcat_complete       = m_fcat_complete.
  else.
    call method m_cl_variant->set_values
      exporting
        it_outtab        = mt_outtab
        it_selected_cols = lt_selected_cols
        i_www_active     = m_www.
  endif.

  call method me->set_layout_of_doublegrid
    exporting
      is_dtc_layout = m_cl_variant->ms_dtc_layout.

  m_cl_variant->ms_dtc_layout-t_group1 = mt_special_groups[].
  m_cl_variant->ms_dtc_layout-t_selcols  = lt_selected_cols.

  ls_dtc_layout = m_cl_variant->ms_dtc_layout.
  if me->m_cl_variant->ms_layout-frontend = cl_alv_bds=>mc_crystal_frontend.
    delete ls_dtc_layout-t_tabstrip where ts_ucomm = 'ALV_M_R1_SUM'.
  endif.

  data: l_amount type i.

* for all types of display
*  if me->m_cl_variant->ms_layout-NO_TOTLINE is not initial.
*    delete ls_dtc_layout-t_tabstrip where ts_ucomm = 'ALV_M_R1_SUM'.
*  endif.

  if lr_grid ne me. "Grid
    read table me->mt_excluding_toolbar transporting no fields
               with key table_line = cl_gui_alv_grid=>mc_fc_sum.
    if sy-subrc eq 0.
      delete ls_dtc_layout-t_tabstrip where ts_ucomm = 'ALV_M_R1_SUM'.
    endif.
    read table me->mt_excluding_toolbar transporting no fields
               with key table_line = cl_gui_alv_grid=>mc_mb_sum.
    if sy-subrc eq 0.
      delete ls_dtc_layout-t_tabstrip where ts_ucomm = 'ALV_M_R1_SUM'.
    endif.

    loop at me->mt_toolbar transporting no fields
            where function eq cl_gui_alv_grid=>mc_fc_subtot
               or function eq cl_gui_alv_grid=>mc_mb_subtot.
    endloop.
    if sy-subrc ne 0.
      delete ls_dtc_layout-t_tabstrip where ts_ucomm = 'ALV_M_R2_ZSUM'.
    endif.

    loop at me->mt_toolbar transporting no fields
            where function eq cl_gui_alv_grid=>mc_fc_sort
               or function eq cl_gui_alv_grid=>mc_fc_sort_asc
               or function eq cl_gui_alv_grid=>mc_fc_sort_dsc.
    endloop.
    if sy-subrc ne 0.
      delete ls_dtc_layout-t_tabstrip where ts_ucomm cp 'ALV_M_R2*'.
    endif.

    loop at me->mt_toolbar transporting no fields
            where function eq cl_gui_alv_grid=>mc_mb_filter
               or function eq cl_gui_alv_grid=>mc_fc_filter.
    endloop.
    if sy-subrc ne 0.
      delete ls_dtc_layout-t_tabstrip where ts_ucomm cp 'ALV_M_R3*'.
    endif.

    loop at me->mt_toolbar transporting no fields
            where function eq cl_gui_alv_grid=>mc_mb_view
               or function eq cl_gui_alv_grid=>mc_fc_views.
    endloop.
    if sy-subrc ne 0  or
       me->www_active eq abap_true or              "note 2293575
       me->javabean eq abap_true.
      delete ls_dtc_layout-t_tabstrip where ts_ucomm cp 'ALV_M_R4*'.
    else.
      data: lt_fcodes type ui_funcattr,
            ls_fcode  type uiattentry.

      call method m_cl_menu_button_view->get_functions
        importing
          fcodes = lt_fcodes.

      loop at lt_fcodes into ls_fcode
                        where ( fcode eq mc_fc_view_excel
                           or fcode eq mc_fc_view_crystal
                           or fcode eq mc_fc_view_lotus )
                          and ( hidden ne space ).
        case ls_fcode-fcode.
          when mc_fc_view_excel.
            delete ls_dtc_layout-t_tabstrip
                   where ts_ucomm = 'ALV_M_R4_EXCEL'.
            add 1 to l_amount.
          when mc_fc_view_crystal.
            delete ls_dtc_layout-t_tabstrip
                   where ts_ucomm = 'ALV_M_R4_CRYSTAL'.
            add 1 to l_amount.
          when mc_fc_view_lotus.
            delete ls_dtc_layout-t_tabstrip
                   where ts_ucomm = 'ALV_M_R4_LOTUS'.
            add 1 to l_amount.
        endcase.
      endloop.
      if l_amount eq 3  or
         me->www_active eq abap_true or              "note 2293575 bringt inder Brücke nix
         me->javabean eq abap_true.
        delete ls_dtc_layout-t_tabstrip where ts_ucomm cp 'ALV_M_R4*'.
      endif.
    endif.

  else. "Fullscreen
    loop at lt_excluding_lvc transporting no fields
            where table_line eq cl_gui_alv_grid=>mc_mb_sum
               or table_line eq cl_gui_alv_grid=>mc_fc_sum.
    endloop.
    if sy-subrc eq 0.
      delete ls_dtc_layout-t_tabstrip where ts_ucomm = 'ALV_M_R1_SUM'.
    endif.

    loop at lt_excluding_lvc transporting no fields
            where table_line eq cl_gui_alv_grid=>mc_mb_subtot
               or table_line eq cl_gui_alv_grid=>mc_fc_subtot.
    endloop.
    if sy-subrc eq 0.
      delete ls_dtc_layout-t_tabstrip where ts_ucomm = 'ALV_M_R2_ZSUM'.
    endif.

    loop at lt_excluding_lvc transporting no fields
            where table_line eq cl_gui_alv_grid=>mc_fc_sort
               or table_line eq cl_gui_alv_grid=>mc_fc_sort_asc
               or table_line eq cl_gui_alv_grid=>mc_fc_sort_dsc.
    endloop.
    if sy-subrc eq 0.
      delete ls_dtc_layout-t_tabstrip where ts_ucomm cp 'ALV_M_R2*'.
    endif.

    loop at lt_excluding_lvc transporting no fields
            where table_line eq cl_gui_alv_grid=>mc_mb_filter
               or table_line eq cl_gui_alv_grid=>mc_fc_filter.
    endloop.
    if sy-subrc eq 0.
      delete ls_dtc_layout-t_tabstrip where ts_ucomm cp 'ALV_M_R3*'.
    endif.

    loop at lt_excluding_lvc transporting no fields
            where table_line eq cl_gui_alv_grid=>mc_mb_view
               or table_line eq cl_gui_alv_grid=>mc_fc_views.
    endloop.
    if sy-subrc eq 0  or
       me->www_active eq abap_true or              "note 2293575
       me->javabean eq abap_true.
      delete ls_dtc_layout-t_tabstrip where ts_ucomm cp 'ALV_M_R4*'.
    else.
      read table lt_excluding_lvc
           with key table_line = cl_gui_alv_grid=>mc_fc_view_excel
           transporting no fields.
      if sy-subrc eq 0 and
         m_cl_variant->m_view ne cl_gui_alv_grid=>mc_fc_view_excel.
        delete ls_dtc_layout-t_tabstrip
               where ts_ucomm = 'ALV_M_R4_EXCEL'.
        add 1 to l_amount.
      endif.
      read table lt_excluding_lvc
          with key table_line = cl_gui_alv_grid=>mc_fc_view_crystal
                 transporting no fields.
      if sy-subrc eq 0 and
         m_cl_variant->m_view ne cl_gui_alv_grid=>mc_fc_view_crystal.
        delete ls_dtc_layout-t_tabstrip
               where ts_ucomm = 'ALV_M_R4_CRYSTAL'.
        add 1 to l_amount.
      endif.
      read table lt_excluding_lvc
            with key table_line = cl_gui_alv_grid=>mc_fc_view_lotus
                 transporting no fields.
      if sy-subrc eq 0 and
         m_cl_variant->m_view ne cl_gui_alv_grid=>mc_fc_view_lotus.
        delete ls_dtc_layout-t_tabstrip
               where ts_ucomm = 'ALV_M_R4_LOTUS'.
        add 1 to l_amount.
      endif.
      if l_amount eq 3 or
         me->www_active eq abap_true or              "note 2293575
         me->javabean eq abap_true.
        delete ls_dtc_layout-t_tabstrip where ts_ucomm cp 'ALV_M_R4*'.
      endif.
    endif.
  endif.

* old dialog
  if _is_bridge_active( ) = abap_false.

  data: l_variant_save type char01.

  l_variant_save = m_cl_variant->m_variant_save.

  if lr_grid ne me. "Grid
    read table mt_toolbar
         with key function = cl_gui_alv_grid=>mc_fc_save_variant
         transporting no fields.
    if sy-subrc ne 0.
      call method m_cl_menu_button_variant->get_functions
        importing
          fcodes = lt_fcodes.

      read table lt_fcodes transporting no fields
           with key fcode  = cl_gui_alv_grid=>mc_fc_save_variant
                    hidden = space.
      if sy-subrc ne 0.
        clear m_cl_variant->m_variant_save.
      endif.
    endif.
  else. "Fullscreen
    read table lt_excluding_lvc
         with key table_line = cl_gui_alv_grid=>mc_fc_save_variant
         transporting no fields.
    if sy-subrc eq 0.
      clear m_cl_variant->m_variant_save.
    endif.
  endif.

    call method m_cl_variant->lvc_variant
      exporting
        is_dtc_layout      = ls_dtc_layout
        i_bypassing_buffer = m_bypassing_buffer
        i_buffer_active    = m_buffer_active
        i_cl_alv_grid      = me
        it_except_qinfo    = me->mt_except_qinfo
      importing
        e_saved            = e_saved
      exceptions
        no_change          = 1
        restore_old_view   = 2                                "B5AK000316
        no_filt_change     = 3                                "B20K8A0QQR
        others             = 4.                               "B5AK000316

    m_cl_variant->m_variant_save = l_variant_save.            "B20K8A0MOD

    if sy-subrc eq 1.
      raise no_change.
    endif.

    if sy-subrc eq 2                                          "B5AK000316
       or sy-subrc eq 3                                       "B20K8A0QQR
       or sy-subrc eq 0.                                      "B5AK006349
      call method m_cl_variant->get_values_bds
        exporting
          i_ok_code       = 'DUMMY'
        importing
          es_bds_with_url = m_next_alv_bds.

      call method m_cl_variant->get_view
        importing
          e_view = m_next_view.
    endif.                                                    "B5AK000316

* new dialog (bridge)
  else.

  data: it_tabstrip type dtc_t_ts.

    it_tabstrip = ls_dtc_layout-t_tabstrip.
    macro_bridge_call_data.
    macro_bridge_method_name cl_gui_alv_grid maintain_variant.
    macro_bridge_parameter     exporting: it_tabstrip ls_dtc_layout-t_tabstrip.
    macro_bridge_opt_parameter importing: e_saved e_saved.
    macro_bridge_exception: no_change 1.
    try.
      macro_bridge_call.
    catch cx_salv_grx_nc_meth_exception.
      raise no_change.
    endtry.
  endif.


  call method me->set_sort_criteria
    exporting
      it_sort = m_cl_variant->mt_sort.

  loop at m_cl_variant->mt_fieldcatalog transporting no fields
          where do_sum ne space.
*     force calcualtion of totals
    m_cl_variant->m_calculate_totals = 'X'.
    exit.
  endloop.

  m_invalid_frontend_fieldcat = 'X'.

  call method set_frontend_fieldcatalog                     "Y6AK001484
    exporting
      it_fieldcatalog = m_cl_variant->mt_fieldcatalog.

*For Fullscreen: Refresh is done in method SET_FUNCTION_CODE
*For Grid      : Refresh is done in method DISPATCH
*  if lr_grid ne me. "Grid
*    call method refresh_table_display.
*  endif.

endmethod.                    "maintain_variant


method map_roid_to_row.

  data: ls_row_no type lvc_s_roid,
        ls_row_id type lvc_s_row,
        ls_poid type lvc_s_roro.

  clear et_index_rows.

  loop at it_row_no into ls_row_no.
    clear: ls_row_id.
    if ls_row_no-row_id gt 0.
      ls_row_id-index = ls_row_no-row_id.
    else.
      read table mt_poid into ls_poid
                 with table key row_id     = ls_row_no-row_id
                                sub_row_id = ls_row_no-sub_row_id.
      if sy-subrc ne 0.
        message x000(0k).
      endif.
      ls_row_id-rowtype = ls_poid-rowtype.
      ls_row_id-index   = ls_poid-index.
    endif.
    append ls_row_id to et_index_rows.
  endloop.

endmethod.


method map_row_to_roid.

  data: ls_row_id type lvc_s_row,
        ls_row_no type lvc_s_roid.

  clear et_row_no.

  loop at it_index_rows into ls_row_id.
    ls_row_no-row_id = ls_row_id-index.
    if not ls_row_id-rowtype is initial.
      ls_row_no-row_id     = ls_row_no-row_id * -1.
      ls_row_no-sub_row_id = ls_row_id-rowtype+7(10).
    endif.
    append ls_row_no to et_row_no.
  endloop.

endmethod.                    "map_row_to_roid


method merge_static_menus.

  data ls_btnmnu type stb_btnmnu.

  check me->www_active eq 'X'.

  define macro_merge_mnu.              "&1=fcode  &2=menu .
    read table it_toolbar transporting no fields
                          with key function = &1.
    if sy-subrc eq 0.
      read table ct_btnmnu transporting no fields
                 with key function = &1.
      if ( sy-subrc ne 0 ).
        clear ls_btnmnu.
        ls_btnmnu-function = &1.
        ls_btnmnu-ctmenu   = &2.
        append ls_btnmnu to ct_btnmnu.
      endif.
    endif.
  end-of-definition.

  macro_merge_mnu mc_mb_variant       m_cl_menu_button_variant.
  macro_merge_mnu mc_mb_sum           m_cl_menu_button_sum.
  macro_merge_mnu mc_mb_filter        m_cl_menu_button_filter.
  macro_merge_mnu mc_mb_export        m_cl_menu_button_export.
  macro_merge_mnu mc_fc_reprep        m_cl_menu_button_reprep.
  macro_merge_mnu mc_mb_view          m_cl_menu_button_view.
  macro_merge_mnu mc_mb_subtot        m_cl_menu_button_subtot.
  macro_merge_mnu mc_mb_paste         m_cl_menu_button_paste.

endmethod.


method offline.

*****ACHTUNG!!! Methode ist in cl_salv_model=>is_offline kopiert
*****-> jede Änderung dort nachziehen!!!

*... Web-Reporting
  constants: con_hex02 type x value '02'.    " Druckmodus
  constants: con_hex04 type x value '04'.    " Call TA in background

  data: l_ws(10) type c.

  import l_ws to l_ws from memory id 'WWW_ALV_ITS'.

*... RFC Call of ALV Y6BK075863
  data: is_gui_available type abap_bool.
  call function 'GUI_IS_AVAILABLE'
   IMPORTING
     RETURN        = is_gui_available.

*... submit <report> list to memory
  data: list_to_memory   type abap_bool.
  system-call kernel_info 'LIST_TO_MEMORY' list_to_memory.

  if sy-batch eq 'X'       or
     is_gui_available eq abap_false or   "Y6BK075863
     list_to_memory eq abap_true or
     sy-subty o  con_hex02 or
     l_ws     eq 'ITS' or
     ( sy-batch eq 'X' and sy-subty o con_hex04 ).
    e_offline = 1.
  endif.

endmethod.


method on_before_send.

  if _is_bridge_active( ) = abap_true.
    macro_bridge_call_data.
    macro_bridge_method_name cl_gui_alv_grid on_before_send.
    macro_bridge_parameter exporting: firstline firstline,
                                      lastline  lastline.
    macro_bridge_call.
    exit.
  endif.

  if me->m_performance eq 'X'.
    call method lvc_table_fill
      exporting
        firstline = firstline
        lastline  = lastline.
  endif.

endmethod.


method on_before_send_impl.

  if me->m_performance eq 'X'.
    call method lvc_table_fill
      exporting
        firstline = firstline
        lastline  = lastline.
  endif.

endmethod.


method on_close.
* ...
endmethod.


method on_close_graphics.

*... Grid as Popup, free() could be already called
  check m_cl_variant is not initial.

  call method m_cl_variant->set_graphics_visible
              exporting i_visible = space.

  call method m_cl_variant->delete_graphics.

endmethod.


method on_close_obj.

  if not mr_data_changed is initial.
    call method mr_data_changed->free.
    clear mr_data_changed.
  endif.

endmethod.


method on_hotspot_click.
* ...
*  data: ls_msg type lvc_s_msg.
*  data: ls_row_no type lvc_s_roid.
** data: ls_row_id type lvc_s_row.
** data: ls_col_id type lvc_s_col.
*  data: ls_fieldcat type lvc_s_fcat.
*  read table mr_data_changed->mt_protocol
*             into ls_msg index  e_row_id-index.
*  if sy-subrc = 0.
**   ls_row_id-index = ls_msg-row_id.
**   ls_col_id-fieldname = ls_msg-fieldname.
*    read table mt_fieldcatalog into ls_fieldcat with key
*                                    fieldname = ls_msg-fieldname.
*    if sy-subrc ne 0.
*      message x000(0k).
*    endif.
*    ls_row_no-row_id = ls_msg-row_id.
*
*    call method me->SET_CURRENT_CELL_ID2 exporting
*                                         ROW_ID = ls_row_no
*                           col_id = ls_fieldcat-col_id.
*    call method me->SELECT_TEXT_IN_CURRENT_CELL exporting from = 1
*                                                          to = 100.
*    call method cl_gui_control=>set_focus
*                                 exporting control = me.
*
*  endif.

endmethod.


method on_match_found.

*... lvc variables
  data:
    ls_cell             type lvc_s_cell,
    ls_col              type lvc_s_col,
    ls_roid             type lvc_s_roid,
    ls_row              type lvc_s_row,
    ls_search_entries   type if_alv_lvc_search=>type_s_search_position.

*...FIND MORE Button
  if e_modus eq if_alv_lvc_search=>c_modus_next.
    ms_search-s_criteria-new = abap_true.  "to keep Button FIND_MORE alive
  elseif e_modus eq if_alv_lvc_search=>c_modus_first.
    clear ms_search.
  endif.

  read table et_search_entries into ls_search_entries index 1.
  if sy-subrc eq 0.
    ls_roid-row_id   = ls_search_entries-row.
    me->set_scroll_info_id(
                        is_row_no = ls_roid
                        is_col_id = ls_col
                        ).

*... backend coordinates
    ls_row-index     = ls_search_entries-row.
    ls_col-fieldname = ls_search_entries-column_name.
    me->set_current_cell_via_id(
                        is_row_id    = ls_row
                        is_column_id = ls_col
                        ).

    me->select_text_in_current_cell(
                                 from = ls_search_entries-start_offset
                                 to   = ls_search_entries-end_offset
                               ).

    cl_gui_cfw=>flush( ).

  endif.

endmethod.


METHOD on_oi_custom_event.
*not supported from OI-Integration, if wanted than work in OI and in
*the grid, but pay attention to system and application events
*  CASE event_name.
*    WHEN 'SET_ALV'.
*      m_view = mc_fc_view_grid.
*      CALL METHOD change_view
*           EXPORTING
*               i_new_view = m_view
*           EXCEPTIONS
*               new_view_not_supported = 1.
*
*      CALL METHOD soft_refresh_table_display.
*
*    WHEN OTHERS.
*      DATA: text(80), paramlist1(80), paramlist2(80).
*
*      CONCATENATE 'Excel: Event ' event_name 'fired'
*         INTO text SEPARATED BY space.                      "#EC NOTEXT
*      CONCATENATE param1 param2 param3 param4
*         INTO paramlist1 SEPARATED BY space.                "#EC NOTEXT
*
*      CONCATENATE param5 param6 param7 param8
*         INTO paramlist2 SEPARATED BY space.                "#EC NOTEXT
*
*      CALL FUNCTION 'POPUP_TO_INFORM'
*           EXPORTING
*                titel  = 'Alv Excel Demo'                   "#EC NOTEXT
*                txt1   = text
*                txt2   = paramlist1
*                txt3   = paramlist2
*                txt4   = ''
*           EXCEPTIONS
*                OTHERS = 0.
*  ENDCASE.
*
ENDMETHOD.


method on_toolbarmenu_changed.

  data: ls_btnmenu type stb_btnmnu.

  loop at m_cl_toolbar->mt_btnmnu into ls_btnmenu.
    if ( ls_btnmenu-ctmenu eq sender ).
      call method set_toolbar_menu_static
        exporting
          toolbar_menu = sender
          function     = ls_btnmenu-function.
      exit.
    endif.
  endloop.

endmethod.                    "ON_TOOLBARMENU_CHANGED


method optimize_columns .

  if i_all_columns eq space.
    call method me->optimize_selected_cols.
  else.
    call method me->optimize_all_cols.
  endif.

endmethod.


method position_in_id.

* data: ls_poid type lvc_s_idpo.

* read table mt_poid into ls_poid with table key position = i_position.
* if sy-subrc = 0.
*   es_row_id = ls_poid-row_id.
* else.
*   raise not_found.
* endif.

endmethod.


method position_in_id_range.
* ...
*  data: ls_position type lvc_s_sele.
*  data: ls_poid     type lvc_s_idpo.
*  data: l_times     type i.
*  data: l_position  type i.
*  data: l_counter   type i.
*  data: ls_row_id   type lvc_s_row.

*  loop at it_position into ls_position.
*    if not ls_position-row_to is initial.
*      l_times = ls_position-row_to - ls_position-row_from + 1.
*    else.
*      l_times = 1.
*    endif.

*    l_position = ls_position-row_from.
*    do l_times times.
**     L_counter = l_counter + 1.
*      read table mt_poid into ls_poid with table key
*                              position = l_position.
*      if sy-subrc = 0.
*        ls_row_id = ls_poid-row_id.
*        append ls_row_id to et_row_id.
*      endif.
*      l_position = l_position + 1.
*    enddo.
*  endloop.
endmethod.


method prepare_export.

  if _is_bridge_active( ) = abap_true.
    macro_bridge_call_data.
    macro_bridge_method_name cl_gui_alv_grid prepare_export.
    macro_bridge_call.
    exit.
  endif.
  _prepare_export( ).

endmethod.


method print_backend.

* this method is used for the following purposes.
* I_PREVIEW  I_EXPORT
* ' ' ' ' - backend batch printing
*               //SET_TABLE_FOR_FIRST_DISPLAY)   (online and offline)
* ' ' ' ' I_NOCRYSTAL ='X'
*         - enforce classical batch printing ( no crystal! ).
* 'X' ' ' - switch to print preview!
* 'X' 'X' - EXPORT_TO_LOCAL_FILE      (online)
* 'X' 'M' - EXPORT_TO_OFFICE          (online)
* 'X' 'F' - EXPORT_TO_WORD_PROCESSOR  (online)
* 'X' 'S' - SEND_DATA_OF_GRID         (online)
*
*

  field-symbols: <tab1>              type standard table,
                 <copy_tab1>         type standard table,
                 <lt_collect00>      type standard table,
                 <lt_collect01>      type standard table,
                 <lt_collect02>      type standard table,
                 <lt_collect03>      type standard table,
                 <lt_collect04>      type standard table,
                 <lt_collect05>      type standard table,
                 <lt_collect06>      type standard table,
                 <lt_collect07>      type standard table,
                 <lt_collect08>      type standard table,
                 <lt_collect09>      type standard table,
                 <ls_fieldcat_kkblo> type kkblo_fieldcat.

  data: lt_index_cols           type lvc_t_col,
        lt_fieldcat_kkblo       type kkblo_t_fieldcat,
        lt_sort_kkblo           type kkblo_t_sortinfo,
        lt_filter_kkblo         type kkblo_t_filter,
        lt_special_groups_kkblo type kkblo_t_sp_group,
        lt_filter_groups_kkblo  type kkblo_t_grouplevels,
        ls_layout_kkblo         type kkblo_layout,
        l_tabname               type slis_tabname,
        l_sumlevel              type sy-tabix,
        l_sumlevel_unit         type i.

  data ref type ref to data.
  data copy_ref type ref to data.

*... (1) Check Outtab
  assign mt_outtab->* to <tab1>.
  if not sy-subrc is initial.
    message a534(0k).
  endif.

  if ( i_export is initial         " see above for flag interpretation
       and i_preview is initial    "
       and i_nocrystal is initial
       and
       ( not ( m_crystal_active is initial ) ) ).
* attempt a crystal output.
* this function generates a crystal output under the following
* circumstances:
    data l_offline type flag.
    if ( not  m_batch_mode is initial ).
      l_offline = 'X'.
    endif.
    "  a) we are in crystal-view and exactly the currently displayed
    "     template is present.
    "  b) there exists exactly one crystal template.
    "  c) batch printing execution. ( might be b too ).
* otherwise it defaults to list-batch-printing wo further prompting.
    " try to determine ONE crystal template.
    data ls_alv_bds type lvc_s_bds.
    call method me->get_bds_template_crystal
      exporting
        i_offline                = l_offline
        i_table_requested        = 'X'
        i_current_template_valid = 'X'
        i_supress_message        = 'X'                      "B20K8A0O2B
      importing
        es_alv_bds               = ls_alv_bds
      exceptions
        cancel_select            = 1
        no_template_found        = 2 " default to list-batch
        no_unique_template       = 3
        others                   = 4.
    case sy-subrc.
      when 0.
        call method me->export_to_crbatch
          exporting
            is_alv_bds = ls_alv_bds
          exceptions
            others     = 1.
        " we are happy
        exit.
      when 1.  " user cancelled selection -> we are definitely online
        if ( l_offline = 'X' ).
          message x000(0k) with 'Online assumption wrong'.  "#EC NOTEXT
        endif.
        data l_answer type c.
        call function 'POPUP_TO_DECIDE'  "#EC FB_OLDED
          exporting
            defaultoption           = '1'
            textline1               =
        'Sie haben kein Crystal-Reports Template ausgewählt'(213)
           textline2               =
       'Möchten Sie stattdessen eine Liste Drucken?'(214)
*             TEXTLINE3               = ' '
            text_option1            = 'Kein Druck'(211)
            text_option2            = 'Listendruck'(212)
*             ICON_TEXT_OPTION1       = ' '
*             ICON_TEXT_OPTION2       = ' '
            titel                   =
           'Listendruck statt Crystal-Reports Ausgabe?'(215)
*             START_COLUMN            = 25
*             START_ROW               = 6
            cancel_display          = 'X'
          importing
            answer                  = l_answer
                  .
        if ( l_answer ne '2' ).
          exit.
        endif.
      when 2 " no template found B20K8A0O2B
      or 3. " more than one template,
        " default to list printing.
        if l_offline is initial.  ">>B5AK000316
          if m_ucomm eq '&CRBATCH'.                         "B20K8A0O2B
            call function 'POPUP_TO_DECIDE'
              exporting
                defaultoption           = '1'
                textline1               =
            'Sie haben kein Crystal-Reports Template ausgewählt'(213)
               textline2               =
           'Möchten Sie stattdessen eine Liste Drucken?'(214)
*                 TEXTLINE3               = ' '
                text_option1            = 'Kein Druck'(211)
                text_option2            = 'Listendruck'(212)
*                 ICON_TEXT_OPTION1       = ' '
*                 ICON_TEXT_OPTION2       = ' '
                titel                   =
               'Listendruck statt Crystal-Reports Ausgabe?'(215)
*                 START_COLUMN            = 25
*                 START_ROW               = 6
                cancel_display          = 'X'
              importing
                answer                  = l_answer
                      .
            if ( l_answer ne '2' ).
              exit.
            endif.
          endif.                  "<<B5AK006349
        endif.                    "<<B5AK000316
      when others.
        exit. " think about error-log.
    endcase.
  endif.

  if i_preview eq 'X' and i_export eq space. "Print Preview
    create data ref like <tab1>.
    assign ref->* to <copy_tab1>.
    <copy_tab1> = <tab1>.
  endif.

  create data ref like <tab1>.
  assign ref->* to <lt_collect00>.
  create data ref like <tab1>.
  assign ref->* to <lt_collect01>.
  create data ref like <tab1>.
  assign ref->* to <lt_collect02>.
  create data ref like <tab1>.
  assign ref->* to <lt_collect03>.
  create data ref like <tab1>.
  assign ref->* to <lt_collect04>.
  create data ref like <tab1>.
  assign ref->* to <lt_collect05>.
  create data ref like <tab1>.
  assign ref->* to <lt_collect06>.
  create data ref like <tab1>.
  assign ref->* to <lt_collect07>.
  create data ref like <tab1>.
  assign ref->* to <lt_collect08>.
  create data ref like <tab1>.
  assign ref->* to <lt_collect09>.
  clear ref.

  if m_batch_mode is initial.
    call method me->get_selected_columns
      importing
        et_index_columns = lt_index_cols.
  endif.

* Print Struktur SLIS -> KKBLO B20K8A0R6Q
  data: ls_print               type slis_print_alv,
        ls_layout_temp         type kkblo_layout,
        lr_grid                type ref to cl_gui_alv_grid,
        l_callback_program     type syrepid,
        ls_sel_hide            type slis_sel_hide_alv.

  if me->_fullscreen_mode eq abap_true.
    call function 'GET_GLOBALS_FROM_SLVC_FULLSCR'
      importing
        e_callback_program = l_callback_program
        es_sel_hide        = ls_sel_hide
        e_grid             = lr_grid
        es_layout_kkblo    = ls_layout_temp.

*  Filter for Printparameters
    move-corresponding ls_layout_temp to ls_print.
    move-corresponding ls_print to ls_layout_kkblo.
    move ls_layout_temp-no_min_linesize
                      to ls_layout_kkblo-no_min_linesize.
    move ls_layout_temp-min_linesize
                      to ls_layout_kkblo-min_linesize.
    move ls_layout_temp-max_linesize
                      to ls_layout_kkblo-max_linesize.
  else.  "if lr_grid ne me.
    clear: ls_layout_kkblo,
           l_callback_program,
           ls_sel_hide.
  endif.

*... get the actual sumlevel because the sumlevel outline has to be
*    put into the sort table since the List can only take the sort table
  data: lt_lvc_sort type lvc_t_sort,
        lt_lvc_grpl type lvc_t_grpl.

  lt_lvc_sort = m_cl_variant->mt_sort.
  lt_lvc_grpl = m_cl_variant->mt_grouplevels_filter.

  call function 'LVC_SUMLEVEL_GET'
    exporting
      it_sort               = lt_lvc_sort
      it_grouplevels_filter = lt_lvc_grpl
    importing
      e_sumlevel            = l_sumlevel.

  call function 'LVC_SUMLEVEL_SELECT'
       exporting
            i_no_dialog     = abap_true
*             I_ONLY_DIALOG   =
            i_sumlevel      = l_sumlevel
       importing
            e_sumlevel      = l_sumlevel
*             e_sumlevel_text =
*             E_EXIT          =
       changing
            ct_sort         = lt_lvc_sort
*             CT_SUMINFO      =
            ct_groups       = lt_lvc_grpl
       exceptions
            no_subtotals    = 1
            wrong_input     = 2
            others          = 3.
  if sy-subrc gt 1.
    message id sy-msgid type sy-msgty number sy-msgno
            with sy-msgv1 sy-msgv2 sy-msgv3 sy-msgv4.
  endif.

  if i_preview eq 'X' and i_export eq space. "Print Preview
    call function 'LVC_TRANSFER_TO_KKBLO'
      exporting
        it_fieldcat_lvc         = m_cl_variant->mt_fieldcatalog
        it_sort_lvc             = lt_lvc_sort
        it_filter_lvc           = m_cl_variant->mt_filter
        it_selected_cols        = lt_index_cols
        it_special_groups_lvc   = mt_special_groups
        it_grouplevels_lvc      = m_cl_variant->mt_grouplevels_filter
        is_layout_lvc           = m_cl_variant->ms_layout
        is_variant_lvc          = m_cl_variant->ms_variant
        i_variant_save_lvc      = m_cl_variant->m_variant_save
        is_print_info_lvc       = m_cl_variant->ms_print
      importing
        et_fieldcat_kkblo       = lt_fieldcat_kkblo
        et_sort_kkblo           = lt_sort_kkblo
        et_filter_kkblo         = lt_filter_kkblo
        et_special_groups_kkblo = lt_special_groups_kkblo
        et_grouplevels_kkblo    = lt_filter_groups_kkblo
        es_layout_kkblo         = ls_layout_kkblo
      tables
        it_data                 = <copy_tab1>
      exceptions
        it_data_missing         = 0
        it_fieldcat_lvc_missing = 0
        others                  = 0.
  else.
    call function 'LVC_TRANSFER_TO_KKBLO'
      exporting
        it_fieldcat_lvc         = m_cl_variant->mt_fieldcatalog
        it_sort_lvc             = lt_lvc_sort
        it_filter_lvc           = m_cl_variant->mt_filter
        it_selected_cols        = lt_index_cols
        it_special_groups_lvc   = mt_special_groups
        it_grouplevels_lvc      = m_cl_variant->mt_grouplevels_filter
        is_layout_lvc           = m_cl_variant->ms_layout
        is_variant_lvc          = m_cl_variant->ms_variant
        i_variant_save_lvc      = m_cl_variant->m_variant_save
        is_print_info_lvc       = m_cl_variant->ms_print
      importing
        et_fieldcat_kkblo       = lt_fieldcat_kkblo
        et_sort_kkblo           = lt_sort_kkblo
        et_filter_kkblo         = lt_filter_kkblo
        et_special_groups_kkblo = lt_special_groups_kkblo
        et_grouplevels_kkblo    = lt_filter_groups_kkblo
        es_layout_kkblo         = ls_layout_kkblo
      tables
        it_data                 = <tab1>
      exceptions
        it_data_missing         = 0
        it_fieldcat_lvc_missing = 0
        others                  = 0.
  endif.

* Provide that header in the print list differ from the control headers
* Save Tabname of fieldcat
* restrict number of fields to 99.
  data l_cnt_displayed_columns type i.
  clear l_cnt_displayed_columns.
  loop at lt_fieldcat_kkblo assigning <ls_fieldcat_kkblo>.
    if not <ls_fieldcat_kkblo>-tabname is initial.
      l_tabname = <ls_fieldcat_kkblo>-tabname.
    else.
      l_tabname =  '1'.
    endif.
    clear <ls_fieldcat_kkblo>-tech_complete.
*      clear <ls_fieldcat_kkblo>-seltext.    "Y9CK055839
* list display supports max 99 displayed fields
    if ( <ls_fieldcat_kkblo>-no_out is initial
       and <ls_fieldcat_kkblo>-tech is initial ).
      add 1 to l_cnt_displayed_columns.
    endif.
    if ( l_cnt_displayed_columns > 99 ).
      <ls_fieldcat_kkblo>-no_out = 'X'.
    endif.
    clear <ls_fieldcat_kkblo>-hotspot.  "YI2K008155
  endloop.

* values of ls_layout_kkblo: ' ', 'N', 'X' , 'P'
* online processing (Print Preview) : ' ', 'P' -> ' '
* batch processing (Print)          : 'X', 'N' -> 'X'
*  if    i_preview is initial
*    and m_batch_mode is initial.   "Y6AK049508>>>>
*      ls_layout_kkblo-print = 'X'.
*  else.
*    clear ls_layout_kkblo-print. "<<<<<Y6AK049508
*  endif.

*<<<Y6AK052324
*note 891366 return to a previous coding
  data: version type string.
  version = cl_alv_print_parameters=>get_version( ).
  if version eq 'V03' or version eq 'V03_1'.
    if    i_preview is initial
      and m_batch_mode is initial.
      if not me->m_cl_variant->ms_print-print = 'N'.
        ls_layout_kkblo-print = 'X'.
        me->m_cl_variant->ms_print-print = 'X'.
*      else. "Y7AK097399
*        clear ls_layout_kkblo-print.
*        clear m_cl_variant->ms_print-print.
      endif.
    else.
      clear ls_layout_kkblo-print.
      clear m_cl_variant->ms_print-print.
    endif.
  else.
    if    i_preview is initial
      and m_batch_mode is initial.
      if not me->m_cl_variant->ms_print-print = 'N'.
        ls_layout_kkblo-print = 'X'.
*      else. "Y7AK097399
*        clear ls_layout_kkblo-print. "if cleared, no printout without dialog
      endif.
    else.
      clear ls_layout_kkblo-print.
    endif.
  endif.
*  not necessary
*  data: ls_print_save type lvc_s_prnt.
*  ls_print_save = m_cl_variant->ms_print.
*>>>Y6AK052324

  if m_cl_variant->ms_print-no_colwopt is initial.
    ls_layout_kkblo-colwidth_optimize = 'X'.
  endif.

  ls_layout_kkblo-new_fcodes = 'X'.
  ls_layout_kkblo-flexible_key = 'X'.

  if m_cl_variant->ms_layout-no_vgridln = 'X'.
    ls_layout_kkblo-no_vline = 'X'.
  endif.

  if not i_export is initial.
    set user-command mc_fc_back_classic.
  endif.

*... transfer excluding table.
  data lt_excluding type kkblo_t_extab.

  call method transfer_fcode_lvc_to_slis
    exporting
      it_fcodes_lvc  = mt_excluding_toolbar
    importing
      et_fcodes_slis = lt_excluding.

*...cell merge cancelled
  ls_layout_kkblo-cell_merge = space.                       "ML0911

  data: lt_kkbl_qinf type kkblo_t_qinfo,
        ls_kkbl_qinf type kkblo_qinfo,
        ls_qinf      type lvc_s_qinf.

  loop at me->mt_except_qinfo into ls_qinf.
    move-corresponding ls_qinf to ls_kkbl_qinf.
    append ls_kkbl_qinf to lt_kkbl_qinf.
  endloop.

* set tooltip for key column color
  read table lt_kkbl_qinf transporting no fields
      with key type = cl_salv_tooltip=>c_type_symbol
               value = 'K41'.
  if sy-subrc ne 0.
    clear ls_kkbl_qinf.
    ls_kkbl_qinf-type = cl_salv_tooltip=>c_type_color.
    ls_kkbl_qinf-value = 'K41'.
    ls_kkbl_qinf-text = text-099.
    append ls_kkbl_qinf to lt_kkbl_qinf.
  endif.

*<<<Y6DK061332
  if not m_cl_variant->ms_variant-report is initial.
    l_callback_program = m_cl_variant->ms_variant-report.
  endif.

  data: l_offl type INT4.   "specific for grids without own container (fullscreen mode)
  clear l_offl.
  l_offl = offline( ).
  if l_offl is initial.
    call method set_visible
        exporting
          visible = cl_gui_control=>visible_false.
  endif.
  if i_preview eq 'X' and i_export eq space. "Print Preview
    call function 'K_KKB_LIST_DISPLAY'
         exporting
               i_export                       = i_export
*            I_INTERFACE_CHECK              =
               i_callback_program             = l_callback_program
*            I_CALLBACK_USER_COMMAND        =
*            i_callback_top_of_page         = ms_list_events-topofpage
*            i_callback_top_of_list         = ms_list_events-topoflist
*            i_callback_end_of_page         = ms_list_events-endofpage
*            i_callback_end_of_list         = ms_list_events-endoflist
*            I_CALLBACK_PF_STATUS_SET       =
*            I_CALLBACK_LAYOUT_SAVE         =
*            I_CALLBACK_FIELDCAT_SAVE       =
*            I_CALLBACK_GROUPLEVEL_CHANGE   =
*            I_CALLBACK_BEFORE_LINE_OUTPUT  =
*            I_CALLBACK_AFTER_LINE_OUTPUT   =
*            I_CALLBACK_FOREIGN_TOP_OF_PAGE =
*            I_CALLBACK_FOREIGN_END_OF_PAGE =
*            I_CALLBACK_LIST_MODIFY         =
*            I_CALLBACK_TOP_OF_COVERPAGE    =
*            I_CALLBACK_END_OF_COVERPAGE    =
*            I_CALLBACK_HEADER_TRANSPORT    =
*            I_CALLBACK_REPREP_SEL_MODIFY   =
*            I_CALLBACK_SUBTOTAL_TEXT       =
               i_tabname                      = l_tabname
               i_oo_alv                       = me
               is_layout                      = ls_layout_kkblo
               it_fieldcat                    = lt_fieldcat_kkblo
*            I_FCTYPE                       = 'R'
               it_excluding                   = lt_excluding
               it_special_groups              = lt_special_groups_kkblo
               it_sort                        = lt_sort_kkblo
               it_filter                      = lt_filter_kkblo
*            IT_EVENT_EXIT                  =
               is_sel_hide                    = ls_sel_hide
               it_except_qinfo                = lt_kkbl_qinf
               ir_salv_adapter                = me->r_salv_adapter
*            IS_REPREP_ID                   =
*            I_SCREEN_START_COLUMN          = 0
*            I_SCREEN_START_LINE            = 0
*            I_SCREEN_END_COLUMN            = 0
*            I_SCREEN_END_LINE              = 0
*       IMPORTING
*            E_EXIT_CAUSED_BY_CALLER        =
*            ES_EXIT_CAUSED_BY_USER         =
         tables
              t_outtab                       = <copy_tab1>
              it_collect00                   = <lt_collect00>
              it_collect01                   = <lt_collect01>
              it_collect02                   = <lt_collect02>
              it_collect03                   = <lt_collect03>
              it_collect04                   = <lt_collect04>
              it_collect05                   = <lt_collect05>
              it_collect06                   = <lt_collect06>
              it_collect07                   = <lt_collect07>
              it_collect08                   = <lt_collect08>
              it_collect09                   = <lt_collect09>.
  else.
    call function 'K_KKB_LIST_DISPLAY'
         exporting
               i_export                       = i_export
*            I_INTERFACE_CHECK              =
               i_callback_program             = l_callback_program
*            I_CALLBACK_USER_COMMAND        =
*            i_callback_top_of_page         = ms_list_events-topofpage
*            i_callback_top_of_list         = ms_list_events-topoflist
*            i_callback_end_of_page         = ms_list_events-endofpage
*            i_callback_end_of_list         = ms_list_events-endoflist
*            I_CALLBACK_PF_STATUS_SET       =
*            I_CALLBACK_LAYOUT_SAVE         =
*            I_CALLBACK_FIELDCAT_SAVE       =
*            I_CALLBACK_GROUPLEVEL_CHANGE   =
*            I_CALLBACK_BEFORE_LINE_OUTPUT  =
*            I_CALLBACK_AFTER_LINE_OUTPUT   =
*            I_CALLBACK_FOREIGN_TOP_OF_PAGE =
*            I_CALLBACK_FOREIGN_END_OF_PAGE =
*            I_CALLBACK_LIST_MODIFY         =
*            I_CALLBACK_TOP_OF_COVERPAGE    =
*            I_CALLBACK_END_OF_COVERPAGE    =
*            I_CALLBACK_HEADER_TRANSPORT    =
*            I_CALLBACK_REPREP_SEL_MODIFY   =
*            I_CALLBACK_SUBTOTAL_TEXT       =
               i_tabname                      = l_tabname
               i_oo_alv                       = me
               is_layout                      = ls_layout_kkblo
               it_fieldcat                    = lt_fieldcat_kkblo
*            I_FCTYPE                       = 'R'
               it_excluding                   = lt_excluding
               it_special_groups              = lt_special_groups_kkblo
               it_sort                        = lt_sort_kkblo
               it_filter                      = lt_filter_kkblo
*            IT_EVENT_EXIT                  =
               is_sel_hide                    = ls_sel_hide
               it_except_qinfo                = lt_kkbl_qinf
               ir_salv_adapter                = me->r_salv_adapter
*            IS_REPREP_ID                   =
*            I_SCREEN_START_COLUMN          = 0
*            I_SCREEN_START_LINE            = 0
*            I_SCREEN_END_COLUMN            = 0
*            I_SCREEN_END_LINE              = 0
*       IMPORTING
*            E_EXIT_CAUSED_BY_CALLER        =
*            ES_EXIT_CAUSED_BY_USER         =
         tables
              t_outtab                       = <tab1>
              it_collect00                   = <lt_collect00>
              it_collect01                   = <lt_collect01>
              it_collect02                   = <lt_collect02>
              it_collect03                   = <lt_collect03>
              it_collect04                   = <lt_collect04>
              it_collect05                   = <lt_collect05>
              it_collect06                   = <lt_collect06>
              it_collect07                   = <lt_collect07>
              it_collect08                   = <lt_collect08>
              it_collect09                   = <lt_collect09>.
  endif.
*<<<Y7AK047566
  if l_offl is initial.
*>>>Y7AK047566
  call method set_visible
      exporting
        visible = cl_gui_control=>visible_true.
  endif.
* function module K_KKB_LIST_LAYOUT_INFO_GET is not sufficent
* to get back ls_layout_kkblo, because GLOBALS_POP has
* already cleared the STACK
*  me->m_cl_variant->ms_print-print = ls_print_save-print.

endmethod.                    "print_backend


METHOD process_help_request .

  DATA: ls_row_id       TYPE lvc_s_row,
        ls_col_id       TYPE lvc_s_col,
        ls_row_no       TYPE lvc_s_roid,
        lr_event_data   TYPE REF TO cl_alv_event_data,
        l_hlp_cprog     type help_info-program,
        l_hlp_repid     TYPE help_info-program,
        l_hlp_tabname   TYPE  help_info-tabname,
        l_hlp_fieldname TYPE  help_info-fieldname,
        l_hlp_rollname  TYPE  dfies-rollname,
        l_hlp_doktitle  TYPE  dsyst-doktitle,
        lt_dummy        TYPE STANDARD TABLE OF tline,
        ls_fieldcat     TYPE LINE OF lvc_t_fcat.

  CALL METHOD me->get_current_cell
    IMPORTING
      es_col_id = ls_col_id
      es_row_no = ls_row_no.

  IF me->is_cache_valid( ) NE abap_true or www_active eq abap_true.

    CALL METHOD cl_gui_cfw=>flush.

  ENDIF.

  CREATE OBJECT lr_event_data.
*... Trace?
  IF NOT mr_trace IS INITIAL.
    CALL METHOD mr_trace->add_trace_item
      EXPORTING
        i_trace_item = 'EVENT: ONF1'
        ir_variant   = m_cl_variant
        it_data      = mt_data
        it_info      = mt_info.
  ENDIF.
  RAISE EVENT onf1 EXPORTING e_fieldname   = ls_col_id-fieldname
                             es_row_no     = ls_row_no
                             er_event_data = lr_event_data.

  CHECK lr_event_data->m_event_handled IS INITIAL.

  READ TABLE m_cl_variant->mt_fieldcatalog INTO ls_fieldcat
             WITH KEY fieldname = ls_col_id-fieldname.
  IF sy-subrc NE 0.
    MESSAGE s720(sh).
    EXIT.
  ENDIF.

*...tabname/fieldname has a higher priority than rollname -> no!
*<<< YI3K066217
  if ls_fieldcat-rollname is not initial.
    l_hlp_rollname  = ls_fieldcat-rollname.
  else.
    if  ls_fieldcat-ref_table is not initial
    and ls_fieldcat-ref_field is not initial.
      l_hlp_tabname   = ls_fieldcat-ref_table.
      l_hlp_fieldname = ls_fieldcat-ref_field.
      clear l_hlp_rollname.
    else.
      MESSAGE s720(sh).
    endif.
  endif.
*>>> YI3K066217

  l_hlp_doktitle  = ls_fieldcat-seltext.
  l_hlp_cprog     = sy-cprog.
*  l_hlp_repid     = sy-repid.  "only turns out CL_GUI_ALV_GRID=======CP
  IF NOT l_hlp_rollname IS INITIAL.
    CALL FUNCTION 'HELP_OBJECT_SHOW'
      EXPORTING
        dokclass         = 'DE'
        doklangu         = sy-langu
        dokname          = l_hlp_rollname
        doktitle         = l_hlp_doktitle
        short_text       = 'X'
        called_by_program             = l_hlp_cprog
        called_by_dynp                = sy-dynnr
        called_by_cuaprog             = l_hlp_repid
      TABLES
        links            = lt_dummy
      EXCEPTIONS
        object_not_found = 0
        sapscript_error  = 0.
  ELSE.
*    IF l_hlp_fieldname IS INITIAL OR
*       l_hlp_tabname   IS INITIAL.
*      MESSAGE s720(sh).
*    ELSE.
      CALL FUNCTION 'HELP_OBJECT_SHOW_FOR_FIELD'
           EXPORTING
*               DOKLANGU                      = SY-LANGU
*               DOKTITLE                      = ' '
                called_by_program             = l_hlp_cprog
                called_by_dynp                = sy-dynnr
                called_for_tab                = l_hlp_tabname
                called_for_field              = l_hlp_fieldname
*               CALLED_FOR_TAB_FLD_BTCH_INPUT =
                called_by_cuaprog             = l_hlp_repid
*               called_by_cuastat             = l_hlp_status
                merge_dz_if_available         = 'X'
*          TABLES
*               LINKS                         =
           EXCEPTIONS
                object_not_found              = 0
                sapscript_error               = 0
                OTHERS                        = 0.
*    ENDIF.
  ENDIF.

ENDMETHOD.                    "process_help_request


method process_info_request.

  if is_ready_for_input( ) eq 0.
    call function 'IWB_HTML_HELP_OBJECT_SHOW'
      exporting
*       DEVCLASS                          =
*       TCODE                             =
        program                           = 'SAPLSLVC_DIALOG'
*       DYNPRONR                          =
        extension                         = 'ANWENDERDOKU'
*       FRONTEND_PLATFORM                 =
        call_browser                      = 'X'
*       SINGLE_OBJECT                     = ' '
*     IMPORTING
*       ACTION                            =
*       FRONTEND_URL                      =
*       FRONTEND_PROGRAM                  =
      exceptions
        object_not_found                  = 1
        rfc_error                         = 2
        no_profil_parameter               = 3
        import_parameter_is_invalid       = 4
        others                            = 5.
    if sy-subrc <> 0.
* error messages should not lead to dump!
      if sy-msgty = 'E'. "Y9CK038147
        sy-msgty = 'S'.
      endif.
      message id sy-msgid type sy-msgty number sy-msgno
              with sy-msgv1 sy-msgv2 sy-msgv3 sy-msgv4.
    endif.
  else.
    call function 'IWB_HTML_HELP_OBJECT_SHOW'
      exporting
*       DEVCLASS                          =
*       TCODE                             =
        program                           = 'SAPLSLVC_DIALOG'
*       DYNPRONR                          =
        extension                         = 'ANWENDERDOKUEDIT'
*       FRONTEND_PLATFORM                 =
        call_browser                      = 'X'
*       SINGLE_OBJECT                     = ' '
*     IMPORTING
*       ACTION                            =
*       FRONTEND_URL                      =
*       FRONTEND_PROGRAM                  =
      exceptions
        object_not_found                  = 1
        rfc_error                         = 2
        no_profil_parameter               = 3
        import_parameter_is_invalid       = 4
        others                            = 5.
    if sy-subrc <> 0.
* error messages should not lead to dump!
      if sy-msgty = 'E'. "Y9CK038147
        sy-msgty = 'S'.
      endif.
      message id sy-msgid type sy-msgty number sy-msgno
              with sy-msgv1 sy-msgv2 sy-msgv3 sy-msgv4.
    endif.
  endif.

endmethod.


method process_ucomm_on_invalid_input.

  me->mt_ucomms_oninvinput = it_ucomms.
  sort me->mt_ucomms_oninvinput ascending.

endmethod.


method PUT_PARAMETERS .

  field-symbols: <data_row> type any,
                <tab1> type standard table.
  data:         lp_wa type ref to data.

  assign mt_outtab->* to <tab1>.
  if not sy-subrc is initial.
    message a534(0k).
  endif.

*... Assign workarea
  create data lp_wa like line of <tab1>.
  assign lp_wa->* to <data_row>.

  call function 'K_KKB_PUT_GLOBALS'
    exporting eS_TABLE_ROW = <data_row>.

endmethod.


method raise_event .

*... Trace?
  if not mr_trace is initial.
    call method mr_trace->add_trace_item
      exporting
        i_trace_item = 'EVENT: USER_COMMAND'
        ir_variant   = m_cl_variant
        it_data      = mt_data
        it_info      = mt_info.
  endif.
  case I_USER_COMMAND.
    when 'A'.  "(A)fter
      raise event after_user_command exporting
                                     e_ucomm = i_ucomm
                                     e_not_processed = i_not_processed.
    when 'B'.  "(B)efore
      raise event before_user_command exporting e_ucomm = i_ucomm .
    when others.
      raise event user_command exporting e_ucomm = i_ucomm .
  endcase.
endmethod.                    "RAISE_EVENT


method refresh_mode_decision.

*  check not it_good_cells[] is initial.
  if it_good_cells[] is initial.
    if not mt_outtab is initial.
*... Trace?
      if not mr_trace is initial.
        call method mr_trace->add_trace_item
          exporting
            i_trace_item = 'EVENT: DATA_CHANGED_FINISHED'
            ir_variant   = m_cl_variant
            it_data      = mt_data
            it_info      = mt_info.
      endif.
      raise event data_changed_finished
                  exporting e_modified    = i_modified
                            et_good_cells = it_good_cells.
    endif.
    exit.
  endif.

*    Refresh mode decision
  if m_full is initial.
    call method me->check_refresh_required
      exporting
        it_cells = it_good_cells
      importing
        e_yes    = m_full.
  endif.

  if m_full eq 'X' and i_refresh eq 'X'.
    m_cl_variant->m_calculate_totals = 'X'.
*... Apply sort
    if not m_cl_variant->mt_sort is initial.
      call method me->apply_sort.
    endif.

*... Get grouplevels
    call method me->get_grouplevels.

*... Apply filter
    if not m_cl_variant->mt_filter is initial.
      call method me->apply_filter.
    else.
      m_cl_variant->mt_grouplevels_filter =
                                m_cl_variant->mt_grouplevels.
    endif.
    clear m_full.
  endif.

  if i_refresh eq 'X'.
    data: ls_stable      type lvc_s_stbl,
          l_soft_refresh type char01.

    ls_stable-row  = 'X'.
    ls_stable-col  = 'X'.
    l_soft_refresh = space.

    call method me->refresh_table_display
      exporting
        is_stable      = ls_stable
        i_soft_refresh = l_soft_refresh.
  endif.

*... Trace?
  if not mr_trace is initial.
    call method mr_trace->add_trace_item
      exporting
        i_trace_item = 'EVENT: DATA_CHANGED_FINISHED'
        ir_variant   = m_cl_variant
        it_data      = mt_data
        it_info      = mt_info.
  endif.
  raise event data_changed_finished exporting e_modified = i_modified
                                         et_good_cells = it_good_cells.

endmethod.                    "refresh_mode_decision


method refresh_table_display.

  break-point id alv_grid.

  field-symbols: <tab1>        type standard table,
                 <ls_fieldcat> type lvc_s_fcat,
                 <l_fs>        type any.

  types: begin of t_lt_fields,
          fieldname type lvc_fname,
        end of t_lt_fields.

  data: lt_fields type standard table of t_lt_fields,
        l_field   type t_lt_fields,
        l_sap_cus type char10.

  if m_save_in_process = 'X'.
    call 'C_SAPGPARAM' id 'NAME'  field 'transport/systemtype'
                     id 'VALUE' field l_sap_cus.          "#EC CI_CCALL

    if l_sap_cus = 'SAP'.
      message i000(0k) with text-200 text-201 text-202 text-203.
    endif.
  endif.

  if cl_gui_alv_grid=>offline( ) is initial.
    call method me->set_auto_redraw
      exporting
        enable = 0.
  endif.

*... (X) Trace?
  if not mr_trace is initial.
    call method mr_trace->add_trace_item
      exporting
        i_trace_item = 'REFRESH_TABLE_DISPLAY'
        ir_variant   = m_cl_variant.
  endif.

*... (0) Tell frontend that old table should no longer be used
  if not m_dp_on_demand is initial.
    call method m_dp_on_demand->free_gui_table.
    set handler on_before_send for m_dp_on_demand activation space.
    clear m_dp_on_demand.
  endif.

*... (1) Check Outtab
  assign mt_outtab->* to <tab1>.
  if not sy-subrc is initial.
    message a534(0k).
  endif.

  if m_very_first is initial.
    call method me->get_frontend_fieldcatalog
      importing
        et_fieldcatalog = m_cl_variant->mt_fieldcatalog.
  endif.

*... (2) Check if complex or not
  if i_soft_refresh is initial.
    m_cl_variant->m_calculate_totals = 'X'.
    clear m_cl_variant->mt_filter_index.

    if m_complex_type is initial.
      loop at m_cl_variant->mt_fieldcatalog
              assigning <ls_fieldcat>
              where tech is initial and
                    no_out ne 'X'.
        if <ls_fieldcat>-fieldname ca '-'.
          split <ls_fieldcat>-fieldname at '-' into table lt_fields.
          loop at lt_fields into l_field.
            assign component l_field-fieldname
                             of structure <tab1>
                             to <l_fs>.
            if sy-subrc eq 0.
              m_complex_type = 'Y'.
              exit.
            endif.
          endloop.
          if m_complex_type = 'Y'.
            exit.
          endif.
        endif.
      endloop.
      if m_complex_type is initial.
        m_complex_type = 'N'.
      endif.
    endif.

*... (3) Apply sort
    call method me->apply_sort.

*... (4) Get grouplevels
    call method me->get_grouplevels.

*... (5) Apply filter
    if not m_cl_variant->mt_filter is initial.
      call method me->apply_filter.
    else.
      m_cl_variant->mt_grouplevels_filter = m_cl_variant->mt_grouplevels.
    endif.

*...  TERMINATING EXPORTS -> eXtended INTeraction of SAP-Query.
    if ( m_cl_variant->ms_layout-xidirect = 'X' ).
      call method me->export_to_xint.
      raise finished.
    endif.

    if ( not ( cl_gui_alv_grid=>offline( ) is initial )
         and m_view = mc_fc_view_crystal ).
      " template is in
* TODO
*      call method me->export_to_crbatch.
    endif.
  endif.

*<<<YI3K093293: fullscreen_mode set in set_table_of_first_display
* Sort and Filter of default layout have already been applied...
*... inform Fullscreen ALV for executing PF-STATUS to get SY-TITLE in CrystalReports
* must be removed because of side effects in status of 'old' fullscreen without bridge
*  if me->_fullscreen_mode eq abap_true.
*    raise event _before_refresh.
*  endif.
*>>>YI3K093293 and YI3K131843

*...inform Controller to apply Services
  if _is_bridge_active( ) = abap_true.
    macro_bridge_call_data.
    macro_bridge_method_name cl_gui_alv_grid refresh_table_display.
    macro_bridge_opt_parameter exporting: is_stable       is_stable,
                                          i_soft_refresh  i_soft_refresh.
    macro_bridge_exception: finished 1.
    try.
      macro_bridge_call.
    catch cx_salv_grx_nc_meth_exception.
      raise finished.
    endtry.
  endif.

*... (7) Create data table or display
  call method me->soft_refresh_table_display
    exporting
      is_stable = is_stable.

  if cl_gui_alv_grid=>offline( ) is initial.
    call method me->set_auto_redraw
      exporting
        enable = 1.
  endif.

endmethod.                    "refresh_table_display


method register_delayed_event.

  data: lt_events type cntl_simple_events,
        event type cntl_simple_event.

  if i_event_id eq mc_evt_delayed_change_select or
     i_event_id eq mc_evt_delayed_move_curr_cell.

    call method me->get_registered_events
                importing events = lt_events.

    event-eventid    = i_event_id.
    event-appl_event = m_appl_events.
    append event to lt_events.

    call method me->set_registered_events_internal
                exporting events = lt_events.
  else.
    raise error.
  endif.

endmethod.


method register_edit_event .

  data: lt_events type cntl_simple_events,
        event type cntl_simple_event.

  if i_event_id eq mc_evt_modified or
     i_event_id eq evt_enter.
    if i_event_id eq mc_evt_modified.
      m_cell_edit = 'X'.
    endif.

    call method me->get_registered_events
                importing events = lt_events.

    event-eventid    = i_event_id.
    event-appl_event = m_appl_events.
    append event to lt_events.

    call method me->set_registered_events_internal
                exporting events = lt_events.
  else.
    raise error.
  endif.

endmethod.


method register_f4_for_fields.

  mt_f4 = it_f4.

endmethod.


method REMOVE_BIDI_FLAGS.

  check CL_I18N_BIDI=>BIDI_CTRL_CODES_ACTIVE eq abap_true
    and not mt_bidi_flag is initial.

  field-symbols: <ls_cell> type lvc_s_moce.

  data: bidi type lvc_s_bidi_flag,
        filter type sap_bool,
        value type string.

  sort mt_bidi_flag by colpos.

  loop at it_cells assigning <ls_cell>.

    read table mt_bidi_flag into bidi binary search
            with key colpos = <ls_cell>-col_id.

    if sy-subrc eq 0.

      filter = CL_I18N_BIDI=>FILTER_BIDI_CTRL_CODES(
                im_ltr_flag     = bidi-ltr
                im_filter_flag  = bidi-filter ).

      if filter eq abap_true.
        value = <ls_cell>-value.
        call method CL_I18N_BIDI=>remove_BIDI_CTRL_CODES
            changing text = value.
        <ls_cell>-value = value.
      endif.

    endif.

  endloop.

endmethod.


method reprep_exit_check .

  types: begin of t_line,
           line(72) type c,
         end of t_line.

  data: lt_report type standard table of t_line.

  e_subrc = 0.
  exit.

* CLEAR E_SUBRC.

* SET EXTENDED CHECK OFF.  "Report wird Zwecks Existenzprüfung nachgel.

* READ REPORT 'RKKBRSTI' INTO LT_REPORT.

* SET EXTENDED CHECK ON.

* E_SUBRC = SY-SUBRC.

endmethod.


METHOD reprep_interface .

  FIELD-SYMBOLS: <tab1> TYPE STANDARD TABLE.

  DATA: ls_selfield       TYPE kkblo_selfield,
        lt_fieldcat_kkblo TYPE kkblo_t_fieldcat,
        ls_layout_kkblo   TYPE kkblo_layout,
        ls_reprep_id      TYPE kkblo_reprep_id,
        ls_others         TYPE kkblo_reprep,
        lflg_exit         TYPE c,
        l_dummy           TYPE syrepid,
        l_subrc           TYPE sy-subrc,
        l_ucomm           TYPE sy-ucomm.

*... Check Outtab
  ASSIGN mt_outtab->* TO <tab1>.
  IF NOT sy-subrc IS INITIAL.
    MESSAGE a534(0k).
  ENDIF.

* does report for external performs exist
  CALL METHOD me->reprep_exit_check
    IMPORTING
      e_subrc = l_subrc.
  CHECK l_subrc EQ 0.

* get selected cell information in kkblo format
  CALL METHOD me->selfield_get
    IMPORTING
      es_selfield_kkblo = ls_selfield.

  IF i_ucomm NE mc_fc_call_chain.
    IF l_subrc NE 0 OR m_reprep_for_sumline EQ 'N'.
      IF NOT ls_selfield-sumindex IS INITIAL OR
         NOT ls_selfield-endsum IS INITIAL.
        MESSAGE e039(0k).              " Cursor auf Nicht-Summenzeile
        EXIT.
      ELSE.
        MESSAGE e004(0k). " Cursor auf Listkörper positionieren
        EXIT.
      ENDIF.
    ENDIF.
  ENDIF.

  l_ucomm = i_ucomm+1.

  CALL FUNCTION 'LVC_TRANSFER_TO_KKBLO'
    EXPORTING
      it_fieldcat_lvc     = m_cl_variant->mt_fieldcatalog
      is_layout_lvc       = m_cl_variant->ms_layout
      is_reprep_lvc       = ms_reprep
      i_reprep_active_lvc = m_reprep_active
    IMPORTING
      et_fieldcat_kkblo   = lt_fieldcat_kkblo
      es_layout_kkblo     = ls_layout_kkblo
      es_reprep_id_kkblo  = ls_reprep_id.

  IF NOT ms_reprep-cb_frm_mod IS INITIAL.
    ls_others-callback_reprep_sel_modify = ms_reprep-cb_frm_mod.
    ls_others-callback_program           = ms_reprep-cb_repid.
  ENDIF.

  ls_others-reprep_id = ms_reprep-s_rprp_id.

*... >>> BEGIN SPECIAL SOLUTION
  IF m_reprep_for_sumline EQ 'X'.
    IF NOT ls_selfield-sumindex IS INITIAL OR
       NOT ls_selfield-endsum IS INITIAL.

      DATA: ls_row_id TYPE lvc_s_row,
            ls_col_id TYPE lvc_s_col,
            l_value   TYPE lvc_s_data-value.

      CALL METHOD me->get_current_cell
        IMPORTING
          es_row_id = ls_row_id
          es_col_id = ls_col_id.

      IF me->is_cache_valid( ) NE abap_true or www_active eq abap_true.

        CALL METHOD cl_gui_cfw=>flush.

      ENDIF.

      FIELD-SYMBOLS: <ls_fcat_kkblo> TYPE kkblo_fieldcat.

      DATA: l_table       TYPE lvc_tname.
      DATA: ls_grpl       TYPE lvc_s_grpl.
      DATA: ls_sort       TYPE lvc_s_sort.
      DATA: ls_fcat_kkblo TYPE kkblo_fieldcat.

      CASE ls_row_id-rowtype+0(1).
        WHEN 'S'.
          READ TABLE m_cl_variant->mt_grouplevels_filter
            INDEX ls_row_id-index INTO ls_grpl.
          IF sy-subrc EQ 0.
            CONCATENATE 'MT_CT' ls_grpl-collect '->*' INTO l_table.
            ASSIGN (l_table) TO <tab1>.
            ls_selfield-tabindex = ls_row_id-rowtype+7.
            SUBTRACT 1 FROM ls_selfield-tabindex.
            ADD ls_grpl-cindx_from TO ls_selfield-tabindex.
          ENDIF.

          LOOP AT m_cl_variant->mt_sort INTO ls_sort
            WHERE spos LE ls_grpl-level.
            READ TABLE lt_fieldcat_kkblo ASSIGNING <ls_fcat_kkblo>
              WITH KEY fieldname = ls_sort-fieldname.
            IF sy-subrc EQ 0.
              <ls_fcat_kkblo>-mark = 'Z'.
            ENDIF.
          ENDLOOP.
          DELETE lt_fieldcat_kkblo WHERE ( reprep    = 'X'
                                      OR key       = 'X'
                                      OR emphasize = 'K41' )
                                     AND mark NE 'Z'.
          ls_fcat_kkblo-mark = space.
          MODIFY lt_fieldcat_kkblo FROM ls_fcat_kkblo
            TRANSPORTING mark WHERE mark EQ 'Z'.

        WHEN 'T'.
      ENDCASE.
    ENDIF.
  ENDIF.
*... <<< END SPECIAL SOLUTION

  SET EXTENDED CHECK OFF.
  PERFORM reprep_interface IN PROGRAM bcalv_reprep_interface
          TABLES lt_fieldcat_kkblo
                 <tab1>
          USING  l_dummy
                 ls_selfield
                 ls_layout_kkblo
                 ls_others
                 l_ucomm
                 lflg_exit.
  SET EXTENDED CHECK ON.

  IF NOT lflg_exit IS INITIAL.
    SET SCREEN 0.
    LEAVE SCREEN.
  ENDIF.

ENDMETHOD.


method reprep_stack_check .

  data: l_dummy type syrepid,
        ls_others type kkblo_reprep,
        l_subrc type sy-subrc.

*... Initialization
  clear e_called.

  call function 'LVC_TRANSFER_TO_KKBLO'
       exporting
            is_reprep_lvc      = is_reprep
       importing
            es_reprep_id_kkblo = ls_others-reprep_id.

  perform rsti_stack_initialized in program bcalv_reprep_interface
                                 using l_dummy
                                       ls_others
                                       l_subrc.
  if l_subrc eq 0.
    e_called = 'X'.
  endif.

endmethod.


method reprep_trsti_check .

  data: ls_others type kkblo_reprep,
        l_dummy type syrepid.

  call function 'LVC_TRANSFER_TO_KKBLO'
       exporting
            is_reprep_lvc      = is_reprep
       importing
            es_reprep_id_kkblo = ls_others-reprep_id.

  perform reprep_trsti_check in program bcalv_reprep_interface
                             tables et_fccls
                              using l_dummy
                                    ls_others
                                    e_subrc.

endmethod.


method SALV_AT_SOFT_REFRESH.
  if cl_salv_veri_run=>on eq cl_salv_veri_run=>c_runtime.
    data: lt_fcat type if_salv_veri_types=>G_TY_T_LVC_FCAT.
    data: lt_sort type if_salv_veri_types=>G_TY_T_LVC_SORT.
    data: lt_filt type if_salv_veri_types=>G_TY_T_LVC_FILT.
    data: lt_data type if_salv_veri_types=>G_TY_T_LVC_DATA.
    data: lt_info type if_salv_veri_types=>G_TY_T_LVC_INFO.
    data: boolean type sap_bool.

    field-symbols: <xstring> type xstring.
    field-symbols: <string> type string.

    boolean = cl_salv_veri_run=>is_point_in_time_xy(
                    x = cl_salv_veri_run=>x_soft_refresh_table_display
                    y = cl_salv_veri_run=>y_alv_grid ).
    if boolean eq if_salv_c_bool_sap=>true.
*  and cl_salv_veri_run=>point_in_time_x eq CL_SALV_VERI_RUN=>X_SOFT_REFRESH_TABLE_DISPLAY
*  and cl_salv_veri_run=>point_in_time_y eq CL_SALV_VERI_RUN=>Y_ALV_GRID.
      data: lt_ref type IF_SALV_VERI_TYPES=>G_TYPE_T_DATAREF.
      data: ls_ref type IF_SALV_VERI_TYPES=>G_TYPE_S_DATAREF.
      lt_fcat[] = m_cl_variant->mt_fieldcatalog[].
      get reference of lt_fcat into ls_ref-ref.
      ls_ref-ref_type = IF_SALV_C_VERI_DATAREF_TYPE=>C_LVC_FIELDCATALOG.
      append ls_ref to lt_ref.
      lt_sort[] = m_cl_variant->mt_sort[].
      get reference of lt_sort into ls_ref-ref.
      ls_ref-ref_type = IF_SALV_C_VERI_DATAREF_TYPE=>C_LVC_SORT.
      append ls_ref to lt_ref.
      lt_filt[] = m_cl_variant->mt_filter[].
      get reference of lt_filt into ls_ref-ref.
      ls_ref-ref_type = IF_SALV_C_VERI_DATAREF_TYPE=>C_LVC_FILTER.
      append ls_ref to lt_ref.
*      create data ls_ref-ref type xstring.
*      assign ls_ref-ref->* to <xstring>.
*      call transformation id source xcontent = m_cl_variant->ms_layout
*                                    result xml <xstring>.
*      cl_salv_veri_run=>clean_xml( changing serial = <xstring> ).
      create data ls_ref-ref type string.
      assign ls_ref-ref->* to <string>.
      call transformation id source xcontent = m_cl_variant->ms_layout
                                    result xml <string>.
      cl_salv_veri_run=>clean_xml( changing serial = <string> ).
*      get reference of gt_stack-is_layout into ls_ref-ref.
      ls_ref-ref_type = if_salv_c_veri_dataref_type=>c_lvc_layout.
      append ls_ref to lt_ref.
      lt_data[] = me->mt_data[].
      get reference of lt_data[] into ls_ref-ref.
      ls_ref-ref_type = IF_SALV_C_VERI_DATAREF_TYPE=>C_LVC_DATA.
      append ls_ref to lt_ref.
      lt_info[] = me->mt_info[].
      get reference of lt_info[] into ls_ref-ref.
      ls_ref-ref_type = IF_SALV_C_VERI_DATAREF_TYPE=>C_LVC_INFO.
      append ls_ref to lt_ref.
      cl_salv_veri_run=>save(
        t_ref           = lt_ref
        point_in_time_x = cl_salv_veri_run=>x_soft_refresh_table_display
        point_in_time_y = cl_salv_veri_run=>y_alv_grid ).
      set screen 0.
      leave screen.
    endif.
  endif.
endmethod.


method SALV_AT_TOOLBAR .
  data: ls_status type if_salv_veri_types=>g_type_s_toolbar.
  data: boolean type sap_bool.

  if cl_salv_veri_run=>on eq cl_salv_veri_run=>c_runtime.
    boolean = cl_salv_veri_run=>is_point_in_time_xy(
                    x = cl_salv_veri_run=>x_functions
                    y = cl_salv_veri_run=>y_alv_grid ).
    if boolean eq if_salv_c_bool_sap=>true.
      data: lt_ref type IF_SALV_VERI_TYPES=>G_TYPE_T_DATAREF.
      data: ls_ref type IF_SALV_VERI_TYPES=>G_TYPE_S_DATAREF.
      ls_status-toolbar[] = mt_toolbar[].
      ls_status-toolbar_excluding = mt_excluding_toolbar[].
      get reference of ls_status into ls_ref-ref.
      ls_ref-ref_type = IF_SALV_C_VERI_DATAREF_TYPE=>C_LVC_TOOLBAR.
      append ls_ref to lt_ref.
      cl_salv_veri_run=>save(
        t_ref           = lt_ref
        point_in_time_x = cl_salv_veri_run=>x_functions
        point_in_time_y = cl_salv_veri_run=>y_alv_grid ).
      set screen 0.
      leave screen.
    endif.
  endif.
endmethod.


method save_data.

  field-symbols: <tab1>         type standard table,
                 <tab2>         type standard table,
                 <ls_wa>        type any,
                 <ls_wa1>       type any,
                 <l_field>      type any,
                 <l_field_from> type any.

  data: lt_cells       type lvc_t_moce,
        lt_mod_cells   type lvc_t_modi,
        ls_mod_cells   type lvc_s_modi,
        ls_mod_cells2  type lvc_s_modi,
        ls_bad_cells   type lvc_s_modi,
        lt_good_cells  type lvc_t_modi,
        ls_good_cells  type lvc_s_modi,
        ls_delta_cells type lvc_s_modi.

  data: lt_deleted_rows  type lvc_t_moce,
        ls_deleted_rows  type lvc_s_moce,
        lt_inserted_rows type lvc_t_moce,
        ls_inserted_rows type lvc_s_moce,
        begin of ls_bad_inserted_rows,
          frontorder       type sy-tabix,
          row_id_old       type sy-tabix.
  include          type lvc_s_moce.
  data:   lt_bad_ins_cells type lvc_t_moce,
        end of ls_bad_inserted_rows,
        lt_bad_inserted_rows like table of ls_bad_inserted_rows,
        ls_bad_ins_cells type lvc_s_moce.

  data: ls_msg type lvc_s_msg1,
        lt_err type lvc_t_err,
        ls_err type lvc_s_err.

  data: l_subrc  type sy-subrc,
        l_tabix  type sy-tabix,
        l_tabix2 type sy-tabix,
        l_index  type sy-tabix,
        l_lines  type sy-tabix.

  data: l_modified type i,
        l_mod(1) type c.

  data: l_refresh_required type char01,
        l_refresh          type char01.

  data: lp_wa type ref to data.
  data: lp_tab type ref to data.
  data: lflg_order_changed type i.
  data: ls_unit_value type lvc_s_deps.
  data: l_fieldname type lvc_fname.
  data: ls_fieldcat type lvc_s_fcat.
  data: lt_style type lvc_t_styl,
        ls_style type lvc_s_styl.
  data: ls_row_no type lvc_s_roid.
  data: lflg_adjust type c.
  data: lflg_bad_inserted type c.

  m_invalid_input = ' '.
*... Check if Save is allowed
  if m_disable_save eq 'X'.
    raise save_not_allowed.
  endif.

*... Check if grid was modified
  call method get_grid_modified importing modified = l_modified.

  if mt_col_pos_id_table[] is initial.
    call method get_frontend_fieldcatalog.
  endif.

  IF me->is_cache_valid( ) NE abap_true or www_active eq abap_true.

    CALL METHOD cl_gui_cfw=>flush.

  ENDIF.

  if not l_modified is initial.
    l_mod = 'X'.
  endif.

  if l_modified is initial and i_f4 is initial.
    call method me->refresh_mode_decision
                exporting it_good_cells = lt_good_cells
                          i_refresh     = c_refresh
                          i_modified    = l_mod.
    c_refresh = space.
    exit.
  endif.

*... Check Outtab
  assign mt_outtab->* to <tab1>.
  if not sy-subrc is initial.
    message a534(0k).
  endif.

*... Assign workarea
  create data lp_wa like line of <tab1>.
  assign lp_wa->* to <ls_wa>.

*... Create copy of data table
  create data lp_tab like <tab1>.
  assign lp_tab->* to <tab2>.

*... Get information about row order changed
  call method me->get_rows_moved importing moved = lflg_order_changed.

*... Get table of modified cells from frontend
  call method me->get_modified_cells importing cell_table = lt_cells.

  call method me->remove_bidi_flags
      changing it_cells = lt_cells.

*... Get actual sort order from frontend
  call method me->get_row_id importing row_id_table = mt_roid_front.

*  IF me->is_cache_valid( ) NE abap_true.

    CALL METHOD cl_gui_cfw=>flush.

*  ENDIF.

*... Clear message protocol
  clear mt_msg.

  call method me->split_good_and_bad
              exporting it_cells           = lt_cells
              importing et_mod_cells       = lt_mod_cells
                        et_good_cells      = lt_good_cells
                        et_deleted_rows    = lt_deleted_rows
                        et_inserted_rows   = lt_inserted_rows
                        e_refresh          = l_refresh
                        eflg_invalid       = m_invalid_input
              changing  ct_tab2            = <tab2>.

  delete lt_good_cells where error = 'X'.

*RAL protocolling changed fields in external value
  if me->m_cl_sral is bound.
    try.
     me->m_cl_sral->confirm_edit( exporting it_data_int = lt_mod_cells   "intern
                                            it_data_ext = lt_cells         "extern
                                            it_col_pos  = mt_col_pos_id_table  "column positions at frontend
                                            iv_step     = if_sral_rt_ctrl_alvgrid_dynp=>co_step-input ).
     catch cx_sral.
    endtry.
  endif.

*... Initialize protocol object
  if mr_data_changed is initial.
    if not ( mr_applog_container is initial ).
      create object mr_data_changed
                     exporting i_container   = mr_applog_container
                               i_calling_alv = me.
    else.
      create object mr_data_changed exporting i_calling_alv = me.
    endif.
    set handler on_close_obj for mr_data_changed.
  else.
    call method mr_data_changed->refresh_protocol.
  endif.

  mr_data_changed->mt_fieldcatalog  = m_cl_variant->mt_fieldcatalog.
  mr_data_changed->mt_mod_cells     = lt_mod_cells.
  mr_data_changed->mt_roid_front    = mt_roid_front.
  mr_data_changed->ms_layout        = m_cl_variant->ms_layout.
  mr_data_changed->mp_mod_rows      = lp_tab.
  mr_data_changed->mt_good_cells    = lt_good_cells.
  mr_data_changed->mt_deleted_rows  = lt_deleted_rows.
  mr_data_changed->mt_inserted_rows = lt_inserted_rows.

  loop at mt_msg into ls_msg.
    call method mr_data_changed->add_protocol_entry
                exporting i_msgid     = ls_msg-msgid
                          i_msgty     = ls_msg-msgty
                          i_msgno     = ls_msg-msgno
                          i_msgv1     = ls_msg-msgv1
                          i_msgv2     = ls_msg-msgv2
                          i_msgv3     = ls_msg-msgv3
                          i_msgv4     = ls_msg-msgv4
                          i_fieldname = ls_msg-fieldname
                          i_row_id    = ls_msg-row_id.
  endloop.

  sort mr_data_changed->mt_good_cells stable by tabix.     "Y7AK099873

*... Raise data_changed event for semantic checks
*... Trace?
  if not mr_trace is initial.
    call method mr_trace->add_trace_item
      exporting
        i_trace_item = 'EVENT: DATA_CHANGED'
        ir_variant   = m_cl_variant
        it_data      = mt_data
        it_info      = mt_info.
  endif.

  m_save_in_process = 'X'.
  raise event data_changed exporting er_data_changed = mr_data_changed
                                     e_onf4          = i_f4
                                     e_onf4_before   = i_f4_before
                                     e_onf4_after    = i_f4_after
                                     e_ucomm         = m_ucomm.
  m_save_in_process = ' '.
*... if inserted lines were modified via method set_delta_cells
*    then changes have to be made to mt_mod_cells and mt_good_cells
  loop at me->mt_delta_cells_inserted into ls_delta_cells.
    read table mr_data_changed->mt_good_cells into ls_good_cells
               with key row_id    = ls_delta_cells-row_id
                        fieldname = ls_delta_cells-fieldname.
    if sy-subrc eq 0.
      delete mr_data_changed->mt_good_cells index sy-tabix.
    endif.
    read table mr_data_changed->mt_mod_cells into ls_mod_cells
               with key row_id    = ls_delta_cells-row_id
                        fieldname = ls_delta_cells-fieldname.
    if sy-subrc eq 0.
      ls_mod_cells-value = ls_delta_cells-value.
      modify mr_data_changed->mt_mod_cells
             from ls_mod_cells index sy-tabix.
    endif.
  endloop.


  SORT mr_data_changed->mt_good_cells BY row_id sub_row_id fieldname. "2547663 2006
  SORT mr_data_changed->mt_mod_cells BY row_id sub_row_id fieldname.  "2547663 2006

  data: lt_conversion type lvc_t_roid.
  data: ls_conversion type lvc_s_roid.
  DATA: l_tabix3 TYPE sy-tabix.  "2547663 2006

*... Copy good cells into original internal table
  loop at mr_data_changed->mt_mod_cells into ls_mod_cells2.

* >>>>2547663 2006
    READ TABLE mr_data_changed->mt_good_cells TRANSPORTING NO FIELDS
            with key row_id = ls_mod_cells2-row_id
                  sub_row_id = ls_mod_cells2-sub_row_id
                  fieldname = ls_mod_cells2-fieldname
                  BINARY search.
    l_tabix3 = sy-tabix.

    IF sy-subrc EQ 0.
      LOOP AT mr_data_changed->mt_good_cells INTO ls_good_cells FROM l_tabix3.

        IF NOT ( ls_good_cells-row_id     = ls_mod_cells2-row_id AND
                 ls_good_cells-sub_row_id = ls_mod_cells2-sub_row_id AND
                 ls_good_cells-fieldname  = ls_mod_cells2-fieldname ).
          EXIT.
        ENDIF.
* <<<<<<2547663 2006

      l_tabix2 = sy-tabix.

      if l_index ne ls_good_cells-tabix.
        clear lflg_adjust.

*... Read data copy to which new info is to be added
        read table <tab2> into <ls_wa> index ls_good_cells-tabix.
        read table <tab1> index ls_good_cells-row_id assigning <ls_wa1>.
        l_subrc = sy-subrc.

        if l_subrc ne 0.
*... This Row does not exist in the data table -> append to output table
          read table mr_data_changed->mt_protocol into ls_msg
                     with key msgty  = 'E'
                              row_id = ls_good_cells-row_id.
          if sy-subrc eq 0.
            assign component ls_msg-fieldname
                             of structure <ls_wa> to <l_field>.
            if sy-subrc ne 0.
              message x000(0k).
            endif.
            clear <l_field>.
          endif.
          append <ls_wa> to <tab1>.

          l_tabix = sy-tabix.

*... Read the original rowID from frontend table
          read table mt_roid_front into ls_row_no
                     with key row_id = ls_good_cells-row_id.
          if sy-subrc ne 0.
            message x000(0k).
          endif.

*... Adjust the automatically generated ID from Backend ID
          ls_conversion-row_id = ls_row_no-row_id.
          ls_row_no-row_id = l_tabix.
          modify mt_roid_front from ls_row_no index sy-tabix.

          read table lt_conversion
                          with key row_id = ls_conversion-row_id
                                   sub_row_id = l_tabix
                     transporting no fields.
          if sy-subrc ne 0.
            ls_conversion-sub_row_id = l_tabix.
            append ls_conversion to lt_conversion.
          endif.

          ls_good_cells-row_id = l_tabix.
          modify mr_data_changed->mt_good_cells
                 from ls_good_cells index l_tabix2.

          lflg_adjust = 'X'.
        endif.
      else.
*... Adjust the automatically generated ID from Backend ID
        if lflg_adjust eq 'X'.
          ls_good_cells-row_id = l_tabix.
          modify mr_data_changed->mt_good_cells
                 from ls_good_cells index l_tabix2.

        endif.
      endif.

      if l_subrc eq 0.
*... This Row exists in the data table -> modify data record only
        assign component ls_good_cells-fieldname of structure
              <ls_wa> to <l_field_from>.
        assign component ls_good_cells-fieldname of structure
              <ls_wa1> to <l_field>.
        <l_field> = <l_field_from>.
        if not m_cl_variant->ms_layout-stylefname is initial.
          assign component m_cl_variant->ms_layout-stylefname
                           of structure <ls_wa> to <l_field_from>.
          assign component m_cl_variant->ms_layout-stylefname
                           of structure <ls_wa1> to <l_field>.
          <l_field> = <l_field_from>.
        endif.

      endif.

      l_index = ls_good_cells-tabix.
    endloop.

    ELSE. "2547663 2006

      data: l_row_id type sy-tabix.
      check l_row_id ne ls_mod_cells2-row_id.
      data: l_row_id_save type sy-tabix.
      l_row_id_save = ls_mod_cells2-row_id.

      read table lt_inserted_rows
                 with key row_id = ls_mod_cells2-row_id
                 transporting no fields.

      if sy-subrc eq 0.
        read table lt_conversion into ls_conversion
                        with key row_id = ls_mod_cells2-row_id.
        if sy-subrc = 0.
          read table <tab1> index
             ls_conversion-sub_row_id assigning <ls_wa1>.
        else.
          read table <tab1> index
             ls_mod_cells2-row_id assigning <ls_wa1>.
        endif.
        if sy-subrc eq 0.
*... This Row exists in the data table -> modify data record only
          assign component ls_mod_cells2-fieldname of structure
                <ls_wa> to <l_field_from>.
          assign component ls_mod_cells2-fieldname of structure
                <ls_wa1> to <l_field>.
          <l_field> = <l_field_from>.
          if not m_cl_variant->ms_layout-stylefname is initial.
            assign component m_cl_variant->ms_layout-stylefname
                             of structure <ls_wa> to <l_field_from>.
            assign component m_cl_variant->ms_layout-stylefname
                             of structure <ls_wa1> to <l_field>.
            <l_field> = <l_field_from>.
          endif.
        else.
*... This Row does not exist in the data table -> append to output table
          clear <ls_wa>.
          append <ls_wa> to <tab1>.
        endif.
      endif.
      l_row_id = ls_mod_cells2-row_id.
    endif.
  endloop.

  call method me->delta_refresh
         exporting
           it_good_cells      = mr_data_changed->mt_good_cells
           iflg_order_changed = lflg_order_changed
         importing
            eflg_full_refresh = m_full
         changing
            ct_conversion     = lt_conversion
            ct_deleted_rows   = lt_deleted_rows.

*... Protocol handling
  describe table mr_data_changed->mt_protocol lines l_lines.
  if l_lines = 0.
    call method mr_data_changed->free.
    clear mr_data_changed.
    call method set_error_cells exporting cell_table = lt_err.
  else.
*... Display protocol
    data: l_visible type i.
    call method mr_data_changed->protocol_is_visible
                importing visible = l_visible.
    if m_display_protocol eq 'X' and
                  ( i_f4 is initial or l_visible = 1 ).
      data l_msglines type int4.
      describe table mt_msg lines l_msglines.
*      if ( www_active = 'X'           "Nach Auskuft Klaus Layer nicht mehr notwendig
*          and l_msglines > 0
*          and mr_applog_container is initial ).
*        message x000(0k) with
*        'Application Error:'
*        'No amodal container provided in SAPGui for HTML'.
*                                                            "#EC NOTEXT
*      endif.
      call method mr_data_changed->display_protocol.
    endif.

*... Color error cells
    loop at mr_data_changed->mt_protocol into ls_msg.
      ls_err-row_id = ls_msg-row_id.

      read table m_cl_variant->mt_fieldcatalog into ls_fieldcat
                 with key fieldname = ls_msg-fieldname.
      if sy-subrc ne 0.
        message x000(0k).
      endif.
      ls_err-col_id = ls_fieldcat-col_id.

      case ls_msg-msgty.
        when 'E' or 'A'.
          m_invalid_input = 'X'.
          ls_msg-msgty = 'E'.
          ls_err-type  = 0.
          read table lt_mod_cells into ls_mod_cells
                     with key row_id    = ls_err-row_id
                              fieldname = ls_fieldcat-fieldname.

          if sy-subrc eq 0.
            ls_bad_cells-row_id    = ls_mod_cells-row_id.
            ls_bad_cells-fieldname = ls_mod_cells-fieldname.
            ls_bad_cells-value     = ls_mod_cells-value.
            append ls_bad_cells to et_bad_cells.
          endif.
        when 'W'.
          ls_err-type  = 1.
        when others.
          ls_err-type  = 2.
      endcase.
      append ls_err to lt_err.
    endloop.

    if i_f4 is initial or l_visible = 1.
      sort lt_err by TYPE descending.
      call method set_error_cells exporting cell_table = lt_err.
*     Set handler for hotspot events
      if not mr_data_changed->mr_protocol is initial.
        set handler on_hotspot_click for mr_data_changed->mr_protocol
                                       activation space.
        set handler on_hotspot_click for mr_data_changed->mr_protocol.
      endif.
    endif.
  endif.

  describe table <tab1> lines l_lines.
  call method set_highest_row_id exporting row_id = l_lines.

*... Refresh notwendig? Eventuell Refresh ausführen
  if m_invalid_input eq 'X'.
    raise invalid_input.
  else.
    call method me->check_refresh_required
                exporting it_cells = lt_good_cells
                importing e_yes    = l_refresh_required.

    l_refresh = c_refresh.

    if l_refresh_required eq space and l_refresh eq 'X'.
      clear l_refresh.
    endif.

    call method me->refresh_mode_decision
                exporting it_good_cells = lt_good_cells
                          i_refresh     = l_refresh
                          i_modified    = l_mod.

    if l_refresh_required eq 'X' and c_refresh eq space.
      c_refresh = 'X'.
    else.
      c_refresh = space.
    endif.
  endif.

endmethod.


method save_grid_variants_simul.

  if m_cl_variant is initial.
    create object m_cl_variant
        exporting
           it_outtab             = mt_outtab
           it_fieldcatalog       = m_cl_variant->mt_fieldcatalog
           it_sort               = m_cl_variant->mt_sort
           it_filter             = m_cl_variant->mt_filter
           it_grouplevels_filter = m_cl_variant->mt_grouplevels_filter
           is_variant            = m_cl_variant->ms_variant
           i_variant_save        = m_cl_variant->m_variant_save
           i_variant_default     = m_cl_variant->m_variant_default
           is_print              = m_cl_variant->ms_print
           ir_salv_adapter       = me->r_salv_adapter
           i_fcat_complete       = m_fcat_complete.
  endif.

  call method m_cl_variant->save_grid_variants_simul
    exporting
      it_grids = it_grids.

endmethod.


method save_variant.

  if _is_bridge_active( ) = abap_true.
    macro_bridge_call_data.
    macro_bridge_method_name cl_gui_alv_grid save_variant.
    macro_bridge_opt_parameter: exporting i_dialog i_dialog,
                                importing e_exit   e_exit.
    macro_bridge_call.
    exit.
  endif.

  data: ls_varkey type ltdxkey,
        l_dialog  type char1.

*... Initialization
  l_dialog = i_dialog.

  if m_cl_variant is initial.
    create object m_cl_variant
           exporting
             it_outtab             = mt_outtab
             it_fieldcatalog       = m_cl_variant->mt_fieldcatalog
             it_sort               = m_cl_variant->mt_sort
             it_filter             = m_cl_variant->mt_filter
          it_grouplevels_filter = m_cl_variant->mt_grouplevels_filter
             is_variant            = m_cl_variant->ms_variant
             is_layout             = m_cl_variant->ms_layout
             i_variant_save        = m_cl_variant->m_variant_save
             i_variant_default     = m_cl_variant->m_variant_default
             i_www_active          = m_www
             is_print              = m_cl_variant->ms_print
             ir_salv_adapter       = me->r_salv_adapter
             i_fcat_complete       = m_fcat_complete.
  else.
    call method m_cl_variant->set_values
      exporting
        it_outtab    = mt_outtab
        i_www_active = m_www.
  endif.

*==================== VARIANTEN DUNKEL =================================
  data: ls_save type lvc_s_save.

  read table m_cl_variant->mt_grid_variants_save into ls_save
             with key grid   = me
                      active = 'X'.
  if sy-subrc eq 0.
    m_cl_variant->ms_grid_variant_save = ls_save-variant.
    l_dialog = ls_save-dialog.
  else.
    clear m_cl_variant->ms_grid_variant_save.
  endif.
*==================== VARIANTEN DUNKEL =================================

  call method m_cl_variant->save_variant
    exporting
      i_bypassing_buffer = m_bypassing_buffer
      i_buffer_active    = m_buffer_active
      i_dialog           = l_dialog
    importing
      e_exit             = e_exit.

  check e_exit eq space.

  call method set_frontend_fieldcatalog    "col_id geändert
     exporting
       it_fieldcatalog = m_cl_variant->mt_fieldcatalog.

  call method refresh_table_display.

endmethod.


method save_variant_dark.

  if m_cl_variant is initial.
    create object m_cl_variant
        exporting
           it_outtab             = mt_outtab
           it_fieldcatalog       = m_cl_variant->mt_fieldcatalog
           it_sort               = m_cl_variant->mt_sort
           it_filter             = m_cl_variant->mt_filter
           it_grouplevels_filter = m_cl_variant->mt_grouplevels_filter
           is_variant            = m_cl_variant->ms_variant
           i_variant_save        = m_cl_variant->m_variant_save
           i_variant_default     = m_cl_variant->m_variant_default
           is_print              = m_cl_variant->ms_print
           ir_salv_adapter       = me->r_salv_adapter
           i_fcat_complete       = m_fcat_complete.
  endif.

  call method m_cl_variant->save_variant_dark
    exporting
      is_variant = is_variant
      i_active   = i_active.

endmethod.


METHOD search .

  TYPES: BEGIN OF lty_data.
  INCLUDE TYPE lvc_s_data.
  TYPES:   fdpos TYPE syfdpos,
         END OF lty_data.

  DATA: ls_data TYPE lvc_s_data,
        ls_row_id TYPE lvc_s_row,
*        LS_INFO TYPE LVC_S_COLL,
        ls_info TYPE lvc_s_info,
        l_data_col_count TYPE i,
        ls_col_id TYPE lvc_s_col,
        lt_index_columns TYPE lvc_t_col,
        lt_index_columns_wa TYPE LINE OF lvc_t_col,
        l_reset_selected_cols TYPE c,
        lt_col_pos TYPE lvc_t_coll,
        lt_col_pos_wa TYPE LINE OF lvc_t_coll,
        lt_data TYPE STANDARD TABLE OF lty_data,
        ls_data_ext TYPE lty_data,
        l_search_order,
        l_search_order_save,
        l_sav_col_pos TYPE lvc_s_data-col_pos,
        l_sav_row_pos TYPE lvc_s_data-row_pos,
        bool,
        l_lines TYPE i,
        i TYPE i,
        l_length TYPE i,
        l_value TYPE lvc_s_data-value,
        l_search_value TYPE lvc_s_data-value,
        l_offset TYPE i,
        l_end_pos TYPE i,
        l_start_pos TYPE i,
        l_flg_first_time,
        l_flg_search_order_changed,
        BEGIN OF lt_col_wa,
          col_pos TYPE lvc_s_coll-col_pos,
          fieldname TYPE lvc_s_col-fieldname,
        END   OF lt_col_wa,
        lt_col LIKE STANDARD TABLE OF lt_col_wa,
        l_string TYPE sval-value.

  DATA: l_lin TYPE i.
  DESCRIBE TABLE mt_data LINES l_lin.

  IF l_lin NE 0.                                            "B5AK000316
    CALL METHOD lvc_table_fill
      EXPORTING
        firstline = 1
        lastline  = l_lin.
  ELSE.                                                     "B5AK000316
  ENDIF.                                                    "B5AK000316


  CALL METHOD me->get_selected_columns
    IMPORTING
      et_index_columns = lt_index_columns.

  CALL METHOD me->get_current_cell
    IMPORTING
      e_row     = l_sav_row_pos
      es_row_id = ls_row_id
      e_col     = l_sav_col_pos
      es_col_id = ls_col_id
      e_value   = l_search_value.

  CALL METHOD me->get_col_pos_id_base
    IMPORTING
      col_pos_table = lt_col_pos.

  IF me->is_cache_valid( ) NE abap_true or www_active eq abap_true.

    CALL METHOD cl_gui_cfw=>flush.

  ENDIF.

  DESCRIBE TABLE mt_info LINES l_data_col_count.
  ADD 1 TO l_data_col_count.

*... Wertuebernahme nur bei echter Zellenauswahl
  IF ls_row_id-index EQ 0 OR ls_row_id-index EQ space.
    CLEAR l_search_value.
  ENDIF.

*... Wertuebernahme nur bei Aufruf über Kontextmenu
  IF m_eventid NE me->evt_context_menu_selected.
    CLEAR l_search_value.
  ENDIF.

*... Bestimmung der zu durchsuchenden Spalten
  DESCRIBE TABLE lt_index_columns LINES l_lines.
  IF l_lines EQ 0.
    IF ls_col_id-fieldname IS INITIAL.
      LOOP AT lt_col_pos INTO lt_col_pos_wa.
        MOVE lt_col_pos_wa-col_id TO lt_index_columns_wa.
        APPEND lt_index_columns_wa TO lt_index_columns.
      ENDLOOP.
    ELSE.
      MOVE ls_col_id TO lt_index_columns_wa.
      APPEND lt_index_columns_wa TO lt_index_columns.
    ENDIF.
    CALL METHOD me->set_selected_columns_base
      EXPORTING
        col_table = lt_index_columns.
    l_reset_selected_cols = 'X'.
  ENDIF.

*... ermittle Grid-Position der zu durchsuchenden spalten
*    bei der letzten Ausgabe
  LOOP AT lt_index_columns INTO lt_index_columns_wa.
    READ TABLE mt_info INTO ls_info
               WITH KEY fieldname = lt_index_columns_wa-fieldname.
    IF sy-subrc EQ 0.
      CLEAR  lt_col_wa.
      MOVE ls_info-col_pos TO lt_col_wa-col_pos.
      MOVE lt_index_columns_wa-fieldname TO lt_col_wa-fieldname.
      APPEND lt_col_wa TO lt_col.
    ENDIF.
  ENDLOOP.

  DO.
    CALL FUNCTION 'ALV_POPUP_TO_SEARCH'
      IMPORTING
        e_cancelled    = bool
      CHANGING
        c_string       = l_search_value
        c_search_order = l_search_order.
*... Cancelled
    IF bool NE space.
      EXIT.
    ENDIF.

    IF l_search_value EQ space.
      EXIT.
    ELSE.
      IF l_string NE l_search_value.
        i                = 0.
        l_flg_first_time = 'X'.
        CLEAR lt_data[].
        l_string         = l_search_value.
        l_length         = STRLEN( l_string ).
      ELSE.
        IF l_search_order NE l_search_order_save.
*         Suchreihenfolge geändert
          l_flg_search_order_changed = 'X'.
          l_search_order_save        = l_search_order.
        ENDIF.
      ENDIF.
    ENDIF.

    IF l_flg_first_time EQ 'X'.
      l_flg_first_time = space.
*... Suche Fundstellen
      LOOP AT mt_data INTO ls_data.
        IF ls_data-value CS l_string.
          CLEAR ls_data_ext.
          l_value = ls_data-value.
          SHIFT l_value LEFT DELETING LEADING space.

          SEARCH l_value  FOR l_string.
          IF sy-subrc EQ 0.
            ls_data_ext-fdpos = sy-fdpos.
          ENDIF.

          MOVE-CORRESPONDING ls_data TO ls_data_ext.
          ls_data_ext-row_pos =
             ( ( sy-tabix - 1 ) DIV l_data_col_count ) + 1.
          ls_data_ext-col_pos =
             ( sy-tabix - 1 ) MOD l_data_col_count.
          APPEND ls_data_ext TO lt_data.
        ENDIF.
      ENDLOOP.

*... Bereinige Fundstellen (nur zu durchsuchende Spalten relevant)
      LOOP AT lt_data INTO ls_data_ext.
        READ TABLE lt_col INTO lt_col_wa
                   WITH KEY col_pos = ls_data_ext-col_pos.
        IF sy-subrc NE 0.
          DELETE lt_data.
        ELSE.
*         ermittle neue Positionierung im Grid
          READ TABLE lt_col_pos INTO lt_col_pos_wa
                     WITH KEY col_id-fieldname = lt_col_wa-fieldname.
          IF sy-subrc EQ 0.
            MOVE lt_col_pos_wa-col_pos TO ls_data_ext-col_pos.
            MODIFY lt_data FROM ls_data_ext.
          ELSE.
          ENDIF.
        ENDIF.
      ENDLOOP.

*     wenn nichts gefunden, dann tschüss
      DESCRIBE TABLE lt_data LINES l_lines.
      IF l_lines EQ 0.
        MESSAGE i065(0k) WITH l_string.
        EXIT.
      ENDIF.

*     bestimme Reihenfolge der Fundstellen
      IF l_search_order EQ space.
*       Suchen in Zeilen
        SORT lt_data BY row_pos ASCENDING col_pos ASCENDING.
      ELSE.
*       Suchen in Spalten
        SORT lt_data BY col_pos ASCENDING row_pos ASCENDING.
      ENDIF.

      READ TABLE lt_data WITH KEY col_pos = l_sav_col_pos
                                  row_pos = l_sav_row_pos
                         INTO ls_data_ext BINARY SEARCH.
      CASE sy-subrc.
        WHEN 0.
          i = sy-tabix - 1.
        WHEN 4.
          i = sy-tabix - 1.
        WHEN OTHERS.
          i = 0.
      ENDCASE.
    ENDIF.

*   Suchreihenfolge geändert
    IF l_flg_search_order_changed EQ 'X'.
      l_flg_search_order_changed = space.
*     bestimme Reihenfolge der Fundstellen
      IF l_search_order EQ space.
*       Suchen in Zeilen
        SORT lt_data BY row_pos ASCENDING col_pos ASCENDING.
      ELSE.
*       Suchen in Spalten
        SORT lt_data BY col_pos ASCENDING row_pos ASCENDING.
      ENDIF.
      READ TABLE lt_data WITH KEY col_pos = l_sav_col_pos
                                  row_pos = l_sav_row_pos
                              INTO ls_data_ext BINARY SEARCH.
      CASE sy-subrc.
        WHEN 0.
          i = sy-tabix - 1.
        WHEN 4.
          i = sy-tabix - 1.
        WHEN OTHERS.
          i = 0.
      ENDCASE.
    ENDIF.

* positioniere im Grid
    ADD 1 TO i.
    READ TABLE lt_data INTO ls_data_ext INDEX i.
    IF sy-subrc EQ 0.
      l_sav_row_pos = ls_data_ext-row_pos.
      l_sav_col_pos = ls_data_ext-col_pos.
      l_start_pos   = ls_data_ext-fdpos + 1.
      l_end_pos     = l_start_pos + l_length - 1.
      CALL METHOD me->set_current_cell
        EXPORTING
          i_start_position = l_start_pos
          i_end_position   = l_end_pos
          i_row            = ls_data_ext-row_pos
          i_column         = ls_data_ext-col_pos.
      IF me->is_cache_valid( ) NE abap_true or www_active eq abap_true.

        CALL METHOD cl_gui_cfw=>flush.

      ENDIF.
      l_offset = ls_data_ext-fdpos + l_length.
      l_value  = ls_data_ext-value.
      SHIFT l_value LEFT DELETING LEADING space.
      SHIFT l_value BY l_offset PLACES.
      SEARCH l_value FOR l_string.
      IF sy-subrc = 0.
*       Weiterer Treffer gefunden
        ls_data_ext-fdpos = sy-fdpos + l_offset.
        MODIFY lt_data FROM ls_data_ext INDEX i.
        i = i - 1.
      ENDIF.
    ELSE.
*     von oben anfangen
      i = 1.
*     Offsets initialisieren
      LOOP AT lt_data INTO ls_data_ext.
        l_value = ls_data_ext-value.
        SHIFT l_value LEFT DELETING LEADING space.
        SEARCH l_value  FOR l_string.
        IF sy-subrc = 0.
          ls_data_ext-fdpos = sy-fdpos.
        ENDIF.
        MODIFY lt_data FROM ls_data_ext.
      ENDLOOP.
      READ TABLE lt_data INTO ls_data_ext INDEX i.
      IF sy-subrc = 0.
        l_sav_row_pos = ls_data_ext-row_pos.
        l_sav_col_pos = ls_data_ext-col_pos.
        l_start_pos = ls_data_ext-fdpos + 1.
        l_end_pos = l_start_pos + l_length - 1.
        CALL METHOD me->set_current_cell
          EXPORTING
            i_start_position = l_start_pos
            i_end_position   = l_end_pos
            i_row            = ls_data_ext-row_pos
            i_column         = ls_data_ext-col_pos.
        IF me->is_cache_valid( ) NE abap_true or www_active eq abap_true.

          CALL METHOD cl_gui_cfw=>flush.

        ENDIF.
        l_offset = ls_data_ext-fdpos + l_length.
        l_value = ls_data_ext-value.
        SHIFT l_value LEFT DELETING LEADING space.
        SHIFT l_value BY l_offset PLACES.
        SEARCH l_value FOR l_string.
        IF sy-subrc EQ 0.
*         Weiterer Treffer gefunden
          ls_data_ext-fdpos = sy-fdpos + l_offset.
          MODIFY lt_data FROM ls_data_ext INDEX i.
          i = i - 1.
        ENDIF.
      ENDIF.
    ENDIF.
  ENDDO.

  IF NOT l_reset_selected_cols IS INITIAL.
    CALL METHOD me->clear_selection.
  ENDIF.

ENDMETHOD.


method search2 .

  types: begin of lty_data.
  include type lvc_s_data.
  types:  fdpos type syfdpos,
end of lty_data.

  data: l_fcat_wa type lvc_s_fcat,
        decimal_da,                      "Decimal in internal table
        datum_da,                        "Daten in internal table
        l_info type lvc_string,          "Info Feedback for user
        bool,
        l_search_value type lvc_s_data-value,
        l_search_value_save type lvc_s_data-value,
        l_search_order,                  "search from beginning...
        l_search_order_save,
        l_sinh,                          "as string or as contants?
        l_sinh_save,
        l_zahl,                          "to display how many found?
        l_zahl_save,
        date_ver,
        search_untern,
        l_flg_first_time,
        lt_data type standard table of lty_data,
        ls_data_ext type lty_data,
        l_length type i,
        search_pos type i,
        l_mtdata_lin type i,
        l_value type lvc_s_data-value,
        ls_data type lvc_s_data,
        i type i,
        mal_count type i,
        count_n type i,
        l_sav_col_pos type lvc_s_data-col_pos,
        l_sav_row_pos type lvc_s_data-row_pos,
        ls_col_id type lvc_s_col,
        ls_row_id type lvc_s_row,
        l_find_lines type i,
        l_lin_2 type i,

        l_start_pos type i,
        l_offset type i,
        l_end_pos type i,       "Cursor position in a cell

        zeihen type i,
        sy_tabix_save like sy-tabix,
        search_cursor_back ,
        l_reset_selected_cols,
        new_search,
        null_data.

* how many data in internal datatable
  describe table mt_data lines l_mtdata_lin.


* check extern datum format of the local system.
  data: l_intern_datum type d value '19711222',
        l_extern_datum(10) type c,
        l_ex_datum_formate type i.

  read table m_cl_variant->mt_fieldcatalog
             into l_fcat_wa with key inttype = 'D'.
  if sy-subrc = 0.
    datum_da = 'X'.
    clear l_ex_datum_formate.
    write l_intern_datum to l_extern_datum mm/dd/yyyy.

    case l_extern_datum.
      when '22.12.1971'.
        l_ex_datum_formate = 1.
      when '12/22/1971'.
        l_ex_datum_formate = 2.
      when '12-22-1971'.
        l_ex_datum_formate = 3.
      when '1971.12.22'.
        l_ex_datum_formate = 4.
      when '1971/12/22'.
        l_ex_datum_formate = 5.
      when '1971-12-22'.
        l_ex_datum_formate = 6.
      when others.
    endcase.
  else.
    clear datum_da.
  endif.

*check extern decimals formate of local system.
  data: l_ex_decimal_formate type i,
        l_intern_numer type p decimals 2,
        l_extern_numer(9) type c.

  read table m_cl_variant->mt_fieldcatalog
               into l_fcat_wa with key inttype = 'P'.
  if sy-subrc = 0.
    decimal_da = 'X'.
    l_intern_numer = 13001 / 4.
    write l_intern_numer to l_extern_numer.

    case l_extern_numer+5(1).
      when '.'.
        l_ex_decimal_formate = 2.                           "3 250.25
      when ','.
        if l_extern_numer+1(1) = '.'.
          l_ex_decimal_formate = 3.                         "3.250,25
        else.
          l_ex_decimal_formate = 1.                         "3 250,25
        endif.
    endcase.
  endif.

*get selected columns.
  data: lt_select_columns type lvc_t_col,
        ls_select_column like line of lt_select_columns,
        lt_col_pos type lvc_t_coll,
        ls_col_pos type line of lvc_t_coll,
        ls_info type lvc_s_info,
        l_select type i.

  data: begin of ls_col,
        col_pos type lvc_s_coll-col_pos,
        fieldname type lvc_s_col-fieldname,
        end of ls_col,
        lt_col like standard table of ls_col.


  call method me->get_selected_columns
    importing
      et_index_columns = lt_select_columns. "marked columns

  call method me->get_col_pos_id_base
    importing
      col_pos_table = lt_col_pos.


* if no cloumns is selected, alle are selected.
  describe table lt_select_columns lines l_select.
  if l_select eq 0.
    clear l_reset_selected_cols.
    loop at lt_col_pos into ls_col_pos.
      move ls_col_pos-col_id to ls_select_column.
      append ls_select_column to lt_select_columns.
    endloop.
    call method me->set_selected_columns_base
      exporting
        col_table = lt_select_columns.
  else.
    l_reset_selected_cols = 'X'.
  endif.

  loop at lt_select_columns into ls_select_column.
    read table mt_info into ls_info
         with key fieldname = ls_select_column-fieldname.
    if sy-subrc eq 0.
      clear ls_col.
      move ls_info-col_pos to ls_col-col_pos.
      move ls_select_column-fieldname to ls_col-fieldname.
      append ls_col to lt_col.
    endif.
  endloop.

*get data value of the cursor
  data: l_cursor_value type lvc_s_data-value.

  call method me->get_current_cell
    importing
      e_value = l_cursor_value.
  if l_cursor_value is not initial.
    l_search_value = l_cursor_value.
  else.
    clear l_search_value.
  endif.

*how many columns in internal table
  data: l_data_col_count type i.
  describe table mt_info lines l_data_col_count.
  add 1 to l_data_col_count.

*search dialog
  do.
    call function 'ALV_POPUP_TO_SEARCH2'
      exporting
        i_inform       = l_info         "feedback
      importing
        e_cancelled    = bool
      changing
        c_string       = l_search_value
        c_search_order = l_search_order
        c_sinh         = l_sinh
        c_gzahl        = l_zahl.
*if cancel.
    if bool ne space.
      if l_reset_selected_cols is initial.
        clear lt_select_columns.
      endif.
      call method me->set_selected_columns_base
        exporting
          col_table = lt_select_columns.
      exit.
    endif.

*if l_search_value is empty.
    if l_search_value eq space.
      l_info = text-843. "keinen Suchbegriff'.
    endif.
*handling the external data format for date
    data: l_string type lvc_s_data-value.

    l_string = l_search_value.

    if l_string ca '0123456789.-/' and datum_da eq 'X'.
      data: l_search_char(48),
            l_search_int type d.
      clear date_ver.
      clear l_search_char.
      clear l_search_int.

      l_search_char = l_string.
      if strlen( l_string ) eq 10.
**22.12.1971 --> local external format
        if     l_string+2(1) = '.'
           and l_string+5(1) = '.'
           and l_ex_datum_formate ne 1
           and date_ver ne 'X'.
          concatenate l_search_char+6(4) l_search_char+3(2)
l_search_char(2) into l_search_int.
          if sy-subrc = 0.
            write l_search_int to l_string mm/dd/yyyy.
          endif.
          date_ver = 'X'.
        endif.
**12/22/1971 --> local external format
        if     l_string+2(1) = '/'
           and l_string+5(1) = '/'
           and l_ex_datum_formate ne 2
           and date_ver ne 'X'.
          concatenate l_search_char+6(4) l_search_char(2)
  l_search_char+3(2) into l_search_int.
          if sy-subrc = 0.
            write l_search_int to l_string mm/dd/yyyy.
          endif.
          date_ver = 'X'.
        endif.
**12-22-1971 --> local external format
        if     l_string+2(1) = '-'
           and l_string+5(1) = '-'
           and l_ex_datum_formate ne 3
           and date_ver ne 'X'.
          concatenate l_search_char+6(4) l_search_char(2)
 l_search_char+3(2) into l_search_int.
          if sy-subrc = 0.
            write l_search_int to l_string mm/dd/yyyy.
          endif.
          date_ver = 'X'.
        endif.
**1971.12.22 --> local external format
        if     l_string+4(1) = '.'
           and l_string+7(1) = '.'
           and l_ex_datum_formate ne 4
           and date_ver ne 'X'.
          concatenate l_search_char(4) l_search_char+5(2)
  l_search_char+8(2) into l_search_int.
          if sy-subrc = 0.
            write l_search_int to l_string mm/dd/yyyy.
          endif.
          date_ver = 'X'.
        endif.
**1971/12/22 --> local external format
        if     l_string+4(1) = '/'
           and l_string+7(1) = '/'
           and l_ex_datum_formate ne 5
           and date_ver ne 'X'.
          concatenate l_search_char(4) l_search_char+5(2)
  l_search_char+8(2) into l_search_int.
          if sy-subrc = 0.
            write l_search_int to l_string mm/dd/yyyy.
          endif.
          date_ver = 'X'.
        endif.
**1971-12-22 --> local external format
        if     l_string+4(1) = '-'
           and l_string+7(1) = '-'
           and l_ex_datum_formate ne 6
           and date_ver ne 'X'.
          concatenate l_search_char(4) l_search_char+5(2)
  l_search_char+8(2) into l_search_int.
          if sy-subrc = 0.
            write l_search_int to l_string mm/dd/yyyy.
          endif.
          date_ver = 'X'.
        endif.
      endif.
    endif.

* Handling external data format for decimals
    if l_string ca '0123456789.,-' and decimal_da = 'X'.
      data: int_leng_minus type i,
            minus_da.
      int_leng_minus = strlen( l_string ) - 1.
      clear minus_da.
      if l_string+int_leng_minus(1) = '-'.
        minus_da = 'X'.
      endif.

      if not ( l_string+2(1) eq '.' and l_string+5(1) eq '.' )
         and date_ver = space.
        "71.12.22 ; 1971.12.22 nicht als P zusuchen

        data: l_decimal type i,
              l_string_char(1),
              l_string_tep type string,
              einmodul type i,
              decimal_aus(1),
              int_leng type i.

        case l_ex_decimal_formate.

** for local extern format  "3.250,25
          when 3 .
            clear l_decimal.
            clear decimal_aus.
            clear einmodul.
            clear l_string_tep.

            if minus_da eq 'X'.
              int_leng = strlen( l_string ) - 2.
            else.
              int_leng = strlen( l_string ) - 1.
            endif.

            while ( int_leng ne 0 ).
              l_string_char = l_string+int_leng(1).
              case l_string_char.
                when '.'.
                  if decimal_aus = 'X'.
                    einmodul = 3.                           "3.250,25
                  else.
                    einmodul = 2.                           "3 250.25
                  endif.
                  decimal_aus = 'X'.
                  exit.
                when ','.
                  decimal_aus = 'X'.
                when ' '.
                  einmodul = 1.                             "3 250,25
                  exit.
              endcase.
              if decimal_aus eq space.
                l_decimal = l_decimal + 1.
              endif.
              int_leng  = int_leng  - 1.
            endwhile.

            loop at m_cl_variant->mt_fieldcatalog
                    into l_fcat_wa where inttype = 'P'.
              if l_fcat_wa-decimals eq l_decimal .

                case einmodul.
***12.345,67 -> 12.345,67 or 12,34 -> 00.012,34
                  when '3' or '0'.
                    exit.
***12,345.67 -> 12.345,67
                  when '2'.
                    replace all occurrences of '.' in l_string with '@' .
                    replace all occurrences of ',' in l_string with '.' .
                    replace all occurrences of '@' in l_string with ',' .
                    exit.
***12 345,67 -> 12.345,67
                  when '1'.
                    int_leng = strlen( l_string ) - 1.
                    while ( int_leng ne 0 ).
                      l_string_char = l_string+int_leng(1).

                      case l_string_char.
                        when ' '.
                          l_string_char = '.'.
                      endcase.

                      concatenate  l_string_char l_string_tep into l_string_tep.
                      int_leng = int_leng - 1.
                    endwhile.
                    concatenate  l_string(1) l_string_tep into l_string_tep.
                    l_string = l_string_tep.
                    exit.
                endcase.
              endif.
            endloop.
** for local extern format  3 250.25
          when 2.
            clear l_decimal.
            clear decimal_aus.
            clear einmodul.
            clear l_string_tep.

            if minus_da eq 'X'.
              int_leng = strlen( l_string ) - 2.
            else.
              int_leng = strlen( l_string ) - 1.
            endif.
            while ( int_leng ne 0 ).
              l_string_char = l_string+int_leng(1).

              case l_string_char.
                when '.'.
                  if decimal_aus = 'X'.
                    einmodul = 3.
                  else.
                    einmodul = 2.
                  endif.
                  decimal_aus = 'X'.
                  exit.
                when ','.
                  decimal_aus = 'X'.
                when ' '.
                  einmodul = 1.
                  exit.
              endcase.

              if decimal_aus eq space.
                l_decimal = l_decimal + 1.
              endif.
              int_leng  = int_leng  - 1.
            endwhile.

            loop at m_cl_variant->mt_fieldcatalog
                   into l_fcat_wa where inttype = 'P'.
              if l_fcat_wa-decimals eq l_decimal .

                case einmodul.
***12,345.67 -> 12,345.67
                  when '2'.
                    exit.
***12.345,67 -> 12,345.67 or 12,34 -> 0.012,34
                  when '3' or '0'.
                    replace all occurrences of '.' in l_string with '@' .
                    replace all occurrences of ',' in l_string with '.' .
                    replace all occurrences of '@' in l_string with ',' .
                    exit.
***12 345,67 -> 12,345.67
                  when '1'.
                    int_leng = strlen( l_string ) - 1.
                    while ( int_leng ne 0 ).
                      l_string_char = l_string+int_leng(1).

                      case l_string_char.
                        when ' '.
                          l_string_char = ','.
                        when ','.
                          l_string_char = '.'.
                      endcase.

                      concatenate  l_string_char l_string_tep into l_string_tep.
                      int_leng = int_leng - 1.
                    endwhile.
                    concatenate  l_string(1) l_string_tep into l_string_tep.
                    l_string = l_string_tep.
                    exit.
                endcase.
              endif.
            endloop.

** for local extern format  3 250,25
          when 1.
            clear l_decimal.
            clear decimal_aus.
            clear einmodul.
            clear l_string_tep.

            if minus_da eq 'X'.
              int_leng = strlen( l_string ) - 2.
            else.
              int_leng = strlen( l_string ) - 1.
            endif.
            while ( int_leng ne 0 ).
              l_string_char = l_string+int_leng(1).

              case l_string_char.
                when '.'.
                  if decimal_aus = 'X'.
                    einmodul = 3.
                  else.
                    einmodul = 2.
                  endif.
                  decimal_aus = 'X'.
                  exit.
                when ','.
                  decimal_aus = 'X'.
                when ' '.
                  einmodul = 1.
                  exit.
              endcase.

              if decimal_aus eq space.
                l_decimal = l_decimal + 1.
              endif.

              int_leng  = int_leng  - 1.
            endwhile.

            loop at m_cl_variant->mt_fieldcatalog
                  into l_fcat_wa where inttype = 'P'.
              if l_fcat_wa-decimals eq l_decimal .

                case einmodul.
***12 345,67 -> 12 345,67  or 12,34 -> 0 012,34
                  when '1' or '0'.
                    exit.
***12,345.67 -> 12 345,67
                  when '2'.
                    int_leng = strlen( l_string ) - 1.

                    while ( int_leng ne 0 ).
                      l_string_char = l_string+int_leng(1).

                      case l_string_char.
                        when '.'.
                          l_string_char = ','.
                        when ','.
                          l_string_char = space.
                          shift l_string_tep right.
                      endcase.

                      concatenate  l_string_char l_string_tep into l_string_tep.
                      int_leng = int_leng - 1.
                    endwhile.
                    concatenate  l_string(1) l_string_tep into l_string_tep.
                    l_string = l_string_tep.
                    exit.
***12.345,67 -> 12 345,67
                  when '3'.
                    int_leng = strlen( l_string ) - 1.
                    while ( int_leng ne 0 ).
                      l_string_char = l_string+int_leng(1).

                      case l_string_char.
                        when '.'.
                          l_string_char = space.
                          shift l_string_tep right.
                      endcase.
                      concatenate  l_string_char l_string_tep into l_string_tep.
                      int_leng = int_leng - 1.
                    endwhile.
                    concatenate  l_string(1) l_string_tep into l_string_tep.
                    l_string = l_string_tep.
                    exit.
                endcase.
              endif.
            endloop.
        endcase.
      endif.
    endif.

    clear new_search.
    if  l_zahl ne l_zahl_save or
        l_sinh ne l_sinh_save or
        l_search_order_save ne l_search_order or
        l_search_value ne l_search_value_save.
      new_search = 'X'.
    endif.

*total number for the search is required
    if l_zahl = 'X'.
**loading all Data
      if l_mtdata_lin ne 0.
        call method me->on_before_send
          exporting
            firstline = 1
            lastline  = l_mtdata_lin.
      else.
        null_data = 'X'.
      endif.

      if new_search eq 'X'.
        l_flg_first_time = 'X'.
        clear search_pos.
        clear lt_data[].
        if l_search_value is initial.
          l_flg_first_time = space.
        endif.
        l_length = strlen( l_string ).
      endif.

      if l_flg_first_time eq 'X'.

        clear i.
        l_flg_first_time = space.

        case l_search_order.
**from starting or ending
          when space or '1'.
            clear ls_data.
            loop at mt_data into ls_data.
              search ls_data-value  for l_string.
              if sy-subrc eq 0.
                clear ls_data_ext.
                l_value = ls_data-value.
                shift l_value left deleting leading space.
***search value as string
                if l_sinh eq space.
                  search l_value  for l_string.
                  if sy-subrc eq 0.
                    ls_data_ext-fdpos = sy-fdpos.
                    move-corresponding ls_data to ls_data_ext.
                    ls_data_ext-row_pos =
                     ( ( sy-tabix - 1 ) div l_data_col_count ) + 1.
                    ls_data_ext-col_pos =
                     ( sy-tabix - 1 ) mod l_data_col_count.
                    append ls_data_ext to lt_data.
                  endif.
***search value as total word
                else.
                  if l_value eq l_string.
                    move-corresponding ls_data to ls_data_ext.
                    ls_data_ext-row_pos =
                     ( ( sy-tabix - 1 ) div l_data_col_count ) + 1.
                    ls_data_ext-col_pos =
                     ( sy-tabix - 1 ) mod l_data_col_count.
                    append ls_data_ext to lt_data.
                  endif.
                endif. "l_sinh
              endif.
            endloop.
**from cursor forward
          when '2'.
            clear l_sav_row_pos.
            clear ls_row_id.
            clear l_sav_col_pos.
            clear ls_col_id.
            call method me->get_current_cell
              importing
                e_row     = l_sav_row_pos
                es_row_id = ls_row_id
                e_col     = l_sav_col_pos
                es_col_id = ls_col_id.

            clear mal_count.
            mal_count = ( l_sav_row_pos - 1 ) * l_data_col_count +
     l_sav_col_pos + 1 .  "where is cursor position in mt_data

            count_n = 1.
            clear ls_data.
            loop at mt_data into ls_data.
              if ( count_n >= mal_count ).
                search ls_data-value  for l_string.
                if sy-subrc eq 0.
                  clear ls_data_ext.
                  l_value = ls_data-value.
                  shift l_value left deleting leading space.

                  if l_sinh eq space.    "search value as string
                    search l_value  for l_string.
                    if sy-subrc eq 0.
                      ls_data_ext-fdpos = sy-fdpos.
                      move-corresponding ls_data to ls_data_ext.
                      ls_data_ext-row_pos =
                       ( ( sy-tabix - 1 ) div l_data_col_count ) + 1.
                      ls_data_ext-col_pos =
                       ( sy-tabix - 1 ) mod l_data_col_count.
                      append ls_data_ext to lt_data.
                    endif.
                  else."l_sinh search value as total word
                    if l_value eq l_string.
                      move-corresponding ls_data to ls_data_ext.
                      ls_data_ext-row_pos =
                        ( ( sy-tabix - 1 ) div l_data_col_count ) + 1.
                      ls_data_ext-col_pos =
                        ( sy-tabix - 1 ) mod l_data_col_count.
                      append ls_data_ext to lt_data.
                    endif.
                  endif.
                endif.
              endif.
              count_n = count_n + 1.
            endloop.
**from cursor back
          when '3'.
            clear l_sav_row_pos.
            clear ls_row_id.
            clear l_sav_col_pos.
            clear ls_col_id.
            call method me->get_current_cell
              importing
                e_row     = l_sav_row_pos
                es_row_id = ls_row_id
                e_col     = l_sav_col_pos
                es_col_id = ls_col_id.

            clear mal_count.
            mal_count = ( l_sav_row_pos - 1 ) * l_data_col_count +
     l_sav_col_pos + 1 .  "where is cursor position in mt_data

            count_n = 1.
            clear ls_data.
            loop at mt_data into ls_data.
              if ( count_n <= mal_count ).
                search ls_data-value  for l_string.
                if sy-subrc eq 0.
                  clear ls_data_ext.
                  l_value = ls_data-value.
                  shift l_value left deleting leading space.

                  if l_sinh eq space.    "search value as string
                    search l_value  for l_string.
                    if sy-subrc eq 0.
                      ls_data_ext-fdpos = sy-fdpos.
                      move-corresponding ls_data to ls_data_ext.
                      ls_data_ext-row_pos =
                       ( ( sy-tabix - 1 ) div l_data_col_count ) + 1.
                      ls_data_ext-col_pos =
                       ( sy-tabix - 1 ) mod l_data_col_count.
                      append ls_data_ext to lt_data.
                    endif.
                  else."l_sinh search value as total word
                    if l_value eq l_string.
                      move-corresponding ls_data to ls_data_ext.
                      ls_data_ext-row_pos =
                       ( ( sy-tabix - 1 ) div l_data_col_count ) + 1.
                      ls_data_ext-col_pos =
                       ( sy-tabix - 1 ) mod l_data_col_count.
                      append ls_data_ext to lt_data.
                    endif.
                  endif.
                endif.
              endif.
              count_n = count_n + 1.
            endloop.
        endcase.

* excluding 0 position and not selected positions
        clear ls_data_ext.
        loop at lt_data into ls_data_ext.
          read table lt_col into ls_col
                   with key col_pos = ls_data_ext-col_pos.
          if sy-subrc ne 0 or ls_data_ext-col_pos eq 0 .
            delete lt_data.
          else.
            read table lt_col_pos into ls_col_pos
                       with key col_id-fieldname = ls_col-fieldname.
            if sy-subrc eq 0.
              move ls_col_pos-col_pos to ls_data_ext-col_pos.
              modify lt_data from ls_data_ext.
            else.
            endif.
          endif.
        endloop.
        clear l_find_lines.
        describe table lt_data lines l_find_lines.
      endif. "end of first search for the GZ process

* Handling of results for GZ process.
      if not l_string is initial. "l_search_value .
        data: is type string.
        if l_find_lines eq 0.
          l_info = text-844. "In markierten Spalten nichts gefunden!'.
        else.
          data: l_lines_string type string.
          l_lines_string = l_find_lines.
          concatenate l_lines_string text-845 into l_info.
          is = i + 1.
          concatenate l_info text-847 is '.' text-848 into l_info.

          add 1 to i.
          if  l_search_order = '1' or l_search_order = '3'.
            sort lt_data by row_pos descending col_pos descending .
          endif.

          read table lt_data into ls_data_ext index i.
          if sy-subrc eq 0.
            l_start_pos   = ls_data_ext-fdpos + 1.
            l_end_pos     = l_start_pos + l_length - 1.

            call method me->set_current_cell
              exporting
                i_start_position = l_start_pos
                i_end_position   = l_end_pos
                i_row            = ls_data_ext-row_pos
                i_column         = ls_data_ext-col_pos.
            call method cl_gui_cfw=>flush.
          else.
            l_info = text-849.
          endif.
        endif.
      endif. "end of if l_lines eq 0.

    else.
*without the total number to show
      if not l_string is initial.
        data: standard_package type i,
              line type i,
              geladen_cell type i,
              will_laden_cell type i.

        describe table lt_col_pos lines line.
        standard_package = 1365 div line.
        standard_package = standard_package * line.

        if l_mtdata_lin ne 0.
          l_lin_2 = l_mtdata_lin - 1. "to check is it already the last hits
        else.
          null_data = 'X'.
        endif.

        if new_search eq 'X'.
          search_pos = 0.
          l_length = strlen( l_string ).
          clear l_info.
          geladen_cell = standard_package.
          search_untern = space.
          search_cursor_back = space.
        endif.

        clear zeihen.
        case l_search_order.

* from starting
          when space.
            clear ls_data.
            loop at mt_data into ls_data.
              will_laden_cell = geladen_cell + standard_package.
              if will_laden_cell >= l_lin_2.
                will_laden_cell = l_lin_2.
              endif.

              if zeihen >= geladen_cell.
                call method me->on_before_send
                  exporting
                    firstline = geladen_cell
                    lastline  = will_laden_cell.
                if sy-subrc eq 0.
                  geladen_cell = will_laden_cell.
                endif.
              endif.

              if zeihen >= search_pos.
                search ls_data-value  for l_string.
                if sy-subrc eq 0.
                  clear sy_tabix_save.
                  sy_tabix_save = sy-tabix.
                  clear ls_col.
                  read table lt_col into ls_col with key col_pos =
                                                     ls_data-col_pos.
                  if sy-subrc eq 0 and ls_data-col_pos ne 0.
                    clear ls_data_ext.
                    l_value = ls_data-value.
                    shift l_value left deleting leading space.

**search value as string
                    if l_sinh eq space.
                      search l_value for l_string.
                      if sy-subrc eq 0.
                        ls_data_ext-fdpos = sy-fdpos.
                      endif.
                      move-corresponding ls_data to ls_data_ext.
                      read table lt_col_pos into ls_col_pos
                         with key col_id-fieldname = ls_col-fieldname.
                      move ls_col_pos-col_pos to ls_data_ext-col_pos.
                      ls_data_ext-row_pos = ( ( sy_tabix_save - 1 ) div
                                           l_data_col_count ) + 1.
                      l_start_pos = ls_data_ext-fdpos + 1.
                      l_end_pos     = l_start_pos + l_length - 1.
                      call method me->set_current_cell
                        exporting
                          i_start_position = l_start_pos
                          i_end_position   = l_end_pos
                          i_row            = ls_data_ext-row_pos
                          i_column         = ls_data_ext-col_pos.
                      call method cl_gui_cfw=>flush.
                      search_pos = zeihen + 1.
                      exit.
                    else.
                      if l_value eq l_string.
                        move-corresponding ls_data to ls_data_ext.
                        read table lt_col_pos into ls_col_pos
                           with key col_id-fieldname = ls_col-fieldname.
                        move ls_col_pos-col_pos to ls_data_ext-col_pos.
                        ls_data_ext-row_pos = ( ( sy_tabix_save - 1 ) div
                                         l_data_col_count ) + 1.
                        l_start_pos = ls_data_ext-fdpos + 1.
                        l_end_pos   = l_start_pos + l_length - 1.

                        call method me->set_current_cell
                          exporting
                            i_start_position = l_start_pos
                            i_end_position   = l_end_pos
                            i_row            = ls_data_ext-row_pos
                            i_column         = ls_data_ext-col_pos.
                        call method cl_gui_cfw=>flush.
                        search_pos = zeihen + 1.
                        exit.
                      endif. "endof if l_value eq l_string.
                    endif. "endof if l_sinh eq space
                  endif. "endof if sy-subrc eq 0 and ls_data-col_pos ne 0.
                endif. " end of if ls_data-value cs l_string
              endif.   " end of if zeihen >= search_pos

              if zeihen >= l_lin_2.
                clear l_info.
                l_info = text-849.
                if search_pos eq 0.
                  clear l_info.
                  l_info = text-844.
                endif.
              endif.
              zeihen = zeihen + 1.
            endloop.

*from back
          when '1'.
            if search_untern eq space.
              will_laden_cell = l_mtdata_lin.
              zeihen = l_mtdata_lin.
              search_pos = l_mtdata_lin.
              geladen_cell = will_laden_cell - standard_package.
              if geladen_cell <= 0.
                geladen_cell = 0.
              endif.
              call method me->on_before_send
                exporting
                  firstline = geladen_cell
                  lastline  = will_laden_cell.
              if sy-subrc eq 0.
                will_laden_cell = geladen_cell.
              endif.
            else.
              zeihen = search_pos.
            endif.

            do.
              read table mt_data into ls_data index zeihen.
              search_untern = 'X'.
              if zeihen <= geladen_cell.
                geladen_cell = will_laden_cell - standard_package.
                call method me->on_before_send
                  exporting
                    firstline = geladen_cell
                    lastline  = will_laden_cell.
                if sy-subrc eq 0.
                  will_laden_cell = geladen_cell.
                endif.
              endif.

              if zeihen <= search_pos.
                search ls_data-value  for l_string.
                if sy-subrc eq 0.
                  clear sy_tabix_save.
                  sy_tabix_save = sy-tabix.
                  clear ls_col.
                  read table lt_col into ls_col with key col_pos =
                                                     ls_data-col_pos.
                  if sy-subrc eq 0 and ls_data-col_pos ne 0.
                    clear ls_data_ext.
                    l_value = ls_data-value.
                    shift l_value left deleting leading space.
** search value as string
                    if l_sinh eq space.    "search value as string
                      search l_value for l_string.
                      if sy-subrc eq 0.
                        ls_data_ext-fdpos = sy-fdpos.
                      endif.
                      move-corresponding ls_data to ls_data_ext.
                      read table lt_col_pos into ls_col_pos
                           with key col_id-fieldname = ls_col-fieldname.
                      move ls_col_pos-col_pos to ls_data_ext-col_pos.

                      ls_data_ext-row_pos = ( zeihen ) div ( l_data_col_count ) + 1.
                      l_start_pos = ls_data_ext-fdpos + 1.
                      l_end_pos   = l_start_pos + l_length - 1.

                      call method me->set_current_cell
                        exporting
                          i_start_position = l_start_pos
                          i_end_position   = l_end_pos
                          i_row            = ls_data_ext-row_pos
                          i_column         = ls_data_ext-col_pos.
                      call method cl_gui_cfw=>flush.
                      search_pos = zeihen - 1.
                      exit.
* search value as total word
                    else.         "search value as total word
                      if l_value eq l_string.
                        move-corresponding ls_data to ls_data_ext.
                        read table lt_col_pos into ls_col_pos
                           with key col_id-fieldname = ls_col-fieldname.
                        move ls_col_pos-col_pos to ls_data_ext-col_pos.

                        ls_data_ext-row_pos = ( zeihen ) div ( l_data_col_count ) + 1.
                        l_start_pos = ls_data_ext-fdpos + 1.
                        l_end_pos   = l_start_pos + l_length - 1.

                        call method me->set_current_cell
                          exporting
                            i_start_position = l_start_pos
                            i_end_position   = l_end_pos
                            i_row            = ls_data_ext-row_pos
                            i_column         = ls_data_ext-col_pos.
                        call method cl_gui_cfw=>flush.
                        search_pos = zeihen - 1.
                        exit.
                      endif. "endof if l_value eq l_string.
                    endif. "endof if l_sinh eq space
                  endif. "endof if sy-subrc eq 0 and ls_data-col_pos ne 0.
                endif. " end of if ls_data-value cs l_string
              endif.   " end of if zeihen >= search_pos
              if zeihen <= 0.
                clear l_info.
                l_info = text-849.
                exit.
                if search_pos eq 0.
                  clear l_info.
                  l_info = text-844.
                  exit.
                endif.
              endif.
              zeihen = zeihen - 1.
            enddo.
**from cursor forward
          when '2'.
            clear l_sav_row_pos.
            clear ls_row_id.
            clear l_sav_col_pos.
            clear ls_col_id.
            call method me->get_current_cell
              importing
                e_row     = l_sav_row_pos
                es_row_id = ls_row_id
                e_col     = l_sav_col_pos
                es_col_id = ls_col_id.

            clear mal_count.
            mal_count =  l_sav_row_pos * l_data_col_count.
            if geladen_cell <= mal_count.
              geladen_cell = mal_count.
            endif.
            mal_count = ( l_sav_row_pos - 1 ) * l_data_col_count  +
                l_sav_col_pos .  "where is cursor position in mt_data

            clear ls_data.
            loop at mt_data into ls_data.
              if ( zeihen >= mal_count ).
                if zeihen >= geladen_cell.
                  will_laden_cell = geladen_cell + standard_package.
                  if will_laden_cell >= l_lin_2.
                    will_laden_cell = l_lin_2.
                  endif.
                  call method me->on_before_send
                    exporting
                      firstline = geladen_cell
                      lastline  = will_laden_cell.
                  if sy-subrc eq 0.
                    geladen_cell = will_laden_cell.
                  endif.
                endif.

                if zeihen >= search_pos.
                  search ls_data-value  for l_string.
                  if sy-subrc eq 0.
                    clear sy_tabix_save.
                    sy_tabix_save = sy-tabix.
                    clear ls_col.
                    read table lt_col into ls_col with key col_pos =
                                                    ls_data-col_pos.
                    if sy-subrc eq 0 and ls_data-col_pos ne 0.
                      clear ls_data_ext.
                      l_value = ls_data-value.
                      shift l_value left deleting leading space.

*** search value as string
                      if l_sinh eq space.    "search value as string
                        search l_value for l_string.
                        if sy-subrc eq 0.
                          ls_data_ext-fdpos = sy-fdpos.
                        endif.
                        move-corresponding ls_data to ls_data_ext.
                        read table lt_col_pos into ls_col_pos
                           with key col_id-fieldname = ls_col-fieldname.
                        move ls_col_pos-col_pos to ls_data_ext-col_pos.
                        ls_data_ext-row_pos = ( ( sy_tabix_save - 1 ) div
                                            l_data_col_count ) + 1.

                        l_start_pos = ls_data_ext-fdpos + 1.
                        l_end_pos     = l_start_pos + l_length - 1.

                        call method me->set_current_cell
                          exporting
                            i_start_position = l_start_pos
                            i_end_position   = l_end_pos
                            i_row            = ls_data_ext-row_pos
                            i_column         = ls_data_ext-col_pos.
                        call method cl_gui_cfw=>flush.
                        search_pos = zeihen + 1.
                        exit.
*** search value as total word
                      else.         "search value as total word
                        if l_value eq l_string.
                          move-corresponding ls_data to ls_data_ext.
                          read table lt_col_pos into ls_col_pos
                           with key col_id-fieldname = ls_col-fieldname.
                          move ls_col_pos-col_pos to ls_data_ext-col_pos.

                          ls_data_ext-row_pos = ( ( sy_tabix_save - 1 ) div
                                            l_data_col_count ) + 1.
                          l_start_pos = ls_data_ext-fdpos + 1.
                          l_end_pos     = l_start_pos + l_length - 1.

                          call method me->set_current_cell
                            exporting
                              i_start_position = l_start_pos
                              i_end_position   = l_end_pos
                              i_row            = ls_data_ext-row_pos
                              i_column         = ls_data_ext-col_pos.
                          call method cl_gui_cfw=>flush.
                          search_pos = zeihen + 1.
                          exit.
                        endif. "endof if l_value eq l_string.
                      endif. "endof if l_sinh eq space
                    endif. "endof if sy-subrc eq 0 and ls_data-col_pos ne 0.
                  endif. " end of if ls_data-value cs l_string
                endif.   " end of if zeihen >= search_pos
              endif.
              if zeihen >= l_lin_2.
                clear l_info.
                l_info = text-849.
                if search_pos eq 0.
                  clear l_info.
                  l_info = text-844.
                endif.
              endif.
              zeihen = zeihen + 1.
            endloop.
**from cursor back
          when '3'.
            clear l_sav_row_pos.
            clear ls_row_id.
            clear l_sav_col_pos.
            clear ls_col_id.
            call method me->get_current_cell
              importing
                e_row     = l_sav_row_pos
                es_row_id = ls_row_id
                e_col     = l_sav_col_pos
                es_col_id = ls_col_id.

            clear mal_count.
            mal_count =  l_sav_row_pos * l_data_col_count.
            if search_cursor_back eq space.
              will_laden_cell = mal_count.
              mal_count = ( l_sav_row_pos - 1 ) * l_data_col_count  +
                   l_sav_col_pos .  "where is cursor position in mt_data
              zeihen = mal_count + 1.
              search_pos = mal_count + 1.
              geladen_cell = will_laden_cell - standard_package.
              if geladen_cell <= 0.
                geladen_cell = 0.
              endif.
              call method me->on_before_send
                exporting
                  firstline = geladen_cell
                  lastline  = will_laden_cell.
              if sy-subrc eq 0.
                will_laden_cell = geladen_cell.
              endif.
            else.
              zeihen = search_pos.
            endif.

            do.
              read table mt_data into ls_data index zeihen.
              search_cursor_back = 'X'.
              if zeihen <= geladen_cell.
                geladen_cell = will_laden_cell - standard_package.
                call method me->on_before_send
                  exporting
                    firstline = geladen_cell
                    lastline  = will_laden_cell.
                if sy-subrc eq 0.
                  will_laden_cell = geladen_cell.
                endif.
              endif.

              if zeihen <= search_pos.
                search ls_data-value  for l_string.
                if sy-subrc eq 0.
                  clear sy_tabix_save.
                  sy_tabix_save = sy-tabix.
                  clear ls_col.
                  read table lt_col into ls_col with key col_pos =
                                                     ls_data-col_pos.
                  if sy-subrc eq 0 and ls_data-col_pos ne 0.
                    clear ls_data_ext.
                    l_value = ls_data-value.
                    shift l_value left deleting leading space.
** search value as string
                    if l_sinh eq space.    "search value as string
                      search l_value for l_string.
                      if sy-subrc eq 0.
                        ls_data_ext-fdpos = sy-fdpos.
                      endif.
                      move-corresponding ls_data to ls_data_ext.
                      read table lt_col_pos into ls_col_pos
                           with key col_id-fieldname = ls_col-fieldname.
                      move ls_col_pos-col_pos to ls_data_ext-col_pos.

                      ls_data_ext-row_pos = ( zeihen ) div ( l_data_col_count ) + 1.
                      l_start_pos = ls_data_ext-fdpos + 1.
                      l_end_pos   = l_start_pos + l_length - 1.

                      call method me->set_current_cell
                        exporting
                          i_start_position = l_start_pos
                          i_end_position   = l_end_pos
                          i_row            = ls_data_ext-row_pos
                          i_column         = ls_data_ext-col_pos.
                      call method cl_gui_cfw=>flush.
                      search_pos = zeihen - 1.
                      exit.
* search value as total word
                    else.         "search value as total word
                      if l_value eq l_string.
                        move-corresponding ls_data to ls_data_ext.
                        read table lt_col_pos into ls_col_pos
                           with key col_id-fieldname = ls_col-fieldname.
                        move ls_col_pos-col_pos to ls_data_ext-col_pos.

                        ls_data_ext-row_pos = ( zeihen ) div ( l_data_col_count ) + 1.
                        l_start_pos = ls_data_ext-fdpos + 1.
                        l_end_pos   = l_start_pos + l_length - 1.

                        call method me->set_current_cell
                          exporting
                            i_start_position = l_start_pos
                            i_end_position   = l_end_pos
                            i_row            = ls_data_ext-row_pos
                            i_column         = ls_data_ext-col_pos.
                        call method cl_gui_cfw=>flush.
                        search_pos = zeihen - 1.
                        exit.
                      endif. "endof if l_value eq l_string.
                    endif. "endof if l_sinh eq space
                  endif. "endof if sy-subrc eq 0 and ls_data-col_pos ne 0.
                endif. " end of if ls_data-value cs l_string
              endif.   " end of if zeihen >= search_pos

              if zeihen <= 0.
                clear l_info.
                l_info = text-849.
                exit.
                if search_pos eq 0.
                  clear l_info.
                  l_info = text-844.
                  exit.
                endif.
              endif.
              zeihen = zeihen - 1.
            enddo.
        endcase.
      endif.
    endif.
    if null_data is not initial.
      l_info = text-850.
      clear null_data.
    endif.
    l_sinh_save = l_sinh.
    l_zahl_save = l_zahl.
    l_search_value_save = l_search_value.
    l_search_order_save = l_search_order.
  enddo.

endmethod.                    "


method search_backend .

*... data declarations
*... lvc variables
  data:
    ls_cell             type lvc_s_cell,
    ls_col              type lvc_s_col,
    ls_roid             type lvc_s_roid,
    ls_row              type lvc_s_row,
    lt_fieldcat         type lvc_t_fcat,
    ls_fieldcat         type lvc_s_fcat,
    ls_info             type lvc_s_info,
    lt_area             type lvc_t_coll,
    ls_column           type lvc_s_coll.

*... (1) Check Outtab exists and reference is correct
  field-symbols : <tab1>    type table.
  field-symbols : <ls_data> type any.
  field-symbols : <fs> type any.

  data: l_lines type i.
  assign mt_outtab->* to <tab1>.
  if not sy-subrc is initial.
    message a534(0k).
  endif.

  describe table <tab1> lines l_lines.

*... (2) get selected area
  data:
    l_selected_area     type sap_bool value 'X',
    lt_column           type lvc_t_coll,
    lt_selected_columns type lvc_t_col,
    ls_selected_column  type lvc_s_col.
*... (2.1) get complete search area
* (all of the columns within the table)
  me->get_col_pos_id_base(
    importing
      col_pos_table = lt_area ).
*... (2.2) determine if only a specific search area is valid
* (marked columns)
  me->get_selected_columns(
    importing
      et_index_columns = lt_selected_columns ).

  cl_gui_cfw=>flush( ).

*... (3) map lvc grid data (frontend ) to fieldcatalog (backend)
  if lt_selected_columns is not initial.
    l_selected_area = abap_true.
    loop at lt_selected_columns into ls_selected_column.
      read table lt_area into ls_column
        with key col_id-fieldname = ls_selected_column-fieldname.
      if sy-subrc eq 0.
        read table me->mt_info into ls_info
          with key fieldname = ls_selected_column-fieldname
          transporting col_pos.
        if sy-subrc eq 0.
          ls_column-col_pos = ls_info-col_pos.
        endif.
        append ls_column to lt_column.
      endif.
    endloop.
    lt_area = lt_column.
  else.
    l_selected_area = abap_false.
  endif.

  field-symbols : <ls_fieldcat> type lvc_s_fcat.

*... (3.1) map selected area to fieldcatalog
  lt_fieldcat = m_cl_variant->mt_fieldcatalog.
  loop at lt_area into ls_column.
    read table lt_fieldcat assigning <ls_fieldcat>
               with key fieldname = ls_column-col_id-fieldname.
    if sy-subrc eq 0.
      <ls_fieldcat>-mark = abap_true.
    endif.
  endloop.

*... (4) fill search value
*... (4.1) get current cell
  me->get_current_cell(
    importing
      es_row_id = ls_cell-row_id
      es_col_id = ls_cell-col_id                "Backend COl_NAME
      ).

  cl_gui_cfw=>flush( ).

*... fill current cell
  data: ls_current_cell type if_alv_lvc_search=>type_s_search_position.
  ls_current_cell-column_name = ls_cell-col_id-fieldname.
  ls_current_cell-row         = ls_cell-row_id-index.

*... (4.2) set search value : position can differ form current cell
*... read the information in outtab
  read table <tab1> assigning <ls_data> index ls_cell-row_id-index.
  if sy-subrc eq 0.
    read table lt_fieldcat assigning <ls_fieldcat>
               with key fieldname = ls_cell-col_id-fieldname.
    if sy-subrc eq 0.
      assign component ls_cell-col_id-fieldname
                       of structure <ls_data> to <fs>.
      if <ls_fieldcat>-fieldname eq m_cl_variant->ms_layout-excp_fname.
        data: l_exception_group type char01.
        if m_cl_variant->ms_layout-excp_group eq '1'
        or m_cl_variant->ms_layout-excp_group eq '0'
        or m_cl_variant->ms_layout-excp_group eq space.
          if m_cl_variant->ms_layout-excp_led eq abap_false.
            l_exception_group = '1'.
          else.
            l_exception_group = '2'.
          endif.
        else.
          l_exception_group = m_cl_variant->ms_layout-excp_group.
        endif.
        cl_alv_a_lvc=>int_2_ext_exception(
          exporting
            exception_group = l_exception_group
            i_int_value     = <fs>
          importing
            e_ext_value     = ls_current_cell-value
                      ).
        <ls_fieldcat>-icon = l_exception_group.
        clear <ls_fieldcat>-tech.
      else.
        cl_alv_a_lvc=>cell_data_get(
          exporting
            is_data     = <ls_data>
            i_int_value = <fs>
          importing
            e_ext_value = ls_current_cell-value
          changing
            cs_fieldcat = <ls_fieldcat>
                      ).
      endif.
      shift ls_current_cell-value left deleting leading space.
    endif.
  endif.
*... (4.3) set value only, when cell was really selected
  if ls_cell-row_id-index eq 0 or ls_cell-row_id-index eq space.
    clear ls_current_cell-value.
  endif.

*... set value only, when calling via context menu
  if m_eventid ne me->evt_context_menu_selected.
    clear ls_current_cell-value.
  endif.

*... (5) do Search
*... (5.1) create search instance

  data: l_modus type salv_de_constant.

  if i_ucomm = mc_fc_find_more.
    l_modus = if_alv_lvc_search=>c_modus_next.
  elseif i_ucomm = mc_fc_find.
    l_modus = if_alv_lvc_search=>c_modus_first.
  endif.

  if mr_search is not bound.
    create object mr_search.
    set handler me->on_match_found for mr_search.
  endif.

  call method mr_search->execute
    exporting
      no_dialog         = space
      acc_mode          = m_acc_mode
      modus             = l_modus
      it_fieldcat       = lt_fieldcat
      it_fidx           = me->m_cl_variant->mt_filter_index
      s_current_cell    = ls_current_cell
*   IMPORTING
*     et_search_entries = lt_search_entries
*     e_number_of_hits  = l_number_of_hits
    changing
      cr_data           = mt_outtab.

  if ms_search is not initial.
    me->set_toolbar( abap_false ).
  endif.

endmethod.                    "


method search_define .

*... data declarations
  data:
    lt_mtdata type lvc_t_data,
    lt_stin   type lvc_t_stin,
    ls_info             type lvc_s_info,                    "Y6BK069609
    lt_area             type lvc_t_coll,
    ls_col_pos          type l_type_s_back_front_map,
    ls_column           type lvc_s_coll.

  data:
    ls_data type lvc_s_data.

  data:
    ls_search   type l_type_s_search,
    l_cancelled type sap_bool.

*** SEARCH DEFINE ***************************************
*... get column count
  describe table me->mt_info lines ls_search-s_area-columns.

*... get current cell
  me->get_current_cell(
    importing
      e_row = ls_search-s_position-row
      e_col = ls_search-s_position-column ).

  cl_gui_cfw=>flush( ).

* determine the frontend - backend  relation
  clear ls_search-t_col_pos.

  me->get_col_pos_id_base(
    importing
      col_pos_table = lt_area ).

  loop at lt_area into ls_column.
    ls_col_pos-front = ls_column-col_pos.
    read table me->mt_info into ls_info
            with key fieldname = ls_column-col_id-fieldname
            transporting col_pos.
    if sy-subrc eq 0.
      ls_col_pos-back = ls_info-col_pos.
      append ls_col_pos to ls_search-t_col_pos.
    endif.
  endloop.

*... adjust the column position from frontend to to backend
  read table ls_search-t_col_pos into ls_col_pos
          with key front = ls_search-s_position-column.
  if sy-subrc eq 0.
    ls_search-s_position-column = ls_col_pos-back.
  endif.

*... get index in mt_data for current cursor position
  add 1 to ls_search-s_area-columns.
  ls_search-s_position-index =
    ( ( ls_search-s_position-row - 1 ) * ls_search-s_area-columns ) +
    ls_search-s_position-column + 1.
  if ls_search-s_position-index lt 0.
    ls_search-s_position-index = 0.
  endif.
  subtract 1 from ls_search-s_area-columns.

*... set search value
  if ls_search-s_position-index is not initial.
*... retrieve mt_data information for the current cursor position
    me->lvc_table_fill(
      firstline                   = ls_search-s_position-index
      lastline                    = ls_search-s_position-index
      delete_entries_not_in_range = abap_false ).

*... read the information in mt_data
    read table mt_data into ls_data
      with key row_pos = ls_search-s_position-row
               col_pos = ls_search-s_position-column
      binary search transporting value.
    if sy-subrc eq 0.
      write ls_data-value to ls_search-s_criteria-value left-justified.
      shift ls_search-s_criteria-value left deleting leading space.
    endif.
  endif.

*... call search dialog
  ls_search-s_criteria-new = abap_true.
  do.
    call function 'ALV_POPUP_TO_SEARCH2'
      exporting
        i_inform       = ls_search-s_criteria-info
      importing
        e_cancelled    = l_cancelled
        e_new_search   = ls_search-s_criteria-new
      changing
        c_string       = ls_search-s_criteria-value
        c_search_order = ls_search-s_criteria-order
        c_sinh         = ls_search-s_criteria-as_word
        c_gzahl        = ls_search-s_criteria-all.
*... search has been cancelled
    if l_cancelled eq abap_true.
      exit.
    endif.

    me->search_start(
      changing
        cs_search = ls_search ).

    if me->m_acc_mode eq abap_true.
      exit.
    endif.
  enddo.

  if ms_search is not initial.
    me->set_toolbar( abap_false ).
  endif.

endmethod.                    "


method search_start .

*... data declarations
  data:
    lt_mtdata      type lvc_t_data,
    lt_stin        type lvc_t_stin,
    l_mtdata_lines type i.

  data:
    l_columns           type i,
    ls_info             type lvc_s_info,                    "Y6BK069609
    ls_col_pos          type l_type_s_back_front_map,
    lt_area             type lvc_t_coll,
    lt_selected_columns type lvc_t_col,
    ls_selected_column  type lvc_s_col,
    lt_column           type lvc_t_coll,
    ls_column           type lvc_s_coll.

  data:
    ls_position type l_type_s_search_position.

  data:
    l_search type sap_bool.

  data:
    l_get_package type sap_bool.

  data:
    ls_data type lvc_s_data.

  data:
    ls_result type l_type_s_search_position,

    l_intv1   type i,
    l_msgv1   type symsgv,
    l_msgv2   type symsgv.

*** SEARCH START ****************************************

*... set search criteria
  if cs_search is not supplied.
    cs_search = ms_search.
  endif.

*... if search value is initial then inform the user
  if cs_search-s_criteria-value eq space.
    message s000(0k) with text-843. "Bitte geben Sie einen Suchbegriff ein!

*... set search information on result
    message id sy-msgid type sy-msgty number sy-msgno
            with sy-msgv1 sy-msgv2 sy-msgv3 sy-msgv4
            into cs_search-s_criteria-info.

    exit.
  endif.

*... (1) set search area
*... (1.1) get amount of mt_data entries
  if m_dp_on_demand_avail is initial.
    describe table me->mt_data lines l_mtdata_lines.
  else.
    l_mtdata_lines = me->get_data_table_linecount( ).
  endif.
  if l_mtdata_lines ne cs_search-s_area-mtdata_lines.
    l_search = abap_true.
    cs_search-s_area-mtdata_lines = l_mtdata_lines.
  endif.

*... (1.2) get column count
  describe table mt_info lines l_columns.
  if l_columns ne cs_search-s_area-columns.
    l_search = abap_true.
    cs_search-s_area-columns = l_columns.
  endif.

*... (1.3) get search area
*... (1.3.1) get complete search area (all of the columns within the table)
  me->get_col_pos_id_base(
    importing
      col_pos_table = lt_area ).
*... (1.3.2) determine if only a specific search area is valid (marked columns)
  me->get_selected_columns(
    importing
      et_index_columns = lt_selected_columns ).

  cl_gui_cfw=>flush( ).

  if lt_selected_columns is not initial.
    loop at lt_selected_columns into ls_selected_column.
      read table lt_area into ls_column
        with key col_id-fieldname = ls_selected_column-fieldname.
      if sy-subrc eq 0.
        read table me->mt_info into ls_info
          with key fieldname = ls_selected_column-fieldname
          transporting col_pos.
        if sy-subrc eq 0.
          ls_column-col_pos = ls_info-col_pos.
        endif.
        append ls_column to lt_column.
      endif.
    endloop.
    lt_area = lt_column.
  endif.
  if lt_area ne cs_search-s_area-t_area.
    l_search = abap_true.
    cs_search-s_area-t_area = lt_area.
  endif.
  free:
    lt_area,
    lt_column,
    lt_selected_columns,
    ls_selected_column.

*... (2) set search package
*... (2.1) get current search position
  clear cs_search-s_position.
  if cs_search-s_criteria-new eq abap_false.
*... (2.1.1) get current cursor position
    call method me->get_current_cell
      importing
        e_row = ls_position-row
        e_col = ls_position-column.

    cl_gui_cfw=>flush( ).

*... (2.1.2) get index in mt_data for current cursor position
    add 1 to cs_search-s_area-columns.
    ls_position-index =
      ( ( ls_position-row - 1 ) * cs_search-s_area-columns ) +
      ls_position-column + 1 + 1.
    if ls_position-index lt 0.
      ls_position-index = 2.
    endif.
    subtract 1 from cs_search-s_area-columns.
*... (2.1.3) set current position
    cs_search-s_position = ls_position.
  endif.

*... (2.2) set position for search in package
  if cs_search-s_criteria-new eq abap_true or l_search eq abap_true.
    case cs_search-s_criteria-order.
      when lc_s_search_order-cursor_to_bottom or
           lc_s_search_order-cursor_to_top.
*... get current cell
        call method me->get_current_cell
          importing
            e_row = ls_position-row
            e_col = ls_position-column.

        cl_gui_cfw=>flush( ).

*... get index in mt_data for current cursor position
        add 1 to cs_search-s_area-columns.
        ls_position-index =
          ( ( ls_position-row - 1 ) * cs_search-s_area-columns ) +
          ls_position-column + 1.
        if ls_position-index lt 0.
          ls_position-index = 2.
        endif.
        subtract 1 from cs_search-s_area-columns.

      when lc_s_search_order-top_to_bottom or space.
        ls_position-row    = 1.
        ls_position-column = 1.
        ls_position-index  = 2.

      when lc_s_search_order-bottom_to_top.
        ls_position-column = cs_search-s_area-columns.
        ls_position-index  = cs_search-s_area-mtdata_lines.

        add 1 to cs_search-s_area-columns.
        ls_position-row =
          ( ( ls_position-index - ls_position-column - 1 ) /
          cs_search-s_area-columns ) + 1.
        subtract 1 from cs_search-s_area-columns.
    endcase.
  endif.

*... (2.3) set package start and end index for package retrieval
*          according to package size and position determined for start
  if cs_search-s_criteria-new eq abap_true or l_search eq abap_true.
    clear cs_search-s_package.
*... (2.3.1) set package size
    cs_search-s_package-size =
      ( 1365 div cs_search-s_area-columns ) * cs_search-s_area-columns.

*... (2.3.2) set package start and end index for package retrieval
    case cs_search-s_criteria-order.
      when lc_s_search_order-cursor_to_bottom or
           lc_s_search_order-top_to_bottom or space.
        cs_search-s_package-end_index   = ls_position-index - 1.
        cs_search-s_package-start_index =
          cs_search-s_package-end_index - cs_search-s_package-size.

      when lc_s_search_order-cursor_to_top or
           lc_s_search_order-bottom_to_top.
        cs_search-s_package-start_index = ls_position-index + 1.
        cs_search-s_package-end_index   =
          cs_search-s_package-start_index + cs_search-s_package-size - 1.
    endcase.
  endif.

*... (3) determine if search needs to be performed
  if cs_search-s_criteria-new eq abap_true or
     l_search eq abap_true.
    l_search = abap_true.
    clear:
      cs_search-s_result.
  else.
    if cs_search-s_criteria-all eq abap_true.
      l_search = abap_false.
    else.
      l_search = abap_true.
    endif.
  endif.

  data:
    l_force_get_package type abap_bool.

  if me->m_memory eq abap_true.
    l_force_get_package = abap_true.
  endif.

*... (4) start searching package wise
  while l_search eq abap_true.
*... determine if package needs to be retrieved
*    if package needs to be retrieved set next package definition
*    if package no longer in mt_data range -> then search is complete
    case cs_search-s_criteria-order.
      when lc_s_search_order-cursor_to_bottom or
           lc_s_search_order-top_to_bottom or space.
        if cs_search-s_package-position_index lt 1 or
           cs_search-s_package-position_index gt cs_search-s_package-end_index.
          cs_search-s_package-start_index =
            cs_search-s_package-end_index + 1.
          cs_search-s_package-end_index   =
            cs_search-s_package-start_index + cs_search-s_package-size.

          if cs_search-s_package-end_index gt cs_search-s_area-mtdata_lines.
            cs_search-s_package-end_index = cs_search-s_area-mtdata_lines.
          endif.

          l_get_package = abap_true.
        endif.

        if cs_search-s_package-start_index lt 2 or
           cs_search-s_package-start_index gt cs_search-s_area-mtdata_lines.
          exit.
        endif.

      when lc_s_search_order-cursor_to_top or
           lc_s_search_order-bottom_to_top.
        if cs_search-s_package-position_index le 1.
          cs_search-s_package-end_index   =
            cs_search-s_package-start_index - 1.
          cs_search-s_package-start_index =
            cs_search-s_package-end_index - cs_search-s_package-size + 1.

          if cs_search-s_package-start_index lt 2.
            cs_search-s_package-start_index = 2.
          endif.

          l_get_package = abap_true.
        endif.

        if cs_search-s_package-end_index gt cs_search-s_area-mtdata_lines or
           cs_search-s_package-end_index lt 2.
          exit.
        endif.
    endcase.

*... if package needs to be retrieved then retrieve package
*    and set package range and position
    if l_get_package eq abap_true or l_force_get_package eq abap_true.
*... get the data in package range
      me->lvc_table_fill(
        firstline                   = cs_search-s_package-start_index
        lastline                    = cs_search-s_package-end_index
        delete_entries_not_in_range = abap_false ).

      if l_get_package eq abap_true.
*... set the initial start position in package
        case cs_search-s_criteria-order.
          when lc_s_search_order-cursor_to_bottom or
               lc_s_search_order-top_to_bottom or space.
            cs_search-s_package-position_index = cs_search-s_package-start_index - 1.

          when lc_s_search_order-cursor_to_top or
               lc_s_search_order-bottom_to_top.
            cs_search-s_package-position_index = cs_search-s_package-end_index + 1.
        endcase.
      endif.

      if l_force_get_package eq abap_true.
        if me->m_memory eq abap_true.
          data:
            begin of ls_memory_map,
              index        type i,
              memory_index type i,
            end of ls_memory_map.

          data:
            l_row type i,
            l_col type i.

          l_row = cs_search-s_package-start_index div ( cs_search-s_area-columns + 1 ).
          l_col = cs_search-s_package-start_index mod ( cs_search-s_area-columns + 1 ).
          if l_col gt 0.
            add 1 to l_row.
          endif.
          subtract 1 from l_col.

          read table me->mt_data
            with key row_pos = l_row
                     col_pos = l_col binary search transporting no fields.

          ls_memory_map-index        = cs_search-s_package-start_index.
          ls_memory_map-memory_index = sy-tabix.
        endif.
      endif.

*... reset the variable for retreiving package
      l_get_package = abap_false.
      l_force_get_package = abap_false.
    endif.

*... get package cursor for entry in mt_data to be read
    case cs_search-s_criteria-order.
      when lc_s_search_order-cursor_to_bottom or
           lc_s_search_order-top_to_bottom or space.
        add 1 to cs_search-s_package-position_index.

      when lc_s_search_order-cursor_to_top or
           lc_s_search_order-bottom_to_top.
        subtract 1 from cs_search-s_package-position_index.
    endcase.

*... get entry in table mt_data
    data:
      l_index type i.

    case me->m_memory.
      when abap_true.
        l_index = cs_search-s_package-position_index - ls_memory_map-index.
        l_index = ls_memory_map-memory_index + l_index.
      when others.
        l_index = cs_search-s_package-position_index.
    endcase.

    read table mt_data into ls_data
      index l_index.
    if sy-subrc ne 0.
      continue.
    endif.

*... search only in selected column area
    read table cs_search-s_area-t_area into ls_column
      with key col_pos = ls_data-col_pos.
    if sy-subrc ne 0.
      continue.
    endif.

*... search for search value in cell
    write ls_data-value to ls_data-value left-justified.
    shift ls_data-value left deleting leading space.

    data:
      ls_search_result type cl_salv_bs_search=>s_type_search_result.

    ls_search_result = cl_salv_bs_search=>search(
                         content      = ls_data-value
                         search_value = cs_search-s_criteria-value
                         as_word      = cs_search-s_criteria-as_word ).
    if ls_search_result-found eq abap_true.
      sy-subrc = 0.
      sy-fdpos = ls_search_result-offset.
    else.
      sy-subrc = 4.
    endif.

    clear ls_result.
    if sy-subrc eq 0.
*... search value found -> add to result table
      ls_result-start_offset = sy-fdpos.
      if ls_result-start_offset le 0.
        ls_result-start_offset = 1.
      endif.
      ls_result-end_offset =
        ls_result-start_offset + strlen( cs_search-s_criteria-value ).

      ls_result-row    = ls_data-row_pos.
*      ls_result-column = ls_data-col_pos.
      read table cs_search-t_col_pos into ls_col_pos with key back = ls_data-col_pos. ">>>>>Y6BK069609
      if sy-subrc ne 0.
        ls_col_pos-front = ls_data-col_pos.
      endif.             "<<<<<<<<<<<<<Y6BK069609
      ls_result-column = ls_col_pos-front.
      add 1 to cs_search-s_area-columns.
      ls_result-index  = ( ( ls_result-row - 1 ) * cs_search-s_area-columns ) +
                         ls_result-column + 1 + 1.
      subtract 1 from cs_search-s_area-columns.

      insert ls_result into table cs_search-s_result-t_result.

*... determining on search criteria display the result or continue with search
      case cs_search-s_criteria-all.
        when abap_false.
*... if position
          if cs_search-s_position is not initial.
            case cs_search-s_criteria-order.
              when lc_s_search_order-cursor_to_bottom or
                   lc_s_search_order-top_to_bottom or space.
                if ls_result-index lt cs_search-s_position-index.
                  continue.
                endif.

              when lc_s_search_order-cursor_to_top or
                   lc_s_search_order-bottom_to_top.
                if ls_result-index gt cs_search-s_position-index.
                  continue.
                endif.
            endcase.
          endif.

          me->set_current_cell(
            i_start_position = ls_result-start_offset
            i_end_position   = ls_result-end_offset
            i_row            = ls_result-row
            i_column         = ls_result-column ).

          describe table cs_search-s_result-t_result lines l_intv1.

          message s000(0k) with text-848 ':' l_intv1.
          exit.

        when abap_true.
      endcase.
    endif.
  endwhile.

*... (5) get the search results
  if cs_search-s_result-t_result is initial.
*... nothing could be found
    message s000(0k) with text-844.
  else.
    case cs_search-s_criteria-all.
      when abap_false.
        if ls_result is initial.
*... no further matches could be found
          message s000(0k) with text-849.
        endif.

      when abap_true.
*... get result amount
        describe table cs_search-s_result-t_result lines l_intv1.

*... determine the result index of the result table
        if cs_search-s_position is not initial.
          loop at cs_search-s_result-t_result transporting no fields
            where index lt cs_search-s_position-index.
            if sy-tabix gt cs_search-s_result-position_index.
              cs_search-s_result-position_index = sy-tabix.
            endif.
          endloop.
        endif.

        case cs_search-s_criteria-order.
          when lc_s_search_order-cursor_to_bottom or
               lc_s_search_order-top_to_bottom or space.
            add 1 to cs_search-s_result-position_index.
            if cs_search-s_result-position_index gt l_intv1.
              cs_search-s_result-position_index = 1.
            endif.

          when lc_s_search_order-cursor_to_top or
               lc_s_search_order-bottom_to_top.
            subtract 1 from cs_search-s_result-position_index.
            if cs_search-s_result-position_index lt 1.
              cs_search-s_result-position_index = l_intv1.
            endif.
        endcase.

        read table cs_search-s_result-t_result into ls_result
          index cs_search-s_result-position_index.
        if sy-subrc eq 0.
          me->set_current_cell(
            i_start_position = ls_result-start_offset
            i_end_position   = ls_result-end_offset
            i_row            = ls_result-row
            i_column         = ls_result-column ).

          write cs_search-s_result-position_index to l_msgv1 left-justified.
          write l_intv1 to l_msgv2 left-justified.
          concatenate l_msgv1 text-847 l_msgv2 into l_msgv1 separated by space.

          message s000(0k) with text-846 ':' l_msgv1.
        endif.
    endcase.
  endif.

*... set new search false
  cs_search-s_criteria-new = abap_false.
  ms_search = cs_search.

*... set search information on result
  message id sy-msgid type sy-msgty number sy-msgno
          with sy-msgv1 sy-msgv2 sy-msgv3 sy-msgv4
          into cs_search-s_criteria-info.

endmethod.


method select_text_in_curr_cell.

  call method me->select_text_in_current_cell
              exporting from = 1
                        to   = 100.

endmethod.


method select_variant .

  if _is_bridge_active( ) = abap_true.
    macro_bridge_call_data.
    macro_bridge_method_name cl_gui_alv_grid select_variant.
    macro_bridge_exception: canceled 1,
                            not_found 2.
    try.
      macro_bridge_call.
    catch cx_salv_grx_nc_meth_exception into lr_exception.
      if lr_exception->exception_number = 1.
        raise canceled.
      else.
        raise not_found.
      endif.
    endtry.
    exit.
  endif.

  data: l_exit              type c,
        ls_bds_with_url     type lvc_s_bds,
        ls_new_view         type ui_func,
        lt_roid             type lvc_t_roid,
        lt_graphics_columns type lvc_t_fnam.

  if m_cl_variant is initial.
    create object m_cl_variant
        exporting
           it_outtab             = mt_outtab
           it_fieldcatalog       = m_cl_variant->mt_fieldcatalog
           it_sort               = m_cl_variant->mt_sort
           it_filter             = m_cl_variant->mt_filter
           it_grouplevels_filter = m_cl_variant->mt_grouplevels_filter
           is_variant            = m_cl_variant->ms_variant
           is_layout             = m_cl_variant->ms_layout
           i_variant_save        = m_cl_variant->m_variant_save
           i_variant_default     = m_cl_variant->m_variant_default
           i_www_active          = m_www
           is_print              = m_cl_variant->ms_print
           ir_salv_adapter       = me->r_salv_adapter
           i_fcat_complete       = m_fcat_complete.
  else.
    call method m_cl_variant->set_values
        exporting
           it_outtab             = mt_outtab
           i_www_active          = m_www.
  endif.

  call method m_cl_variant->select_variant
       exporting
            i_bypassing_buffer  = m_bypassing_buffer
            i_buffer_active     = m_buffer_active
       importing
            e_exit              = l_exit
       changing
            c_invalid_frontend_fieldcat = m_invalid_frontend_fieldcat
            c_calculate_totals = m_cl_variant->m_calculate_totals
       exceptions
            canceled                   = 1
            not_found                  = 2
            others                     = 3.
  case sy-subrc.
    when 1.
      raise canceled.
    when 2.
      raise not_found.
  endcase.

*get BDS variables
  call method m_cl_variant->get_values_bds
              exporting i_ok_code       = 'DUMMY'
              importing es_bds_with_url = ls_bds_with_url.

  m_next_alv_bds = ls_bds_with_url.

  call method m_cl_variant->get_view importing e_view = m_next_view.

* Graphic call
  if not me->m_www = 'X'.
    call method m_cl_variant->load_graphics
                changing cr_graphics_container = mr_graphics_container.
  endif.

endmethod.


METHOD selfield_get .

  DATA: ls_row_id TYPE lvc_s_row,
        ls_col_id TYPE lvc_s_col,
        l_value   TYPE lvc_s_data-value.

  CALL METHOD me->get_current_cell
    IMPORTING
      es_row_id = ls_row_id
      es_col_id = ls_col_id
      e_value   = l_value.

  IF me->is_cache_valid( ) NE abap_true or www_active eq abap_true.

    CALL METHOD cl_gui_cfw=>flush.

  ENDIF.

  es_selfield-s_row_id = ls_row_id.
  es_selfield-s_col_id = ls_col_id.
  es_selfield-value    = l_value.

  CALL FUNCTION 'LVC_TRANSFER_TO_KKBLO'
    EXPORTING
      is_selfield_lvc   = es_selfield
    IMPORTING
      es_selfield_kkblo = es_selfield_kkblo.
  IF sy-subrc NE 0.
  ENDIF.

ENDMETHOD.


method send_data_of_grid .

  call method me->print_backend exporting i_preview = 'X'
                                          i_export  = 'S'.

endmethod.


method set_3d_border.

  call method set_3d_border_base
       exporting  border = border
       exceptions others = 1.
  if sy-subrc ne 0.
    raise error.
  endif.

endmethod.


method set_autoredraw.

  call method me->set_auto_redraw exporting enable = i_enable.

endmethod.


method set_columns_invisible .

  data: lt_index_columns          type lvc_t_col,
        ls_fieldcatalog           type line of lvc_t_fcat,
        l_flg_obl_column_selected type c,
        l_lin                     type p,
        ls_row_id                 type lvc_s_row,
        ls_col_id                 type lvc_s_col.

  call method me->get_scroll_info_via_id
              importing es_row_info = ls_row_id
                        es_col_info = ls_col_id.

  call method me->get_selected_columns
              importing et_index_columns = lt_index_columns.

  IF me->is_cache_valid( ) NE abap_true or www_active eq abap_true.

    CALL METHOD cl_gui_cfw=>flush.

  ENDIF.

  describe table lt_index_columns lines l_lin.
  if l_lin gt 0.
    loop at m_cl_variant->mt_fieldcatalog into ls_fieldcatalog.
      read table lt_index_columns
                 with key fieldname = ls_fieldcatalog-fieldname
                 transporting no fields.
      if sy-subrc eq 0.
        if ls_fieldcatalog-no_out ne 'O'.
          ls_fieldcatalog-no_out = 'X'.
          modify m_cl_variant->mt_fieldcatalog from ls_fieldcatalog.
        else.
          l_flg_obl_column_selected = 'X'.
        endif.
      endif.
    endloop.

    if sy-subrc eq 0.
      call method me->set_scroll_info_via_id
                  exporting is_row_info = ls_row_id
                            is_col_info = ls_col_id.
      me->m_invalid_frontend_fieldcat = 'X'.
      call method me->refresh_table_display.
    endif.

    if l_flg_obl_column_selected eq 'X'.
      message s101(0k).
    endif.
  else.
    message s005(0k).
  endif.

endmethod.


method set_current_cell .

  call method me->set_current_cell_base  exporting  row = i_row
                                                    col = i_column.

  call method me->select_text_in_current_cell
              exporting from = i_start_position
                        to   = i_end_position.

endmethod.


method set_current_cell_via_id .

  field-symbols: <ls_fieldcat> type lvc_s_fcat.

  data: lt_roid     type lvc_t_roid,
        ls_roid     type lvc_s_roid,
        lt_row      type lvc_t_row,
        ls_row      type lvc_s_row,
        l_position  type i,
        l_col_id    type i,
        l_fieldname type lvc_s_fcat-fieldname.

  if me->m_performance eq 'X' and
     me->m_roids_sent  eq space and
     ( not is_row_id is initial or not is_row_no is initial ).
    call method me->set_row_id
      exporting
        row_id_table = mt_roid.
    me->m_roids_sent = 'X'.
  endif.

  ls_roid = is_row_no.
  append ls_roid to lt_roid.

  ls_row  = is_row_id.
  append ls_row to lt_row.

  move is_column_id to l_fieldname.
  read table m_cl_variant->mt_fieldcatalog assigning <ls_fieldcat>
             with key fieldname = l_fieldname.
  if sy-subrc eq 0.
    l_col_id = <ls_fieldcat>-col_id.
  endif.

  if not is_row_id is initial and
         is_row_no is initial.
    call method map_row_to_roid
      exporting
        it_index_rows = lt_row
      importing
        et_row_no     = lt_roid.
    read table lt_roid into ls_roid index 1.
  endif.

  call method me->set_current_cell_id2
    exporting
      row_id = ls_roid
      col_id = l_col_id.

endmethod.                    "set_current_cell_via_id


method set_delta_cells.

  field-symbols: <tab1>    type standard table,
                 <ls_wa>   type any,
                 <l_field> type any.

  data: ls_delta_table type lvc_s_modi,
        lp_wa          type ref to data,
        lt_moce        type lvc_t_moce,
        ls_moce        type lvc_s_moce,
        ls_fieldcat    type lvc_s_fcat,
        ls_good_cells  type lvc_s_modi,
        ls_mod_cells   type lvc_s_modi.

*... initialization
  clear mt_delta_cells_inserted.

*... (1) check Outtab
  assign mt_outtab->* to <tab1>.
  if not sy-subrc is initial.
    message a534(0k).
  endif.

  create data lp_wa like line of <tab1>.
  assign lp_wa->* to <ls_wa>.

  loop at it_delta_cells into ls_delta_table.
* in case the cell is an exception, display the icon instead of the value
    if ls_delta_table-fieldname = m_cl_variant->ms_layout-EXCP_FNAME
      and not m_cl_variant->ms_layout-EXCP_FNAME is initial.

      if m_cl_variant->ms_layout-EXCP_LED is initial.

        if ls_delta_table-value = '1'.
          ls_delta_table-value =  '@0A@'.
        elseif ls_delta_table-value = '2'.
          ls_delta_table-value =  '@09@'.
        elseif ls_delta_table-value = '3'.
          ls_delta_table-value =  '@08@'.
        endif.

      else.

        if ls_delta_table-value = '1'.
          ls_delta_table-value =  '@5C@'.
        elseif ls_delta_table-value = '2'.
          ls_delta_table-value =  '@5D@'.
        elseif ls_delta_table-value = '3'.
          ls_delta_table-value =  '@5B@'.
        endif.

      endif.

    endif.

    if i_frontend_only is initial.
      read table <tab1> into <ls_wa> index ls_delta_table-row_id.
      if sy-subrc ne 0.
        read table mr_data_changed->mt_inserted_rows
                   transporting no fields
                   with key row_id = ls_delta_table-row_id.
        if sy-subrc ne 0.
          message x000(0k).
        else.
          append ls_delta_table to mt_delta_cells_inserted.
        endif.
      endif.
    endif.

    read table mt_col_pos_id_table
               with key col_id-fieldname = ls_delta_table-fieldname
               transporting no fields.
    check sy-subrc eq 0.

    read table m_cl_variant->mt_fieldcatalog into ls_fieldcat
               with key fieldname = ls_delta_table-fieldname.

    assign component ls_fieldcat-fieldname
                     of structure <ls_wa> to <l_field>.
    if sy-subrc ne 0.
      message x000(0k).
    endif.

    <l_field> = ls_delta_table-value.
    if i_frontend_only is initial.
      modify <tab1> from <ls_wa> index ls_delta_table-row_id.
    endif.
    call method cl_gui_alv_grid=>cell_display
                exporting is_data     = <ls_wa>
                          i_int_value = <l_field>
                importing e_ext_value = ls_moce-value
                changing  cs_fieldcat = ls_fieldcat.

    ls_moce-style   = ls_delta_table-style.
    ls_moce-style2  = ls_delta_table-style2.
    ls_moce-style3  = ls_delta_table-style3.
    ls_moce-style4  = ls_delta_table-style4.

    ls_moce-row_id = ls_delta_table-row_id.
    ls_moce-col_id = ls_fieldcat-col_id.
    append ls_moce to lt_moce.
  endloop.

  if not lt_moce is initial.
    call method me->set_delta_table exporting modified = i_modified
                                    changing delta_table = lt_moce.
  endif.

endmethod.


method set_drop_down_table.

  data: ls_non_aliases type lvc_s_drop,
        ls_new_aliases type lvc_s_dral,
        l_tabix like sy-tabix.

  if not it_drop_down_alias is initial.

    loop at it_drop_down_alias into ls_new_aliases.
      delete m_dropdown_aliases where handle = ls_new_aliases-handle.
    endloop.

    loop at it_drop_down_alias into ls_new_aliases.
      move-corresponding  ls_new_aliases to ls_non_aliases.
      append ls_non_aliases to it_drop_down.
      append ls_new_aliases to m_dropdown_aliases.
    endloop.

  endif.

  call method me->set_drop_down_items
              exporting dd_items = it_drop_down.

endmethod.


method set_error_log.

  call method set_errorloghandle
              exporting ir_alv = ir_alv.

endmethod.


method set_fieldcatalog .

  m_cl_variant->mt_fieldcatalog = it_fieldcatalog.

*... complete fieldcatalog

    call function 'LVC_FIELDCAT_COMPLETE'
      exporting
        i_complete       = 'X'
        is_layout        = m_cl_variant->ms_layout
        i_refresh_buffer = m_bypassing_buffer
        i_buffer_active  = m_buffer_active
        i_fcat_complete  = m_fcat_complete
      importing
        e_edit           = m_edit_cols
      changing
        ct_fieldcat      = m_cl_variant->mt_fieldcatalog.

*... Add for each column which WRITE-routine should be used
  call function 'LVC_GLOBALS_FOR_OUTPUT'
    changing
      ct_fieldcat = m_cl_variant->mt_fieldcatalog.

*... set field references
  call method me->set_field_references.

*... set editability
  if cl_gui_alv_grid=>offline( ) is initial.
    call method me->set_ready_for_input_internal.
  endif.

  me->m_invalid_frontend_fieldcat = 'X'.

  check_for_bidi_flag( ).

endmethod.


method set_field_references .

  call function 'LVC_DEP_REF_FIELDS_GET'
       exporting
            it_fieldcat   = m_cl_variant->mt_fieldcatalog
       importing
            et_value_unit = mt_value_unit
            et_unit_value = mt_unit_values.

endmethod.


method set_filter_criteria .

*... (1) Trace?
  if not mr_trace is initial.
    call method mr_trace->add_trace_item
      exporting
        i_trace_item = 'SET_FILTER_CRITERIA'
        ir_variant   = m_cl_variant
        it_data      = mt_data
        it_info      = mt_info.
  endif.

  field-symbols: <ls_fieldcat> type lvc_s_fcat.

  data: ls_filter type lvc_s_filt.

  if m_cl_variant->mt_fieldcatalog is initial.
    raise no_fieldcatalog_available.
  endif.

  m_cl_variant->mt_filter = it_filter.

  loop at m_cl_variant->mt_filter into ls_filter.
    read table m_cl_variant->mt_fieldcatalog assigning <ls_fieldcat>
               with key fieldname = ls_filter-fieldname.
    if sy-subrc eq 0.
      move-corresponding <ls_fieldcat> to ls_filter.
      modify m_cl_variant->mt_filter from ls_filter.
    endif.
  endloop.

endmethod.


method set_filter_index .

  m_cl_variant->mt_filter_index = it_filter_index.

endmethod.


method set_flag_total_column .
*---------------------------------------------------------------------*
*  METHOD set_flag_total_column
*---------------------------------------------------------------------*
*
*---------------------------------------------------------------------*

  field-symbols: <ls_fieldcat> type lvc_s_fcat.

  data: lt_selected_columns    type lvc_t_col,
        lt_selected_columns_wa type line of lvc_t_col,
        lflg_refresh           type c,
        lt_columns_info        type lvc_s_fcat,
        i_col_id               type lvc_s_col,
        lflg_count_ok          type c.

  call method me->get_selected_columns
    importing
      et_index_columns = lt_selected_columns[].

  if me->is_cache_valid( ) ne abap_true or www_active eq abap_true.

    call method cl_gui_cfw=>flush.

  endif.

  if i_ucomm = mc_fc_count.
    lt_selected_columns_wa-fieldname = m_cl_variant->ms_layout-countfname.
    append lt_selected_columns_wa to lt_selected_columns.
  endif.

  loop at lt_selected_columns into lt_selected_columns_wa.
    if lt_selected_columns_wa-fieldname =
                    m_cl_variant->ms_layout-countfname.
      if lflg_count_ok = 'X'.
        continue.
      endif.
      lflg_count_ok = 'X'.
    endif.

    read table m_cl_variant->mt_fieldcatalog assigning <ls_fieldcat>
               with key fieldname = lt_selected_columns_wa-fieldname.

    if <ls_fieldcat>-no_sum ne 'X'.
      case i_ucomm.
        when '&AVERAGE'.
          if <ls_fieldcat>-do_sum eq 'C'.
            clear <ls_fieldcat>-do_sum.
          else.
            <ls_fieldcat>-do_sum = 'C'.
          endif.

        when '&MINIMUM'.
          if <ls_fieldcat>-do_sum eq 'B'.
            clear <ls_fieldcat>-do_sum.
          else.
            <ls_fieldcat>-do_sum = 'B'.
          endif.

        when '&MAXIMUM'.
          if <ls_fieldcat>-do_sum eq 'A'.
            clear <ls_fieldcat>-do_sum.
          else.
            <ls_fieldcat>-do_sum = 'A'.
          endif.

        when mc_fc_count.
          if <ls_fieldcat>-fieldname eq m_cl_variant->ms_layout-countfname.
            if <ls_fieldcat>-no_out = 'X'.
              <ls_fieldcat>-do_sum = 'X'.
              <ls_fieldcat>-col_pos = 9999.
              <ls_fieldcat>-no_out = ' '.
              call method scroll_to_bottom.
              m_scroll_to_bottom = 'X'.
              i_col_id-fieldname = <ls_fieldcat>-fieldname.
              call method set_scroll_info_via_id
                exporting
                  is_col_info = i_col_id.
            else.
              <ls_fieldcat>-do_sum = ' '.
              <ls_fieldcat>-no_out = 'X'.
            endif.
          endif.

        when others.
          if <ls_fieldcat>-do_sum eq 'X'.
            clear <ls_fieldcat>-do_sum.
          else.
            <ls_fieldcat>-do_sum = 'X'.
          endif.
      endcase.

      lflg_refresh = 'X'.
    else.
      message s003(0k) with <ls_fieldcat>-seltext.
    endif.
  endloop.
  if sy-subrc ne 0.
    raise no_columns_selected.
  else.
    if lflg_refresh ne 'X'.
      raise no_column_that_can_be_totaled.
    endif.
  endif.

endmethod.                    "set_flag_total_column


method set_frontend_fieldcatalog .

  break-point id ALV_GRID.

*... (1) Trace?
  if not mr_trace is initial.
    call method mr_trace->add_trace_item
      exporting
        i_trace_item = 'SET_FRONTEND_FIELDCATALOG'
        ir_variant   = m_cl_variant
        it_data      = mt_data
        it_info      = mt_info.
  endif.

  m_init_toolbar = 'X'.

  call method me->set_fieldcatalog
    exporting
      it_fieldcatalog = it_fieldcatalog.

endmethod.                    "set_frontend_fieldcatalog


method set_frontend_layout .

*... (1) Trace?
  if not mr_trace is initial.
    call method mr_trace->add_trace_item
      exporting
        i_trace_item = 'SET_FRONTEND_LAYOUT'
        ir_variant   = m_cl_variant
        it_data      = mt_data
        it_info      = mt_info.
  endif.

  m_cl_variant->ms_layout = is_layout.

  if not ( offline( ) is initial ) .
    m_init_toolbar = 'X'.
  endif.

  call method me->set_layout_properties.

endmethod.


method SET_FRONTEND_PRINT .

  m_cl_variant->ms_print  = is_print.

endmethod.


method set_function_code .

*... (1) Trace?
  if not mr_trace is initial.
    call method mr_trace->add_trace_item
      exporting
        i_trace_item = 'SET_FUNCTION_CODE'
        ir_variant   = m_cl_variant
        it_data      = mt_data
        it_info      = mt_info
        i_ucomm      = c_ucomm.
  endif.

  data: l_ucomm type sy-ucomm,
        lflg_save type c,
        l_refresh_mode type c,

        begin of ls_stable,
          row type c,
          col type c,
        end of ls_stable.

  call method transfer_fcode_slis_to_lvc
    exporting
      i_fcode_slis   = c_ucomm
    importing
      e_fcode_lvc    = l_ucomm
    exceptions
      no_match_found = 1.
  if sy-subrc eq 0.
*... Trace?
    if not mr_trace is initial.
      call method mr_trace->add_trace_item
        exporting
          i_trace_item = 'EVENT: BEFORE_USER_COMMAND'
          ir_variant   = m_cl_variant
          it_data      = mt_data
          it_info      = mt_info
          i_ucomm      = l_ucomm.
    endif.
  else.
    raise event before_user_command exporting e_ucomm = l_ucomm.
    exit.
  endif.

  clear c_ucomm.

  call method me->get_frontend_fieldcatalog
    importing
      et_fieldcatalog = m_cl_variant->mt_fieldcatalog.

  IF me->is_cache_valid( ) NE abap_true or www_active eq abap_true.

    CALL METHOD cl_gui_cfw=>flush.

  ENDIF.

  call method me->execute_fcode
    exporting
      i_ucomm        = l_ucomm
    importing
      e_stable_col   = ls_stable-col
      e_stable_row   = ls_stable-row
      e_refresh_mode = l_refresh_mode
      e_save         = lflg_save.
  if lflg_save = 'X'.
    c_ucomm = mc_fc_data_save.
  endif.

  call method me->set_auto_redraw
    exporting
      enable = 0.

  if l_refresh_mode eq mc_soft.
    call method me->soft_refresh_table_display
      exporting
        is_stable = ls_stable.
  elseif l_refresh_mode eq mc_full.
    call method me->refresh_table_display
      exporting
        is_stable = ls_stable.
  endif.

  call method me->set_auto_redraw
    exporting
      enable = 1.

endmethod.                    "set_function_code


method set_graphics_container.

  mr_graphics_container = i_graphics_container.

endmethod.


method set_gridtitle.

* ...
  m_cl_variant->ms_layout-grid_title = i_gridtitle.

*... Titelzeile
  call method me->set_title_text
              exporting text = m_cl_variant->ms_layout-grid_title.

endmethod.


method set_header_transport.

  m_header_transport = i_header_transport.

endmethod.


method SET_HTML_HEADER .
*   Preparation after SET_TABLE_FOR_DISPLAY, causes this call in
*   Fullscreen ALV
  data:
    lt_header      type slis_t_listheader.

  case m_view.
    when mc_fc_view_grid.
    when mc_fc_view_excel.
*    ... set the header data for excel.
      import it_list_commentary to lt_header
          from memory id 'DYNDOS_FOR_ALV_EXCEL'.
      if _is_bridge_active( ) = abap_false.
        call method set_header_for_oi
                 exporting it_header = lt_header.
        call method me->update_frontend.
      else.
        macro_bridge_call_data.
        macro_bridge_method_name cl_gui_alv_grid set_html_header.
        macro_bridge_parameter exporting: it_header lt_header.
        macro_bridge_call.
      endif.
      free memory id 'DYNDOS_FOR_ALV_EXCEL'.
    when mc_fc_view_lotus.
      call method me->update_frontend.
    when mc_fc_view_crystal.
      call method me->update_frontend.
  endcase.
endmethod.


method set_html_loader_to_memory.

  data ls_html type w3html.
  data lt_html type standard table of w3html.

  concatenate '<html>'
              '<script>'
              '  function onloadX()'
              '  {   window.navigate('
              into ls_html.                                 "#EC NOTEXT
  append ls_html to lt_html.

  concatenate '"' i_url '"' into ls_html.
  append ls_html to lt_html.           "http://www.lufthansa.com

  concatenate ');   }'
              '</script>'
              '<body onload="onloadX()">'
              ' please wait ... '
              '</body>'
              '</html>' into ls_html.                       "#EC NOTEXT
  append ls_html to lt_html.

  export html from lt_html to memory id 'WWW_ALV_HTML'.

endmethod.


method set_hyperlink_table.

  mt_hyperlinks = it_hyperlink.

  if ( m_batch_mode        eq 'X'       or not
       m_cl_variant->ms_print-print is initial ) and
     m_cl_variant->ms_layout-xidirect is initial.
  else.
    call method me->set_hyperlinks exporting links_table = it_hyperlink.
  endif.

endmethod.


method set_layout_of_doublegrid.

  data: lt_tabstrip type dtc_t_ts,
        ls_tabstrip type dtc_s_ts.

  if is_dtc_layout-t_tabstrip is initial.
    ls_tabstrip-ts_default   = 'X'.
    ls_tabstrip-ts_ucomm     = 'ALV_M_R1'.
    ls_tabstrip-ts_header    = text-059. "Spaltenauswahl.
    ls_tabstrip-ts_order     = 1.
    ls_tabstrip-grid1style   = 1.
    ls_tabstrip-grid2style   = 0.
    clear ls_tabstrip-grid1notem.
    ls_tabstrip-grid2notem   = 'X'.
    append ls_tabstrip to lt_tabstrip.

    clear ls_tabstrip-ts_default.
    ls_tabstrip-ts_ucomm     = 'ALV_M_R1_SUM'.
    append ls_tabstrip to lt_tabstrip.

    clear ls_tabstrip-ts_default.
    ls_tabstrip-ts_ucomm     = 'ALV_M_R2'.
    ls_tabstrip-ts_header    = text-058. "Sortierung.
    ls_tabstrip-ts_order     = 2.
    ls_tabstrip-grid1style   = 1.
    ls_tabstrip-grid2style   = 0.
    clear ls_tabstrip-grid1notem.
    ls_tabstrip-grid2notem   = 'X'.
    append ls_tabstrip to lt_tabstrip.

    clear ls_tabstrip-ts_default.
    ls_tabstrip-ts_ucomm     = 'ALV_M_R2_ZSUM'.
    append ls_tabstrip to lt_tabstrip.

    clear ls_tabstrip-ts_default.
    ls_tabstrip-ts_ucomm     = 'ALV_M_R3'.
    ls_tabstrip-ts_header    = text-057. "Filter.
    ls_tabstrip-ts_order     = 3.
    ls_tabstrip-grid1style   = 1.
    ls_tabstrip-grid2style   = 0.
    clear ls_tabstrip-grid1notem.
    clear ls_tabstrip-grid2notem.
    append ls_tabstrip to lt_tabstrip.

    clear ls_tabstrip-ts_default.
    ls_tabstrip-ts_ucomm     = 'ALV_M_R4'.
    ls_tabstrip-ts_header    = text-056. "Ansicht.
    ls_tabstrip-ts_order     = 4.
    append ls_tabstrip to lt_tabstrip.

    clear ls_tabstrip-ts_default.
    ls_tabstrip-ts_ucomm     = 'ALV_M_R4_EXCEL'.
    append ls_tabstrip to lt_tabstrip.

    clear ls_tabstrip-ts_default.
    ls_tabstrip-ts_ucomm     = 'ALV_M_R4_CRYSTAL'.
    append ls_tabstrip to lt_tabstrip.

    clear ls_tabstrip-ts_default.
    ls_tabstrip-ts_ucomm     = 'ALV_M_R4_LOTUS'.
    append ls_tabstrip to lt_tabstrip.

    clear ls_tabstrip-ts_default.
    ls_tabstrip-ts_ucomm     = 'ALV_M_R5'.
    ls_tabstrip-ts_header    = text-065. "Globale Einstellungen
    ls_tabstrip-ts_order     = 5.
    append ls_tabstrip to lt_tabstrip.

    clear ls_tabstrip-ts_default.
    ls_tabstrip-ts_ucomm     =  'ALV_M_R6'.
    ls_tabstrip-ts_header    = text-066. "Weboptionen
    ls_tabstrip-ts_order     = 6.
    append ls_tabstrip to lt_tabstrip.
    m_cl_variant->ms_dtc_layout-t_tabstrip = lt_tabstrip.
  else.
    m_cl_variant->ms_dtc_layout-t_tabstrip = is_dtc_layout-t_tabstrip.
  endif.

endmethod.


method set_layout_properties.
*---------------------------------------------------------------------*
*  METHOD set_layout_properties
*---------------------------------------------------------------------*
*
*---------------------------------------------------------------------*

  include <cl_alv_control>.

  data: l_style     type i.
  data: lt_events   type cntl_simple_events.
  data: event       type cntl_simple_event.
  check m_batch_mode is initial.

  check cl_gui_alv_grid=>offline( ) is initial.

  if m_cl_variant->ms_layout-no_totexp eq 'X'.
    call method me->set_total_expanders
      exporting
        visible = 0.
  else.
    call method me->set_total_expanders
      exporting
        visible = 1.
  endif.

  if m_cl_variant->ms_layout-no_colexpd eq 'X'.
    call method me->set_single_col_auto_resize
      exporting
        enable = 0.
  else.
    call method me->set_single_col_auto_resize
      exporting
        enable = 1.
  endif.

*... nur im editierbaren Grid soll diese Mölichkeit bestehen
  if is_ready_for_input( ) eq 1.
    if m_cl_variant->ms_layout-no_rowmove eq 'X'.
      call method me->set_drag_drop_rows
        exporting
          enable = 0.
    else.
      call method me->set_drag_drop_rows
        exporting
          enable = 1.
    endif.
  endif.

  if m_cl_variant->ms_layout-no_rowins eq 'X'.
    call method me->set_row_delete_allowed
      exporting
        allowed = 0.
    call method me->set_row_insert_allowed
      exporting
        allowed = 0.
  else.
    call method me->set_row_delete_allowed
      exporting
        allowed = 1.
    call method me->set_row_insert_allowed
      exporting
        allowed = 1.
  endif.

  data: l_size type i.

  case m_cl_variant->ms_layout-smalltitle.
    when 'X'.
      l_size = m_title_size_normal.                           "normal
    when ' '.
      l_size = m_title_size_large.                             "large
    when 'M'.
      l_size = m_title_size_medium.                            "medium
  endcase.

  call method me->set_title_size
    exporting
      size = l_size.

  if m_cl_variant->ms_layout-sgl_clk_hd eq 'X'.
    if M_COL_CLICK_REGISTERED is initial.
      call method me->get_registered_events
        importing
          events = lt_events.

      event-eventid    = evt_click_col_header.
      event-appl_event = m_appl_events.
      append event to lt_events.

      call method me->set_registered_events_internal
        exporting
          events = lt_events.

      M_COL_CLICK_REGISTERED = 'X'.
    endif.
  else.
    if M_COL_CLICK_REGISTERED is not initial.
      call method me->get_registered_events
        importing
          events = lt_events.

      call method me->set_registered_events_internal
        exporting
          events = lt_events.

      M_COL_CLICK_REGISTERED = SPACE.
    endif.
  endif.

  if m_cl_variant->ms_layout-no_vgridln eq 'X'.
    call method me->set_vertical_grid_lines
      exporting
        visible = 0.
  else.
    call method me->set_vertical_grid_lines
      exporting
        visible = 1.
  endif.

  if m_cl_variant->ms_layout-no_hgridln eq 'X'.
    call method me->set_horizontal_grid_lines
      exporting
        visible = 0.
  else.
    call method me->set_horizontal_grid_lines
      exporting
        visible = 1.
  endif.

  if m_cl_variant->ms_layout-no_toolbar eq 'X'.
    call method me->set_toolbar_visible
      exporting
        visible = 0.
  else.
    call method me->set_toolbar_visible
      exporting
        visible = 1.
  endif.

  call method me->set_ready_for_input_internal.

* Titelzeile
  call method me->set_title_text
    exporting
      text = m_cl_variant->ms_layout-grid_title.

  clear l_style.
  l_style = alv_style_align_left_center. " alv_style_font_bold +
  call method me->set_title_style
    exporting
      style = l_style.

* Spaltenüberschrift
  clear l_style.
  l_style = alv_style_font_bold_no.
  call method me->set_col_header_style
    exporting
      style = l_style.

  if not m_cl_variant->ms_layout-no_headers is initial.
    call method me->set_col_header_visible
      exporting
        visible = 0.
  else.
    call method me->set_col_header_visible
      exporting
        visible = 1.
  endif.

* setzen der Spaltenoptimierung für einzelspaltenoptimierung
  if m_cl_variant->ms_layout-cwidth_opt is initial.

    read table m_cl_variant->mt_fieldcatalog with key col_opt = 'X' transporting no fields.

    if sy-subrc eq 0.
      m_cl_variant->ms_layout-cwidth_opt = 'O'.
    else.
      read table m_cl_variant->mt_fieldcatalog with key col_opt = 'A' transporting no fields.
      if sy-subrc eq 0.
        m_cl_variant->ms_layout-cwidth_opt = 'O'.
      endif.

    endif.
  endif.

* WEBMODE / WEBSTYLE / WEBROWS
  call method me->set_web_options
    exporting
      weblook    = m_cl_variant->ms_layout-weblook
      webstyle   = m_cl_variant->ms_layout-webstyle
      webrows    = m_cl_variant->ms_layout-webrows
      webxwidth  = m_cl_variant->ms_layout-webxwidth
      webxheight = m_cl_variant->ms_layout-webxheight.

  call method me->set_dragdropid_grid_cells
    exporting
      dragdropid = m_cl_variant->ms_layout-s_dragdrop-grid_ddid.

  call method me->set_dragdropid_grid_border
    exporting
      dragdropid = m_cl_variant->ms_layout-s_dragdrop-cntr_ddid.

endmethod.                    "set_layout_properties


method set_print_data_container.

  me->_mr_print_data_container = value.

endmethod.


method set_ready_for_input .

  data: l_lines type i.
  field-symbols <l_tab> type standard table.

  if not ( offline( ) is initial ) .
    if ( not i_ready_for_input is initial ).
      message x000(0k) with 'Editable Grid not operational Offline'.
                                                            "#EC NOTEXT
    endif.
    m_edit_global = space.
    m_init_toolbar = 'X'.
    exit.
  endif.

  m_edit_global  = i_ready_for_input.
  m_init_toolbar = 'X'.

  call method me->set_ready_for_input_internal.

  if me->m_performance eq 'X' and
     me->m_roids_sent eq space.
    call method me->set_row_id
      exporting
        row_id_table = mt_roid.

    m_roids_sent = 'X'.
  endif.

  assign mt_outtab->* to <l_tab>.
  if <l_tab> is assigned.
    describe table <l_tab> lines l_lines.
    call method set_highest_row_id
      exporting
        row_id = l_lines.
  endif.

  field-symbols: <lt_outtab> type table.
  assign me->mt_outtab->* to <lt_outtab>.
  if ( me->m_memory eq 'X'          "Y6BK07996
    or me->m_performance eq 'X' )
    and sy-subrc eq 0.

    data: ls_stable type lvc_s_stbl.
    ls_stable-row = 'X'.
    ls_stable-col = 'X'.
    call method me->get_frontend_fieldcatalog
      importing
        et_fieldcatalog = m_cl_variant->mt_fieldcatalog.
    soft_refresh_table_display( is_stable = ls_stable ).
  endif.

endmethod.                    "set_ready_for_input


method set_ready_for_input_internal.

  data: l_enable_dragdrop_rows type i.

  call method me->determine_readonly_simple
    importing
      e_readonly = e_rdonly.

    call method me->set_grid_readonly
      exporting
        readonly = e_rdonly.

*... nur im editierbaren Grid soll diese Mölichkeit bestehen
  if is_ready_for_input( ) eq 1.
    if m_cl_variant->ms_layout-no_rowmove eq space.
      l_enable_dragdrop_rows = 1.
    else.
      l_enable_dragdrop_rows = 0.
    endif.

    call method me->set_drag_drop_rows
      exporting
        enable = l_enable_dragdrop_rows.
  endif.

  call method me->set_enter_key_mode
    exporting
      mode = ekm_neutral.

" purpose of this coding:
" SEL_MODE can be set by a former roundtrip to value X or
" M_SELECTION_MODE is initially set to -1 => L_MODE must be set!!!!!!!
  DATA: l_mode TYPE i.
  IF is_ready_for_input( ) EQ 1.   "Editable, Rowmark not of interest
    CASE m_cl_variant->ms_layout-sel_mode.
      WHEN 'A'.                          "Row/Col-Select
        l_mode = 0.
      WHEN 'B' OR 'C'.                   "original : Single Select Listbox, Multi Select Listbox
        l_mode = 0.
      WHEN 'D'.                          "Full Select
        l_mode = 3.
      WHEN OTHERS.
        l_mode = 0.
    ENDCASE.
  else.  "Display only
* normal case
      CASE m_cl_variant->ms_layout-sel_mode.
        WHEN 'A'.                          "Row/Col-Select
          l_mode = 0.
        WHEN 'B'.                          "Single Select Listbox
          l_mode = 1.
        WHEN 'C'.                          "Multi Select Listbox
          l_mode = 2.
        WHEN 'D'.                          "Full Select
          l_mode = 3.
        WHEN OTHERS.
          l_mode = 1.
      ENDCASE.
  endif.

  CALL METHOD me->set_selection_mode_base
    EXPORTING
      mode = l_mode.

*...Fetched from SET_LAYOUT_PROPERTIES and SET_READY_FOR_INPUT
  if not m_cl_variant->ms_layout-no_rowmark is initial.
    call method me->set_row_header_visible
      exporting
        visible = 0.
  elseif m_cl_variant->ms_layout-sel_mode eq 'A' or
         m_cl_variant->ms_layout-sel_mode eq 'D'.
    call method me->set_row_header_visible
      exporting
        visible = 1.
  endif.

*...Bridge Handling
  IF me->m_very_first EQ space.
    CALL METHOD me->set_toolbar.
  ENDIF.

endmethod.                    "set_ready_for_input_internal


METHOD SET_REGISTERED_EVENTS.
*!!! Do not use for ALV Grid Control !!!!
  RAISE ILLEGAL_EVENT_COMBINATION.

ENDMETHOD.


method set_registered_events_internal.

  data: simple_event type cntl_simple_event, "// event
        ex_event     type cntl_event,  "// eventid, is_shellevent
        lt_events    type cntl_simple_events,
        events_ex    type cntl_events. "// table

  call method get_registered_events importing events = lt_events.
  loop at lt_events into simple_event.
    if simple_event-eventid = evt_click_col_header or
       simple_event-eventid = evt_delayed_move_current_cell or
       simple_event-eventid = evt_delayed_change_selection.
      delete lt_events.
    endif.
  endloop.

  if m_cl_variant is initial.
    create object m_cl_variant
        exporting
           it_outtab             = mt_outtab
           it_fieldcatalog       = m_cl_variant->mt_fieldcatalog
           it_sort               = m_cl_variant->mt_sort
           it_filter             = m_cl_variant->mt_filter
           it_grouplevels_filter = m_cl_variant->mt_grouplevels_filter
           is_variant            = m_cl_variant->ms_variant
           is_layout             = m_cl_variant->ms_layout
           i_variant_save        = m_cl_variant->m_variant_save
           i_variant_default     = m_cl_variant->m_variant_default
           i_www_active          = m_www
           is_print              = m_cl_variant->ms_print
           i_cl_alv_grid         = me
           ir_salv_adapter       = me->r_salv_adapter
           i_fcat_complete       = m_fcat_complete.
  else.
    call method m_cl_variant->set_values
         exporting
           it_outtab             = mt_outtab
           i_www_active          = m_www.
  endif.

  if m_cl_variant->ms_layout-sgl_clk_hd eq 'X'.
    simple_event-eventid = evt_click_col_header.
    append simple_event to lt_events.
  endif.

  append lines of events to lt_events.
  sort lt_events by eventid.
  delete adjacent duplicates from lt_events comparing eventid.

  loop at events into simple_event.
*... map simple_event into ex_event, append to events_ex
    clear ex_event.
    ex_event-eventid = simple_event-eventid.
    ex_event-is_shellevent = space.
    if simple_event-appl_event is initial.
      ex_event-is_systemevent = 'X'.
    endif.
    append ex_event to events_ex.
  endloop.

  ex_event-eventid        = cl_gui_control=>shellevt_dragdrop.
  ex_event-is_shellevent  = 'X'.
  ex_event-is_systemevent = 'X'.       "Drag&Drop always systemevents!!
  append ex_event to events_ex.

  call method me->set_registered_events_ex
    exporting
        eventtab                  = events_ex
    exceptions
        cntl_error                = 1
        cntl_system_error         = 2
        illegal_event_combination = 3
        others                    = 4.
  case sy-subrc.
    when 0.
    when 1.      raise cntl_error.
    when 2.      raise cntl_system_error.
    when 3.      raise illegal_event_combination.
    when others. raise cntl_error.
  endcase.

  registered_simple_events[] = lt_events.

endmethod.


method set_scroll_info .

  if not i_row is initial.
    call method me->set_first_visible_row exporting row = i_row.
  endif.

  if not i_col is initial.
    call method me->set_first_visible_col exporting col = i_col.
  endif.

endmethod.


method set_scroll_info_combined.

  check m_batch_mode is initial.
  if not i_row is initial.
    call method me->set_first_visible_row exporting row = i_row.
  endif.

  if not is_col_info is initial.
    call method me->set_first_visible_col_id
                exporting col_id = is_col_info.
  endif.

endmethod.


method set_scroll_info_id.

  if not is_col_id is initial.
    call method me->set_first_visible_col_id
      exporting
        col_id = is_col_id.
  endif.

  if not is_row_no is initial.
    if me->m_performance eq 'X' and
       me->m_roids_sent  eq space.
      call method me->set_row_id
        exporting
          row_id_table = mt_roid.
      me->m_roids_sent = 'X'.
    endif.

    call method me->set_first_visible_row_id2
      exporting
        row_id = is_row_no.
  endif.

endmethod.                    "set_scroll_info_id


method set_scroll_info_via_id .

  data: ls_data   type lvc_s_data,
        l_row     type i,
        ls_row_no type lvc_s_roid.

  check m_batch_mode is initial.

  if me->m_performance eq 'X' and
     me->m_roids_sent  eq space and
     ( not is_row_info is initial or not is_row_no is initial ).
    call method me->set_row_id
      exporting
        row_id_table = mt_roid.
    me->m_roids_sent = 'X'.
  endif.

  ls_row_no = is_row_no.

  if not is_row_info is initial and is_row_no is initial.
    ls_row_no-row_id = is_row_info-index.
    if not is_row_info-rowtype is initial.
      ls_row_no-row_id     = ls_row_no-row_id * -1.
      ls_row_no-sub_row_id = is_row_info-rowtype+7(10).
    endif.
  endif.

  call method me->set_scroll_info_id
    exporting
      is_row_no = ls_row_no
      is_col_id = is_col_info.

endmethod.                    "set_scroll_info_via_id


method set_selected_cells.

  data: lt_ceno type lvc_t_ceno,
        ls_ceno type lvc_s_ceno,
        ls_cell type lvc_s_cell,
        ls_fcat type lvc_s_fcat.

  if me->m_performance eq 'X' and
     me->m_roids_sent  eq space and
     not it_cells is initial.
    call method me->set_row_id
      exporting
        row_id_table = mt_roid.
    me->m_roids_sent = 'X'.
  endif.

  loop at it_cells into ls_cell.
    read table me->m_cl_variant->mt_fieldcatalog into ls_fcat
               with key fieldname = ls_cell-col_id-fieldname.
    if sy-subrc eq 0.
      ls_ceno-col_id = ls_fcat-col_id.
    endif.
    ls_ceno-row_id = ls_cell-row_id-index.
    append ls_ceno to lt_ceno.
  endloop.

  call method me->set_selected_cells_base_id2
    exporting
      cell_table = lt_ceno.

endmethod.                    "set_selected_cells


method set_selected_cells_id .

  data: ls_ceno  type lvc_s_ceno,
        ls_cell  type lvc_s_cell,
        lt_cells type lvc_t_cell,
        ls_fcat  type lvc_s_fcat,
        ls_poid  type lvc_s_roro.

  if me->m_performance eq 'X' and
     me->m_roids_sent  eq space and
     not it_cells is initial.
    call method me->set_row_id
      exporting
        row_id_table = mt_roid.
    me->m_roids_sent = 'X'.
  endif.

  call method me->set_selected_cells_base_id2
    exporting
      cell_table = it_cells.

endmethod.                    "set_selected_cells_id


method set_selected_columns.

  data: ls_cols_id    type lvc_s_col2,
        lt_cols_id    type lvc_t_col2,
        lt_fieldcat   type lvc_t_fcat,
        ls_fieldcat   type lvc_s_fcat,
        ls_col_table  type lvc_s_col.

*----------------------------------------------------
*Webdynpro Conversion Runtime
*----------------------------------------------------
*  if cl_dynp_global_control=>is_wdpmode( ) eq
*     cl_dynp_global_control=>co_conversion_mode.
*    if mr_alv_model is initial.
*      create object mr_alv_model
*             exporting
*                  i_cntl_handle = me->h_control
*                  ir_alv_grid = me.
*    endif.
*    call method mr_alv_model->set_selected_columns
*                     exporting
*                        it_index_columns = it_col_table .
*  endif.
*  if not mr_alv_model is initial.
*    check mr_alv_model->get_wdcomp( ) > 0.
*  endif.
*----------------------------------------------------
*  End of Webdynpro Conversion Runtime
*----------------------------------------------------
  if is_keep_other_selections is initial OR www_active EQ 'X'.
    call method me->set_selected_columns_base
      exporting
        col_table = it_col_table.
  else.
    call method get_frontend_fieldcatalog
      importing
        et_fieldcatalog = lt_fieldcat.

    loop at it_col_table into ls_col_table.
      read table lt_fieldcat into ls_fieldcat
                 with key fieldname = ls_col_table-fieldname.
      if sy-subrc eq 0.
        ls_cols_id-col_id = ls_fieldcat-col_id.
        append ls_cols_id to lt_cols_id.
      endif.
    endloop.

    call method me->set_selected_columns_base_id2
      exporting
        col_table             = lt_cols_id
        keep_other_selections = is_keep_other_selections.
  endif.

endmethod.                    "set_selected_columns


method set_selected_rows .

  data: lt_roid type lvc_t_roid,
        lt_row  type lvc_t_row.

  lt_row  = it_index_rows.
  lt_roid = it_row_no.

*----------------------------------------------------
*Webdynpro Conversion Runtime
*----------------------------------------------------
*  if cl_dynp_global_control=>is_wdpmode( ) eq
*     cl_dynp_global_control=>co_conversion_mode.
*    if mr_alv_model is initial.
*      create object mr_alv_model
*             exporting
*                  i_cntl_handle = me->h_control
*                  ir_alv_grid = me.
*    endif.
*    call method mr_alv_model->set_selected_rows
*                     exporting
*                        it_index_rows = lt_row .
*  endif.
*  if not mr_alv_model is initial.
*    check mr_alv_model->get_wdcomp( ) > 0.
*  endif.
*----------------------------------------------------
*  End of Webdynpro Conversion Runtime
*----------------------------------------------------
  if me->m_performance eq 'X' and
     me->m_roids_sent  eq space and
     ( not it_index_rows is initial or not it_row_no is initial ).
    call method me->set_row_id
      exporting
        row_id_table = mt_roid.
    me->m_roids_sent = 'X'.
  endif.

  if not it_index_rows is initial and
         it_row_no is initial.
    call method me->map_row_to_roid
      exporting
        it_index_rows = lt_row
      importing
        et_row_no     = lt_roid.
  endif.

  call method set_selected_rows_id_base
    exporting
      row_table             = lt_roid
      keep_other_selections = is_keep_other_selections.

endmethod.                    "set_selected_rows


method set_sort_criteria.

*... (1) Trace?
  if not mr_trace is initial.
    call method mr_trace->add_trace_item
      exporting
        i_trace_item = 'SET_SORT_CRITERIA'
        ir_variant   = m_cl_variant
        it_data      = mt_data
        it_info      = mt_info.
  endif.

  if m_cl_variant->mt_fieldcatalog is initial.
    raise no_fieldcatalog_available.
  endif.

  m_cl_variant->mt_sort = it_sort.

  call function 'LVC_SORT_COMPLETE'
       exporting
            it_fieldcat = m_cl_variant->mt_fieldcatalog
       changing
            ct_sort     = m_cl_variant->mt_sort.

endmethod.


method set_table_for_first_display.

  data:  ls_variant       type disvariant,
         ls_disvariant    type disvariant,
         ls_ltdxkey       type ltdxkey,
         ls_fieldcatalog  type lvc_s_fcat,
         l_fieldcat_state type char1,
         l_sort_state     type char1,
         l_completed      type char1 value '2',
         l_subrc          type sy-subrc,
         l_reprep         type sy-subrc.

  data: download_allowed type flag value 'X'.

  data: lt_toolbar_excluding type ui_functions,
        ls_toolbar_excluding type ui_func.

  data: l_no_variant_loaded type char1.

  data: l_import        type char01,
        l_export        type char01,
        l_delete        type char01,
        l_exit          type char1.

  break-point id alv_grid.

* SOS
  data:
    param(20) type c,
    l_interface_check type c.

  get parameter id 'ALV_SOS' field param.
  if param eq abap_true.
    l_interface_check = param.
    param = 'C_SOS'.
    set parameter id 'ALV_SOS' field param.
  else.
    if param eq 'A_SOS'.
      param = abap_true.
      set parameter id 'ALV_SOS' field param.
    endif.
    l_interface_check = i_consistency_check.
  endif.

*...Initialize Base Variables
  me->_init_members_base( ).

*Mendocino Extraction
  data: l_mode(1).
  import l_mode to l_mode from memory id 'ALV_EXTRACT_MODE'.
  if l_mode eq 'M'.
    data:
      l_guid type guid_32,
      ls_variant_mend type disvariant,
      ls_export_type_mend type salv_bs_constant.

    import l_guid to l_guid from memory id 'ALV_EXTRACT_GUID'.

    cl_salv_export_db_storage=>IMPORT_ALV_VARIANT_XML_FORMAT(
      exporting
        GUID        = l_guid
      importing
        VALUE       = ls_variant_mend
        EXPORT_TYPE = ls_export_type_mend
    ).

*    ls_variant_mend = cl_salv_export_db_storage=>import_alv_variant( l_guid ).

    if is_variant-variant is initial.
      if ls_variant_mend-variant is not initial.
        is_variant = ls_variant_mend.
      endif.
    endif.

  endif.

*... check for critical errors
  if i_structure_name is initial and
    is_variant is initial        and
    it_fieldcatalog[] is initial.
    message a530(0k) raising invalid_parameter_combination.
  endif.

*... Initialization
  clear: mt_toolbar,
         m_next_view,
         m_next_alv_bds,
         m_very_first,
         m_first,
         m_buffer_active,
         m_edit_cols.

*ALV Customer Wrapper
  me->r_salv_adapter = ir_salv_adapter.

  m_very_first       = 'X'.
  m_bypassing_buffer = i_bypassing_buffer.
  m_buffer_active    = i_buffer_active.
  m_structure_name   = i_structure_name.
  ms_print_info      = is_print.
  mt_alv_graphics    = it_alv_graphics.
  mt_special_groups  = it_special_groups.
  mt_except_qinfo    = it_except_qinfo.
  if is_variant-report is initial.
    i_save = space.
  endif.

  get reference of it_outtab into mt_outtab.

*Infoset(Runtime) Extraction
  import l_mode to l_mode from memory id 'ALV_EXTRACT_MODE'.
  if l_mode eq 'E'.
    export it_outtab from it_outtab[]
                     to memory id 'ALV_EXTRACT_TABLE'.
    set screen 0.
    leave screen.
  endif.

*... Create or Set Variant
  is_variant-report = to_upper( is_variant-report ).      "YI3K212432, Y5HK031894

  if i_save na 'UXA '.
    i_save = 'U'.
  endif.
  if m_cl_variant is initial.
    create object m_cl_variant
                  exporting it_outtab             = mt_outtab
                            it_fieldcatalog       = it_fieldcatalog
                            it_sort               = it_sort
                            it_filter             = it_filter
                            is_variant            = is_variant
                            is_layout             = is_layout
                            i_variant_save        = i_save
                            i_variant_default     = i_default
                            i_www_active          = m_www
                            is_print              = is_print
                            i_cl_alv_grid         = me
                            ir_salv_adapter       = me->r_salv_adapter
                            i_fcat_complete       = m_fcat_complete.
  else.
    m_cl_variant->mt_fieldcatalog       = it_fieldcatalog.
    m_cl_variant->mt_sort               = it_sort.
    m_cl_variant->mt_filter             = it_filter.
    m_cl_variant->m_variant_save        = i_save.
    m_cl_variant->ms_variant            = is_variant.
    m_cl_variant->m_variant_default     = i_default.
    m_cl_variant->ms_layout             = is_layout.
    m_cl_variant->ms_print              = is_print.
    m_cl_variant->m_cl_alv_grid         = me.               "B20K8A0NUD
    m_cl_variant->r_salv_adapter        = me->r_salv_adapter.
    call method m_cl_variant->set_values
      exporting
        it_outtab    = mt_outtab
        i_www_active = m_www.
  endif.

  call method put_parameters.

*... Trace
  if not mr_trace is initial.
    call method mr_trace->add_trace_item
      exporting
        i_trace_item = 'SET_TABLE_FOR_FIRST_DISPLAY'
        ir_variant   = m_cl_variant.
  endif.

*... set hyperlink
  if not it_hyperlink[] is initial and
     cl_gui_alv_grid=>offline( ) is initial.
    call method set_hyperlink_table
      exporting
        it_hyperlink = it_hyperlink.
  else.
    mt_hyperlinks[] = it_hyperlink[].
  endif.

*... set tooltips
  set_tooltips( ).

*... Variant ggf. korrigieren
  import ls_disvariant to ls_disvariant
         from memory id 'WWW_ALV_HTML_DISVARIANT'.
  if sy-subrc eq 0.
    m_cl_variant->ms_variant-variant = ls_disvariant-variant.
  endif.

*... Check Authority for variant
  call method me->authority_check.

*... first check if fieldcatalog has to be merged
  if not m_structure_name is initial.
    call function 'LVC_FIELDCATALOG_MERGE'
      exporting
        i_structure_name   = m_structure_name
        i_buffer_active    = m_buffer_active
        i_bypassing_buffer = m_bypassing_buffer
      changing
        ct_fieldcat        = m_cl_variant->mt_fieldcatalog.
  endif.

*... Load Variant
  l_no_variant_loaded = abap_true.
  if _is_bridge_active( ) = abap_true.
    data: l_init_only type abap_bool.
    if ( not m_cl_variant->ms_variant-variant is initial or
         m_cl_variant->m_variant_default eq 'X' )   and not
         m_cl_variant->ms_variant-report is initial or
         cl_salv_veri_run=>on eq cl_salv_veri_run=>c_runtime.  "AT
      l_init_only = abap_false.
    else.
      l_init_only = abap_true.
    endif.
    macro_bridge_call_data.
    macro_bridge_method_name cl_gui_alv_grid load_variant.
    macro_bridge_parameter exporting: i_init_only         l_init_only.
    macro_bridge_parameter importing: e_no_variant_loaded l_no_variant_loaded.
    macro_bridge_call.
  else.
    if ( not m_cl_variant->ms_variant-variant is initial or
         m_cl_variant->m_variant_default eq 'X' )   and not
         m_cl_variant->ms_variant-report is initial or
         cl_salv_veri_run=>on eq cl_salv_veri_run=>c_runtime.  "AT
      loop at m_cl_variant->mt_fieldcatalog into ls_fieldcatalog
              where tabname ne space.
        exit.
      endloop.
      if sy-subrc ne 0.
        ls_fieldcatalog-tabname = '1'.
      endif.
      call method m_cl_variant->load_variant
        exporting
          i_tabname          = ls_fieldcatalog-tabname
          i_bypassing_buffer = m_bypassing_buffer
          i_buffer_active    = m_buffer_active
          i_dialog           = space
          i_no_frontend      = abap_true
        importing
          e_exit             = l_no_variant_loaded.
    endif.
  endif.

*... Set attributes
  call method me->set_fieldcatalog
    exporting
      it_fieldcatalog = m_cl_variant->mt_fieldcatalog.

  if cl_salv_veri_run=>on eq cl_salv_veri_run=>c_abapunit.
    data:
      boolean type sap_bool.

    boolean = cl_salv_veri_run=>is_point_in_time_xy(
                x = cl_salv_veri_run=>x_soft_refresh_table_display
                y = cl_salv_veri_run=>y_salv_attributs ).
    if boolean eq 'X'.
      cl_salv_caller_services=>t_lvc_fieldcat = m_cl_variant->mt_fieldcatalog.
      set screen 0.
      leave screen.
    endif.
  endif.

*Infoset(Designtime) Extraction
  import l_mode to l_mode from memory id 'ALV_EXTRACT_MODE'.
  if l_mode eq 'F'.
    export it_fieldcatalog from m_cl_variant->mt_fieldcatalog
                     to memory id 'ALV_EXTRACT_FCAT'.

    export is_layout from m_cl_variant->ms_layout
                      to memory id 'ALV_EXTRACT_LAYO'.

    export it_filter from m_cl_variant->mt_filter
                     to memory id 'ALV_EXTRACT_FILT'.

    export it_sort from m_cl_variant->mt_sort
                     to memory id 'ALV_EXTRACT_SORT'.

    set screen 0.
    leave screen.
  endif.
*migration solution
  if l_mode eq 'B'.
    if ir_salv_adapter is bound.
      data:
        r_model type ref to cl_salv_table.

      r_model ?= ir_salv_adapter->r_controller->r_model.

      data:
        r_tol type ref to cl_salv_form_element.

      r_tol = r_model->get_top_of_list( ).

      data:
        r_eol type ref to cl_salv_form_element.

      r_eol = r_model->get_end_of_list( ).
    endif.

    try.
        cl_salv_wd_adapt_shm_util=>write( data   = it_outtab
                                          t_fcat = m_cl_variant->mt_fieldcatalog
                                          t_sort = m_cl_variant->mt_sort
                                          t_filter = m_cl_variant->mt_filter
                                          s_layout = m_cl_variant->ms_layout
                                          r_tol  = r_tol
                                          r_eol  = r_eol ).
      catch cx_salv_wd_sc_shm_error.
    endtry.
    set screen 0.
    leave screen.
  endif.

*Webdynpro Conversion Runtime
*  if 1 = 2.
*  if cl_dynp_global_control=>is_wdpmode( ) eq
*     cl_dynp_global_control=>co_conversion_mode.
*   data: lr_alv_model type ref to cl_alv_model.
*    create object lr_alv_model
*           exporting
*                i_cntl_handle = me->h_control
*                ir_alv_grid = me.
*    lr_alv_model->set_metadata( m_cl_variant->mt_fieldcatalog ).
*    lr_alv_model->set_data( mt_outtab ).
*  endif.
*  check lr_alv_model is initial.
*  endif.

*Mendocino Extraction
  if l_mode eq 'M'.
    clear l_mode.
    export l_mode from l_mode to memory id 'ALV_EXTRACT_MODE'.

    import l_guid to l_guid from memory id 'ALV_EXTRACT_GUID'.

    data:
      l_xml type xstring.

    data: ls_param_lvc type if_salv_export=>s_type_param_lvc.

    if me->_fullscreen_mode eq abap_true.
      call function 'GET_GLOBALS_FROM_SLVC_FULLSCR'
        importing
          er_form_tol = ls_param_lvc-r_form_tol
          er_form_eol = ls_param_lvc-r_form_eol.
    endif.

    if ir_salv_adapter is bound.
      data: lr_table type ref to cl_salv_table.
      data: lr_columns type ref to cl_salv_columns_table.
      data: l_column type lvc_fname.
      lr_table ?= ir_salv_adapter->r_controller->r_model.
      lr_columns = lr_table->get_columns( ).
      l_column = lr_columns->get_hyperlink_entry_column( ).
    endif.

    ls_param_lvc-t_fcat = m_cl_variant->mt_fieldcatalog.
    ls_param_lvc-t_sort = m_cl_variant->mt_sort.
    ls_param_lvc-t_filt = m_cl_variant->mt_filter.
    ls_param_lvc-s_layo = m_cl_variant->ms_layout.
    ls_param_lvc-s_hype-t_hype = mt_hyperlinks[].
    ls_param_lvc-s_hype-hlink_colname = l_column.
    call function 'SALV_EXPORT_DATA_TO_APPL'
      exporting
        guid        = l_guid
        s_param_lvc = ls_param_lvc
        export_type = ls_export_type_mend
      importing
        xml         = l_xml
      changing
        r_data      = mt_outtab.

*    cl_salv_ex_db_storage=>export_xmlstring(
*      guid  = l_guid
*      value = l_xml ).

    set screen 0.
    leave screen.
  endif.

  me->do_runtime_info( ).

  call method me->set_sort_criteria
    exporting
      it_sort = m_cl_variant->mt_sort.

  call method me->set_filter_criteria
    exporting
      it_filter = m_cl_variant->mt_filter.

  if m_www is initial. "not a MINI-ALV/webrfc call
*... Layout Properties setzen
    if _is_bridge_active( ) = abap_false.   "B20K128664
      call method me->set_layout_properties.
    endif.

*... Report/report-interface
    if m_reprep_active eq 'X'.
      call method me->reprep_exit_check
        importing
          e_subrc = l_reprep.
      if l_reprep eq 0.
        call method me->reprep_trsti_check
          exporting
            is_reprep = ms_reprep
          importing
            et_fccls  = mt_reprep_fccls
            e_subrc   = l_reprep.

        call method me->reprep_stack_check
          exporting
            is_reprep = ms_reprep
          importing
            e_called  = m_reprep_called.
      else.
        clear m_reprep_active.
      endif.
    endif.

*... Init context / toolbar
*   perform authority check for download options via object S_GUI
    lt_toolbar_excluding[] = it_toolbar_excluding[].

    authority-check object 'S_GUI'
                        id 'ACTVT'
                     field '61'.                             "download
    if sy-subrc <> 0.
      download_allowed = ' '.
    endif.

*SAPLGRAP: Y7AK043817
    if cl_alv_variant=>m_apply_saplgrap eq abap_true
    and download_allowed is not initial.
      data: check_result type i.
      perform check_grap_security
                                  in program SAPLGRAP
                                  using 'X' check_result
                                  if found.
      if check_result > 0.
        download_allowed = ' '.
      endif.
    endif.

    if ( download_allowed is initial ).
      define macro_disable_function.
        ls_toolbar_excluding = &1.
        read table lt_toolbar_excluding transporting no fields
           with table key table_line = ls_toolbar_excluding.
        if ( sy-subrc ne 0 ).
          append ls_toolbar_excluding to lt_toolbar_excluding.
        endif.
      end-of-definition.
      macro_disable_function mc_fc_word_processor.
      macro_disable_function mc_fc_expcrdesig.
      macro_disable_function mc_fc_expcrtempl.
      macro_disable_function mc_fc_expcrdata.
      macro_disable_function mc_fc_html.
* crystal preview download disabled since 4.6D!
      macro_disable_function mc_fc_pc_file.
      macro_disable_function mc_fc_call_xxl.
      macro_disable_function '%PC'.                         "PC
      macro_disable_function '%SL'.                         "send
      macro_disable_function '&XML'.
      macro_disable_function mc_fc_view_grid.               "B20K8A0RSY
      macro_disable_function mc_fc_view_excel.
      macro_disable_function mc_fc_view_crystal.
      macro_disable_function mc_fc_view_lotus.
      macro_disable_function mc_fc_call_crbatch.            "B20K8A0R0W
      if cl_gui_alv_grid=>offline( ) is initial.
*        if m_gui_type eq m_gui_type_windows.
*>>> YI3K097962
        authority-check object 'S_GUI'
                            id 'ACTVT'
                         field '02'.
        if sy-subrc <> 0.
          call method me->set_clipboard_active( 0 ).
        else.
          call method me->set_clipboard_active( 1 ).
        endif.
*<<< YI3K097962
*        endif.
      endif.
    else.
      if cl_gui_alv_grid=>offline( ) is initial.
*        if m_gui_type eq m_gui_type_windows.
        call method me->set_clipboard_active( 1 ).
*        endif.
      endif.
    endif.

    call method me->init_context_menu
      exporting
        it_toolbar_excluding = lt_toolbar_excluding.

    call method me->init_toolbar
      exporting
        i_save               = m_cl_variant->m_variant_save
        is_variant           = m_cl_variant->ms_variant
        it_toolbar_excluding = lt_toolbar_excluding.
  endif.                               "nur wenn WWW nicht aktiv

* following code only for old version (without bridge)
  if _is_bridge_active( ) = abap_false.

*   ... BDS
     call method m_cl_variant->get_values_bds
       exporting
         i_ok_code       = 'DUMMY'
       importing
         es_bds_with_url = m_next_alv_bds.

*   ... View
     call method m_cl_variant->get_view
       importing
         e_view = m_next_view.

*   ... Graphic call
     if not m_cl_variant->ms_layout-graphics is initial and
        not me->m_www eq 'X'.
       call method m_cl_variant->load_graphics
         changing
           cr_graphics_container = mr_graphics_container.
     endif.

   endif.

*... Export to Buffer
  call function 'ALV_DATA_EXPORT'
    exporting
      i_report    = space
      it_fieldcat = m_cl_variant->mt_fieldcatalog
    importing
      e_exit      = l_exit
    tables
      it_data     = it_outtab.
  if l_exit eq 'X'.
    set screen 0.
    leave screen.
  endif.

*... Export to Buffer if Buffer active
  if l_no_variant_loaded eq 'X'.
    call function 'ALV_CHECK_BUFFER'
      exporting
        i_buffer_type      = 'A'
        i_buffer_active    = m_buffer_active
        i_bypassing_buffer = m_bypassing_buffer
        i_refresh_buffer   = ' '
      importing
        e_import           = l_import
        e_export           = l_export
        e_delete           = l_delete.
    if not l_export is initial.
      call function 'ALV_EXPORT_TO_BUFFER_LVC'
        exporting
          is_ltdxkey           = ls_ltdxkey
          it_fieldcat_lvc      = m_cl_variant->mt_fieldcatalog
          i_fieldcat_lvc_state = l_completed
          it_sort_lvc          = m_cl_variant->mt_sort
          i_sort_lvc_state     = l_completed
          it_filter_lvc        = m_cl_variant->mt_filter
          is_layout_lvc        = m_cl_variant->ms_layout
        exceptions
          no_key               = 0
          no_export            = 0
          others               = 0.
      if sy-subrc ne 0.
      endif.
    endif.
  endif.

*... Check only 1 row display is requested
  loop at m_cl_variant->mt_fieldcatalog transporting no fields
          where row_pos gt 1.
    exit.
  endloop.
  if sy-subrc eq 0.
    message i063(0k).
  endif.

*... start consisteny check
  if l_interface_check eq 'X'.
    call method me->consistency_check.
  endif.

*<<<YI3K093293  assignment NOW to enable batch printing of SLIS parameter
* default layout settings have not yet been applied -> event _before_refresh in refresh_table_display
  data: ls_alv_graphics type dtc_s_tc.
  read table it_alv_graphics with key prop_id = 'FULLSCREEN_MODE'
                             into ls_alv_graphics.
  if ls_alv_graphics-prop_val eq abap_true.
    me->_fullscreen_mode = abap_true.
  endif.
*>>>YI3K093293

  if m_batch_mode eq 'X' or
     not m_cl_variant->ms_print-print is initial.
    call method me->print_backend.
    set screen 0.
    leave screen.
  endif.

*<<<YI3K093293 Layout settings have not yet been applied ->
* moved to REFRESH_TABLE_DISPLAY
*... inform Fullscreen ALV for executing PF-STATUS to get SY-TITLE in CrystalReports
*  data: ls_alv_graphics type dtc_s_tc.
*  read table it_alv_graphics with key prop_id = 'FULLSCREEN_MODE'
*                             into ls_alv_graphics.
*  if ls_alv_graphics-prop_val eq abap_true.
*    me->_fullscreen_mode = abap_true.
*    raise event _before_refresh.
*  endif.
*>>>YI3K093293

*... refresh the display
  call method me->refresh_table_display
    exceptions
      finished = 1.
*"  finished is raised if an server/system-export was performed in
*"  refresh table display. it is arguable to perform a
*"  leave screen here within the class
  if ( sy-subrc = 1 ).
    set screen 0.
    leave screen.
  endif.

  if me->r_salv_adapter is bound.
    if l_no_variant_loaded is initial.
      me->r_salv_adapter->get_metadata( ).
    endif.
  endif.

endmethod.                    "


method set_toolbar .

  if _is_bridge_active( ) = abap_true.
    macro_bridge_call_data.
    macro_bridge_method_name cl_gui_alv_grid set_toolbar.
    macro_bridge_parameter exporting: i_interactive i_interactive.
    macro_bridge_call.
*>>>> YI2K084533
    if m_init_toolbar ne space or
       ( m_next_view  ne m_view ).
      clear m_init_toolbar.
    endif.
*<<<< YI2K084533
    exit.
  endif.

  type-pools: sctx.

  data: ls_toolbar      type stb_button,
        lt_toolbar      type ttb_button,
        lt_fcodes       type ui_functions,
        ls_btnmnu       type stb_btnmnu,
        lt_btnmnu       type ttb_btnmnu,
        l_index         type i,
        l_disabled      type char1,
        l_wan           type char1.

  call function 'SAPGUI_GET_WAN_FLAG'
    importing
      wan_flag = l_wan.

  clear mt_toolbar_set.

*... deregister all present menus:
  set handler on_toolbarmenu_changed for all instances activation space.

  if m_init_toolbar ne space or
     ( m_next_view  ne m_view ).
    call method me->toolbar_build.
    clear m_init_toolbar.
  endif.

*... modify toolbar
  call method me->toolbar_modify.

*... Modifzierter Toolbar übernehmen
  m_cl_toolbar->mt_toolbar = mt_toolbar.
  m_cl_toolbar->mt_btnmnu  = lt_btnmnu.

*... Customer can modify toolbar, e.g. add buttons & static menus
*... Trace?
  if not mr_trace is initial.
    call method mr_trace->add_trace_item
      exporting
        i_trace_item = 'EVENT: TOOLBAR'
        ir_variant   = m_cl_variant
        it_data      = mt_data
        it_info      = mt_info.
  endif.
  raise event toolbar exporting e_object      = m_cl_toolbar
                                e_interactive = i_interactive.

*... completed toolbar
  mt_toolbar_set = m_cl_toolbar->mt_toolbar.

  call method me->set_toolbar_buttons
    exporting
      toolbar_table = mt_toolbar_set.

*... prepare and modify static menus
  call method me->merge_static_menus
    exporting
      it_toolbar = mt_toolbar_set
    changing
      ct_btnmnu  = m_cl_toolbar->mt_btnmnu.

  call method me->delete_all_menus.

  loop at m_cl_toolbar->mt_btnmnu into ls_btnmnu.
    if l_wan eq space.
      call method me->set_toolbar_menu_static
        exporting
          function     = ls_btnmnu-function
          toolbar_menu = ls_btnmnu-ctmenu.
    endif.

*... for static menues set handler on event toolbar changed
    set handler on_toolbarmenu_changed for ls_btnmnu-ctmenu.
  endloop.

*----------------------------------------------------
*Webdynpro Conversion Runtime
*----------------------------------------------------
*  if cl_dynp_global_control=>is_wdpmode( ) eq
*     cl_dynp_global_control=>co_conversion_mode.
*    if mr_alv_model is initial.
*      create object mr_alv_model
*             exporting
*                  i_cntl_handle = me->h_control
*                  ir_alv_grid = me.
*    endif.
*    mr_alv_model->set_toolbar( m_cl_toolbar->mt_toolbar ).
*  endif.
*  if not mr_alv_model is initial.
*    check mr_alv_model->get_wdcomp( ) > 0.
*  endif.
*----------------------------------------------------
*  End of Webdynpro Conversion Runtime
*----------------------------------------------------

endmethod.                    "set_toolbar


method set_toolbar_interactive .

  call method me->set_toolbar exporting i_interactive = 'X'.

endmethod.


method SET_TOOLTIPS.

  include <cl_alv_control>.

  data: qinfo type LVC_S_QINF,
        color_style type LVC_ISTYLE,
        color(3) type c,
        dummy type lvc_s_colo,
        symbol type char01.

    move alv_style_color_positive to color_style.   " Y6DK044373
    me->set_color_info( color_style = color_style
                          info      = text-301 ).

* set the color tooltips
  loop at mt_except_qinfo into qinfo where type = cl_salv_tooltip=>C_TYPE_COLOR.

    try.
      condense qinfo-value.

*<<< YI3K111185
      if qinfo-value+0(1) ca 'CK'.   "fieldcat parameter EMPHASIZE !
        shift qinfo-value left.      "1 place left
      else.
         move qinfo-value to color.
      endif.
*>>> YI3K111185

      if qinfo-value+1(2) eq SPACE.
        concatenate qinfo-value '00' into color.
      else.
        color = qinfo-value.
      endif.
      clear color_style.
      perform style_for_listcolor in program SAPLSLVC
           using color
                 color_style
                 dummy.

      me->set_color_info( color_style = color_style
                          info        = qinfo-text ).
*<<< Y7AK118520
*... set values for invers and intensived
      if qinfo-value+1(2) eq SPACE.
        concatenate qinfo-value '10' into color.
        clear color_style.
        perform style_for_listcolor in program SAPLSLVC
             using color
                   color_style
                   dummy.
        me->set_color_info( color_style = color_style
                            info        = qinfo-text ).
      endif.
      if qinfo-value+1(2) eq SPACE.
        concatenate qinfo-value '01' into color.
        clear color_style.
        perform style_for_listcolor in program SAPLSLVC
             using color
                   color_style
                   dummy.
        me->set_color_info( color_style = color_style
                            info        = qinfo-text ).
      endif.
      if qinfo-value+1(2) eq SPACE.
        concatenate qinfo-value '11' into color.
        clear color_style.
        perform style_for_listcolor in program SAPLSLVC
             using color
                   color_style
                   dummy.
        me->set_color_info( color_style = color_style
                            info        = qinfo-text ).
      endif.
*>>> Y7AK118520
    catch CX_SY_CONVERSION_NO_NUMBER.
    endtry.

  endloop.

** set a standard info for emphasized columns if info for this color has not been set
*  read table mt_except_qinfo transporting no fields
*        with key type = cl_salv_tooltip=>C_TYPE_COLOR
*        value = alv_style_color_positive.
*  if sy-subrc ne 0.
*    move alv_style_color_positive to color_style.
*    me->set_color_info( color_style = color_style
*                          info      = text-301 ).
*  endif.

* set symbol tooltips.
  loop at mt_except_qinfo into qinfo where type = cl_salv_tooltip=>C_TYPE_SYMBOL.

    move qinfo-value to symbol.
    me->set_symbol_info( symbol = symbol
                          info  = qinfo-text ).

  endloop.

endmethod.


method set_user_command .

*... (1) Trace?
  if not mr_trace is initial.
    call method mr_trace->add_trace_item
      exporting
        i_trace_item = 'SET_USER_COMMAND'
        ir_variant   = m_cl_variant
        it_data      = mt_data
        it_info      = mt_info
        i_ucomm      = i_ucomm.
  endif.

  m_ucomm = i_ucomm.

endmethod.


method set_variant.

  m_cl_variant->ms_variant = is_variant.

endmethod.


method show_detail.

  field-symbols: <l_tab_item> type any,
                 <l_f1>       type any,
                 <tab1>       type standard table.

  data: lt_detail_tab type lvc_t_deta,
        ls_detail_tab type lvc_s_deta,
        ls_detail type lvc_s_detm,
        ls_row_no type lvc_s_roid,
        ls_row_no_wa type lvc_s_roid,
        lt_row_no type lvc_t_roid,
        ls_fcat type lvc_s_fcat,
        ls_layout type lvc_s_layo,
        lt_fcat type lvc_t_fcat,
        ls_col_id type lvc_s_col,
        l_lin type p,
        l_tabix type sy-tabix,
        l_exit,
        l_title type sy-title,
        l_value type lvc_s_data-value,
        l_ref type ref to data.

  DATA:  ls_qinf TYPE lvc_s_qinf, ">>>>>Y6DK047419
         l_acc,
         l_add_stdinf type ICON_INT.

  call function 'GET_ACCESSIBILITY_MODE'
    importing
      accessibility     = l_acc
    exceptions
      its_not_available = 0
      others            = 0.   "<<<<<<<<<Y6DK047419

  call method me->get_selected_rows importing et_row_no = lt_row_no.

  call method me->get_current_cell
              importing es_row_no = ls_row_no
                        es_col_id = ls_col_id
                        e_value   = l_value.

  IF me->is_cache_valid( ) NE abap_true or www_active eq abap_true.

    CALL METHOD cl_gui_cfw=>flush.

  ENDIF.

  loop at lt_row_no into ls_row_no_wa.
    if ls_row_no_wa-row_id > 0.
      add 1 to l_lin.
    endif.
  endloop.
  if l_lin eq 0.
    if not ls_row_no-sub_row_id is initial.
      message i039(0k).
      exit.
    endif.
    if ls_row_no is initial.
      message i004(0k).
      exit.
    else.
      append ls_row_no to lt_row_no.
    endif.
  endif.

  clear ls_fcat.
  clear lt_fcat[].
  ls_fcat-fieldname = 'COLUMNTEXT'.
  ls_fcat-ref_table = 'LVC_S_DETA'. "Y6DK043061
  ls_fcat-key       = 'X'.
  ls_fcat-seltext   = 'Spalte'(102).
  ls_fcat-scrtext_s = 'Spalte'(102).
  ls_fcat-outputlen = 30.
  append ls_fcat to lt_fcat.
  clear ls_fcat.
  ls_fcat-fieldname = 'VALUE'.
  ls_fcat-ref_table = 'LVC_S_DETA'. "Y6DK043061
  ls_fcat-seltext   = 'Inhalt'(103).
  ls_fcat-scrtext_s = 'Inhalt'(103).
  ls_fcat-outputlen = 20.
  append ls_fcat to lt_fcat.

*<<<Y7AK095943
  FIELD-SYMBOLS:
    <ls_fcat> TYPE lvc_s_fcat.

  READ TABLE lt_fcat ASSIGNING <ls_fcat> INDEX 2.
*>>>Y7AK095943

*... Check Outtab
  assign mt_outtab->* to <tab1>.
  if not sy-subrc is initial.
    message a534(0k).
  endif.

  create data l_ref like line of <tab1>.
  assign l_ref->* to <l_tab_item>.
  clear mt_detail.

  data: lt_fieldcat type lvc_t_fcat.
  lt_fieldcat[] = m_cl_variant->mt_fieldcatalog[].
  sort lt_fieldcat by col_pos.


  loop at lt_row_no into ls_row_no.
    if ls_row_no-sub_row_id is initial."real row
      move sy-tabix to ls_detail-blockindex.
      read table <tab1> index ls_row_no-row_id into <l_tab_item>.
      if sy-subrc eq 0.
        clear lt_detail_tab.

        loop at lt_fieldcat INTO ls_fcat.
          check ls_fcat-tech = space.
          move ls_fcat-seltext to ls_detail_tab-columntext.

          if cl_alv_z_params=>get_parameter(    " PN (7.02 SP1)
              cl_alv_z_params=>c_flag-show_field_names_in_details ) = abap_true
              and ls_fcat-seltext <> ls_fcat-fieldname.
            ls_detail_tab-columntext =
                |{ ls_fcat-fieldname } ({ ls_fcat-seltext })|.
          endif.

          assign component ls_fcat-fieldname
                           of structure <l_tab_item> to <l_f1>.
          if m_cl_variant->ms_layout-detailinit is initial.
            if <l_f1> is initial.
              continue.
            endif.
          endif.

          if ls_fcat-checkbox eq 'X'.
            move <l_f1> to ls_detail_tab-value.
          else.
            if ls_fcat-symbol = 'X'.
              concatenate '@SYMBOL@' <l_f1> into
                                     ls_detail_tab-value.
            else.
              call method cl_gui_alv_grid=>cell_display
                  exporting is_data = <l_tab_item>
                            i_int_value = <l_f1>
               importing e_ext_value = ls_detail_tab-value
               changing  cs_fieldcat = ls_fcat.

               call method add_bidi_flag
                      exporting fieldname = ls_fcat-fieldname
                      changing value = ls_detail_tab-value.

              shift ls_detail_tab-value left deleting leading space.
            endif.
          endif.

          IF ls_fcat-icon EQ abap_true.  ">>>>>>>Y6DK047419
            CLEAR ls_qinf.

            READ TABLE mt_except_qinfo INTO ls_qinf
              WITH KEY fieldname = ls_fcat-fieldname
                       value     = ls_detail_tab-value.

            IF sy-subrc NE 0.
              READ TABLE mt_except_qinfo INTO ls_qinf
                WITH KEY value = ls_detail_tab-value.
            ENDIF.
            IF sy-subrc EQ 0 OR l_acc EQ abap_true.
              IF sy-subrc EQ 0.
                CLEAR l_add_stdinf.
              ELSE.
                l_add_stdinf = abap_true.
              ENDIF.
              CALL FUNCTION 'ICON_CREATE'
                EXPORTING
                  name                        = ls_detail_tab-value
*         TEXT                        = ' '
                  info                        = ls_qinf-text
                  add_stdinf                  = l_add_stdinf
                IMPORTING
                  RESULT                      = ls_detail_tab-value
                EXCEPTIONS
                  icon_not_found              = 0
                  outputfield_too_short       = 0
                  OTHERS                      = 0.
            ENDIF.
          ENDIF.  "<<<<<Y6DK047419

*<<<Y7AK095943
          DATA:
            l_value_width TYPE i.

          l_value_width = STRLEN( ls_detail_tab-value ).
          IF l_value_width GT <ls_fcat>-outputlen.
            <ls_fcat>-outputlen = l_value_width.
          ENDIF.
*>>>Y7AK095943

          append ls_detail_tab to lt_detail_tab.
        endloop.

        move lt_detail_tab to ls_detail-detailtab.
        append ls_detail to mt_detail.
      endif.
    endif.
  endloop.

  ls_layout-no_toolbar = 'X'.
  if not m_cl_variant->ms_layout-detailtitl is initial.
    l_title = m_cl_variant->ms_layout-detailtitl.
  else.
    l_title = 'Details             '(101).
  endif.

  call function 'LVC_ITEM_DETAIL'
       exporting
            i_title         = l_title
            it_fieldcatalog = lt_fcat
            is_layout       = ls_layout
       tables
            t_outtab        = mt_detail.

endmethod.


method show_graphics .

  data:
    lt_graphics_columns        type lvc_t_fnam,
    lflg_neg(1)                type c,
    lflg_pos(1)                type c,
    lt_chars                   type lvc_t_fnam,
    lt_keyfig                  type lvc_t_fnam,
    l_lines                    type sy-tabix,
    ls_fieldcat                type lvc_s_fcat,
    lt_sort                    type lvc_t_sort,
    ls_sort                    type lvc_s_sort,
    ls_grouplevels             type lvc_s_grpl,
    l_subrc                    type sy-subrc,
    l_fnam(30)                 type c,
    l_fieldname                type lvc_fname,
    l_level                    type i value 99,
    ls_grpl                    type lvc_s_grpl,
    lr_to_cl_alv_graphics      type ref to cl_alv_graphics,
    lr_to_cl_alv_graphics_layo type ref to cl_alv_graphics_cu,
    l_guid_graphics            type guid_32,
    lt_roid                    type lvc_t_roid,
    ls_roid                    type lvc_s_roid,
    l_lin                      type i,
    l_graphics_visible(1)      type c.

  field-symbols: <lt_data> type standard table.

  lt_graphics_columns[] = it_graphics_columns[].
*... get m_cl_graph from variant
  call method m_cl_variant->get_graphics
       importing
            e_guid_graphics            = l_guid_graphics
            er_to_cl_alv_graphics      = lr_to_cl_alv_graphics
            er_to_cl_alv_graphics_layo = lr_to_cl_alv_graphics_layo.

*... are columns selected?
  read table it_graphics_columns index 1
                                 transporting no fields.
  l_subrc = sy-subrc.
  if l_subrc eq 0.
*... devide columns into characteristcs and keyfigures
    call method cl_alv_graphics=>get_char_and_figures
         exporting it_columns         = it_graphics_columns
                   it_fieldcatalog    = m_cl_variant->mt_fieldcatalog
         importing et_characteristics = lt_chars
                   et_keyfigures      = lt_keyfig.

*   check whether a keyfigure was selected that is not aggregated
    read table lt_keyfig transporting no fields index 1.
    if sy-subrc eq 0.
      loop at lt_keyfig into ls_fieldcat-fieldname.
        read table m_cl_variant->mt_fieldcatalog into ls_fieldcat
                   with key fieldname = ls_fieldcat-fieldname.
        if sy-subrc eq 0.
          if ls_fieldcat-do_sum is initial.
*         if a keyfigure was selected but not aggregated => save l_subrc
            l_subrc = 12.
            exit.
*         averages are not considered
          elseif ls_fieldcat-do_sum = 'C'.
            message i068(0k).
            l_subrc = 12.
            exit.
          endif.
        endif.
      endloop.
    endif.
    if l_subrc ne 12.
*     subrc ne 0 if no characteristics where selected
      read table lt_chars transporting no fields index 1.
      l_subrc = sy-subrc.
    endif.
  endif.

* if a keyfigure was selected but not aggregated => save l_subrc
  if l_subrc eq 12.
*   the original data table gets also the data table for graphics
    assign mt_outtab->* to <lt_data>.
    lt_roid[] = mt_roid[].
  else.
*   save sort table for sorting
    lt_sort[] = m_cl_variant->mt_sort[].

* no characteristic columns selected
    if l_subrc ne 0.
*   get highest subtotal level
      sort lt_sort by subtot descending spos ascending.
      read table lt_sort into ls_sort index 1.
*   if subtotals where build
      if sy-subrc = 0 and ls_sort-subtot = 'X'.
        l_fieldname = ls_sort-fieldname.
        read table it_graphics_columns from l_fieldname
                                       transporting no fields.
        if sy-subrc ne 0.
          append ls_sort-fieldname to lt_graphics_columns.  "B20K8A0YFV
        endif.
*     the highest subtotal level gets the data table for graphics
        assign mt_ct01->* to <lt_data>.
        ls_grpl-collect = '01'.
        describe table <lt_data> lines l_lin.
        do l_lin times.
          ls_roid-row_id = sy-index.
          append ls_roid to lt_roid.
        enddo.
      else.
*     the original data table gets also the data table for graphics
        assign mt_outtab->* to <lt_data>.
        lt_roid[] = mt_roid[].
      endif.

* characteristic columns where selected
    else.

*   get highest subtotal level
      sort lt_sort by subtot descending spos ascending.
      read table lt_sort into ls_sort index 1.
*   if subtotals where build
      if sy-subrc eq 0 and ls_sort-subtot eq 'X'.
*     get the order of grouping
        sort lt_sort by spos.
*     for each selected characteristic
        loop at lt_chars into l_fnam.
          read table lt_sort into ls_sort with key fieldname = l_fnam.
*       if the characteristic is not a grouping criteria
          if sy-subrc ne 0.
            data: l_show_data_items type abap_bool.   "Y7AK101228
*         the original data table gets also the data table for graphics
            assign mt_outtab->* to <lt_data>.
            lt_roid[] = mt_roid[].
            l_show_data_items = abap_true.            "Y7AK101228
            exit.
*       if it is a grouping criteria
          else.
*         but not a subtotal criteria
            if ls_sort-subtot ne 'X'.
*           get and save next subtotal level
              loop at lt_sort into ls_sort from sy-tabix
                              where subtot eq 'X'.
                if ls_sort-spos lt l_level.
                  l_level = ls_sort-spos.
                  exit.
                endif.
              endloop.
*           if there is no next subtotal level
              if sy-subrc ne 0.
*             the original data table gets the data table for graphics
                assign mt_outtab->* to <lt_data>.
                lt_roid[] = mt_roid[].
                exit.
              endif.
*         if it is also a subtotal criteria
            else.
*           if the characteristic belongs to a higher subtotal level
              if ls_sort-spos gt l_level or l_level eq 99.
*             save the level
                l_level = ls_sort-spos.
              endif.
            endif.
          endif.
        endloop.

*     if the level was changed
        if l_level ne 99 and l_show_data_items = abap_false.    "Y7AK101228
          clear ls_grpl.
*       get the corresponding collect table for the level
          read table m_cl_variant->mt_grouplevels_filter
                     into ls_grpl with key level = l_level.
          if sy-subrc eq 0.
*         the collect table gets the data table for graphics
            case ls_grpl-collect.
              when 01.
                assign mt_ct01->* to <lt_data>.
              when 02.
                assign mt_ct02->* to <lt_data>.
              when 03.
                assign mt_ct03->* to <lt_data>.
              when 04.
                assign mt_ct04->* to <lt_data>.
              when 05.
                assign mt_ct05->* to <lt_data>.
              when 06.
                assign mt_ct06->* to <lt_data>.
              when 07.
                assign mt_ct07->* to <lt_data>.
              when 08.
                assign mt_ct08->* to <lt_data>.
              when 09.
                assign mt_ct09->* to <lt_data>.
            endcase.
          else.                                            "Y9CK042189
*             no rows through filtering, mt_ct01->* is empty
               assign mt_ct01->* to <lt_data>.
          endif.
*<<< Y7AK101228
          describe table <lt_data> lines l_lin.
          do l_lin times.
            ls_roid-row_id = sy-index.
            append ls_roid to lt_roid.
          enddo.
        endif.
*>>> Y7AK101228
*   if no subtotals where built
      else.
*     the original data table gets the data table for graphics
        assign mt_outtab->* to <lt_data>.
        lt_roid[] = mt_roid[].
      endif.
    endif.
  endif.

*are rows selected? the filter,subtotals etc. don't matter.
  describe table it_graphics_roid lines l_lin.
  if l_lin > 0.
*what is the content of lt_roid: subtotals or data table?
    if ls_grpl-collect is initial.
      lt_roid[] = it_graphics_roid[].
      assign mt_outtab->* to <lt_data>.
    else.
*subtotals line??? mix then message not possible
      clear: lt_roid, lt_roid[].
      loop at it_graphics_roid into ls_roid.
        if ls_roid-row_id < 0.
          lflg_neg = 'X'.
        else.
          lflg_pos = 'X'.
        endif.
      endloop.
      if ( lflg_neg is initial and lflg_pos = 'X' )
      or ( lflg_neg = 'X' and lflg_pos is initial ).
        if lflg_neg = 'X'.
          loop at it_graphics_roid into ls_roid.
            l_lines = ls_roid-row_id * ( -1 ).
            read table m_cl_variant->mt_grouplevels_filter
                       into ls_grouplevels index l_lines.
            if sy-subrc = 0.
              case ls_grouplevels-collect.
                when 01.
                  assign mt_ct01->* to <lt_data>.
                when 02.
                  assign mt_ct02->* to <lt_data>.
                when 03.
                  assign mt_ct03->* to <lt_data>.
                when 04.
                  assign mt_ct04->* to <lt_data>.
                when 05.
                  assign mt_ct05->* to <lt_data>.
                when 06.
                  assign mt_ct06->* to <lt_data>.
                when 07.
                  assign mt_ct07->* to <lt_data>.
                when 08.
                  assign mt_ct08->* to <lt_data>.
                when 09.
                  assign mt_ct09->* to <lt_data>.
              endcase.
            endif.
            do.
              ls_roid-row_id = ls_grouplevels-cindx_from.
              append ls_roid to lt_roid.
              if ls_grouplevels-cindx_to <= ls_grouplevels-cindx_from.
                exit.
              endif.
              ls_grouplevels-cindx_from =
                             ls_grouplevels-cindx_from + 1.

            enddo.
          endloop.
          data: l_counter(2) type n.
          sort m_cl_variant->mt_sort by spos descending.
          loop at m_cl_variant->mt_sort into ls_sort
                                        where subtot eq 'X'.
            add 1 to l_counter.
            if l_counter eq ls_grouplevels-collect.
              l_fieldname = ls_sort-fieldname.
            endif.
          endloop.
          clear: lt_graphics_columns, lt_graphics_columns[].
          append l_fieldname to lt_graphics_columns.
        endif.
      else.
*not possible
      endif.
    endif.
  endif.

* check if graphic is closed by the user
  call method m_cl_variant->get_graphics_visible
              importing
                   e_visible = l_graphics_visible.

  if not l_graphics_visible is initial.
    if l_graphics_visible = 'D'.     "from Dialog
      clear l_guid_graphics.
    endif.
    if lr_to_cl_alv_graphics is initial.
      create object lr_to_cl_alv_graphics
             exporting
                  i_parent           = mr_graphics_container
                  i_cu_guid          = l_guid_graphics
                  it_fieldcatalog    = m_cl_variant->mt_fieldcatalog
                  it_outtab          = <lt_data>
                  it_columns         = lt_graphics_columns
                  it_rows            = lt_roid
                  it_properties      = mt_alv_graphics  "Y6BK084562
                  is_variant         = m_cl_variant->ms_variant.
    else.
      call method lr_to_cl_alv_graphics->refresh
           exporting
                  i_cu_guid       = l_guid_graphics
                  it_fieldcatalog = m_cl_variant->mt_fieldcatalog
                  it_outtab       = <lt_data>
                  it_columns      = lt_graphics_columns
                  it_rows         = lt_roid.
    endif.

    set handler on_close_graphics for lr_to_cl_alv_graphics.

*... get Ref to Layout from lr_to_cl_alv_graphics->get_attri.
    call method lr_to_cl_alv_graphics->get_attributes
              importing
                   et_columns      = lt_graphics_columns
                   er_cu           = lr_to_cl_alv_graphics_layo
                   e_guid          = l_guid_graphics.

*... uebergabe Referenz auf Layout
    call method m_cl_variant->set_graphics
       exporting
           it_fieldcatalog            = m_cl_variant->mt_fieldcatalog
           is_layout                  = m_cl_variant->ms_layout
           it_columns                 = lt_graphics_columns
           ir_to_cl_alv_graphics      = lr_to_cl_alv_graphics
           ir_to_cl_alv_graphics_layo = lr_to_cl_alv_graphics_layo
           is_variant                 = m_cl_variant->ms_variant
           i_cu_guid                  = l_guid_graphics.

  endif.

endmethod.


method show_view.

* This function executes non-native(=non-grid) view-changes:
* depending on the parameter i_new_view.
*
*
* on error, the exceptions new_view_not_supported is raised
*           **AFTER** a proper message was output.
* m_view is untouched in this case!
* m_new_view might be (re)set to mc_fc_view_grid.
*
*
*
*  excel:   currently only supported in Win32 Gui.
*
*  crystal in Win32 Gui.
*  FUNCTION 'SLVC_EXPORT_CRTEMPL2' is executed.
*               on error I-Message
*  crystal in SAPGui for HTML
*
*
*
*
*
*
*
  field-symbols: <lt_data> type standard table,
                 <lt_clean_data> type standard table.

  data: l_doc_url     type bds_uri,
        lt_aqfieldcat type table of rsaqldesc,
        lt_aqfpairs   type table of rsaqfpairs,
        lt_fieldcat   type kkblo_t_fieldcat,
        dref          type ref to data,
        l_program     type sy-repid,
        l_filename    type localfile,
        l_new         type flag.

  if ( i_new_view is initial ).
    raise new_view_not_supported.
  endif.

  if ( me->www_active = ' ' ). ">>B5AK000316 "not WebGui
    if i_new_view = mc_fc_view_crystal.
      if m_check_crystal is initial.
        if ( i_new_view = mc_fc_view_crystal ).
          data l_fadriver_handle type cntl_handle.
          data l_repid type sy-repid.
          l_repid = sy-repid.

          call method cl_gui_cfw=>update_view( ).
          call function 'CONTROL_CREATE'
            exporting
              clsid       = 'SeagateInfoset.Driver.1'
              shellstyle  = 0
              owner_repid = l_repid
              no_ocx      = 'X'
              no_flush    = ' '
            changing
              h_control   = l_fadriver_handle
            exceptions
              others      = 1.
          if sy-subrc <> 0.
            m_check_crystal = 'N'.
          else.
            call function 'CONTROL_DESTROY'
              exporting
                no_flush  = ' '
              changing
                h_control = l_fadriver_handle
              exceptions
                others    = 0.
            m_check_crystal = 'Y'.
          endif.
        endif.
      endif.
      if m_check_crystal = 'N'.
        if offline( ) is initial.
          message id 'ALVHT' type 'I' number 218
            with 'SeagateInfoSet.1 (get SupportsSAPQuery)'  "#EC NOTEXT
            raising new_view_not_supported.
        else.
          raise new_view_not_supported.
        endif.
      endif.
    endif.
  endif.  "<<B5AK000316

  if i_new_view ne mc_fc_view_grid.
*... all data is required from mt_data.
    data: l_lin type i.
    describe table mt_data lines l_lin.
    call method me->on_before_send
          exporting
            firstline = 1
            lastline  = l_lin.
  endif.

  case i_new_view.
    when mc_fc_view_excel.
*... Switch to excel-view.
*     m_gui_type = m_gui_type_excel.  "views are handled only with m_view and m_next_view
      l_doc_url  = is_alv_bds-uri.

      if ( l_doc_url is initial ). " no excel-template selected/avail.
        raise no_valid_document.
      endif.

      call method set_view_excel
        exporting
          i_doc_url = l_doc_url
        exceptions
          others    = 1.
      if sy-subrc ne 0.
        message s000(0k) with 'View could not be changed to: '
                              i_new_view.  "#EC NOTEXT
        raise new_view_not_supported.
      endif.

    when mc_fc_view_lotus.
*... Switch to lotus-view.
*     m_gui_type = m_gui_type_excel.  "views are handled only with m_view and m_next_view
      l_doc_url  = is_alv_bds-uri.

      if ( l_doc_url is initial ). " no excel-template selected/avail.
        raise no_valid_document.
      endif.

      call method set_view_lotus
        exporting
          i_doc_url = l_doc_url
        exceptions
          others    = 1.
      if sy-subrc ne 0.
        raise new_view_not_supported.
      endif.

    when mc_fc_view_crystal.
*... Switch to crystal view
*     m_gui_type = m_gui_type_crystal.  "views are handled only with m_view and m_next_view

      assign mt_outtab->* to <lt_data>.

      call function 'LVC_TRANSFER_TO_KKBLO'
        exporting
          it_fieldcat_lvc   = m_cl_variant->mt_fieldcatalog
        importing
          et_fieldcat_kkblo = lt_fieldcat.
      if ( me->www_active = ' ' ).  " NOT WEBGUI
        data: lp_table type ref to data.
        data lt_aqfieldlist type standard table of rsaqrflist.
        data lt_aqrqlist type standard table of rsaqrqlist.
        data lt_convexits type standard table of lvcdincl.

        call function 'ALV_AQ_XINT_CONVERSION'
             exporting
                  it_fieldcat             = lt_fieldcat
               it_filter_index        = m_cl_variant->mt_filter_index
                  i_currency_shift        = 'X'
             importing
                  ep_new_table            = lp_table
             tables
*               ct_outtab               = <lt_clean_data>  " changing!
                  ct_outtab               = <lt_data>  " changing!
                  et_aqfieldcat           = lt_aqfieldcat[]
                  et_aqfpairs             = lt_aqfpairs[]
                  et_aqfieldlist          = lt_aqfieldlist[]
                  et_aqrqlist             = lt_aqrqlist[]
                  et_convexits   = lt_convexits[]
             exceptions
                  conversion_not_possible = 0
                  others                  = 0.
        if sy-subrc ne 0.
        endif.
        assign lp_table->* to <lt_clean_data>.

        concatenate is_alv_bds-directory '\' is_alv_bds-filename
                    into l_filename.

        if ( l_filename eq '\' ).
          clear l_filename.
          l_new = 'X'.
        endif.

        concatenate sy-uname 'ALV' into l_program separated by '_'.
* there are several potential positions where repid can be found.
*        data l_fadriver_handle type ole2_object.
        data l_fadriver_cntl_handle type cntl_handle.
        data l_datasource_string type char80.
        data l_nosave type c.
        l_nosave = 'X'.

*        call function 'SLVC_EXPORT_CRTEMPL3'
        call function 'SLVC_EXPORT_CRTEMPL4'                "B5AK000316
          exporting
                  filename  = l_filename
                  new       = l_new
                  i_nosave  = l_nosave
                  i_layout  = m_cl_variant
                  repid     = m_cl_variant->ms_variant-report
          importing
                  e_fadriver_handle = l_fadriver_cntl_handle
*                 e_fadriver_handle = l_fadriver_handle
                  e_datasource_string = l_datasource_string
          tables
                  listdesc  = lt_aqfieldcat[]
                  fpairs    = lt_aqfpairs[]
                  it_aqfieldlist = lt_aqfieldlist[]
                  it_aqrqlist   = lt_aqrqlist[]
                  it_convexits  = lt_convexits[]
                  it_outtab = <lt_clean_data>
          exceptions
                  cancel    = 1
                  gui_type_not_supported = 4
                  export_no_view_change = 3
                  no_authority = 5
                  others    = 2.

        if ( sy-subrc ne 0 ) or ( l_new eq 'X' ).
          if ( sy-subrc ne 0 and sy-msgno ne 0 ).
            case sy-subrc.
              when 4.
                message id sy-msgid type 'I' number sy-msgno
                        with sy-msgv1 sy-msgv2 sy-msgv3 sy-msgv4.

              when others.
                message id sy-msgid type sy-msgty number sy-msgno
                        with sy-msgv1 sy-msgv2 sy-msgv3 sy-msgv4.
            endcase.
          endif.
*          free object l_fadriver_handle.
          call function 'CONTROL_DESTROY'
            exporting
              no_flush  = ' '
            changing
              h_control = l_fadriver_cntl_handle
            exceptions
              others    = 0.
          raise new_view_not_supported.
        endif.

        l_doc_url = l_filename.
        call method set_view_crystal
          exporting
            i_doc_url           = l_doc_url
            i_fadriver_handle   = l_fadriver_cntl_handle
            i_datasource_string = l_datasource_string
          exceptions
            others              = 1.
        if sy-subrc ne 0.
          " very troublesome, set_view failed while Export_crtempl
          " succeeded -> SAPGui component SAPALVCRPrev erronous
*          free object l_fadriver_handle.
          call function 'CONTROL_DESTROY'
            exporting
              no_flush  = ' '
            changing
              h_control = l_fadriver_cntl_handle
            exceptions
              others    = 0.
          raise new_view_not_supported.
        endif.
* donnot free fadriver if successful!
      else. " www_active='X' => SAPGui for HTML
        " !  we need to fill m_crystal_return_url here.
        " this will be displayed in update frontend.
* this function is only available under the following circumstances:
      "  a) we are in crystal-view and exactly this template is present.
        "  b) there exists exactly one crystal template.
* TODO: Remove ALV_BDS, and reuse the one determined before.
        data ls_alv_bds type lvc_s_bds.
        data lt_content type sbdst_content.
        data l_filesize type int4.

        call method me->get_crystal_url
          exporting
            is_alv_bds = me->m_next_alv_bds
          importing
            e_url      = m_crystal_return_url
          exceptions
            others     = 1.
        if ( sy-subrc = 0 ) and
           not ( m_crystal_return_url is initial ).
          call method host_iframe
            exporting
              i_on  = 'X'
              i_url = m_crystal_return_url.
        endif.
      endif.
    when mc_fc_view_grid.
*... Switch to Grid-View
      m_gui_type         = get_gui_type( ).
      call method set_visible
        exporting
          visible = 'X'.
  endcase.
* if successful: set current view m_view to new view !
  if ( sy-subrc eq 0 ).
    m_view = i_new_view.
  else.
    raise new_view_not_supported.
  endif.
* if in SAPGui for HTML and view (switch) to non-crystal
*                  disable host_iframe.
*                 (effectively turning off iframe if we were in
*                   crystal view before).
  if ( www_active = 'X' and m_view ne mc_fc_view_crystal ).
    call method host_iframe
      exporting
        i_on  = ' '
        i_url = ' '.
  endif.

  call method set_visible_view
    exporting
      i_view = m_view.
  clear m_next_view.

  if ( m_view ne mc_fc_view_crystal ).
    if ( not m_alvexp_control is initial ).
      call method m_alvexp_control->free.
      clear m_alvexp_control.
    endif.
  endif.
* what is done here?.
  call method m_cl_variant->set_view
    exporting
      i_view      = m_view
      i_temp_view = 'X'.

endmethod.                    "show_view


method soft_refresh_table_display.

  if _is_bridge_active( ) = abap_true.
    macro_bridge_call_data.
    macro_bridge_method_name cl_gui_alv_grid soft_refresh_table_display.
    macro_bridge_opt_parameter exporting: is_stable is_stable,
                                          is_info   is_info.
    macro_bridge_exception: too_many_lines 1.
    try.
      macro_bridge_call.
    catch cx_salv_grx_nc_meth_exception.
      raise too_many_lines.
    endtry.
    exit.
  endif.

  field-symbols: <tab1> type standard table,
                 <lt_ct00> type standard table,
                 <lt_ct01> type standard table,
                 <lt_ct02> type standard table,
                 <lt_ct03> type standard table,
                 <lt_ct04> type standard table,
                 <lt_ct05> type standard table,
                 <lt_ct06> type standard table,
                 <lt_ct07> type standard table,
                 <lt_ct08> type standard table,
                 <lt_ct09> type standard table.

  data: ls_row_no      type lvc_s_roid,
        ls_row_id      type lvc_s_row,
        ls_col_id      type lvc_s_col,
        ls_curr_row_no type lvc_s_roid,
        ls_curr_col_id type lvc_s_col,
        l_tabix        type sy-tabix,
        ls_row_id2     type lvc_s_row,
        l_row          type i,
        l_value        type lvc_s_data-value,
        ls_data        type lvc_s_data,
        ls_sort        type lvc_s_sort,
        l_count        type sy-tabix,
        l_rdonly       type int4,
        l_sumlevel     type sy-tabix,
        lt_fieldcat    type lvc_t_fcat,
        ls_fieldcat    type lvc_s_fcat,
        l_cols         type i,
        lt_header      type slis_t_listheader,
        lfilter        type int4,
        actuallines    type int4,
*... graphics
        lt_graphics_columns   type lvc_t_fnam,
        lt_graphics_rows      type lvc_t_roid,
        l_fieldname           type lvc_fname.

  data: lt_index_rows    type lvc_t_row,
        lt_row_no        type lvc_t_roid,
        lt_index_columns type lvc_t_col,
        lt_cells         type lvc_t_cell.

  data: l_data_table_lines type i,
        l_gui_type type i.           "B20K8A2QM9

  data: l_uname type syuname.

  l_uname = sy-uname.

*... (X.1) Trace?
  if not mr_trace is initial.
    call method mr_trace->add_trace_item
      exporting
        i_trace_item = 'SOFT_REFRESH_TABLE_DISPLAY - TOP'
        ir_variant   = m_cl_variant
        it_data      = mt_data
        it_info      = mt_info.
  endif.

*... (0) Tell frontend that old table should no longer be used
  if not m_dp_on_demand is initial.
    call method m_dp_on_demand->free_gui_table.
    set handler on_before_send for m_dp_on_demand activation space.
    clear m_dp_on_demand.
  endif.

*... (1) Check Outtab exists and reference is correct
  assign mt_outtab->* to <tab1>.
  if not sy-subrc is initial.
    message a534(0k).
  endif.

*... (2) Initialization
  if m_first is initial.
    create data  mt_ct00 like <tab1>.
    create data  mt_ct01 like <tab1>.
    create data  mt_ct02 like <tab1>.
    create data  mt_ct03 like <tab1>.
    create data  mt_ct04 like <tab1>.
    create data  mt_ct05 like <tab1>.
    create data  mt_ct06 like <tab1>.
    create data  mt_ct07 like <tab1>.
    create data  mt_ct08 like <tab1>.
    create data  mt_ct09 like <tab1>.
    m_first = 'X'.
  endif.

  assign mt_ct00->* to <lt_ct00>.
  assign mt_ct01->* to <lt_ct01>.
  assign mt_ct02->* to <lt_ct02>.
  assign mt_ct03->* to <lt_ct03>.
  assign mt_ct04->* to <lt_ct04>.
  assign mt_ct05->* to <lt_ct05>.
  assign mt_ct06->* to <lt_ct06>.
  assign mt_ct07->* to <lt_ct07>.
  assign mt_ct08->* to <lt_ct08>.
  assign mt_ct09->* to <lt_ct09>.

  if m_batch_mode eq space.
    if m_www is initial.
      if m_very_first is initial.
        if not is_stable is initial.
*... Save scroll info
          call method me->get_scroll_info_via_id
            importing
              es_row_no   = ls_row_no
              es_col_info = ls_col_id.
          call method me->get_current_cell
            importing
              es_row_no = ls_curr_row_no
              es_col_id = ls_curr_col_id.
          call method me->get_first_visible_row
            importing
              row = l_row.

          if me->is_cache_valid( ) ne abap_true
              or m_dynamic_data_active is initial           "Y7AK008854
              or www_active eq abap_true.

            call method cl_gui_cfw=>flush.

          endif.
        endif.
      endif.

      call method me->set_auto_redraw
        exporting
          enable = 0.
      call method me->delete_all_cells_base.
    endif.
  endif.

*... (3) Get Sumlevel
  call function 'LVC_TOTALS_GET'
    exporting
      it_sort            = m_cl_variant->mt_sort
      is_layout          = m_cl_variant->ms_layout
      it_filter_index    = m_cl_variant->mt_filter_index
    tables
      it_data            = <tab1>
      et_collect00       = <lt_ct00>
      et_collect01       = <lt_ct01>
      et_collect02       = <lt_ct02>
      et_collect03       = <lt_ct03>
      et_collect04       = <lt_ct04>
      et_collect05       = <lt_ct05>
      et_collect06       = <lt_ct06>
      et_collect07       = <lt_ct07>
      et_collect08       = <lt_ct08>
      et_collect09       = <lt_ct09>
    changing
      cs_total_options   = m_cl_variant->ms_total_options
      ct_fieldcat        = m_cl_variant->mt_fieldcatalog
      ct_grouplevels     = m_cl_variant->mt_grouplevels_filter
      c_sumlevel         = m_cl_variant->m_sumlevel
      c_calculate_totals = m_cl_variant->m_calculate_totals.

  clear mt_data.
  clear mt_data[].
  clear mt_info.
  clear mt_info[].

*  if not is_stable-row is initial.
*    call function 'LVC_SUMLEVEL_GET'
*      exporting
*        it_sort               = m_cl_variant->mt_sort
*        it_grouplevels_filter = m_cl_variant->mt_grouplevels_filter
*      importing
*        e_sumlevel            = m_cl_variant->m_sumlevel.
*
*    call function 'LVC_SUMLEVEL_SELECT'
*      exporting
*        i_no_dialog  = 'X'
*        i_sumlevel   = m_cl_variant->m_sumlevel
*      changing
*        ct_sort      = m_cl_variant->mt_sort
*        ct_groups    = m_cl_variant->mt_grouplevels_filter
*      exceptions
*        no_subtotals = 0
*        wrong_input  = 0
*        others       = 0.
*    if sy-subrc ne 0.
*    endif.
*  endif.

  if m_batch_mode eq space.
*... No sumlevels in the web when editing
    if m_www is initial.
      call method me->determine_readonly_simple
        importing
          e_readonly = l_rdonly.
    endif.

*    if l_rdonly eq 0 and me->www_active eq 'X'.
*      clear: <lt_ct00>,
*             <lt_ct01>,
*             <lt_ct02>,
*             <lt_ct03>,
*             <lt_ct04>,
*             <lt_ct05>,
*             <lt_ct06>,
*             <lt_ct07>,
*             <lt_ct08>,
*             <lt_ct09>,
*             m_cl_variant->mt_grouplevels,
*             m_cl_variant->mt_grouplevels_filter.
*    endif.

    data: l_view type ui_func.
    if m_next_view is initial.
      l_view = m_view.
    else.
      l_view = m_next_view.
    endif.
  endif.

*... (4) Get Display Information for Frontend
  if is_ready_for_input( ) eq 1.
    me->m_memory = space.
    me->m_performance = SPACE.  "Y6BK07996
  endif.

*<<<Y7AK054985
* Setzen der Farbinformationen für unterschiedliche GUIs:   B20K8A2QM9
*4.6x:
*-alle Farben auch semantische Farben(Summe,Key,Editierbarkeit) werden vom Backend setzen
*-Abmischlogik nach Prio liegt im Backend
* z.B Anwendung sagt ROT, ist aber Keyspalte dann gewinnt ROT

*>4.6x:
*-für semantische Farben werden die Farben am Frontend ermittelt.
*-Backend setzt nur noch Keyspalte, Summenzeile, Editierbar
*-Anwendung setzt Farbe, hier werden die Colors ans Frontend direkt gegeben
*-Entscheidung bei Frontend welche Regel gewinnt siehe obriges Beispiel ROT

* Setzen des GUI-Typs:
* Im integrierten ITS kann auch auf den Modus >4.6x umgeschaltet werden
* Damit bildet nur noch der Standalone HTML GUI die Ausnahme, wo die Abmischlogik
* am Backend stattfindet. In den LVC-Bausteinen hängt die Entscheidung nach der Logik
* an den Abfragen if g_gui_type ne 1. Deshalb wird hier der GUI_TYPE umgeändert.

  if m_gui_type = m_gui_type_windows
  or m_gui_type = m_gui_type_java
  or m_gui_type = m_gui_type_its_int.
* or m_gui_type = m_gui_type_excel.
    l_gui_type = m_gui_type_windows. "Farben am Frontend gesetzt
  else.
    l_gui_type = m_gui_type.  "Farben werden am Backend gesetzt
  endif.
*>>>Y7AK054985

  case me->m_performance.
    when 'X'.
      me->m_roids_sent = space.

      case me->m_memory.
        when 'X'.
          call function 'LVC_GET_INFO_DATA_TABLE'
            exporting
              i_view                         = l_view
              i_gui_type                     = l_gui_type         "#EC *
              it_fieldcat                    = m_cl_variant->mt_fieldcatalog
              it_sort                        = m_cl_variant->mt_sort
              it_filter                      = m_cl_variant->mt_filter
              it_filter_index                = m_cl_variant->mt_filter_index
              is_total_options               = m_cl_variant->ms_total_options
              is_layout                      = m_cl_variant->ms_layout
              i_grid                         = me
            importing
              et_lvc_data                    = mt_data[]
              et_lvc_info                    = mt_info[]
              et_idpo                        = mt_idpo
              et_poid                        = mt_poid
              et_roid                        = mt_roid
              et_fieldcat_local              = mt_fieldcat_local
              es_layout_local                = ms_layout_local
              et_start_index                 = mt_start_index
*        E_COLUMNS                      =
              e_lines                        = l_data_table_lines
            tables
              it_data                        = <tab1>
              it_collect00                   = <lt_ct00>
              it_collect01                   = <lt_ct01>
              it_collect02                   = <lt_ct02>
              it_collect03                   = <lt_ct03>
              it_collect04                   = <lt_ct04>
              it_collect05                   = <lt_ct05>
              it_collect06                   = <lt_ct06>
              it_collect07                   = <lt_ct07>
              it_collect08                   = <lt_ct08>
              it_collect09                   = <lt_ct09>
            changing
              ct_grouplevels                 = m_cl_variant->mt_grouplevels_filter
            exceptions
              fieldcat_not_complete          = 1
              others                         = 2.
          if sy-subrc <> 0.
            message id sy-msgid type sy-msgty number sy-msgno
                    with sy-msgv1 sy-msgv2 sy-msgv3 sy-msgv4.
          endif.

        when others.
          call function 'LVC_TABLE_FOR_DISPLAY_PREPARE'
            exporting
              i_view                   = l_view
              i_gui_type               = l_gui_type         "#EC *
              it_filter_index          = m_cl_variant->mt_filter_index
              it_sort                  = m_cl_variant->mt_sort
              it_filter                = m_cl_variant->mt_filter
              it_fieldcat              = m_cl_variant->mt_fieldcatalog
              is_total_options         = m_cl_variant->ms_total_options
              is_layout                = m_cl_variant->ms_layout
              i_grid                   = me
            importing
              et_lvc_data              = mt_data[]
              et_lvc_info              = mt_info[]
              et_idpo                  = mt_idpo
              et_poid                  = mt_poid
              et_roid                  = mt_roid
              et_fieldcat_local        = mt_fieldcat_local
              es_layout_local          = ms_layout_local
              et_start_index           = mt_start_index
            tables
              it_data                  = <tab1>
              it_collect00             = <lt_ct00>
              it_collect01             = <lt_ct01>
              it_collect02             = <lt_ct02>
              it_collect03             = <lt_ct03>
              it_collect04             = <lt_ct04>
              it_collect05             = <lt_ct05>
              it_collect06             = <lt_ct06>
              it_collect07             = <lt_ct07>
              it_collect08             = <lt_ct08>
              it_collect09             = <lt_ct09>
            changing
              ct_grouplevels_no_filter = m_cl_variant->mt_grouplevels
              ct_grouplevels           = m_cl_variant->mt_grouplevels_filter.

          describe table mt_data lines l_data_table_lines.
      endcase.

* Addieren die Data für Automation Test
      if m_batch_mode eq 'X'
      or cl_salv_veri_run=>on eq cl_salv_veri_run=>c_runtime.
        if l_data_table_lines ne 0.
          call method me->on_before_send
            exporting
              firstline = 1
              lastline  = l_data_table_lines.
        endif.
      endif.

    when others.
      call function 'LVC_TABLE_FOR_DISPLAY'
        exporting
          i_view                   = l_view
          i_gui_type               = l_gui_type             "#EC *
          it_filter_index          = m_cl_variant->mt_filter_index
          it_sort                  = m_cl_variant->mt_sort
          it_filter                = m_cl_variant->mt_filter
          it_fieldcat              = m_cl_variant->mt_fieldcatalog
          is_total_options         = m_cl_variant->ms_total_options
          is_layout                = m_cl_variant->ms_layout
          i_grid                   = me
          it_except_qinfo          = mt_except_qinfo
          ir_salv_adapter          = R_SALV_ADAPTER
        importing
          et_lvc_data              = mt_data[]
          et_lvc_info              = mt_info[]
          et_idpo                  = mt_idpo
          et_poid                  = mt_poid
          et_roid                  = mt_roid
        tables
          it_data                  = <tab1>
          it_collect00             = <lt_ct00>
          it_collect01             = <lt_ct01>
          it_collect02             = <lt_ct02>
          it_collect03             = <lt_ct03>
          it_collect04             = <lt_ct04>
          it_collect05             = <lt_ct05>
          it_collect06             = <lt_ct06>
          it_collect07             = <lt_ct07>
          it_collect08             = <lt_ct08>
          it_collect09             = <lt_ct09>
        changing
          ct_grouplevels_no_filter = m_cl_variant->mt_grouplevels
          ct_grouplevels           = m_cl_variant->mt_grouplevels_filter.

      add_bidi_flags( it_fieldcatalog = m_cl_variant->mt_fieldcatalog ). "Y7AK083963

  endcase.

*... (X.2) Trace?
  if not mr_trace is initial.
    call method mr_trace->add_trace_item
      exporting
        i_trace_item = 'SOFT_REFRESH_TABLE_DISPLAY - END'
        ir_variant   = m_cl_variant
        it_data      = mt_data
        it_info      = mt_info.
  endif.

**----------------------------------------------------
**  This section is only relevant in case of
**  HTML-Export for WEBRFC.
**----------------------------------------------------
  if not m_www is initial.
    if m_performance eq 'X'.
      call method me->on_before_send
        exporting
          firstline = 1
          lastline  = l_data_table_lines.
    endif.
    call method www_alv_call.
    exit.
  endif.

*----------------------------------------------------
*  End of HTML-Export for WEBRFC relevant section
*----------------------------------------------------

*----------------------------------------------------
*Webdynpro Conversion Runtime
*----------------------------------------------------
  "private Atribute: mr_alv_model type ref to cl_alv_model
*  if cl_dynp_global_control=>is_wdpmode( ) eq
*     cl_dynp_global_control=>co_conversion_mode.
*    if mr_alv_model is initial.
*      create object mr_alv_model
*             exporting
*                  i_cntl_handle = me->h_control
*                  ir_alv_grid = me.
*    endif.
*    mr_alv_model->set_metadata( m_cl_variant->mt_fieldcatalog ).
*    mr_alv_model->set_data( mt_outtab ).
*  endif.
*  if not mr_alv_model is initial.
*    check mr_alv_model->get_wdcomp( ) > 0.
*  endif.
*----------------------------------------------------
*  End of Webdynpro Conversion Runtime
*----------------------------------------------------

  l_cols = 0.
*... calculate the number of fixed colums in n.
*    ( exceptions(1) + leading fixed cols ).
  lt_fieldcat = m_cl_variant->mt_fieldcatalog.
  sort lt_fieldcat by col_pos.
  loop at lt_fieldcat into ls_fieldcat.
    check ls_fieldcat-tech ne 'X' and ls_fieldcat-no_out ne 'X'.
    if ls_fieldcat-fix_column ne 'X'.
      exit.
    endif.
    add 1 to l_cols.
  endloop.
  if not m_cl_variant->ms_layout-excp_fname is initial.
    add 1 to l_cols.
  endif.

*... Set toolbar
  if m_batch_mode eq space.
    call method me->set_toolbar
      exporting
        i_interactive = space.
*... note: <> space indicates view switch is requested
*    ( even if view stayed the same, e.g. switch from excel to
*    excel by loading other variant.
    call method m_cl_variant->get_view
      importing
        e_view = m_next_view.

    if ( not me->m_next_view is initial ).
      if me->m_next_view eq mc_fc_view_excel.
        data: l_no_out type i.
        loop at m_cl_variant->mt_fieldcatalog transporting no fields
                                              where no_out ne 'X'.
          add 1 to l_no_out.
        endloop.
        if l_no_out > 255.
          message i417(0k).
          call method m_cl_variant->set_view
            exporting
              i_view = m_view.  "retore old view
          me->m_next_view = me->m_view.
        endif.
      endif.
      call method show_view
        exporting
          i_new_view             = me->m_next_view
          is_alv_bds             = me->m_next_alv_bds
        exceptions
          new_view_not_supported = 1.

      if ( sy-subrc eq 1 ). " restore default view/vs. old view.
        me->m_next_view = me->m_view.
        call method m_cl_variant->set_view
          exporting
            i_view = m_next_view.
        me->m_init_toolbar = 'X'.
        call method me->set_toolbar
          exporting
            i_interactive = space.
        call method set_visible_view
          exporting
            i_view = m_next_view.
      else.

        ">>B20K8A0R55 -> SET_HTML_HEADER
*        if ( m_view eq mc_fc_view_excel ) .
**... set the header data for excel.
**       " ????were was this prepared? is it, even on initial run?
*          import it_list_commentary to lt_header
*               from memory id 'DYNDOS_FOR_ALV_EXCEL'.
*          call method set_header_for_oi
*            exporting
*              it_header = lt_header.
*        endif.
        "<<B20K8A0R55
      endif.                             " sync "gui_type"

*     views are handled only with m_view and m_next_view
*      case m_view.
*        when mc_fc_view_excel.
*          m_gui_type = m_gui_type_excel.
*        when mc_fc_view_crystal.
*          m_gui_type = m_gui_type_crystal.
*        when mc_fc_view_grid.            " TODO? WHAT HERE!! ?
*        when others.
*          m_gui_type = m_gui_type_windows.                    "
*      endcase.

*----------------------------------------------------
* starting from here data is transferred to frontend.
*----------------------------------------------------
      if m_cl_variant->ms_layout-totals_bef eq 'X'.
        call method me->set_total_lines_above
          exporting
            above = 1.
      endif.

      call method me->set_layout_properties.

*... send table to frontend
      call method me->set_info_table
        exporting
          info_table = mt_info[].
      call method me->set_fixed_cols
        exporting
          cols = l_cols.

      case me->m_memory.
        when abap_true.
        when others.
          clear l_data_table_lines.
      endcase.

* set the first line to display: if we scroll to the bottom
      data: l_first_line type i.
      l_first_line = 1.
      if m_very_first is initial and is_stable-row eq 'B'.
        if sy-subrc eq 0.
          l_first_line = l_data_table_lines.
        endif.
      endif.

      break-point id alv_grid.

*... >>> SET DATA TABLE BEGIN
      call method me->set_data_table
        exporting
          no_of_lines = l_data_table_lines
          first_line  = l_first_line
        changing
          data_table  = mt_data[].

*      if m_view eq mc_fc_view_excel.
      if not m_oi_proxy       is initial and
         not m_oi_spreadsheet is initial and
       ( m_view               eq mc_fc_view_excel           "Y6BK076017
      or m_view               eq mc_fc_view_lotus ).
        if me->m_memory eq abap_true or me->m_performance eq abap_true.
          call method me->on_before_send
            exporting
              firstline = 1
              lastline  = l_data_table_lines.
        endif.
        data: retcode type soi_ret_string.
        call method m_oi_spreadsheet->set_data_table
          exporting
            data_table = mt_data
          importing
            retcode = retcode.
        if retcode ne 'OK'.
* switch back to Grid View
          m_view = mc_fc_view_grid.
          message i418(0k).
          call method m_cl_variant->set_view
            exporting
              i_view = m_view.  "restore old view
           me->m_next_view = me->m_view.
           call method show_view
             exporting
               i_new_view             = me->m_next_view
               is_alv_bds             = me->m_next_alv_bds
             exceptions
               new_view_not_supported = 1.
         endif.
      endif.
*... <<< SET DATA TABLE END

*      if me->m_performance ne 'X'.
*        call method me->set_row_id
*          exporting
*            row_id_table = mt_roid.
*      else.
*        if is_ready_for_input( ) eq 1.
*          call method me->set_row_id
*            exporting
*              row_id_table = mt_roid.
*          me->m_roids_sent = 'X'.
*        endif.
*      endif.

      call method me->set_row_id
        exporting
          row_id_table = mt_roid.
      me->m_roids_sent = 'X'.

      if m_edit eq 'X' or m_edit_global eq '1'.
        describe table <tab1> lines l_count.

        call method me->set_highest_row_id
          exporting
            row_id = l_count.
        call method me->set_enter_key_mode
          exporting
            mode = ekm_neutral.

* crash if there are too many lines in web and grid is editable.
*    data insert_row_allowed(10) type c.
*    get parameter id 'SLI' field insert_row_allowed.
*
*    if ( insert_row_allowed ne 'INSERT_ROW' ) and (
*         me->www_active eq 'X' ).
*      describe table m_cl_variant->mt_filter_index lines lfilter.
*      actuallines = l_count - lfilter.
*      if ( actuallines gt 200 ).
*        message a099(0k) with actuallines 200 raising too_many_lines.
*      endif.
*    endif.
      endif.

      if m_very_first is initial.
*... Set saved scroll info for all runs except the first
        if not is_stable is initial.
          if is_stable-col is initial.
            clear ls_col_id.
          elseif is_stable-row is initial.
            clear ls_row_id.
          endif.

          case is_stable-row.
            when 'T'.                                           " Top
*              call method me->set_scroll_info
*                exporting
*                  i_row = 1.

*<<< YI3K155086  sums have to be focussed -> ACC and YI3K242646
              if mt_poid is not initial.

                data:  l_rowid type LVC_S_ROW,
                       ls_poid type LVC_S_RORO,
                       l_colid type lvc_s_col,
                       ls_fieldcat_total type lvc_s_fcat.   "YI3K242646

                read table mt_poid index 1 into ls_poid.
*
                loop at mt_fieldcat_local into ls_fieldcat_total.
                  if ls_fieldcat_total-do_sum is not initial.  "total, average, minima, maxima

                    l_rowid = ls_poid-row_id.
                    l_rowid-ROWTYPE = ls_poid-rowtype.

                    l_colid-fieldname = ls_fieldcat_total-fieldname.  "total

                    CALL METHOD SET_CURRENT_CELL_VIA_ID
                         EXPORTING
                           IS_ROW_ID    = l_rowid    " l_rowid -> focus first total
                           IS_COLUMN_ID = l_colid.

*                    clear l_rowid.
                    clear l_colid.
                    clear ls_row_id.
                    exit.
                  endif.
                endloop.

                call method me->set_scroll_info_via_id
                  exporting
                    IS_ROW_info  = l_rowid                "position total line at top
                    IS_COL_INFO  = ls_col_id.             "current horizontal scroll position of row 120!

                clear l_rowid.
              endif.
*>>> YI3K155086 and YI3K242646

            when 'B'.                                           " Button
              call method me->scroll_to_bottom.

*<<< YI3K155086  sums have to be focussed -> ACC, YI3K242646
              if mt_poid is not initial.

                read table mt_poid index 1 into ls_poid.
*
                loop at mt_fieldcat_local into ls_fieldcat_total.
                  if ls_fieldcat_total-do_sum is not initial.  "total, average, minima, maxima

                    l_rowid = ls_poid-row_id.
                    l_rowid-ROWTYPE = ls_poid-rowtype.

                    l_colid-fieldname = ls_fieldcat_total-fieldname.  "total

                    CALL METHOD SET_CURRENT_CELL_VIA_ID
                         EXPORTING
                           IS_ROW_ID    = l_rowid    " l_rowid
                           IS_COLUMN_ID = l_colid.

                    clear l_rowid.
                    clear l_colid.
                    clear ls_row_id.
                    exit.
                  endif.
                endloop.

                call method me->set_scroll_info_via_id
                  exporting
                    IS_COL_INFO = ls_col_id.            "horizontal scroll position by scroll_to_bottom

              endif.
*>>> YI3K155086, YI3K242646

            when 'E'.
              l_row = is_info-start_row.

              call method me->set_scroll_info_combined
                exporting
                  i_row       = l_row
                  is_col_info = ls_col_id.
              clear ls_row_id.

            when 'C'.
              l_row           = is_info-start_row.
              ls_row_id2      = is_info-row_id.
              ls_row_id2+6(1) = 'X'.

              if me->m_memory eq abap_true.
*                data:
*                  ls_poid type lvc_s_roro.   YI3K155086

                read table mt_poid into ls_poid
                  with key index = is_info-row_id-index.
                assert sy-subrc eq 0.

                data:
                  ls_roid type lvc_s_roid.

                read table mt_roid into ls_roid
                  with key row_id = ls_poid-row_id.
                assert sy-subrc eq 0.

                data:
                  l_request_row type i.

                l_request_row = sy-tabix.

                data:
                  ls_stin type lvc_s_stin.

                read table mt_start_index into ls_stin
                  with key row_pos = l_request_row.
                assert sy-subrc eq 0.

                data:
                  l_firstline type i.

                l_firstline = ls_stin-start_indx.

                data:
                  l_lastline type i.

                l_lastline = lines( mt_info ).

                l_lastline = l_firstline + l_lastline.

                call method me->lvc_table_fill
                  exporting
                    firstline                   = l_firstline
                    lastline                    = l_lastline
                    delete_entries_not_in_range = abap_false.
              endif.

              move ls_row_id2 to l_value.
              read table mt_data into ls_data
                                 with key col_pos = -1
                                          value   = l_value.
              if sy-subrc eq 0.
                l_row = ls_data-row_pos - is_info-abs_gr_row + 1.
                if l_row lt 0.
                  l_row = 1.
                endif.
                call method me->set_scroll_info_combined
                  exporting
                    i_row       = l_row
                    is_col_info = ls_col_id.
                clear ls_row_id.
              endif.
            when others.
              call method me->set_scroll_info_id
                exporting
                  is_row_no = ls_row_no
                  is_col_id = ls_col_id.

              call method me->set_current_cell_via_id
                exporting
                  is_row_no    = ls_curr_row_no
                  is_column_id = ls_curr_col_id.
          endcase.
        endif.
      endif.

**... refresh grafics
      call method m_cl_variant->get_graphics
        importing
          et_columns = lt_graphics_columns
          et_rows    = lt_graphics_rows.

*... graphik is displayed or is stored on DB
      loop at lt_graphics_columns into l_fieldname.
        l_tabix = sy-tabix.
        read table m_cl_variant->mt_fieldcatalog into ls_fieldcat
                   with key fieldname = l_fieldname.
        if sy-subrc eq 0.
          if ls_fieldcat-no_out eq 'X'.
            delete lt_graphics_columns index l_tabix.
          endif.
        endif.
      endloop.
      call method me->show_graphics
        exporting
          it_graphics_columns = lt_graphics_columns
          it_graphics_roid    = lt_graphics_rows.

*... Update Excel/Crystal etc.
*... & create crystal-preview ocx. ( Excecute Macro ).
      if m_view eq mc_fc_view_excel.
        data: flg_no_html(1) type c.
        data: l_repid type sy-repid,
              lr_grid type ref to cl_gui_alv_grid.
        if me->_fullscreen_mode eq abap_true.
          call function 'GET_GLOBALS_FROM_SLVC_FULLSCR'
            importing
              e_repid       = l_repid
              e_grid        = lr_grid
              e_flg_no_html = flg_no_html.
          if not l_repid is initial. "and lr_grid eq me.  " Fullscreen modus?
            if not flg_no_html is initial. "Is a HTML Header required?
              call method me->update_frontend.
            endif.
          else.
            call method me->update_frontend.
          endif.
        else.
          call method me->update_frontend.
        endif.
      endif.

      if ( m_next_view = mc_fc_view_crystal ).
        call method me->host_iframe
          exporting
            i_on  = 'X'
            i_url = m_crystal_return_url.
      endif.
    endif.
  endif.

*... Trace?
  if not mr_trace is initial.
    call method mr_trace->add_trace_item
      exporting
        i_trace_item = 'EVENT: AFTER_REFRESH'
        ir_variant   = m_cl_variant
        it_data      = mt_data
        it_info      = mt_info.
  endif.
  raise event after_refresh.

  if m_batch_mode eq space.
    call method me->set_auto_redraw
      exporting
        enable = 1.
    call method me->layout_colwidth_optimize.
  endif.

*>>AT
  salv_at_soft_refresh( ).
*<<AT

  clear m_invalid_frontend_fieldcat.
  clear m_very_first.
  clear m_next_view.

*...(X) AT_TEST on?
  if m_batch_mode eq 'X'.
    set screen 0.
    leave screen.
  endif.

endmethod.                    "soft_refresh_table_display


method sort_table .

  field-symbols: <tab1> type standard table.

  data: lt_row_col    type lvc_t_col,
        ls_col        type lvc_s_col,
        ls_sort       type lvc_s_sort,
        l_ascending   type c,
        l_subtotals   type c,
        ls_fieldcat   type lvc_s_fcat.

*... Check Outtab
  assign mt_outtab->* to <tab1>.
  if not sy-subrc is initial.
    message a534(0k).
  endif.

  l_ascending = i_ascending.

  call method me->get_selected_columns
              importing et_index_columns = lt_row_col.

  if i_single_click_event eq 'X'.
    read table lt_row_col into ls_col index 1.
    if sy-subrc eq 0.
      read table m_cl_variant->mt_sort
                 with key fieldname = ls_col-fieldname
                 into ls_sort.
      if sy-subrc eq 0.
        if ls_sort-up eq 'X'.
          l_ascending = space.
        else.
          l_ascending = 'X'.
        endif.
      else.
        l_ascending = 'X'.
      endif.
*23.08.99/V4.6c/kds: nur wenn generisches Popup angefordert wird, muss
*i_subtotals Wert enthalten sonst immer initial, sonst Fehlermeldung:
*'über den Wert dürfen keine Zwischensummen gebildet werden'
*     Clear l_subtotals.
      l_subtotals = m_cl_variant->ms_total_options-totals_out.
    else.
      l_subtotals = i_subtotals.
    endif.
  else.
    read table lt_row_col into ls_col index 1.
    if sy-subrc eq 0.
      l_subtotals = i_subtotals.
    else.
      l_subtotals = m_cl_variant->ms_total_options-totals_out.
    endif.
  endif.

  if _is_bridge_active( ) = abap_true.
    macro_bridge_call_data.
    macro_bridge_method_name cl_gui_alv_grid sort_table.
    macro_bridge_parameter exporting: i_ascending l_ascending,
                                      i_subtotals l_subtotals.
    macro_bridge_exception: no_change 1.
    try.
      macro_bridge_call.
    catch cx_salv_grx_nc_meth_exception into lr_exception.
      raise no_change.
    endtry.
  else.
    call function 'LVC_SORT'
         exporting
              it_fieldcat      = m_cl_variant->mt_fieldcatalog
              it_selected_cols = lt_row_col
*  17.12.2000/kds   it_groups       = m_cl_variant->mt_special_groups
              it_groups        = mt_special_groups
              is_layout        = m_cl_variant->ms_layout
              i_ascending      = l_ascending
              i_subtotals      = l_subtotals
         tables
              ct_data          = <tab1>
         changing
              ct_sort          = m_cl_variant->mt_sort[]
         exceptions
              no_change        = 1.
    if sy-subrc <> 0.
      raise no_change.
    endif.
  endif.
  call function 'LVC_SORT_COMPLETE'
       exporting
            it_fieldcat = m_cl_variant->mt_fieldcatalog
       changing
            ct_sort     = m_cl_variant->mt_sort.
  call method me->get_grouplevels.
  m_cl_variant->m_calculate_totals = 'X'.

endmethod.


method sort_table_up_or_down .

  field-symbols: <tab1> type standard table.

  data: lt_col type lvc_t_col.
  data: lt_col_wa type line of lvc_t_col.
  data: l_ascending.
  data: ls_sort type lvc_s_sort.

*... Check Outtab
  assign mt_outtab->* to <tab1>.
  if not sy-subrc is initial.
    message a534(0k).
  endif.

  move i_column to lt_col_wa.
  append lt_col_wa to lt_col.

  read table m_cl_variant->mt_sort
             with key fieldname = i_column-fieldname
             into ls_sort.
  if sy-subrc eq 0.
    if ls_sort-up eq 'X'.
      l_ascending = space.
    else.
      l_ascending = 'X'.
    endif.
  else.
    l_ascending = 'X'.
  endif.

  call function 'LVC_SORT'
       exporting
            it_fieldcat      = m_cl_variant->mt_fieldcatalog
            it_selected_cols = lt_col
            is_layout        = m_cl_variant->ms_layout
            i_ascending      = l_ascending
       tables
            ct_data          = <tab1>
       changing
            ct_sort          = m_cl_variant->mt_sort
       exceptions
            no_change        = 0.

endmethod.


method split_good_and_bad.

  field-symbols: <tab1>       type standard table,
                 <ls_wa>      type any,
                 <ls_wa2>     type any,
                 <l_field>    type any,
                 <l_currency> type any,
                 <init_val>   type any.

  data: ls_mod_cells    type lvc_s_modi,
        ls_good_cells   type lvc_s_modi,
        ls_cells        type lvc_s_moce,
        ls_inserted     type lvc_s_moce,
        ls_fieldcat     type lvc_s_fcat,
        lp_wa2          type ref to data,
        ls_deleted_rows type lvc_s_moce,
        l_row_id        type i,
        l_tabix         type sy-tabix,
        lp_wa           type ref to data,
        lt_check        type lvc_t_chck,
        l_no_check      type c.         "Y7AK108335

*... Check Outtab
  assign mt_outtab->* to <tab1>.
  if not sy-subrc is initial.
    message a534(0k).
  endif.

*... Assign workarea
  create data lp_wa like line of <tab1>.
  assign lp_wa->* to <ls_wa>.

*... Assign corresponding workarea
  create data lp_wa2 like line of ct_tab2.
  assign lp_wa2->* to <ls_wa2>.

  loop at it_cells into ls_cells.
*... Append deleted cells
    if ls_cells-col_id eq -1.
      ls_deleted_rows-row_id = ls_cells-row_id.
      ls_deleted_rows-col_id = ls_cells-col_id.
      append ls_deleted_rows to et_deleted_rows.
      continue.
    endif.

*... After each row
    if not l_row_id is initial      and
       l_row_id ne ls_cells-row_id.

*... Save formaly correct changes into copy of data table
      if not l_tabix is initial.
        modify ct_tab2 from <ls_wa> index l_tabix.
      endif.

* <<< YI2K028954
* prevent foreign_key_check in all cases,
* idependent whether field value is initial or not, request of TA PMKC
      read table m_cl_variant->mt_fieldcatalog into ls_fieldcat
                 with key col_id = ls_cells-col_id.
      if sy-subrc ne 0.
         message x000(0k).
      endif.

      if ls_fieldcat-no_init_ch = 'A'.
        l_no_check = 'X'.
      endif.

      if l_no_check is initial.
*>>> YI2K028954
*... Check foreign key for the last row
        call method me->foreign_key_check
          exporting
            i_row_id      = l_row_id
          importing
            e_invalid     = eflg_invalid
          changing
            cs_wa         = <ls_wa>
            ct_mod_cells  = et_mod_cells
            ct_good_cells = et_good_cells
            ct_check      = lt_check
            ct_msg        = mt_msg.
        clear lt_check.
      endif.
    endif.


* Save modified cell in backend format
    read table m_cl_variant->mt_fieldcatalog into ls_fieldcat
               with key col_id = ls_cells-col_id.
    if sy-subrc ne 0.
      message x000(0k).
    endif.

*... if the field is associated to a dropdown list with alias texts,
*    change the value accordingly
    if ls_fieldcat-drdn_alias = 'X'.

      call method dropdown_value_change
        exporting
          is_fieldcat = ls_fieldcat
        changing
          cs_cell     = ls_cells.

    endif.

*... For each new row
    if l_row_id ne ls_cells-row_id.
      clear <ls_wa>.
      read table <tab1> into <ls_wa> index ls_cells-row_id.
      if sy-subrc ne 0.
        ls_inserted-row_id = ls_cells-row_id.
        append ls_inserted to et_inserted_rows.
      endif.
      append <ls_wa> to ct_tab2.

*... Index of the corresponding modified rows table
      l_tabix = sy-tabix.
    endif.

*-- Row ID
    ls_mod_cells-row_id = ls_cells-row_id.
*-- Tabix in the copy of the data table
    ls_mod_cells-tabix  = l_tabix.
*-- Fieldname as col_id
    ls_mod_cells-fieldname = ls_fieldcat-fieldname.
*-- The value
    ls_mod_cells-value = ls_cells-value.
*-- The style
    ls_mod_cells-style = ls_cells-style.
    append ls_mod_cells to et_mod_cells.

    if ls_cells-value is initial and ls_fieldcat-no_init_ch ca 'XB'
    or ls_fieldcat-no_init_ch eq 'A'.                        "YI2K028954
      move-corresponding ls_mod_cells to ls_good_cells.
      append ls_good_cells to et_good_cells.
      assign component ls_fieldcat-fieldname
          of structure <ls_wa> to <init_val>.
      <init_val> = ls_cells-value.
*   Save index of last line
      l_row_id = ls_cells-row_id.

      continue.
    endif.
*... Check for invalid fieldnames

    if ls_cells-col_id eq -2.
      continue.
    endif.


*** Get checkfields for column
    call method me->get_other_checkfields
      exporting
        is_fieldcat = ls_fieldcat
      importing
        et_check    = lt_check.

*** Formal checks
*   Actual field
    assign component ls_fieldcat-fieldname
                     of structure <ls_wa> to <l_field>.
*   Actual currency
    if not ls_fieldcat-cfieldname is initial.
      data: ls_fieldcat_temp type lvc_s_fcat,
            ls_cells_temp    type lvc_s_moce.

      read table m_cl_variant->mt_fieldcatalog into ls_fieldcat_temp
                 with key fieldname = ls_fieldcat-cfieldname.
      if sy-subrc eq 0.
        read table it_cells into ls_cells_temp
                   with key col_id = ls_fieldcat_temp-col_id
                            row_id = ls_cells-row_id.
        if sy-subrc eq 0.
          translate ls_cells_temp-value to upper case.   "#EC TRANSLANG
          assign ls_cells_temp-value to <l_currency>.
        else.
          assign ls_cells_temp-value to <l_currency>.
          clear <l_currency>.
        endif.
        if <l_currency> is initial.
          assign component ls_fieldcat-cfieldname
                           of structure <ls_wa> to <l_currency>.
        endif.
        if <l_currency> is initial.
          assign ls_fieldcat-currency to <l_currency>.
          if sy-subrc ne 0.
            assign space to <l_currency>.
          endif.
        endif.
      endif.
* actual quantity
    elseif not ls_fieldcat-qfieldname is initial.

      read table m_cl_variant->mt_fieldcatalog into ls_fieldcat_temp
                 with key fieldname = ls_fieldcat-qfieldname.
      if sy-subrc eq 0.
        read table it_cells into ls_cells_temp
                   with key col_id = ls_fieldcat_temp-col_id
                            row_id = ls_cells-row_id.
        if sy-subrc eq 0.
          translate ls_cells_temp-value to upper case.   "#EC TRANSLANG
          assign ls_cells_temp-value to <l_currency>.
        else.
          assign ls_cells_temp-value to <l_currency>.
          clear <l_currency>.
        endif.
        if <l_currency> is initial.
          assign component ls_fieldcat-qfieldname
                           of structure <ls_wa> to <l_currency>.
        endif.
        if <l_currency> is initial.
          assign ls_fieldcat-QUANTITY to <l_currency>.
          if sy-subrc ne 0.
            assign space to <l_currency>.
          endif.
        endif.
      endif.
    else.
      if not ls_fieldcat-currency is initial.
        assign ls_fieldcat-currency to <l_currency>.
      elseif not ls_fieldcat-quantity is initial.
        assign ls_fieldcat-quantity to <l_currency>.
      else.
        assign space to <l_currency>.
      endif.
    endif.

*   If field has not DDIC referencen
    if ls_fieldcat-ref_table is initial.
*--   Formal field check without DDIC reference
      call method me->formal_field_check_no_ddic
        exporting
          i_currency    = <l_currency>
          i_value       = ls_cells-value
          i_row_id      = ls_cells-row_id
          i_tabix       = l_tabix
          is_fieldcat   = ls_fieldcat
        importing
          eflg_invalid  = eflg_invalid
        changing
          c_field       = <l_field>
          ct_good_cells = et_good_cells
          ct_mod_cells  = et_mod_cells.
    else.
*--   Formal field check with DDIC reference
      call method me->formal_field_check_ddic
        exporting
          i_currency    = <l_currency>
          i_value       = ls_cells-value
          i_row_id      = ls_cells-row_id
          i_tabix       = l_tabix
          is_fieldcat   = ls_fieldcat
        importing
          eflg_invalid  = eflg_invalid
        changing
          c_field       = <l_field>
          ct_good_cells = et_good_cells
          ct_mod_cells  = et_mod_cells.
    endif.
*   Save index of last line
    l_row_id = ls_cells-row_id.
  endloop.

* After the last row
  if sy-subrc eq 0           and
     not l_row_id is initial.
*   Save formaly correct changes into copy of data table
    if not l_tabix is initial.
      modify ct_tab2 from <ls_wa> index l_tabix.
    endif.

*   Check foreign key for the last row
    call method me->foreign_key_check
      exporting
        i_row_id      = l_row_id
      importing
        e_invalid     = eflg_invalid
      changing
        cs_wa         = <ls_wa>
        ct_mod_cells  = et_mod_cells
        ct_good_cells = et_good_cells
        ct_check      = lt_check
        ct_msg        = mt_msg.
    clear lt_check.
  endif.

endmethod.                    "split_good_and_bad


method toolbar_build .

  data: ls_toolbar type stb_button,
        l_text     type gui_text.

*... Initialize Toolbar
  clear mt_toolbar.
  call method me->toolbar_menus_init.

*... Toolbar is not to be displayed
  read table mt_excluding_toolbar with key table_line = mc_fc_excl_all
             transporting no fields.
  if sy-subrc eq 0.
    exit.
  endif.

*... AMC Push Channel
  if _mo_amc_receiver->is_active( ) eq abap_true.
    clear ls_toolbar.
    ls_toolbar-function    = '&REFR'.
    ls_toolbar-quickinfo   = 'Auto Refresh'.
    ls_toolbar-icon        = _mo_amc_receiver->get_status_refresh_icon( ).
    ls_toolbar-disabled    = space.
    append ls_toolbar to mt_toolbar.
  endif.

*... Toolbar Button DETAIL
  clear ls_toolbar.
  ls_toolbar-function    = mc_fc_detail.
  ls_toolbar-quickinfo   = text-037.                        "Details
  ls_toolbar-icon        = icon_select_detail.
  ls_toolbar-disabled    = space.
  append ls_toolbar to mt_toolbar.

*... Toolbar Seperator
  clear ls_toolbar.
  ls_toolbar-function    = '&&SEP00'.
  ls_toolbar-butn_type   = 3.
  append ls_toolbar to mt_toolbar.

*... Toolbar Button CHECK
  clear ls_toolbar.
  ls_toolbar-function    = mc_fc_check.
  ls_toolbar-quickinfo   = text-053.   "Eingaben prfen
  ls_toolbar-icon        = icon_check.
  ls_toolbar-disabled    = space.
  append ls_toolbar to mt_toolbar.

*... Toolbar Button REFRESH
  clear ls_toolbar.
  ls_toolbar-function    = mc_fc_refresh.
  ls_toolbar-quickinfo   = text-044.   "Auffrischen
  ls_toolbar-icon        = icon_refresh.
  ls_toolbar-disabled    = space.
  append ls_toolbar to mt_toolbar.

*... Toolbar Seperator
  clear ls_toolbar.
  ls_toolbar-function    = '&&SEP01'.
  ls_toolbar-butn_type   = 3.
  append ls_toolbar to mt_toolbar.

*... Toolbar Button CUT
  clear ls_toolbar.
  ls_toolbar-function    = mc_fc_loc_cut.
  ls_toolbar-quickinfo   = text-046.   "Ausschneiden
  ls_toolbar-icon        = icon_system_cut.
  ls_toolbar-disabled    = space.
  append ls_toolbar to mt_toolbar.

*... Toolbar Button COPY
  clear ls_toolbar.
  ls_toolbar-function    = mc_fc_loc_copy.
  ls_toolbar-quickinfo   = text-045.                        " Kopieren
  ls_toolbar-icon        = icon_system_copy.
  ls_toolbar-disabled    = space.
  append ls_toolbar to mt_toolbar.

*--- Menu Button PASTE ---------------------------------- BEGIN --------
  clear ls_toolbar.
  ls_toolbar-function    = mc_fc_loc_paste.
  ls_toolbar-quickinfo   = text-047.                        "Einfgen
  ls_toolbar-icon        = icon_system_paste.
  ls_toolbar-disabled    = space.
  ls_toolbar-butn_type   = 1.
  append ls_toolbar to mt_toolbar.
*... Menu Button PASTE add Menu Item PASTE OVER ROW
  l_text = text-047.
  call method m_cl_menu_button_paste->add_function
    exporting
      fcode = mc_fc_loc_paste
      text  = l_text.
*... Menu Button PASTE add Menu Item PASTE NEW ROW
  l_text = text-063.
  call method m_cl_menu_button_paste->add_function
    exporting
      fcode = mc_fc_loc_paste_new_row
      text  = l_text.

*... Toolbar Button PASTE OVER ROW
  clear ls_toolbar.
  ls_toolbar-function    = mc_fc_loc_paste.
  ls_toolbar-quickinfo   = text-047.
  ls_toolbar-icon        = icon_system_paste.
  ls_toolbar-disabled    = space.
  append ls_toolbar to mt_toolbar.

*... Toolbar Button PASTE NEW ROW
  clear ls_toolbar.
  ls_toolbar-function    = mc_fc_loc_paste_new_row.
  ls_toolbar-quickinfo   = text-063.
  ls_toolbar-icon        = icon_system_paste.
  ls_toolbar-disabled    = space.
  append ls_toolbar to mt_toolbar.
*--- Menu Button PASTE ------------------------------------ END --------

*... Toolbar Button UNDO
  clear ls_toolbar.
  ls_toolbar-function    = mc_fc_loc_undo.
  ls_toolbar-quickinfo   = text-052.   "Rckgngig
  ls_toolbar-icon        = icon_system_undo.
  ls_toolbar-disabled    = space.
  append ls_toolbar to mt_toolbar.

*... Toolbar Separator
  clear ls_toolbar.
  ls_toolbar-function    = '&&SEP02'.
  ls_toolbar-butn_type   = 3.
  append ls_toolbar to mt_toolbar.

*... Toolbar Button APPEND ROW
  clear ls_toolbar.
  ls_toolbar-function    = mc_fc_loc_append_row.
  ls_toolbar-quickinfo   = text-054.   "Zeile anhngen
  ls_toolbar-icon        = icon_create.
  ls_toolbar-disabled    = space.
  append ls_toolbar to mt_toolbar.

*... Toolbar Button INSERT ROW
  clear ls_toolbar.
  ls_toolbar-function    = mc_fc_loc_insert_row.
  ls_toolbar-quickinfo   = text-048.   "Zeile einfgen
  ls_toolbar-icon        = icon_insert_row.
  ls_toolbar-disabled    = space.
  append ls_toolbar to mt_toolbar.

*... Toolbar Button DELETE ROW
  clear ls_toolbar.
  ls_toolbar-function    = mc_fc_loc_delete_row.
  ls_toolbar-quickinfo   = text-049.   "Zeile lschen
  ls_toolbar-icon        = icon_delete_row.
  ls_toolbar-disabled    = space.
  append ls_toolbar to mt_toolbar.

*... Toolbar Button COPY ROW
  clear ls_toolbar.
  ls_toolbar-function    = mc_fc_loc_copy_row.
  ls_toolbar-quickinfo   = text-051.   "Duplizieren
  ls_toolbar-icon        = icon_copy_object.
  ls_toolbar-disabled    = space.
  append ls_toolbar to mt_toolbar.

*... Toolbar Separator
  clear ls_toolbar.
  ls_toolbar-function    = '&&SEP03'.
  ls_toolbar-butn_type   = 3.
  append ls_toolbar to mt_toolbar.

*... Toolbar Button SORT ASCENDING
  clear ls_toolbar.
  ls_toolbar-function    = mc_fc_sort_asc.
  ls_toolbar-quickinfo   = text-021.   "Aufsteigend sortieren
  ls_toolbar-icon        = icon_sort_up.
  ls_toolbar-disabled    = space.
  append ls_toolbar to mt_toolbar.

*... Toolbar Button SORT DESCENDING
  clear ls_toolbar.
  ls_toolbar-function    = mc_fc_sort_dsc.
  ls_toolbar-quickinfo   = text-022.   "Absteigend sortieren
  ls_toolbar-icon        = icon_sort_down.
  ls_toolbar-disabled    = space.
  append ls_toolbar to mt_toolbar.

*... Toolbar Button FIND
  clear ls_toolbar.
  ls_toolbar-function    = mc_fc_find.
  ls_toolbar-quickinfo   = text-036.                        "Suchen...
  ls_toolbar-icon        = icon_search.
  ls_toolbar-disabled    = space.
  append ls_toolbar to mt_toolbar.

*... Toolbar Button FIND NEXT
  clear ls_toolbar.
  ls_toolbar-function    = mc_fc_find_more.
  ls_toolbar-quickinfo   = text-071.                        "Suchen...
  ls_toolbar-icon        = icon_search_next.
  ls_toolbar-disabled    = space.
  append ls_toolbar to mt_toolbar.

*--- Menu Button FILTER --------------------------------- BEGIN --------
  clear ls_toolbar.
  ls_toolbar-function    = mc_mb_filter.
  ls_toolbar-quickinfo   = text-008.                        "set filter
  ls_toolbar-icon        = icon_filter.
  ls_toolbar-disabled    = space.
  ls_toolbar-butn_type   = 1.
  append ls_toolbar to mt_toolbar.
*... Menu Button FILTER add Menu Item FILTER
  l_text = text-008.
  call method m_cl_menu_button_filter->add_function
    exporting
      fcode = mc_fc_filter
      text  = l_text.                 "Filtern
*... Menu Button FILTER add Menu Item DELETE FILTER
  l_text = text-007.
  call method m_cl_menu_button_filter->add_function
    exporting
      fcode = mc_fc_delete_filter
      text  = l_text. "Filter loeschen

*... Toolbar Button FILTER
  clear ls_toolbar.
  ls_toolbar-function    = mc_fc_filter.
  ls_toolbar-quickinfo   = text-008.                        "Suchen...
  ls_toolbar-icon        = icon_filter.
  ls_toolbar-disabled    = space.
  append ls_toolbar to mt_toolbar.
*--- Menu Button FILTER ----------------------------------- END --------

*... Toolbar Separator
  clear ls_toolbar.
  ls_toolbar-function    = '&&SEP04'.
  ls_toolbar-butn_type   = 3.
  append ls_toolbar to mt_toolbar.

*--- Menu Button SUM ------------------------------------ BEGIN --------
  clear ls_toolbar.
  ls_toolbar-function    = mc_mb_sum.
  ls_toolbar-quickinfo   = text-023.                        "Summe
  ls_toolbar-icon        = icon_sum.
  ls_toolbar-disabled    = space.
  ls_toolbar-butn_type   = 1.
  append ls_toolbar to mt_toolbar.
*... Menu Button SUM add Menu Item SUM
  l_text = text-023.
  call method m_cl_menu_button_sum->add_function
    exporting
      fcode = mc_fc_sum
      text  = l_text.                 "Summe
*... Menu Button SUM add Menu Item AVERAGE
  l_text = text-104.
  call method m_cl_menu_button_sum->add_function
    exporting
      fcode = mc_fc_average
      text  = l_text.                 "Mittelwert
*... Menu Button SUM add Menu Item MINIMUM
  l_text = text-106.
  call method m_cl_menu_button_sum->add_function
    exporting
      fcode = mc_fc_minimum
      text  = l_text.                 "Minimum
*... Menu Button SUM add Menu Item MAXIMUM
  l_text = text-105.
  call method m_cl_menu_button_sum->add_function
    exporting
      fcode = mc_fc_maximum
      text  = l_text.                 "Maximum
*... Menu Button SUM add Menu Item COUNT
  l_text = text-107.
  call method m_cl_menu_button_sum->add_function
    exporting
      fcode = mc_fc_count
      text  = l_text.                 "Zhlen

*... Toolbar Button Sum
  clear ls_toolbar.
  ls_toolbar-function    = mc_fc_sum.
  ls_toolbar-quickinfo   = text-023.   "Summe
  ls_toolbar-icon        = icon_sum.
  ls_toolbar-disabled    = space.
  append ls_toolbar to mt_toolbar.

*... Toolbar Button Average
  clear ls_toolbar.
  ls_toolbar-function    = mc_fc_average.
  ls_toolbar-quickinfo   = text-104.   "Mittelwert
  ls_toolbar-icon        = icon_average.
  ls_toolbar-disabled    = space.
  append ls_toolbar to mt_toolbar.

*... Toolbar Button Minimum
  clear ls_toolbar.
  ls_toolbar-function    = mc_fc_minimum.
  ls_toolbar-quickinfo   = text-106.   "Minimum
  ls_toolbar-icon        = icon_sum.
  ls_toolbar-disabled    = space.
  append ls_toolbar to mt_toolbar.

*... Toolbar Button Maximum
  clear ls_toolbar.
  ls_toolbar-function    = mc_fc_maximum.
  ls_toolbar-quickinfo   = text-105.   "Maximum
  ls_toolbar-icon        = icon_sum.
  ls_toolbar-disabled    = space.
  append ls_toolbar to mt_toolbar.

*... Toolbar Button Count
  clear ls_toolbar.
  ls_toolbar-function    = mc_fc_count.
  ls_toolbar-quickinfo   = text-107.   "Zhlen
  ls_toolbar-icon        = icon_sum.
  ls_toolbar-disabled    = space.
  append ls_toolbar to mt_toolbar.
*--- Menu Button SUM -------------------------------------- END --------

*--- Menu Button SUBTOTAL ------------------------------- BEGIN --------
  clear ls_toolbar.
  ls_toolbar-function    = mc_mb_subtot.
  ls_toolbar-quickinfo   = text-024.   "Zwischensummen
  ls_toolbar-icon        = icon_intermediate_sum.
  ls_toolbar-disabled    = space.
  ls_toolbar-butn_type   = 1.
  append ls_toolbar to mt_toolbar.
*... Menu Button ZSUM add Menu Item SUBTOTAL
  l_text = text-024.
  call method m_cl_menu_button_subtot->add_function
    exporting
      fcode = mc_fc_subtot
      text  = l_text.  "Zwischensummen
*... Menu Button ZSUM add Menu Item AUFRISSUMMENSTUFE
  l_text = text-043.
  call method m_cl_menu_button_subtot->add_function
    exporting
      fcode = mc_fc_auf
      text  = l_text.  "Aufrisssummenstufe

*... Toolbar Button Subtotal
  clear ls_toolbar.
  ls_toolbar-function    = mc_fc_subtot.
  ls_toolbar-quickinfo   = text-024.   "Zwischensummen
  ls_toolbar-icon        = icon_intermediate_sum.
  ls_toolbar-disabled    = space.
  append ls_toolbar to mt_toolbar.
*--- Menu Button SUBTOTAL --------------------------------- END --------

*... Toolbar Separator
  clear ls_toolbar.
  ls_toolbar-function = '&&SEP05'.
  ls_toolbar-butn_type = 3.
  append ls_toolbar to mt_toolbar.

*... Toolbar Button PRINT
  clear ls_toolbar.
*  ls_toolbar-function    = mc_fc_call_crbatch. "DELETE B20K8A0O2B
  ls_toolbar-function    = mc_fc_print_back. "INSERT B20K8A0O2B
  " if crbatch is impossible, this defaults to  " mc_fc_print_back. "
  ls_toolbar-quickinfo   = text-025.                        "Print
  ls_toolbar-icon        = icon_print.
  ls_toolbar-disabled    = space.
  append ls_toolbar to mt_toolbar.

*--- Menu Button VIEW ----------------------------------- BEGIN --------
  data: boolean type sap_bool.
*... check products installed
  clear ls_toolbar.
  ls_toolbar-function    = mc_mb_view.
  ls_toolbar-quickinfo   = text-055.                        " Ansichten
  ls_toolbar-icon        = icon_layout_control.
  ls_toolbar-disabled    = space.
  ls_toolbar-butn_type   = 2.
  append ls_toolbar to mt_toolbar.
*... Menu Button VIEW add Menu Item PRINT PREVIEW
  l_text = text-026.
  call method m_cl_menu_button_view->add_function
    exporting
      fcode = mc_fc_print_prev
      text  = l_text. "Print Preview
*... Menu Button VIEW add Menu Item VIEW GRID
  l_text = text-062.
  call method m_cl_menu_button_view->add_function
    exporting
      fcode = mc_fc_view_grid
      text  = l_text. "Grid
*... Menu Button VIEW add Menu Item VIEW EXCEL
  boolean = cl_alv_check_third_party=>is_supported(
                 cl_alv_bds=>mc_excel_frontend ).
  if boolean eq abap_true.
    l_text = text-061.
    call method m_cl_menu_button_view->add_function
      exporting
        fcode = mc_fc_view_excel
        text  = l_text. "Excel-Inplace
    clear ls_toolbar.
    ls_toolbar-function    = mc_fc_view_excel.
    ls_toolbar-quickinfo   = text-061.   "Excel-Inplace
    ls_toolbar-icon        = icon_xls.
    ls_toolbar-disabled    = space.
    append ls_toolbar to mt_toolbar.
  endif.
*... Menu Button VIEW add Menu Item VIEW LOTUS
  boolean = cl_alv_check_third_party=>is_supported(
                 cl_alv_bds=>mc_lotus_frontend ).
  if boolean eq abap_true.
    l_text = text-068.
    call method m_cl_menu_button_view->add_function
      exporting
        fcode = mc_fc_view_lotus
        text  = l_text. "Lotus-Inplace
    clear ls_toolbar.
    ls_toolbar-function    = mc_fc_view_lotus.
    ls_toolbar-quickinfo   = text-068.   "Lotus Inplace
    ls_toolbar-icon        = icon_lotus.
    ls_toolbar-disabled    = space.
    append ls_toolbar to mt_toolbar.
  endif.
*... Menu Button VIEW add Menu Item VIEW CRYSTAL
  boolean = cl_alv_check_third_party=>is_supported(
                 cl_alv_bds=>mc_crystal_frontend ).
  if boolean eq abap_true.
    l_text = text-060.
    call method m_cl_menu_button_view->add_function
      exporting
        fcode = mc_fc_view_crystal
        text  = l_text. "Crystal Preview
    clear ls_toolbar.
    ls_toolbar-function    = mc_fc_view_crystal.
    ls_toolbar-quickinfo   = text-060.   "Crystal
    ls_toolbar-icon        = icon_layout_control.
    ls_toolbar-disabled    = space.
    append ls_toolbar to mt_toolbar.
  endif.

*... Toolbar Button Print Preview
  clear ls_toolbar.
  ls_toolbar-function    = mc_fc_print_prev.
  ls_toolbar-quickinfo   = text-026.   "Zwischensummen
  ls_toolbar-icon        = icon_layout_control.
  ls_toolbar-disabled    = space.
  append ls_toolbar to mt_toolbar.

*... Toolbar Button Grid
  clear ls_toolbar.
  ls_toolbar-function    = mc_fc_view_grid.
  ls_toolbar-quickinfo   = text-062.   "Grid
  ls_toolbar-icon        = icon_list. "icon_layout_control.
  ls_toolbar-disabled    = space.
  append ls_toolbar to mt_toolbar.
*--- Menu Button VIEW ------------------------------------- END --------

*--- Menu Button EXPORT --------------------------------- BEGIN --------
  clear ls_toolbar.
  ls_toolbar-function    = mc_mb_export.
  ls_toolbar-quickinfo   = text-028.   "Exportieren
  ls_toolbar-icon        = icon_export.
  ls_toolbar-disabled    = space.
  ls_toolbar-butn_type   = 2.
  append ls_toolbar to mt_toolbar.
*... Menu Button EXPORT add Menu Item XXL
  l_text = text-032.
  call method m_cl_menu_button_export->add_function
    exporting
      fcode = mc_fc_call_xxl
      text  = l_text.                  "Tabellenkalkulation
*... Menu Button EXPORT add Menu Item WORD
  if cl_alv_check_third_party=>is_supported( if_alv_z=>c_frontend-word ) = abap_true.
    l_text = text-029.
    call method m_cl_menu_button_export->add_function
      exporting
        fcode = mc_fc_word_processor
        text  = l_text.                  "Textverarbeitung
  endif.
*... Menu Button EXPORT add Menu Item PC FILE
  l_text = text-030.
  call method m_cl_menu_button_export->add_function
    exporting
      fcode = mc_fc_pc_file
      text  = l_text.                  "Lokale Datei
*... Menu Button EXPORT add Menu Item SEND
  l_text = text-031.
  call method m_cl_menu_button_export->add_function
    exporting
      fcode = mc_fc_send
      text  = l_text.                  "Senden
*... Menu Button EXPORT add Menu Item OFFICE
  l_text = text-033.
  call method m_cl_menu_button_export->add_function
    exporting
      fcode = mc_fc_to_office
      text  = l_text.                  "Office
*... Menu Button EXPORT add Menu Item ABC
  l_text = text-038.
  call method m_cl_menu_button_export->add_function
    exporting
      fcode = mc_fc_call_abc
      text  = l_text.                  "ABC-Analyse
*... Menu Button EXPORT add Menu Item Extended Export
  l_text = text-155.
  call method m_cl_menu_button_export->add_function
    exporting
      fcode = mc_fc_call_xint
      text  = l_text.                  "Erweiterte Ablage
**... Menu Button EXPORT add Menu Item Crystal Designer Launch
*  boolean = cl_alv_check_third_party=>is_active(
*                 cl_alv_bds=>mc_crystal_frontend ).
*  if boolean eq abap_true.
*    l_text = text-153.
*    call method m_cl_menu_button_export->add_function
*      exporting
*        fcode = mc_fc_expcrdesig
*        text  = l_text.                  "Crystal Designer Launch
**  ... Menu Button EXPORT add Menu Item Crystal Report File Export
*    l_text = text-154.
*    call method m_cl_menu_button_export->add_function
*      exporting
*        fcode = mc_fc_expcrtempl
*        text  = l_text.                  "Crystal Report File Export
**... Menu Button EXPORT add Menu Item PRINT PREVIEW
*    l_text = text-156.
*    call method m_cl_menu_button_export->add_function
*      exporting
*        fcode = mc_fc_call_crbatch
*        text  = l_text.                  "Crystal-Batch
*  endif.
*... Menu Button EXPORT add Menu Item XML Export
*  l_text = text-034.  "Y7AK044553
*  call method m_cl_menu_button_export->add_function
*    exporting
*      fcode = mc_fc_call_xml_export
*      text  = l_text.                  "Tabellenkalkulation
*... Menu Button EXPORT add Menu Item HTML
  l_text = text-039.
  call method m_cl_menu_button_export->add_function
    exporting
      fcode = mc_fc_html
      text  = l_text.                  "HTML-Download
*... Menu Button EXPORT add Menu Item URL COPY TO CLIPBOARD
  l_text = text-040.
  call method m_cl_menu_button_export->add_function
    exporting
      fcode = mc_fc_url_copy_to_clipboard
      text  = l_text.                  "Copy URL to Clipboard

*... Toolbar Button Export XXL
  clear ls_toolbar.
  ls_toolbar-function    = mc_fc_call_xxl.
  ls_toolbar-quickinfo   = text-032.        "Tabellenkalkulation.
  ls_toolbar-icon        = icon_export.
  ls_toolbar-disabled    = space.
  append ls_toolbar to mt_toolbar.

*... Toolbar Button Export WORD
  if cl_alv_check_third_party=>is_supported( if_alv_z=>c_frontend-word ) = abap_true.
    clear ls_toolbar.
    ls_toolbar-function    = mc_fc_word_processor.
    ls_toolbar-quickinfo   = text-029.        "Textverarbeitung.
    ls_toolbar-icon        = icon_export.
    ls_toolbar-disabled    = space.
    append ls_toolbar to mt_toolbar.
  endif.

*... Toolbar Button Export PC File
  clear ls_toolbar.
  ls_toolbar-function    = mc_fc_pc_file.
  ls_toolbar-quickinfo   = text-030.        "Lokale Datei.
  ls_toolbar-icon        = icon_export.
  ls_toolbar-disabled    = space.
  append ls_toolbar to mt_toolbar.

*... Toolbar Button Export Send
  clear ls_toolbar.
  ls_toolbar-function    = mc_fc_send.
  ls_toolbar-quickinfo   = text-031.        "Senden.
  ls_toolbar-icon        = icon_export.
  ls_toolbar-disabled    = space.
  append ls_toolbar to mt_toolbar.

*... Toolbar Button Export Office
  clear ls_toolbar.
  ls_toolbar-function    = mc_fc_to_office.
  ls_toolbar-quickinfo   = text-033.        "Office.
  ls_toolbar-icon        = icon_export.
  ls_toolbar-disabled    = space.
  append ls_toolbar to mt_toolbar.

*... Toolbar Button Export ABC-Analysis
  clear ls_toolbar.
  ls_toolbar-function    = mc_fc_call_abc.
  ls_toolbar-quickinfo   = text-038.        "ABC-Analyse.
  ls_toolbar-icon        = icon_export.
  ls_toolbar-disabled    = space.
  append ls_toolbar to mt_toolbar.

*... Toolbar Button Export Extended
  clear ls_toolbar.
  ls_toolbar-function    = mc_fc_call_xint.
  ls_toolbar-quickinfo   = text-155.        "Erweiterte Ablage.
  ls_toolbar-icon        = icon_export.
  ls_toolbar-disabled    = space.
  append ls_toolbar to mt_toolbar.

**... Toolbar Button Export Crystal Report File Export
*  boolean = cl_alv_check_third_party=>is_active(
*                 cl_alv_bds=>mc_crystal_frontend ).
*  if boolean eq abap_true.
*    clear ls_toolbar.
*    ls_toolbar-function    = mc_fc_expcrdesig.
*    ls_toolbar-quickinfo   = text-153.        "Crystal Designer Launch.
*    ls_toolbar-icon        = icon_export.
*    ls_toolbar-disabled    = space.
*    append ls_toolbar to mt_toolbar.
*
**  ... Toolbar Button Export
*    clear ls_toolbar.
*    ls_toolbar-function    = mc_fc_expcrtempl.
*    ls_toolbar-quickinfo   = text-154.        "Crystal Report File Export.
*    ls_toolbar-icon        = icon_export.
*    ls_toolbar-disabled    = space.
*    append ls_toolbar to mt_toolbar.
*
**  ... Toolbar Button Export Crystal-Batch
*    clear ls_toolbar.
*    ls_toolbar-function    = mc_fc_call_crbatch.
*    ls_toolbar-quickinfo   = text-156.        "Crystal-Batch.
*    ls_toolbar-icon        = icon_export.
*    ls_toolbar-disabled    = space.
*    append ls_toolbar to mt_toolbar.
*  endif.

*<<< Y7AK098507
**... Toolbar Button Export XML
*  clear ls_toolbar.
*  ls_toolbar-function    = mc_fc_call_xml_export.
*  ls_toolbar-quickinfo   = text-034.        "HTML-Download.
*  ls_toolbar-icon        = icon_export.
*  ls_toolbar-disabled    = space.
*  append ls_toolbar to mt_toolbar.
*>>> Y7AK098507

*... Toolbar Button Export HTML-Download
  clear ls_toolbar.
  ls_toolbar-function    = mc_fc_html.
  ls_toolbar-quickinfo   = text-039.        "HTML-Download.
  ls_toolbar-icon        = icon_export.
  ls_toolbar-disabled    = space.
  append ls_toolbar to mt_toolbar.

*... Toolbar Button Export Copy URL to Clipboard
  clear ls_toolbar.
  ls_toolbar-function    = mc_fc_url_copy_to_clipboard.
  ls_toolbar-quickinfo   = text-040.        "Copy URL to Clipboard.
  ls_toolbar-icon        = icon_export.
  ls_toolbar-disabled    = space.
  append ls_toolbar to mt_toolbar.
*--- Menu Button EXPORT ----------------------------------- END --------

*--- Menu Button VARIANT -------------------------------- BEGIN --------
  clear ls_toolbar.
  ls_toolbar-function    = mc_mb_variant.
  ls_toolbar-quickinfo   = text-012.   "select variant
  ls_toolbar-icon        = icon_alv_variant_choose.
  ls_toolbar-disabled    = space.
  ls_toolbar-butn_type   = 1.
  append ls_toolbar to mt_toolbar.
*... Menu Button VARIANT add Menu Item LOAD VARIANT
  l_text = text-012.
  call method m_cl_menu_button_variant->add_function
    exporting
      fcode = mc_fc_load_variant
      text  = l_text.                 "Auswhlen
*... Menu Button VARIANT add Menu Item CURRENT VARIANT (CHANGE)
  l_text = text-015.
  call method m_cl_menu_button_variant->add_function
    exporting
      fcode = mc_fc_current_variant
      text  = l_text.                 "ndern
*... Menu Button VARIANT add Menu Item SAVE VARIANT
  l_text = text-011.
  call method m_cl_menu_button_variant->add_function
    exporting
      fcode = mc_fc_save_variant
      text  = l_text.                 "Sichern
*... Menu Button VARIANT add Menu Item MAINTAIN VARIANT
  l_text = text-013.
  call method m_cl_menu_button_variant->add_function
    exporting
      fcode = mc_fc_maintain_variant
      text  = l_text.                 "Verwalten
*... Menu Button VARIANT add Menu Item MAINTAIN VARIANT
*  call method m_cl_menu_button_variant->add_function
*              exporting fcode   = mc_fc_variant_admin
*                        text    = text-013.                 "Verwalten
*

*... Toolbar Button LOAD VARIANT
  clear ls_toolbar.
  ls_toolbar-function    = mc_fc_load_variant.
  ls_toolbar-quickinfo   = text-012.                 "Auswhlen
  ls_toolbar-icon        = icon_alv_variant_choose.
  ls_toolbar-disabled    = space.
  append ls_toolbar to mt_toolbar.

*... Toolbar Button CURRENT VARIANT (CHANGE)
  clear ls_toolbar.
  ls_toolbar-function    = mc_fc_current_variant.
  ls_toolbar-quickinfo   = text-015.                 "ndern
  ls_toolbar-icon        = icon_alv_variants.
  ls_toolbar-disabled    = space.
  append ls_toolbar to mt_toolbar.

*... Toolbar Button SAVE VARIANT
  clear ls_toolbar.
  ls_toolbar-function    = mc_fc_save_variant.
  ls_toolbar-quickinfo   = text-011.                 "Sichern
  ls_toolbar-icon        = icon_alv_variant_save.
  ls_toolbar-disabled    = space.
  append ls_toolbar to mt_toolbar.

*... Toolbar Button MAINTAIN VARIANT
  clear ls_toolbar.
  ls_toolbar-function    = mc_fc_maintain_variant.
  ls_toolbar-quickinfo   = text-013.                 "Verwalten
  ls_toolbar-icon        = icon_alv_variants.
  ls_toolbar-disabled    = space.
  append ls_toolbar to mt_toolbar.
*--- Menu Button VARIANT ---------------------------------- END --------

*... Toolbar Separator
  clear ls_toolbar.
  ls_toolbar-function    ='&&SEP06'.
  ls_toolbar-butn_type   = 3.
  append ls_toolbar to mt_toolbar.

*--- Menu Button REPREP --------------------------------- BEGIN --------
  clear ls_toolbar.
  ls_toolbar-function    = mc_fc_reprep.
  ls_toolbar-quickinfo   = text-020.   "Berichts-Berichts-Schnittstelle
  ls_toolbar-icon        = icon_table_settings.
  ls_toolbar-butn_type   = 1.
  append ls_toolbar to mt_toolbar.
*... Menu Button REPREP add Menu Item CALL REPORT
  l_text = text-017.
  call method m_cl_menu_button_reprep->add_function
    exporting
      fcode = mc_fc_call_report
      text  = l_text. "Bericht aufrufen
*... Menu Button REPREP add Menu Item CALL CHAIN
  l_text = text-016.
  call method m_cl_menu_button_reprep->add_function
    exporting
      fcode = mc_fc_call_chain
      text  = l_text. "Aufrufkette
*... Menu Button REPREP add Menu Item CALL MORE
  l_text = text-018.
  call method m_cl_menu_button_reprep->add_function
    exporting
      fcode = mc_fc_call_more
      text  = l_text. "Weitere Berichte
*... Menu Button REPREP add Menu Item CALL MASTER DATA
  l_text = text-019.
  call method m_cl_menu_button_reprep->add_function
    exporting
      fcode = mc_fc_call_master_data
      text  = l_text. "Stammdatenanzeige

*... Toolbar Button CALL REPORT
  clear ls_toolbar.
  ls_toolbar-function    = mc_fc_call_report.
  ls_toolbar-quickinfo   = text-017. "Bericht aufrufen
  ls_toolbar-icon        = icon_table_settings.
  ls_toolbar-disabled    = space.
  append ls_toolbar to mt_toolbar.

*... Toolbar Button CALL MORE
  clear ls_toolbar.
  ls_toolbar-function    = mc_fc_call_more.
  ls_toolbar-quickinfo   = text-018. "Weitere Berichte
  ls_toolbar-icon        = icon_table_settings.
  ls_toolbar-disabled    = space.
  append ls_toolbar to mt_toolbar.

*... Toolbar Button CALL CHAIN
  clear ls_toolbar.
  ls_toolbar-function    = mc_fc_call_chain.
  ls_toolbar-quickinfo   = text-016. "Aufrufkette
  ls_toolbar-icon        = icon_table_settings.
  ls_toolbar-disabled    = space.
  append ls_toolbar to mt_toolbar.

*... Toolbar Button CALL MASTER DATA
  clear ls_toolbar.
  ls_toolbar-function    = mc_fc_call_master_data.
  ls_toolbar-quickinfo   = text-019.   "Stammdatenanzeige
  ls_toolbar-icon        = icon_table_settings.
  ls_toolbar-disabled    = space.
  append ls_toolbar to mt_toolbar.
*--- Menu Button REPREP ----------------------------------- END --------

*... Toolbar Button GRAPH
  clear ls_toolbar.
  ls_toolbar-function    = mc_fc_graph.
  ls_toolbar-icon        = icon_graphics.
  ls_toolbar-quickinfo   = text-067.
  ls_toolbar-disabled    = space.
  append ls_toolbar to mt_toolbar.

*... Toolbar Separator
  clear ls_toolbar.
  ls_toolbar-function    = '&&SEP07'.
  ls_toolbar-butn_type   = 3.
  append ls_toolbar to mt_toolbar.

*... Toolbar Button INFORMATION
  clear ls_toolbar.
  ls_toolbar-function    = mc_fc_info.
  ls_toolbar-quickinfo   = text-064.
  ls_toolbar-icon        = icon_information.
  ls_toolbar-disabled    = space.
  append ls_toolbar to mt_toolbar.

  if www_active eq 'X'.
    data: l_sos type char10.
    get parameter id 'ALV_WEBGUI_SOS' field l_sos.
    if sy-subrc eq 0.
*... Toolbar Separator
      clear ls_toolbar.
      ls_toolbar-function    = '&&SEP07'.
      ls_toolbar-butn_type   = 3.
      append ls_toolbar to mt_toolbar.

*... Toolbar Button SOS
      clear ls_toolbar.
      ls_toolbar-function    = mc_fc_sos.
      ls_toolbar-quickinfo   = text-070.
      ls_toolbar-icon        = icon_personal_help.
      ls_toolbar-disabled    = space.
      append ls_toolbar to mt_toolbar.
    endif.
  endif.

  if r_salv_adapter is bound.
    data: lr_salv_grid_adapter type ref to cl_salv_grid_adapter.
    data: lr_events type ref to if_salv_events_adapter.
    try.
        lr_salv_grid_adapter ?= r_salv_adapter.
        if lr_salv_grid_adapter->if_salv_adapter~type eq
                       if_salv_adapter=>c_adapter_type_grid.
*          call method lr_salv_grid_adapter->fill_toolbar
*            changing
*              t_toolbar           = mt_toolbar
*              t_toolbar_excluding = mt_excluding_toolbar.
*
          lr_events ?= r_salv_adapter.
          call method lr_events->raise_build_uifunction
            changing
              t_toolbar           = mt_toolbar
              t_toolbar_excluding = mt_excluding_toolbar.

        endif.
      catch cx_sy_move_cast_error.
    endtry.
  endif.

  call method me->toolbar_init.

*>>AT
  salv_at_toolbar( ).
*<<AT
endmethod.                    "


method toolbar_init .

  data: l_view               type sy-ucomm,
        l_gui_type           type i,
        l_eliminated_items   type i,
        l_eliminated_item    type sy-ucomm,
        l_function           type ui_func,
        l_insert_row_allowed type char10,
        l_getid              type char80,
        lt_excluding_toolbar type ui_functions.

  call method get_gui_type
    receiving
      gui_type = l_gui_type.

*... initialization
  delete adjacent duplicates from mt_excluding_toolbar.
  lt_excluding_toolbar = mt_excluding_toolbar.

*... Loesche Doppeleintraege
  delete adjacent duplicates from mt_toolbar comparing function.

*... eliminate irrelevant functions for WebGUI
  if l_gui_type eq m_gui_type_html or
     l_gui_type eq m_gui_type_its_int.          "Y7AK054985
    append mc_fc_loc_cut to lt_excluding_toolbar.
    append mc_fc_loc_copy to lt_excluding_toolbar.
    append mc_mb_paste to lt_excluding_toolbar.
    append mc_fc_loc_undo to lt_excluding_toolbar.

    get parameter id 'SLI' field l_getid.
    if sy-subrc eq 0.
      m_third_party_web = l_getid.
    else.
      clear m_third_party_web.
    endif.
    if m_third_party_web na 'WELC'.
      append mc_fc_view_grid to lt_excluding_toolbar.
      append mc_fc_view_excel to lt_excluding_toolbar.
      append mc_fc_view_lotus to lt_excluding_toolbar.
      append mc_fc_view_crystal to lt_excluding_toolbar.

*      append mc_fc_call_xxl to lt_excluding_toolbar.
      append mc_fc_word_processor to lt_excluding_toolbar.
*      append mc_fc_pc_file to lt_excluding_toolbar.    "Y7AK010026
*      append mc_fc_send to lt_excluding_toolbar.            "Y7AK091306
*      append mc_fc_to_office to lt_excluding_toolbar.        "Y7AK091306
*      append mc_fc_call_abc to lt_excluding_toolbar.        "Y7AK091306
      append mc_fc_call_xint to lt_excluding_toolbar.
      append mc_fc_expcrdesig to lt_excluding_toolbar.
      append mc_fc_expcrtempl to lt_excluding_toolbar.
      append mc_fc_call_crbatch to lt_excluding_toolbar.
*    append mc_fc_call_xml_export to lt_excluding_toolbar.
*      append mc_fc_html to lt_excluding_toolbar.
      append mc_fc_url_copy_to_clipboard to lt_excluding_toolbar.
    else.
      if m_third_party_web na 'W'.
        append mc_fc_word_processor to lt_excluding_toolbar.
      endif.
      if m_third_party_web na 'E'.
        append mc_fc_view_excel to lt_excluding_toolbar.
        append mc_fc_call_xxl to lt_excluding_toolbar.
      endif.
      if m_third_party_web na 'L'.
        append mc_fc_view_lotus to lt_excluding_toolbar.
      endif.
      if m_third_party_web na 'C'.
        append mc_fc_view_crystal to lt_excluding_toolbar.
        append mc_fc_expcrdesig to lt_excluding_toolbar.
        append mc_fc_expcrtempl to lt_excluding_toolbar.
        append mc_fc_call_crbatch to lt_excluding_toolbar.
      endif.
    endif.
*    append mc_fc_graph to lt_excluding_toolbar.             "Y7AK091306
*    append mc_fc_info to lt_excluding_toolbar.
  endif.

*... eliminate irrelevant functions for JavaGUI
  if l_gui_type eq m_gui_type_java.
    append mc_fc_view_grid to lt_excluding_toolbar.
    append mc_fc_view_excel to lt_excluding_toolbar.
    append mc_fc_view_lotus to lt_excluding_toolbar.
    append mc_fc_view_crystal to lt_excluding_toolbar.
*    append mc_fc_call_xxl to lt_excluding_toolbar.
    append mc_fc_word_processor to lt_excluding_toolbar.
    append mc_fc_expcrdesig to lt_excluding_toolbar.
    append mc_fc_expcrtempl to lt_excluding_toolbar.
    append mc_fc_call_crbatch to lt_excluding_toolbar.
    append mc_fc_to_office to lt_excluding_toolbar.
  endif.

*... eliminate all functions for simplified suite   YI6K001043
*  if CL_COS_UTILITIES=>IS_SIMPLIFIED_SUITE( ) eq abap_true.     YI3K249604
* adapt toolbar to different cloud systems -> constructor S = Cloud, O = On premise
  if ( m_sys_type eq 'S' and l_gui_type eq M_GUI_TYPE_HTML ) or
     ( m_sys_type eq 'S' and l_gui_type eq M_GUI_TYPE_JAVA ) or
     ( m_sys_type eq 'S' and l_gui_type eq M_GUI_TYPE_ITS_INT ).   "Y5HK021943
    append mc_fc_to_office to lt_excluding_toolbar.      "send mail to office &ML
    append MC_FC_CALL_XINT to lt_excluding_toolbar.      "Query Anschluss
    append MC_FC_PRINT_BACK to lt_excluding_toolbar.     "Druck im Webgui inaktiv
    append MC_FC_PRINT_PREV to lt_excluding_toolbar.     "Druckvorschau
    append MC_FC_SEND to lt_excluding_toolbar.           "Send
    append MC_FC_URL_COPY_TO_CLIPBOARD to lt_excluding_toolbar. "copy URL to clipboard
    append MC_FC_CALL_XML_EXPORT to lt_excluding_toolbar.  "alter XML export
*    append MC_FC_HTML to lt_excluding_toolbar.            "HTML download
    append MC_FC_GRAPH to lt_excluding_toolbar.           "Graphik
  elseif m_sys_type eq 'S' and l_gui_type eq M_GUI_TYPE_WINDOWS.  "print allowed
    append mc_fc_to_office to lt_excluding_toolbar.      "send mail to office &ML
    append MC_FC_CALL_XINT to lt_excluding_toolbar.      "Query Anschluss
    append MC_FC_SEND to lt_excluding_toolbar.           "Send
    append MC_FC_URL_COPY_TO_CLIPBOARD to lt_excluding_toolbar. "copy URL to clipboard
    append MC_FC_CALL_XML_EXPORT to lt_excluding_toolbar.  "alter XML export
    append MC_FC_GRAPH to lt_excluding_toolbar.           "Graphik
  elseif m_sys_type eq 'O'.                              "print, Excel Inplace, Word active in Windows-GUI
    append MC_FC_CALL_XML_EXPORT to lt_excluding_toolbar.  "alter XML export
*    append MC_FC_HTML to lt_excluding_toolbar.            "HTML download
    append MC_FC_GRAPH to lt_excluding_toolbar.           "Graphik
  endif.

*... eliminate standard edit row functions if requested
  if m_cl_variant->ms_layout-no_rowins eq 'X'.
    append mc_fc_loc_append_row to lt_excluding_toolbar.
    append mc_fc_loc_insert_row to lt_excluding_toolbar.
    append mc_fc_loc_delete_row to lt_excluding_toolbar.
    append mc_fc_loc_copy_row to lt_excluding_toolbar.
  endif.

*... eliminate edit functions if Grid not editable
  if is_ready_for_input( ) eq 0.
    append mc_fg_edit to lt_excluding_toolbar.
  else.
*... eliminate irrelevant functions for webgui
*    if l_gui_type eq m_gui_type_html or
*       l_gui_type eq m_gui_type_its_int.                "Y7AK091306
*      append mc_mb_sum to lt_excluding_toolbar.
*      append mc_mb_subtot to lt_excluding_toolbar.
*    endif.
  endif.

*... eliminiate check function
  if not m_cell_edit is initial.
    append mc_fc_check to lt_excluding_toolbar.
  endif.

*... eliminiate irrelevant functions for view
  if not me->m_next_view is initial.
    l_view = me->m_next_view.
  else.
    l_view = me->m_view.
  endif.
  case l_view.
    when mc_fc_view_grid.
    when mc_fc_view_excel.
      append mc_fg_edit to lt_excluding_toolbar.
      append mc_fc_detail to lt_excluding_toolbar.
      append mc_fc_call_xint to lt_excluding_toolbar.
      append mc_fc_find to lt_excluding_toolbar.
      append mc_fc_find_more to lt_excluding_toolbar.
      append mc_fc_call_xxl to lt_excluding_toolbar.
    when mc_fc_view_lotus.
      append mc_fg_edit to lt_excluding_toolbar.
      append mc_fc_detail to lt_excluding_toolbar.
      append mc_fc_find to lt_excluding_toolbar.
      append mc_fc_find_more to lt_excluding_toolbar.
      append mc_fc_call_xint to lt_excluding_toolbar.
    when mc_fc_view_crystal.
      append mc_fg_edit to lt_excluding_toolbar.
      append mc_fc_detail to lt_excluding_toolbar.
      append mc_fc_find to lt_excluding_toolbar.
      append mc_fc_find_more to lt_excluding_toolbar.
      append mc_fg_sort to lt_excluding_toolbar.
      append mc_mb_sum to lt_excluding_toolbar.
      append mc_fc_call_xint to lt_excluding_toolbar.
      append mc_fc_expcrtempl to lt_excluding_toolbar.
      append mc_fc_expcrdesig to lt_excluding_toolbar.
      append mc_fc_print_back to lt_excluding_toolbar.
      append mc_fc_call_crbatch to lt_excluding_toolbar.
      append mc_fc_print_prev to lt_excluding_toolbar.
      append mc_fc_graph to lt_excluding_toolbar.
  endcase.

*... eliminate Crystal functions if Crystal not active
  data: boolean type sap_bool.
  boolean = cl_alv_check_third_party=>is_supported(
                 cl_alv_bds=>mc_crystal_frontend ).
  if boolean eq abap_false.
    append mc_fc_view_crystal to lt_excluding_toolbar.
  endif.
  append mc_fc_expcrdesig   to lt_excluding_toolbar.
  append mc_fc_expcrtempl   to lt_excluding_toolbar.
  append mc_fc_call_crbatch to lt_excluding_toolbar.

*... delete Edit Function Group
  read table lt_excluding_toolbar with key table_line = mc_fg_edit
             transporting no fields.
  if sy-subrc eq 0.
    append mc_fc_check to lt_excluding_toolbar.
    append mc_fc_refresh to lt_excluding_toolbar.
    append mc_fc_loc_cut to lt_excluding_toolbar.
    append mc_fc_loc_copy to lt_excluding_toolbar.
    append mc_mb_paste to lt_excluding_toolbar.
    append mc_fc_loc_undo to lt_excluding_toolbar.
    append mc_fc_loc_append_row to lt_excluding_toolbar.
    append mc_fc_loc_insert_row to lt_excluding_toolbar.
    append mc_fc_loc_delete_row to lt_excluding_toolbar.
    append mc_fc_loc_copy_row to lt_excluding_toolbar.
  endif.

*... delete FIND
  read table lt_excluding_toolbar with key table_line = mc_fc_find
             transporting no fields.
  if sy-subrc eq 0.
    append mc_fc_find_more to lt_excluding_toolbar.
  endif.

*... delete Sort Function Group
  read table lt_excluding_toolbar with key table_line = mc_fg_sort
             transporting no fields.
  if sy-subrc eq 0.
    append mc_fc_sort_asc to lt_excluding_toolbar.
    append mc_fc_sort_dsc to lt_excluding_toolbar.
  endif.

*... Variant Functions
  if m_cl_variant->ms_variant-report is initial.
*...... eliminate Variant functionality except for change variant
*       if no report is given
    append mc_fc_save_variant to lt_excluding_toolbar.
    append mc_fc_load_variant to lt_excluding_toolbar.
    append mc_fc_maintain_variant to lt_excluding_toolbar.
    append mc_fc_variant_admin to lt_excluding_toolbar.
  elseif m_cl_variant->m_variant_save is initial.
*...... Lösche MenuItems Variante Speichern und Varianten Verwalten
*       wenn das Sichern Funktionalität nicht vorhanden sein soll
    append mc_fc_save_variant to lt_excluding_toolbar.
    append mc_fc_maintain_variant to lt_excluding_toolbar.
    append mc_fc_variant_admin to lt_excluding_toolbar.
  endif.
*...... if Menu Button Variant has been excluded then exclude
*       seperatly listes functions too
  read table lt_excluding_toolbar with key table_line = mc_mb_variant
             transporting no fields.
  if sy-subrc eq 0.
    append mc_fc_save_variant to lt_excluding_toolbar.
    append mc_fc_load_variant to lt_excluding_toolbar.
    append mc_fc_maintain_variant to lt_excluding_toolbar.
    append mc_fc_variant_admin to lt_excluding_toolbar.
    append mc_fc_current_variant to lt_excluding_toolbar.
  endif.
*...... if Menu Item Current Variant has been excluded then exclude
*       seperatly listes functions too
  read table lt_excluding_toolbar
             with key table_line = mc_fc_current_variant
             transporting no fields.
  if sy-subrc eq 0.
    append mc_fc_save_variant to lt_excluding_toolbar.
    append mc_fc_load_variant to lt_excluding_toolbar.
    append mc_fc_maintain_variant to lt_excluding_toolbar.
    append mc_fc_variant_admin to lt_excluding_toolbar.
    append mc_fc_current_variant to lt_excluding_toolbar.
  endif.
*...... if only 1 Variant Item is requested then eliminate MenuButtton
*       otherwise eliminate seperatly listed functions
  l_eliminated_items = 0.
  read table lt_excluding_toolbar
             with key table_line = mc_fc_current_variant
             transporting no fields.
  if sy-subrc eq 0.
    add 1 to l_eliminated_items.
  endif.
  read table lt_excluding_toolbar
             with key table_line = mc_fc_save_variant
             transporting no fields.
  if sy-subrc eq 0.
    add 1 to l_eliminated_items.
  endif.
  read table lt_excluding_toolbar
             with key table_line = mc_fc_load_variant
             transporting no fields.
  if sy-subrc eq 0.
    add 1 to l_eliminated_items.
  endif.
  read table lt_excluding_toolbar
             with key table_line = mc_fc_maintain_variant
             transporting no fields.
  if sy-subrc eq 0.
    add 1 to l_eliminated_items.
  endif.
  if l_eliminated_items ge 3.
    append mc_mb_variant to lt_excluding_toolbar.
  else.
    delete mt_toolbar where ( function eq mc_fc_current_variant
                         or function eq mc_fc_load_variant
                         or function eq mc_fc_save_variant
                         or function eq mc_fc_maintain_variant )
                        and butn_type eq space.
  endif.

*... Paste Functions
*...... if Menu Button Paste has been excluded then exclude
*       seperatly listes functions too
  read table lt_excluding_toolbar with key table_line = mc_mb_paste
             transporting no fields.
  if sy-subrc eq 0.
    append mc_fc_loc_paste to lt_excluding_toolbar.
    append mc_fc_loc_paste_new_row to lt_excluding_toolbar.
  endif.
*...... if only 1 Paste Item is requested then eliminate MenuButtton
*       otherwise eliminate seperatly listed functions
  l_eliminated_items = 0.
  read table lt_excluding_toolbar with key table_line = mc_fc_loc_paste
             transporting no fields.
  if sy-subrc eq 0.
    add 1 to l_eliminated_items.
  endif.
  read table lt_excluding_toolbar
             with key table_line = mc_fc_loc_paste_new_row
             transporting no fields.
  if sy-subrc eq 0.
    add 1 to l_eliminated_items.
  endif.
  if l_eliminated_items ge 1.
    append mc_mb_paste to lt_excluding_toolbar.
  else.
    delete mt_toolbar where ( function eq mc_fc_loc_paste
                         or function eq mc_fc_loc_paste_new_row )
                        and butn_type eq space.
  endif.

*... Print Functions
  read table lt_excluding_toolbar with key table_line = mc_fc_print
             transporting no fields.
  if sy-subrc eq 0.
    append mc_fc_print_back to lt_excluding_toolbar.
    append mc_fc_call_crbatch to lt_excluding_toolbar.
    append mc_fc_print_prev to lt_excluding_toolbar.
  endif.
  read table lt_excluding_toolbar with key table_line = mc_fc_print_back
             transporting no fields.
  if sy-subrc eq 0.
    append mc_fc_print to lt_excluding_toolbar.
    append mc_fc_call_crbatch to lt_excluding_toolbar.
  endif.
*>>>new API
*  if r_salv_adapter is not bound.
*    if m_very_first eq 'X'.
*      read table lt_excluding_toolbar
*                 with key table_line = mc_fc_call_crbatch
*                 transporting no fields.
*      if sy-subrc eq 0.
*        append mc_fc_print to lt_excluding_toolbar.
*        append mc_fc_print_back to lt_excluding_toolbar.
*      endif.
*    endif.
*  endif.
*<<<new API

*... Sum Functions
*...... if layout allows no sum then eliminate sum function
*       from toolbar
  if m_cl_variant->ms_layout-no_totline = 'X'.
    append mc_mb_sum to lt_excluding_toolbar.
  endif.
*...... if no field allows a sum then eliminate sum function
*       from toolbar
*  read table m_cl_variant->mt_fieldcatalog transporting no fields
*             with key no_sum = space
*                      tech   = space.
*  if sy-subrc ne 0.
*    append mc_mb_sum to lt_excluding_toolbar.
*  endif.
*...... if Count Functionality is not requested then eliminate this
*       function from the Menu Button
  if m_cl_variant->ms_layout-countfname eq space.
    append mc_fc_count to lt_excluding_toolbar.
  endif.
*...... if only 1 Sum Item is requested then eliminate MenuButtton
*       otherwise eliminate seperatly listed functions
  clear l_eliminated_items.
  read table lt_excluding_toolbar with key table_line = mc_fc_sum
        transporting no fields.
  if sy-subrc eq 0.
    add 1 to l_eliminated_items.
  endif.
  read table lt_excluding_toolbar with key table_line = mc_fc_average
        transporting no fields.
  if sy-subrc eq 0.
    add 1 to l_eliminated_items.
  endif.
  read table lt_excluding_toolbar with key table_line = mc_fc_minimum
        transporting no fields.
  if sy-subrc eq 0.
    add 1 to l_eliminated_items.
  endif.
  read table lt_excluding_toolbar with key table_line = mc_fc_maximum
        transporting no fields.
  if sy-subrc eq 0.
    add 1 to l_eliminated_items.
  endif.
  read table lt_excluding_toolbar with key table_line = mc_fc_count
        transporting no fields.
  if sy-subrc eq 0.
    add 1 to l_eliminated_items.
  endif.
  if l_eliminated_items ge 4.
    append mc_mb_sum to lt_excluding_toolbar.
  else.
    delete mt_toolbar where ( function eq mc_fc_sum
                         or function eq mc_fc_average
                         or function eq mc_fc_minimum
                         or function eq mc_fc_maximum
                         or function eq mc_fc_count )
                        and butn_type eq space.
  endif.

*... Subtotal Functions
*...... if Menu Button SUM is not available then the Menu Button
*       Subtotal makes no sense either
  read table lt_excluding_toolbar with key table_line = mc_mb_sum
             transporting no fields.
  if sy-subrc eq 0.
    append mc_mb_subtot to lt_excluding_toolbar.
  endif.
*...... if Sum Functions are not requested then exclude Menu
  if l_eliminated_items ge 5.
    append mc_mb_subtot to lt_excluding_toolbar.
  endif.
*...... if Subtotal Function is not requested then exclude Menu
  read table lt_excluding_toolbar with key table_line = mc_fc_subtot
             transporting no fields.
  if sy-subrc eq 0.
    append mc_mb_subtot to lt_excluding_toolbar.
  endif.
*...... if Menu Button Subtotal has been excluded then exclude
*       seperatly listes functions too
  read table lt_excluding_toolbar with key table_line = mc_mb_subtot
             transporting no fields.
  if sy-subrc eq 0.
    append mc_fc_subtot to lt_excluding_toolbar.
  endif.
*...... if Menu Button Item AUFRISS has been excluded then the
*       Menu Button is not needed, instead seperatly listet function
  read table lt_excluding_toolbar with key table_line = mc_fc_auf
             transporting no fields.
  if sy-subrc eq 0.
    append mc_mb_subtot to lt_excluding_toolbar.
  else.
    delete mt_toolbar where function eq mc_fc_subtot
                        and butn_type eq space.
  endif.

*... Filter Functions
  read table lt_excluding_toolbar with key table_line = mc_fc_filter
             transporting no fields.
  if sy-subrc eq 0.
    append mc_mb_filter to lt_excluding_toolbar.
  endif.
*...... if Menu Button Filter has been excluded then exclude
*       seperatly listes functions too
  read table lt_excluding_toolbar with key table_line = mc_mb_filter
             transporting no fields.
  if sy-subrc eq 0.
    append mc_fc_filter to lt_excluding_toolbar.
  endif.
*...... if Menu Button Item DELETE FILTER is not requested then the
*       Menu Button is not needed, instead seperatly listet function
  read table lt_excluding_toolbar
             with key table_line = mc_fc_delete_filter
             transporting no fields.
  if sy-subrc eq 0.
    append mc_mb_filter to lt_excluding_toolbar.
  else.
    delete mt_toolbar where function eq mc_fc_filter
                        and butn_type eq space.
  endif.

*... View Functions
  read table lt_excluding_toolbar with key table_line = mc_fc_views
             transporting no fields.
  if sy-subrc eq 0.
    append mc_mb_view to lt_excluding_toolbar.
  endif.
  read table lt_excluding_toolbar with key table_line = mc_mb_view
             transporting no fields.
  if sy-subrc eq 0.
    append mc_fc_view_grid    to lt_excluding_toolbar.
    append mc_fc_view_excel   to lt_excluding_toolbar.
    append mc_fc_view_lotus   to lt_excluding_toolbar.
    append mc_fc_view_crystal to lt_excluding_toolbar.
    append mc_fc_print_prev   to lt_excluding_toolbar.
  else.
    data: l_exclude_count type i.
    l_eliminated_items = 0.
    read table lt_excluding_toolbar transporting no fields
               with key table_line = mc_fc_view_grid.
    if sy-subrc eq 0.
      add 1 to l_eliminated_items.
    endif.
    read table lt_excluding_toolbar transporting no fields
               with key table_line = mc_fc_view_excel.
    if sy-subrc eq 0.
      add 1 to l_eliminated_items.
      add 1 to l_exclude_count.
    endif.
    read table lt_excluding_toolbar transporting no fields
               with key table_line = mc_fc_view_lotus.
    if sy-subrc eq 0.
      add 1 to l_eliminated_items.
      add 1 to l_exclude_count.
    endif.
    read table lt_excluding_toolbar transporting no fields
               with key table_line = mc_fc_view_crystal.
    if sy-subrc eq 0.
      add 1 to l_eliminated_items.
      add 1 to l_exclude_count.
    endif.
    read table lt_excluding_toolbar transporting no fields
               with key table_line = mc_fc_print_prev.
    if sy-subrc eq 0.
      add 1 to l_eliminated_items.
    endif.
    if l_eliminated_items lt 5.
*      if l_exclude_count eq 3.
*        append mc_mb_view to lt_excluding_toolbar.
*      else.
        delete mt_toolbar where function eq mc_fc_print_prev
                             or function eq mc_fc_view_grid
                             or function eq mc_fc_view_excel
                             or function eq mc_fc_view_crystal
                             or function eq mc_fc_view_lotus
                            and butn_type eq space.
*      endif.
    endif.
  endif.

*... Export Functions
*...... if Menu Button Export has been excluded then exclude
*       seperatly listes functions too
  read table lt_excluding_toolbar with key table_line = mc_mb_export
             transporting no fields.
  if sy-subrc eq 0.
    append mc_fc_call_xxl to lt_excluding_toolbar.
    append mc_fc_word_processor to lt_excluding_toolbar.
    append mc_fc_pc_file to lt_excluding_toolbar.
    append mc_fc_send to lt_excluding_toolbar.
    append mc_fc_to_office to lt_excluding_toolbar.
    append mc_fc_call_abc to lt_excluding_toolbar.
    append mc_fc_call_xint to lt_excluding_toolbar.
    append mc_fc_expcrdesig to lt_excluding_toolbar.
    append mc_fc_expcrtempl to lt_excluding_toolbar.
    append mc_fc_call_crbatch to lt_excluding_toolbar.
    append mc_fc_call_xml_export to lt_excluding_toolbar.
    append mc_fc_html to lt_excluding_toolbar.
    append mc_fc_url_copy_to_clipboard to lt_excluding_toolbar.
  else.
* delete 'Copy to URL'; function in internal ITS obsolete (-> 6.20) Y7AK110251
    append mc_fc_url_copy_to_clipboard to lt_excluding_toolbar.
  endif.
*...... if only 1 Export Item is requested then eliminate MenuButtton
*       otherwise eliminate seperatly listed functions
  l_eliminated_items = 0.
  read table lt_excluding_toolbar
             with key table_line = mc_fc_call_xxl
             transporting no fields.
  if sy-subrc eq 0.
    add 1 to l_eliminated_items.
  endif.
  read table lt_excluding_toolbar
             with key table_line = mc_fc_word_processor
             transporting no fields.
  if sy-subrc eq 0.
    add 1 to l_eliminated_items.
  endif.
  read table lt_excluding_toolbar
             with key table_line = mc_fc_pc_file
             transporting no fields.
  if sy-subrc eq 0.
    add 1 to l_eliminated_items.
  endif.
  read table lt_excluding_toolbar
             with key table_line = mc_fc_send
             transporting no fields.
  if sy-subrc eq 0.
    add 1 to l_eliminated_items.
  endif.
  read table lt_excluding_toolbar
             with key table_line = mc_fc_to_office
             transporting no fields.
  if sy-subrc eq 0.
    add 1 to l_eliminated_items.
  endif.
  read table lt_excluding_toolbar
             with key table_line = mc_fc_call_abc
             transporting no fields.
  if sy-subrc eq 0.
    add 1 to l_eliminated_items.
  endif.
  read table lt_excluding_toolbar
             with key table_line = mc_fc_call_xint
             transporting no fields.
  if sy-subrc eq 0.
    add 1 to l_eliminated_items.
  endif.
  read table lt_excluding_toolbar
             with key table_line = mc_fc_expcrdesig
             transporting no fields.
  if sy-subrc eq 0.
    add 1 to l_eliminated_items.
  endif.
  read table lt_excluding_toolbar
             with key table_line = mc_fc_expcrtempl
             transporting no fields.
  if sy-subrc eq 0.
    add 1 to l_eliminated_items.
  endif.
  read table lt_excluding_toolbar
             with key table_line = mc_fc_call_crbatch
             transporting no fields.
  if sy-subrc eq 0.
    add 1 to l_eliminated_items.
  endif.
  data: l_class  type seoclsname,
        l_method type seoclsname,
        l_active type boolean.
  l_class  = 'CL_ALV_XSLT_TRANSFORM'.
  l_method = 'IS_XML_ACTIVE'.
  call method (l_class)=>(l_method)
    receiving
      r_active = l_active.
  read table lt_excluding_toolbar
             with key table_line = mc_fc_call_xml_export
             transporting no fields.
  if sy-subrc eq 0 or l_active ne 'X'.
    add 1 to l_eliminated_items.
  endif.
  read table lt_excluding_toolbar
             with key table_line = mc_fc_html
             transporting no fields.
  if sy-subrc eq 0.
    add 1 to l_eliminated_items.
  endif.
  read table lt_excluding_toolbar
             with key table_line = mc_fc_url_copy_to_clipboard
             transporting no fields.
  if sy-subrc eq 0.
    add 1 to l_eliminated_items.
  endif.
  if l_eliminated_items ge 12.
    append mc_mb_export to lt_excluding_toolbar.
  else.
    delete mt_toolbar where ( function eq mc_fc_call_xxl
                         or function eq mc_fc_word_processor
                         or function eq mc_fc_pc_file
                         or function eq mc_fc_send
                         or function eq mc_fc_to_office
    or function eq mc_fc_call_abc
      or function eq mc_fc_call_xint
      or function eq mc_fc_expcrdesig
      or function eq mc_fc_expcrtempl
      or function eq mc_fc_call_crbatch
      or function eq mc_fc_call_xml_export
      or function eq mc_fc_html
      or function eq mc_fc_url_copy_to_clipboard )
      and butn_type eq space.
  endif.
*...... Extended Export only if allowed
*       check if extended export has been activated in SQ09
*       when executing this functionality through ALV all activated
*       items should be displayed in the popup. These items are saved in
*       data table XINT_TAB
  data xint_number type int4.
  call function 'RSAQ_XINT_INITIALIZATION'
    importing
      function_number = xint_number.
  if ( xint_number eq 0 ).
    append mc_fc_call_xint to lt_excluding_toolbar.
  endif.

*... if deep structure the exclude export functions  "Y9CK054085
  data:
    lr_structdescr type ref to cl_abap_structdescr,
    lr_tabledescr type ref to cl_abap_tabledescr,
    l_deep_struc type abap_bool,
    lr_structdescr_c TYPE REF TO cl_abap_structdescr.   "Y5HK026613


  field-symbols:
    <lt_table> type standard table.

  assign mt_outtab->* to <lt_table>.
  if not sy-subrc is initial.
    message a534(0k).
  endif.

  lr_tabledescr ?= cl_abap_tabledescr=>describe_by_data( <lt_table> ).
  lr_structdescr ?= lr_tabledescr->get_table_line_type( ).
  if lr_structdescr->struct_kind eq
             cl_abap_structdescr=>structkind_nested.
*<<< Y5HK026613 check single components: nested structures in single components not supported
    DATA(lt_components) = lr_structdescr->get_components( ).
    LOOP AT lt_components INTO DATA(ls_component).
      IF ls_component-type->kind EQ cl_abap_typedescr=>kind_struct.  "1 level works "color-table kind = T!
         lr_structdescr_c ?= ls_component-type.
        if lr_structdescr_c->struct_kind eq cl_abap_structdescr=>structkind_nested.
          l_deep_struc = abap_true.
          EXIT.
        ELSE.
          l_deep_struc = abap_false.
        ENDIF.
      ENDIF.
    ENDLOOP.
  ENDIF.
*<<< Y5HK026613 check deep structure of single components

  if l_deep_struc eq abap_true.  "Y5HK026613
    append mc_fc_call_abc to lt_excluding_toolbar.
    append mc_fc_call_xxl to lt_excluding_toolbar.
    append mc_fc_word_processor to lt_excluding_toolbar.
    append mc_fc_call_xint to lt_excluding_toolbar.
  endif.

*... RepRep Functions
  read table mt_reprep_fccls with key table_line = '9'
             transporting no fields.
  if sy-subrc ne 0.
    append mc_fc_call_report to lt_excluding_toolbar.
  endif.
  read table mt_reprep_fccls with key table_line = '3'
             transporting no fields.
  if sy-subrc ne 0.
    append mc_fc_call_more to lt_excluding_toolbar.
  endif.
  read table mt_reprep_fccls with key table_line = '2'
             transporting no fields.
  if sy-subrc ne 0.
    append mc_fc_call_master_data to lt_excluding_toolbar.
  endif.
  if m_reprep_called is initial.
    append mc_fc_call_chain to lt_excluding_toolbar.
  endif.
  l_eliminated_items = 0.
  read table lt_excluding_toolbar
             with key table_line = mc_fc_call_report
             transporting no fields.
  if sy-subrc eq 0.
    add 1 to l_eliminated_items.
  endif.
  read table lt_excluding_toolbar
             with key table_line = mc_fc_call_more
             transporting no fields.
  if sy-subrc eq 0.
    add 1 to l_eliminated_items.
  endif.
  read table lt_excluding_toolbar
             with key table_line = mc_fc_call_chain
             transporting no fields.
  if sy-subrc eq 0.
    add 1 to l_eliminated_items.
  endif.
  read table lt_excluding_toolbar
             with key table_line = mc_fc_call_master_data
             transporting no fields.
  if sy-subrc eq 0.
    add 1 to l_eliminated_items.
  endif.
  if l_eliminated_items ge 3.
    append mc_fc_reprep to lt_excluding_toolbar.
  else.
    delete mt_toolbar where ( function eq mc_fc_call_report
    or function eq mc_fc_call_chain
      or function eq mc_fc_call_more
      or function eq mc_fc_call_master_data )
      and butn_type eq space.
  endif.

*... eliminate requested functions from Menu Buttons
  if not lt_excluding_toolbar[] is initial.
    call method m_cl_menu_button_variant->hide_functions
      exporting
        fcodes = lt_excluding_toolbar.
    call method m_cl_menu_button_sum->hide_functions
      exporting
        fcodes = lt_excluding_toolbar.
    call method m_cl_menu_button_subtot->hide_functions
      exporting
        fcodes = lt_excluding_toolbar.
    call method m_cl_menu_button_filter->hide_functions
      exporting
        fcodes = lt_excluding_toolbar.
    call method m_cl_menu_button_export->hide_functions
      exporting
        fcodes = lt_excluding_toolbar.
    call method m_cl_menu_button_view->hide_functions
      exporting
        fcodes = lt_excluding_toolbar.
    call method m_cl_menu_button_paste->hide_functions
      exporting
        fcodes = lt_excluding_toolbar.
    call method m_cl_menu_button_reprep->hide_functions
      exporting
        fcodes = lt_excluding_toolbar.
  endif.

*... eliminate requested functions from Toolbar
  loop at lt_excluding_toolbar into l_function.
    delete mt_toolbar where function eq l_function.
  endloop.

*... if all elements of Menu Button or hidden or disabled
*    then hide menu button
  data: lt_fcodes type ui_funcattr,
        ls_fcode  type uiattentry.
*...... Menu Button VARIANT
  call method m_cl_menu_button_variant->get_functions
    importing
      fcodes = lt_fcodes.
  read table lt_fcodes transporting no fields
                       with key disabled = space
                                hidden   = space.
  if sy-subrc ne 0.
    delete mt_toolbar where function  eq mc_mb_variant
                        and butn_type ne space.
  endif.
*...... Menu Button SUM
  call method m_cl_menu_button_sum->get_functions
    importing
      fcodes = lt_fcodes.
  read table lt_fcodes transporting no fields
                       with key disabled = space
                                hidden   = space.
  if sy-subrc ne 0.
    delete mt_toolbar where function  eq mc_mb_sum
                        and butn_type ne space.
  endif.
*...... Menu Button SUBTOTAL
  call method m_cl_menu_button_subtot->get_functions
    importing
      fcodes = lt_fcodes.
  read table lt_fcodes transporting no fields
                       with key disabled = space
                                hidden   = space.
  if sy-subrc ne 0.
    delete mt_toolbar where function  eq mc_mb_subtot
                        and butn_type ne space.
  endif.
*...... Menu Button FILTER
  call method m_cl_menu_button_filter->get_functions
    importing
      fcodes = lt_fcodes.
  read table lt_fcodes transporting no fields
                       with key disabled = space
                                hidden   = space.
  if sy-subrc ne 0.
    delete mt_toolbar where function  eq mc_mb_filter
                        and butn_type ne space.
  endif.
*...... Menu Button EXPORT
  call method m_cl_menu_button_export->get_functions
    importing
      fcodes = lt_fcodes.
  read table lt_fcodes transporting no fields
                       with key disabled = space
                                hidden   = space.
  if sy-subrc ne 0.
    delete mt_toolbar where function  eq mc_mb_export
                        and butn_type ne space.
  endif.
*...... Menu Button VIEW
  call method m_cl_menu_button_view->get_functions
    importing
      fcodes = lt_fcodes.
  read table lt_fcodes transporting no fields
                       with key disabled = space
                                hidden   = space.
  if sy-subrc ne 0.
    delete mt_toolbar where function  eq mc_mb_view
                        and butn_type ne space.
  endif.
*...... Menu Button PASTE
  call method m_cl_menu_button_paste->get_functions
    importing
      fcodes = lt_fcodes.
  read table lt_fcodes transporting no fields
                       with key disabled = space
                                hidden   = space.
  if sy-subrc ne 0.
    delete mt_toolbar where function  eq mc_mb_paste
                        and butn_type ne space.
  endif.
*...... Menu Button REPREP
  call method m_cl_menu_button_reprep->get_functions
    importing
      fcodes = lt_fcodes.
  read table lt_fcodes transporting no fields
                       with key disabled = space
                                hidden   = space.
  if sy-subrc ne 0.
    delete mt_toolbar where function  eq mc_fc_call_more
                        and butn_type ne space.
  endif.

endmethod.                    "


method toolbar_menus_create .

*... Menus anlegen
  create object m_cl_menu_button_variant.
  create object m_cl_menu_button_sum.
  create object m_cl_menu_button_filter.
  create object m_cl_menu_button_export.
  create object m_cl_menu_button_reprep.
  create object m_cl_menu_button_view.
  create object m_cl_menu_button_subtot.
  create object m_cl_menu_button_paste.

endmethod.                    "


method toolbar_menus_init .

*... Initialize Toolbar Menus
  call method m_cl_menu_button_variant->clear.
  call method m_cl_menu_button_sum->clear.
  call method m_cl_menu_button_filter->clear.
  call method m_cl_menu_button_export->clear.
  call method m_cl_menu_button_reprep->clear.
  call method m_cl_menu_button_view->clear.
  call method m_cl_menu_button_subtot->clear.
  call method m_cl_menu_button_paste->clear.

endmethod.                    "


method toolbar_modify .

  data: ls_toolbar      type stb_button,
        lt_fcodes       type ui_functions,
        l_view          type sy-ucomm,
        l_disabled      type sap_bool,
        lt_menu_fcodes  type ui_funcattr,
        ls_menu_fcode   type uiattentry.

*... Function Search Next
  if me->ms_search is initial.
    l_disabled = abap_true.
  else.
    l_disabled = abap_false.
  endif.
  ls_toolbar-disabled = l_disabled.
  modify mt_toolbar from ls_toolbar transporting disabled
                    where function eq mc_fc_find_more.

*... Menu Button View
  if me->m_next_view is not initial.
    l_view = me->m_next_view.
  else.
    l_view = me->m_view.
  endif.
  clear lt_fcodes.
  case l_view.
    when mc_fc_view_grid.
      append mc_fc_view_grid to lt_fcodes.
    when mc_fc_view_excel.
      append mc_fc_view_excel to lt_fcodes.
    when mc_fc_view_lotus.
      append mc_fc_view_lotus to lt_fcodes.
    when mc_fc_view_crystal.
      append mc_fc_view_crystal to lt_fcodes.
  endcase.
  call method m_cl_menu_button_view->disable_functions
    exporting
      fcodes = lt_fcodes.

*... Menu Button Filter
  clear lt_fcodes.
  append mc_fc_delete_filter to lt_fcodes.
  if m_cl_variant->mt_filter is initial.
    call method m_cl_menu_button_filter->disable_functions
      exporting
        fcodes = lt_fcodes.
  else.
    call method m_cl_menu_button_filter->enable_functions
      exporting
        fcodes = lt_fcodes.
  endif.

*... Menu Button Sum
*...... if the list is to allow no sums then eliminate this function
  clear l_disabled.
  clear lt_fcodes.
  call method m_cl_menu_button_sum->get_functions
    importing
      fcodes = lt_menu_fcodes.
  loop at lt_menu_fcodes into ls_menu_fcode
          where disabled = abap_false
             or hidden   = abap_false.
    if sy-subrc ne 0.
      append ls_menu_fcode-fcode to lt_fcodes.
    endif.
  endloop.
  if m_cl_variant->ms_layout-no_totline eq abap_true.
    l_disabled = abap_true.
    call method m_cl_menu_button_sum->hide_functions
      exporting
        fcodes = lt_fcodes.
    clear lt_fcodes.
    append mc_fc_subtot to lt_fcodes.
    append mc_fc_auf to lt_fcodes.
    call method m_cl_menu_button_subtot->hide_functions
      exporting
        fcodes = lt_fcodes.
  else.
    call method m_cl_menu_button_sum->show_functions
      exporting
        fcodes = lt_fcodes.
    clear lt_fcodes.
    append mc_fc_subtot to lt_fcodes.
    append mc_fc_auf to lt_fcodes.
    call method m_cl_menu_button_subtot->show_functions
      exporting
        fcodes = lt_fcodes.
  endif.
  ls_toolbar-disabled = l_disabled.
  modify mt_toolbar from ls_toolbar transporting disabled
                    where function eq mc_mb_subtot.
  modify mt_toolbar from ls_toolbar transporting disabled
                    where function eq mc_fc_subtot.
*...... if Count Functionality is not requested then disable this
*       function from the Menu Button else enable
  call method m_cl_menu_button_sum->get_functions
    importing
      fcodes = lt_menu_fcodes.
  read table lt_menu_fcodes into ls_menu_fcode
             with key fcode = mc_fc_count.
  if sy-subrc eq 0.
    clear lt_fcodes.
    append mc_fc_count to lt_fcodes.
    if m_cl_variant->ms_layout-countfname ne space.
      call method m_cl_menu_button_sum->enable_functions
        exporting
          fcodes = lt_fcodes.
    else.
      call method m_cl_menu_button_sum->disable_functions
        exporting
          fcodes = lt_fcodes.
    endif.
  endif.
*...... if one field allows a sum and is not displayable then
*       sum function must be deactivated
*...... if one field allows a sum and is displayable then
*       sum function must be available
  read table m_cl_variant->mt_fieldcatalog transporting no fields
             with key no_sum = space
                      no_out = space
                      tech   = space.
  if sy-subrc ne 0.
    l_disabled = abap_true.
  endif.
  ls_toolbar-disabled = l_disabled.
  modify mt_toolbar from ls_toolbar transporting disabled
                    where function eq mc_mb_sum.

*... Menu Button Subtotal
*...... if Column has already been summed up then Subtotal Menu
*       must be active otherwise inactive
  loop at m_cl_variant->mt_fieldcatalog transporting no fields
          where do_sum ne space
            and no_out eq space
            and tech   eq space.
    exit.
  endloop.
  if sy-subrc eq 0.
    l_disabled = abap_false.
  else.
    l_disabled = abap_true.
  endif.
  ls_toolbar-disabled = l_disabled.
  modify mt_toolbar from ls_toolbar transporting disabled
                    where function eq mc_mb_subtot.
  modify mt_toolbar from ls_toolbar transporting disabled
                    where function eq mc_fc_subtot.
*...... if no subtotal has been made then subtotal level is inactive
*       otherwise active
  clear lt_fcodes.
  append mc_fc_auf to lt_fcodes.
  if m_cl_variant->ms_total_options-subtot eq space.
    call method m_cl_menu_button_subtot->disable_functions
      exporting
        fcodes = lt_fcodes.
  else.
    call method m_cl_menu_button_subtot->enable_functions
      exporting
        fcodes = lt_fcodes.
  endif.

endmethod.                    "


method transfer_fcode_lvc_to_slis .

  data: lt_fcodes_lvc type ui_functions,
        ls_fcode_slis type rsmpe-func,
        ls_fcode_lvc  type ui_func,
        l_excp_others type char1.

  clear et_fcodes_slis.

  if e_fcode_slis is requested.
    append i_fcode_lvc to lt_fcodes_lvc.
  else.
    lt_fcodes_lvc = it_fcodes_lvc.
  endif.

  loop at lt_fcodes_lvc into ls_fcode_lvc.
    case ls_fcode_lvc.
      when mc_fc_detail.
        ls_fcode_slis = '&ETA'.
      when mc_fc_refresh.
        ls_fcode_slis = '&REFRESH'.
      when mc_fg_sort.
        ls_fcode_slis = '&FG_SORT'.
      when mc_fc_sort_asc.
        ls_fcode_slis = '&OUP'.
      when mc_fc_sort_dsc.
        ls_fcode_slis = '&ODN'.
      when mc_fc_fix_columns.
        ls_fcode_slis = '&CFI'.
      when mc_fc_unfix_columns.
        ls_fcode_slis = '&CDF'.
      when mc_fc_col_optimize.
        ls_fcode_slis = '&OPT'.
      when mc_fc_find.
        ls_fcode_slis = '%SC'.
      when mc_mb_filter.
        ls_fcode_slis = '&FG_FILTER'.
      when mc_fc_filter.
        ls_fcode_slis = '&ILT'.
      when mc_fc_delete_filter.
        ls_fcode_slis = '&ILD'.
      when mc_mb_sum.
        ls_fcode_slis = '&FG_SUM'.
      when mc_fc_sum.
        ls_fcode_slis = '&UMC'.
      when mc_fc_average.
        ls_fcode_slis = '&AVR'.
      when mc_fc_minimum.
        ls_fcode_slis = '&MIN'.
      when mc_fc_maximum.
        ls_fcode_slis = '&MAX'.
      when mc_fc_count.
        ls_fcode_slis = '&COUNT'.
      when mc_mb_subtot.
        ls_fcode_slis = '&FG_SUBTOT'.
      when mc_fc_subtot.
        ls_fcode_slis = '&SUM'.
      when mc_fc_auf.
        ls_fcode_slis = '&AUF'.
      when mc_fc_print_back.
        ls_fcode_slis = '&RNT'.
      when mc_fc_call_crbatch.
        ls_fcode_slis = '&CRBATCH'.
      when mc_mb_view.
        ls_fcode_slis = '&FG_VIEW'.
      when mc_fc_view_grid.
        ls_fcode_slis = '&VGRID'.
      when mc_fc_view_excel.
        ls_fcode_slis = '&VEXCEL'.
      when mc_fc_view_crystal.
        ls_fcode_slis = '&VCRYSTAL'.
      when mc_fc_view_lotus.
        ls_fcode_slis = '&VLOTUS'.
      when mc_fc_print_prev.
        ls_fcode_slis = '&RNT_PREV'.
      when mc_mb_export.
        ls_fcode_slis = '&FG_EXPORT'.
      when mc_fc_call_xxl.
        ls_fcode_slis = '&XXL'.
      when mc_fc_word_processor.
        ls_fcode_slis = '&AQW'.
      when mc_fc_pc_file.
        ls_fcode_slis = '%PC'.
      when mc_fc_send.
        ls_fcode_slis = '%SL'.
      when mc_fc_to_office.
        ls_fcode_slis = '%ML'.
      when mc_fc_call_abc.
        ls_fcode_slis = '&ABC'.
      when mc_fc_call_xint.
        ls_fcode_slis = '&XINT'.
      when mc_fc_expcrdesig.
        ls_fcode_slis = '&CRDESIG'.
      when mc_fc_expcrtempl.
        ls_fcode_slis = '&CRTEMPL'.
      when mc_fc_call_xml_export.
        ls_fcode_slis = '&XML'.
      when mc_fc_url_copy_to_clipboard.
        ls_fcode_slis = '&URL'.
      when mc_mb_variant.
        ls_fcode_slis = '&FG_VARIANT'.
      when mc_fc_current_variant.
        ls_fcode_slis = '&OL0'.
        append ls_fcode_slis to et_fcodes_slis.
        ls_fcode_slis = '&OLX'.
      when mc_fc_load_variant.
        ls_fcode_slis = '&OAD'.
      when mc_fc_save_variant.
        ls_fcode_slis = '&AVE'.
      when mc_fc_maintain_variant.
        ls_fcode_slis = '&ERW'.
      when mc_fc_call_lineitems.
        ls_fcode_slis = '&EB1'.
      when mc_fc_call_master_data.
        ls_fcode_slis = '&EB2'.
      when mc_fc_call_more.
        ls_fcode_slis = '&EB3'.
      when mc_fc_call_report.
        ls_fcode_slis = '&EB9'.
      when mc_fc_call_chain.
        ls_fcode_slis = '&EBN'.
      when mc_fc_graph.
        ls_fcode_slis = '&GRAPH'.
      when mc_fc_info.
        ls_fcode_slis = '&INFO'.
      when mc_fc_select_all.
        ls_fcode_slis = '&ALL'.
      when mc_fc_deselect_all.
        ls_fcode_slis = '&SAL'.
      when mc_fc_help.
        ls_fcode_slis = '&ELP'.
      when mc_fc_data_save.
        ls_fcode_slis = '&DATA_SAVE'.
      when mc_fc_f4.
        ls_fcode_slis = '&F4'.
      when mc_fc_sos.
        ls_fcode_slis = '&SOS'.
      when mc_fc_to_rep_tree.
        ls_fcode_slis = mc_fc_to_rep_tree.
      when others.
        ls_fcode_slis = ls_fcode_lvc.
        l_excp_others = 'X'.
    endcase.
    append ls_fcode_slis to et_fcodes_slis.
  endloop.

  delete adjacent duplicates from et_fcodes_slis.

  if e_fcode_slis is requested.
    read table et_fcodes_slis into e_fcode_slis index 1.
    if l_excp_others eq 'X'.
      raise no_match_found.
    endif.
  endif.

endmethod.                    "TRANSFER_FCODE_LVC_TO_SLIS


method transfer_fcode_slis_to_lvc .

  data: lt_fcodes_slis type slis_t_extab,
        ls_fcode_slis  type rsmpe-func,
        ls_fcode_lvc   type ui_func,
        l_excp_others  type char1.

  clear et_fcodes_lvc.

  if e_fcode_lvc is requested.
    append i_fcode_slis to lt_fcodes_slis.
  else.
    lt_fcodes_slis = it_fcodes_slis.
  endif.

  loop at lt_fcodes_slis into ls_fcode_slis.
    case ls_fcode_slis.
*Side Effect: F2CODE doesn't work anymore!!!!
*to check: what happens now? kds
      when '&ETA'.   " or '&IC1'.
        ls_fcode_lvc = mc_fc_detail.
      when '&REFRESH'.
        ls_fcode_lvc = mc_fc_refresh.
      when '&FG_SORT'.
        ls_fcode_lvc = mc_fg_sort.
      when '&OUP'.
        ls_fcode_lvc = mc_fc_sort_asc.
      when '&ODN'.
        ls_fcode_lvc = mc_fc_sort_dsc.
      when '&CFI'.
        ls_fcode_lvc = mc_fc_fix_columns.
      when '&CDF'.
        ls_fcode_lvc = mc_fc_unfix_columns.
      when '&OPT'.
        ls_fcode_lvc = mc_fc_col_optimize.
      when '%SC'.
        ls_fcode_lvc = mc_fc_find.
      when '%SC+'.
        ls_fcode_lvc = mc_fc_find_more.
      when '&FG_FILTER'.
        ls_fcode_lvc = mc_mb_filter.
      when '&ILT'.
        ls_fcode_lvc = mc_fc_filter.
      when '&ILD'.
        ls_fcode_lvc = mc_fc_delete_filter.
      when '&FG_SUM'.
        ls_fcode_lvc = mc_mb_sum.
      when '&UMC'.
        ls_fcode_lvc = mc_fc_sum.
      when '&AVR'.
        ls_fcode_lvc = mc_fc_average.
      when '&MIN'.
        ls_fcode_lvc = mc_fc_minimum.
      when '&MAX'.
        ls_fcode_lvc = mc_fc_maximum.
      when '&COUNT'.
        ls_fcode_lvc = mc_fc_count.
      when '&FG_SUBTOT'.
        ls_fcode_lvc = mc_mb_subtot.
      when '&SUM'.
        ls_fcode_lvc = mc_fc_subtot.
      when '&AUF'.
        ls_fcode_lvc = mc_fc_auf.
      when '&RNT'.
        ls_fcode_lvc = mc_fc_print_back.
      when '&CRBATCH'.
        ls_fcode_lvc = mc_fc_call_crbatch.
      when '&FG_VIEW'.
        ls_fcode_lvc = mc_mb_view.
      when '&VGRID'.
        ls_fcode_lvc = mc_fc_view_grid.
      when '&VEXCEL'.
        ls_fcode_lvc = mc_fc_view_excel.
      when '&VCRYSTAL'.
        ls_fcode_lvc = mc_fc_view_crystal.
      when '&VLOTUS'.
        ls_fcode_lvc = mc_fc_view_lotus.
      when '&RNT_PREV'.
        ls_fcode_lvc = mc_fc_print_prev.
      when '&FG_EXPORT'.
        ls_fcode_lvc = mc_mb_export.
      when '&XXL'.
        ls_fcode_lvc = mc_fc_call_xxl.
      when '&AQW'.
        ls_fcode_lvc = mc_fc_word_processor.
      when '%PC' or '&PC'.
        ls_fcode_lvc = mc_fc_pc_file.
      when '%SL'.
        ls_fcode_lvc = mc_fc_send.
      when '%ML'.
        ls_fcode_lvc = mc_fc_to_office.
      when '&ABC'.
        ls_fcode_lvc = mc_fc_call_abc.
      when '&XINT'.
        ls_fcode_lvc = mc_fc_call_xint.
      when '&CRDESIG'.
        ls_fcode_lvc = mc_fc_expcrdesig.
      when '&CRTEMPL'.
        ls_fcode_lvc = mc_fc_expcrtempl.
      when '&XML'.
        ls_fcode_lvc = mc_fc_call_xml_export.
      when '&URL'.
        ls_fcode_lvc = mc_fc_url_copy_to_clipboard.
      when '&FG_VARIANT'.
        ls_fcode_lvc = mc_mb_variant.
      when '&OL0' or '&OLX'.
        ls_fcode_lvc = mc_fc_current_variant.
      when '&OAD'.
        ls_fcode_lvc = mc_fc_load_variant.
      when '&AVE'.
        ls_fcode_lvc = mc_fc_save_variant.
      when '&ERW'.
        ls_fcode_lvc = mc_fc_maintain_variant.
      when '&EB1'.
        ls_fcode_lvc = mc_fc_call_lineitems.
      when '&EB2'.
        ls_fcode_lvc = mc_fc_call_master_data.
      when '&EB3'.
        ls_fcode_lvc = mc_fc_call_more  .
      when '&EB9'.
        ls_fcode_lvc = mc_fc_call_report.
      when '&EBN'.
        ls_fcode_lvc = mc_fc_call_chain.
      when '&GRAPH'.
        ls_fcode_lvc = mc_fc_graph.
      when '&INFO'.
        ls_fcode_lvc = mc_fc_info.
      when '&ALL'.
        ls_fcode_lvc = mc_fc_select_all.
      when '&SAL'.
        ls_fcode_lvc = mc_fc_deselect_all.
      when '&ELP'.
        ls_fcode_lvc = mc_fc_help.
      when '&DATA_SAVE'.
        ls_fcode_lvc = mc_fc_data_save.
      when '&F4'.
        ls_fcode_lvc = mc_fc_f4.
      when '&SOS'.
        ls_fcode_lvc = mc_fc_sos.
      when mc_fc_to_rep_tree.
        ls_fcode_slis = mc_fc_to_rep_tree.
      when '&IC1'.      "Y7AK118446
        ls_fcode_lvc = ls_fcode_slis.
      when others.
        ls_fcode_lvc = ls_fcode_slis.
        l_excp_others = 'X'.
    endcase.
    append ls_fcode_lvc to et_fcodes_lvc.
  endloop.

  delete adjacent duplicates from et_fcodes_lvc.

  if e_fcode_lvc is requested.
    read table et_fcodes_lvc into e_fcode_lvc index 1.
    if l_excp_others eq 'X'.
      raise no_match_found.
    endif.
  endif.

endmethod. "TRANSFER_FCODE_SLIS_TO_LVC


method unfix_columns.

  data: ls_fieldcat type lvc_s_fcat.

  loop at m_cl_variant->mt_fieldcatalog into ls_fieldcat
                                        where fix_column eq 'X'.
    clear ls_fieldcat-fix_column.
    modify m_cl_variant->mt_fieldcatalog from ls_fieldcat.
  endloop.

  if _is_bridge_active( ) = abap_true.
    macro_bridge_call_data.
    macro_bridge_method_name cl_gui_alv_grid set_fixed_cols.
    macro_bridge_parameter exporting: cols 0.
    macro_bridge_call.
  else.
    call method me->set_fixed_cols exporting cols = 0.
  endif.

endmethod.


method url_copy_to_clipboard.

  call function 'LVC_GENERATE_URL'
       exporting
            i_selvariant       = sy-slset
            is_variant         = m_cl_variant->ms_variant
       exceptions
            ip_report_required = 1
            others             = 2.
  if sy-subrc <> 0.
    message id sy-msgid type sy-msgty number sy-msgno
            with sy-msgv1 sy-msgv2 sy-msgv3 sy-msgv4.
  endif.

endmethod.


method www_alv_call.

  include <cl_alv_control>.

*... www parameters
  data: lflg_www         type c,
        l_url(1024)      type c,
        l_back_url(1024) type c,
        lflg_int_data(1) type c,
        lt_query_string  type table of w3query,
        lt_variant       type standard table of disvariant,
        l_header         type c,
        lr_report        type range of ltdx-report,
        lr_handle        type range of ltdx-handle,
        lr_log_group     type range of ltdx-log_group,
        ls_report        like line of lr_report,
        ls_handle        like line of lr_handle,
        lt_int_data      type lvc_t_tabl,
        ls_int_data      type lvc_s_tabl,
        lt_fields        type lvc_t_fiel,
        ls_fields        type lvc_s_fiel,
        lflg_cache(1)     type c,
        ls_info          type lvc_s_info,
        ls_log_group     like line of lr_log_group,
        l_tabix          type sy-tabix,
        l_varix          type sy-tabix,
        ls_fieldcat      type lvc_s_fcat,
        ls_extract       type disextract,
        ls_ltcxkey       type ltcxkey,
        lflg_no_shuffler type c,
        lt_html          type standard table of w3html,
        lt_selvaris      type table of rsvartxt,
        lp_table          type ref to data,
        lt_selection     type table of rsparams,
        x type i,
        l_report         type sy-repid,
        lflg_sort_column(1) type c,
        l_fontsize       type int4.

  include <www_constants>.

  field-symbols: <tab1> type standard table,
                 <ls_wa> type any,
                 <l_field> type any.

  data: l_lin type i.
  describe table mt_data lines l_lin.
  call method lvc_table_fill
    exporting
      firstline = 1
      lastline  = l_lin.

  import lflg_www to lflg_www   from memory id con_html_get.
  import l_url    to l_url      from memory id con_html_url.
  import back_url to l_back_url from memory id con_back_url.
  import selection to lt_selection from memory id con_selections.
  import cache to lflg_cache from memory id con_cache.

  if 1 = 0.
    move-corresponding m_cl_variant->ms_variant to ls_extract.
    move-corresponding m_cl_variant->ms_variant to ls_ltcxkey.
    if ls_extract-report is initial.
      import report to l_report from memory id con_report.
      ls_extract-report = l_report.
      ls_ltcxkey-report = l_report.
    endif.

    import sort_column to lflg_sort_column
                       from memory id con_save.
    if lflg_sort_column = 'X'.
      clear lflg_cache.
    endif.

    ls_extract-exname = 'FIELDCAT'.

    if lflg_cache is initial.
      call function 'REUSE_ALV_EXTRACT_SAVE'
        exporting
          is_extract = ls_extract
          i_exp01    = m_cl_variant->mt_fieldcatalog
          i_exp02    = m_cl_variant->ms_variant.
* Write cache
      assign mt_outtab->* to <tab1>.
      if not sy-subrc is initial.
        message a534(0k).
      endif.

      call method cl_alv_table_create=>table_copy
        exporting
          it_outtab       = <tab1>
          it_fieldcatalog = m_cl_variant->mt_fieldcatalog
        importing
          ep_table        = lp_table.
      assign lp_table->* to <tab1>.
    endif.
  endif.

* in case of WEBRFC with Crystal-Template we try to process this:
  if ( m_next_view = mc_fc_view_crystal ).
    data l_turl type char1024.

    call method get_crystal_url
      exporting
        is_alv_bds = m_next_alv_bds
      importing
        e_url      = l_turl
      exceptions
        others     = 1.
    if ( sy-subrc = 0 ).
      call method set_html_loader_to_memory
        exporting
          i_url  = l_turl
        exceptions
          others = 1.
      set screen 0.
      leave screen.  "#EC *
      exit.   "!!!!! Terminate processing ( WEBRFC ).
    endif.
  endif.

  import no_shuffler to lflg_no_shuffler from memory id
                               'WWW_ALV_NO_SHUFFLER'.

  if lflg_no_shuffler is initial.
    call function 'ALV_LAYOUT_GET'
      exporting
        is_variant     = m_cl_variant->ms_variant
      importing
        e_tabix        = l_tabix
      tables
        et_alv_layouts = lt_variant.
    export layouts from lt_variant
         index from l_tabix to memory id con_layouts.
  endif.

  if lflg_www eq 'X'. " HTML_EXPORT FOR WEBRFC with HTML-Generation
    import selvaris to lt_selvaris
           varix    to l_varix
           from memory id con_selvaris.

    import query_string to lt_query_string
           from memory id con_query_string.

    import fontsize to l_fontsize
           from memory id con_fontsize.

    import header to l_header
           from memory id con_header.

    if l_header = 'S'.
      loop at mt_info into  ls_info.
        if not ls_info-text_s is initial.
          ls_info-text = ls_info-text_s.
          modify mt_info from ls_info.
        endif.
      endloop.
    elseif l_header = 'M'.
      loop at mt_info into  ls_info.
        if not ls_info-text_m is initial.
          ls_info-text = ls_info-text_m.
          modify mt_info from ls_info.
        endif.
      endloop.
    endif.

    call function 'LVC_ALV_CONVERT_TO_HTML'
      exporting
        it_data         = mt_data
        it_info         = mt_info
        it_hyperlink    = mt_hyperlinks
        i_back_url      = l_back_url
        i_file_dialog   = ' '
        i_main_url      = l_url
        i_start_variant = l_varix
        i_start_layout  = l_tabix
        i_font_size     = l_fontsize
      importing
        et_html         = lt_html
      tables
        it_variants     = lt_selvaris
        it_layouts      = lt_variant
        it_query_string = lt_query_string.

    export html from lt_html to memory id con_html.

    if 1 = 0.
      if lflg_cache is initial.
        call function 'ALV_CACHE_WRITE'
          exporting
            i_report      = ls_ltcxkey-report
            i_handle      = ls_ltcxkey-handle
            i_log_group   = ls_ltcxkey-log_group
            i_username    = sy-uname
            is_variant    = m_cl_variant->ms_variant
            is_layout     = m_cl_variant->ms_layout
            i_save        = m_cl_variant->m_variant_save
            it_sort       = m_cl_variant->mt_sort
            it_filter     = m_cl_variant->mt_filter
            it_hyperlinks = mt_hyperlinks
          tables
            it_selections = lt_selection[]
            it_outtab     = <tab1>
            it_html       = lt_html.
      endif.
    endif.

*... (1) Trace?
    if not mr_trace is initial.
      call method mr_trace->add_trace_item
        exporting
          i_trace_item = 'WWW_ALV_CALL'
          ir_variant   = m_cl_variant
          it_data      = mt_data
          it_info      = mt_info.
    endif.

    set screen 0.
    leave screen.  "#EC *
    exit.   " !!!!! Terminate processing ( WEBRFC ).

  else. " FLow logic: Simply dump converted data to memory...
    import int_data to lflg_int_data
           from memory id 'WWW_ALV_INT_DATA_GET'.

    loop at m_cl_variant->mt_fieldcatalog into ls_fieldcat.
      move-corresponding ls_fieldcat to ls_fields.
      append ls_fields to lt_fields.
    endloop.

    if not lflg_int_data is initial.
      assign mt_outtab->* to <tab1>.
      if not sy-subrc is initial.
        message a534(0k).
      endif.
      loop at <tab1> assigning <ls_wa>.
        loop at lt_fields into ls_fields.
          assign component ls_fields-fieldname
                        of structure <ls_wa> to <l_field>.
          ls_int_data-value = <l_field>.
          shift ls_int_data left deleting leading space.
          append ls_int_data to lt_int_data.

        endloop.
      endloop.
    endif.

    export int_data from lt_int_data[]
           fields from lt_fields to memory id con_int_data.

    data: lr_dydo type ref to cl_dd_document.

    create object lr_dydo.

    call function 'REUSE_ALV_GRID_COMMENTARY_SET'
      exporting
        document       = lr_dydo
        bottom         = space
*     IMPORTING
*       LENGTH         =
              .
    call method lr_dydo->merge_document.

    export html from lr_dydo->html_table to memory id con_html.

    data: l_hex    type x,
          l_rgb(9) type c,
          l_red    type i,
          l_green  type i,
          l_blue   type i.
*... modfiy and export MT_DATA
    field-symbols: <ls_data> type lvc_s_data.
    loop at mt_data assigning <ls_data>.
      if <ls_data>-col_pos > 0.
        shift <ls_data>-value left deleting leading space.
      endif.

      l_hex = <ls_data>-style.
      clear <ls_data>-style2.
      <ls_data>-style2 = l_hex.
      case <ls_data>-style2.
        when alv_style_color_negative.
          l_rgb = '255189189'.
        when alv_style_color_int_negative.
          l_rgb = '255107107'.
        when alv_style_color_positive.
          l_rgb = '206255173'.
        when alv_style_color_int_positive.
          l_rgb = '123198099'.
        when alv_style_color_heading.
          l_rgb = '173231255'.
        when alv_style_color_int_heading.
          l_rgb = '090206255'.
        when alv_style_color_normal.
          l_rgb = '239247255'.
        when alv_style_color_int_normal.
          l_rgb = '214239247'.
        when alv_style_color_total.
          l_rgb = '255255189'.
        when alv_style_color_int_total.
          l_rgb = '255239090'.
        when alv_style_color_key.
          l_rgb = '206239255'.
        when alv_style_color_int_key.
          l_rgb = '156206239'.
        when alv_style_color_group.
          l_rgb = '255222198'.
        when alv_style_color_int_group.
          l_rgb = '255198107'.
        when alv_style_color_background.
          l_rgb = '198222239'.
        when alv_style_color_int_background.
          l_rgb = '198222239'.
        when others.
*          l_rgb = '214239247'.
      endcase.
      l_red   = l_rgb+0(3).
      l_green = l_rgb+3(3).
      l_blue  = l_rgb+6(3).
      <ls_data>-style2 = l_blue + ( l_green * 256 ) +
                         ( l_red * 256 * 256 ).
    endloop.
    export mt_data from mt_data[] to memory id con_data.

*... modify and export MT_INFO
    data: ls_info2 type lvc_s_info.
    loop at mt_info into ls_info2.
      if ls_info2-text_m is initial.
        ls_info2-text_m = ls_info2-text.
      endif.
      if ls_info2-text_s is initial.
        ls_info2-text_s = ls_info2-text.
      endif.
      if ls_info2-reptext is initial.
        ls_info2-reptext = ls_info2-text.
      endif.

      l_hex = ls_info2-style.
      clear ls_info2-style2.
      ls_info2-style2 = l_hex.
      case ls_info2-style2.
        when alv_style_color_negative.
          l_rgb = '255189189'.
        when alv_style_color_int_negative.
          l_rgb = '255107107'.
        when alv_style_color_positive.
          l_rgb = '206255173'.
        when alv_style_color_int_positive.
          l_rgb = '123198099'.
        when alv_style_color_heading.
          l_rgb = '173231255'.
        when alv_style_color_int_heading.
          l_rgb = '090206255'.
        when alv_style_color_normal.
          l_rgb = '239247255'.
        when alv_style_color_int_normal.
          l_rgb = '214239247'.
        when alv_style_color_total.
          l_rgb = '255255189'.
        when alv_style_color_int_total.
          l_rgb = '255239090'.
        when alv_style_color_key.
          l_rgb = '206239255'.
        when alv_style_color_int_key.
          l_rgb = '156206239'.
        when alv_style_color_group.
          l_rgb = '255222198'.
        when alv_style_color_int_group.
          l_rgb = '255198107'.
        when alv_style_color_background.
          l_rgb = '198222239'.
        when alv_style_color_int_background.
          l_rgb = '198222239'.
        when others.
*          l_rgb = '214239247'.
      endcase.
      l_red   = l_rgb+0(3).
      l_green = l_rgb+3(3).
      l_blue  = l_rgb+6(3).
      ls_info2-style2 = l_blue + ( l_green * 256 ) +
                        ( l_red * 256 * 256 ).

      data: ls_sort type lvc_s_sort.
      read table me->m_cl_variant->mt_sort into ls_sort
                 with key fieldname = ls_info2-fieldname.
      if sy-subrc eq 0.
        if ls_sort-up eq 'X'.
          ls_info2-style3 = 1.
        elseif ls_sort-down eq 'X'.
          ls_info2-style3 = 2.
        endif.
      endif.

      modify mt_info from ls_info2.
    endloop.
    export mt_info from mt_info[] to memory id con_info.

    export mt_hyperlinks from
           mt_hyperlinks[] to memory id con_hyperlinks.
    export ms_layout from m_cl_variant->ms_layout
                     to memory id con_layout.

    if 1 = 0.
      if lflg_cache is initial.
        call function 'ALV_CACHE_WRITE'
          exporting
            i_report      = ls_ltcxkey-report
            i_handle      = ls_ltcxkey-handle
            i_log_group   = ls_ltcxkey-log_group
            i_username    = sy-uname
            is_variant    = m_cl_variant->ms_variant
            is_layout     = m_cl_variant->ms_layout
            i_save        = m_cl_variant->m_variant_save
            it_hyperlinks = mt_hyperlinks
          tables
            it_selections = lt_selection[]
            it_outtab     = <tab1>
            it_html       = lt_html.

      endif.
    endif.

*... (1) Trace?
    if not mr_trace is initial.
      call method mr_trace->add_trace_item
        exporting
          i_trace_item = 'WWW_ALV_CALL'
          ir_variant   = m_cl_variant
          it_data      = mt_data
          it_info      = mt_info.
    endif.

    if lflg_cache is initial and lflg_sort_column is initial.
      set screen 0.
      leave screen.
    endif.

    exit. " !!!!! Terminate processing ( Flow logic, data in Memory)
  endif.

endmethod.                    "www_alv_call


method _continue_after_return.
  me->_bridge_flags-continue_after_return = abap_true.
endmethod.


method _create_bridge.

  data bridge_class_name type string.
  bridge_class_name = cl_alv_z_params=>get_parameter(
      cl_alv_z_params=>c_param-bridge_class
  ).
  if bridge_class_name is not initial.
    create object me->_r_bridge type (bridge_class_name)
      exporting r_master = me.
  else.
*   Factory ... version dependent class...
    create object me->_r_bridge type ('CL_SALV_GRZ_BRIDGE')
      exporting r_master = me.
  endif.

endmethod.


  method _GET_COL_POS.
  data: l_col_pos type LVC_T_COLL. "->set_info_table

  try.
    call method me->GET_COL_POS_ID_BASE
                              importing col_pos_table = l_col_pos .
  endtry.

  et_col_pos = l_col_pos.

  endmethod.


method _get_internal_member_value.

  case name.
    when 'M_PERFORMANCE'.
      value = me->m_performance.
  endcase.

endmethod.


  METHOD _get_masking.

*<<< YI3K205700 Y4HK046613
    value  = m_path.
    active = _m_uim.

  ENDMETHOD.


  METHOD _GET_PATH.

    DATA: L_DOCKING_ID   TYPE STRING,
          L_SPLIT_ID     TYPE STRING,
          L_EASY_ID      TYPE STRING,
          L_SIMPLE_ID    TYPE STRING,
          L_DIALOGBOX_ID TYPE STRING.

    DATA: L_PATH     TYPE STRING,
          L_POSITION TYPE CON_NAME,
          L_PROGRAM  TYPE PROGRAM,
          L_DYNPRO   TYPE SYDYNNR.

    DATA: L_CONT_NAME TYPE SCRFNAME,
          L_DYNNR     TYPE SY-DYNNR,
          L_REPID     TYPE SY-REPID.

    DATA(LO_PARENT) = IR_CONTAINER.

* path of container retrieved by Kernel call in Constructor
    try.
      CL_DYNP_RAL_API=>GET_CURRENT_PATH( IMPORTING ES_PATH = L_PATH ).
    endtry.

    TRY.
        L_CONT_NAME = LO_PARENT->GET_NAME( ).   "custom container, no dockers!
      CATCH CX_SY_REF_IS_INITIAL.
        L_CONT_NAME = 'DYNPRO_DEFAULT'.    "grid called without container in fullsreen mode
*          return.
    ENDTRY.

*  fullscreen oder docking container  constructor
    IF L_CONT_NAME IS INITIAL.
      IF L_PATH CS 'SAPLSLVC_FULLSCREEN' AND LO_PARENT IS BOUND. "YI3K145993
        L_REPID = SY-CPROG.
        L_PATH = L_PATH+20(6).
        IF L_CONT_NAME IS INITIAL.   "special: grid call from fullscreen -> sy-cprog in grid the same as in fullscreen
          L_CONT_NAME = 'GRID1'.
        ENDIF.
        CONCATENATE CL_DYNP_RAL_API=>CO_PATH_SEPARATOR L_REPID L_PATH INTO L_PATH.
        CONCATENATE L_PATH L_CONT_NAME INTO VALUE.

      ELSE." L_PATH EQ ':SAPMSSY0(1000)' AND LO_PARENT IS BOUND.
        DO.
          TRY.
              DATA(LS_LINK_INFO) = LO_PARENT->GET_LINK_INFO( ).  "dockers and splitters
            CATCH CX_SY_DYN_CALL_ILLEGAL_CLASS.
          ENDTRY.

          IF L_POSITION IS INITIAL.
            L_POSITION = LS_LINK_INFO-NAME.
          ENDIF.

          IF L_PROGRAM IS INITIAL.
            L_PROGRAM  = LS_LINK_INFO-PROGRAM.
          ENDIF.

          IF L_DYNPRO IS INITIAL.
            L_DYNPRO   = LS_LINK_INFO-DYNNR.
          ENDIF.

          DATA(LS_CONTAINER_TYPE) = LO_PARENT->GET_CONTAINER_TYPE( ).
          CASE LS_CONTAINER_TYPE.
            WHEN CL_GUI_CONTAINER=>CONTAINER_TYPE_DOCKING.
              CONCATENATE 'DOCKING' L_POSITION '~' INTO L_DOCKING_ID.
              CLEAR L_POSITION.
              EXIT.
            WHEN CL_GUI_CONTAINER=>CONTAINER_TYPE_SPLITTER.
              CONCATENATE 'SPLITTER' L_POSITION '~' INTO L_SPLIT_ID.
              CLEAR L_POSITION.
            WHEN CL_GUI_CONTAINER=>CONTAINER_TYPE_EASY_SPLITTER.
              CONCATENATE 'EASY' L_POSITION '~' INTO L_EASY_ID.
              CLEAR L_POSITION.
            WHEN CL_GUI_CONTAINER=>CONTAINER_TYPE_SIMPLE.
              CONCATENATE 'SIMPLE' L_POSITION '~' INTO L_SIMPLE_ID.
              CLEAR L_POSITION.
            WHEN CL_GUI_CONTAINER=>CONTAINER_TYPE_DIALOGBOX.
              CONCATENATE 'DIALOG' l_position '~' INTO L_DIALOGBOX_ID.    "YI3K245651
              CLEAR L_POSITION.
              EXIT.
          ENDCASE.

          LO_PARENT = LO_PARENT->PARENT.

          IF LO_PARENT IS INITIAL.
            EXIT.
          ENDIF.

        ENDDO.

        IF L_PROGRAM IS INITIAL OR
           L_PROGRAM EQ 'SAPMSSY0'.  "grid instanciated at selection screen before PBO of dynpro
          L_PROGRAM = SY-CPROG.                "dockers with link info
          if ls_link_info-dynnr is initial.    "YI3K201449
            ls_link_info-dynnr = '1000'.       "generated selection screen (SBWP: created screen 1000)
          endif.
        ENDIF.   "fall back; correct environment not known

* container created without link on default screen YI3K321983
        if LS_LINK_INFO-DYNNR is initial.
          LS_LINK_INFO-DYNNR = sy-dynnr.
        endif.

        VALUE =  ':' && L_PROGRAM && '(' && LS_LINK_INFO-DYNNR && ')' && L_DOCKING_ID
                                                                      && L_SPLIT_ID
                                                                      && L_EASY_ID
                                                                      && L_SIMPLE_ID
                                                                      && L_DIALOGBOX_ID.    " YI3K245651
      ENDIF.
    ELSE. "custom container PBO
      IF L_PATH CS 'SAPLSLVC_FULLSCREEN'. "YI3K145993  " call of an ALV grid from an fullscreen ALV
        L_REPID = SY-CPROG.
        L_PATH = L_PATH+20(6).
        CONCATENATE CL_DYNP_RAL_API=>CO_PATH_SEPARATOR L_REPID L_PATH INTO L_PATH.
        CONCATENATE L_PATH L_CONT_NAME INTO VALUE.  "standard ALV in fullscreen mode
      ELSE.
        CONCATENATE L_PATH L_CONT_NAME INTO VALUE.  "standard ALV grid in custom container
      ENDIF.
    ENDIF.

  ENDMETHOD.


  method _GET_SRAL.

      er_sral = m_cl_sral.   "YI3K135475

  endmethod.


method _get_texts.

  data : ls_texts type if_alv_z=>ys_texts.

  ls_texts-text_id = '003'.
  ls_texts-text = 'Einblenden...'(003).
  append ls_texts to value.
  ls_texts-text_id = '005'.
  ls_texts-text = 'Ausblenden'(005).
  append ls_texts to value.
  ls_texts-text_id = '007'.
  ls_texts-text = 'Filter löschen'(007).
  append ls_texts to value.
  ls_texts-text_id = '008'.
  ls_texts-text = 'Filter setzen...'(008).
  append ls_texts to value.
  ls_texts-text_id = '011'.
  ls_texts-text = 'Layout sichern...'(011).
  append ls_texts to value.
  ls_texts-text_id = '012'.
  ls_texts-text = 'Layout auswählen...'(012).
  append ls_texts to value.
  ls_texts-text_id = '013'.
  ls_texts-text = 'Layouts verwalten'(013).
  append ls_texts to value.
  ls_texts-text_id = '015'.
  ls_texts-text = 'Layout ändern...'(015).
  append ls_texts to value.
  ls_texts-text_id = '021'.
  ls_texts-text = 'Aufsteigend sortieren'(021).
  append ls_texts to value.
  ls_texts-text_id = '022'.
  ls_texts-text = 'Absteigend sortieren'(022).
  append ls_texts to value.
  ls_texts-text_id = '023'.
  ls_texts-text = 'Summe'(023).
  append ls_texts to value.
  ls_texts-text_id = '024'.
  ls_texts-text = 'Zwischensummen'(024).
  append ls_texts to value.
  ls_texts-text_id = '025'.
  ls_texts-text = 'Drucken'(025).
  append ls_texts to value.
  ls_texts-text_id = '028'.
  ls_texts-text = 'Exportieren'(028).
  append ls_texts to value.
  ls_texts-text_id = '029'.
  ls_texts-text = 'Textverarbeitung'(029).
  append ls_texts to value.
  ls_texts-text_id = '030'.
  ls_texts-text = 'Lokale Datei'(030).
  append ls_texts to value.
  ls_texts-text_id = '031'.
  ls_texts-text = 'Senden'(031).
  append ls_texts to value.
  ls_texts-text_id = '032'.
  ls_texts-text = 'Tabellenkalkulation'(032).
  append ls_texts to value.
  ls_texts-text_id = '037'.
  ls_texts-text = 'Details'(037).
  append ls_texts to value.
  ls_texts-text_id = '056'.
  ls_texts-text = 'Ansicht'(056).
  append ls_texts to value.
  ls_texts-text_id = '057'.
  ls_texts-text = 'Filter'(057).
  append ls_texts to value.
  ls_texts-text_id = '058'.
  ls_texts-text = 'Sortierung'(058).
  append ls_texts to value.
  ls_texts-text_id = '059'.
  ls_texts-text = 'Spaltenauswahl'(059).
  append ls_texts to value.
  ls_texts-text_id = '065'.
  ls_texts-text = 'Darstellung'(065).
  append ls_texts to value.
  ls_texts-text_id = '104'.
  ls_texts-text = 'Mittelwert'(104).
  append ls_texts to value.
  ls_texts-text_id = '105'.
  ls_texts-text = 'Maximum'(105).
  append ls_texts to value.
  ls_texts-text_id = '106'.
  ls_texts-text = 'Minimum'(106).
  append ls_texts to value.
  ls_texts-text_id = '108'.
  ls_texts-text = 'Mittelwert'(108).
  append ls_texts to value.
  ls_texts-text_id = '108'.
  ls_texts-text = 'Durchschnitt'(108).
  append ls_texts to value.
endmethod.


method _handle_grid_events.

  case action.
    when 'RAISE'.
      case name.
        when 'AFTER_REFRESH'.
          raise event after_refresh.
      endcase.
    when 'DEREGISTER'.
    when 'REGISTER'.
  endcase.

endmethod.


method _handle_toolbar_events.

  case action.
    when 'RAISE'.
      case name.
        when 'TOOLBAR'.
          raise event toolbar exporting e_object      = r_toolbar
                                        e_interactive = i_interactive.
      endcase.
    when 'DEREGISTER'.
      case name.
        when 'TOOLBARMENU'.
          set handler on_toolbarmenu_changed for all instances activation space.
      endcase.
    when 'REGISTER'.
      case name.
        when 'TOOLBARMENU'.
          set handler on_toolbarmenu_changed for r_ctmenu.
      endcase.
  endcase.

endmethod.


method _is_bridge_active.

* bridging enabled
  if _r_bridge is initial.
    bridge_active = abap_false.
    return.
  endif.

* bridging temporary suppressed
  if me->_bridge_flags-suppress_bridge_once = abap_true.
    me->_bridge_flags-suppress_bridge_once = abap_false.
    bridge_active = abap_false.
    return.
  endif.

  bridge_active = abap_true.

endmethod.


method _is_continue_requested.
  continue_requested = me->_bridge_flags-continue_after_return.
  me->_bridge_flags-continue_after_return = abap_false.
endmethod.


method _SET_INTERNAL_MEMBER_VALUE.

  case name.
    when 'M_PERFORMANCE'.
      me->m_performance = value.
  endcase.

endmethod.


method _suppress_bridge_once.
  me->_bridge_flags-suppress_bridge_once = abap_true.
endmethod.
ENDCLASS.