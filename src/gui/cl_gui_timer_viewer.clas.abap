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
private section.
*"* private components of class CL_GUI_HTML_VIEWER
*"* do not include other source files here!!!

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
ENDCLASS.



CLASS CL_GUI_HTML_VIEWER IMPLEMENTATION.


method ADD_GENERIC_HTML_ATTRIBUTES.

  data: merge_item    type swww_t_merge_item,
        html_line     type w3html,
        lv_language   type lang,
        page_dir      type nls_page_d.


  call function 'NLS_BIDI_PAGE'
    exporting
      language        = language
    importing
      page_direction  = page_dir.

  merge_item-name = '!direction!'.
  merge_item-command = 'r'.
  if page_dir = 'R'.
    append 'dir="rtl"' to merge_item-html.
  else.
    append 'dir="ltr"' to merge_item-html.
  endif.
  append merge_item to merge_table.
*
  merge_item-name = '!DIRECTION!'.
  append merge_item to merge_table.

endmethod.


method ADJUST_HTML_DATA .

FIELD-SYMBOLS:
      <data_line>      TYPE ANY,              " line of html table
      <tag_line>       TYPE ANY.              " line with a tag
DATA:
      data_ref         TYPE REF TO DATA,
      tag_table        TYPE TABLE OF STRING,  " table of tags
      tag_line         TYPE STRING,           " line of tag table
      html_line        TYPE STRING,           " generated <html> tag
      meta_line        TYPE STRING,           " generated <meta> tag
      meta_charset     TYPE STRING,           " charset from <meta> tag
      wrk_line         TYPE STRING,           " intermediate work string
      block            TYPE STRING,           " blocked text indicator
      tag              TYPE STRING,           " tag intermediate string
      page_dir         TYPE nls_page_d,       " direction of page
      page_lang        TYPE lang,             " page language
      html_dir(3)      TYPE C,                " dir of <html> tag
      html_lang(2)     TYPE C,                " lang of <html> tag
      meta_lang(2)     TYPE C,                " lang from <meta> tag
      lv_htm           TYPE I,                " <html> tag index
      lv_met           TYPE I,                " <meta> tag index place
      lv_bod           TYPE I,                " <body> tag index
      lv_pos           TYPE I,                " search term position
      lv_lent          TYPE I,                " html table line length
      lv_lens          TYPE I,                " length variable
      lv_lines         TYPE I.                " number of lines
CONSTANTS:
      dir_rtl(11)      TYPE C value ' dir="RTL">'.


* clone and use intermediate html data table line
  CREATE DATA data_ref LIKE LINE OF data_table[].
  ASSIGN data_ref->* TO <data_line>.

* determine the html data line length
  DESCRIBE FIELD <data_line> LENGTH lv_lent IN CHARACTER MODE.
* scan lines of html data table and concatenate them into a string
  CONCATENATE wrk_line '' INTO wrk_line SEPARATED BY <data_line>.
  LOOP AT data_table INTO <data_line>.
    CONCATENATE wrk_line '' INTO wrk_line SEPARATED BY <data_line>.
    IF wrk_line+lv_lens CS '<body'.
      lv_bod = sy-tabix.
      EXIT.
    ENDIF.
    lv_lens = lv_lens + lv_lent.
  ENDLOOP.
* exit if no <body>
  CHECK lv_bod <> 0.
  lv_bod = 0.

  SHIFT wrk_line LEFT BY lv_lent PLACES.
* split the resulted string into new table of tags
  SPLIT wrk_line AT '<' INTO TABLE tag_table.
* restore '<' as the first character of each tag
  LOOP AT tag_table ASSIGNING <tag_line>.
    CHECK sy-tabix > 1.
    CONCATENATE '<' <tag_line> INTO <tag_line>.
  ENDLOOP.

* scan the table of tags
  LOOP AT tag_table INTO tag_line.

    lv_lens = lv_lines.
    lv_lines = lv_lines + STRLEN( tag_line ).
*   a comment tag closes the text until the end of comments
    IF block IS INITIAL AND ( tag_line CS '<!--' AND sy-fdpos = 0 ).
      block = '-->'.
    ENDIF.
    IF NOT block IS INITIAL AND tag_line CS '-->'.
      CLEAR block.
      CONTINUE.
    ENDIF.

    CHECK tag_line CA ' >' OR tag_line CS '/>'.
    tag = tag_line(sy-fdpos).
    TRANSLATE tag TO LOWER CASE.

*   if html text is open, then analyze the current tag
    IF block IS INITIAL.
      IF tag = '<html' OR tag = '<meta'.
        meta_line = tag_line.
*       replace and condense all service characters
        TRANSLATE tag_line USING '; = " : '' > '.
        CONDENSE tag_line.
        TRANSLATE tag_line USING ' _'.
      ENDIF.

      CASE tag.
*<HTML>
        WHEN '<html'.
          clear: lv_met, html_dir, html_lang, meta_charset.
          IF tag_line CS '_lang_'.
*           if <html> tag specifies text language
            lv_pos = sy-fdpos + 6.
            html_lang = tag_line+lv_pos.
          ENDIF.
          IF tag_line CS '_dir_'.
*           if <html> tag orders text direction
            lv_pos = sy-fdpos + 5.
            html_dir = tag_line+lv_pos.
          ENDIF.
          html_line = meta_line.
          lv_htm = lv_lens.
*<META>
        WHEN '<meta'.
          IF meta_lang IS INITIAL.
            IF tag_line CS '_http-equiv_content-language_'.
              IF tag_line CS '_content_'.
*               if <meta> tag specifies the document language
                lv_pos = sy-fdpos + 9.
                meta_lang = html_lang = tag_line+lv_pos.
              ENDIF.
            ENDIF.
          ENDIF.
          IF meta_charset IS INITIAL.
            IF tag_line CS '_http-equiv_content-type_'.
              IF tag_line CS '_content_text/html_'.
                IF tag_line CS '_charset_'.
*                 if <meta> tag specifies the needed character set
                  lv_pos = sy-fdpos + 9.
                  meta_charset = tag_line+lv_pos.
                  IF meta_charset CS ' '.
                    meta_charset = tag_line+lv_pos.
                  ENDIF.
                ENDIF.
              ENDIF.
            ENDIF.
          ENDIF.
          IF lv_met = 0.
            lv_met = lv_lens.
          ENDIF.
*<HEAD>
* Read note: 909765 for description of change.
        WHEN '<head'.
          IF lv_met = 0.
            lv_met = lv_lines.
          ENDIF.
*<BODY> - this tag is obligatory
        WHEN '<body'.
          IF lv_met = 0.
            lv_met = lv_lens.
          ENDIF.
          lv_bod = lv_lens.
          EXIT.
* tags of closed content: title, script, style
        WHEN '<title'.
          block = '</title'.
        WHEN '<script'.
          block = '</script'.
        WHEN '<style'.
          block = '</style'.
        WHEN OTHERS.
      ENDCASE.
    ENDIF.

*   if the content is closed check for the end of the block
    IF NOT block IS INITIAL AND
      ( tag = block OR ( block = '-->' AND tag_line CS '-->' ) ).
      CLEAR block.
    ENDIF.

  ENDLOOP.

* tag <body> is obligatory
  CHECK lv_bod <> 0.

  page_lang = language.
  IF language IS INITIAL.
*   if language isn't given - take it from html/meta tag
    IF NOT html_lang IS INITIAL.
      CALL FUNCTION 'CONVERSION_EXIT_ISOLA_INPUT'
        EXPORTING
          input            = html_lang
        IMPORTING
          output           = page_lang.
    ENDIF.
  ENDIF.
* default is the user logon language
  IF page_lang IS INITIAL.
    page_lang = sy-langu.
  ENDIF.

* if <html> tag doesn't order direction, then check language
  IF html_dir IS INITIAL AND page_dir IS INITIAL.
    CALL FUNCTION 'NLS_BIDI_PAGE'
      EXPORTING
        language        = page_lang
      IMPORTING
        page_direction  = page_dir.
  ENDIF.

* if meta charset is omitted - construct and insert it
  IF meta_charset = ''.
    CALL METHOD get_recommended_charset
      EXPORTING
        language     = page_lang
      IMPORTING
        html_charset = meta_charset.
*   sometimes page_charset parameter is empty
    IF meta_charset <> ''.
      CONCATENATE ' <meta http-equiv="content-type" content="text/html;'
          ' charset=' meta_charset '">' INTO meta_line.
*     <meta> tag should be inserted in the head of data_table
      lv_pos = lv_met MOD lv_lent.
      lv_met = lv_met DIV lv_lent + 1.
      READ TABLE data_table INDEX lv_met INTO <data_line>.
*     prepare place for <meta> tag
      IF lv_pos <> 0 AND <data_line>(lv_pos) <> ''.
        INSERT <data_line> INTO data_table INDEX lv_met.
        CLEAR <data_line>+lv_pos.
        MODIFY data_table INDEX lv_met FROM <data_line>.
        lv_met = lv_met + 1.
        READ TABLE data_table INDEX lv_met INTO <data_line>.
        CLEAR <data_line>(lv_pos).
        MODIFY data_table INDEX lv_met FROM <data_line>.
      ENDIF.
*     insert <meta> tag
      WHILE meta_line <> ''.
        <data_line> = meta_line.
        INSERT <data_line> INTO data_table INDEX lv_met.
        SHIFT meta_line LEFT BY lv_lent PLACES.
        lv_met = lv_met + 1.
      ENDWHILE.
    ENDIF.
  ENDIF.

  IF page_dir CS 'R'.
*   if text direction from Right to Left should be inserted
    IF html_line = ''.
*     if <html> tag is absent
      CONCATENATE 'html' dir_rtl INTO html_line.
      INSERT html_line INTO data_table INDEX 1.
    ELSE.
*     expand <html> tag, adding direction
      lv_lens = STRLEN( html_line ).
      lv_pos = lv_htm MOD lv_lent.
      lv_htm = lv_htm DIV lv_lent + 1.
      READ TABLE data_table INDEX lv_htm INTO <data_line>.
*     erase old tag of <html>
      DO lv_lens TIMES.
        <data_line>+lv_pos(1) = ' '.
        lv_pos = lv_pos + 1.
        IF lv_pos = lv_lent OR sy-index = lv_lens.
          MODIFY data_table INDEX lv_htm FROM <data_line>.
          lv_htm = lv_htm + 1.
          READ TABLE data_table INDEX lv_htm INTO <data_line>.
          lv_pos = 0.
        ENDIF.
      ENDDO.
*     insert new tag of <html>
      REPLACE '>' WITH dir_rtl INTO html_line.
      lv_htm = 1.
      WHILE html_line <> ''.
        <data_line> = html_line.
        INSERT <data_line> INTO data_table INDEX lv_htm.
        SHIFT html_line LEFT BY lv_lent PLACES.
        lv_htm = lv_htm + 1.
      ENDWHILE.
    ENDIF.
  ENDIF.

* adjust new data_table size
  IF size <> 0.
    DESCRIBE TABLE data_table LINES lv_lines.
    READ TABLE data_table INDEX lv_lines INTO <data_line>.
    lv_lens = STRLEN( <data_line> ).
    size = ( lv_lines - 1 ) * lv_lent + lv_lens.
  ENDIF.

endmethod.


METHOD append_query_parameter .

  CONSTANTS      value_buffer_len TYPE i VALUE 512.
  DATA:          par_name_offs TYPE i,
                 par_real_len TYPE i,
                 buffer(value_buffer_len),
                 part_first_char TYPE c,
                 wa_query_table LIKE LINE OF m_query_table.

  IF par_name_len > 0.
*     Skip leading '&'
    par_name_offs = 0.
    part_first_char = par_name+par_name_offs(1).
    WHILE part_first_char EQ '&'.
      ADD 1 TO par_name_offs.
      part_first_char = par_name+par_name_offs(1).
    ENDWHILE.
    par_real_len = par_name_len - par_name_offs.
    IF par_real_len > 0.
      buffer(par_real_len) = par_name+par_name_offs.
      CALL METHOD translate_query_string
        CHANGING
          buffer = buffer
        EXCEPTIONS
          OTHERS = 1.
      IF sy-subrc NE 0.
        RAISE query_error.
      ENDIF.
      wa_query_table-name = buffer.
    ELSE.
      wa_query_table-name = '_EMPTY_PAR_'.
    ENDIF.
  ELSE.
    wa_query_table-name = '_EMPTY_PAR_'.
  ENDIF.
  IF par_value_len > 0.
    CLEAR buffer.
    IF par_value_len > value_buffer_len.
      RAISE query_error.
    ENDIF.
    buffer(par_value_len) = par_value.
    CALL METHOD translate_query_string
        CHANGING
           buffer = buffer
        EXCEPTIONS
           OTHERS = 1.
    IF sy-subrc NE 0.
      RAISE query_error.
    ENDIF.
    wa_query_table-value = buffer.
  ENDIF.
  APPEND wa_query_table TO m_query_table.
ENDMETHOD.


METHOD check_loaded_object.
  DATA: wa_object TYPE sht_object,
        buf TYPE ht_docid,
        docid TYPE ht_docid.

  SPLIT doc_url AT '#' INTO docid buf.
  TRANSLATE docid TO UPPER CASE.                          "#EC SYNTCHAR

  IF docid IS INITIAL.
    RAISE cnht_error_parameter.
  ENDIF.

  READ TABLE m_table_dp_object WITH KEY docid = docid INTO wa_object.
  IF sy-subrc NE 0.
    RAISE cnht_object_not_found.
  ENDIF.

ENDMETHOD.


METHOD close_document.
  CALL METHOD call_method
          EXPORTING
               method  = 'CloseDocument'                    "#EC NOTEXT
               p_count = 0
         IMPORTING
              result   = m_result
         EXCEPTIONS
              CNTL_ERROR          = 1.

  IF sy-subrc NE 0.
    RAISE cntl_error.
  ENDIF.

ENDMETHOD.


METHOD constructor.
  DATA: install_check,
        result TYPE c,
        guitype TYPE i VALUE 0,
        clsid(80),
        endSessionFeatureSupport type c length 1.

  IF NOT cl_gui_object=>activex IS INITIAL.
    saphtmlp = 'X'.
  ENDIF.
*
  IF NOT cl_gui_object=>activex IS INITIAL.
    clsid         = 'SAP.HTMLControl.1'.
  ELSE.                                                     "JavaBeans
    clsid  = 'com.sap.components.controls.htmlViewer.SapHtmlViewer'.
  ENDIF.
  CALL METHOD super->constructor
    EXPORTING
      clsid      = clsid
      shellstyle = shellstyle
      parent     = parent
      lifetime   = lifetime
      name       = name
  EXCEPTIONS
      cntl_system_error = 1
      OTHERS = 2.
  CASE sy-subrc.
    WHEN 0.
    WHEN 1.
      RAISE cntl_install_error.
    WHEN OTHERS.
      RAISE cntl_error.
  ENDCASE.

  CLEAR m_hdp.
  CALL FUNCTION 'DP_CREATE'
       CHANGING
            h_dp             = m_hdp
       EXCEPTIONS
            dp_install_error = 1
            OTHERS           = 2.
  CASE sy-subrc.
    WHEN 1.
      RAISE dp_install_error.
    WHEN 2.
      RAISE dp_error.
  ENDCASE.

* WeBGUI Test begin

*  IF www_active IS INITIAL.
  CALL METHOD set_property
       EXPORTING
            property          = 'PostData'
            value             = m_hdp
       EXCEPTIONS
            OTHERS            = 1.
  IF sy-subrc NE 0.
    RAISE cntl_error.
  ENDIF.
*  ENDIF.

* WeBGUI Test end

* the control keeps the dp
  CALL FUNCTION 'DP_DESTROY'
       CHANGING
            h_dp   = m_hdp
       EXCEPTIONS
            OTHERS = 1.
  IF sy-subrc NE 0.
    RAISE dp_error.
  ENDIF.

  CALL METHOD call_method
       EXPORTING
            method            = 'InitControl'
            p_count           = 0
       EXCEPTIONS
            OTHERS            = 1.
  IF sy-subrc NE 0.
    RAISE cntl_error.
  ENDIF.

  IF NOT saphtmlp IS INITIAL.
    CALL METHOD set_property
         EXPORTING
              property          = 'NavigationStyle'
              value             = cnht_style_usesaphtml
         EXCEPTIONS
              OTHERS            = 1.
    IF sy-subrc NE 0.
      RAISE cntl_error.
    ENDIF.
  ENDIF.

  IF uiflag NE 0.
    CALL METHOD set_ui_flag
         EXPORTING
              uiflag = uiflag
         EXCEPTIONS
              OTHERS            = 1.
    IF sy-subrc NE 0.
      RAISE cntl_error.
    ENDIF.
  ENDIF.

  " OSS : 0120025231 0001045828 2013
  " The HTML session does not end until SAP Logon is closed completely.
  " There should be an option to end the session.



 CALL METHOD CL_GUI_FRONTEND_SERVICES=>CHECK_GUI_SUPPORT
    EXPORTING
      COMPONENT            = 'saphtml'
      FEATURE_NAME         = 'EndSessionFeature'
    RECEIVING
      RESULT               = endSessionFeatureSupport
    EXCEPTIONS
      CNTL_ERROR           = 1
      ERROR_NO_GUI         = 2
      WRONG_PARAMETER      = 3
      NOT_SUPPORTED_BY_GUI = 4
      UNKNOWN_ERROR        = 5
      others               = 6.

  IF SY-SUBRC <> 0.
    endSessionFeatureSupport = ABAP_FALSE.
  ENDIF.

IF NOT endSessionFeatureSupport IS INITIAL.
   IF END_SESSION_WITH_BROWSER EQ 1.
    CALL METHOD set_property
         EXPORTING
              property = 'EndSessionWithBrowser'
              value = 1
         EXCEPTIONS
              OTHERS            = 1.
    IF sy-subrc NE 0.
      RAISE cntl_error.
    ENDIF.
  ENDIF.
ENDIF.
* This code is used to eliminate the need for a flush call that
* retrieves the protocol prefix and an unique ID from the client.
* As default protocol '@SAPHTML' is assumed. The unique ID is
* created via 'GUID_CREATE'. Due to implementation issues on
* other platform this code currently works only on Windows(TM)
* clients.
  IF NOT cl_gui_object=>activex IS INITIAL
    AND www_active IS INITIAL.
    DATA guid TYPE guid_22.

    CALL FUNCTION 'GUID_CREATE'
         IMPORTING
              ev_guid_22 = guid.
    IF saphtmlp IS INITIAL.
      CONCATENATE '@SAPHTML://htmlviewer.sap.com/' guid '/' INTO
m_url_prefix.
    ELSE.
      CONCATENATE 'SAPHTMLP://htmlviewer.sap.com/' guid '/' INTO
m_url_prefix.
    ENDIF.

    CALL METHOD set_property
         EXPORTING
              property          = 'URLPrefixLocal'
              value            = m_url_prefix
         EXCEPTIONS
              OTHERS            = 1.
    IF sy-subrc NE 0.
      RAISE cntl_error.
    ENDIF.
  ELSE.
* code for non Windows(TM) clients
    CALL METHOD get_property
         EXPORTING
              property          = 'URLPrefixLocal'
              queue_only        = ' '
         IMPORTING
              value            = m_url_prefix
         EXCEPTIONS
              OTHERS            = 1.
    IF sy-subrc NE 0.
      RAISE cntl_error.
    ENDIF.
  ENDIF.

  CALL METHOD cl_gui_cfw=>subscribe
    EXPORTING
      ref     = me
      shellid = me->h_control-shellid.
*  CALL METHOD CL_GUI_CFW=>FLUSH.
  m_dp_lifetime = cndp_lifetime_transaction.

  m_query_table_disabled = query_table_disabled.
ENDMETHOD.


METHOD convert_table_as_raw.
  DATA: ls_char_line(255),
        ls_raw_line TYPE w3mime.

  FIELD-SYMBOLS <line> TYPE ANY.

  CLEAR raw_table.

  LOOP AT char_table INTO ls_char_line.
    ASSIGN ls_char_line TO <line> CASTING TYPE x.
    ls_raw_line-line = <line>.
    APPEND ls_raw_line TO raw_table.
  ENDLOOP.
ENDMETHOD.


method DETACH_URL_IN_BROWSER.

  Data : return_value type c length 1.


  CALL FUNCTION 'DP_SYNC_URLS'
       EXCEPTIONS
            OTHERS = 1.
  IF sy-subrc NE 0.
    RAISE dp_error_general.
  ENDIF.

* check if new feature supported
  CALL METHOD CL_GUI_FRONTEND_SERVICES=>CHECK_GUI_SUPPORT
        EXPORTING
          COMPONENT            = 'saphtml'
          FEATURE_NAME         = 'detachurlinbrowser'
        RECEIVING
          RESULT               = return_value
        EXCEPTIONS
          others               = 6.
       IF SY-SUBRC <> 0.
        return_value = ABAP_FALSE.
       ENDIF.

  IF NOT return_value IS INITIAL.
        CALL METHOD call_method
                   EXPORTING
                     method  = 'ShowURLInDetachedBrowser'
                     p_count = 2
                     p1      = url
                     p2      = 1
                   IMPORTING
                     result   = m_result
                   EXCEPTIONS
                     OTHERS   = 1.
  ELSE.

          CALL FUNCTION 'CALL_BROWSER'
           EXPORTING
             URL                          = url
           EXCEPTIONS
             OTHERS                       = 99.
  ENDIF.

IF sy-subrc NE 0.
    RAISE cntl_error.
ENDIF.
endmethod.


METHOD dispatch.
  DATA: l_len TYPE i,
        l_getdata TYPE cnht_url,
        wa_postdata TYPE cnht_post_data_line.

  CASE eventid.
    WHEN m_id_sapevent.
      CALL METHOD flush_event_parameters
        EXPORTING
          on_sapevent = 'X'
        EXCEPTIONS
          OTHERS   = 1.
      IF sy-subrc NE 0.
        RAISE cntl_error.
      ENDIF.

      RAISE EVENT sapevent
        EXPORTING
          action      = m_action
          frame       = m_frame
          getdata     = m_getdata
          postdata    = m_postdata
          query_table = m_query_table.

    WHEN m_id_navigate_complete.
      CALL METHOD flush_event_parameters
        EXPORTING
          on_sapevent  = ' '
        EXCEPTIONS
          OTHERS   = 1.
      IF sy-subrc NE 0.
        RAISE cntl_error.
      ENDIF.

      RAISE EVENT navigate_complete
        EXPORTING
          url      = m_url.

    WHEN m_id_ctxmenu_request.
*      call method get_event_parameter
*        exporting
*          parameter_id = 0
*          queue_only   = ' '
*        importing
*          posx         =
*        exceptions
*          others       = 1.
*      if sy-subrc ne 0.
*        raise cntl_error.
*      endif.
*
*      call method cl_gui_cfw=>flush.
*      if sy-subrc ne 0.
*        raise cntl_error.
*      endif.

      RAISE EVENT ctxmenu_request.

    WHEN m_id_ctxmenu_selected.
      CALL METHOD get_event_parameter
        EXPORTING
          parameter_id = 0
          queue_only   = ' '
        IMPORTING
          parameter    = m_ctxmenu_fcode
        EXCEPTIONS
          OTHERS       = 1.
      IF sy-subrc NE 0.
        RAISE cntl_error.
      ENDIF.

      CALL METHOD cl_gui_cfw=>flush.
      IF sy-subrc NE 0.
        RAISE cntl_error.
      ENDIF.

      RAISE EVENT ctxmenu_selected
        EXPORTING
          fcode = m_ctxmenu_fcode.

  ENDCASE.

ENDMETHOD.


METHOD DO_REFRESH .
  CALL METHOD CALL_METHOD
          EXPORTING
               METHOD   = 'DoRefresh'
               P_COUNT  = 0
         IMPORTING
              RESULT    = M_RESULT.
  IF SY-SUBRC NE 0.
    RAISE CNTL_ERROR.
  ENDIF.
ENDMETHOD.


method DRAG_ACCEPT_FILES.
DATA RET_VAL  TYPE ABAP_BOOL.

*check if feature is supported...........................
   CALL METHOD CL_GUI_FRONTEND_SERVICES=>CHECK_GUI_SUPPORT
      EXPORTING
        COMPONENT            = 'saphtml'
        FEATURE_NAME         = 'dragacceptfiles'
      RECEIVING
        RESULT               = RET_VAL
      EXCEPTIONS
        CNTL_ERROR           = 1
        ERROR_NO_GUI         = 2
        WRONG_PARAMETER      = 3
        NOT_SUPPORTED_BY_GUI = 4
        UNKNOWN_ERROR        = 5
        others               = 6.

   IF ( SY-SUBRC eq 0 ) AND ( RET_VAL eq ABAP_TRUE ).
     CALL METHOD CALL_METHOD
        EXPORTING
          METHOD = 'DropAcceptFiles'
          P_COUNT   = 1
          P1 = B_ACCEPT
         EXCEPTIONS OTHERS = 1.

      IF SY-SUBRC NE 0.
        RAISE CNTL_ERROR.
      ENDIF.
   ENDIF.

endmethod.


METHOD enable_sapsso .
*  Note 983386 - Start
  data: host        type string,
        service     type string,
        protocol    type string,
        sso_ticket  type string,
        url         type string,
        i_enabled   type i value 0,
        inprotocol type string,
        JavaGUI    type c,
        JavaGUISupportBit type c.
*in_protocol is an optional parameter added with the Note  1546945

*  Note 983386 - End
  IF cl_gui_object=>activex IS INITIAL.
*  CM : 0000087324 2015, Support for Single Sign On Functionality for Java GUI.
    call function 'GUI_HAS_JAVABEANS'
        importing
          return = JavaGUI.

    IF JavaGUI IS INITIAL.
      EXIT.
    ELSE.
       CALL METHOD CL_GUI_FRONTEND_SERVICES=>CHECK_GUI_SUPPORT
         EXPORTING
           COMPONENT            = 'saphtml'
           FEATURE_NAME         = 'EnableSSO'
         RECEIVING
           RESULT               = JavaGUISupportBit
         EXCEPTIONS
           CNTL_ERROR           = 1
           ERROR_NO_GUI         = 2
           WRONG_PARAMETER      = 3
           NOT_SUPPORTED_BY_GUI = 4
           UNKNOWN_ERROR        = 5
           others               = 6.

        IF SY-SUBRC <> 0.
          JavaGUISupportBit = ABAP_FALSE.
        ENDIF.

        IF JavaGUISupportBit IS INITIAL.
          EXIT.
        ENDIF.

    ENDIF.
  ENDIF.

*  Note 983386 - Start

*if optional parameter in_protocol is not set we no need to change the existing code.
if in_protocol is initial.
  cl_http_server=>get_location(
     exporting
       application  = '/sap/public/myssocntl'  " #EC NOTEXT constant key if required in config
     importing
       host         = host
       port         = service
       out_protocol = protocol ).
  m_http_host    = host.
  m_http_service = service.

else.
*if optional parameter in_protocol is set, we are passing the same to get_location method.
  cl_http_server=>get_location(
     exporting
       application  = '/sap/public/myssocntl'  " #EC NOTEXT constant key if required in config
       protocol = in_protocol
     importing
       host         = host
       port         = service
       out_protocol = protocol ).
  m_http_host    = host.
  m_http_service = service.
endif.



  concatenate protocol '://' m_http_host ':' m_http_service " #EC NOTEXT
    '/sap/public/myssocntl?sap-client=' sy-mandt into url.  " #EC NOTEXT


  call 'Reentrance_Ticket' id 'OPCODE'   field 'C'
                           id 'RETICKET' field sso_ticket.
*  SY-SUBRC = 0 : everything o.k. (ticket obtained)
*            -1 : illegal/unknown opcode/parameter (should not occur)
*            -2 : illegal caller (ABAP callstack)  (should not occur)
*             1 : login/accept_sso2_ticket = 0 (customizing setting!)
*             2 : ticket cannot be created (use note 495911 to analyse)
  case sy-subrc.
     when 0.      "resume
     when 1 or 2. message i146(00) raising cntl_error.
                  clear sso_ticket.
*                 RAISE SAPSSO_CONFIG_ERROR.
     when others. message e191(00) raising cntl_error.
   endcase.

  if enabled is not initial and sso_ticket is not initial.
    i_enabled = 1.
  endif.

  call method call_method
    exporting
      method  = 'EnableSAPSSO'
      p_count = 3
      p1      = i_enabled
      p2      = sso_ticket
      p3      = url
    importing
      result  = m_result
    exceptions
      others  = 1.
*  Note 983386 - End

  IF sy-subrc NE 0.
    RAISE cntl_error.
  ENDIF.

ENDMETHOD. "ENABLE_SAPSSO


method ENABLE_SIMPLEBROWSING.
Data : return_value type c length 1.

 CALL METHOD CL_GUI_FRONTEND_SERVICES=>CHECK_GUI_SUPPORT
    EXPORTING
      COMPONENT            = 'saphtml'
      FEATURE_NAME         = 'simplebrowse'
    RECEIVING
      RESULT               = return_value
    EXCEPTIONS
      CNTL_ERROR           = 1
      ERROR_NO_GUI         = 2
      WRONG_PARAMETER      = 3
      NOT_SUPPORTED_BY_GUI = 4
      UNKNOWN_ERROR        = 5
      others               = 6.

  IF SY-SUBRC <> 0.
    return_value = ABAP_FALSE.
  ENDIF.

IF NOT return_value IS INITIAL.
  IF BENABLE EQ 1.
  CALL METHOD set_property
    EXPORTING
      property = 'SimpleBrowse'
      value    = 1
    EXCEPTIONS
      OTHERS   = 1.
    IF sy-subrc NE 0.
      RAISE cntl_error.
    ENDIF.
  ELSE.
  CALL METHOD set_property
    EXPORTING
      property = 'SimpleBrowse'
      value    = 0
    EXCEPTIONS
      OTHERS   = 1.
    IF sy-subrc NE 0.
      RAISE cntl_error.
    ENDIF.
  ENDIF.
Endif.
endmethod.


METHOD execute_script .
  CALL METHOD call_method
     EXPORTING
         method  = 'ExecuteScript'
         p_count = 0
     EXCEPTIONS
         OTHERS    = 1.
  IF sy-subrc NE 0.
    RAISE cntl_error.
  ENDIF.
ENDMETHOD.


METHOD execwb.
*  IF m_browser IS INITIAL.
*    CALL METHOD get_property
*         EXPORTING
*              property   = 'BrowserHandle'
*              queue_only = ' '
*         IMPORTING
*              value      = m_browser
*         EXCEPTIONS
*              OTHERS     = 1.
*
*    CALL METHOD cl_gui_cfw=>flush.
*
*    IF sy-subrc NE 0.
*      RAISE cntl_error.
*    ENDIF.
*  ENDIF.
*
*  IF cmd_id EQ wb_cmdid_print.
*    CALL FUNCTION 'CONTROL_CALL_METHOD'
*         EXPORTING
*              h_control = m_browser
*              method    = 'ExecWB'     "#EC *
*              p_count   = 2
*              no_flush  = ' '
*              p1        = cmd_id
*              p2        = cmd_opt
*         IMPORTING
*              return    = m_result
*         EXCEPTIONS
*              OTHERS    = 1.
*    IF sy-subrc NE 0.
*      RAISE cntl_error.
*    ENDIF.
*  ENDIF.

**************************************
*         using version 23           *
**************************************
  CALL METHOD call_method
    EXPORTING
      method  = 'ExecuteWB'
      p_count = 2
      p1      = cmd_id
      p2      = cmd_opt
    IMPORTING
      result   = m_result
    EXCEPTIONS
      OTHERS   = 1.
    IF sy-subrc NE 0.
      RAISE cntl_error.
    ENDIF.

ENDMETHOD.


METHOD fill_query_parse_buffer .
  DATA: buffer TYPE cnht_post_data_line.

  LOOP AT m_postdata INTO buffer.
    CONCATENATE parse_buffer '' INTO parse_buffer SEPARATED BY buffer.
  ENDLOOP.

ENDMETHOD.                    "fill_query_parse_buffer


METHOD fill_query_table .

  CONSTANTS: true TYPE i VALUE 1,
             false TYPE i VALUE 0.

  DATA: parse_buffer       TYPE string,
        part_name          TYPE string,
        part_value         TYPE string,
        postdata_linecount TYPE i,
        par_name_len TYPE i,
        par_value_len TYPE i,
        par_name_offs TYPE i VALUE 0,
        parse_buffer_len TYPE i,
        continue TYPE i VALUE true.

  IF www_active IS INITIAL.
    CONCATENATE m_getdata '&' INTO parse_buffer.
  ENDIF.

  IF m_size_of_postdata > 0.
    DESCRIBE TABLE m_postdata LINES postdata_linecount.
    IF postdata_linecount GT 0.
      CALL METHOD fill_query_parse_buffer
        CHANGING
          parse_buffer     = parse_buffer.
    ENDIF.
  ENDIF.

  parse_buffer_len = strlen( parse_buffer ).
  IF parse_buffer_len EQ 0.
*     no data to parse
    EXIT.
  ENDIF.

  part_name = parse_buffer.

  WHILE continue = true.

    IF part_name CA '='.
      par_name_len = sy-fdpos.
      ADD 1 TO sy-fdpos.
      ADD sy-fdpos TO par_name_offs.
      part_value = part_name+sy-fdpos(*).
    ELSE.
      EXIT.
    ENDIF.

    IF part_value CA '&'.
      par_value_len = sy-fdpos.
      continue = true.
    ELSEIF part_value = space.
      par_value_len = 1.
      continue = false.
      part_value = space.
    ELSE.
      par_value_len = strlen( part_value ).
      continue = false.
    ENDIF.

    CALL METHOD append_query_parameter
      EXPORTING
        par_name      = part_name
        par_value     = part_value
        par_name_len  = par_name_len
        par_value_len = par_value_len
      EXCEPTIONS
        OTHERS        = 1.
    IF sy-subrc NE 0.
      RAISE query_error.
    ENDIF.

    IF continue = true.
      ADD par_value_len TO par_name_offs.
      part_name = part_value+par_value_len(*).
      part_name = part_name+1(*).
    ENDIF.

  ENDWHILE.
ENDMETHOD.


method FILTER_DOCUMENT_CONTENT.
  data: lv_encoding     TYPE string,
        lv_enccp        TYPE cpcodepage,
        lv_utf8cp       TYPE cpcodepage,
        lv_utf8_content TYPE xstring,
        lv_error        TYPE string,
        lx_exception    TYPE REF TO cx_root,
        lv_content      TYPE xstring,
        gv_message      TYPE string.

*convert table data to string start
   FIELD-SYMBOLS: <f_l> TYPE ANY,
                 <f_f> TYPE ANY.
 data: structure_comp_count TYPE i ,
       text_string type string ,
       number_lines TYPE i,
       last_line_length TYPE i.
 CLEAR text_string.

 data is_cont_changed type BOOLEAN.

DESCRIBE TABLE data_table LINES number_lines.

* Transform table content into string
  LOOP AT data_table[] ASSIGNING <f_l>.

     ASSIGN <f_l> TO <f_f>.

     IF sy-tabix EQ number_lines.
      last_line_length = STRLEN( <f_f> ).
      IF last_line_length > 0.
        CONCATENATE text_string `` INTO text_string SEPARATED BY <f_f>(last_line_length).
      ENDIF.
     ELSE.
*     This hack concatenates strings including leading spaces
        CONCATENATE text_string `` INTO text_string SEPARATED BY <f_f>.
     ENDIF.
  ENDLOOP.

  SEARCH text_string FOR cl_abap_char_utilities=>minchar.
  IF sy-subrc = 0 AND sy-fdpos >= 0.
    text_string = text_string(sy-fdpos).
  ENDIF.
*convert table data to string end

*convert string to xstring
CALL FUNCTION 'SCMS_STRING_TO_XSTRING'
  EXPORTING
    text = text_string
  IMPORTING
    buffer = lv_content.

*convert string to xstring

if ENCODING EQ ''.
  ENCODING =  'UTF-8'.
endif.

CALL FUNCTION 'SCP_CODEPAGE_BY_EXTERNAL_NAME'
    EXPORTING
      external_name = ENCODING
    IMPORTING
      sap_codepage  = lv_utf8cp
    EXCEPTIONS
      not_found     = 1
      OTHERS        = 2.

*OSS : 0120025231 0000255360 2014, Reverted back the changes for 1824947.

CALL FUNCTION 'SCP_CODEPAGE_BY_EXTERNAL_NAME'
    EXPORTING
      external_name = ENCODING
    IMPORTING
      sap_codepage  = lv_enccp
    EXCEPTIONS
      not_found     = 1
      OTHERS        = 2.



  CALL FUNCTION 'SCP_TRANSLATE_CHARS'
    EXPORTING
      inbuff       = lv_content
      incode       = lv_enccp
      outcode      = lv_utf8cp
      substc_space = 'X'
      substc       = '00035'
    IMPORTING
      outbuff      = lv_utf8_content.


*Filter the HTML document
if NEEDFILTERING eq 2.

TRY.
*CLEAR lx_exception.

call method CL_BTF_BSP_EDITOR=>filter_document_content
         EXPORTING
            i_xstr  = lv_utf8_content
            I_TIDYT    = I_TIDYT
            I_USEWL    = 'X'
            IMPORTING
            e_xstr  = lv_utf8_content
            e_error = lv_error
            E_FILTERED = ISCONTENTCHANGED.

CATCH cx_btf_parameter_error cx_btf_runtime_error cx_btf_internal_error INTO lx_exception.

e_error = lx_exception->get_text( ).
ENDTRY.

else.

TRY.
*CLEAR lx_exception.

call method CL_BTF_BSP_EDITOR=>filter_document_content
         EXPORTING
            i_xstr  = lv_utf8_content
            I_TIDYT    = I_TIDYT
         IMPORTING
            e_xstr  = lv_utf8_content
            e_error = lv_error
            E_FILTERED = ISCONTENTCHANGED.

CATCH cx_btf_parameter_error cx_btf_runtime_error cx_btf_internal_error INTO lx_exception.

e_error = lx_exception->get_text( ).
ENDTRY.
endif.
*Filter the HTML document

if e_error EQ ''.

* Convert lv_content back to original encoding
CALL FUNCTION 'SCP_TRANSLATE_CHARS'
    EXPORTING
      inbuff       = lv_utf8_content
      incode       = lv_utf8cp
      outcode      = lv_enccp
      substc_space = 'X'
      substc       = '00035'
    IMPORTING
      outbuff      = lv_content.
* Convert lv_content back to original encoding

*Convert data xstring to string.
data: conv type ref to cl_abap_conv_in_ce.
conv = cl_abap_conv_in_ce=>create( input = lv_content ).
conv->read( importing data = text_string ).
* convert xstring to string.
free data_table.

* Transform string data to table
FIELD-SYMBOLS : <f> TYPE ANY.
data: ncopied type i,
      len_str type i,
data_ref TYPE REF TO data,
      field_length type i,
      tmp type i,
       n2copy TYPE i.

CREATE DATA data_ref LIKE LINE OF data_table.
  ASSIGN data_ref->* TO <f>.
  ASSIGN COMPONENT 1 OF STRUCTURE <f> TO <f>.

  DESCRIBE FIELD <f> LENGTH field_length IN CHARACTER MODE.

  ncopied = 0.

  len_str = STRLEN( text_string ).


  WHILE ncopied < len_str.
    tmp = ncopied + field_length.
    IF tmp < len_str.
      n2copy = field_length.
    ELSE.
      n2copy = len_str - ncopied.
    ENDIF.

 MOVE text_string+ncopied(n2copy) TO <f>.
    APPEND <f> TO data_table.
    ncopied = ncopied + n2copy.
  ENDWHILE.
endif.
* Transform string data to table
endmethod.


METHOD flush_event_parameters .
  DATA: param_tab TYPE TABLE OF cnht_event_param,
        param     TYPE cnht_event_param,
        buf       TYPE cnht_url_prefix,
        subrc     TYPE i,
        index     TYPE i,
        fdpos     TYPE i.

  FIELD-SYMBOLS <fs> TYPE cnht_event_param.

  m_size_of_postdata = 0.
  CLEAR m_frame.
  CLEAR m_action.
  CLEAR m_url.
  CLEAR m_frame.
  CLEAR m_getdata.
  CLEAR m_postdata.
  CLEAR m_query_table.

  IF on_sapevent IS INITIAL.
    CALL METHOD get_event_parameter
      EXPORTING
        parameter_id = 0
        queue_only   = ' '
      IMPORTING
        parameter    = m_url
      EXCEPTIONS
        OTHERS       = 1.
    IF sy-subrc NE 0.
      RAISE cntl_error.
    ENDIF.

    CALL METHOD cl_gui_cfw=>flush.
    IF sy-subrc NE 0.
      RAISE cntl_error.
    ENDIF.

    EXIT.
  ENDIF.

  CALL METHOD get_event_parameter
    EXPORTING
      parameter_id = 0
      queue_only   = ' '
    IMPORTING
      parameter    = m_frame
    EXCEPTIONS
      OTHERS       = 1.
  IF sy-subrc NE 0.
    RAISE cntl_error.
  ENDIF.

  CALL METHOD get_event_parameter
    EXPORTING
      parameter_id = 1
      queue_only   = ' '
    IMPORTING
      parameter    = m_size_of_postdata
    EXCEPTIONS
      OTHERS       = 1.
  IF sy-subrc NE 0.
    RAISE cntl_error.
  ENDIF.

  IF NOT cl_gui_object=>javabean IS INITIAL.
    CALL METHOD cl_gui_cfw=>flush.
    IF sy-subrc NE 0.
      RAISE cntl_error.
    ENDIF.
  ENDIF.
*  acknowlegde, the SAPEVENT is arrived on backend.
  IF NOT m_use_sapevent_acknowlegde IS INITIAL.
    CALL METHOD sapevent_acknowlegde.
  ENDIF.

  IF NOT www_active IS INITIAL.
    CALL METHOD get_event_parameter
      EXPORTING
        parameter_id = 2
        queue_only   = ' '
      IMPORTING
        parameter    = m_url
      EXCEPTIONS
        OTHERS       = 1.
    IF sy-subrc NE 0.
      RAISE cntl_error.
    ENDIF.

    CALL METHOD cl_gui_cfw=>flush.
    IF sy-subrc NE 0.
      RAISE cntl_error.
    ENDIF.

    CALL METHOD get_sapevent_postdata
      EXPORTING
        size     = m_size_of_postdata
      IMPORTING
        postdata = m_postdata
      EXCEPTIONS
        OTHERS   = 1.
    IF sy-subrc NE 0.
      RAISE cntl_error.
    ENDIF.

  ELSE.

    DO 8 TIMES.
      APPEND param TO param_tab.
    ENDDO.

    index = 2.
    LOOP AT param_tab ASSIGNING <fs>.
      CALL METHOD get_event_parameter
        EXPORTING
          parameter_id = index
          queue_only   = ' '
        IMPORTING
          parameter    = <fs>
        EXCEPTIONS
          OTHERS       = 1.
      IF sy-subrc NE 0.
        RAISE cntl_error.
      ENDIF.
      index = index + 1.
    ENDLOOP.

    IF NOT on_sapevent IS INITIAL.
      CALL METHOD get_sapevent_postdata
        EXPORTING
          size     = m_size_of_postdata
        IMPORTING
          postdata = m_postdata
        EXCEPTIONS
          OTHERS   = 1.
      IF sy-subrc NE 0.
        RAISE cntl_error.
      ENDIF.
    ENDIF.

    CALL METHOD cl_gui_cfw=>flush.
    IF sy-subrc NE 0.
      RAISE cntl_error.
    ENDIF.

    LOOP AT param_tab ASSIGNING <fs>.
      CONCATENATE m_url <fs> INTO m_url.
    ENDLOOP.
  ENDIF.

  IF NOT www_active IS INITIAL.
    SPLIT m_url AT '/' INTO m_action m_getdata.
  ELSE.
    SPLIT m_url AT '?' INTO buf m_getdata.
    SPLIT buf AT ':' INTO buf m_action.
  ENDIF.

  IF m_query_table_disabled IS INITIAL.
    CALL METHOD fill_query_table
      EXCEPTIONS
        OTHERS = 1.
    IF sy-subrc NE 0.
      RAISE query_error.
    ENDIF.
  ENDIF.
ENDMETHOD.                    "


METHOD generate_new_url.
  DATA: full_url(2048),
        extension(8).
  CLEAR m_url.

  IF relative_url IS INITIAL.
    ADD 1 TO m_unique_url_id.

    CALL METHOD get_document_extension
      EXPORTING
        subtype = mime_subtype
      IMPORTING
        extension = extension.

    CONCATENATE 'HTML' m_unique_url_id extension INTO m_url.
  ELSE.
    MOVE relative_url TO m_url.
  ENDIF.
  assigned_url = m_url.
  IF m_url_prefix IS INITIAL.
    CALL METHOD cl_gui_cfw=>flush.
    IF sy-subrc NE 0.
      RAISE cntl_error.
    ENDIF.
  ENDIF.
  CONCATENATE m_url_prefix m_url INTO full_url.
  assigned_url = full_url.
ENDMETHOD.


method GET_BROWSER_STRING.
  IF m_browser_string IS INITIAL.
    CALL METHOD get_property
      EXPORTING
        property   = 'BrowserString'
        queue_only = ' '
      IMPORTING
        value      = m_browser_string
      EXCEPTIONS
        OTHERS     = 1.
    IF sy-subrc NE 0.
      RAISE cntl_error.
    ENDIF.
  ENDIF.
  browser_string = m_browser_string.
endmethod.


METHOD get_current_url .
  CALL METHOD call_method
      EXPORTING
           method       = 'GetCurrentURL'
      IMPORTING
            result      = url
            EXCEPTIONS
                 OTHERS = 1.
  IF sy-subrc NE 0.
    RAISE cntl_error.
  ENDIF.
ENDMETHOD.


METHOD get_document_extension.
  DATA: mime_subtype TYPE char40.
  DATA: doc_type     TYPE saedoktyp,
        mime_type    TYPE w3param-cont_type.

  IF NOT type IS INITIAL.

    CONCATENATE type '/' subtype INTO mime_type.
    CALL FUNCTION 'SDOK_FILE_NAME_EXTENSION_GET'
      EXPORTING
        mimetype     = mime_type
      IMPORTING
        extension    = extension.
    IF extension IS INITIAL.
      TRANSLATE mime_type TO LOWER CASE.                  "#EC SYNTCHAR
      SELECT single doc_type FROM toadd INTO doc_type
                             WHERE mimetype = mime_type.
      IF sy-subrc = 0.
        extension = doc_type.
      ENDIF.
    ENDIF.
    IF NOT extension IS INITIAL.
      CONCATENATE '.' extension INTO extension.
    ENDIF.

    EXIT.
  ENDIF.

  MOVE subtype TO mime_subtype.
  TRANSLATE mime_subtype TO LOWER CASE.                   "#EC SYNTCHAR

  CASE mime_subtype.
    WHEN 'html'.
      extension = '.htm'.

    WHEN 'plain'.
      extension = '.txt'.

    WHEN 'xml'.
      extension = '.xml'.

    WHEN 'bmp'.
      extension = '.bmp'.

    WHEN 'pdf'.
      extension = '.pdf'.

    WHEN 'gif'.
      extension = '.gif'.

    WHEN 'tiff'.
      extension = '.tif'.

    WHEN 'jpg'.
      extension = '.jpg'.

    WHEN 'jpeg'.
      extension = '.jpg'.

    WHEN 'msword'.
      extension = '.doc'.

    WHEN 'rtf'.
      extension = '.rtf'.

    WHEN 'vnd.ms-excel'.
      extension = '.xls'.

    WHEN 'vnd.ms-powerpoint'.
      extension = '.ppt'.

    WHEN 'vnd.lotus123'.
      extension = '.123'.

    WHEN 'vnd.lotus-wordpro'.
      extension = '.lwp'.

    WHEN 'vnd.ms-project'.
      extension = '.mpp'.

    WHEN 'vnd.visio'.
      extension = '.vsd'.

    WHEN 'quicktime'.
      extension = '.mov'.

    WHEN OTHERS.
      extension = ''.
  ENDCASE.
ENDMETHOD.


METHOD get_recommended_charset .

  DATA: gui_cp TYPE  tcp00-cpcodepage,
        charsize TYPE I VALUE cl_abap_char_utilities=>charsize,
        charset TYPE char80.

* get codepage info
  CALL FUNCTION 'SCP_GET_CODEPAGE_NUMBER'
    IMPORTING
      gui_codepage = gui_cp
    EXCEPTIONS
      OTHERS       = 1.

   IF sy-subrc <> 0.
    RAISE system_error.
  ENDIF.

  IF NOT language IS INITIAL AND NOT charset IS INITIAL.
    IF charsize > 1.
*     Unicode
      CALL FUNCTION 'SCP_CODEPAGE_FOR_LANGUAGE'
        EXPORTING
          language = language
        IMPORTING
          codepage = gui_cp
        EXCEPTIONS
          OTHERS   = 1.
    ELSE.
*     non Unicode
      CALL FUNCTION 'NLS_GET_FRONTEND_CP'
        EXPORTING
          langu                 = language
        IMPORTING
          frontend_codepage     = gui_cp
        EXCEPTIONS
          OTHERS                = 1.
    ENDIF.
    IF sy-subrc <> 0.
      RAISE system_error.
    ENDIF.
  ENDIF.

  CALL FUNCTION 'SCP_CODEPAGE_INFO'
    EXPORTING
      codepage  = gui_cp
    IMPORTING
      mime_name = charset
    EXCEPTIONS
      OTHERS    = 1.

  IF sy-subrc <> 0.
    RAISE system_error.
  ENDIF.

  html_charset = charset.
ENDMETHOD.


METHOD get_sapevent_postdata .

  DATA: h_dp          TYPE cntl_handle,
        charline(256),
        byteline(256) TYPE x,
        as_string     TYPE char01 VALUE '',
        linecount     TYPE i,
        remainder     TYPE i,
        initial_charset   TYPE sychar60,
        charset_codepage  TYPE cpcodepage,
        no_codepage       TYPE cpcodepage,
        wa_hex(255)       TYPE x,
        postdatastring    TYPE xstring,
*       Note: 1008717 - start
        wa_html(256)       TYPE C,
        text_len type i,
        l_pos type i,
*       Note: 1008717 -  end
        submitted_codepage(20),
        html_text         TYPE string,
        postdatax         TYPE TABLE OF w3_mime,
        cvto_ascii        TYPE REF TO cl_abap_conv_in_ce, " Utf to ASCII
        return_value      TYPE c LENGTH 1.

  DATA l_save_size TYPE i.
  FIELD-SYMBOLS: <fs> TYPE ANY.

*  REFRESH POSTDATA.
  CLEAR postdata.

*  IF SIZE EQ 0.
*    EXIT.
*  ENDIF.

  CALL METHOD get_property
    EXPORTING
      property   = 'PostData'
      queue_only = ' '
    IMPORTING
      value      = h_dp
    EXCEPTIONS
      OTHERS     = 1.
  IF sy-subrc NE 0.
    RAISE cntl_error.
  ENDIF.

  IF cl_abap_char_utilities=>charsize GT 1.
    as_string = 'X'.
  ENDIF.

  l_save_size = size.

*Note: 975872 - Start
* Check if new feature supported
  CALL METHOD cl_gui_frontend_services=>check_gui_support
    EXPORTING
      component    = 'saphtml'
      feature_name = 'getcharsetstring'
    RECEIVING
      RESULT       = return_value
    EXCEPTIONS
      OTHERS       = 6.
  IF sy-subrc <> 0.
    return_value = abap_false.
  ENDIF.

  IF NOT return_value IS INITIAL.
    CALL METHOD call_method
      EXPORTING
        method = 'GetCharsetString'
      IMPORTING
        RESULT = initial_charset
      EXCEPTIONS
        OTHERS = 1.
  ENDIF.

  IF initial_charset IS INITIAL.
    CALL METHOD cl_gui_cfw=>flush.
    IF sy-subrc NE 0.
      RAISE cntl_error.
    ENDIF.
  ENDIF.

  IF initial_charset EQ 'unicode' OR initial_charset EQ 'unicodeFFFE'.
    initial_charset = 'utf-8'.
  ENDIF.
*Note: 975872 - End


IF initial_charset IS INITIAL.
    CALL FUNCTION 'DP_GET_STREAM'
       EXPORTING
            h_dp                   = h_dp
            send_data_as_string    = as_string
       IMPORTING
            type                   = type
            subtype                = subtype
            size                   = size
       TABLES
            data                   = postdata
       EXCEPTIONS
            dp_error_invalid_param = 1
            OTHERS                 = 2.

    CASE sy-subrc.

      WHEN 0.
      WHEN 1.
        RAISE dp_invalid_parameter.
      WHEN OTHERS.
        RAISE dp_error_general.
    ENDCASE.

*Note: 975872 - Start
  ELSE.
    " Get the data in x-type table
    CLEAR postdatax.
    CALL FUNCTION 'DP_GET_STREAM'
      EXPORTING
        h_dp                   = h_dp
      IMPORTING
        type                   = type
        subtype                = subtype
        size                   = size
      TABLES
        data                   = postdatax
      EXCEPTIONS
        dp_error_invalid_param = 1
        OTHERS                 = 2.
    CASE sy-subrc.

      WHEN 0.
      WHEN 1.
        RAISE dp_invalid_parameter.
      WHEN OTHERS.
        RAISE dp_error_general.
    ENDCASE.

    " Obtain the sap_code page for the external code page.
    CALL FUNCTION 'SCP_CODEPAGE_BY_EXTERNAL_NAME'
      EXPORTING
        external_name = initial_charset
      IMPORTING
        sap_codepage  = charset_codepage
      EXCEPTIONS
        not_found     = 1
        OTHERS        = 2.

    IF NOT charset_codepage EQ no_codepage.
      "Convert the Numc code page value to char
      MOVE charset_codepage TO submitted_codepage.

      "Copy the Xtable to xstring.
      LOOP AT postdatax INTO wa_hex.
        CONCATENATE postdatastring wa_hex INTO postdatastring IN BYTE MODE.
      ENDLOOP.

      "Convert the incomming data to the backend code page.

      TRY.
        CALL METHOD cl_abap_conv_in_ce=>create
            EXPORTING
              encoding = submitted_codepage
            RECEIVING
              conv     = cvto_ascii.
        CATCH cx_parameter_invalid_range .
        CATCH cx_sy_codepage_converter_init .
      ENDTRY.

      TRY.
          CALL METHOD cvto_ascii->convert
            EXPORTING
              input = postdatastring
            IMPORTING
              data  = html_text.
        CATCH cx_sy_conversion_codepage .
        CATCH cx_sy_codepage_converter_init .
        CATCH cx_parameter_invalid_type .
      ENDTRY.

      "Put data back to postdata
      CLEAR postdata.
      CLEAR wa_html.
*     Note: 1008717 - start
      text_len = strlen( html_text ).
      l_pos = 0.
      while l_pos < text_len.
          move html_text+l_pos to wa_html.
          append wa_html to postdata.
          l_pos = l_pos + 256.        "move 256 characters at a time.
      endwhile.
*     Note: 1008717 -  end
    ENDIF.
  ENDIF.
*  Note: 975872 - End

  IF NOT cl_gui_control=>javabean IS INITIAL AND
                l_save_size > 0.
    size = l_save_size.
  ENDIF.

  IF NOT clear_trail_bytes IS INITIAL.
    DESCRIBE TABLE postdata LINES linecount.
    IF linecount GT 0.
      remainder = size - ( linecount - 1 ) * 256.
      IF 0 <= remainder AND remainder < 256.
        IF NOT is_char_data IS INITIAL.
          READ TABLE postdata INDEX linecount INTO charline.
          IF sy-subrc EQ 0.
            ASSIGN charline+remainder(*) TO <fs>.
            MOVE space TO <fs>.
            MODIFY postdata FROM charline INDEX linecount.
          ENDIF.
        ELSE.
          READ TABLE postdata INDEX linecount INTO byteline.
          IF sy-subrc EQ 0.
            ASSIGN byteline+remainder(*) TO <fs>.
            MOVE space TO <fs>.
            MODIFY postdata FROM byteline INDEX linecount.
          ENDIF.
        ENDIF.
      ENDIF.
    ENDIF.
  ENDIF.

  CALL FUNCTION 'DP_DESTROY'
    CHANGING
      h_dp             = h_dp
    EXCEPTIONS
      dp_error_destroy = 1
      OTHERS           = 2.
  IF sy-subrc NE 0.
    RAISE dp_error_general.
  ENDIF.

ENDMETHOD.


method GET_URL_ATTRIBUTES .

DATA: prefix      TYPE string.

  IF url NS ':'.
    CALL METHOD check_loaded_object
      EXPORTING
        doc_url = url
      EXCEPTIONS
        OTHERS = 1.
    IF sy-subrc NE 0.
      absolute_url = 'X'.
    ELSE.
      r3data = 'X'.
    ENDIF.
  ELSE.
    SPLIT url AT ':' INTO prefix m_url.
    TRANSLATE prefix TO UPPER CASE.                       "#EC SYNTCHAR

    CASE prefix.
      WHEN 'SAPR3'.
        r3data = 'X'.
        absolute_url = 'X'.

      WHEN 'SAPHTMLP'.
        r3data = 'X'.
        absolute_url = 'X'.

      WHEN 'SAPHTML'.
        r3data = 'X'.
        absolute_url = 'X'.

      WHEN '@SAPHTML'.
        r3data = 'X'.
        absolute_url = 'X'.

      WHEN 'HTTP'.
        absolute_url = 'X'.

      WHEN 'HTTPS'.
        absolute_url = 'X'.

      WHEN 'FTP'.
        absolute_url = 'X'.

      WHEN 'MAILTO'.
        absolute_url = 'X'.

      WHEN 'FILE'.
        datafile = 'X'.
        absolute_url = 'X'.

      when 'PREFERENCES'.
        if not cl_gui_object=>javabean is initial.
          absolute_url = 'X'.
        else.
          RAISE cnht_error_parameter.
        endif.

      WHEN OTHERS.
        IF strlen( prefix ) = 1.
          datafile = 'X'.
          absolute_url = 'X'.
        ELSE.
          RAISE cnht_error_parameter.
        ENDIF.
    ENDCASE.

  ENDIF.

endmethod.


METHOD go_back .
  CALL METHOD call_method
          EXPORTING
              method = 'GoBack'
         IMPORTING
              result = m_result.
  IF sy-subrc NE 0.
    RAISE cntl_error.
  ENDIF.
ENDMETHOD.


METHOD go_forward .
  CALL METHOD call_method
          EXPORTING
               method  = 'GoForward'
               p_count = 0
         IMPORTING
              result   = m_result.
  IF sy-subrc NE 0.
    RAISE cntl_error.
  ENDIF.
ENDMETHOD.


METHOD go_home .
  CALL METHOD call_method
          EXPORTING
               method  = 'GoHome'
               p_count = 0
         IMPORTING
              result   = m_result.
  IF sy-subrc NE 0.
    RAISE cntl_error.
  ENDIF.
ENDMETHOD.


METHOD init_r3http_path .
  DATA http_prot TYPE syindex VALUE 1.

  IF m_http_htmlviewer IS INITIAL.
    CALL FUNCTION 'TH_GET_PLUGIN_INFO'
      EXPORTING
        protocol = http_prot
      IMPORTING
        host     = m_http_host
        service  = m_http_service.

    CONCATENATE 'http://' m_http_host ':' m_http_service    "#EC NOTEXT
         '/sap/bc/htmlviewer/' INTO m_http_htmlviewer.      "#EC
  ENDIF.
ENDMETHOD.                    "


METHOD is_charbased_table.
  CONSTANTS:
    co_clike   TYPE sychar05 VALUE 'cDgNT'.

  DATA:
    dref_line  TYPE REF TO data,
    line_type  TYPE sychar01,
    comp_type  TYPE sychar01.

  FIELD-SYMBOLS:
    <line>    TYPE data,
    <comp>    TYPE data.

  CREATE DATA dref_line LIKE LINE OF data_table.
  ASSIGN dref_line->* TO <line>.

  DESCRIBE FIELD <line> TYPE line_type.

  IF ( co_clike CS line_type ).

    " table consists of native clike data types
    ischar = 'X'.

  ELSEIF ( 'u' CS line_type ). " flat structures
    "(v= deep structures werden nicht unterstuetzt)

    " table contains structures, test eac component
    DO.
      ASSIGN COMPONENT sy-index OF STRUCTURE <line> TO <comp>.
      IF ( 0 NE sy-subrc ).
        " charlike line with structure
        ischar = 'X'.
        RETURN.
      ENDIF.
      DESCRIBE FIELD <comp> TYPE comp_type.

      IF ( co_clike CS comp_type ).
        " ok
      ELSE.
        " structured line non charlike component
        ischar = ' '.
        RETURN.
      ENDIF.
    ENDDO.

  ELSE.
    " non charlike line type
    ischar = ' '.
  ENDIF.
ENDMETHOD.


METHOD load_bds_object.
  DATA doc_signature TYPE sbdst_signature.
  DATA wa_doc_signature TYPE LINE OF sbdst_signature.
*  DATA doc_components TYPE sbdst_components.
*  DATA wa_doc_component TYPE LINE OF sbdst_components.
  DATA doc_lifetime TYPE sbdst_url_lifetime.

  IF m_bds IS INITIAL.
    CREATE OBJECT m_bds.
  ENDIF.

*  CLEAR doc_components.
  CLEAR doc_signature.
  CLEAR wa_doc_signature.
*  wa_doc_component-comp_id = doc_name.
*  APPEND wa_doc_component TO doc_components.

  wa_doc_signature-prop_name = 'DESCRIPTION'.
  IF doc_description IS INITIAL.
    wa_doc_signature-prop_value = doc_name.
  ELSE.
    wa_doc_signature-prop_value = doc_description.
  ENDIF.
  APPEND wa_doc_signature TO doc_signature.

  wa_doc_signature-prop_name = 'LANGUAGE'.
  IF doc_langu IS INITIAL.
    wa_doc_signature-prop_value = sy-langu.
  ELSE.
    wa_doc_signature-prop_value = doc_langu.
  ENDIF.

  APPEND wa_doc_signature TO doc_signature.

  CALL METHOD m_bds->get_info
    EXPORTING
      classname  = bds_classname
      classtype  = bds_classtype
      object_key = bds_objectkey
    CHANGING
      signature  = doc_signature
*      components = doc_components
    EXCEPTIONS
      OTHERS      = 1.
  IF sy-subrc <> 0.
    RAISE cnht_bds_objnotfound.
  ENDIF.


  CALL METHOD generate_new_url
    EXPORTING
      relative_url = doc_name
    IMPORTING
      assigned_url = m_url.

  assigned_url = m_url.
  doc_lifetime = m_dp_lifetime.

  READ TABLE doc_signature INDEX 1 INTO wa_doc_signature.

  CALL METHOD m_bds->get_with_own_url
    EXPORTING
      classname    = bds_classname
      classtype    = 'OT'
      object_key   = bds_objectkey
      doc_id       = wa_doc_signature-doc_id
      doc_ver_no   = wa_doc_signature-doc_ver_no
      doc_var_id   = wa_doc_signature-doc_var_id
      url          = assigned_url
      url_lifetime = doc_lifetime
    EXCEPTIONS
      OTHERS       = 1  .

ENDMETHOD.


METHOD load_bds_sap_icon .
  DATA doc_signature TYPE sbdst_signature.
  DATA wa_doc_signature TYPE LINE OF sbdst_signature.
  DATA doc_lifetime TYPE sbdst_url_lifetime.
  DATA class_sap_icons TYPE sbdst_classname VALUE 'SAP_ICONS'.
  DATA doc_components TYPE sbdst_components.
  DATA wa_doc_component TYPE LINE OF sbdst_components.
  data bds_objectkey type SBDST_OBJECT_KEY.

  bds_objectkey = sap_icon.

  IF m_bds IS INITIAL.
    CREATE OBJECT m_bds.
  ENDIF.

  CLEAR doc_signature.
  CLEAR doc_components.

  CALL METHOD m_bds->get_info
      EXPORTING
        classname  = class_sap_icons
        classtype  = 'OT'
        object_key = bds_objectkey
      CHANGING
        signature  = doc_signature
        components = doc_components
      EXCEPTIONS
        OTHERS     = 1.
  IF sy-subrc <> 0.
    RAISE cnht_bds_objnotfound.
  ENDIF.

  READ TABLE doc_components INDEX 1 INTO wa_doc_component.
  file_name = wa_doc_component-comp_id.

  CALL METHOD generate_new_url
    EXPORTING
      relative_url = file_name
    IMPORTING
      assigned_url = m_url.

  assigned_url = m_url.
  doc_lifetime = m_dp_lifetime.

  READ TABLE doc_signature INDEX 1 INTO wa_doc_signature.

  CALL METHOD m_bds->get_with_own_url
    EXPORTING
      classname    = class_sap_icons
      classtype    = 'OT'
      object_key   = bds_objectkey
      doc_id       = wa_doc_signature-doc_id
      doc_ver_no   = wa_doc_signature-doc_ver_no
      doc_var_id   = wa_doc_signature-doc_var_id
      url          = assigned_url
      url_lifetime = doc_lifetime
    EXCEPTIONS
      OTHERS       = 1  .

ENDMETHOD.


METHOD load_data .
  DATA: full_url(2048),
        extension(8),
        as_string TYPE char01 VALUE '',
        mime_type TYPE w3param-cont_type,
        r3data    TYPE char01,
        new_size  TYPE i,
        calculated_total_size TYPE i,
        is_charbased TYPE char01,
        lx_exception    TYPE REF TO cx_root,
        e_error type string,
        lv_lent          TYPE I,                " html table line length
        lv_lines         TYPE I,                " number of lines
        lv_lens          TYPE I,                " length variable
        data_ref         TYPE REF TO DATA.

  FIELD-SYMBOLS:
      <data_line>      TYPE ANY.              " line of html table

  data IsContentFiltered type BOOLEAN.

IF NEEDFILTERING EQ 1 OR NEEDFILTERING EQ 2.
TRY.
CALL METHOD FILTER_DOCUMENT_CONTENT
Exporting
  I_TIDYT          = I_TIDYT
  NEEDFILTERING     = NEEDFILTERING
IMPORTING
    E_ERROR  = e_error
  CHANGING
    DATA_TABLE = data_table
    ISCONTENTCHANGED = IsContentFiltered.

CATCH cx_btf_parameter_error cx_btf_runtime_error cx_btf_internal_error INTO lx_exception.
ENDTRY.
*e_error = lx_exception->get_text( ).

*IsContentFiltered is set to 1 if the content is filtered else it is 0.
ISCONTENTCHANGED = IsContentFiltered.
*IsContentFiltered is set to 1 if the content is filtered else it is 0.

if e_error NE ''.
 raise HTML_SYNTAX_NOTCORRECT.
endif.

ENDIF.
* Flush called moved up to prevent indirect event triggering
* in one of the wrapper classes. Relevant notes 888720,884926.
  IF m_url_prefix IS INITIAL.
    CALL METHOD cl_gui_cfw=>flush.
    IF sy-subrc NE 0.
      RAISE cntl_error.
    ENDIF.
  ENDIF.

  CLEAR m_url.

  IF url IS INITIAL.
    ADD 1 TO m_unique_url_id.

    CALL METHOD get_document_extension
      EXPORTING
        type      = type
        subtype   = subtype
      IMPORTING
        extension = extension.

    CONCATENATE 'HTML' m_unique_url_id extension INTO m_url.
  ELSE.
    MOVE url TO m_url.
  ENDIF.
  assigned_url = m_url.


  CALL METHOD is_charbased_table
    EXPORTING
      data_table = data_table
    IMPORTING
      ischar = is_charbased.

  CALL METHOD update_table_dp_object
    EXPORTING
      doc_url = m_url
      type    = type
      subtype = subtype
      is_charbased = is_charbased.

  CONCATENATE m_url_prefix m_url INTO full_url.

  new_size = size.
  MOVE type TO mime_type.
  TRANSLATE mime_type TO LOWER CASE.                      "#EC SYNTCHAR
* In case of complex HTML pages, data truncation is happening if data is not transferred in the form of string
  IF mime_type = 'text' OR mime_type = 'message'.
    IF cl_abap_char_utilities=>charsize GT 1.
      as_string = 'X'.
    ENDIF.
    MOVE subtype TO mime_type.
    TRANSLATE mime_type TO LOWER CASE.                    "#EC SYNTCHAR

    IF mime_type = 'html' or mime_type = 'rfc822'.

      CALL METHOD get_url_attributes
        EXPORTING
          url         = full_url
        IMPORTING
          r3data      = r3data
        EXCEPTIONS
          others      = 1.

      IF sy-subrc = 0 AND
         NOT r3data IS INITIAL AND
         NOT is_charbased IS INITIAL.

        IF mime_type = 'html'.

        CALL METHOD adjust_html_data
          EXPORTING
            language        = language
          CHANGING
            data_table      = data_table
            size            = new_size.
        ENDIF.

*       Changes done for OSS : 0120025231 0000980608 2012
*       When there are multibyte characters in the document of type
*       message/rfc822, the document is not displayed.

        IF mime_type = 'rfc822'.
*         clone and use intermediate html data table line

          CREATE DATA data_ref LIKE LINE OF data_table[].
          ASSIGN data_ref->* TO <data_line>.

*          determine the html data line length
          DESCRIBE FIELD <data_line> LENGTH lv_lent IN CHARACTER MODE.

*          adjust data_table size
          IF size <> 0.
            DESCRIBE TABLE data_table LINES lv_lines.
            READ TABLE data_table INDEX lv_lines INTO <data_line>.
            lv_lens = STRLEN( <data_line> ).
            calculated_total_size = ( lv_lines - 1 ) * lv_lent + lv_lens.
          ENDIF.

*         If the size calculated by adjust_html_data is more, do not change it.
*         OSS : 0020079747 0000483328 2013
          IF new_size < calculated_total_size.
            new_size = calculated_total_size.
          ENDIF.

        ENDIF.  "mime_type = 'rfc822'
      ENDIF.
    ENDIF.
  ENDIF.

  CALL FUNCTION 'DP_CREATE_URL'
    EXPORTING
      type                 = type
      subtype              = subtype
      size                 = new_size
      lifetime             = m_dp_lifetime
      send_data_as_string  = as_string
    TABLES
      data                 = data_table
    CHANGING
      url                  = full_url
    EXCEPTIONS
      dp_invalid_parameter = 1
      OTHERS               = 2.
  CASE sy-subrc.
    WHEN 0.
    WHEN 1.
      RAISE dp_invalid_parameter.
    WHEN 2.
      RAISE dp_error_general.
  ENDCASE.
ENDMETHOD.


METHOD load_html_document.
  DATA: html_table      TYPE TABLE OF w3html INITIAL SIZE 10,
        url_buffer(256) TYPE c,
        template        TYPE swww_t_template_name,
        html2pack       TYPE TABLE OF swww_t_html_l INITIAL SIZE 100,
        wa_html2pack    TYPE swww_t_html_l,
        wa_html         TYPE w3html,
        pos_tag_begin   TYPE i,
        pos_tag_end     TYPE i,
        l_src_len       TYPE i,
        in_pre_tag      TYPE c,
        in_script_tag   TYPE c,
        l_wa_len        TYPE i.

  data IsContMod type BOOLEAN.
  data l_tidytnew type boolean.

  DESCRIBE FIELD wa_html LENGTH l_wa_len IN CHARACTER MODE.
  l_src_len = l_wa_len.

  template = document_id.

* Note 986025 - Start
  CALL FUNCTION 'WWW_GET_SCRIPT_AND_HTML'
       EXPORTING
            obj_name = template
       TABLES
            html     = html_table
       exceptions
            object_not_found = 1.

  if sy-subrc ne 0.
    raise document_not_found.
  endif.

* Note 986025 - End

  CALL FUNCTION 'WWW_HTML_MERGER'
       EXPORTING
            template           = ''
            merge_textpool     = document_textpool
            template_table     = html_table
       IMPORTING
            html_table         = html_table
       CHANGING
            merge_table        = merge_table
       EXCEPTIONS
            template_not_found = 1
            OTHERS             = 2.
  IF sy-subrc NE 0.
    RAISE document_not_found.
  ENDIF.
  IF document_url IS INITIAL.
    ADD 1 TO m_unique_url_id.

    CONCATENATE 'HTML' m_unique_url_id '.HTM'
                               INTO url_buffer.
  ELSE.
    url_buffer = document_url.
  ENDIF.
  assigned_url = url_buffer.

  IF NOT as_compressed_data IS INITIAL.
    CLEAR html2pack.

    LOOP AT html_table INTO wa_html.
      wa_html2pack-len = strlen( wa_html ).
*     Note 941692 - For space supression at 255th character - begin.
      if wa_html2pack-len eq 254.
        wa_html2pack-len = wa_html2pack-len + 1.
      endif.
*     Note 941692 - For space supression at 255th character - end.
      pos_tag_end = wa_html2pack-len.
      pos_tag_begin = 0.

      SEARCH wa_html FOR '<pre'.
      IF sy-subrc EQ 0.
        in_pre_tag = 'X'.
      ENDIF.

      SEARCH wa_html FOR '<script'.
      IF sy-subrc EQ 0.
        in_script_tag = 'X'.
      ENDIF.

      IF in_pre_tag = 'X' OR in_script_tag = 'X'.
        wa_html2pack-line = wa_html.
        wa_html2pack-len = l_wa_len.
      ELSE.
        SEARCH wa_html FOR '>'.
        IF sy-subrc EQ 0.
          pos_tag_end = sy-fdpos.
          SEARCH wa_html FOR '<'.
          IF sy-subrc EQ 0.
            pos_tag_begin = sy-fdpos.
          ENDIF.
        ENDIF.

        IF pos_tag_end < pos_tag_begin.
          wa_html2pack-line = wa_html.
        ELSE.
          IF l_src_len LT l_wa_len.
            MOVE wa_html TO wa_html2pack-line.
*            CLEAR wa_html2pack-line(1).
*            wa_html2pack-len = wa_html2pack-len + 1.
          ELSE.
            MOVE wa_html TO wa_html2pack-line.
          ENDIF.
        ENDIF.
        l_src_len = strlen( wa_html2pack-line ).
      ENDIF.
      APPEND wa_html2pack TO html2pack.

      SEARCH wa_html FOR '</pre>'.
      IF sy-subrc EQ 0.
        CLEAR in_pre_tag.
      ENDIF.

      SEARCH wa_html FOR '</script>'.
      IF sy-subrc EQ 0.
        CLEAR in_script_tag.
      ENDIF.

    ENDLOOP.

    CLEAR html_table.

    CALL FUNCTION 'WWW_PACK_TABLE'
         TABLES
              html_table        = html2pack
              html_table_packed = html_table.

  ENDIF.

IF NEEDFILTERING EQ 1 OR NEEDFILTERING EQ 2 .

  CALL METHOD load_data
       EXPORTING
            url                     = url_buffer
            type                    = 'text'
            subtype                 = 'html'
            language                = language
            needfiltering           = NEEDFILTERING
            I_TIDYT                 =  I_TIDYT
       CHANGING
            data_table              = html_table
            ISCONTENTCHANGED        = IsContMod

       EXCEPTIONS
            dp_invalid_parameter    = 1
            HTML_SYNTAX_NOTCORRECT = 4
            OTHERS                  = 2.

  ISCONTENTCHANGED = IsContMod.

  CASE sy-subrc.
    WHEN 0.
    WHEN 1.
      RAISE dp_invalid_parameter.
    WHEN 4.
      RAISE HTML_SYNTAX_NOTCORRECT.
    WHEN OTHERS.
      RAISE dp_error_general.
  ENDCASE.
 else.
  CALL METHOD load_data
       EXPORTING
            url                     = url_buffer
            type                    = 'text'
            subtype                 = 'html'
            language                = language
       CHANGING
            data_table              = html_table
       EXCEPTIONS
            dp_invalid_parameter    = 1
            OTHERS                  = 2.
  CASE sy-subrc.
    WHEN 0.
    WHEN 1.
      RAISE dp_invalid_parameter.
    WHEN OTHERS.
      RAISE dp_error_general.
  ENDCASE.
  endif.
ENDMETHOD.


METHOD load_mime_object .
  DATA : query_table TYPE TABLE OF w3query INITIAL SIZE 1,
         wa_qtable TYPE w3query,
         html_table TYPE TABLE OF w3html INITIAL SIZE 1,
         mime_table TYPE TABLE OF w3mime INITIAL SIZE 10,
         return_code TYPE  w3param-ret_code,
         content_type TYPE  w3param-cont_type,
         type TYPE  w3param-cont_type,
         subtype TYPE  w3param-cont_type,
         content_length TYPE  w3param-cont_len,
         url_buffer(256).

  wa_qtable-name = '_OBJECT_ID'.
  wa_qtable-value = object_id.
  APPEND wa_qtable TO query_table.
  CALL FUNCTION 'WWW_GET_MIME_OBJECT'
       TABLES
            query_string        = query_table
            html                = html_table
            mime                = mime_table
       CHANGING
            return_code         = return_code
            content_type        = content_type
            content_length      = content_length
       EXCEPTIONS
            OTHERS              = 1.
  IF sy-subrc EQ 0.
    IF object_url IS INITIAL.
      ADD 1 TO m_unique_url_id.
      CONCATENATE 'MIME' m_unique_url_id INTO url_buffer.
    ELSE.
      url_buffer = object_url.
    ENDIF.
    assigned_url = url_buffer.
    IF content_type CA '/'.
      SPLIT content_type AT '/' INTO type subtype.
    ELSE.
      type = content_type.
      subtype = ' '.
    ENDIF.
    CALL METHOD load_data
         EXPORTING
              url                  = url_buffer
              type                 = type
              subtype              = subtype
              size                 = content_length
         CHANGING
              data_table           = mime_table
         EXCEPTIONS
              dp_invalid_parameter = 1
              OTHERS               = 2.
    CASE sy-subrc.
      WHEN 0.
      WHEN 1.
        RAISE dp_invalid_parameter.
      WHEN OTHERS.
        RAISE dp_error_general.
    ENDCASE.
  ELSE.
    RAISE object_not_found.
  ENDIF.
ENDMETHOD.


method SAPEVENT_ACKNOWLEGDE .
endmethod.


METHOD set_document_charset .

  DATA: script TYPE TABLE OF w3html INITIAL SIZE 1,
        wa_script TYPE w3_html.

********************************************************************
* A flush has be done here to make sure the document is loaded.    *
********************************************************************
*  CALL METHOD cl_gui_cfw=>flush. " ~ serious performance problems
********************************************************************
  CHECK NOT html_charset IS INITIAL.
  CONCATENATE 'document.charset="' html_charset '";'
                                     INTO wa_script.   "#EC NOTEXT
  APPEND wa_script TO script.
  CALL METHOD me->set_script
    EXPORTING
      script = script.
  IF sy-subrc NE 0.
    RAISE cntl_error.
  ENDIF.

  CALL METHOD me->execute_script.
  IF sy-subrc NE 0.
    RAISE cntl_error.
  ENDIF.

*  while processing an event do_refresh returns to the previous page
*  CALL METHOD me->do_refresh.
*  IF sy-subrc NE 0.
*    RAISE cntl_error.
*  ENDIF.

ENDMETHOD.


METHOD set_navigation_style.
  SEARCH style FOR style_r3only.
  IF sy-subrc = 0.
    m_r3only = 'X'.
  ENDIF.
  m_style = style.
  CALL METHOD set_property
       EXPORTING
            property          = 'NavigationStyle'
            value             = m_style
       EXCEPTIONS
            OTHERS            = 1.
  IF sy-subrc NE 0.
    RAISE cntl_error.
  ENDIF.
ENDMETHOD.


METHOD set_script.
  DATA: is_charbased TYPE char01 VALUE '',
        script_raw TYPE cnht_w3mime_table,
        property_name TYPE char40 VALUE 'ScriptText'.

  IF NOT propertyname IS INITIAL.
    property_name = propertyname.
  ENDIF.

  IF cl_abap_char_utilities=>charsize = 1.

*   non-Unicode environment - process script as table
    CALL FUNCTION 'DP_CONTROL_ASSIGN_TABLE'
      EXPORTING
        h_cntl       = me->h_control
        propertyname = property_name
        medium       = cndp_medium_r3table
      TABLES
        data         = script
      EXCEPTIONS
        OTHERS       = 1.

  ELSE.

*   Unicode environment - process script table as stream
    CALL FUNCTION 'DP_CONTROL_ASSIGN_STREAM'
      EXPORTING
        h_cntl               = me->h_control
        propertyname         = property_name
        medium               = cndp_medium_r3table
        type                 = cndp_sap_tab_mimetype
        subtype              = cndp_sap_tab_mimesubtype
        send_data_as_string  = 'X'
      TABLES
        data         = script
      EXCEPTIONS
        OTHERS       = 1.

  ENDIF.
  IF sy-subrc <> 0.
    RAISE dp_error.
  ENDIF.

*  CALL METHOD is_charbased_table
*    EXPORTING
*      data_table = script
*    IMPORTING
*      ischar     = is_charbased.
*
*  IF is_charbased IS INITIAL.
*    CALL FUNCTION 'DP_CONTROL_ASSIGN_TABLE'
*      EXPORTING
*        h_cntl       = me->h_control
*        propertyname = property_name
*        medium       = cndp_medium_r3table
*      TABLES
*        data         = script
*      EXCEPTIONS
*        OTHERS       = 1.
*    IF sy-subrc <> 0.
*      RAISE dp_error.
*    ENDIF.
*
*    EXIT.
*
*  ENDIF.
*
*  CALL METHOD convert_table_as_raw
*    EXPORTING
*      char_table = script
*    IMPORTING
*      raw_table  = script_raw.
*
*  CALL FUNCTION 'DP_CONTROL_ASSIGN_TABLE'
*    EXPORTING
*      h_cntl       = me->h_control
*      propertyname = property_name
*      medium       = cndp_medium_r3table
*    TABLES
*      data         = script_raw
*    EXCEPTIONS
*      OTHERS       = 1.
*  IF sy-subrc <> 0.
*    RAISE dp_error.
*  ENDIF.

ENDMETHOD.


METHOD set_script_on_abap_completed.
  CALL METHOD set_script
    EXPORTING
      script       = script
      propertyname = 'ScriptOnABAPCompleted'
    EXCEPTIONS
      OTHERS       = 1.

  IF sy-subrc <> 0.
    RAISE dp_error.
  ENDIF.
ENDMETHOD.


METHOD set_script_on_data_submitted .
  CALL METHOD set_script
    EXPORTING
      script       = script
      propertyname = 'ScriptOnDataSubmitted'
    EXCEPTIONS
      OTHERS       = 1.

  IF sy-subrc <> 0.
    RAISE dp_error.
  ENDIF.
ENDMETHOD.


METHOD set_ui_flag.
  IF uiflag IS INITIAL.
    m_default_sapgui_charset = ''.
    EXIT.
  ELSEIF uiflag = me->uiflag_use_sapgui_charset.
    CALL METHOD get_recommended_charset
      IMPORTING
        html_charset = m_default_sapgui_charset
      EXCEPTIONS
        OTHERS       = 1.
    IF sy-subrc NE 0.
      RAISE cntl_error.
    ENDIF.
    EXIT.
  ENDIF.

  m_uiflag = uiflag.
  IF uiflag NE 0.
    CALL METHOD set_property
      EXPORTING
        property = 'UIFlag'
        value    = uiflag
      EXCEPTIONS
        OTHERS   = 1.
    IF sy-subrc NE 0.
      RAISE cntl_error.
    ENDIF.
  ENDIF.
ENDMETHOD.


method SHOW_DATA .
  CALL METHOD me->show_url
    EXPORTING
      url       = url
      frame     = frame
      in_place  = in_place
    EXCEPTIONS
      cnht_error_not_allowed  = 1
      cnht_error_parameter    = 2
      dp_error_general        = 3
      OTHERS                  = 4.
  CASE sy-subrc.
    WHEN 1.
      RAISE cnht_error_not_allowed.
    WHEN 2.
      RAISE cnht_error_parameter.
    WHEN 3.
      RAISE dp_error_general.
    WHEN 4.
      RAISE cntl_error.
    WHEN OTHERS.
  ENDCASE.
ENDMETHOD.


method SHOW_DATA_EX .
  CALL FUNCTION 'DP_SYNC_URLS'
       EXCEPTIONS
            OTHERS = 1.
  IF sy-subrc NE 0.
    RAISE dp_error_general.
  ENDIF.

  CALL METHOD call_method
          EXPORTING
               method  = 'ShowData'
               p_count = 3
               p1      = url
               p2      = frame
               p3      = 1
         IMPORTING
              result   = m_result
         EXCEPTIONS
             OTHERS    = 1.
  IF sy-subrc NE 0.
    RAISE cntl_error.
  ENDIF.
ENDMETHOD.


METHOD show_url .
  DATA: r3data TYPE char1 VALUE '',
        datafile TYPE char1 VALUE '',
        absolute_url TYPE char1 VALUE ''.

  CALL METHOD get_url_attributes
    EXPORTING
      url           = url
    IMPORTING
      r3data        = r3data
      datafile      = datafile
      absolute_url  = absolute_url
    EXCEPTIONS
      cnht_error_parameter  = 1.
   IF sy-subrc <> 0.
     RAISE cnht_error_parameter.
   ENDIF.

  IF NOT m_r3only IS INITIAL.
    IF ( r3data IS INITIAL ) AND ( datafile IS INITIAL ).
      RAISE cnht_error_not_allowed.
    ENDIF.
  ENDIF.

  CALL FUNCTION 'DP_SYNC_URLS'
    EXCEPTIONS
      OTHERS = 1.
  IF sy-subrc NE 0.
    RAISE dp_error_general.
  ENDIF.

  IF in_place IS INITIAL.
    IF absolute_url IS INITIAL.
      CALL METHOD call_method
        EXPORTING
          method  = 'ShowDataInBrowser'
          p_count = 1
          p1      = url
        IMPORTING
          RESULT  = m_result
        EXCEPTIONS
          OTHERS  = 1.
    ELSE.
      CALL METHOD call_method
        EXPORTING
          method  = 'ShowUrlInBrowser'
          p_count = 1
          p1      = url
        IMPORTING
          RESULT  = m_result
        EXCEPTIONS
          OTHERS  = 1.
    ENDIF.
  ELSEIF absolute_url IS INITIAL.
    CALL METHOD call_method
      EXPORTING
        method  = 'ShowData'
        p_count = 3
        p1      = url
        p2      = frame
        p3      = 1
      IMPORTING
        RESULT  = m_result
      EXCEPTIONS
        OTHERS  = 1.
  ELSE.
    CALL METHOD call_method
      EXPORTING
        method  = 'ShowUrl'
        p_count = 2
        p1      = url
        p2      = frame
      IMPORTING
        RESULT  = m_result
      EXCEPTIONS
        OTHERS  = 1.
  ENDIF.

  IF sy-subrc NE 0.
    RAISE cntl_error.
  ENDIF.

ENDMETHOD.                    "show_url


method SHOW_URL_EX .
  DATA r3data TYPE char1 VALUE ''.

  IF NOT m_r3only IS INITIAL.
    SEARCH url FOR 'sapr3:'.
    IF sy-subrc = 0.
      r3data = 'X'.
    ENDIF.

    SEARCH url FOR 'saphtmlp:'.
    IF sy-subrc = 0.
      r3data = 'X'.
    ENDIF.

    SEARCH url FOR 'mk:@SAPHTML'.
    IF sy-subrc = 0.
      r3data = 'X'.
    ENDIF.

    IF r3data IS INITIAL.
      RAISE cnht_error_not_allowed.
    ENDIF.
  ENDIF.

  CALL METHOD call_method
    EXPORTING
      method  = 'ShowUrl'
      p_count = 2
      p1      = url
      p2      = frame
  IMPORTING
      result   = m_result
   EXCEPTIONS
      OTHERS   = 1.
  IF sy-subrc NE 0.
    RAISE cntl_error.
  ENDIF.
ENDMETHOD.


METHOD show_url_in_browser .
  CALL METHOD me->show_url
    EXPORTING
      url      = url
      in_place = ''
    EXCEPTIONS
      OTHERS   = 1.
  IF sy-subrc NE 0.
    RAISE cntl_error.
  ENDIF.
ENDMETHOD.


METHOD stop .
  CALL METHOD call_method
          EXPORTING
               method  = 'Stop'                             "#EC NOTEXT
               p_count = 0
         IMPORTING
              result   = m_result
         EXCEPTIONS
              OTHERS   = 1.
  IF sy-subrc NE 0.
    RAISE cntl_error.
  ENDIF.
ENDMETHOD.


METHOD track_context_menu .
  DATA guiobject TYPE REF TO cl_gui_object.
  CALL METHOD cl_ctxmnu_mgr=>create_proxy
        EXPORTING menu = ctxmenu
        CHANGING  guiobject = guiobject
  EXCEPTIONS OTHERS = 1.
  IF sy-subrc NE 0.
    RAISE ctmenu_error.
  ENDIF.

  CALL METHOD call_method
        EXPORTING method = 'TrackContextMenu'
                  p_count   = 3
                  p1        = guiobject->h_control
                  p2        = posx
                  p3        = posy
  EXCEPTIONS OTHERS = 1.
  IF sy-subrc NE 0.
    RAISE  ctmenu_error.
  ENDIF.

  CALL METHOD guiobject->free
        EXCEPTIONS OTHERS = 1.
  IF sy-subrc NE 0.
    RAISE  ctmenu_error.
  ENDIF.
ENDMETHOD.


METHOD translate_query_string .
  DO.
    REPLACE '%26' WITH '&' INTO buffer.
    IF sy-subrc NE 0.
      EXIT.
    ENDIF.
  ENDDO.
  DO.
    REPLACE '%3D' WITH '=' INTO buffer.
    IF sy-subrc NE 0.
      EXIT.
    ENDIF.
  ENDDO.
  DO.
    REPLACE '%3F' WITH '?' INTO buffer.
    IF sy-subrc NE 0.
      EXIT.
    ENDIF.
  ENDDO.
ENDMETHOD.


METHOD update_table_dp_object.
  DATA: wa_object TYPE sht_object,
        to_modify TYPE c,
        docid TYPE ht_docid,
        mime_type TYPE ht_mtype,
        mime_subtype TYPE ht_mstype,
        table_type TYPE char1.

  CLEAR to_modify.
  MOVE doc_url TO docid.
  TRANSLATE docid TO UPPER CASE.                          "#EC SYNTCHAR
  MOVE type TO mime_type.
  MOVE subtype TO mime_subtype.
  MOVE is_charbased TO table_type.

  IF NOT m_table_dp_object IS INITIAL.
    READ TABLE m_table_dp_object WITH KEY docid = docid INTO wa_object.
    IF sy-subrc = 0.
      to_modify = 'X'.
    ENDIF.
  ENDIF.

  wa_object-docid = docid.
  wa_object-type = mime_type.
  wa_object-subtype = mime_subtype.
  wa_object-is_charbased = table_type.

  IF NOT to_modify IS INITIAL.
    MODIFY TABLE m_table_dp_object FROM wa_object.
  ELSE.
    APPEND wa_object TO m_table_dp_object.
  ENDIF.

ENDMETHOD.
ENDCLASS.