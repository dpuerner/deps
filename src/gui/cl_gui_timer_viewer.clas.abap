class CL_GUI_HTML_VIEWER definition
  public
  inheriting from CL_GUI_CONTROL
  create public .

public section.

  constants UIFLAG_NO3DBORDER type I value 4. "#EC NOTEXT
  constants M_ID_CTXMENU_SELECTED type I value 3. "#EC NOTEXT
  constants M_ID_SAPEVENT type I value 1. "#EC NOTEXT
  constants UIFLAG_NOIEMENU type I value 2. "#EC NOTEXT
  constants M_ID_NAVIGATE_COMPLETE type I value 2. "#EC NOTEXT
  constants M_ID_CTXMENU_REQUEST type I value 4. "#EC NOTEXT
  constants WB_CMDID_PRINT type I value 6. "#EC NOTEXT
  constants STYLE_NEWWINDOWBYLINK type CHAR1 value 'B'. "#EC NOTEXT
  constants STYLE_R3ONLY type CHAR1 value 'C'. "#EC NOTEXT
  data M_RESULT type I .
  data M_DP_LIFETIME type CNHT_DP_LIFETIME read-only value CNDP_LIFETIME_TRANSACTION. "#EC NOTEXT
  data M_HDP type CNTL_HANDLE .
  data M_UIFLAG type I value 0. "#EC NOTEXT
  data M_BROWSER_STRING type CHAR255 .
  data M_HTTP_HTMLVIEWER type STRING .
  constants UIFLAG_USE_SAPGUI_CHARSET type I value 2097152. "#EC NOTEXT

  events SAPEVENT
    exporting
      value(ACTION) type C optional
      value(FRAME) type C optional
      value(GETDATA) type C optional
      value(POSTDATA) type CNHT_POST_DATA_TAB optional
      value(QUERY_TABLE) type CNHT_QUERY_TABLE optional .
  events CTXMENU_SELECTED
    exporting
      value(FCODE) type UI_FUNC .
  events NAVIGATE_COMPLETE
    exporting
      value(URL) type C optional .
  events CTXMENU_REQUEST .

  methods DETACH_URL_IN_BROWSER
    importing
      value(URL) type C
    exceptions
      CNTL_ERROR
      DP_ERROR_GENERAL .
  methods ENABLE_SIMPLEBROWSING
    importing
      value(BENABLE) type I
    exceptions
      CNTL_ERROR .
  methods CLOSE_DOCUMENT
    exceptions
      CNTL_ERROR .
  methods TRACK_CONTEXT_MENU
    importing
      !CTXMENU type ref to CL_CTMENU
      value(POSX) type I default 0
      value(POSY) type I default 0
    exceptions
      CTMENU_ERROR .
  methods STOP
    exceptions
      CNTL_ERROR .
  methods CONSTRUCTOR
    importing
      value(SHELLSTYLE) type I optional
      !PARENT type ref to CL_GUI_CONTAINER
      value(LIFETIME) type I default LIFETIME_DEFAULT
      value(SAPHTMLP) type C optional
      value(UIFLAG) type I optional
      value(END_SESSION_WITH_BROWSER) type I default 0
      value(NAME) type STRING optional
      value(SAPHTTP) type C optional
      !QUERY_TABLE_DISABLED type C default ''
    exceptions
      CNTL_ERROR
      CNTL_INSTALL_ERROR
      DP_INSTALL_ERROR
      DP_ERROR .
  methods LOAD_DATA
    importing
      !URL type C optional
      !TYPE type C default 'text'
      !SUBTYPE type C default 'html'
      !SIZE type I default 0
      !ENCODING type SYCHAR60 optional
      !CHARSET type SYCHAR60 optional
      !NEEDFILTERING type I default 0
      !LANGUAGE type LANG optional
      !I_TIDYT type BOOLEAN optional
    exporting
      !ASSIGNED_URL type C
    changing
      !DATA_TABLE type STANDARD TABLE
      !ISCONTENTCHANGED type BOOLEAN optional
    exceptions
      DP_INVALID_PARAMETER
      DP_ERROR_GENERAL
      CNTL_ERROR
      HTML_SYNTAX_NOTCORRECT .
  methods GO_BACK
    exceptions
      CNTL_ERROR .
  methods GO_FORWARD
    exceptions
      CNTL_ERROR .
  methods GO_HOME
    exceptions
      CNTL_ERROR .
  methods SHOW_DATA
    importing
      !URL type C
      !FRAME type C optional
      !IN_PLACE type C default 'X '
    exceptions
      CNTL_ERROR
      CNHT_ERROR_NOT_ALLOWED
      CNHT_ERROR_PARAMETER
      DP_ERROR_GENERAL .
  methods SHOW_URL
    importing
      !URL type C
      !FRAME type C optional
      !IN_PLACE type C default ' X'
    exceptions
      CNTL_ERROR
      CNHT_ERROR_NOT_ALLOWED
      CNHT_ERROR_PARAMETER
      DP_ERROR_GENERAL .
  methods SHOW_URL_EX
    importing
      !URL type C
      !FRAME type C optional
    exceptions
      CNTL_ERROR
      CNHT_ERROR_NOT_ALLOWED .
  methods DO_REFRESH
    exceptions
      CNTL_ERROR .
  methods GET_CURRENT_URL
    exporting
      !URL type C
    exceptions
      CNTL_ERROR .
  methods LOAD_HTML_DOCUMENT
    importing
      !DOCUMENT_ID type C
      !DOCUMENT_TEXTPOOL type SYREPID optional
      !DOCUMENT_URL type C optional
      !AS_COMPRESSED_DATA type C default 'X'
      !NEEDFILTERING type I optional
      !LANGUAGE type LANG optional
      !I_TIDYT type BOOLEAN optional
    exporting
      !ASSIGNED_URL type C
    changing
      value(MERGE_TABLE) type SWWW_T_MERGE_TABLE optional
      !ISCONTENTCHANGED type BOOLEAN optional
    exceptions
      DOCUMENT_NOT_FOUND
      DP_ERROR_GENERAL
      DP_INVALID_PARAMETER
      HTML_SYNTAX_NOTCORRECT .
  methods LOAD_MIME_OBJECT
    importing
      !OBJECT_ID type C
      !OBJECT_URL type C optional
    exporting
      !ASSIGNED_URL type C
    exceptions
      OBJECT_NOT_FOUND
      DP_INVALID_PARAMETER
      DP_ERROR_GENERAL .
  methods SHOW_DATA_EX
    importing
      !URL type C
      !FRAME type C optional
    exceptions
      CNTL_ERROR
      DP_ERROR_GENERAL .
  class-methods FILTER_DOCUMENT_CONTENT
    importing
      !I_TIDYT type BOOLEAN optional
      !NEEDFILTERING type I default 0
    exporting
      !E_ERROR type STRING
    changing
      !ISCONTENTCHANGED type BOOLEAN optional
      !ENCODING type SYCHAR60 optional
      !DATA_TABLE type STANDARD TABLE
    raising
      CX_BTF_PARAMETER_ERROR
      CX_BTF_RUNTIME_ERROR
      CX_BTF_INTERNAL_ERROR .
  methods SHOW_URL_IN_BROWSER
    importing
      !URL type C
    exceptions
      CNTL_ERROR .
  methods EXECWB
    importing
      !CMD_ID type I default WB_CMDID_PRINT
      !CMD_OPT type I optional
      !RESULT type I optional
    exceptions
      CNTL_ERROR .
  methods SET_NAVIGATION_STYLE
    importing
      !STYLE type C
    exceptions
      CNTL_ERROR .
  methods SET_UI_FLAG
    importing
      !UIFLAG type I default 0
    exceptions
      CNTL_ERROR .
  methods GENERATE_NEW_URL
    importing
      !RELATIVE_URL type C optional
      !MIME_SUBTYPE type C optional
    exporting
      !ASSIGNED_URL type C
    exceptions
      CNTL_ERROR .
  methods GET_BROWSER_STRING
    exporting
      !BROWSER_STRING type STRING
    exceptions
      CNTL_ERROR .
  methods ENABLE_SAPSSO
    importing
      value(IN_PROTOCOL) type STRING optional
      value(ENABLED) type C
    exceptions
      CNTL_ERROR .
  class-methods GET_RECOMMENDED_CHARSET
    importing
      !LANGUAGE type SPRAS optional
    exporting
      !HTML_CHARSET type STRING
    exceptions
      SYSTEM_ERROR .
  methods SET_DOCUMENT_CHARSET
    importing
      !HTML_CHARSET type STRING
    exceptions
      CNTL_ERROR .
  methods DRAG_ACCEPT_FILES
    importing
      value(B_ACCEPT) type I
    exceptions
      CNTL_ERROR .

  methods DISPATCH
    redefinition .

protected section.

  class-data M_UNIQUE_URL_ID type CNHT_UNIQUE_ID .
  data M_SAPEVENT_NAMESPACE type CNHT_SAPEVENT_NAMESPACE value 'SAPEVENT:'. "#EC NOTEXT
  data M_SAPEVENT_NAMESPACE_LEN type I value 9. "#EC NOTEXT
  data M_CTXMENU_FCODE type UI_FUNC .
  data M_BDS type ref to CL_BDS_DOCUMENT_SET .
  data M_USE_SAPEVENT_ACKNOWLEGDE type CHAR1 value ''. "#EC NOTEXT

  methods INIT_R3HTTP_PATH
    exporting
      !WWWDATA_PATH type STRING
      !BDS_PATH type STRING .
  methods EXECUTE_SCRIPT
    exceptions
      DP_ERROR
      CNTL_ERROR .
  methods SET_SCRIPT_ON_ABAP_COMPLETED
    importing
      !SCRIPT type STANDARD TABLE
    exceptions
      DP_ERROR .
  methods SET_SCRIPT_ON_DATA_SUBMITTED
    importing
      !SCRIPT type STANDARD TABLE
    exceptions
      DP_ERROR .
  methods SET_SCRIPT
    importing
      !SCRIPT type STANDARD TABLE
      value(PROPERTYNAME) type CHAR40 default ''
    exceptions
      DP_ERROR .
  methods LOAD_BDS_OBJECT
    importing
      !DOC_NAME type SBDST_URL
      !BDS_OBJECTKEY type SBDST_OBJECT_KEY
      !BDS_CLASSNAME type SBDST_CLASSNAME default 'SAPHTML'
      !BDS_CLASSTYPE type SBDST_CLASSTYPE default 'OT'
      !DOC_DESCRIPTION type C optional
      !DOC_LANGU type C optional
    exporting
      !ASSIGNED_URL type SBDST_URL
    exceptions
      CNHT_BDS_OBJNOTFOUND .
  methods LOAD_BDS_SAP_ICON
    importing
      !SAP_ICON type ICONNAME
    exporting
      !ASSIGNED_URL type C
      !FILE_NAME type C
    exceptions
      CNHT_BDS_OBJNOTFOUND .
  methods SAPEVENT_ACKNOWLEGDE .
  
*"* private components of class CL_GUI_HTML_VIEWER
*"* do not include other source files here!!!
private section.

  data M_BROWSER type CNTL_HANDLE .
  data M_URL_PREFIX type CNHT_URL_PREFIX .
  data M_URL type CNHT_URL .
  data M_SIZE_OF_POSTDATA type I value 0 .
  data M_FRAME type CNHT_URL_PREFIX .
  data M_ACTION type CNHT_URL_PREFIX .
  data M_POSTDATA type CNHT_POST_DATA_TAB .
  data M_QUERY_TABLE type CNHT_QUERY_TABLE .
  data M_GETDATA type CNHT_URL .
  data M_STYLE type TEXT8 .
  data M_R3ONLY type CHAR1 value ' ' .
  data M_TABLE_DP_OBJECT type THT_OBJECT .
  data M_HTTP_SERVICE type PLG_SRV .
  data M_HTTP_HOST type PLG_HOST .
  data M_QUERY_TABLE_DISABLED type CHAR1 .
  data M_DEFAULT_SAPGUI_CHARSET type STRING .

  methods TRANSLATE_QUERY_STRING
    changing
      !BUFFER type C
    exceptions
      QUERY_ERROR .
  methods FILL_QUERY_PARSE_BUFFER
    changing
      !PARSE_BUFFER type STRING .
  methods APPEND_QUERY_PARAMETER
    importing
      !PAR_NAME type STRING
      !PAR_VALUE type STRING
      !PAR_NAME_LEN type I
      !PAR_VALUE_LEN type I
    exceptions
      QUERY_ERROR .
  methods FILL_QUERY_TABLE
    exceptions
      QUERY_ERROR .
  methods GET_SAPEVENT_POSTDATA
    importing
      !CLEAR_TRAIL_BYTES type C default 'X'
      !IS_CHAR_DATA type C default 'X'
      value(SIZE) type I default 0
    exporting
      value(POSTDATA) type STANDARD TABLE
      value(POSTDATA_S) type STRING
    changing
      !TYPE type C default 'text'
      !SUBTYPE type C default 'html'
    exceptions
      CNTL_ERROR
      DP_ERROR_GENERAL
      DP_INVALID_PARAMETER .
  methods FLUSH_EVENT_PARAMETERS
    importing
      !ON_SAPEVENT type C default 'X'
    exceptions
      CNTL_ERROR
      QUERY_ERROR .
  methods CHECK_LOADED_OBJECT
    importing
      !DOC_URL type C
    exceptions
      CNHT_OBJECT_NOT_FOUND
      CNHT_ERROR_PARAMETER .
  methods UPDATE_TABLE_DP_OBJECT
    importing
      !DOC_URL type C
      !TYPE type C default 'text'
      !SUBTYPE type C default 'html'
      !IS_CHARBASED type C default '' .
  methods GET_DOCUMENT_EXTENSION
    importing
      !TYPE type C optional
      !SUBTYPE type C
    exporting
      !EXTENSION type C .
  class-methods IS_CHARBASED_TABLE
    importing
      !DATA_TABLE type STANDARD TABLE
    exporting
      !ISCHAR type C .
  class-methods CONVERT_TABLE_AS_RAW
    importing
      value(CHAR_TABLE) type STANDARD TABLE
    exporting
      !RAW_TABLE type CNHT_W3MIME_TABLE .
  methods ADD_GENERIC_HTML_ATTRIBUTES
    importing
      !LANGUAGE type LANG optional
    changing
      !MERGE_TABLE type SWWW_T_MERGE_TABLE .
  methods ADJUST_HTML_DATA
    importing
      !LANGUAGE type LANG optional
    changing
      !DATA_TABLE type STANDARD TABLE
      !SIZE type I optional .
  methods GET_URL_ATTRIBUTES
    importing
      !URL type C
    exporting
      !R3DATA type C
      !DATAFILE type C
      !ABSOLUTE_URL type C
    exceptions
      CNHT_ERROR_PARAMETER .