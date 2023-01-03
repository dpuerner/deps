class CL_GUI_ALV_GRID_BASE definition
  public
  inheriting from CL_GUI_CONTROL
  create public

  global friends IF_ALV_RU_GRID_BASE_FRIEND .

public section.
*"* public components of class CL_GUI_ALV_GRID_BASE
*"* do not include other source files here!!!
  type-pools CTLD .

  interfaces IF_GUI_DYNAMIC_DATA .

  constants CO_WEBSTLE_RESET_OPTCOLWIDTH type LVC_STYLE value '00000080'. "#EC NOTEXT
  constants CO_WEBSTLYE_NOF1 type LVC_STYLE value '00010000'. "#EC NOTEXT
  constants CO_WEBSTYLE_INTEGRATED_HEADERS type LVC_STYLE value '00000001'. "#EC NOTEXT
  constants CO_WEBSTYLE_NOCLIP type LVC_STYLE value '00000002'. "#EC NOTEXT
  constants CO_WEBSTYLE_WRAP type LVC_STYLE value '00000004'. "#EC NOTEXT
  constants CO_WEBSTYLE_XSLT type LVC_STYLE value '00001000'. "#EC NOTEXT
  data M_GUID type SYSUUID_25 read-only .

  type-pools SOI .
  methods CONSTRUCTOR
    importing
      !LIFETIME type I optional
      value(SHELLSTYLE) type I optional
      value(PARENT) type ref to CL_GUI_CONTAINER optional
      !DEBUGPARENT type ref to CL_GUI_CONTAINER optional
      !MODE type C optional
      !DOC_TYPE type SOI_DOCUMENT_TYPE default 'Excel.Sheet'
      !DOC_URL type BDS_URI optional
      value(NAME) type STRING optional .

  methods DISPATCH
    redefinition .
  methods FREE
    redefinition .
  methods SET_REGISTERED_EVENTS
    redefinition .
  type-pools CNTL .
  type-pools OLE2 .
  type-pools T .
protected section.

*"* protected components of class CL_GUI_ALV_GRID_BASE
*"* do not include other source files here!!!
  class-data CO_CRYSTAL_INPLACE type LVCXSTYLE value '0001'. "#EC NOTEXT .  .  .  .  .  .  . " .
  class-data CO_CRYSTAL_NOCANDRILLDOWN type LVCXSTYLE value '0008'. "#EC NOTEXT .  .  .  .  .  .  . " .
  class-data CO_CRYSTAL_NOCONTROLS type LVCXSTYLE value '0004'. "#EC NOTEXT .  .  .  .  .  .  . " .
  class-data CO_CRYSTAL_NOEXPORT type LVCXSTYLE value '0040'. "#EC NOTEXT .  .  .  .  .  .  . " .
  class-data CO_CRYSTAL_NONAVIGATION type LVCXSTYLE value '0020'. "#EC NOTEXT .  .  .  .  .  .  . " .
  class-data CO_CRYSTAL_NOZOOM type LVCXSTYLE value '0080'. "#EC NOTEXT .  .  .  .  .  .  . " .
  constants EKM_MOVE_DOWN type I value 2. "#EC NOTEXT
  constants EKM_MOVE_RIGHT type I value 1. "#EC NOTEXT
  constants EKM_NEUTRAL type I value 0. "#EC NOTEXT
  constants EVT_BUTTON_CLICK type I value 22. "#EC NOTEXT
  constants EVT_CLICK_COL_HEADER type I value 6. "#EC NOTEXT
  constants EVT_CLICK_ROW_COL type I value 2. "#EC NOTEXT
  constants EVT_CONTEXT_MENU type I value 9. "#EC NOTEXT
  constants EVT_CONTEXT_MENU_SELECTED type I value 13. "#EC NOTEXT
  constants EVT_DBLCLICK_COL_SEPARATOR type I value 8. "#EC NOTEXT
  constants EVT_DBLCLICK_ROW_COL type I value 3. "#EC NOTEXT
  constants EVT_DELAYED_CHANGE_SELECTION type I value 7. "#EC NOTEXT
  constants EVT_DELAYED_MOVE_CURRENT_CELL type I value 5. "#EC NOTEXT
  constants EVT_ENTER type I value 19. "#EC NOTEXT
  constants EVT_F1 type I value 4. "#EC NOTEXT
  constants EVT_F4 type I value 17. "#EC NOTEXT
  constants EVT_HSCROLL type I value 20. "#EC NOTEXT
  constants EVT_MODIFIED type I value 18. "#EC NOTEXT
  constants EVT_SOS type I value 23. "#EC NOTEXT
  constants EVT_TAB_CHANGE type I value 16. "#EC NOTEXT
  constants EVT_TOOLBAR_BUTTON_CLICK type I value 10. "#EC NOTEXT
  constants EVT_TOOLBAR_MENUBUTTON_CLICK type I value 11. "#EC NOTEXT
  constants EVT_TOOLBAR_MENU_SELECTED type I value 14. "#EC NOTEXT
  constants EVT_TOTAL_CLICK_ROW_COL type I value 12. "#EC NOTEXT
  constants EVT_VSCROLL type I value 21. "#EC NOTEXT
  constants _EVT_REQUEST_DATA type I value 38. "#EC NOTEXT
  data MT_TEXTPOOL type LVC_T_TXTP .
  data M_ALVEXP_CONTROL type ref to CL_GUI_CONTROL .
  data M_BATCH_MODE type CHAR01 .
  data M_BUF_MT_INFO type LVC_T_INFO .
  data M_CRYSTAL_RETURN_URL type CHAR1024 .
  data M_CRYSTAL_URL type BDS_URI .
  data M_CR_DATASOURCE_STRING type CHAR80 .
  type-pools CNTL .
  data M_CR_FADRIVER_HANDLE type CNTL_HANDLE .
  data M_DBGPARENT type ref to CL_GUI_CONTAINER .
  data M_DP_ON_DEMAND type ref to CL_GUI_DATAPONDEMAND .
  data M_DYNAMIC_DATA_ACTIVE type CHAR01 .
  data M_GUI_TYPE type I .
  constants M_GUI_TYPE_EXCEL type I value 4. "#EC NOTEXT
  constants M_GUI_TYPE_HTML type I value 3. "#EC NOTEXT
  constants M_GUI_TYPE_JAVA type I value 2. "#EC NOTEXT
  constants M_GUI_TYPE_WINDOWS type I value 1. "#EC NOTEXT
  data M_HEIGHT_TOOLBAR type I value 27. "#EC NOTEXT .  .  .  .  .  .  . " .
  data M_INT_I_WEB type I .
  data M_OI_CONTROL type ref to I_OI_OLE_CONTAINER_CONTROL .
  data M_OI_LINK_SERVER type ref to I_OI_LINK_SERVER .
  data M_OI_MT_DATA_FIELDS type LVC_T_RFCFIELDS .
  data M_OI_MT_INFO_FIELDS type LVC_T_RFCFIELDS .
  data M_OI_PROXY type ref to I_OI_DOCUMENT_PROXY .
  type-pools SOI .
  data M_OI_RETCODE type SOI_RET_STRING .
  data M_OI_SPREADSHEET type ref to I_OI_SPREADSHEET .
  data M_OI_TABLE_COLL type ref to I_OI_TABLE_COLLECTION .
  constants M_TITLE_SIZE_LARGE type I value 3. "#EC NOTEXT
  constants M_TITLE_SIZE_NORMAL type I value 2. "#EC NOTEXT
  constants M_TITLE_SIZE_SMALL type I value 1. "#EC NOTEXT
  data M_VIEW type UI_FUNC .
  data M_DP_ON_DEMAND_AVAIL type CHAR01 .
  data M_DP_ON_DEMAND_WRITABLE type CHAR01 .
  constants M_TITLE_SIZE_MEDIUM type I value 4. "#EC NOTEXT
  constants EVT_COPY_CLIPBOARD_FAILED type I value 34. "#EC NOTEXT
  data M_ACC_MODE type SAP_BOOL .
  constants M_GUI_TYPE_ITS_INT type I value 5. "#EC NOTEXT

  events TOOLBAR_MENUBUTTON_CLICK
    exporting
      value(FCODE) type C optional
      value(MENU_POS_X) type I optional
      value(MENU_POS_Y) type I optional .
  events CLICK_COL_HEADER
    exporting
      value(COL_ID) type C optional .
  events DELAYED_MOVE_CURRENT_CELL .
  events F1 .
  events DBLCLICK_ROW_COL
    exporting
      value(ROW_ID) type C optional
      value(COL_ID) type C optional .
  events CLICK_ROW_COL
    exporting
      value(ROW_ID) type C optional
      value(COL_ID) type C optional .
  events TOOLBAR_BUTTON_CLICK
    exporting
      value(FCODE) type C optional .
  events DOUBLE_CLICK_COL_SEPARATOR
    exporting
      value(COL_ID) type C optional .
  events DELAYED_CHANGE_SELECTION .
  events CONTEXT_MENU .
  events TOTAL_CLICK_ROW_COL
    exporting
      value(ROW_ID) type C optional
      value(COL_ID) type C optional .
  events CONTEXT_MENU_SELECTED
    exporting
      value(FCODE) type C optional .
  events TOOLBAR_MENU_SELECTED
    exporting
      value(FCODE) type C optional .
  events _REQUEST_DATA
    exporting
      value(FRAGMENTS) type STRING .

  methods _PREPARE_EXPORT .
  methods ALV_EXPORT_VIA_FE
    importing
      !MT_DATA type LVC_T_DATA
      !MT_INFO type LVC_T_INFO
      !FCODE type UI_FUNC .
  methods GET_DATA_TABLE_LINECOUNT
    returning
      value(LINECOUNT) type I .
  methods CLEAR_SELECTION
    exceptions
      ERROR .
  methods CREATE_VIEW_CRYSTAL
    importing
      !I_PARENT type ref to CL_GUI_CONTAINER optional
      !I_MODE type C optional
      !I_DOC_TYPE type SOI_DOCUMENT_TYPE default 'Excel.Sheet'
      !I_DOC_URL type BDS_URI
      !I_READ_ONLY type C default ' '
      !I_FADRIVER_HANDLE type CNTL_HANDLE
      !I_DATASOURCE_STRING type CHAR80
    exceptions
      ERROR
      DOCUMENT_NOT_FOUND
      APPLICATION_ERROR .
  methods CREATE_VIEW_OI
    importing
      !PARENT type ref to CL_GUI_CONTAINER optional
      !MODE type C optional
      !DOC_TYPE type SOI_DOCUMENT_TYPE default 'Excel.Sheet'
      !DOC_URL type BDS_URI
      !READ_ONLY type C default ' '
    exceptions
      ERROR
      DOCUMENT_NOT_FOUND
      APPLICATION_ERROR .
  methods DELETE_ALL_CELLS_BASE
    exceptions
      ERROR .
  methods DELETE_ALL_MENUS .
  methods DELETE_ALL_ROWS_BASE
    exceptions
      ERROR .
  methods DISPLAY_CONTEXT_MENU
    importing
      !CONTEXT_MENU type ref to CL_CTMENU
    exceptions
      ERROR .
  methods DISPLAY_TOOLBAR_MENU
    importing
      !TOOLBAR_MENU type ref to CL_CTMENU
      !POS_X type I
      !POS_Y type I
    exceptions
      ERROR .
  methods GET_COL_POS_ID2_BASE
    exporting
      !COL_POS_TABLE type LVC_T_CO01
    exceptions
      ERROR .
  methods GET_COL_POS_ID_BASE
    exporting
      !COL_POS_TABLE type LVC_T_COLL
    exceptions
      ERROR .
  methods GET_CURRENT_CELL_COL
    exporting
      !COL type I
    exceptions
      ERROR .
  methods GET_CURRENT_CELL_COL_ID
    exporting
      !COL_ID type LVC_S_COL
    exceptions
      ERROR .
  methods GET_CURRENT_CELL_ID2
    exporting
      !COL_ID type I
      !ROW_ID type LVC_S_ROID
    exceptions
      ERROR .
  methods GET_CURRENT_CELL_ROW
    exporting
      !ROW type I
    exceptions
      ERROR .
  methods GET_CURRENT_CELL_ROW_ID
    exporting
      !ROW_ID type LVC_S_ROW
    exceptions
      ERROR .
  methods GET_CURRENT_CELL_TEXT
    exporting
      !TEXT type C
    exceptions
      ERROR .
  methods GET_ENTER_KEY_MODE
    exporting
      !MODE type I
    exceptions
      ERROR .
  methods GET_FIRST_VISIBLE_COL
    exporting
      !COL type I
    exceptions
      ERROR .
  methods GET_FIRST_VISIBLE_COL_ID
    exporting
      !COL_ID type LVC_S_COL
    exceptions
      ERROR .
  methods GET_FIRST_VISIBLE_COL_ID2
    exporting
      !COL_ID type INT4
    exceptions
      ERROR .
  methods GET_FIRST_VISIBLE_ROW
    exporting
      !ROW type I
    exceptions
      ERROR .
  methods GET_FIRST_VISIBLE_ROW_ID
    exporting
      !ROW_ID type LVC_S_ROW
    exceptions
      ERROR .
  methods GET_FIRST_VISIBLE_ROW_ID2
    exporting
      !ROW_ID type LVC_S_ROID
    exceptions
      ERROR .
  methods GET_FIXED_COLS
    exporting
      !COLS type I
    exceptions
      ERROR .
  methods GET_GRID_MODIFIED
    exporting
      !MODIFIED type I
    exceptions
      ERROR .
  methods GET_GUI_TYPE
    returning
      value(GUI_TYPE) type INT4 .
  methods GET_HIGHEST_ROW_ID
    exporting
      !ROW_ID type I
    exceptions
      ERROR .
  methods GET_MODIFIED_CELLS
    exporting
      !CELL_TABLE type LVC_T_MOCE
    exceptions
      ERROR .
  methods GET_PAGINGPAGESIZE
    exporting
      !PAGINGPAGESIZE type INT4
    exceptions
      ERROR .
  methods GET_ROWS_MOVED
    exporting
      !MOVED type I
    exceptions
      ERROR .
  methods GET_ROW_DELETE_ALLOWED
    exporting
      !ALLOWED type I
    exceptions
      ERROR .
  methods GET_ROW_ID
    exporting
      !ROW_ID_TABLE type LVC_T_ROID
    exceptions
      ERROR .
  methods GET_ROW_INSERT_ALLOWED
    exporting
      !ALLOWED type I
    exceptions
      ERROR .
  methods GET_SELECTED_CELLS_BASE
    exporting
      !CELL_TABLE type LVC_T_CELL
    exceptions
      ERROR .
  methods GET_SELECTED_CELLS_BASE_ID2
    exporting
      !CELL_TABLE type LVC_T_CENO
    exceptions
      ERROR .
  methods GET_SELECTED_CELLS_BASE_RANGE
    exporting
      !CELL_TABLE type LVC_T_CEL1
    exceptions
      ERROR .
  methods GET_SELECTED_COLUMNS_BASE
    exporting
      !COL_TABLE type LVC_T_COL
    exceptions
      ERROR .
  methods GET_SELECTED_COLUMNS_BASE_ID2
    exporting
      !COL_TABLE type LVC_T_COL2
    exceptions
      ERROR .
  methods GET_SELECTED_ROWS_BASE
    exporting
      !ROW_TABLE type LVC_T_ROW
    exceptions
      ERROR .
  methods GET_SELECTED_ROWS_BASE_RANGE
    exporting
      !ROW_TABLE type LVC_T_SELE
    exceptions
      ERROR .
  methods GET_SELECTED_ROWS_ID_BASE
    exporting
      !ROW_TABLE type LVC_T_ROID
    exceptions
      ERROR .
  methods GET_TOOLBAR_WRAP
    exporting
      !WRAP type I
    exceptions
      ERROR .
  methods GET_TOTAL_ARROWS
    exporting
      !VISIBLE type I
    exceptions
      ERROR .
  methods GET_TOTAL_EXPANDERS
    exporting
      !VISIBLE type I
    exceptions
      ERROR .
  methods HOST_IFRAME
    importing
      value(I_URL) type CHAR1024
      value(I_ON) type FLAG default 'X'
    exceptions
      ERROR .
  methods ON_CLOSE_DOCUMENT
    for event ON_CLOSE_DOCUMENT of I_OI_DOCUMENT_PROXY .
  methods ON_CUSTOM_EVENT
    for event ON_CUSTOM_EVENT of I_OI_DOCUMENT_PROXY .
  methods ON_OI_CUSTOM_EVENT
    for event ON_CUSTOM_EVENT of I_OI_DOCUMENT_PROXY
    importing
      !DOCUMENT_PROXY
      !EVENT_NAME
      !PARAM1
      !PARAM10
      !PARAM11
      !PARAM12
      !PARAM2
      !PARAM3
      !PARAM4
      !PARAM5
      !PARAM6
      !PARAM7
      !PARAM8
      !PARAM9
      !PARAM_COUNT .
  methods OPEN_BROWSER_WINDOW
    importing
      value(I_URL) type CHAR1024
    exceptions
      ERROR .
  methods OPTIMIZE_ALL_COLS
    importing
      !INCLUDE_HEADER type I default 1
    exceptions
      ERROR .
  methods OPTIMIZE_COL
    importing
      !INCLUDE_HEADER type I default 1
      !COL type I
    exceptions
      ERROR .
  methods OPTIMIZE_COL_ID
    importing
      !INCLUDE_HEADER type I default 1
      !COL_ID type LVC_S_COL
    exceptions
      ERROR .
  methods OPTIMIZE_SELECTED_COLS
    importing
      !INCLUDE_HEADER type I default 1
    exceptions
      ERROR .
  methods PREPARE_OI_TABLES .
  methods REFRESH_OI_TABLES .
  methods SCROLL_TO_BOTTOM
    exceptions
      ERROR .
  methods SELECT_ALL_ROWS
    exceptions
      ERROR .
  methods SELECT_TEXT_IN_CURRENT_CELL
    importing
      !FROM type I
      !TO type I
    exceptions
      ERROR .
  methods SET_3D_BORDER_BASE
    importing
      !BORDER type I
    exceptions
      ERROR .
  methods SET_AUTO_REDRAW
    importing
      !ENABLE type I
    exceptions
      ERROR .
  methods SET_COL_HEADER_STYLE
    importing
      !STYLE type I
    exceptions
      ERROR .
  methods SET_COL_HEADER_VISIBLE
    importing
      !VISIBLE type I
    exceptions
      ERROR .
  methods SET_COL_WIDTH_ID
    importing
      !COL_ID type LVC_S_COL
      !WIDTH type I
    exceptions
      ERROR .
  methods SET_CURRENT_CELL_BASE
    importing
      !ROW type I
      !COL type I
    exceptions
      ERROR .
  methods SET_CURRENT_CELL_ID
    importing
      !ROW_ID type LVC_S_ROW
      !COL_ID type LVC_S_COL
    exceptions
      ERROR .
  methods SET_CURRENT_CELL_ID2
    importing
      !ROW_ID type LVC_S_ROID
      !COL_ID type INT4
    exceptions
      ERROR .
  methods SET_CURRENT_CELL_ROWPOS_COLID
    importing
      !ROW type I
      !COL_ID type LVC_S_COL
    exceptions
      ERROR .
  methods SET_DATA_TABLE
    importing
      !NO_OF_LINES type I optional
      !FIRST_LINE type I default 1
    changing
      !DATA_TABLE type LVC_T_DATA
    exceptions
      ERROR .
  methods SET_DELAY_CHANGE_SELECTION
    importing
      !TIME type I
    exceptions
      ERROR .
  methods SET_DELAY_MOVE_CURRENT_CELL
    importing
      !TIME type I
    exceptions
      ERROR .
  methods SET_DELTA_TABLE
    importing
      !MODIFIED type C optional
    changing
      !DELTA_TABLE type LVC_T_MOCE
    exceptions
      ERROR .
  methods SET_DRAGDROPID_GRID_BORDER
    importing
      !DRAGDROPID type LVC_DDID
    exceptions
      ERROR .
  methods SET_DRAGDROPID_GRID_CELLS
    importing
      !DRAGDROPID type LVC_DDID
    exceptions
      ERROR .
  methods SET_DRAG_DROP_COLS
    importing
      !ENABLE type I
    exceptions
      ERROR .
  methods SET_DRAG_DROP_FIXED_COLS
    importing
      !ENABLE type I
    exceptions
      ERROR .
  methods SET_DRAG_DROP_FIXED_ROWS
    importing
      !ENABLE type I
    exceptions
      ERROR .
  methods SET_DRAG_DROP_ROWS
    importing
      !ENABLE type I
    exceptions
      ERROR .
  methods SET_DROP_DOWN_ITEMS
    importing
      !DD_ITEMS type LVC_T_DROP
    exceptions
      ERROR .
  methods SET_ENTER_KEY_MODE
    importing
      !MODE type I
    exceptions
      ERROR .
  methods SET_ERRORLOGHANDLE
    importing
      !IR_ALV type ref to CL_GUI_ALV_GRID_BASE .
  methods SET_ERROR_CELLS
    importing
      !CELL_TABLE type LVC_T_ERR
    exceptions
      ERROR .
  methods SET_FIRST_VISIBLE_COL
    importing
      !COL type I
    exceptions
      ERROR .
  methods SET_FIRST_VISIBLE_COL_ID
    importing
      !COL_ID type LVC_S_COL
    exceptions
      ERROR .
  methods SET_FIRST_VISIBLE_COL_ID2
    importing
      !COL_ID type INT4
    exceptions
      ERROR .
  methods SET_FIRST_VISIBLE_ROW
    importing
      !ROW type I
    exceptions
      ERROR .
  methods SET_FIRST_VISIBLE_ROW_ID
    importing
      !ROW_ID type LVC_S_ROW
    exceptions
      ERROR .
  methods SET_FIRST_VISIBLE_ROW_ID2
    importing
      !ROW_ID type LVC_S_ROID
    exceptions
      ERROR .
  methods SET_FIXED_COLS
    importing
      !COLS type I
    exceptions
      ERROR .
  methods SET_FIXED_ROWS
    importing
      !ROWS type I
    exceptions
      ERROR .
  methods SET_GRID_READONLY
    importing
      !READONLY type I
    exceptions
      ERROR .
  methods SET_HEADER_FOR_OI
    importing
      !IT_HEADER type LVC_T_HEAD .
  methods SET_HIGHEST_ROW_ID
    importing
      !ROW_ID type I
    exceptions
      ERROR .
  methods SET_HORIZONTAL_GRID_LINES
    importing
      !VISIBLE type I
    exceptions
      ERROR .
  methods SET_HORIZONTAL_SCROLLBARS
    importing
      !ENABLE type I
    exceptions
      ERROR .
  methods SET_HYPERLINKS
    importing
      !LINKS_TABLE type LVC_T_HYPE
    exceptions
      ERROR .
  methods SET_INFO_TABLE
    importing
      !INFO_TABLE type LVC_T_INFO
    exceptions
      ERROR .
  methods SET_LEFT_COL_SYNC
    importing
      !GRID type ref to CL_GUI_ALV_GRID_BASE optional
    exceptions
      ERROR .
  methods SET_PAGINGPAGESIZE
    importing
      !PAGINGPAGESIZE type INT4
    exceptions
      ERROR .
  methods SET_RESIZE_COLS
    importing
      !ENABLE type I
    exceptions
      ERROR .
  methods SET_RESIZE_ROWS
    importing
      !ENABLE type I
    exceptions
      ERROR .
  methods SET_ROWS_MOVED
    importing
      !MOVED type I
    exceptions
      ERROR .
  methods SET_ROW_DELETE_ALLOWED
    importing
      !ALLOWED type I
    exceptions
      ERROR .
  methods SET_ROW_HEADER_VISIBLE
    importing
      !VISIBLE type I
    exceptions
      ERROR .
  methods SET_ROW_ID
    importing
      !ROW_ID_TABLE type LVC_T_ROID
    exceptions
      ERROR .
  methods SET_ROW_INSERT_ALLOWED
    importing
      !ALLOWED type I
    exceptions
      ERROR .
  methods SET_SELECTED_CELLS_BASE
    importing
      !CELL_TABLE type LVC_T_CELL
    exceptions
      ERROR .
  methods SET_SELECTED_CELLS_BASE_ID2
    importing
      !CELL_TABLE type LVC_T_CENO
      !KEEP_OTHER_SELECTIONS type CHAR01 optional
    exceptions
      ERROR .
  methods SET_SELECTED_CELLS_BASE_RANGE
    importing
      !CELL_TABLE type LVC_T_CEL1
    exceptions
      ERROR .
  methods SET_SELECTED_COLUMNS_BASE
    importing
      !COL_TABLE type LVC_T_COL
    exceptions
      ERROR .
  methods SET_SELECTED_COLUMNS_BASE_ID2
    importing
      !COL_TABLE type LVC_T_COL2
      !KEEP_OTHER_SELECTIONS type CHAR01 optional
    exceptions
      ERROR .
  methods SET_SELECTED_ROWS_BASE
    importing
      !ROW_TABLE type LVC_T_ROW
    exceptions
      ERROR .
  methods SET_SELECTED_ROWS_BASE_RANGE
    importing
      !ROW_TABLE type LVC_T_SELE
    exceptions
      ERROR .
  methods SET_SELECTED_ROWS_ID_BASE
    importing
      !ROW_TABLE type LVC_T_ROID
      !KEEP_OTHER_SELECTIONS type CHAR01 optional
    exceptions
      ERROR .
  methods SET_SELECTION_MODE_BASE
    importing
      !MODE type I
    exceptions
      ERROR .
  methods SET_SINGLE_COL_AUTO_RESIZE
    importing
      !ENABLE type I
    exceptions
      ERROR .
  methods SET_TABS
    importing
      !TAB_TABLE type LVC_T_TABS
    exceptions
      ERROR .
  methods SET_TEXTPOOL
    exceptions
      ERROR .
  methods SET_TITLE_SIZE
    importing
      !SIZE type I
    exceptions
      ERROR .
  methods SET_TITLE_STYLE
    importing
      !STYLE type I
    exceptions
      ERROR .
  methods SET_TITLE_TEXT
    importing
      !TEXT type C
    exceptions
      ERROR .
  methods SET_TOOLBAR_BUTTONS
    importing
      !TOOLBAR_TABLE type TTB_BUTTON
    exceptions
      ERROR .
  methods SET_TOOLBAR_MENU_STATIC
    importing
      !TOOLBAR_MENU type ref to CL_CTMENU
      !FUNCTION type UI_FUNC
    exceptions
      ERROR .
  methods SET_TOOLBAR_STYLE
    importing
      !STYLE type I
    exceptions
      ERROR .
  methods SET_TOOLBAR_VISIBLE
    importing
      !VISIBLE type I
    exceptions
      ERROR .
  methods SET_TOOLBAR_WRAP
    importing
      !WRAP type I
    exceptions
      ERROR .
  methods SET_TOTAL_ARROWS
    importing
      !VISIBLE type I
    exceptions
      ERROR .
  methods SET_TOTAL_EXPANDERS
    importing
      !VISIBLE type I
    exceptions
      ERROR .
  methods SET_TOTAL_LINES_ABOVE
    importing
      !ABOVE type I
    exceptions
      ERROR .
  methods SET_VERTICAL_GRID_LINES
    importing
      !VISIBLE type I
    exceptions
      ERROR .
  methods SET_VERTICAL_SCROLLBARS
    importing
      !ENABLE type I
    exceptions
      ERROR .
  methods SET_VIEW_CRYSTAL
    importing
      value(I_DOC_URL) type BDS_URI optional
      !I_FADRIVER_HANDLE type CNTL_HANDLE
      !I_DATASOURCE_STRING type CHAR80
    exceptions
      FAILED .
  methods SET_VIEW_EXCEL
    importing
      value(I_DOC_URL) type BDS_URI optional
    exceptions
      FAILED .
  methods SET_VIEW_LOTUS
    importing
      value(I_DOC_URL) type BDS_URI optional
    exceptions
      FAILED .
  methods SET_VISIBLE_VIEW
    importing
      value(I_VIEW) type UI_FUNC .
  methods SET_WEB_OPTIONS
    importing
      !WEBLOOK type LVC_LOOK optional
      !WEBSTYLE type LVC_STYLE optional
      !WEBROWS type LVC_WEBROW optional
      !WEBXWIDTH type INT4 optional
      !WEBXHEIGHT type INT4 optional
      !WEBPAGINGSIZE type INT4 optional
    exceptions
      ERROR .
  methods UPDATE_FRONTEND .
  methods ON_BEFORE_SEND
    for event BEFORE_SEND of CL_DATAPTABLECACHE
    importing
      !FIRSTLINE
      !LASTLINE .
  methods APPEND_ROWS_BASE
    importing
      !ROW_COUNT type I
    exceptions
      ERROR .
  methods SET_CLIPBOARD_ACTIVE
    importing
      !ACTIVE type I
    exceptions
      ERROR .
  methods SET_COLOR_INFO
    importing
      !COLOR_STYLE type I
      !INFO type C .
  methods SET_SYMBOL_INFO
    importing
      !SYMBOL type CHAR01
      !INFO type C .
  methods CLEAR_COLOR_INFO .
  methods CLEAR_SYMBOL_INFO .
  methods _INIT_MEMBERS_BASE .
private section.

  types:
*"* private components of class CL_GUI_ALV_GRID_BASE
*"* do not include other source files here!!!
    begin of s_colid_to_fieldname,
         col_id type int4,
         fieldname type lvc_fname,
       end of s_colid_to_fieldname .
  types:
    t_colid_to_fieldname type standard table of s_colid_to_fieldname .

  data M_GUI_TYPE_FLOW type I value 5. "#EC NOTEXT . " .
  data CATT_ACTIVE type CHAR01 .
  data CATT_PLAYBACK type CHAR01 .
  data CATT_RECORDING type CHAR01 .
  data MT_ROW_ID_CACHE type LVC_T_ROID .
  type-pools T .
  data M_COLID_TO_FIELDNAME type T_COLID_TO_FIELDNAME .
  data M_COL_POS_TABLE type LVC_T_CO01 .
  data M_COL_POS_TABLE_VALID type CHAR01 .
  data M_DP_COL_POS_TABLE type ref to CL_GUI_DATAPONDEMAND .
  data M_DP_SELECTED_COLS type ref to CL_GUI_DATAPONDEMAND .
  data M_FIRST_VISIBLE_COL_ID type INT4 .
  data M_FIRST_VISIBLE_ROW_ID type LVC_S_ROID .
  data M_NUMBER_TOOLBAR_BUTTONS type I .
  data M_PAGINGPAGESIZE type INT4 .
  data M_SELECTED_COLS type LVC_T_COL2 .
  data M_TOOLBAR_VISIBLE type I value 1. "#EC NOTEXT . " .
  data M_WAN_FLAG type CHAR01 .
  data M_DP_MODIFIED_CELLS type ref to CL_GUI_DATAPONDEMAND .
  data MT_MODIFIED_CELLS type LVC_T_MOCE .
  data M_DP_ROW_ID type ref to CL_GUI_DATAPONDEMAND .
  data M_GRID_READONLY type I value 1. "#EC NOTEXT . " .
  data M_ENTER_KEY_MODE type I value 1. "#EC NOTEXT . " .
  data M_SELECTION_MODE type I value 0. "#EC NOTEXT . " .
  data M_TOTAL_EXPANDERS type I value 1. "#EC NOTEXT . " .
  data M_SINGLE_COL_AUTO_RESIZE type I value 1. "#EC NOTEXT . " .
  data M_ROW_DELETE_ALLOWED type I value 1. "#EC NOTEXT . " .
  data M_ROW_INSERT_ALLOWED type I value 1. "#EC NOTEXT . " .
  data M_TITLE_SIZE type I value 3. "#EC NOTEXT . " .
  data M_HORIZONTAL_GRID_LINES type I value 1. "#EC NOTEXT . " .
  data M_VERTICAL_GRID_LINES type I value 1. "#EC NOTEXT . " .
  data M_TITLE_TEXT type STRING .
  data M_TITLE_STYLE type I value 8192. "#EC NOTEXT . " .
  data M_COL_HEADER_STYLE type I .
  data M_COL_HEADER_VISIBLE type I value 1. "#EC NOTEXT . " .
  data M_DRAGDROPID_GRID_CELLS type I .
  data M_DRAGDROPID_GRID_BORDER type I .
  data M_CLIPBOARD_ACTIVE type I value 1. "#EC NOTEXT . " .
  data M_AUTO_REDRAW type I .
  data M_TOOLBAR_WRAP type I value 1. "#EC NOTEXT . " .
  data M_SELECTED_ROWS type LVC_T_ROID .
  data M_DP_SELECTED_ROWS type ref to CL_GUI_DATAPONDEMAND .
  data M_CACHE_SELECTED_ROWS type ABAP_BOOL .

  methods REMOVE_OI_OBJECTS .
  type-pools OLE2 .
ENDCLASS.