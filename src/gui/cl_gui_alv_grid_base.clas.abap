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



CLASS CL_GUI_ALV_GRID_BASE IMPLEMENTATION.


method ALV_EXPORT_VIA_FE.
* ...


endmethod.


METHOD APPEND_ROWS_BASE .

  CALL METHOD CALL_METHOD
  EXPORTING
       METHOD    = 'AppendRows'
       P_COUNT   = 1
       P1        = ROW_COUNT
   EXCEPTIONS
      OTHERS = 1.
  IF SY-SUBRC NE 0.
    RAISE ERROR.
  ENDIF.

ENDMETHOD.


method CLEAR_COLOR_INFO.

  if m_acc_mode is not initial.            "TRUE
    CALL METHOD CALL_METHOD
      EXPORTING
        METHOD = 'ClearColorInfo'
      EXCEPTIONS
        OTHERS = 1.
  endif.

endmethod.


METHOD CLEAR_SELECTION .

  CALL METHOD CALL_METHOD
  EXPORTING
       METHOD    = 'ClearSelection'
   EXCEPTIONS
      OTHERS = 1.
  IF SY-SUBRC NE 0.
    RAISE ERROR.
  ENDIF.

ENDMETHOD.


method CLEAR_SYMBOL_INFO.

  if m_acc_mode is not initial.            "TRUE
    CALL METHOD CALL_METHOD
      EXPORTING
        METHOD = 'ClearColorInfo'
      EXCEPTIONS
        OTHERS = 1.
  endif.

endmethod.


METHOD constructor.

  DATA clsid(80).
  CONSTANTS: con_hex02      TYPE x VALUE '02'.    " Druckmodus
  IF NOT activex IS INITIAL.
    clsid = 'SAPGUI.GridViewCtrl.1'.
  ENDIF.

  IF NOT javabean IS INITIAL.
    clsid = 'com.sap.components.controls.grid.SapGrid'.
  ENDIF.
  "
  IF NOT cl_gui_alv_grid=>offline( ) IS INITIAL.
* if sy-subty o con_hex02.
    CLEAR clsid.
  ENDIF.

  CALL METHOD super->constructor
    EXPORTING
      clsid      = clsid
      shellstyle = shellstyle
      lifetime   = lifetime
      parent     = parent
      name       = name.

  m_gui_type = get_gui_type( ).

  CALL FUNCTION 'SAPGUI_GET_WAN_FLAG'
    IMPORTING
      wan_flag = m_wan_flag.

  CALL METHOD cl_gui_datapondemand=>get_is_avail
    RECEIVING
      is_supported = m_dp_on_demand_avail.

  CALL METHOD cl_gui_datapondemand=>get_is_writeable
    RECEIVING
      is_supported = m_dp_on_demand_writable.

  CALL FUNCTION 'CAT_IS_ACTIVE'
    IMPORTING
      active    = catt_active
      recording = catt_recording
      playback  = catt_playback.

*... RFC Call of ALV Y6BK075863
  data: is_gui_available type abap_bool.
  call function 'GUI_IS_AVAILABLE'
   IMPORTING
     RETURN        = is_gui_available.

*... submit <report> list to memory
  data: list_to_memory   type abap_bool.
  system-call kernel_info 'LIST_TO_MEMORY' list_to_memory.

  if sy-subty o con_hex02
  or sy-batch = 'X'
  or list_to_memory   eq abap_true    "Y6BK075863
  or is_gui_available eq abap_false.
    m_batch_mode = 'X'.
  ENDIF.

  CALL METHOD cl_gui_cfw=>subscribe
    EXPORTING
      shellid = h_control-shellid
      ref     = me.

* currently the shellid is used as the "guid" to spare the
*  function call.
  m_guid = h_control-shellid.
* once this is dropped, make sure to transport the guid to the frontend!


  IF m_batch_mode IS INITIAL AND cl_gui_alv_grid=>offline( ) IS INITIAL.
* Register cached properties
    CALL METHOD register_cached_property
      EXPORTING
        property = 'CurrentCellRow'.
    CALL METHOD register_cached_property
      EXPORTING
        property = 'CurrentCellCol'.
    CALL METHOD register_cached_property
      EXPORTING
        property = 'FirstVisibleRow'.
    CALL METHOD register_cached_property
      EXPORTING
        property = 'FirstVisibleRowID'.
    CALL METHOD register_cached_property
      EXPORTING
        property = 'FirstVisibleColID'.
    CALL METHOD register_cached_property
      EXPORTING
        property = 'CurrentCellRowID'.
    CALL METHOD register_cached_property
      EXPORTING
        property = 'CurrentCellColID'.
    CALL METHOD register_cached_property
      EXPORTING
        property = 'CurrentCellRowIDNumeric'.
    CALL METHOD register_cached_property
      EXPORTING
        property = 'CurrentCellRowIDSubNumeric'.
    CALL METHOD register_cached_property
      EXPORTING
        property = 'RowsMoved'.
    CALL METHOD register_cached_property
      EXPORTING
        property = 'GridModified'.
    CALL METHOD register_cached_property
      EXPORTING
        property = 'CurrentCellText'.
  ENDIF.

*data cont type ref to cl_gui_dialogbox_container.
  m_dbgparent = debugparent.

* set textpool buffer for frontend transfer.
  IF ( me->www_active = 'X' ).
    DATA wa_txtpool TYPE lvc_s_txtp.

* F1-Help.
    wa_txtpool-tag = 'F1'. wa_txtpool-text = 'F1-Hilfe'(001).
                                                            "F1-Help"
    APPEND wa_txtpool TO mt_textpool.
    wa_txtpool-tag = 'F1ICON'. wa_txtpool-text = icon_information.
                                                            "F1-Icon.
    APPEND wa_txtpool TO mt_textpool.

* Mark all button
    wa_txtpool-tag ='MARKALL'. wa_txtpool-text = text-024. "optimal
    APPEND wa_txtpool TO mt_textpool.

* paging
    wa_txtpool-tag ='PAGE'.
    wa_txtpool-text = 'Seite'(005).
    APPEND wa_txtpool TO mt_textpool.

    wa_txtpool-tag ='FIRSTPAGE'.
    wa_txtpool-text = 'Erste Seite'(030).
    APPEND wa_txtpool TO mt_textpool.
    wa_txtpool-tag ='LASTPAGE'.
    wa_txtpool-text = 'Letzte Seite'(031).
    APPEND wa_txtpool TO mt_textpool.
    wa_txtpool-tag ='PREVPAGE'.
    wa_txtpool-text = 'Vorherige Seite'(032).
    APPEND wa_txtpool TO mt_textpool.
    wa_txtpool-tag ='NEXTPAGE'.
    wa_txtpool-text = 'Nächste Seite'(033).
    APPEND wa_txtpool TO mt_textpool.

    IF cl_gui_alv_grid=>offline( ) IS INITIAL.
      CALL METHOD set_textpool.
    ENDIF.

  ENDIF.

* check Accessibility mode
  CALL FUNCTION 'GET_ACCESSIBILITY_MODE'
    IMPORTING
      accessibility     = m_acc_mode
    EXCEPTIONS
      its_not_available = 1
      OTHERS            = 2.

  CALL METHOD CL_GUI_FRONTEND_SERVICES=>CHECK_GUI_SUPPORT
    EXPORTING
      COMPONENT            = 'gridview'
      FEATURE_NAME         = 'cacheselectedrows'
    RECEIVING
      RESULT               = m_cache_selected_rows
    EXCEPTIONS
      others               = 1.

ENDMETHOD.


method CREATE_VIEW_CRYSTAL .
* ...
 data alvexp_control type ref to lcl_alvexp_control.
 IF m_alvexp_control IS INITIAL.
    create object alvexp_control exporting i_parent = i_parent.
    m_alvexp_control = alvexp_control.
 endif.
 m_crystal_url = i_doc_url.
 m_cr_fadriver_handle = i_fadriver_handle.
 m_cr_datasource_string = i_datasource_string.
endmethod.


METHOD create_view_oi .
* ...

  CASE mode.

    WHEN 'EE'.
*   explace-view

      IF m_oi_control IS INITIAL.
        DATA :
               office TYPE REF TO i_oi_document_factory,
               document TYPE REF TO i_oi_document_proxy.
        CALL METHOD c_oi_factory_creator=>get_document_factory
                   EXPORTING
                        factory_type  =  'OLE'
                   IMPORTING
                        factory  = office
                        retcode  =  m_oi_retcode.

        CALL METHOD office->start_factory
              EXPORTING
                    r3_application_name = 'ALV'
              IMPORTING
                     retcode  =  m_oi_retcode.

*        CALL METHOD office->get_link_server
*             IMPORTING
*                    link_server = m_oi_link_server.
*
*        CALL METHOD m_oi_link_server->start_link_server.
*
*        if sy-uname ne 'FILDEBRANDT'.
*          CALL METHOD office->get_table_collection
*                          IMPORTING table_collection = m_oi_table_coll
*                                    retcode = m_oi_retcode.
*          CALL METHOD prepare_oi_tables.
*        endif.

        CALL METHOD office->get_document_proxy
             EXPORTING
                   document_type = doc_type
             IMPORTING
                   document_proxy =  m_oi_proxy
                   retcode        =  m_oi_retcode.
      ENDIF.                           "  if m_oi_control is initial

      CALL METHOD m_oi_proxy->open_document
           EXPORTING
                 document_url   =  doc_url
                 open_inplace   =  ''
           IMPORTING
                 retcode        = m_oi_retcode.

      IF m_oi_retcode = 'OPEN_DOCUMENT_FAILED'.
        RAISE application_error.
      ENDIF.

      CALL METHOD m_oi_proxy->get_spreadsheet_interface
                  IMPORTING sheet_interface = m_oi_spreadsheet.


    WHEN 'E'.
*  Inplace-view:
      IF m_oi_control IS INITIAL.

        CALL METHOD c_oi_ole_control_creator=>get_ole_container_control
                          IMPORTING control = m_oi_control
                                    retcode = m_oi_retcode.
        CALL METHOD c_oi_errors=>show_message
                                      EXPORTING type = 'E'.

        CALL METHOD m_oi_control->init_control
                            EXPORTING r3_application_name =
                                         'ALV' "#EC NOTEXT
                                      inplace_enabled = 'X'
                                      inplace_scroll_documents = 'X'
                                      parent = parent
                                      register_on_close_event = 'X'
                                      register_on_custom_event = 'X'
                            IMPORTING retcode = m_oi_retcode.
        DATA ref_control TYPE REF TO cl_gui_control.
        DATA i_oi_container_control TYPE REF TO i_oi_container_control.
        i_oi_container_control ?= m_oi_control.
        CALL METHOD i_oi_container_control->get_control_object
            IMPORTING control = ref_control.
        call method ref_control->set_metric
          exporting metric = metric_pixel.

        if ( m_toolbar_visible = 1 ) and
           ( m_number_toolbar_buttons gt 0 ).
          CALL METHOD ref_control->set_position
            EXPORTING top = m_height_toolbar.
        else.
          CALL METHOD ref_control->set_position
            EXPORTING top = 0.
        endif.

        DATA align TYPE int4.
        align = cl_gui_control=>align_at_left +
               cl_gui_control=>align_at_right +
               cl_gui_control=>align_at_bottom.

        CALL METHOD ref_control->set_alignment
        EXPORTING    alignment =  align.


        CALL METHOD c_oi_errors=>show_message
                                      EXPORTING type = 'E'.

        CALL METHOD m_oi_control->get_document_proxy
                 EXPORTING document_type = doc_type
                 IMPORTING document_proxy = m_oi_proxy
                           retcode = m_oi_retcode.
        IF m_oi_retcode NE c_oi_errors=>ret_ok.
          EXIT.
        ENDIF.

        SET HANDLER on_oi_custom_event FOR m_oi_proxy.

* necessary step in second call of the Excel View, works
* with same URL as first time and publish it again to the DP
        data:
            protocol  type string,
            namespace type CNDP_ASYNC_NAME,
            key       type CNDP_ASYNC_KEY,
            l_doc_url type bds_uri,
            l_result  type string.
        l_doc_url = doc_url.
        translate l_doc_url to upper case.  "#EC TRANSLANG
        split doc_url at '://' into protocol l_result.
        case protocol.
          when 'FILE'.
            namespace = 'File://'.     "#EC NOTEXT
            key       = l_result.
          when others.
            split l_result at '/' into namespace key.
        endcase.
        l_doc_url = doc_url.
        call function 'DP_PUBLISH_URL'
          exporting
            namespace                   = namespace
            key                         = key
*           LIFETIME                    =
          changing
            url                         = l_doc_url
          EXCEPTIONS
            DP_INVALID_PARAMETERS       = 1
            DP_NO_CACHE                 = 2
            DP_ERROR_GENERAL            = 3
            DATA_SOURCE_ERROR           = 4
            DP_SEND_DATA_ERROR          = 5
            GENERAL_ERROR               = 6
            OTHERS                      = 7
                  .
        if sy-subrc <> 0.
          RAISE application_error.
        endif.
* second call of Excel view

        CALL METHOD m_oi_proxy->open_document
                               EXPORTING document_url = doc_url
                                         open_inplace  = 'X'
                                         open_readonly = 'X'
                               IMPORTING retcode = m_oi_retcode.
*    CALL METHOD c_oi_errors=>show_message EXPORTING type = 'E'.
        IF m_oi_retcode = 'OPEN_DOCUMENT_FAILED'
        or m_oi_retcode = 'CONTROL_INTERNAL_ERROR'.
          RAISE application_error.
        ENDIF.
        CALL METHOD m_oi_proxy->get_spreadsheet_interface
                           IMPORTING sheet_interface = m_oi_spreadsheet.
        IF NOT m_oi_spreadsheet IS INITIAL.
          CALL METHOD m_oi_spreadsheet->load_lib.
        ENDIF.
      ELSE.
     " M_OI_CONTROL IS INITIALIZED, try just to reset the Document.
     " This does not work, since the other documents are not
     " closed/unloaded
     " and the "last" document set this way is not even made the active
     " document.

*            CALL METHOD m_oi_control->get_document_proxy
*                 EXPORTING document_type = doc_type
*                 IMPORTING document_proxy = m_oi_proxy
*                           retcode = m_oi_retcode.
*        IF m_oi_retcode NE c_oi_errors=>ret_ok.
*          EXIT.
*        ENDIF.
*
*        SET HANDLER on_oi_custom_event FOR m_oi_proxy.
*
*        CALL METHOD m_oi_proxy->open_document
*                               EXPORTING document_url = doc_url
*                                         open_inplace  = 'X'
*                                         open_readonly = 'X'
*                               IMPORTING retcode = m_oi_retcode.
**    CALL METHOD c_oi_errors=>show_message EXPORTING type = 'E'.
*        IF m_oi_retcode = 'OPEN_DOCUMENT_FAILED'.
*          RAISE application_error.
*        ENDIF.
*        CALL METHOD m_oi_proxy->get_spreadsheet_interface
*                           IMPORTING sheet_interface = m_oi_spreadsheet
*        IF NOT m_oi_spreadsheet IS INITIAL.
*          CALL METHOD m_oi_spreadsheet->load_lib.
*        ENDIF.
      ENDIF.
  ENDCASE.

ENDMETHOD.


METHOD DELETE_ALL_CELLS_BASE .

  CALL METHOD CALL_METHOD
  EXPORTING
       METHOD    = 'DeleteAllCells'
   EXCEPTIONS
      OTHERS = 1.
  IF SY-SUBRC NE 0.
    RAISE ERROR.
  ENDIF.
ENDMETHOD.


method DELETE_ALL_MENUS.
* obsolete
endmethod.


METHOD DELETE_ALL_ROWS_BASE .

  CALL METHOD CALL_METHOD
  EXPORTING
       METHOD    = 'DeleteAllRows'
   EXCEPTIONS
      OTHERS = 1.
  IF SY-SUBRC NE 0.
    RAISE ERROR.
  ENDIF.

ENDMETHOD.


METHOD DISPATCH.

  DATA ROW_ID(255) TYPE C.
  DATA COL_ID(255) TYPE C.
  DATA FCODE(255) TYPE C.
  DATA POS_X TYPE I.
  DATA POS_Y TYPE I.

  CASE EVENTID.
    WHEN EVT_CLICK_ROW_COL.
      CALL METHOD GET_EVENT_PARAMETER
          EXPORTING PARAMETER_ID = 0
                    QUEUE_ONLY = SPACE
         IMPORTING  PARAMETER = ROW_ID.
      CALL METHOD GET_EVENT_PARAMETER
          EXPORTING PARAMETER_ID = 1
                    QUEUE_ONLY = SPACE
         IMPORTING  PARAMETER = COL_ID.
      CALL METHOD CL_GUI_CFW=>FLUSH.
      RAISE EVENT CLICK_ROW_COL EXPORTING ROW_ID = ROW_ID
                                          COL_ID = COL_ID.

    WHEN EVT_TOTAL_CLICK_ROW_COL.
      CALL METHOD GET_EVENT_PARAMETER
          EXPORTING PARAMETER_ID = 0
                    QUEUE_ONLY = SPACE
         IMPORTING  PARAMETER = ROW_ID.
      CALL METHOD GET_EVENT_PARAMETER
          EXPORTING PARAMETER_ID = 1
                    QUEUE_ONLY = SPACE
         IMPORTING  PARAMETER = COL_ID.
      CALL METHOD CL_GUI_CFW=>FLUSH.
      RAISE EVENT TOTAL_CLICK_ROW_COL EXPORTING ROW_ID = ROW_ID
                                          COL_ID = COL_ID.

    WHEN EVT_DBLCLICK_ROW_COL.
      CALL METHOD GET_EVENT_PARAMETER
          EXPORTING PARAMETER_ID = 0
                    QUEUE_ONLY = SPACE
         IMPORTING  PARAMETER = ROW_ID.
      CALL METHOD GET_EVENT_PARAMETER
          EXPORTING PARAMETER_ID = 1
                    QUEUE_ONLY = SPACE
         IMPORTING  PARAMETER = COL_ID.
      CALL METHOD CL_GUI_CFW=>FLUSH.
      RAISE EVENT DBLCLICK_ROW_COL EXPORTING ROW_ID = ROW_ID
                                             COL_ID = COL_ID.

    WHEN EVT_F1.
      RAISE EVENT F1.

    WHEN EVT_DELAYED_MOVE_CURRENT_CELL.
      RAISE EVENT DELAYED_MOVE_CURRENT_CELL.

    WHEN EVT_CLICK_COL_HEADER.
      CALL METHOD GET_EVENT_PARAMETER
          EXPORTING PARAMETER_ID = 0
                    QUEUE_ONLY = SPACE
         IMPORTING  PARAMETER = COL_ID.
      CALL METHOD CL_GUI_CFW=>FLUSH.
      RAISE EVENT CLICK_COL_HEADER EXPORTING COL_ID = COL_ID.

    WHEN EVT_DELAYED_CHANGE_SELECTION.
      RAISE EVENT DELAYED_CHANGE_SELECTION.

    WHEN EVT_DBLCLICK_COL_SEPARATOR.
      CALL METHOD GET_EVENT_PARAMETER
          EXPORTING PARAMETER_ID = 0
                    QUEUE_ONLY = SPACE
         IMPORTING  PARAMETER = COL_ID.
      CALL METHOD CL_GUI_CFW=>FLUSH.
      RAISE EVENT DOUBLE_CLICK_COL_SEPARATOR EXPORTING COL_ID = COL_ID.

    WHEN EVT_CONTEXT_MENU.
      RAISE EVENT CONTEXT_MENU.

    WHEN EVT_TOOLBAR_BUTTON_CLICK.
      CALL METHOD GET_EVENT_PARAMETER
          EXPORTING PARAMETER_ID = 0
                    QUEUE_ONLY = SPACE
         IMPORTING  PARAMETER = FCODE.
      CALL METHOD CL_GUI_CFW=>FLUSH.
      RAISE EVENT TOOLBAR_BUTTON_CLICK EXPORTING FCODE = FCODE.

    WHEN EVT_TOOLBAR_MENUBUTTON_CLICK.
      CALL METHOD GET_EVENT_PARAMETER
          EXPORTING PARAMETER_ID = 0
                    QUEUE_ONLY = SPACE
         IMPORTING  PARAMETER = FCODE.
      CALL METHOD GET_EVENT_PARAMETER
          EXPORTING PARAMETER_ID = 1
                    QUEUE_ONLY = SPACE
         IMPORTING  PARAMETER = POS_X.
      CALL METHOD GET_EVENT_PARAMETER
          EXPORTING PARAMETER_ID = 2
                    QUEUE_ONLY = SPACE
         IMPORTING  PARAMETER = POS_Y.
      CALL METHOD CL_GUI_CFW=>FLUSH.
      RAISE EVENT TOOLBAR_MENUBUTTON_CLICK EXPORTING FCODE = FCODE
        MENU_POS_X = POS_X MENU_POS_Y = POS_Y.

      WHEN EVT_CONTEXT_MENU_SELECTED.
      CALL METHOD GET_EVENT_PARAMETER
          EXPORTING PARAMETER_ID = 0
                    QUEUE_ONLY = SPACE
         IMPORTING  PARAMETER = FCODE.
      CALL METHOD CL_GUI_CFW=>FLUSH.
      RAISE EVENT CONTEXT_MENU_SELECTED EXPORTING FCODE = FCODE.

      WHEN EVT_TOOLBAR_MENU_SELECTED.
      CALL METHOD GET_EVENT_PARAMETER
          EXPORTING PARAMETER_ID = 0
                    QUEUE_ONLY = SPACE
         IMPORTING  PARAMETER = FCODE.
      CALL METHOD CL_GUI_CFW=>FLUSH.
      RAISE EVENT TOOLBAR_MENU_SELECTED EXPORTING FCODE = FCODE.

  ENDCASE.
ENDMETHOD.


METHOD DISPLAY_CONTEXT_MENU .

  DATA GUIOBJECT TYPE REF TO CL_GUI_OBJECT.
  CALL METHOD CL_CTXMNU_MGR=>CREATE_PROXY
        EXPORTING MENU = CONTEXT_MENU
        CHANGING  GUIOBJECT = GUIOBJECT
  EXCEPTIONS EMPTY_OBJ = 1
             OTHERS = 2.
  IF SY-SUBRC EQ 2.
    RAISE ERROR.
  ENDIF.

 IF SY-SUBRC EQ 0.

  CALL METHOD CALL_METHOD
        EXPORTING METHOD = 'SetContextMenu'
                  P_COUNT   = 1
                  P1        = GUIOBJECT->H_CONTROL
  EXCEPTIONS OTHERS = 1.
  IF SY-SUBRC NE 0.
    RAISE ERROR.
  ENDIF.

  CALL METHOD GUIOBJECT->FREE
        EXCEPTIONS OTHERS = 1.
  IF SY-SUBRC NE 0.
    RAISE ERROR.
  ENDIF.
 ENDIF.
ENDMETHOD.





















METHOD DISPLAY_TOOLBAR_MENU .

  DATA GUIOBJECT TYPE REF TO CL_GUI_OBJECT.
  CALL METHOD CL_CTXMNU_MGR=>CREATE_PROXY
        EXPORTING MENU = TOOLBAR_MENU
        CHANGING  GUIOBJECT = GUIOBJECT
  EXCEPTIONS EMPTY_OBJ = 1
             OTHERS = 2.
  IF SY-SUBRC EQ 2.
    RAISE ERROR.
  ENDIF.

 IF SY-SUBRC EQ 0.
  CALL METHOD CALL_METHOD
        EXPORTING METHOD = 'SetToolBarMenu'
                  P_COUNT   = 3
                  P1        = GUIOBJECT->H_CONTROL
                  P2        = POS_X
                  P3        = POS_Y
  EXCEPTIONS OTHERS = 1.
  IF SY-SUBRC NE 0.
    RAISE ERROR.
  ENDIF.

  CALL METHOD GUIOBJECT->FREE
        EXCEPTIONS OTHERS = 1.
  IF SY-SUBRC NE 0.
    RAISE ERROR.
  ENDIF.
  ENDIF.
ENDMETHOD.





















method free.

* call base class destructor
  call method super->free
    exceptions
      cntl_error        = 1
      cntl_system_error = 2.
  case sy-subrc.
    when 1.
      raise cntl_error.
    when 2.
      raise cntl_system_error.
  endcase.

*... begin muss wieder weg
  free parent.
  free lifetime.
  free registered_events.
  free registered_events_count.
  free registered_simple_events.
*... end muss wieder weg

  free mt_textpool.

  if not m_alvexp_control is initial.
    call method m_alvexp_control->free.
    free m_alvexp_control.
  endif.

  free m_guid.
  free m_batch_mode.
  free m_buf_mt_info.
  free m_crystal_return_url.
  free m_crystal_url.
  free m_cr_datasource_string.
  free m_cr_fadriver_handle.
  free m_dynamic_data_active.
  free m_gui_type.
  free m_height_toolbar.
  free m_int_i_web.

  if ( not m_oi_control is initial ).
    call method m_oi_control->destroy_control.
    free m_oi_control.
  endif.
  free m_oi_link_server.
  free m_oi_mt_data_fields.
  free m_oi_mt_info_fields.
  if ( not m_oi_proxy is initial ).
    call method m_oi_proxy->close_document.
    free m_oi_proxy.
  endif.
  free m_oi_retcode.
  free m_oi_spreadsheet.
  free m_oi_table_coll.

  free m_view.

  free mt_modified_cells.
  free mt_row_id_cache.
  free m_colid_to_fieldname.
  free m_col_pos_table.
  free m_col_pos_table_valid.
  free m_first_visible_col_id.
  free m_first_visible_row_id.
  free m_gui_type_flow.
  free m_number_toolbar_buttons.
  free m_pagingpagesize.
  free m_selected_cols.
  free m_toolbar_visible.
  free m_wan_flag.
  free m_selected_rows.

  if not m_dbgparent is initial.
    call method m_dbgparent->free.
    free m_dbgparent.
  endif.

* do not free M_DP_ON_DEMAND (see also note pair #389795,#395587)
* m_dp_col_pos_table, m_dp_selected_cols, M_DP_ROW_ID,
* M_DP_MODIFIED_CELLS
* new implementation of FREE_GUI_TABLE - problems described above
  " shouldn't occur anymore
  if not m_dp_on_demand is initial.
    m_dp_on_demand->free_gui_table( ).
    free m_dp_on_demand.
  endif.
  free m_dp_on_demand_avail.
  free m_dp_on_demand_writable.
  if not m_dp_col_pos_table is initial.
    m_dp_col_pos_table->free_gui_table( ).
    free m_dp_col_pos_table.
  endif.
  if not m_dp_selected_cols is initial.
    m_dp_selected_cols->free_gui_table( ).
    free m_dp_selected_cols.
  endif.
  if not m_dp_modified_cells is initial.
    m_dp_modified_cells->free_gui_table( ).
    free m_dp_modified_cells.
  endif.
  if not m_dp_row_id is initial.
    m_dp_row_id->free_gui_table( ).
    free m_dp_row_id.
  endif.
  if not M_DP_SELECTED_ROWS is initial.
    M_DP_SELECTED_ROWS->free_gui_table( ).
    free M_DP_SELECTED_ROWS.
  endif.

endmethod.


method GET_COL_POS_ID2_BASE .

  if M_DP_ON_DEMAND_WRITABLE is initial
    or m_col_pos_table_valid is initial.

    CALL FUNCTION 'DP_CONTROL_ASSIGN_TABLE'
         EXPORTING
              H_CNTL       = H_CONTROL
              MEDIUM       = CNDP_MEDIUM_R3TABLE
              PROPERTYNAME = 'ColPosID2'
         TABLES
              DATA         = COL_POS_TABLE.

    CALL FUNCTION 'DP_CONTROL_GET_TABLE'
         EXPORTING
              H_CNTL       = H_CONTROL
              MEDIUM       = CNDP_MEDIUM_R3TABLE
              PROPERTYNAME = 'ColPosID2'
         TABLES
              DATA         = COL_POS_TABLE.
  else.
    col_pos_table = m_col_pos_table.
  endif.
ENDMETHOD.


METHOD GET_COL_POS_ID_BASE .


  if M_DP_ON_DEMAND_WRITABLE is initial
    or m_col_pos_table_valid is initial.

    data flat_col_pos_table type lvc_t_coll.
    CALL FUNCTION 'DP_CONTROL_ASSIGN_TABLE'
         EXPORTING
              H_CNTL       = H_CONTROL
              MEDIUM       = CNDP_MEDIUM_R3TABLE
              PROPERTYNAME = 'ColPosIDType'
         TABLES
              DATA         = flat_COL_POS_TABLE.

    CALL FUNCTION 'DP_CONTROL_GET_TABLE'
         EXPORTING
              H_CNTL       = H_CONTROL
              MEDIUM       = CNDP_MEDIUM_R3TABLE
              PROPERTYNAME = 'ColPosID'
         TABLES
              DATA         = flat_COL_POS_TABLE.

    data wa_flat type lvc_s_cofl.
    data wa_col type lvc_s_coll.
    clear col_pos_table.
    loop at flat_col_pos_table into wa_flat.
      wa_col-col_id-hierlevel = wa_flat-hierlevel.
      wa_col-col_id-fieldname = wa_flat-fieldname.
      wa_col-col_pos = wa_flat-col_pos.
      wa_col-outputlen = wa_flat-outputlen.
      append wa_col to col_pos_table.
    endloop.
  else.
    data wa_id type lvc_s_co01.
    data wa_old type lvc_s_coll.
    data wa_map type s_colid_to_fieldname.

    clear col_pos_table.
    loop at m_col_pos_table into wa_id.
      wa_old-col_pos = sy-tabix.

      read table M_COLID_TO_FIELDNAME into wa_map
        with key col_id = wa_id-col_id.

      wa_old-col_id-fieldname = wa_map-fieldname.
      wa_old-outputlen = wa_id-outputlen.
      append wa_old to col_pos_table.
    endloop.
  endif.

ENDMETHOD.


METHOD GET_CURRENT_CELL_COL .

  IF NOT COL IS REQUESTED.
    EXIT.
  ENDIF.
  check m_batch_mode is initial.
  CALL METHOD GET_PROPERTY
    EXPORTING
      PROPERTY = 'CurrentCellCol'
      QUEUE_ONLY = ' '
    IMPORTING
      VALUE = COL
    EXCEPTIONS
      OTHERS = 1.
  IF SY-SUBRC NE 0.
    RAISE ERROR.
  ENDIF.

ENDMETHOD.


METHOD GET_CURRENT_CELL_COL_ID .

  IF NOT COL_ID IS REQUESTED.
    EXIT.
  ENDIF.
  check m_batch_mode is initial.
  CALL METHOD GET_PROPERTY
    EXPORTING
      PROPERTY = 'CurrentCellColID'
      QUEUE_ONLY = ' '
    IMPORTING
      VALUE = COL_ID
    EXCEPTIONS
      OTHERS = 1.
  IF SY-SUBRC NE 0.
    RAISE ERROR.
  ENDIF.

ENDMETHOD.


method GET_CURRENT_CELL_ID2 .

  IF ROW_ID IS REQUESTED.
    CALL METHOD GET_PROPERTY
      EXPORTING
        PROPERTY = 'CurrentCellRowIDNumeric'
        QUEUE_ONLY = ' '
      IMPORTING
        VALUE = ROW_ID-ROW_ID
      EXCEPTIONS
        OTHERS = 1.
    IF SY-SUBRC NE 0.
      RAISE ERROR.
    ENDIF.

    CALL METHOD GET_PROPERTY
      EXPORTING
        PROPERTY = 'CurrentCellRowIDSubNumeric'
        QUEUE_ONLY = ' '
      IMPORTING
        VALUE = ROW_ID-SUB_ROW_ID
      EXCEPTIONS
        OTHERS = 1.
    IF SY-SUBRC NE 0.
      RAISE ERROR.
    ENDIF.

  ENDIF.

  IF COL_ID IS REQUESTED.
    CALL METHOD GET_PROPERTY
      EXPORTING
        PROPERTY = 'CurrentCellColIDNumeric'
        QUEUE_ONLY = ' '
      IMPORTING
        VALUE = COL_ID
      EXCEPTIONS
        OTHERS = 1.
    IF SY-SUBRC NE 0.
      RAISE ERROR.
    ENDIF.

  ENDIF.

ENDMETHOD.


METHOD GET_CURRENT_CELL_ROW .

  IF NOT ROW IS REQUESTED.
    EXIT.
  ENDIF.
  check m_batch_mode is initial.
  CALL METHOD GET_PROPERTY
    EXPORTING
      PROPERTY = 'CurrentCellRow'
      QUEUE_ONLY = ' '
    IMPORTING
      VALUE = ROW
    EXCEPTIONS
      OTHERS = 1.
  IF SY-SUBRC NE 0.
    RAISE ERROR.
  ENDIF.

ENDMETHOD.


METHOD GET_CURRENT_CELL_ROW_ID .

  IF NOT ROW_ID IS REQUESTED.
    EXIT.
  ENDIF.
  check m_batch_mode is initial.
  CALL METHOD GET_PROPERTY
    EXPORTING
      PROPERTY = 'CurrentCellRowID'
      QUEUE_ONLY = ' '
    IMPORTING
      VALUE = ROW_ID
    EXCEPTIONS
      OTHERS = 1.
  IF SY-SUBRC NE 0.
    RAISE ERROR.
  ENDIF.

ENDMETHOD.


METHOD GET_CURRENT_CELL_TEXT.

  IF NOT TEXT IS REQUESTED.
    EXIT.
  ENDIF.
  check m_batch_mode is initial.
  CALL METHOD GET_PROPERTY
    EXPORTING
      PROPERTY = 'CurrentCellText'
      QUEUE_ONLY = ' '
    IMPORTING
      VALUE = TEXT
    EXCEPTIONS
      OTHERS = 1.
  IF SY-SUBRC NE 0.
    RAISE ERROR.
  ENDIF.

ENDMETHOD.


method get_data_table_linecount.

  linecount = m_dp_on_demand->get_linecount( ).

endmethod.


method GET_ENTER_KEY_MODE .

  IF NOT MODE IS REQUESTED.
    EXIT.
  ENDIF.

  CALL METHOD GET_PROPERTY
    EXPORTING
      PROPERTY = 'EnterKeyMode'
      QUEUE_ONLY = ' '
    IMPORTING
      VALUE = MODE
    EXCEPTIONS
      OTHERS = 1.
  IF SY-SUBRC NE 0.
    RAISE ERROR.
  ENDIF.

ENDMETHOD.


METHOD GET_FIRST_VISIBLE_COL .

  IF NOT COL IS REQUESTED.
    EXIT.
  ENDIF.
  check m_batch_mode is initial.
  CALL METHOD GET_PROPERTY
    EXPORTING
      PROPERTY = 'FirstVisibleCol'
      QUEUE_ONLY = ' '
    IMPORTING
      VALUE = COL
    EXCEPTIONS
      OTHERS = 1.
  IF SY-SUBRC NE 0.
    RAISE ERROR.
  ENDIF.

ENDMETHOD.


METHOD GET_FIRST_VISIBLE_COL_ID .

  IF NOT COL_ID IS REQUESTED.
    EXIT.
  ENDIF.
  check m_batch_mode is initial.
  CALL METHOD GET_PROPERTY
    EXPORTING
      PROPERTY = 'FirstVisibleColID'
      QUEUE_ONLY = ' '
    IMPORTING
      VALUE = COL_ID
    EXCEPTIONS
      OTHERS = 1.
  IF SY-SUBRC NE 0.
    RAISE ERROR.
  ENDIF.

ENDMETHOD.


method GET_FIRST_VISIBLE_COL_ID2 .


  if m_dynamic_data_active is initial.
    CALL METHOD CALL_METHOD
      EXPORTING
        METHOD            = 'GetFirstVisibleColIDNumeric'
        QUEUE_ONLY        = ' '
        keep_cache        = 'X'
      IMPORTING
        RESULT            = COL_ID
      EXCEPTIONS
        others            = 1.
    IF SY-SUBRC <> 0.
      raise error.
    ENDIF.
  else.
    col_id = m_first_visible_col_id.
  endif.

ENDMETHOD.


METHOD GET_FIRST_VISIBLE_ROW .

  IF NOT ROW IS REQUESTED.
    EXIT.
  ENDIF.
  check m_batch_mode is initial.
  CALL METHOD GET_PROPERTY
    EXPORTING
      PROPERTY = 'FirstVisibleRow'
      QUEUE_ONLY = ' '
    IMPORTING
      VALUE = ROW
    EXCEPTIONS
      OTHERS = 1.
  IF SY-SUBRC NE 0.
    RAISE ERROR.
  ENDIF.

ENDMETHOD.


METHOD GET_FIRST_VISIBLE_ROW_ID .

  IF NOT ROW_ID IS REQUESTED.
    EXIT.
  ENDIF.
  check m_batch_mode is initial.
  CALL METHOD GET_PROPERTY
    EXPORTING
      PROPERTY = 'FirstVisibleRowID'
      QUEUE_ONLY = ' '
    IMPORTING
      VALUE = ROW_ID
    EXCEPTIONS
      OTHERS = 1.
  IF SY-SUBRC NE 0.
    RAISE ERROR.
  ENDIF.

ENDMETHOD.


method GET_FIRST_VISIBLE_ROW_ID2 .


  if m_dynamic_data_active is initial.
    CALL METHOD CALL_METHOD
      EXPORTING
        METHOD            = 'GetFirstVisibleRowIDNumeric'
        QUEUE_ONLY        = ' '
        keep_cache        = 'X'
      IMPORTING
        RESULT            = ROW_ID-ROW_ID
      EXCEPTIONS
        others            = 1.
    IF SY-SUBRC <> 0.
      raise error.
    ENDIF.

    CALL METHOD CALL_METHOD
      EXPORTING
        METHOD            = 'GetFirstVisibleRowIDSubNumeric'
        QUEUE_ONLY        = ' '
        keep_cache        = 'X'
      IMPORTING
        RESULT            = ROW_ID-SUB_ROW_ID
      EXCEPTIONS
        others            = 1.
    IF SY-SUBRC <> 0.
      raise error.
    ENDIF.
  else.
    row_id = m_first_visible_row_id.
  endif.

ENDMETHOD.


METHOD GET_FIXED_COLS .

  IF NOT COLS IS REQUESTED.
    EXIT.
  ENDIF.
  check m_batch_mode is initial.
  CALL METHOD GET_PROPERTY
    EXPORTING
      PROPERTY = 'FixedRows'
      QUEUE_ONLY = ' '
    IMPORTING
      VALUE = COLS
    EXCEPTIONS
      OTHERS = 1.
  IF SY-SUBRC NE 0.
    RAISE ERROR.
  ENDIF.

ENDMETHOD.


method GET_GRID_MODIFIED .

  IF NOT modified IS REQUESTED.
    EXIT.
  ENDIF.

  CALL METHOD GET_PROPERTY
    EXPORTING
      PROPERTY = 'GridModified'
      QUEUE_ONLY = ' '
    IMPORTING
      VALUE = modified
    EXCEPTIONS
      OTHERS = 1.
  IF SY-SUBRC NE 0.
    RAISE ERROR.
  ENDIF.
ENDMETHOD.


method get_gui_type.

*<<< Y7AK064187
  gui_type = m_gui_type.

  check m_gui_type is initial.

  include <www_constants>.

  if not www_active is initial.
* Integrierter ITS setzt Farben selbst ab Patch 25
* Setzen des Attributes m_gui_type_html_version fuer SLVC
    data: l_int_its(1) type c.
    call function 'IS_INTEGRATED_ITS'
      importing
        return = l_int_its
      exceptions
        error  = 1
        others = 2.
    if sy-subrc eq 0.
      if l_int_its is initial.
        m_gui_type  = m_gui_type_html.     "Farben werden nicht gesetzt vom ITS
      else.
        m_gui_type  = m_gui_type_its_int.  "Farben werden gesetzt vom ITS
      endif.
    else.
      m_gui_type  = m_gui_type_html.     "Farben werden nicht gesetzt vom ITS
    endif.
  else.
    if not javabean is initial.
      m_gui_type = m_gui_type_java.
    else.
      if not activex is initial.
        m_gui_type = m_gui_type_windows.
      endif.
    endif.
  endif.

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

*  if m_gui_type = m_gui_type_windows
*  or m_gui_type = m_gui_type_java
*  or m_gui_type = m_gui_type_its_int
*  or m_gui_type = m_gui_type_excel.
*    m_gui_type = m_gui_type_windows. "Farben am Frontend gesetzt
*  else.
*    m_gui_type = m_gui_type.  "Farben werden am Backend gesetzt
*  endif.
* Coding muss im SOFT_REFRESH_TABLE_DISPLAY prozessiert werden, da z.B. die
* Toolbar auch auf den GUI-Type ungleich 1 reagieren muss.

 gui_type = m_gui_type.
*>>> Y7AK064187

endmethod.


method GET_HIGHEST_ROW_ID .

  IF NOT ROW_ID IS REQUESTED.
    EXIT.
  ENDIF.

  CALL METHOD GET_PROPERTY
    EXPORTING
      PROPERTY = 'HighestRowID'
      QUEUE_ONLY = ' '
    IMPORTING
      VALUE = ROW_ID
    EXCEPTIONS
      OTHERS = 1.
  IF SY-SUBRC NE 0.
    RAISE ERROR.
  ENDIF.

ENDMETHOD.


method GET_MODIFIED_CELLS .

  data use_cached_cells type c value 'X'.
  data wa type lvc_s_moce.
  data lines type i.
  DATA: gt_stretched_table TYPE ref to data.
  DATA: columns_to_stretch TYPE table_of_strings.
  DATA: m_stretch_column TYPE c length 1.

* Task : YI3K251441
  TYPES: BEGIN OF wa2,
            row_id     type int4,
            sub_row_id type int4,
            col_id     TYPE int4,
            value(384) type c, " Size of VALUE field of LVC_S_MOCE * 3.
            STYLE      Type LVC_ISTYLE,
            STYLE2     Type LVC_ISTYLE,
            STYLE3     Type LVC_ISTYLE,
            STYLE4     Type LVC_ISTYLE,
            MAXLEN     Type INT4,
          end of wa2.

  FIELD-SYMBOLS : <CELL_TABLE> TYPE TABLE,
                  <wa2>  type wa2.

  IF CL_ABAP_CHAR_UTILITIES=>CHARSIZE EQ 2.
  "stretch the above column if needed
*  Start: Gui Support Check
*  Task : YI3K287657
    CALL METHOD CL_GUI_FRONTEND_SERVICES=>CHECK_GUI_SUPPORT
      EXPORTING
        COMPONENT            = 'gridview'
        FEATURE_NAME         = 'stretchingHeader'
      RECEIVING
        RESULT               =  m_stretch_column
      EXCEPTIONS
        CNTL_ERROR           = 1
        ERROR_NO_GUI         = 2
        WRONG_PARAMETER      = 3
        NOT_SUPPORTED_BY_GUI = 4
        UNKNOWN_ERROR        = 5
        others               = 6.

    IF SY-SUBRC <> 0.
     m_stretch_column = ABAP_FALSE.
    ENDIF.
*  End: Gui Support Check
  ENDIF.

  IF m_stretch_column IS NOT INITIAL. " Check for stretch mechanism which is allowed only in unicode systems.
    ASSIGN CELL_TABLE TO <CELL_TABLE>.
    APPEND 'VALUE' TO columns_to_stretch.
  ENDIF.


  if M_DP_ON_DEMAND_WRITABLE is initial.
    clear use_cached_cells.
  else.
*   Check if the table contains only one line with row and col = -1
*   In this case the cache is invalid and the modified cells must
*   be fetched from the frontend via DataProvider.
    describe table MT_MODIFIED_CELLS lines lines.
    if lines = 1.
      read table MT_MODIFIED_CELLS into wa index 1.
      if wa-row_id = -1 and wa-col_id = -1.
        clear use_cached_cells.
      endif.
    endif.
  endif.

  IF not use_cached_cells is initial.
    CELL_TABLE = MT_MODIFIED_CELLS.
  ELSE.
    CLEAR CELL_TABLE.

      IF NOT  m_stretch_column IS INITIAL.

          CALL FUNCTION 'DP_STRETCH_TABLE'
            IMPORTING
              stretched_data_ref  = gt_stretched_table
            TABLES
              data                = CELL_TABLE
              columns_to_stretch  = columns_to_stretch
            EXCEPTIONS
              dp_stretching_error = 1
              OTHERS              = 2.


          IF gt_stretched_table IS NOT INITIAL.
            ASSIGN gt_stretched_table->* TO <CELL_TABLE>.
          ENDIF.

          ASSERT <CELL_TABLE> IS ASSIGNED.
*       End of Stretch table functionality

          CALL FUNCTION 'DP_CONTROL_ASSIGN_TABLE'
               EXPORTING
                    H_CNTL       = H_CONTROL
                    MEDIUM       = CNDP_MEDIUM_R3TABLE
                    PROPERTYNAME = 'ModifiedCellsType'
               TABLES
                    DATA         = <CELL_TABLE>
               EXCEPTIONS
                    OTHERS       = 1.

          IF SY-SUBRC NE 0.
            RAISE ERROR.
          ENDIF.

          CALL FUNCTION 'DP_CONTROL_GET_TABLE'
               EXPORTING
                    H_CNTL       = H_CONTROL
                    MEDIUM       = CNDP_MEDIUM_R3TABLE
                    PROPERTYNAME = 'ModifiedCells'
               TABLES
                    DATA         = <CELL_TABLE>
               EXCEPTIONS
                    OTHERS       = 1.

     ENDIF.

     IF <CELL_TABLE> IS ASSIGNED AND CL_ABAP_CHAR_UTILITIES=>CHARSIZE EQ 2 AND m_stretch_column IS NOT INITIAL.
        loop at <CELL_TABLE> assigning <wa2>.
          move-corresponding <wa2> to wa.
*          move <wa2>-value to wa-value.
          APPEND WA TO CELL_TABLE.
        ENDLOOP.
*      ENDIF.
* Enf of Task : YI3K251441
    ELSE.

          CALL FUNCTION 'DP_CONTROL_ASSIGN_TABLE'
         EXPORTING
              H_CNTL       = H_CONTROL
              MEDIUM       = CNDP_MEDIUM_R3TABLE
              PROPERTYNAME = 'ModifiedCellsType'
         TABLES
              DATA         = CELL_TABLE
         EXCEPTIONS
              OTHERS       = 1.
    IF SY-SUBRC NE 0.
      RAISE ERROR.
    ENDIF.

    CALL FUNCTION 'DP_CONTROL_GET_TABLE'
         EXPORTING
              H_CNTL       = H_CONTROL
              MEDIUM       = CNDP_MEDIUM_R3TABLE
              PROPERTYNAME = 'ModifiedCells'
         TABLES
              DATA         = CELL_TABLE
         EXCEPTIONS
              OTHERS       = 1.

    ENDIF.

    IF SY-SUBRC NE 0.
      RAISE ERROR.
    ENDIF.
  ENDIF.

* CATT
  if catt_active <> space.
    call function 'CAT_GRID_COPY_MODIF_CELLS'
         tables cell_table = cell_table.
    if catt_playback <> space.
      call function 'CAT_GRID_INSERT_MODIF_CELLS'
           tables cell_table = cell_table.
    endif.
  endif.
* CATT

ENDMETHOD.


method GET_PAGINGPAGESIZE.
  IF NOT PAGINGPAGESIZE IS REQUESTED.
    EXIT.
  ENDIF.

  if ( www_active is initial ).
    pagingpagesize = m_pagingpagesize.
    exit.
  endif.

  CALL METHOD GET_PROPERTY
  EXPORTING
    PROPERTY = 'PagingPagesize'
    QUEUE_ONLY = ' '
  IMPORTING
    VALUE = PagingPagesize
  EXCEPTIONS
      OTHERS = 1.
  IF SY-SUBRC NE 0.
    RAISE ERROR.
  ENDIF.
endmethod.


method GET_ROWS_MOVED .

  IF NOT MOVED IS REQUESTED.
    EXIT.
  ENDIF.
  CALL METHOD GET_PROPERTY
    EXPORTING
      PROPERTY = 'RowsMoved'
      QUEUE_ONLY = ' '
    IMPORTING
      VALUE = MOVED
    EXCEPTIONS
      OTHERS = 1.
  IF SY-SUBRC NE 0.
    RAISE ERROR.
  ENDIF.

ENDMETHOD.


method GET_ROW_DELETE_ALLOWED .

  IF NOT allowed IS REQUESTED.
    EXIT.
  ENDIF.

  CALL METHOD GET_PROPERTY
    EXPORTING
      PROPERTY = 'RowDeleteAllowed'
      QUEUE_ONLY = ' '
    IMPORTING
      VALUE = allowed
    EXCEPTIONS
      OTHERS = 1.
  IF SY-SUBRC NE 0.
    RAISE ERROR.
  ENDIF.

ENDMETHOD.


method GET_ROW_ID.

* new IDs from frontend only if rows have moved ...
  data moved type i.
  call method get_rows_moved importing moved = moved.
* call flush only if necessary.
  if cl_gui_cfw=>IS_CACHE_VALID( me ) eq space.
    call method cl_gui_cfw=>flush.
  endif.


  if ( moved is initial ) or
     ( m_dp_on_demand_writable is not initial ).
    ROW_ID_TABLE = mt_row_id_cache.
  else.
    CLEAR ROW_ID_TABLE.
    CALL FUNCTION 'DP_CONTROL_ASSIGN_TABLE'
         EXPORTING
              H_CNTL       = H_CONTROL
              MEDIUM       = CNDP_MEDIUM_R3TABLE
              PROPERTYNAME = 'RowIDNumericType'
         TABLES
              DATA         = ROW_ID_TABLE
         EXCEPTIONS
              OTHERS       = 1.
    IF SY-SUBRC NE 0.
      RAISE ERROR.
    ENDIF.

    CALL FUNCTION 'DP_CONTROL_GET_TABLE'
         EXPORTING
              H_CNTL       = H_CONTROL
              MEDIUM       = CNDP_MEDIUM_R3TABLE
              PROPERTYNAME = 'RowIDNumeric'
         TABLES
              DATA         = ROW_ID_TABLE
         EXCEPTIONS
              OTHERS       = 1.
    IF SY-SUBRC NE 0.
      RAISE ERROR.
    ENDIF.
  endif.

ENDMETHOD.


method GET_ROW_INSERT_ALLOWED .

  IF NOT allowed IS REQUESTED.
    EXIT.
  ENDIF.

  CALL METHOD GET_PROPERTY
    EXPORTING
      PROPERTY = 'RowInsertAllowed'
      QUEUE_ONLY = ' '
    IMPORTING
      VALUE = allowed
    EXCEPTIONS
      OTHERS = 1.
  IF SY-SUBRC NE 0.
    RAISE ERROR.
  ENDIF.

ENDMETHOD.


METHOD GET_SELECTED_CELLS_BASE .

  CLEAR CELL_TABLE.
  check m_batch_mode is initial.
  CALL FUNCTION 'DP_CONTROL_ASSIGN_TABLE'
       EXPORTING
            H_CNTL       = H_CONTROL
            MEDIUM       = CNDP_MEDIUM_R3TABLE
            PROPERTYNAME = 'SelectedCellsType'
       TABLES
            DATA         = CELL_TABLE
       EXCEPTIONS
            OTHERS       = 1.
  IF SY-SUBRC NE 0.
    RAISE ERROR.
  ENDIF.

  CALL FUNCTION 'DP_CONTROL_GET_TABLE'
       EXPORTING
            H_CNTL       = H_CONTROL
            MEDIUM       = CNDP_MEDIUM_R3TABLE
            PROPERTYNAME = 'SelectedCells'
       TABLES
            DATA         = CELL_TABLE
       EXCEPTIONS
            OTHERS       = 1.
  IF SY-SUBRC NE 0.
    RAISE ERROR.
  ENDIF.

ENDMETHOD.


method GET_SELECTED_CELLS_BASE_ID2 .

  CLEAR CELL_TABLE.

  CALL FUNCTION 'DP_CONTROL_ASSIGN_TABLE'
       EXPORTING
            H_CNTL       = H_CONTROL
            MEDIUM       = CNDP_MEDIUM_R3TABLE
            PROPERTYNAME = 'SelectedCellsType3'
       TABLES
            DATA         = CELL_TABLE
       EXCEPTIONS
            OTHERS       = 1.
  IF SY-SUBRC NE 0.
    RAISE ERROR.
  ENDIF.

  CALL FUNCTION 'DP_CONTROL_GET_TABLE'
       EXPORTING
            H_CNTL       = H_CONTROL
            MEDIUM       = CNDP_MEDIUM_R3TABLE
            PROPERTYNAME = 'SelectedCells3'
       TABLES
            DATA         = CELL_TABLE
       EXCEPTIONS
            OTHERS       = 1.
  IF SY-SUBRC NE 0.
    RAISE ERROR.
  ENDIF.


ENDMETHOD.


method GET_SELECTED_CELLS_BASE_RANGE .

  CLEAR CELL_TABLE.
  check m_batch_mode is initial.
  CALL FUNCTION 'DP_CONTROL_ASSIGN_TABLE'
       EXPORTING
            H_CNTL       = H_CONTROL
            MEDIUM       = CNDP_MEDIUM_R3TABLE
            PROPERTYNAME = 'SelectedCellsType2'
       TABLES
            DATA         = CELL_TABLE
       EXCEPTIONS
            OTHERS       = 1.
  IF SY-SUBRC NE 0.
    RAISE ERROR.
  ENDIF.

  CALL FUNCTION 'DP_CONTROL_GET_TABLE'
       EXPORTING
            H_CNTL       = H_CONTROL
            MEDIUM       = CNDP_MEDIUM_R3TABLE
            PROPERTYNAME = 'SelectedCells2'
       TABLES
            DATA         = CELL_TABLE
       EXCEPTIONS
            OTHERS       = 1.
  IF SY-SUBRC NE 0.
    RAISE ERROR.
  ENDIF.

ENDMETHOD.


METHOD GET_SELECTED_COLUMNS_BASE.

  CLEAR COL_TABLE.
  check m_batch_mode is initial.
  if M_DP_ON_DEMAND_WRITABLE is initial.
    CALL FUNCTION 'DP_CONTROL_ASSIGN_TABLE'
         EXPORTING
              H_CNTL       = H_CONTROL
              MEDIUM       = CNDP_MEDIUM_R3TABLE
              PROPERTYNAME = 'SelectedColumnsType'
         TABLES
              DATA         = COL_TABLE
         EXCEPTIONS
              OTHERS       = 1.
    IF SY-SUBRC NE 0.
      RAISE ERROR.
    ENDIF.

    CALL FUNCTION 'DP_CONTROL_GET_TABLE'
         EXPORTING
              H_CNTL       = H_CONTROL
              MEDIUM       = CNDP_MEDIUM_R3TABLE
              PROPERTYNAME = 'SelectedColumns'
         TABLES
              DATA         = COL_TABLE
         EXCEPTIONS
              OTHERS       = 1.
    IF SY-SUBRC NE 0.
      RAISE ERROR.
    ENDIF.
  else.
    data wa_2 type lvc_s_col2.
    data wa_1 type lvc_s_col.
    data wa_map type S_COLID_TO_FIELDNAME.

    loop at M_SELECTED_COLS into wa_2.
        read table M_COLID_TO_FIELDNAME into wa_map
          with key col_id = wa_2-col_id.
        wa_1-fieldname = wa_map-fieldname.
        append wa_1 to col_table.
    endloop.
  endif.

ENDMETHOD.


method GET_SELECTED_COLUMNS_BASE_ID2 .

  CLEAR COL_TABLE.
  CALL FUNCTION 'DP_CONTROL_ASSIGN_TABLE'
       EXPORTING
            H_CNTL       = H_CONTROL
            MEDIUM       = CNDP_MEDIUM_R3TABLE
            PROPERTYNAME = 'SelectedColsType2'
       TABLES
            DATA         = COL_TABLE
       EXCEPTIONS
            OTHERS       = 1.
  IF SY-SUBRC NE 0.
    RAISE ERROR.
  ENDIF.

  CALL FUNCTION 'DP_CONTROL_GET_TABLE'
       EXPORTING
            H_CNTL       = H_CONTROL
            MEDIUM       = CNDP_MEDIUM_R3TABLE
            PROPERTYNAME = 'SelectedCols2'
       TABLES
            DATA         = COL_TABLE
       EXCEPTIONS
            OTHERS       = 1.
  IF SY-SUBRC NE 0.
    RAISE ERROR.
  ENDIF.

ENDMETHOD.


METHOD GET_SELECTED_ROWS_BASE .

  CLEAR ROW_TABLE.
  check m_batch_mode is initial.
  CALL FUNCTION 'DP_CONTROL_ASSIGN_TABLE'
       EXPORTING
            H_CNTL       = H_CONTROL
            MEDIUM       = CNDP_MEDIUM_R3TABLE
            PROPERTYNAME = 'SelectedRowsType'
       TABLES
            DATA         = ROW_TABLE
       EXCEPTIONS
            OTHERS       = 1.
  IF SY-SUBRC NE 0.
    RAISE ERROR.
  ENDIF.

  CALL FUNCTION 'DP_CONTROL_GET_TABLE'
       EXPORTING
            H_CNTL       = H_CONTROL
            MEDIUM       = CNDP_MEDIUM_R3TABLE
            PROPERTYNAME = 'SelectedRows'
       TABLES
            DATA         = ROW_TABLE
       EXCEPTIONS
            OTHERS       = 1.
  IF SY-SUBRC NE 0.
    RAISE ERROR.
  ENDIF.

ENDMETHOD.


method GET_SELECTED_ROWS_BASE_RANGE .

  CLEAR ROW_TABLE.
  check m_batch_mode is initial.
  CALL FUNCTION 'DP_CONTROL_ASSIGN_TABLE'
       EXPORTING
            H_CNTL       = H_CONTROL
            MEDIUM       = CNDP_MEDIUM_R3TABLE
            PROPERTYNAME = 'SelectedRowsType2'
       TABLES
            DATA         = ROW_TABLE
       EXCEPTIONS
            OTHERS       = 1.
  IF SY-SUBRC NE 0.
    RAISE ERROR.
  ENDIF.

  CALL FUNCTION 'DP_CONTROL_GET_TABLE'
       EXPORTING
            H_CNTL       = H_CONTROL
            MEDIUM       = CNDP_MEDIUM_R3TABLE
            PROPERTYNAME = 'SelectedRows2'
       TABLES
            DATA         = ROW_TABLE
       EXCEPTIONS
            OTHERS       = 1.
  IF SY-SUBRC NE 0.
    RAISE ERROR.
  ENDIF.

ENDMETHOD.


method GET_SELECTED_ROWS_ID_BASE .

  data use_cached_rows type c value 'X'.
  data wa type lvc_s_roid.
  data lines type i.

  if m_cache_selected_rows is initial.
    clear use_cached_rows.
  else.
*   Check if the table contains only one line with -1
*   In this case the cache is invalid and the rows must
*   be fetched from the frontend
    describe table M_SELECTED_ROWS lines lines.
    if lines = 1.
      read table M_SELECTED_ROWS into wa index 1.
      if wa-row_id = -1 and wa-sub_row_id = -1.
        clear use_cached_rows.
      endif.
    endif.
  endif.

  if use_cached_rows is not initial.
    ROW_TABLE = M_SELECTED_ROWS.
  else.
    CLEAR ROW_TABLE.
    CALL FUNCTION 'DP_CONTROL_ASSIGN_TABLE'
      EXPORTING
        H_CNTL       = H_CONTROL
        MEDIUM       = CNDP_MEDIUM_R3TABLE
        PROPERTYNAME = 'SelectedRowsType3'
      TABLES
        DATA         = ROW_TABLE
      EXCEPTIONS
        OTHERS       = 1.
    IF SY-SUBRC NE 0.
      RAISE ERROR.
    ENDIF.

    CALL FUNCTION 'DP_CONTROL_GET_TABLE'
      EXPORTING
        H_CNTL       = H_CONTROL
        MEDIUM       = CNDP_MEDIUM_R3TABLE
        PROPERTYNAME = 'SelectedRows3'
      TABLES
        DATA         = ROW_TABLE
      EXCEPTIONS
        OTHERS       = 1.
    IF SY-SUBRC NE 0.
      RAISE ERROR.
    ENDIF.
  endif.
ENDMETHOD.


method GET_TOOLBAR_WRAP .

  IF NOT WRAP IS REQUESTED.
    EXIT.
  ENDIF.

  CALL METHOD GET_PROPERTY
    EXPORTING
      PROPERTY = 'ToolBarWrap'
      QUEUE_ONLY = ' '
    IMPORTING
      VALUE = wrap
    EXCEPTIONS
      OTHERS = 1.
  IF SY-SUBRC NE 0.
    RAISE ERROR.
  ENDIF.

ENDMETHOD.


method GET_TOTAL_ARROWS .

  IF NOT VISIBLE IS REQUESTED.
    EXIT.
  ENDIF.

  CALL METHOD GET_PROPERTY
    EXPORTING
      PROPERTY = 'TotalArrows'
      QUEUE_ONLY = ' '
    IMPORTING
      VALUE = visible
    EXCEPTIONS
      OTHERS = 1.
  IF SY-SUBRC NE 0.
    RAISE ERROR.
  ENDIF.

ENDMETHOD.


method GET_TOTAL_EXPANDERS .

  IF NOT VISIBLE IS REQUESTED.
    EXIT.
  ENDIF.

  CALL METHOD GET_PROPERTY
    EXPORTING
      PROPERTY = 'TotalExpanders'
      QUEUE_ONLY = ' '
    IMPORTING
      VALUE = visible
    EXCEPTIONS
      OTHERS = 1.
  IF SY-SUBRC NE 0.
    RAISE ERROR.
  ENDIF.

ENDMETHOD.


method HOST_IFRAME .

  if ( I_on is initial ).
  CALL METHOD CALL_METHOD
  EXPORTING
       METHOD    = 'HostIFrame' "#EC NOTEXT
       P_COUNT   = 2
       P1        = 0
       P2        = i_url
   EXCEPTIONS
      OTHERS = 1.
  IF SY-SUBRC NE 0.
    RAISE ERROR.
  ENDIF.
  else.
  CALL METHOD CALL_METHOD
  EXPORTING
       METHOD    = 'HostIFrame' "#EC NOTEXT
       P_COUNT   = 2
       P1        = 1
       P2        = i_url
   EXCEPTIONS
      OTHERS = 1.
  IF SY-SUBRC NE 0.
    RAISE ERROR.
  ENDIF.
  endif.
ENDMETHOD.


method IF_GUI_DYNAMIC_DATA~ON_EXECUTE_NODE.
endmethod.


method IF_GUI_DYNAMIC_DATA~ON_NEW_NODE.
  retval = me.
endmethod.


method IF_GUI_DYNAMIC_DATA~ON_VALUE.

  if name = 'FVRID'.
    M_DYNAMIC_DATA_ACTIVE = 'X'.
    m_first_visible_row_id-row_id = value.
  endif.

  if name = 'FVRIDS'.
    M_DYNAMIC_DATA_ACTIVE = 'X'.
    m_first_visible_row_id-sub_row_id = value.
  endif.

  if name = 'FVCID'.
    M_DYNAMIC_DATA_ACTIVE = 'X'.
    m_first_visible_col_id = value.
  endif.

  m_col_pos_table_valid = 'X'.

endmethod.


method ON_BEFORE_SEND .
* ...
endmethod.


method ON_CLOSE_DOCUMENT.
* ...
endmethod.


method ON_CUSTOM_EVENT.
* ...
endmethod.


method ON_OI_CUSTOM_EVENT.
* ...

endmethod.


method OPEN_BROWSER_WINDOW .

*if ( sy-uname eq 'FORSTMANN' ).
*  CALL METHOD CALL_METHOD
*  EXPORTING
*       METHOD    = 'OpenBrowserWindow' "#EC NOTEXT
*       P_COUNT   = 1
*       P1        = i_url
*   EXCEPTIONS
*      OTHERS = 1.
*  IF SY-SUBRC NE 0.
*    RAISE ERROR.
*  ENDIF.
*endif.
ENDMETHOD.


method OPTIMIZE_ALL_COLS .

  clear m_col_pos_table_valid.

  CALL METHOD CALL_METHOD
  EXPORTING
       METHOD    = 'OptimizeAllCols' "#EC NOTEXT
       P_COUNT   = 1
       P1        = include_header
   EXCEPTIONS
      OTHERS = 1.
  IF SY-SUBRC NE 0.
    RAISE ERROR.
  ENDIF.

ENDMETHOD.


method OPTIMIZE_COL .

  clear m_col_pos_table_valid.

  CALL METHOD CALL_METHOD
  EXPORTING
       METHOD    = 'OptimizeCol' "#EC NOTEXT
       P_COUNT   = 2
       p1        = col
       P2        = include_header
   EXCEPTIONS
      OTHERS = 1.
  IF SY-SUBRC NE 0.
    RAISE ERROR.
  ENDIF.

ENDMETHOD.


method OPTIMIZE_COL_ID .

  clear m_col_pos_table_valid.

  CALL METHOD CALL_METHOD
  EXPORTING
       METHOD    = 'OptimizeColID' "#EC NOTEXT
       P_COUNT   = 2
       p1        = col_id
       P2        = include_header
   EXCEPTIONS
      OTHERS = 1.
  IF SY-SUBRC NE 0.
    RAISE ERROR.
  ENDIF.

ENDMETHOD.


method OPTIMIZE_SELECTED_COLS .

  clear m_col_pos_table_valid.

  CALL METHOD CALL_METHOD
  EXPORTING
       METHOD    = 'OptimizeSelectedCols' "#EC NOTEXT
       P_COUNT   = 1
       P1        = include_header
   EXCEPTIONS
      OTHERS = 1.
  IF SY-SUBRC NE 0.
    RAISE ERROR.
  ENDIF.

ENDMETHOD.


method PREPARE_OI_TABLES .

*  DATA: fields_table TYPE TABLE OF rfc_fields.
*  DATA: fields_table2 TYPE TABLE OF rfc_fields.
*  DATA: wa_fields_table TYPE rfc_fields.
*  data mt_data type LVC_T_DATA.
*  CALL FUNCTION 'DP_GET_FIELDS_FROM_TABLE'
*       TABLES
*            data   = MT_DATA
*            fields = m_oi_MT_DATA_fields.
*  READ TABLE m_oi_mt_data_fields INDEX 1 INTO wa_fields_table.
*  wa_fields_table-fieldname = 'COL_POS'."#EC NOTEXT
*  MODIFY m_oi_mt_data_fields FROM wa_fields_table INDEX 1.
*  CLEAR wa_fields_table.
*  READ TABLE m_oi_mt_data_fields INDEX 2 INTO wa_fields_table.
*  wa_fields_table-fieldname = 'COL_POS'. "#EC NOTEXT
*  MODIFY m_oi_mt_data_fields FROM wa_fields_table INDEX 2.
*  READ TABLE m_oi_mt_data_fields INDEX 3 INTO wa_fields_table.
*  wa_fields_table-fieldname = 'ROW_POS'."#EC NOTEXT
*  MODIFY m_oi_mt_data_fields FROM wa_fields_table INDEX 3.
*  CLEAR wa_fields_table.
*  READ TABLE m_oi_mt_data_fields INDEX 4 INTO wa_fields_table.
*  wa_fields_table-fieldname = 'STYLE'. "#EC NOTEXT
*  MODIFY m_oi_mt_data_fields FROM wa_fields_table INDEX 4.
*  READ TABLE m_oi_mt_data_fields INDEX 5 INTO wa_fields_table.
*  wa_fields_table-fieldname = 'VALUE'."#EC NOTEXT
*  MODIFY m_oi_mt_data_fields FROM wa_fields_table INDEX 5.
*  CLEAR wa_fields_table.
*  READ TABLE m_oi_mt_data_fields INDEX 6 INTO wa_fields_table.
*  wa_fields_table-fieldname = 'DRAGDROPID'. "#EC NOTEXT
*  MODIFY m_oi_mt_data_fields FROM wa_fields_table INDEX 6.
*  READ TABLE m_oi_mt_data_fields INDEX 7 INTO wa_fields_table.
*  wa_fields_table-fieldname = 'SAP_STYLE'. "#EC NOTEXT
*  MODIFY m_oi_mt_data_fields FROM wa_fields_table INDEX 7.
*  CALL METHOD m_oi_table_coll->add_table
*                    EXPORTING table_name = 'MT_DATA'
*                             table_type = table_coll->table_type_output
*                    IMPORTING retcode = retcode
*                    CHANGING  data_table = mt_DATA
*                             m_oi_mt_data_fields = m_oi_mt_data_fields.
*  append initial line to mt_data.
*  CALL METHOD link_server->add_table_item2
*           EXPORTING item_name = 'MT_DATA'    "#EC NOTEXT
*                     item_title = 'MT_DATA'
*           IMPORTING retcode = retcode
*           CHANGING  data_table = MT_DATA
*                     m_oi_mt_data_fields = m_oi_mt_data_fields.

*  CALL METHOD link_server->add_string_item
*           EXPORTING item_name   = 'ChartTitle'
*                     item_title  = 'Chart Title'(ti0)
*                     item_value  = 'Car Sales by Region'(ti1)
*                     no_flush    = 'X'
*           IMPORTING retcode = retcode.
*  CALL METHOD link_server->add_string_item
*           EXPORTING item_name   = 'ColumnTitle1'
*                     item_title  = 'Column Title 1'(ti2)
*                     item_value  = 'Region'(ti3)
*                     no_flush    = 'X'
*           IMPORTING retcode = retcode.
*  CALL METHOD link_server->add_string_item
*           EXPORTING item_name   = 'ColumnTitle2'
*                     item_title  = 'Column Title 2'(ti4)
*                     item_value  = 'Sold Cars'(ti5)
*                     no_flush    = ' '
*           IMPORTING retcode = retcode.
* data mt_info type lvc_t_info.
* CALL FUNCTION 'DP_GET_FIELDS_FROM_TABLE'
*       TABLES
*            data   = MT_INFO
*            fields = m_oi_mt_info_fields.
*
*  READ TABLE m_oi_mt_info_fields INDEX 1 INTO wa_fields_table.
*  wa_fields_table-fieldname = 'COL_ID'."#EC NOTEXT
*  MODIFY m_oi_mt_info_fields FROM wa_fields_table INDEX 1.
*  CLEAR wa_fields_table.
*  READ TABLE m_oi_mt_info_fields INDEX 2 INTO wa_fields_table.
*  wa_fields_table-fieldname = 'COL_POS'. "#EC NOTEXT
*  MODIFY m_oi_mt_info_fields FROM wa_fields_table INDEX 2.
*  READ TABLE m_oi_mt_info_fields INDEX 3 INTO wa_fields_table.
*  wa_fields_table-fieldname = 'TEXT'."#EC NOTEXT
*  MODIFY m_oi_mt_info_fields FROM wa_fields_table INDEX 3.
*  CLEAR wa_fields_table.
*  READ TABLE m_oi_mt_info_fields INDEX 4 INTO wa_fields_table.
*  wa_fields_table-fieldname = 'OUTPUTLEN'. "#EC NOTEXT
*  MODIFY m_oi_mt_info_fields FROM wa_fields_table INDEX 4.
*  READ TABLE m_oi_mt_info_fields INDEX 5 INTO wa_fields_table.
*  wa_fields_table-fieldname = 'MERGE'."#EC NOTEXT
*  MODIFY m_oi_mt_info_fields FROM wa_fields_table INDEX 5.
*  CLEAR wa_fields_table.
*  READ TABLE m_oi_mt_info_fields INDEX 6 INTO wa_fields_table.
*  wa_fields_table-fieldname = 'STYLE'. "#EC NOTEXT
*  MODIFY m_oi_mt_info_fields FROM wa_fields_table INDEX 6.
*  READ TABLE m_oi_mt_info_fields INDEX 7 INTO wa_fields_table.
*  wa_fields_table-fieldname = 'TOOLTIP'. "#EC NOTEXT
*  MODIFY m_oi_mt_info_fields FROM wa_fields_table INDEX 7.
*  READ TABLE m_oi_mt_info_fields INDEX 8 INTO wa_fields_table.
*  wa_fields_table-fieldname = 'DRAGDROPID'. "#EC NOTEXT
*  MODIFY m_oi_mt_info_fields FROM wa_fields_table INDEX 8.
*  READ TABLE m_oi_mt_info_fields INDEX 9 INTO wa_fields_table.
*  wa_fields_table-fieldname = 'LEVEL'. "#EC NOTEXT
*  MODIFY m_oi_mt_info_fields FROM wa_fields_table INDEX 9.
*  READ TABLE m_oi_mt_info_fields INDEX 10 INTO wa_fields_table.
*  wa_fields_table-fieldname = 'SAP_STYLE'. "#EC NOTEXT
*  MODIFY m_oi_mt_info_fields FROM wa_fields_table INDEX 10.

*  CALL METHOD table_coll->add_table
*                    EXPORTING table_name = 'MT_INFO'
*                             table_type = table_coll->table_type_output
*                    IMPORTING retcode = retcode
*                    CHANGING  data_table = mt_INFO
*                       m_oi_mt_data_fields = m_oi_mt_info_fields.
*  append initial line to mt_data.
*
*  CALL METHOD m_oi_link_server->add_table_item2
*           EXPORTING item_name = 'MT_INFO'    "#EC NOTEXT
*                     item_title = 'MT_INFO'
*           IMPORTING retcode = retcode
*           CHANGING  data_table = MT_INFO
*                     m_oi_mt_data_fields = m_oi_mt_info_fields.
* ...
endmethod.


method REFRESH_OI_TABLES.

*  DATA: fields_table TYPE TABLE OF rfc_fields.
*  DATA: fields_table2 TYPE TABLE OF rfc_fields.
*  DATA: wa_fields_table TYPE rfc_fields.
*  DATA: ind TYPE i.
*
*  CALL FUNCTION 'DP_GET_FIELDS_FROM_TABLE'
*       TABLES
*            data   = MT_DATA
*            fields = fields_table.
*
*  READ TABLE fields_table INDEX 1 INTO wa_fields_table.
*  wa_fields_table-fieldname = 'COL_POS'."#EC NOTEXT
*  MODIFY fields_table FROM wa_fields_table INDEX 1.
*  CLEAR wa_fields_table.
*  READ TABLE fields_table INDEX 2 INTO wa_fields_table.
*  wa_fields_table-fieldname = 'COL_POS'. "#EC NOTEXT
*  MODIFY fields_table FROM wa_fields_table INDEX 2.
*  READ TABLE fields_table INDEX 3 INTO wa_fields_table.
*  wa_fields_table-fieldname = 'ROW_POS'."#EC NOTEXT
*  MODIFY fields_table FROM wa_fields_table INDEX 3.
*  CLEAR wa_fields_table.
*  READ TABLE fields_table INDEX 4 INTO wa_fields_table.
*  wa_fields_table-fieldname = 'STYLE'. "#EC NOTEXT
*  MODIFY fields_table FROM wa_fields_table INDEX 4.
*  READ TABLE fields_table INDEX 5 INTO wa_fields_table.
*  wa_fields_table-fieldname = 'VALUE'."#EC NOTEXT
*  MODIFY fields_table FROM wa_fields_table INDEX 5.
*  CLEAR wa_fields_table.
*  READ TABLE fields_table INDEX 6 INTO wa_fields_table.
*  wa_fields_table-fieldname = 'DRAGDROPID'. "#EC NOTEXT
*  MODIFY fields_table FROM wa_fields_table INDEX 6.
*  READ TABLE fields_table INDEX 7 INTO wa_fields_table.
*  wa_fields_table-fieldname = 'SAP_STYLE'. "#EC NOTEXT
*  MODIFY fields_table FROM wa_fields_table INDEX 7.
*
*  CALL METHOD table_coll->add_table
*                    EXPORTING table_name = 'MT_DATA'
*                             table_type = table_coll->table_type_output
*                    IMPORTING retcode = retcode
*                    CHANGING  data_table = mt_DATA
*                              fields_table = fields_table.
*  append initial line to mt_data.
*  CALL METHOD link_server->add_table_item2
*           EXPORTING item_name = 'MT_DATA'    "#EC NOTEXT
*                     item_title = 'MT_DATA'
*           IMPORTING retcode = retcode
*           CHANGING  data_table = MT_DATA
*                     fields_table = fields_table.
*
**  CALL METHOD link_server->add_string_item
**           EXPORTING item_name   = 'ChartTitle'
**                     item_title  = 'Chart Title'(ti0)
**                     item_value  = 'Car Sales by Region'(ti1)
**                     no_flush    = 'X'
**           IMPORTING retcode = retcode.
**  CALL METHOD link_server->add_string_item
**           EXPORTING item_name   = 'ColumnTitle1'
**                     item_title  = 'Column Title 1'(ti2)
**                     item_value  = 'Region'(ti3)
**                     no_flush    = 'X'
**           IMPORTING retcode = retcode.
**  CALL METHOD link_server->add_string_item
**           EXPORTING item_name   = 'ColumnTitle2'
**                     item_title  = 'Column Title 2'(ti4)
**                     item_value  = 'Sold Cars'(ti5)
**                     no_flush    = ' '
**           IMPORTING retcode = retcode.
*
* CALL FUNCTION 'DP_GET_FIELDS_FROM_TABLE'
*       TABLES
*            data   = MT_INFO
*            fields = fields_table2.
*
*  READ TABLE fields_table2 INDEX 1 INTO wa_fields_table.
*  wa_fields_table-fieldname = 'COL_ID'."#EC NOTEXT
*  MODIFY fields_table2 FROM wa_fields_table INDEX 1.
*  CLEAR wa_fields_table.
*  READ TABLE fields_table2 INDEX 2 INTO wa_fields_table.
*  wa_fields_table-fieldname = 'COL_POS'. "#EC NOTEXT
*  MODIFY fields_table2 FROM wa_fields_table INDEX 2.
*  READ TABLE fields_table2 INDEX 3 INTO wa_fields_table.
*  wa_fields_table-fieldname = 'TEXT'."#EC NOTEXT
*  MODIFY fields_table2 FROM wa_fields_table INDEX 3.
*  CLEAR wa_fields_table.
*  READ TABLE fields_table2 INDEX 4 INTO wa_fields_table.
*  wa_fields_table-fieldname = 'OUTPUTLEN'. "#EC NOTEXT
*  MODIFY fields_table2 FROM wa_fields_table INDEX 4.
*  READ TABLE fields_table2 INDEX 5 INTO wa_fields_table.
*  wa_fields_table-fieldname = 'MERGE'."#EC NOTEXT
*  MODIFY fields_table2 FROM wa_fields_table INDEX 5.
*  CLEAR wa_fields_table.
*  READ TABLE fields_table2 INDEX 6 INTO wa_fields_table.
*  wa_fields_table-fieldname = 'STYLE'. "#EC NOTEXT
*  MODIFY fields_table2 FROM wa_fields_table INDEX 6.
*  READ TABLE fields_table2 INDEX 7 INTO wa_fields_table.
*  wa_fields_table-fieldname = 'TOOLTIP'. "#EC NOTEXT
*  MODIFY fields_table2 FROM wa_fields_table INDEX 7.
*  READ TABLE fields_table2 INDEX 8 INTO wa_fields_table.
*  wa_fields_table-fieldname = 'DRAGDROPID'. "#EC NOTEXT
*  MODIFY fields_table2 FROM wa_fields_table INDEX 8.
*  READ TABLE fields_table2 INDEX 9 INTO wa_fields_table.
*  wa_fields_table-fieldname = 'LEVEL'. "#EC NOTEXT
*  MODIFY fields_table2 FROM wa_fields_table INDEX 9.
*  READ TABLE fields_table2 INDEX 10 INTO wa_fields_table.
*  wa_fields_table-fieldname = 'SAP_STYLE'. "#EC NOTEXT
*  MODIFY fields_table2 FROM wa_fields_table INDEX 10.
*
*  CALL METHOD table_coll->add_table
*                    EXPORTING table_name = 'MT_INFO'
*                             table_type = table_coll->table_type_output
*                    IMPORTING retcode = retcode
*                    CHANGING  data_table = mt_INFO
*                              fields_table = fields_table2.
*  append initial line to mt_data.
*
*  CALL METHOD m_oi_link_server->add_table_item2
*           EXPORTING item_name = 'MT_INFO'    "#EC NOTEXT
*                     item_title = 'MT_INFO'
*           IMPORTING retcode = retcode
*           CHANGING  data_table = MT_INFO
*                     fields_table = fields_table2.
** ...
endmethod.


method remove_oi_objects.

*  clear m_oi_control. " enforce creation of new Excel. <
  if ( not m_oi_proxy is initial ).
    call method m_oi_proxy->close_document.
    free m_oi_proxy.
  endif.
  if ( not m_oi_control is initial ).
    call method m_oi_control->destroy_control.
    free m_oi_control.
  endif.

endmethod.


METHOD SCROLL_TO_BOTTOM.

  CALL METHOD CALL_METHOD
  EXPORTING
       METHOD    = 'ScrollToBottom'
   EXCEPTIONS
      OTHERS = 1.
  IF SY-SUBRC NE 0.
    RAISE ERROR.
  ENDIF.

ENDMETHOD.


















METHOD SELECT_ALL_ROWS .

  CALL METHOD CALL_METHOD
  EXPORTING
       METHOD    = 'SelectAllRows'
   EXCEPTIONS
      OTHERS = 1.
  IF SY-SUBRC NE 0.
    RAISE ERROR.
  ENDIF.

ENDMETHOD.


METHOD SELECT_TEXT_IN_CURRENT_CELL.

  CALL METHOD CALL_METHOD
  EXPORTING
       METHOD    = 'SelectTextInCurrentCell'
       P_COUNT   = 2
       P1        = FROM
       P2        = TO
   EXCEPTIONS
      OTHERS = 1.
  IF SY-SUBRC NE 0.
    RAISE ERROR.
  ENDIF.

ENDMETHOD.











METHOD SET_3D_BORDER_BASE .

  CALL METHOD CALL_METHOD
      EXPORTING
        METHOD = 'Set3DBorder'
        P_COUNT   = 1
        P1 = BORDER
       EXCEPTIONS OTHERS = 1.
  IF SY-SUBRC NE 0.
    RAISE ERROR.
  ENDIF.
ENDMETHOD.
























METHOD SET_AUTO_REDRAW .

  if enable is initial.
    add 1 to M_AUTO_REDRAW.
    if M_AUTO_REDRAW eq 1.
      CALL METHOD SET_PROPERTY
        EXPORTING
          PROPERTY   = 'AutoRedraw'
          keep_cache = 'X'
          VALUE      = 0.
    endif.
  else.
    subtract 1 from M_AUTO_REDRAW.
    if M_AUTO_REDRAW eq 0.
      CALL METHOD SET_PROPERTY
        EXPORTING
          PROPERTY   = 'AutoRedraw'
          keep_cache = 'X'
          VALUE      = 1.
    endif.
  endif.
ENDMETHOD.


METHOD SET_CLIPBOARD_ACTIVE .

  if M_CLIPBOARD_ACTIVE ne active.
    CALL METHOD SET_PROPERTY
      EXPORTING
        PROPERTY = 'ClipboardActive'
        VALUE    = ACTIVE
      EXCEPTIONS
        OTHERS   = 1.
    IF SY-SUBRC NE 0.
      RAISE ERROR.
    ENDIF.
    M_CLIPBOARD_ACTIVE = active.
  endif.
ENDMETHOD.


method SET_COLOR_INFO.

  IF m_acc_mode is not initial.             "TRUE
    CALL METHOD CALL_METHOD
      EXPORTING
        METHOD  = 'SetColorInfo'
        P_COUNT = 2
        P1      = COLOR_STYLE
        P2      = INFO
      EXCEPTIONS
        OTHERS  = 1.
  ENDIF.

endmethod.


METHOD SET_COL_HEADER_STYLE.

  if M_COL_HEADER_STYLE ne style.
    CALL METHOD CALL_METHOD
      EXPORTING
        METHOD  = 'SetColHeaderStyle'
        P_COUNT = 1
        P1      = STYLE
      EXCEPTIONS
        OTHERS  = 1.
    IF SY-SUBRC NE 0.
      RAISE ERROR.
    ENDIF.
    M_COL_HEADER_STYLE = style.
  endif.
ENDMETHOD.                    "SET_COL_HEADER_STYLE


METHOD SET_COL_HEADER_VISIBLE .

  if M_COL_HEADER_VISIBLE ne visible.
    CALL METHOD SET_PROPERTY
      EXPORTING
        PROPERTY = 'ColHeaderVisible'
        VALUE    = VISIBLE
      EXCEPTIONS
        OTHERS   = 1.
    IF SY-SUBRC NE 0.
      RAISE ERROR.
    ENDIF.
    M_COL_HEADER_VISIBLE = visible.
  endif.
ENDMETHOD.


METHOD SET_COL_WIDTH_ID.

  clear m_col_pos_table_valid.

  CALL METHOD CALL_METHOD
  EXPORTING
       METHOD    = 'SetColWidthID'
       P_COUNT   = 2
       P1        = COL_ID
       P2        = WIDTH
   EXCEPTIONS
      OTHERS = 1.
  IF SY-SUBRC NE 0.
    RAISE ERROR.
  ENDIF.

ENDMETHOD.


METHOD SET_CURRENT_CELL_BASE .

  CALL METHOD CALL_METHOD
  EXPORTING
       METHOD    = 'SetCurrentCell'
       P_COUNT   = 2
       P1        = ROW
       P2        = COL
   EXCEPTIONS
      OTHERS = 1.
  IF SY-SUBRC NE 0.
    RAISE ERROR.
  ENDIF.

ENDMETHOD.











METHOD SET_CURRENT_CELL_ID.

  CALL METHOD CALL_METHOD
  EXPORTING
       METHOD    = 'SetCurrentCellID'
       P_COUNT   = 2
       P1        = ROW_ID
       P2        = COL_ID
   EXCEPTIONS
      OTHERS = 1.
  IF SY-SUBRC NE 0.
    RAISE ERROR.
  ENDIF.

ENDMETHOD.











method SET_CURRENT_CELL_ID2 .

  CALL METHOD CALL_METHOD
  EXPORTING
       METHOD    = 'SetCurrentCellIDNumeric'
       P_COUNT   = 3
       P1        = ROW_ID-ROW_ID
       P2        = COL_ID
       P3        = ROW_ID-SUB_ROW_ID
   EXCEPTIONS
      OTHERS = 1.
  IF SY-SUBRC NE 0.
    RAISE ERROR.
  ENDIF.

ENDMETHOD.











method SET_CURRENT_CELL_ROWPOS_COLID .

  CALL METHOD CALL_METHOD
  EXPORTING
       METHOD    = 'SetCurrentCellRowPosColId'
       P_COUNT   = 2
       P1        = ROW
       P2        = COL_ID
   EXCEPTIONS
      OTHERS = 1.
  IF SY-SUBRC NE 0.
    RAISE ERROR.
  ENDIF.

ENDMETHOD.











METHOD set_data_table.
"' note: Data_table is internally an IMPORTING parameter.
"' for speed optimisation and restrictions of add_table_type output
"' it was changed to CHANGING

  DATA dataref TYPE REF TO data.

  IF m_dp_on_demand_avail EQ 'X'.
    IF NOT m_dp_on_demand IS INITIAL.
      CALL METHOD m_dp_on_demand->free_gui_table.
      CLEAR m_dp_on_demand.
    ENDIF.

    GET REFERENCE OF data_table INTO dataref.

    IF m_wan_flag IS INITIAL.
      CREATE OBJECT m_dp_on_demand
        EXPORTING
          DATA             = data_table
          dataref          = dataref
          total_line_count = no_of_lines
          compression      = 1
          use_cache        = ' '.
    ELSE.
      CREATE OBJECT m_dp_on_demand
        EXPORTING
          DATA             = data_table
          dataref          = dataref
          total_line_count = no_of_lines
          compression      = 10
          use_cache        = ' '.
    ENDIF.

    DATA: l_packetsize TYPE i,
          l_last_line TYPE i,
          l_first_line TYPE i.
*    describe table data_table lines l_lines.

    IF not no_of_lines IS initial.

      CALL METHOD m_dp_on_demand->get_packet_size
        IMPORTING
          packetsize = l_packetsize.

      l_last_line = l_packetsize + first_line - 1.
      IF l_last_line GE no_of_lines.
        l_first_line = no_of_lines - l_packetsize + 1.
      ELSE.
        l_first_line = first_line.
      ENDIF.

      if l_first_line le 0.
        l_first_line = 1.
      endif.

    ELSE.

      l_first_line = first_line.

    ENDIF.



    SET HANDLER on_before_send FOR m_dp_on_demand.

    CALL METHOD m_dp_on_demand->control_assign_prop
      EXPORTING
        control   = me
        property  = 'DataTableOnDemand'
        firstline = l_first_line.
  ELSE.
*   der ITS 610 implementiert keinen Data Provider on Demand und
*   bricht bei zu grossen Tabellen ab. Deshalb checken wir hier
*   und dumpen mit message type X
*   Da der ITS 610 das einzige Frontend ohne DP on Demand ist,
*   sollte hier eine Abfrage nach www_active nicht noetig sein
    CALL FUNCTION 'ITS_CHECK_ALV_DATA_SIZE'
      TABLES
        data_table = data_table.
    CALL FUNCTION 'DP_CONTROL_ASSIGN_TABLE'
      EXPORTING
        h_cntl       = h_control
        medium       = cndp_medium_r3table
        propertyname = 'DataTable'
      TABLES
        data         = data_table
      EXCEPTIONS
        OTHERS       = 1.
    IF sy-subrc NE 0.
      RAISE error.
    ENDIF.
  ENDIF.

*  if not m_oi_proxy is initial and not m_oi_spreadsheet is initial.
*    call method m_oi_spreadsheet->set_data_table
*      exporting
*        data_table = data_table.
*  endif.

* CATT
  IF catt_active <> space.
    CALL FUNCTION 'CAT_GRID_COPY_DATA'
      TABLES
        data_table = data_table.
  ENDIF.
* CATT

ENDMETHOD.


METHOD SET_DELAY_CHANGE_SELECTION .

  CALL METHOD SET_PROPERTY
   EXPORTING
     PROPERTY = 'DelayTimeChangedSelectionEvent'
     VALUE = TIME
       EXCEPTIONS
         OTHERS = 1.
    IF SY-SUBRC NE 0.
      RAISE ERROR.
    ENDIF.

ENDMETHOD.


METHOD SET_DELAY_MOVE_CURRENT_CELL .

  CALL METHOD SET_PROPERTY
   EXPORTING
     PROPERTY = 'DelayTimeMovedCurrentCellEvent'
     VALUE = TIME
       EXCEPTIONS
         OTHERS = 1.
    IF SY-SUBRC NE 0.
      RAISE ERROR.
    ENDIF.

ENDMETHOD.


method SET_DELTA_TABLE .

   FIELD-SYMBOLS : <DELTA_TABLE> TYPE TABLE.
   DATA: gt_stretched_table TYPE ref to data.
   DATA: columns_to_stretch TYPE table_of_strings.
   DATA: m_stretch_column TYPE c length 1.
* CATT
  if catt_active <> space.
    if catt_recording <> space.
      call function 'CAT_GRID_COPY_DATA_DELTA'
               exporting modified = modified
               tables delta_table = delta_table.
    elseif catt_playback <> space.
    endif.
  endif.
*CATT

  if modified is initial.
* Task : YI3K25144
* Start: Gui Support Check
        CALL METHOD CL_GUI_FRONTEND_SERVICES=>CHECK_GUI_SUPPORT
          EXPORTING
            COMPONENT            = 'gridview'
            FEATURE_NAME         = 'stretchingHeader'
          RECEIVING
            RESULT               =  m_stretch_column
          EXCEPTIONS
            CNTL_ERROR           = 1
            ERROR_NO_GUI         = 2
            WRONG_PARAMETER      = 3
            NOT_SUPPORTED_BY_GUI = 4
            UNKNOWN_ERROR        = 5
            others               = 6.

        IF SY-SUBRC <> 0.
         m_stretch_column = ABAP_FALSE.
        ENDIF.
* End: Gui Support Check

        IF NOT  m_stretch_column IS INITIAL.


* Start: Columns needs to be stretched for UTF-8 GUIs
* Note:1314381
            APPEND 'VALUE' TO columns_to_stretch.
            ASSIGN DELTA_TABLE TO <DELTA_TABLE>.

            CALL FUNCTION 'DP_STRETCH_TABLE'
             IMPORTING
               stretched_data_ref  = gt_stretched_table
             TABLES
               data                = <DELTA_TABLE>
               columns_to_stretch  = columns_to_stretch
             EXCEPTIONS
               dp_stretching_error = 1
               OTHERS              = 2.

             if gt_stretched_table IS NOT INITIAL.
               ASSIGN gt_stretched_table->* TO <DELTA_TABLE>.
             endif.

             ASSERT <DELTA_TABLE> IS ASSIGNED.


*     End of Stretch table functionality
             CALL FUNCTION 'DP_CONTROL_ASSIGN_TABLE'
             EXPORTING
                  H_CNTL       = H_CONTROL
                  MEDIUM       = CNDP_MEDIUM_R3TABLE
                  PROPERTYNAME = 'DeltaTable'
             TABLES
                  DATA         = <DELTA_TABLE>
             EXCEPTIONS
                  OTHERS       = 1.
* End Task : YI3K25144

          ELSE.

             CALL FUNCTION 'DP_CONTROL_ASSIGN_TABLE'
                  EXPORTING
                       H_CNTL       = H_CONTROL
                       MEDIUM       = CNDP_MEDIUM_R3TABLE
                       PROPERTYNAME = 'DeltaTable'
                  TABLES
                       DATA         = DELTA_TABLE
                  EXCEPTIONS
                       OTHERS       = 1.
         ENDIF.

      IF SY-SUBRC NE 0.
        RAISE ERROR.
      ENDIF.
  else.
    CALL FUNCTION 'DP_CONTROL_ASSIGN_TABLE'
         EXPORTING
              H_CNTL       = H_CONTROL
              MEDIUM       = CNDP_MEDIUM_R3TABLE
              PROPERTYNAME = 'DeltaTableModified'
         TABLES
              DATA         = DELTA_TABLE
         EXCEPTIONS
              OTHERS       = 1.
    IF SY-SUBRC NE 0.
      RAISE ERROR.
    ENDIF.
  endif.
  invalidate_cache( ).  "B20K8A12D4
ENDMETHOD.


METHOD SET_DRAGDROPID_GRID_BORDER .
  if M_DRAGDROPID_GRID_BORDER ne dragdropid.
    CALL METHOD SET_PROPERTY
      EXPORTING
        PROPERTY = 'DragDropID'
        VALUE    = dragdropid
      EXCEPTIONS
        OTHERS   = 1.
    IF SY-SUBRC NE 0.
      RAISE ERROR.
    ENDIF.
    M_DRAGDROPID_GRID_BORDER = dragdropid.
  endif.
ENDMETHOD.


METHOD SET_DRAGDROPID_GRID_CELLS .
  if M_DRAGDROPID_GRID_CELLS ne dragdropid.
    CALL METHOD SET_PROPERTY
      EXPORTING
        PROPERTY = 'DragDropIDCells'
        VALUE    = dragdropid
      EXCEPTIONS
        OTHERS   = 1.
    IF SY-SUBRC NE 0.
      RAISE ERROR.
    ENDIF.
    M_DRAGDROPID_GRID_CELLS = dragdropid.
  ENDIF.
ENDMETHOD.


METHOD SET_DRAG_DROP_COLS .

  CALL METHOD SET_PROPERTY
   EXPORTING
     PROPERTY = 'DragDropCols'
     VALUE = ENABLE
       EXCEPTIONS
         OTHERS = 1.
    IF SY-SUBRC NE 0.
      RAISE ERROR.
    ENDIF.

ENDMETHOD.


METHOD SET_DRAG_DROP_FIXED_COLS .

  CALL METHOD SET_PROPERTY
   EXPORTING
     PROPERTY = 'DragDropFixedCols'
     VALUE = ENABLE
       EXCEPTIONS
         OTHERS = 1.
    IF SY-SUBRC NE 0.
      RAISE ERROR.
    ENDIF.

ENDMETHOD.


METHOD SET_DRAG_DROP_FIXED_ROWS.

  CALL METHOD SET_PROPERTY
   EXPORTING
     PROPERTY = 'DragDropFixedRows'
     VALUE = ENABLE
       EXCEPTIONS
         OTHERS = 1.
    IF SY-SUBRC NE 0.
      RAISE ERROR.
    ENDIF.

ENDMETHOD.


METHOD SET_DRAG_DROP_ROWS .

  CALL METHOD SET_PROPERTY
   EXPORTING
     PROPERTY = 'DragDropRows'
     VALUE = ENABLE
       EXCEPTIONS
         OTHERS = 1.
    IF SY-SUBRC NE 0.
      RAISE ERROR.
    ENDIF.

ENDMETHOD.


method SET_DROP_DOWN_ITEMS .
  CALL FUNCTION 'DP_CONTROL_ASSIGN_TABLE'
       EXPORTING
            H_CNTL       = H_CONTROL
            MEDIUM       = CNDP_MEDIUM_R3TABLE
            PROPERTYNAME = 'DropDownItems'
       TABLES
            DATA         = DD_ITEMS
       EXCEPTIONS
            OTHERS       = 1.
  IF SY-SUBRC NE 0.
    RAISE ERROR.
  ENDIF.
ENDMETHOD.


method SET_ENTER_KEY_MODE .

  if mode ne m_ENTER_KEY_MODE.
    CALL METHOD SET_PROPERTY
      EXPORTING
        PROPERTY = 'EnterKeyMode'
        VALUE    = MODE
      EXCEPTIONS
        OTHERS   = 1.
    IF SY-SUBRC NE 0.
      RAISE ERROR.
    ENDIF.
    m_ENTER_KEY_MODE = mode.
  endif.
ENDMETHOD.


method SET_ERRORLOGHANDLE.
* ...

if ( me->www_active = 'X' ).

  call method set_property
   exporting
    property = 'ErrorLogHandle'
    p_count = 0
    value = ir_alv->m_guid
  .
endif.

endmethod.


method SET_ERROR_CELLS .
    CALL FUNCTION 'DP_CONTROL_ASSIGN_TABLE'
         EXPORTING
              H_CNTL       = H_CONTROL
              MEDIUM       = CNDP_MEDIUM_R3TABLE
              PROPERTYNAME = 'ErrorCells'
         TABLES
              DATA         = CELL_TABLE
         EXCEPTIONS
              OTHERS       = 1.
    IF SY-SUBRC NE 0.
      RAISE ERROR.
    ENDIF.
ENDMETHOD.


METHOD SET_FIRST_VISIBLE_COL .

  CALL METHOD SET_PROPERTY
   EXPORTING
     PROPERTY = 'FirstVisibleCol'
     VALUE = COL
       EXCEPTIONS
         OTHERS = 1.
    IF SY-SUBRC NE 0.
      RAISE ERROR.
    ENDIF.

  clear M_DYNAMIC_DATA_ACTIVE.

ENDMETHOD.


METHOD SET_FIRST_VISIBLE_COL_ID .

  CALL METHOD SET_PROPERTY
   EXPORTING
     PROPERTY = 'FirstVisibleColID'
     VALUE = COL_ID
       EXCEPTIONS
         OTHERS = 1.
    IF SY-SUBRC NE 0.
      RAISE ERROR.
    ENDIF.

  clear M_DYNAMIC_DATA_ACTIVE.

ENDMETHOD.


method SET_FIRST_VISIBLE_COL_ID2 .

  CALL METHOD CALL_METHOD
  EXPORTING
       METHOD    = 'SetFirstVisibleColIDNumeric'
       P_COUNT   = 1
       P1        = COL_ID
   EXCEPTIONS
      OTHERS = 1.
  IF SY-SUBRC NE 0.
    RAISE ERROR.
  ENDIF.

  clear M_DYNAMIC_DATA_ACTIVE.

ENDMETHOD.


METHOD SET_FIRST_VISIBLE_ROW .

  CALL METHOD SET_PROPERTY
   EXPORTING
     PROPERTY = 'FirstVisibleRow'
     VALUE = ROW
       EXCEPTIONS
         OTHERS = 1.
    IF SY-SUBRC NE 0.
      RAISE ERROR.
    ENDIF.

  clear M_DYNAMIC_DATA_ACTIVE.

ENDMETHOD.


METHOD SET_FIRST_VISIBLE_ROW_ID .

  CALL METHOD SET_PROPERTY
   EXPORTING
     PROPERTY = 'FirstVisibleRowID'
     VALUE = ROW_ID
       EXCEPTIONS
         OTHERS = 1.
    IF SY-SUBRC NE 0.
      RAISE ERROR.
    ENDIF.

  clear M_DYNAMIC_DATA_ACTIVE.

ENDMETHOD.


method SET_FIRST_VISIBLE_ROW_ID2 .

  CALL METHOD CALL_METHOD
  EXPORTING
       METHOD    = 'SetFirstVisibleRowIDNumeric'
       P_COUNT   = 2
       P1        = ROW_ID-ROW_ID
       P2        = ROW_ID-SUB_ROW_ID
   EXCEPTIONS
      OTHERS = 1.
  IF SY-SUBRC NE 0.
    RAISE ERROR.
  ENDIF.

  clear M_DYNAMIC_DATA_ACTIVE.

ENDMETHOD.


METHOD SET_FIXED_COLS .


  CALL METHOD SET_PROPERTY
   EXPORTING
     PROPERTY = 'FixedCols'
     VALUE = COLS
       EXCEPTIONS
         OTHERS = 1.
    IF SY-SUBRC NE 0.
      RAISE ERROR.
    ENDIF.

  if not m_oi_proxy is initial and not m_oi_spreadsheet is initial.
    if not m_oi_spreadsheet is initial.
      call method m_oi_spreadsheet->set_fixed_cols
            exporting columns = cols.
    endif.
  endif.


ENDMETHOD.


METHOD SET_FIXED_ROWS.

  CALL METHOD SET_PROPERTY
   EXPORTING
     PROPERTY = 'FixedRows'
     VALUE = ROWS
       EXCEPTIONS
         OTHERS = 1.
    IF SY-SUBRC NE 0.
      RAISE ERROR.
    ENDIF.

  if not m_oi_proxy is initial and not m_oi_spreadsheet is initial.
    if not m_oi_spreadsheet is initial.
      call method m_oi_spreadsheet->set_fixed_rows
            exporting rows = rows.
    endif.
  endif.

ENDMETHOD.


method SET_GRID_READONLY .

  if readonly ne m_grid_readonly.

    if READONLY is initial and m_dp_modified_cells is initial.
      if m_dp_on_demand_avail eq 'X'.
        data dataref type ref to data.
        get reference of mt_modified_cells into dataref.

        create object m_dp_modified_cells exporting
          data = mt_modified_cells
          dataref = dataref
          USE_CACHE = ' '.

        call method m_dp_modified_cells->control_assign_prop
          EXPORTING
            control   = me
            property  = 'ModifiedCellsOnDemand'
            firstline = 1.
      endif.
    endif.

    CALL METHOD SET_PROPERTY
      EXPORTING
        PROPERTY = 'GridReadOnly'
        VALUE    = READONLY
      EXCEPTIONS
        OTHERS   = 1.
    IF SY-SUBRC NE 0.
      RAISE ERROR.
    ENDIF.
    m_grid_readonly = readonly.
  endif.
ENDMETHOD.


method SET_HEADER_FOR_OI.
  if not m_oi_proxy is initial and not m_oi_spreadsheet is initial.
    call method m_oi_spreadsheet->set_header
          exporting header = it_header.
  endif.
endmethod.


method SET_HIGHEST_ROW_ID .

  CALL METHOD SET_PROPERTY
   EXPORTING
     PROPERTY = 'HighestRowID'
     VALUE = ROW_ID
       EXCEPTIONS
         OTHERS = 1.
    IF SY-SUBRC NE 0.
      RAISE ERROR.
    ENDIF.

ENDMETHOD.


METHOD SET_HORIZONTAL_GRID_LINES.

  if M_HORIZONTAL_GRID_LINES ne visible.
    CALL METHOD SET_PROPERTY
      EXPORTING
        PROPERTY = 'HorizontalGridLines'
        VALUE    = VISIBLE
      EXCEPTIONS
        OTHERS   = 1.
    IF SY-SUBRC NE 0.
      RAISE ERROR.
    ENDIF.
    M_HORIZONTAL_GRID_LINES = visible.
  endif.
ENDMETHOD.


METHOD SET_HORIZONTAL_SCROLLBARS .

  CALL METHOD SET_PROPERTY
   EXPORTING
     PROPERTY = 'HScrollBar'
     VALUE = ENABLE
       EXCEPTIONS
         OTHERS = 1.
    IF SY-SUBRC NE 0.
      RAISE ERROR.
    ENDIF.

ENDMETHOD.


method SET_HYPERLINKS .
  CALL FUNCTION 'DP_CONTROL_ASSIGN_TABLE'
       EXPORTING
            H_CNTL       = H_CONTROL
            MEDIUM       = CNDP_MEDIUM_R3TABLE
            PROPERTYNAME = 'HyperLinks'
       TABLES
            DATA         = LINKS_TABLE
       EXCEPTIONS
            OTHERS       = 1.
  IF SY-SUBRC NE 0.
    RAISE ERROR.
  ENDIF.
ENDMETHOD.


METHOD SET_INFO_TABLE.

* CATT
  if catt_active <> space.
    if catt_recording <> space.
      CALL FUNCTION 'CAT_GRID_COPY_FINFO'
           TABLES
                INFO_TABLE = info_table.
    endif.
  endif.

* Start of Stretch table functionality - YI2K008428

 FIELD-SYMBOLS : <INFO_TABLE> TYPE TABLE.
 ASSIGN INFO_TABLE TO <INFO_TABLE>.


  DATA: gt_stretched_table TYPE REF TO data.
  DATA: columns_to_stretch TYPE table_of_strings.
  DATA: m_stretch_column TYPE c length 1.



* Start: Columns needs to be stretched for UTF-8 GUIs
* Note:1314381
  APPEND 'TEXT' TO columns_to_stretch.
  APPEND 'TOOLTIP' TO columns_to_stretch.
  APPEND 'TEXT_M' TO columns_to_stretch.
  APPEND 'TEXT_S' TO columns_to_stretch.
  APPEND 'REPTEXT' TO columns_to_stretch.
* Note:1314381
* End: Columns needs to be stretched for UTF-8 GUIs

* Start: Gui Support Check
CALL METHOD CL_GUI_FRONTEND_SERVICES=>CHECK_GUI_SUPPORT
  EXPORTING
    COMPONENT            = 'gridview'
    FEATURE_NAME         = 'stretchingHeader'
  RECEIVING
    RESULT               =  m_stretch_column
  EXCEPTIONS
    CNTL_ERROR           = 1
    ERROR_NO_GUI         = 2
    WRONG_PARAMETER      = 3
    NOT_SUPPORTED_BY_GUI = 4
    UNKNOWN_ERROR        = 5
    others               = 6.

IF SY-SUBRC <> 0.
 m_stretch_column = ABAP_FALSE.
ENDIF.
* End: Gui Support Check

IF NOT  m_stretch_column IS INITIAL.

  " stretch the above column if needed
  CALL FUNCTION 'DP_STRETCH_TABLE'
    IMPORTING
      stretched_data_ref  = gt_stretched_table
    TABLES
      data                = <INFO_TABLE>
      columns_to_stretch  = columns_to_stretch
    EXCEPTIONS
      dp_stretching_error = 1
      OTHERS              = 2.

    if gt_stretched_table IS NOT INITIAL.
      ASSIGN gt_stretched_table->* TO <INFO_TABLE>.
    endif.

    ASSERT <INFO_TABLE> IS ASSIGNED.
endif.
* End of Stretch table functionality

* Start: Assign stretched Header data to DP

* CATT
  CALL FUNCTION 'DP_CONTROL_ASSIGN_TABLE'
       EXPORTING
            H_CNTL       = H_CONTROL
            MEDIUM       = CNDP_MEDIUM_R3TABLE
            PROPERTYNAME = 'InfoTable'
       TABLES
            DATA         = <INFO_TABLE>
       EXCEPTIONS
            OTHERS       = 1.
  IF SY-SUBRC NE 0.
    RAISE ERROR.
  ENDIF.
* End: Assign stretched Header data to DP - YI2K008428

  if not m_oi_proxy       is initial and
     not m_oi_spreadsheet is initial and  "Y6BK076017
       ( m_view           eq cl_gui_alv_grid=>mc_fc_view_excel
      or m_view           eq cl_gui_alv_grid=>mc_fc_view_lotus ).
    M_BUF_MT_INFO[] = info_table[].
    call method m_oi_spreadsheet->set_info_table
          changing info_table = M_BUF_MT_INFO.
  endif.

*<<< YI3K120759 memory lead in webgui
  clear m_col_pos_table.

  if not M_DP_ON_DEMAND_WRITABLE is initial.
    data dataref type ref to data.

* col pos table
*    clear m_col_pos_table.   "YI3K120759

    if not m_dp_col_pos_table is initial.
      call method m_dp_col_pos_table->free_gui_table.
      clear m_dp_col_pos_table.
    endif.

    get reference of m_col_pos_table into dataref.

    create object m_dp_col_pos_table exporting
      data = m_col_pos_table
      dataref = dataref
      USE_CACHE = ' '.

    call method m_dp_col_pos_table->control_assign_prop exporting
      control = me
      property = 'ColPosIDOnDemand'
      firstline = 1.

* selected cols table
    clear m_selected_cols.

    if not m_dp_selected_cols is initial.
      call method m_dp_selected_cols->free_gui_table.
      clear m_dp_selected_cols.
    endif.

    get reference of m_selected_cols into dataref.

    create object m_dp_selected_cols exporting
      data = m_selected_cols
      dataref = dataref
      USE_CACHE = ' '.

    call method m_dp_selected_cols->control_assign_prop exporting
      control = me
      property = 'SelectedColsOnDemand'
      firstline = 1.

  endif.

* save mapping from id to fielsname for further use
  data wa_info type lvc_s_info.
  data wa_map type s_COLID_TO_FIELDNAME.
  data wa_col_pos type LVC_S_CO01.

  clear M_COLID_TO_FIELDNAME.

  loop at info_table into wa_info.
    wa_map-col_id = wa_info-col_id.
    wa_map-fieldname = wa_info-fieldname.
    append wa_map to M_COLID_TO_FIELDNAME.

    wa_col_pos-col_id = wa_info-col_id.
    wa_col_pos-outputlen = wa_info-outputlen.
    append wa_col_pos to M_COL_POS_TABLE.
  endloop.

  m_col_pos_table_valid = 'X'.

ENDMETHOD.


method SET_LEFT_COL_SYNC .

  if grid is initial.
* normally in this situation a NULL reference should have been used to
* indicate that no more syncs must be done. But the automation queue
* cannot handle NULL references. So the reference to the control
* itself is used for this purpose. At the client the code checks
* if the reference is a reference to the control and then removes
* all references to the 'synced' controls.
    CALL METHOD SET_PROPERTY
      EXPORTING
        PROPERTY = 'LeftColSync'
        VALUE    = H_CONTROL
      EXCEPTIONS
        OTHERS   = 1.
    IF SY-SUBRC NE 0.
      RAISE ERROR.
    ENDIF.
  else.
    CALL METHOD SET_PROPERTY
      EXPORTING
        PROPERTY = 'LeftColSync'
        VALUE    = GRID->H_CONTROL
      EXCEPTIONS
        OTHERS   = 1.
    IF SY-SUBRC NE 0.
      RAISE ERROR.
    ENDIF.
  endif.

ENDMETHOD. "SET_LEFT_COL_SYNC


method SET_PAGINGPAGESIZE.

 m_pagingpagesize = pagingpagesize.
 if ( www_active is initial ).
   exit.
 endif.
 CALL METHOD CALL_METHOD
  EXPORTING
       METHOD    = 'PagingPagesize'
       P_COUNT   = 1
       P1        = m_PagingPagesize
   EXCEPTIONS
      OTHERS = 1.
  IF SY-SUBRC NE 0.
    RAISE ERROR.
  ENDIF.

endmethod.


METHOD SET_REGISTERED_EVENTS.

* check handle
  IF H_CONTROL IS INITIAL.
    RAISE CNTL_ERROR.
  ENDIF.

  DATA: SIMPLE_EVENT TYPE CNTL_SIMPLE_EVENT, "// event
        EX_EVENT     TYPE CNTL_EVENT,  "// eventid, is_shellevent
        EVENTS_EX TYPE CNTL_EVENTS.    "// table

* subclasses modify code here .........................................*

  LOOP AT EVENTS INTO SIMPLE_EVENT.
*   map simple_event into ex_event, append to events_ex
*   default - implementation does simple mapping
    CLEAR EX_EVENT.
    EX_EVENT-EVENTID = SIMPLE_EVENT-EVENTID.
    EX_EVENT-IS_SHELLEVENT = SPACE.
    IF SIMPLE_EVENT-APPL_EVENT IS INITIAL.
      EX_EVENT-IS_SYSTEMEVENT = 'X'.
    ENDIF.
    APPEND EX_EVENT TO EVENTS_EX.
  ENDLOOP.

* end of modifications .................................................

  CALL METHOD ME->SET_REGISTERED_EVENTS_EX
    EXPORTING
      EVENTTAB = EVENTS_EX
    EXCEPTIONS
      CNTL_ERROR                = 1
      CNTL_SYSTEM_ERROR         = 2
      ILLEGAL_EVENT_COMBINATION = 3
      OTHERS                    = 4.

  CASE SY-SUBRC.
    WHEN 0.
    WHEN 1. RAISE CNTL_ERROR.
    WHEN 2. RAISE CNTL_SYSTEM_ERROR.
    WHEN 3. RAISE ILLEGAL_EVENT_COMBINATION.
    WHEN OTHERS. RAISE CNTL_ERROR.
  ENDCASE.

  REGISTERED_SIMPLE_EVENTS[] = EVENTS.
ENDMETHOD.


METHOD SET_RESIZE_COLS .

  CALL METHOD SET_PROPERTY
   EXPORTING
     PROPERTY = 'ColResize'
     VALUE = ENABLE
       EXCEPTIONS
         OTHERS = 1.
    IF SY-SUBRC NE 0.
      RAISE ERROR.
    ENDIF.

ENDMETHOD.


METHOD SET_RESIZE_ROWS .

  CALL METHOD SET_PROPERTY
   EXPORTING
     PROPERTY = 'RowResize'
     VALUE = ENABLE
       EXCEPTIONS
         OTHERS = 1.
    IF SY-SUBRC NE 0.
      RAISE ERROR.
    ENDIF.

ENDMETHOD.


method SET_ROWS_MOVED .

  CALL METHOD SET_PROPERTY
   EXPORTING
     PROPERTY = 'RowsMoved'
     VALUE = MOVED
       EXCEPTIONS
         OTHERS = 1.
  IF SY-SUBRC NE 0.
    RAISE ERROR.
  ENDIF.

ENDMETHOD.


method SET_ROW_DELETE_ALLOWED .

  if m_ROW_DELETE_ALLOWED ne allowed.
    CALL METHOD SET_PROPERTY
      EXPORTING
        PROPERTY = 'RowDeleteAllowed'
        VALUE    = allowed
      EXCEPTIONS
        OTHERS   = 1.
    IF SY-SUBRC NE 0.
      RAISE ERROR.
    ENDIF.
    M_ROW_DELETE_ALLOWED = allowed.
  endif.
ENDMETHOD.


METHOD SET_ROW_HEADER_VISIBLE .

  CALL METHOD SET_PROPERTY
   EXPORTING
     PROPERTY = 'RowHeaderVisible'
     VALUE = VISIBLE
       EXCEPTIONS
         OTHERS = 1.
    IF SY-SUBRC NE 0.
      RAISE ERROR.
    ENDIF.

ENDMETHOD.


method SET_ROW_ID .
  data dataref type ref to data.

* enable caching of selected rows
  if m_cache_selected_rows is not initial.
    clear M_SELECTED_ROWS.
    data: wa type lvc_s_roid.
    wa-row_id = -1.
    wa-sub_row_id = -1.
    append wa to m_selected_rows.

    if not M_DP_SELECTED_ROWS is initial.
      call method M_DP_SELECTED_ROWS->free_gui_table.
      clear M_DP_SELECTED_ROWS.
    endif.

    get reference of M_SELECTED_ROWS into dataref.

    create object M_DP_SELECTED_ROWS exporting
      data = M_SELECTED_ROWS
      dataref = dataref
      USE_CACHE = ' '.

    call method M_DP_SELECTED_ROWS->control_assign_prop exporting
      control = me
      property = 'SelectedRowsOnDemand'.
  endif.

* save row id for futher use in get_row_id
  MT_ROW_ID_CACHE = ROW_ID_TABLE.

  if not M_DP_ON_DEMAND_WRITABLE is initial.
    data lines type i.

    if not m_dp_row_id is initial.
      call method m_dp_row_id->free_gui_table.
      clear m_dp_row_id.
    endif.

    describe table MT_ROW_ID_CACHE lines lines.
    get reference of MT_ROW_ID_CACHE into dataref.

    create object m_dp_ROW_ID exporting
      data = MT_ROW_ID_CACHE
      dataref = dataref
      USE_CACHE = ' '.

    call method m_dp_row_id->control_assign_prop
      EXPORTING
        control   = me
        property  = 'RowIDNumericOnDemand'
        firstline = 1
        nlines    = lines.

  else.
    CALL FUNCTION 'DP_CONTROL_ASSIGN_TABLE'
      EXPORTING
        H_CNTL       = H_CONTROL
        MEDIUM       = CNDP_MEDIUM_R3TABLE
        PROPERTYNAME = 'RowIDNumeric'
      TABLES
        DATA         = ROW_ID_TABLE
      EXCEPTIONS
        OTHERS       = 1.
    IF SY-SUBRC NE 0.
      RAISE ERROR.
    ENDIF.
  endif.

ENDMETHOD.                    "SET_ROW_ID


method SET_ROW_INSERT_ALLOWED .

if M_ROW_INSERT_ALLOWED ne allowed.
  CALL METHOD SET_PROPERTY
   EXPORTING
     PROPERTY = 'RowInsertAllowed'
     VALUE = allowed
       EXCEPTIONS
         OTHERS = 1.
  IF SY-SUBRC NE 0.
    RAISE ERROR.
  ENDIF.
  M_ROW_INSERT_ALLOWED = allowed.
endif.
ENDMETHOD.


METHOD SET_SELECTED_CELLS_BASE .

  CALL FUNCTION 'DP_CONTROL_ASSIGN_TABLE'
       EXPORTING
            H_CNTL       = H_CONTROL
            MEDIUM       = CNDP_MEDIUM_R3TABLE
            PROPERTYNAME = 'SelectedCells'
       TABLES
            DATA         = CELL_TABLE
       EXCEPTIONS
         OTHERS = 1.
    IF SY-SUBRC NE 0.
      RAISE ERROR.
    ENDIF.

ENDMETHOD.


method SET_SELECTED_CELLS_BASE_ID2 .

  if keep_other_selections is initial.
    CALL FUNCTION 'DP_CONTROL_ASSIGN_TABLE'
         EXPORTING
              H_CNTL       = H_CONTROL
              MEDIUM       = CNDP_MEDIUM_R3TABLE
              PROPERTYNAME = 'SelectedCells3'
         TABLES
              DATA         = CELL_TABLE
         EXCEPTIONS
           OTHERS = 1.
  else.
    CALL FUNCTION 'DP_CONTROL_ASSIGN_TABLE'
         EXPORTING
              H_CNTL       = H_CONTROL
              MEDIUM       = CNDP_MEDIUM_R3TABLE
              PROPERTYNAME = 'SelectedCellsKeepOthers'
         TABLES
              DATA         = CELL_TABLE
         EXCEPTIONS
           OTHERS = 1.
  endif.
  IF SY-SUBRC NE 0.
    RAISE ERROR.
  ENDIF.
ENDMETHOD.


method SET_SELECTED_CELLS_BASE_RANGE .

  CALL FUNCTION 'DP_CONTROL_ASSIGN_TABLE'
       EXPORTING
            H_CNTL       = H_CONTROL
            MEDIUM       = CNDP_MEDIUM_R3TABLE
            PROPERTYNAME = 'SelectedCells2'
       TABLES
            DATA         = CELL_TABLE
       EXCEPTIONS
         OTHERS = 1.
    IF SY-SUBRC NE 0.
      RAISE ERROR.
    ENDIF.

ENDMETHOD.


METHOD SET_SELECTED_COLUMNS_BASE .

  CALL FUNCTION 'DP_CONTROL_ASSIGN_TABLE'
       EXPORTING
            H_CNTL       = H_CONTROL
            MEDIUM       = CNDP_MEDIUM_R3TABLE
            PROPERTYNAME = 'SelectedColumns'
       TABLES
            DATA         = COL_TABLE
       EXCEPTIONS
         OTHERS = 1.
    IF SY-SUBRC NE 0.
      RAISE ERROR.
    ENDIF.

ENDMETHOD.














method SET_SELECTED_COLUMNS_BASE_ID2 .

  if keep_other_selections is initial.
    CALL FUNCTION 'DP_CONTROL_ASSIGN_TABLE'
         EXPORTING
              H_CNTL       = H_CONTROL
              MEDIUM       = CNDP_MEDIUM_R3TABLE
              PROPERTYNAME = 'SelectedCols2'
         TABLES
              DATA         = COL_TABLE
         EXCEPTIONS
           OTHERS = 1.
  else.
    CALL FUNCTION 'DP_CONTROL_ASSIGN_TABLE'
         EXPORTING
              H_CNTL       = H_CONTROL
              MEDIUM       = CNDP_MEDIUM_R3TABLE
              PROPERTYNAME = 'SelectedColsKeepOthers'
         TABLES
              DATA         = COL_TABLE
         EXCEPTIONS
           OTHERS = 1.
  endif.

  IF SY-SUBRC NE 0.
    RAISE ERROR.
  ENDIF.
ENDMETHOD.


METHOD SET_SELECTED_ROWS_BASE .

  CALL FUNCTION 'DP_CONTROL_ASSIGN_TABLE'
       EXPORTING
            H_CNTL       = H_CONTROL
            MEDIUM       = CNDP_MEDIUM_R3TABLE
            PROPERTYNAME = 'SelectedRows'
       TABLES
            DATA         = ROW_TABLE
       EXCEPTIONS
         OTHERS = 1.
    IF SY-SUBRC NE 0.
      RAISE ERROR.
    ENDIF.

  clear m_selected_rows.
  data: wa type lvc_s_roid.
  wa-row_id = -1.
  wa-sub_row_id = -1.
  append wa to m_selected_rows.

ENDMETHOD.


method SET_SELECTED_ROWS_BASE_RANGE .

  CALL FUNCTION 'DP_CONTROL_ASSIGN_TABLE'
       EXPORTING
            H_CNTL       = H_CONTROL
            MEDIUM       = CNDP_MEDIUM_R3TABLE
            PROPERTYNAME = 'SelectedRows2'
       TABLES
            DATA         = ROW_TABLE
       EXCEPTIONS
         OTHERS = 1.
    IF SY-SUBRC NE 0.
      RAISE ERROR.
    ENDIF.

  clear m_selected_rows.
  data: wa type lvc_s_roid.
  wa-row_id = -1.
  wa-sub_row_id = -1.
  append wa to m_selected_rows.

ENDMETHOD.


method SET_SELECTED_ROWS_ID_BASE .

  if keep_other_selections is initial.
    CALL FUNCTION 'DP_CONTROL_ASSIGN_TABLE'
         EXPORTING
              H_CNTL       = H_CONTROL
              MEDIUM       = CNDP_MEDIUM_R3TABLE
              PROPERTYNAME = 'SelectedRows3'
         TABLES
              DATA         = ROW_TABLE
         EXCEPTIONS
           OTHERS = 1.
  else.
    CALL FUNCTION 'DP_CONTROL_ASSIGN_TABLE'
         EXPORTING
              H_CNTL       = H_CONTROL
              MEDIUM       = CNDP_MEDIUM_R3TABLE
              PROPERTYNAME = 'SelectedRowsKeepOthers'
         TABLES
              DATA         = ROW_TABLE
         EXCEPTIONS
           OTHERS = 1.
  endif.

  clear m_selected_rows.
  data: wa type lvc_s_roid.
  wa-row_id = -1.
  wa-sub_row_id = -1.
  append wa to m_selected_rows.

  IF SY-SUBRC NE 0.
    RAISE ERROR.
  ENDIF.

ENDMETHOD.


METHOD SET_SELECTION_MODE_BASE .

  if mode ne m_SELECTION_MODE.
    CALL METHOD SET_PROPERTY
      EXPORTING
        PROPERTY = 'SelectionMode'
        VALUE    = MODE
      EXCEPTIONS
        OTHERS   = 1.
    IF SY-SUBRC NE 0.
      RAISE ERROR.
    ENDIF.
    m_SELECTION_MODE = mode.
  endif.
ENDMETHOD.


method set_single_col_auto_resize .

  if m_single_col_auto_resize ne enable.
    call method set_property
      exporting
        property = 'SingleColAutoResize'
        value    = enable
      exceptions
        others   = 1.
    if sy-subrc ne 0.
      raise error.
    endif.
    m_single_col_auto_resize = enable.
  endif.
endmethod.


method SET_SYMBOL_INFO .

  IF m_acc_mode is not initial.             "TRUE
    CALL METHOD CALL_METHOD
      EXPORTING
        METHOD  = 'SetSymbolInfo'
        P_COUNT = 2
        P1      = SYMBOL
        P2      = INFO
      EXCEPTIONS
        OTHERS  = 1.
  ENDIF.

endmethod.


method SET_TABS .

  CALL FUNCTION 'DP_CONTROL_ASSIGN_TABLE'
       EXPORTING
            H_CNTL       = H_CONTROL
            MEDIUM       = CNDP_MEDIUM_R3TABLE
            PROPERTYNAME = 'TabItems'
       TABLES
            DATA         = TAB_TABLE
       EXCEPTIONS
         OTHERS = 1.
    IF SY-SUBRC NE 0.
      RAISE ERROR.
    ENDIF.

ENDMETHOD.


method SET_TEXTPOOL.

  if www_active is initial.
    exit.
  endif.

  CALL FUNCTION 'DP_CONTROL_ASSIGN_TABLE'
       EXPORTING
            H_CNTL       = H_CONTROL
            MEDIUM       = CNDP_MEDIUM_R3TABLE
            PROPERTYNAME = 'TextPoolTable'
       TABLES
            DATA         = MT_TEXTPOOL
       EXCEPTIONS
            OTHERS       = 1.
  IF SY-SUBRC NE 0.
    RAISE ERROR.
  ENDIF.

endmethod.


METHOD SET_TITLE_SIZE .

  if M_TITLE_SIZE ne size.
    CALL METHOD SET_PROPERTY
      EXPORTING
        PROPERTY = 'TitleSize'
        VALUE    = SIZE
      EXCEPTIONS
        OTHERS   = 1.
    IF SY-SUBRC NE 0.
      RAISE ERROR.
    ENDIF.
    M_TITLE_SIZE = size.
  endif.
ENDMETHOD.


METHOD SET_TITLE_STYLE .

  if M_TITLE_STYLE ne style.
    CALL METHOD SET_PROPERTY
      EXPORTING
        PROPERTY = 'TitleStyle'
        VALUE    = STYLE
      EXCEPTIONS
        OTHERS   = 1.
    IF SY-SUBRC NE 0.
      RAISE ERROR.
    ENDIF.
    M_TITLE_STYLE = style.
  endif.
ENDMETHOD.


METHOD SET_TITLE_TEXT .

  if M_TITLE_TEXT ne text.
    CALL METHOD SET_PROPERTY
      EXPORTING
        PROPERTY = 'Title'                                  "#EC NOTEXT
        VALUE    = TEXT
      EXCEPTIONS
        OTHERS   = 1.
    IF SY-SUBRC NE 0.
      RAISE ERROR.
    ENDIF.
    M_TITLE_TEXT = text.
  endif.
ENDMETHOD.


METHOD SET_TOOLBAR_BUTTONS .

  data: lt_ttb type ttb_button.
  data: ls_ttb type stb_button.
  data: lflg_found(1) type c.
  data: l_tabix type sy-tabix.

  lt_ttb = toolbar_table.

  loop at lt_ttb into ls_ttb.
    if sy-tabix = 1 and ls_ttb-BUTN_TYPE = 3.
      delete lt_ttb.
      lflg_found = 'X'.
      continue.
    endif.
    if lflg_found = 'X' and ls_ttb-BUTN_TYPE = 3.
      delete lt_ttb.
    elseif ls_ttb-BUTN_TYPE = 3.
      lflg_found = 'X'.
      continue.
    endif.
    if ls_ttb-BUTN_TYPE ne 3.
      clear lflg_found.
    endif.
  endloop.
  if sy-subrc = 0.
    if ls_ttb-BUTN_TYPE = 3.
      describe table lt_ttb lines l_tabix.
      if ( l_tabix > 0 ).
        delete lt_ttb index l_tabix.
      endif.
    endif.
  endif.


  describe table lt_ttb lines m_number_toolbar_buttons.

* Data: Declare all the necessary variables
  FIELD-SYMBOLS : <TOOLBAR_TABLE> TYPE TABLE.
  ASSIGN lt_ttb TO <TOOLBAR_TABLE>.

  DATA: gt_stretched_table TYPE REF TO data.
  DATA: columns_to_stretch TYPE table_of_strings.
  DATA: m_stretch_column TYPE c length 1.

* We need to stretch three columns only

  APPEND 'QUICKINFO' TO columns_to_stretch.
  APPEND 'TEXT' TO columns_to_stretch.
  APPEND 'ICON' TO columns_to_stretch.

* Start: Gui Support Check
  CALL METHOD CL_GUI_FRONTEND_SERVICES=>CHECK_GUI_SUPPORT
    EXPORTING
      COMPONENT            = 'gridview'
      FEATURE_NAME         = 'stretchingToolbar'
    RECEIVING
      RESULT               =  m_stretch_column
    EXCEPTIONS
      CNTL_ERROR           = 1
      ERROR_NO_GUI         = 2
      WRONG_PARAMETER      = 3
      NOT_SUPPORTED_BY_GUI = 4
      UNKNOWN_ERROR        = 5
      others               = 6.

  IF SY-SUBRC <> 0.
   m_stretch_column = ABAP_FALSE.
  ENDIF.


  IF NOT  m_stretch_column IS INITIAL.

* stretch the above column if needed
  CALL FUNCTION 'DP_STRETCH_TABLE'
    IMPORTING
      stretched_data_ref  = gt_stretched_table
    TABLES
      data                = <TOOLBAR_TABLE>
      columns_to_stretch  = columns_to_stretch
    EXCEPTIONS
      dp_stretching_error = 1
      OTHERS              = 2.

    if gt_stretched_table IS NOT INITIAL.
      ASSIGN gt_stretched_table->* TO <TOOLBAR_TABLE>.
    endif.

    ASSERT <TOOLBAR_TABLE> IS ASSIGNED.
endif.



  CALL FUNCTION 'DP_CONTROL_ASSIGN_TABLE'
       EXPORTING
            H_CNTL       = H_CONTROL
            MEDIUM       = CNDP_MEDIUM_R3TABLE
            PROPERTYNAME = 'ToolBarButtonsTable2'
       TABLES
            DATA         = <TOOLBAR_TABLE>
       EXCEPTIONS
         OTHERS = 1.
    IF SY-SUBRC NE 0.
      RAISE ERROR.
    ENDIF.

ENDMETHOD.


method SET_TOOLBAR_MENU_STATIC .

  DATA GUIOBJECT TYPE REF TO CL_GUI_OBJECT.
  CALL METHOD CL_CTXMNU_MGR=>CREATE_PROXY
        EXPORTING MENU = TOOLBAR_MENU
        CHANGING  GUIOBJECT = GUIOBJECT
  EXCEPTIONS EMPTY_OBJ = 1
             OTHERS = 2.
  IF SY-SUBRC EQ 2.
    RAISE ERROR.
  ENDIF.

  IF SY-SUBRC EQ 0.
    CALL METHOD CALL_METHOD
          EXPORTING METHOD = 'SetToolBarMenuStatic'
                    P_COUNT   = 2
                    P1        = FUNCTION
                    P2        = GUIOBJECT->H_CONTROL
    EXCEPTIONS OTHERS = 1.
    IF SY-SUBRC NE 0.
      RAISE ERROR.
    ENDIF.

    CALL METHOD GUIOBJECT->FREE
          EXCEPTIONS OTHERS = 1.
    IF SY-SUBRC NE 0.
      RAISE ERROR.
    ENDIF.
  ENDIF.
ENDMETHOD.


METHOD SET_TOOLBAR_STYLE .

  CALL METHOD SET_PROPERTY
   EXPORTING
     PROPERTY = 'ToolBarStyle'
     VALUE = STYLE
       EXCEPTIONS
         OTHERS = 1.
    IF SY-SUBRC NE 0.
      RAISE ERROR.
    ENDIF.

ENDMETHOD.


METHOD SET_TOOLBAR_VISIBLE .

  if m_toolbar_visible ne visible.
    m_toolbar_visible = visible.
    CALL METHOD SET_PROPERTY
      EXPORTING
        PROPERTY = 'ToolBarVisible'
        VALUE    = VISIBLE
      EXCEPTIONS
        OTHERS   = 1.
    IF SY-SUBRC NE 0.
      RAISE ERROR.
    ENDIF.
  endif.
ENDMETHOD.


method SET_TOOLBAR_WRAP .

  if M_TOOLBAR_WRAP ne wrap.
    CALL METHOD SET_PROPERTY
      EXPORTING
        PROPERTY = 'ToolBarWrap'
        VALUE    = WRAP
      EXCEPTIONS
        OTHERS   = 1.
    IF SY-SUBRC NE 0.
      RAISE ERROR.
    ENDIF.
    M_TOOLBAR_WRAP = wrap.
  endif.
ENDMETHOD.


method SET_TOTAL_ARROWS .

  CALL METHOD SET_PROPERTY
   EXPORTING
     PROPERTY = 'TotalArrows'
     VALUE = visible
       EXCEPTIONS
         OTHERS = 1.
    IF SY-SUBRC NE 0.
      RAISE ERROR.
    ENDIF.

ENDMETHOD.


method SET_TOTAL_EXPANDERS .

  if visible ne M_TOTAL_EXPANDERS.
    CALL METHOD SET_PROPERTY
      EXPORTING
        PROPERTY = 'TotalExpanders'
        VALUE    = visible
      EXCEPTIONS
        OTHERS   = 1.
    IF SY-SUBRC NE 0.
      RAISE ERROR.
    ENDIF.
    M_TOTAL_EXPANDERS = visible.
  endif.

ENDMETHOD.


method SET_TOTAL_LINES_ABOVE .

  CALL METHOD SET_PROPERTY
   EXPORTING
     PROPERTY = 'TotalLinesAbove'
     VALUE = ABOVE
       EXCEPTIONS
         OTHERS = 1.
    IF SY-SUBRC NE 0.
      RAISE ERROR.
    ENDIF.

ENDMETHOD.


METHOD SET_VERTICAL_GRID_LINES .

  if M_VERTICAL_GRID_LINES ne visible.
    CALL METHOD SET_PROPERTY
      EXPORTING
        PROPERTY = 'VerticalGridLines'
        VALUE    = VISIBLE
      EXCEPTIONS
        OTHERS   = 1.
    IF SY-SUBRC NE 0.
      RAISE ERROR.
    ENDIF.
    M_VERTICAL_GRID_LINES = VISIBLE.
  endif.
ENDMETHOD.


METHOD SET_VERTICAL_SCROLLBARS .

  CALL METHOD SET_PROPERTY
   EXPORTING
     PROPERTY = 'VScrollBar'
     VALUE = ENABLE
       EXCEPTIONS
         OTHERS = 1.
    IF SY-SUBRC NE 0.
      RAISE ERROR.
    ENDIF.

ENDMETHOD.


method SET_VIEW_CRYSTAL.
* ...

* at the current stage we donnot support changing the template in the
* active control.
*
*
if ( not m_alvexp_control is initial ).
  call method m_alvexp_control->set_visible( ' ' ).
  call method m_alvexp_control->free.
  clear m_alvexp_control.
endif.
*
if ( m_alvexp_control is initial ).
  if ( m_dbgparent is initial ).
   call method create_view_crystal
        exporting i_parent = parent
                  i_doc_url = i_doc_url
                  I_fadriver_Handle = i_fadriver_handle
                  i_datasource_string = i_datasource_string
                  i_mode = 'E' " irrelevant.
                  exceptions others = 1.
  else.
   call method create_view_crystal
       exporting i_parent = m_dbgparent
                  I_doc_url = i_doc_url
                  I_fadriver_Handle = i_fadriver_handle
                  i_datasource_string = i_datasource_string
                 exceptions others = 1.
  endif.
else.
 call method m_alvexp_control->set_visible
           exporting visible = 'X'.
endif.
* set the local cache variables in any case.
m_crystal_url = i_doc_url.
m_cr_fadriver_handle = i_fadriver_handle.
m_cr_datasource_string = i_datasource_string.


if ( sy-subrc = 0 ).
 call method set_visible_view
                exporting i_view = cl_gui_alv_grid=>mc_FC_VIEW_CRYSTAL.

endif.



endmethod.


METHOD set_view_excel.
* ...
**  clear m_oi_control. " enforce creation of new Excel. <
*  if ( not m_oi_proxy is initial ).
*    call Method m_oi_proxy->close_document.
*    free m_oi_proxy.
*  endif.
*  if ( not m_oi_control is initial ).
*    call method m_oi_control->destroy_control.
*    free m_oi_control.
*  endif.
  remove_oi_objects( ).

  IF ( m_oi_control IS INITIAL ).

    IF ( m_dbgparent IS INITIAL ).
      CALL METHOD create_view_oi
           EXPORTING parent = parent
                     doc_url = i_doc_url
                     mode = 'E'        " Excel-Inplace .
                     EXCEPTIONS OTHERS = 1.
      IF sy-subrc <> 0.
        RAISE failed.
      ENDIF.
    ELSE.
      CALL METHOD create_view_oi
          EXPORTING parent = m_dbgparent
                     doc_url = i_doc_url
                     mode = 'E'        " Excel-Inplace .
                     EXCEPTIONS OTHERS = 1.
      IF sy-subrc <> 0.
        RAISE failed.
      ENDIF.

    ENDIF.
  ELSE.
    " this never happens !
    " currently we always reinstantiate the Excel-Proxy
  ENDIF.
  IF ( sy-subrc <> 0 ).
    RAISE failed.
  ENDIF.
  CALL METHOD set_visible_view
     EXPORTING i_view = cl_gui_alv_grid=>mc_fc_view_excel.
ENDMETHOD.


method SET_VIEW_LOTUS .
* ...
**  clear m_oi_control. " enforce creation of new Excel. <
*  if ( not m_oi_proxy is initial ).
*    call Method m_oi_proxy->close_document.
*    free m_oi_proxy.
*  endif.
*  if ( not m_oi_control is initial ).
*    call method m_oi_control->destroy_control.
*    free m_oi_control.
*  endif.
  remove_oi_objects( ).

  IF ( m_oi_control IS INITIAL ).

    IF ( m_dbgparent IS INITIAL ).
      CALL METHOD create_view_oi
           EXPORTING parent = parent
                     doc_url = i_doc_url
                     doc_type = 'Lotus123.Workbook'
                     mode = 'E'        " Lotus-Inplace .
                     EXCEPTIONS OTHERS = 1.
      IF sy-subrc <> 0.
        RAISE failed.
      ENDIF.
    ELSE.
      CALL METHOD create_view_oi
          EXPORTING parent = m_dbgparent
                     doc_url = i_doc_url
                     doc_type = 'Lotus123.Workbook'
                     mode = 'E'        " Lotus-Inplace .
                     EXCEPTIONS OTHERS = 1.
      IF sy-subrc <> 0.
        RAISE failed.
      ENDIF.

    ENDIF.
  ELSE.
    " this never happens !
    " currently we always reinstantiate the Lotus-Proxy
  ENDIF.
  IF ( sy-subrc <> 0 ).
    RAISE failed.
  ENDIF.
  CALL METHOD set_visible_view
     EXPORTING i_view = cl_gui_alv_grid=>mc_fc_view_lotus.
ENDMETHOD.


method SET_VISIBLE_VIEW .
* ...

  data align type i.
  if ( i_view <> cl_gui_alv_grid=>mc_fc_view_grid )
    and m_dbgparent is initial .
    align =
     cl_gui_control=>align_at_left
      + cl_gui_control=>align_at_top
      + cl_gui_control=>align_at_right.
    call method set_alignment
    exporting alignment = align.

    call method set_metric
      exporting metric = metric_pixel.
    if ( m_toolbar_visible = 1 ) and
       ( m_number_toolbar_buttons gt 0 ).
      call method set_height
           exporting height = m_height_toolbar.
    else.
      call method set_height
           exporting height = 0.
    endif.
    call method set_toolbar_wrap exporting wrap = 0.
  else.
    align = cl_gui_control=>align_at_bottom
      + cl_gui_control=>align_at_left
      + cl_gui_control=>align_at_top
      + cl_gui_control=>align_at_right.
    call method set_alignment
    exporting  alignment = align.
    call method set_toolbar_wrap exporting wrap = 1.
  endif.

  if ( not m_oi_control is initial ).
    data control type ref to cl_gui_control.
    data i_oi_container_CONTROL TYPE ref to i_oi_container_control.
    i_oi_container_control ?= m_oi_control.
    call method
I_OI_CONTAINER_CONTROL->get_control_object
importing control = control.

    call method
m_oi_control->I_OI_CONTAINER_CONTROL~get_control_object
      importing control = control.
    if ( not control is initial ).
      if ( ( i_view <> cl_gui_alv_grid=>mc_fc_view_excel ) AND
           ( i_view <> cl_gui_alv_grid=>mc_fc_view_lotus ) ).
        call method control->set_visible( ' ' ).

      else.
        call method control->set_visible( 'X' ).
      endif.
    endif.
  endif.
  if ( not m_alvexp_control is initial ).
    if ( i_view <> cl_gui_alv_grid=>mc_fc_view_crystal ).
      call method m_alvexp_control->set_visible( ' ' ).
* invisible-> delete.
*     break schererk.
      call method m_alvexp_control->free.
      clear m_alvexp_control.


    else.
      call method m_alvexp_control->set_visible( 'X' ).

    endif.
  endif.

endmethod.


method SET_WEB_OPTIONS.
* ...
  if ( www_active ne 'X' ).
    exit.
  endif.

  if ( not ( webLOOK IS INITIAL ) ).
    call method set_property
      exporting
        property = 'GridWebLook'
        value = weblook
      exceptions
        others = 1.
    if ( sy-subrc ne 0 ). raise error. endif.
  endif.
*data i_web type int4.
  M_int_i_web = webstyle.              " cast to integer;
  if ( not ( webSTYLE IS INITIAL ) ).
    call method set_property
      exporting
        property = 'GridWebStyle'
        value = m_int_i_web
      exceptions
        others = 1.
    if ( sy-subrc ne 0 ). raise error. endif.
  endif.
  if ( not ( webRows IS INITIAL ) ).
    call method set_property
      exporting
        property = 'GridWebRows'
        value = WebRows
      exceptions
        others = 1.
    if ( sy-subrc ne 0 ). raise error. endif.
  endif.
  if ( not ( webXWidth IS INITIAL ) ).
    call method set_property
      exporting
        property = 'GridWebExplicitWidth'
        value = WebXWidth
      exceptions
        others = 1.
    if ( sy-subrc ne 0 ). raise error. endif.
  endif.
  if ( not ( webXHeight IS INITIAL ) ).
    call method set_property
      exporting
        property = 'GridWebExplicitHeight'
        value = WebXHeight
      exceptions
        others = 1.
    if ( sy-subrc ne 0 ). raise error. endif.
  endif.
  if ( not ( webpagingsize IS INITIAL ) ).
    call method set_property
      exporting
        property = 'GridWebPagingsize'
        value = Webpagingsize
      exceptions
        others = 1.
    if ( sy-subrc ne 0 ). raise error. endif.
  endif.



endmethod.


method UPDATE_FRONTEND.
* .
  if  not m_oi_proxy       is initial and
      not m_oi_spreadsheet is initial and  "Y6BK076017
        ( m_view           eq cl_gui_alv_grid=>mc_fc_view_excel
       or m_view           eq cl_gui_alv_grid=>mc_fc_view_lotus ).
    call method m_oi_spreadsheet->setlocale
      exporting no_flush = 'X'.
    call method m_oi_spreadsheet->update_frontend.
*    CALL METHOD m_oi_proxy->execute_macro
*                      EXPORTING macro_string = 'LOAD_BOTH_FORMAT'
*                                param_count = 0   " 1
*"                                param1 = 0       " 10
*                      IMPORTING retcode = M_OI_RETCODE.
*                      CHANGING  retvalue = usa_sales.
*         CALL METHOD c_oi_errors=>show_message EXPORTING type = 'E'.
*      ELSE.
*        MESSAGE e000(DEMOOFFICEINTEGRATIO).
*      ENDIF.
  endif.
  if ( m_view = cl_gui_alv_grid=>mc_fc_view_crystal ).
    if ( not m_alvexp_control is initial ).
      data alvexp_control type ref to lcl_alvexp_control.
      alvexp_control ?= m_alvexp_control.
      data rpt type localfile.
      data ttx type localfile.
      rpt = m_crystal_url.
      ttx = m_crystal_url.
*     replace '.RPT' with '.RPT' into rpt.
*     replace '.RPX' with '.RPT' into rpt.
*     replace '.RPT' with 'N.TTX' into ttx.
*     call method  alvexp_control->CrystalCreateTTX
*            exporting i_fnrpt = rpt
*                      i_fnttx = ttx
*           exceptions error = 1.

      rpt = m_crystal_url.

      data crystal_style type lvcxstyle.
      crystal_style = co_crystal_inplace.
      if ( 0 = 1 ). " 4.6B version.
      " bit-and co_crystal_noControls.
      call method alvexp_control->CrystalPreviewE
              exporting
                     i_fn = rpt
                     i_title = 'Crystal Reports Previewer' "#EC NOTEXT
                     i_Left = 0
                     i_Top = 0
                     i_Width = -2
                     i_Height = -2
                     i_CrystalStyle = crystal_style
                     exceptions others = 0.
      else. "4.6C/D Version.

       crystal_style = co_crystal_inplace.
       crystal_style = crystal_style
                  bit-or co_crystal_nocandrilldown.

* disable download buttons if user lacks authority.
        AUTHORITY-CHECK OBJECT 'S_GUI'
                 ID 'ACTVT' FIELD '61'.
        if ( sy-subrc ne 0 ).
          crystal_style = crystal_style bit-or
            co_crystal_noexport.
        endif.

        call method alvexp_control->CrystalPreviewN
              exporting
                     i_fn = rpt
                     i_datasource_string = m_cr_datasource_string
                     i_title = 'Crystal Reports Previewer' "#EC NOTEXT
                     i_Left = 0
                     i_Top = 0
                     i_Width = -2
                     i_Height = -2
                     i_CrystalStyle = crystal_style
                     exceptions others = 0.
        CALL FUNCTION 'CONTROL_DESTROY'
          CHANGING
            H_CONTROL               = m_cr_fadriver_handle
          exceptions others = 1.
*        free object m_cr_fadriver_handle.
      endif.

    endif.
  endif.
endmethod.


method _init_members_base.
  me->m_selection_mode = -1.
endmethod.


method _prepare_export.

  remove_oi_objects( ).

endmethod.
ENDCLASS.