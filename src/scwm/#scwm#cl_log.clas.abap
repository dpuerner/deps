class /SCWM/CL_LOG definition
  public
  create public .

public section.
*"* public components of class /SCWM/CL_LOG
*"* do not include other source files here!!!

  constants MSGTY_SUCCESS type CHAR1 value 'S'. "#EC NOTEXT
  constants MSGTY_ERROR type CHAR1 value 'E'. "#EC NOTEXT
  constants MSGTY_WARNING type CHAR1 value 'W'. "#EC NOTEXT
  constants MSGTY_INFO type CHAR1 value 'I'. "#EC NOTEXT
  constants MSGTY_ABORT type CHAR1 value 'A'. "#EC NOTEXT
  data MV_CREATED_DATE type SY-DATUM .
  data MV_CREATED_TIME type SY-UZEIT .
  data MP_PROTOCOL type BAPIRETTAB read-only .
  data MP_SEVERITY type BAPI_MTYPE read-only .
  data GV_NOLOG type XFELD .
  data GV_NO_INFO type XFELD .

  methods ADD_LOG
    importing
      !IT_PROT type BAPIRETTAB optional
      !IO_PROT type ref to /SCWM/CL_LOG optional .
  methods ADD_MESSAGE
    importing
      !IP_MSGTY type SYMSGTY optional
      !IP_MSGID type SYMSGID optional
      !IP_MSGNO type SYMSGNO optional
      !IP_MSGV1 type SYMSGV optional
      !IP_MSGV2 type SYMSGV optional
      !IP_MSGV3 type SYMSGV optional
      !IP_MSGV4 type SYMSGV optional
      !IP_MSG type BAPI_MSG optional
      !IP_PARAM type BAPI_PARAM optional
      !IP_ROW type BAPI_LINE optional
      !IP_FIELD type BAPI_FLD optional .
  methods ADD_MESSAGE2LOG
    importing
      !IP_MSGTY type SYMSGTY optional
      !IP_MSGID type SYMSGID optional
      !IP_MSGNO type SYMSGNO optional
      !IP_MSGV1 type SYMSGV optional
      !IP_MSGV2 type SYMSGV optional
      !IP_MSGV3 type SYMSGV optional
      !IP_MSGV4 type SYMSGV optional
      !IP_MSG type BAPI_MSG optional
      !IP_PARAM type BAPI_PARAM optional
      !IP_ROW type BAPI_LINE optional
      !IP_FIELD type BAPI_FLD optional
      !IP_DETLVL type BALLEVEL optional
      !IP_LOGHANDLE type BALLOGHNDL optional .
  methods CHANGE_LAST_MESSAGE
    importing
      !IP_MSGTY type SYMSGTY .
  methods CONSTRUCTOR
    importing
      value(IV_NOLOG) type XFELD optional
      !IV_CREATED_DATE type SY-DATUM optional
      !IV_CREATED_TIME type SY-UZEIT optional
      !IV_LGNUM type /SCWM/LGNUM optional
      !IV_BALOBJ type BALOBJ_D optional
      !IV_BALSUBOBJ type BALSUBOBJ optional
    preferred parameter IV_NOLOG .
  methods CONVERT_BAPIRET2APPLOG
    importing
      !IT_BAPIRET type BAPIRETTAB optional
      !IV_GROUP type BALSORT optional
    exporting
      !EV_LOGHANDLE type BALLOGHNDL .
  methods CONVERT_MSGTYPE
    importing
      !IV_MSGTYPE type BAPI_MTYPE
      !IV_REPLACE_ONLY type BAPI_MTYPE optional .
  methods CREATE_LOG
    importing
      !IS_LOG type BAL_S_LOG
    exporting
      !EV_LOGHANDLE type BALLOGHNDL .
  methods DETERM_SEVERITY
    importing
      !IS_MSG type BAPIRET2 optional
      !IT_PROT type BAPIRETTAB optional
      !IP_MSGTY type SYMSGTY optional
      !IS_BALMSG type BAL_S_MSG optional
    returning
      value(EV_SEVERITY) type BAPI_MTYPE .
  methods DISPLAY_LOG
    importing
      !IV_LOGHANDLE type BALLOGHNDL optional
      !IS_DISPLAY_PROFILE type BAL_S_PROF optional
    raising
      /SCWM/CX_BASICS .
  class-methods GET_INSTANCE
    exporting
      !EO_INSTANCE type ref to /SCWM/CL_LOG .
  methods GET_LAST_MESSAGE
    importing
      !IV_MSG_TYPE type BAPI_MTYPE default 'E'
    returning
      value(EV_MSGTEXT) type BAPI_MSG .
  methods GET_LAST_MESSAGE_COMPLETE
    importing
      !IV_MSG_TYPE type BAPI_MTYPE default 'E'
    exporting
      value(EV_MSG) type BAPIRET2 .
  methods GET_LOG
    exporting
      !ES_LOG type BAL_S_LOG .
  methods GET_LOGHANDLE
    exporting
      !EV_LOGHANDLE type BALLOGHNDL .
  methods GET_PROT
    returning
      value(ET_PROTOCOL) type BAPIRETTAB .
  methods GET_SEVERITY
    returning
      value(E_RC_SEVERITY) type BAPI_MTYPE .
  methods INIT
    importing
      !IV_LGNUM type /SCWM/LGNUM optional
      !IV_BALOBJ type BALOBJ_D optional
      !IV_BALSUBOBJ type BALSUBOBJ optional .
  methods NO_INFO .
  methods READ_APPLOG
    importing
      !I_LOGHANDLE type BALLOGHNDL .
  methods SAVE_APPLOG
    importing
      !IS_LOG type BAL_S_LOG
    exporting
      !EV_LOGHANDLE type BALLOGHNDL .
  methods SAVE_APPLOG2DB
    importing
      !IV_LOGHANDLE type BALLOGHNDL optional
    exporting
      !ES_LOGNUMBER type BAL_S_LGNM
    raising
      /SCWM/CX_BASICS .
  methods SET_ROWID
    importing
      !IV_ROWID type BAPI_LINE .
protected section.
*"* protected components of class /SCWM/CL_LOG
*"* do not include other source files here!!!

  data MP_LOG type BAL_S_LOG .
  data MP_LOGHANDLE type BALLOGHNDL .
  class-data MO_INSTANCE type ref to /SCWM/CL_LOG .
  data MV_LGNUM type /SCWM/LGNUM .
  data MV_BALOBJ type BALOBJ_D .
  data MV_BALSUBOBJ type BALSUBOBJ .
  data MV_ROWID type BAPI_LINE .

  methods GET_NO_INFO
    importing
      !IV_LGNUM type /SCWM/LGNUM
      !IV_BALOBJ type BALOBJ_D
      !IV_BALSUBOBJ type BALSUBOBJ
    returning
      value(RV_NO_INFO) type XFELD .
  methods SET_LOG
    importing
      !IS_LOG type BAL_S_LOG .
  methods SET_LOGHANDLE
    importing
      !IV_LOGHANDLE type BALLOGHNDL .
private section.
*"* private components of class /SCWM/CL_LOG
*"* do not include other source files here!!!

  methods RAISE_MESSAGE
    importing
      !TEXTID type SOTR_CONC
      !VAR1 type STRING optional
      !VAR2 type STRING optional
      !VAR3 type STRING optional .
ENDCLASS.



CLASS /SCWM/CL_LOG IMPLEMENTATION.


method ADD_LOG .

  data: lt_prot like it_prot.

  if not it_prot[] is initial.
*   optionally delete 'I' messages
    lt_prot = it_prot.
    if gv_no_info = abap_true.
      delete lt_prot where type = 'I'.
    endif.
* add protocol
    if lt_prot is not initial.
      append lines of lt_prot to mp_protocol.
      determ_severity( it_prot = lt_prot ).
    endif.
  endif.

  if io_prot is bound.
* add protocol
    lt_prot = io_prot->get_prot( ).
    if gv_no_info = abap_true.
      delete lt_prot where type = 'I'.
    endif.
    if not lt_prot[] is initial.
      append lines of lt_prot to mp_protocol.
      determ_severity( it_prot = lt_prot ).
    endif.
  endif.

endmethod.


METHOD add_message .

  DATA: ls_protocol    TYPE bapiret2.

* Don't write message, when global variable "gv_nolog" was set by constructor
  CHECK gv_nolog IS INITIAL.

  IF ip_msgno IS SUPPLIED OR
     ip_msg IS SUPPLIED.

    CHECK gv_no_info IS INITIAL OR
          ip_msgty   <> 'I'.

    ls_protocol-type       = ip_msgty.
    ls_protocol-id         = ip_msgid.
    ls_protocol-number     = ip_msgno.
    ls_protocol-message_v1 = ip_msgv1.
    ls_protocol-message_v2 = ip_msgv2.
    ls_protocol-message_v3 = ip_msgv3.
    ls_protocol-message_v4 = ip_msgv4.
    ls_protocol-parameter  = ip_param.
    ls_protocol-row        = ip_row.
    ls_protocol-field      = ip_field.

  ELSE.

    CHECK gv_no_info IS INITIAL OR
          sy-msgty   <> 'I'.

    ls_protocol-type       = sy-msgty.
    ls_protocol-id         = sy-msgid.
    ls_protocol-number     = sy-msgno.
    ls_protocol-message_v1 = sy-msgv1.
    ls_protocol-message_v2 = sy-msgv2.
    ls_protocol-message_v3 = sy-msgv3.
    ls_protocol-message_v4 = sy-msgv4.
    ls_protocol-parameter  = ip_param.
    ls_protocol-row        = ip_row.
    ls_protocol-field      = ip_field.

  ENDIF.

  IF ip_msg IS INITIAL.

    CALL FUNCTION 'BALW_BAPIRETURN_GET2'
      EXPORTING
        type      = ls_protocol-type
        cl        = ls_protocol-id
        number    = ls_protocol-number
        par1      = ls_protocol-message_v1
        par2      = ls_protocol-message_v2
        par3      = ls_protocol-message_v3
        par4      = ls_protocol-message_v4
        parameter = ls_protocol-parameter
        row       = ls_protocol-row
        field     = ls_protocol-field
      IMPORTING
        return    = ls_protocol.
    sy-msgty =  ls_protocol-type.
  ELSE.

    ls_protocol-message = ip_msg.

  ENDIF.

  "set ROW ID from the global parameter, if empty on the current message record
  IF ls_protocol-row IS INITIAL.
    ls_protocol-row = mv_rowid.
  ENDIF.

  APPEND ls_protocol TO mp_protocol.

  determ_severity( is_msg = ls_protocol ).

ENDMETHOD.


METHOD add_message2log .

* Add message to application log ().

  DATA: ls_protocol  TYPE bal_s_msg.
  DATA: lv_probcl    TYPE bal_s_msg-probclass.
  DATA: lv_loghandle TYPE balloghndl.

* Don't write message, when global variable "gv_nolog" was set by constructor
  CHECK gv_nolog IS INITIAL.

  IF ip_msgno IS SUPPLIED OR
     ip_msg IS SUPPLIED.

    CHECK gv_no_info IS INITIAL OR
          ip_msgty   <> 'I'.

    ls_protocol-msgty      = ip_msgty.
    ls_protocol-msgid      = ip_msgid.
    ls_protocol-msgno      = ip_msgno.
    ls_protocol-msgv1      = ip_msgv1.
    ls_protocol-msgv2      = ip_msgv2.
    ls_protocol-msgv3      = ip_msgv3.
    ls_protocol-msgv4      = ip_msgv4.
    ls_protocol-alsort     = ip_row.
    ls_protocol-detlevel   = ip_detlvl.

  ELSE.

    CHECK gv_no_info IS INITIAL OR
          sy-msgty   <> 'I'.

    ls_protocol-msgty      = sy-msgty.
    ls_protocol-msgid      = sy-msgid.
    ls_protocol-msgno      = sy-msgno.
    ls_protocol-msgv1      = sy-msgv1.
    ls_protocol-msgv2      = sy-msgv2.
    ls_protocol-msgv3      = sy-msgv3.
    ls_protocol-msgv4      = sy-msgv4.
    ls_protocol-alsort     = ip_row.
    ls_protocol-detlevel   = ip_detlvl.

  ENDIF.

* Check message type / severeness

  CASE sy-msgty.
    WHEN 'S'.
      ls_protocol-probclass = '4'.
    WHEN 'I'.
      ls_protocol-probclass = '4'.
    WHEN 'W'.
      ls_protocol-probclass = '3'.
    WHEN 'E'.
      ls_protocol-probclass = '2'.
    WHEN 'A'.
      ls_protocol-probclass = '1'.
    WHEN OTHERS.
      ls_protocol-probclass = '4'.
  ENDCASE.

* Get Loghandle
  IF ip_loghandle IS INITIAL.

    CALL METHOD me->get_loghandle
      IMPORTING
        ev_loghandle = lv_loghandle.
  ELSE.
    lv_loghandle = ip_loghandle.
  ENDIF.

* Fill data into application log

  CALL FUNCTION 'BAL_LOG_MSG_ADD'
    EXPORTING
      i_log_handle = lv_loghandle
      i_s_msg      = ls_protocol
    EXCEPTIONS
      OTHERS       = 4.
  IF sy-subrc <> 0.
    EXIT.
  ENDIF.

  CALL METHOD me->determ_severity
    EXPORTING
      ip_msgty  = ls_protocol-msgty
      is_balmsg = ls_protocol.


ENDMETHOD.


METHOD change_last_message.
  DATA: lv_index TYPE int4.
  FIELD-SYMBOLS <protocol> TYPE bapiret2.

  DESCRIBE TABLE mp_protocol LINES lv_index.

  IF lv_index = 0 OR
     ( gv_no_info IS NOT INITIAL AND
       sy-msgty   = 'I' ).
    CHECK ip_msgty <> 'I'.
    sy-msgty = ip_msgty.
    me->add_message( ).
  ELSE.
    mp_severity = ip_msgty.

    READ TABLE mp_protocol ASSIGNING <protocol>
      INDEX lv_index.
    IF sy-subrc = 0.
      <protocol>-type = ip_msgty.
      determ_severity( it_prot = mp_protocol ).
    ENDIF.
  ENDIF.
ENDMETHOD.


METHOD constructor.

  gv_nolog = iv_nolog.
  mv_created_date = iv_created_date.
  mv_created_time = iv_created_time.

  mv_lgnum     = iv_lgnum.
  mv_balobj    = iv_balobj.
  mv_balsubobj = iv_balsubobj.

* determine NO_INFO flag using BAdI
  gv_no_info = get_no_info( iv_lgnum = iv_lgnum
                            iv_balobj    = iv_balobj
                            iv_balsubobj = iv_balsubobj ).
ENDMETHOD.


METHOD convert_bapiret2applog.

  FIELD-SYMBOLS: <prot> TYPE bapiret2.
  data: lt_bapiret type bapirettab.

  DATA: ls_msg       TYPE bal_s_msg.
*  DATA: es_log       TYPE bal_s_log.
*
*
*  CALL METHOD me->get_log
*    IMPORTING
*      es_log = es_log.

  CLEAR ev_loghandle.

  if it_bapiret IS NOT INITIAL.
    lt_bapiret = it_bapiret.
    else.
    lt_bapiret = mp_protocol.
  endif.

* Get Log Handle
  CALL METHOD me->get_loghandle
    IMPORTING
      ev_loghandle = ev_loghandle.

  LOOP AT lt_bapiret ASSIGNING <prot>.

*   do not add 'I' messages if set globally
    CHECK gv_no_info IS INITIAL OR
          <prot>-type   <> 'I'.


*   Put Log data into internal table

    CLEAR ls_msg.
    ls_msg-msgty     = <prot>-type.
    ls_msg-msgid     = <prot>-id.
    ls_msg-msgno     = <prot>-number.
    ls_msg-msgv1     = <prot>-message_v1.
    ls_msg-msgv2     = <prot>-message_v2.
    ls_msg-msgv3     = <prot>-message_v3.
    ls_msg-msgv4     = <prot>-message_v4.
    MOVE <prot>-row  TO ls_msg-alsort.
    if iv_group is not initial.
      ls_msg-alsort = iv_group.
    endif.
    CASE <prot>-type.
      WHEN 'S'.
        ls_msg-probclass = '4'.
      WHEN 'I'.
        ls_msg-probclass = '4'.
      WHEN 'W'.
        ls_msg-probclass = '3'.
      WHEN 'E'.
        ls_msg-probclass = '2'.
      WHEN 'A'.
        ls_msg-probclass = '1'.
      WHEN OTHERS.
        ls_msg-probclass = '4'.
    ENDCASE.

*   Fill data into application log
    IF <prot>-number IS NOT INITIAL.

      CALL FUNCTION 'BAL_LOG_MSG_ADD'
        EXPORTING
          i_log_handle = ev_loghandle
          i_s_msg      = ls_msg
        EXCEPTIONS
          OTHERS       = 4.
      IF sy-subrc <> 0.
        EXIT.
      ENDIF.

    ELSEIF <prot>-message IS NOT INITIAL.

      CALL FUNCTION 'BAL_LOG_MSG_ADD_FREE_TEXT'
        EXPORTING
          i_log_handle = ev_loghandle
          i_msgty      = <prot>-type
          i_probclass  = ls_msg-probclass
          i_text       = <prot>-message
        EXCEPTIONS
          OTHERS       = 4.
      IF sy-subrc <> 0.
        EXIT.
      ENDIF.

    ENDIF.

  ENDLOOP.

ENDMETHOD.


METHOD convert_msgtype.
  FIELD-SYMBOLS: <prot> TYPE bapiret2.
  CHECK iv_msgtype IS NOT INITIAL.

  LOOP AT mp_protocol ASSIGNING <prot>.
    IF iv_replace_only IS NOT INITIAL AND
       <prot>-type <> iv_replace_only.
      CONTINUE.
    ENDIF.
    <prot>-type = iv_msgtype.
  ENDLOOP.

  mp_severity = determ_severity( it_prot = mp_protocol ).

ENDMETHOD.


METHOD create_log.

  CALL METHOD me->set_log
    EXPORTING
      is_log = is_log.

  CALL FUNCTION 'BAL_LOG_CREATE'
    EXPORTING
      i_s_log                 = is_log
    IMPORTING
      e_log_handle            = ev_loghandle
    EXCEPTIONS
      log_header_inconsistent = 1
      OTHERS                  = 2.
  IF sy-subrc <> 0.
    EXIT.
  ENDIF.

  CALL METHOD me->set_loghandle
    EXPORTING
      iv_loghandle = ev_loghandle.


ENDMETHOD.


METHOD determ_severity .

  FIELD-SYMBOLS: <fs_prot> LIKE LINE OF it_prot.
  DATA: lf_severity LIKE mp_severity.

  CHECK mp_severity NE 'A'.

  LOOP AT it_prot ASSIGNING <fs_prot> .

    CASE <fs_prot>-type.

      WHEN 'A'.
        lf_severity = <fs_prot>-type.
        EXIT.

      WHEN 'E'.
        lf_severity = <fs_prot>-type.

      WHEN 'W'.
        IF lf_severity <> 'E'.
          lf_severity = <fs_prot>-type.
        ENDIF.

      WHEN 'I'.
        IF lf_severity IS INITIAL.
          lf_severity = <fs_prot>-type.
        ENDIF.

      WHEN 'S'.
        IF lf_severity IS INITIAL.
          lf_severity = 'I'.
        ENDIF.

    ENDCASE.
  ENDLOOP.

  IF ( lf_severity = 'A' OR lf_severity = 'E' ) OR
* abort message occurred
     ( lf_severity = 'W' AND mp_severity NE 'E' ) OR
* warning
     ( lf_severity = 'I' AND mp_severity IS INITIAL ).
* info
    mp_severity = lf_severity.
  ENDIF.


  IF NOT is_msg IS INITIAL.
    lf_severity = is_msg-type.
    if lf_severity = 'S'.
      lf_severity = 'I'.
    endif.

    IF ( lf_severity = 'A' OR lf_severity = 'E' ) OR
* abort message occurred
   ( lf_severity = 'W' AND mp_severity NE 'E' ) OR
* warning
   ( lf_severity = 'I' AND mp_severity IS INITIAL ).
* info
      mp_severity = lf_severity.
    ENDIF.
  ENDIF.

  IF NOT is_balmsg IS INITIAL.
    CASE is_balmsg-probclass.
      WHEN '4'.
        lf_severity = 'I'.
      WHEN '3'.
        lf_severity = 'W'.
      WHEN '2'.
        lf_severity = 'E'.
      WHEN '1'.
        lf_severity = 'A'.
      WHEN OTHERS.
    ENDCASE.
  ENDIF.

  IF ( lf_severity = 'A' OR lf_severity = 'E' ) OR
* abort message occurred
     ( lf_severity = 'W' AND mp_severity NE 'E' ) OR
* warning
     ( lf_severity = 'I' AND mp_severity IS INITIAL ).
* info
    mp_severity = lf_severity.
  ENDIF.

  ev_severity = lf_severity.

ENDMETHOD.


METHOD display_log.

  DATA: lv_loghandle TYPE balloghndl.
  DATA: lt_loghandle TYPE bal_t_logh.

  IF iv_loghandle IS INITIAL.
    CALL METHOD me->get_loghandle
      IMPORTING
        ev_loghandle = lv_loghandle.
  ELSE.
    lv_loghandle = iv_loghandle.
  ENDIF.

  APPEND lv_loghandle TO lt_loghandle.

  CALL FUNCTION 'BAL_DSP_LOG_DISPLAY'
    EXPORTING
      i_s_display_profile = is_display_profile
      i_t_log_handle      = lt_loghandle
    EXCEPTIONS
      OTHERS              = 1.
  IF sy-subrc <> 0.
    RAISE EXCEPTION TYPE /scwm/cx_basics.
  ENDIF.

ENDMETHOD.


method GET_INSTANCE.
  if mo_instance is not bound.
    create object mo_instance.
  endif.
  eo_instance = mo_instance.
endmethod.


method GET_LAST_MESSAGE.
data: ls_prot type bapiret2.
loop at MP_PROTOCOL into ls_prot where type = iv_msg_type.
  ev_msgtext = ls_prot-message.
endloop.

endmethod.


METHOD get_last_message_complete.

  DATA: ls_prot TYPE bapiret2.

  LOOP AT mp_protocol INTO ls_prot WHERE type = iv_msg_type.
    ev_msg = ls_prot.
  ENDLOOP.

ENDMETHOD.


method GET_LOG.

  es_log = mp_log.

endmethod.


method GET_LOGHANDLE.

 ev_loghandle = mp_loghandle.

endmethod.


METHOD get_no_info.
  DATA: lo_badi TYPE REF TO /scwm/ex_hu_appl_log.

  CLEAR: rv_no_info.

* determine NO_INFO flag using BAdI
  IF iv_lgnum     IS NOT INITIAL AND
     iv_balobj    IS NOT INITIAL AND
     iv_balsubobj IS NOT INITIAL.
    TRY .
        GET BADI lo_badi
          FILTERS
            balobj = iv_balobj.
        CALL BADI lo_badi->get_no_info
          EXPORTING
            iv_lgnum     = iv_lgnum
            iv_balobj    = iv_balobj
            iv_balsubobj = iv_balsubobj
          IMPORTING
            ev_no_info   = rv_no_info.
      CATCH cx_badi.
    ENDTRY.
  ENDIF.
ENDMETHOD.


method GET_PROT .

 et_protocol = mp_protocol.

endmethod.


method GET_SEVERITY .

  e_rc_severity = mp_severity.

endmethod.


METHOD init .
  DATA: lv_lgnum     TYPE /scwm/lgnum,
        lv_balobj    TYPE balobj_d,
        lv_balsubobj TYPE balsubobj.

  CLEAR: mp_protocol, mp_log.

  CLEAR mp_loghandle.

  IF iv_lgnum     IS NOT INITIAL AND
     iv_balobj    IS NOT INITIAL AND
     iv_balsubobj IS NOT INITIAL.
    lv_lgnum     = iv_lgnum.
    lv_balobj    = iv_balobj.
    lv_balsubobj = iv_balsubobj.
  ELSE.
    lv_lgnum     = mv_lgnum.
    lv_balobj    = mv_balobj.
    lv_balsubobj = mv_balsubobj.
  ENDIF.
* get NO_INFO flag
  gv_no_info = get_no_info( iv_lgnum     = lv_lgnum
                            iv_balobj    = lv_balobj
                            iv_balsubobj = lv_balsubobj ).

  mp_severity = msgty_info.

ENDMETHOD.


METHOD no_info.

  gv_no_info = 'X'.

ENDMETHOD.


method RAISE_MESSAGE .

** whoever needs this feature, please implement here
*
*
** exception handling
*  data: l_refo_cx_check     type ref to /scmb/cx_bol_check,
*        l_refo_cx_no_check  type ref to /scmb/cx_bol_no_check,
*        l_refo_cx_root      type ref to cx_root,
*        l_msg               type bapi_msg,
*        l_msgty             type symsgty.
*
*  try.
*
*      raise exception type /scmb/cx_bol_no_check
*            exporting textid = textid
*            severity = msgty_error.
*
*  catch /scmb/cx_bol_no_check into l_refo_cx_no_check.
*
*      l_msg = l_refo_cx_no_check->if_message~get_text( ).
*      l_msgty = l_refo_cx_no_check->get_severity( ).
*      me->add_message( ip_msgty = l_msgty
*                       ip_msg   = l_msg ).
*
*  endtry.
**
endmethod.


method READ_APPLOG .

  data:lt_log_handle  type  bal_t_logh,
       lt_msg_handle  type  bal_t_msgh,
       ls_msg_handle  type  balmsghndl,
       ls_messages    type  bapiret2,
       ls_msg         type  bal_s_msg.

  data: lf_message type bapi_msg.
  data: ls_prot type bapiret2.
  data: lt_prot type bapirettab.

* get the message handles for log
  insert i_loghandle into table lt_log_handle.
  call function 'BAL_GLB_SEARCH_MSG'
    exporting
      i_t_log_handle = lt_log_handle
    importing
      e_t_msg_handle = lt_msg_handle
    exceptions
      msg_not_found  = 1.

* get the message using the handles
  loop at lt_msg_handle into ls_msg_handle.
    call function 'BAL_LOG_MSG_READ'
      exporting
        i_s_msg_handle = ls_msg_handle
        i_langu        = sy-langu
      importing
        e_s_msg        = ls_msg
      exceptions
        log_not_found  = 1
        msg_not_found  = 2
        others         = 3.
    if sy-subrc = 0.

      message id     ls_msg-msgid
              type   ls_msg-msgty
              number ls_msg-msgno
              with   ls_msg-msgv1
                     ls_msg-msgv2
                     ls_msg-msgv3
                     ls_msg-msgv4 into lf_message.

      ls_prot-type       = sy-msgty.
      ls_prot-id         = sy-msgid.
      ls_prot-number     = sy-msgno.
      ls_prot-message_v1 = sy-msgv1.
      ls_prot-message_v2 = sy-msgv2.
      ls_prot-message_v3 = sy-msgv3.
      ls_prot-message_v4 = sy-msgv4.
      ls_prot-message    = lf_message.

      append ls_prot to lt_prot.

    endif.

  endloop.

  me->add_log( it_prot = lt_prot ).

endmethod.


method SAVE_APPLOG .

  field-symbols: <fs_prot> like line of mp_protocol.

  data: ls_msg      type bal_s_msg.

  clear ev_loghandle.

  check mp_protocol is not initial.

*- open log
  CALL FUNCTION 'BAL_LOG_CREATE'
    EXPORTING
      I_S_LOG                 = is_log
    IMPORTING
      E_LOG_HANDLE            = Ev_LOGHANDLE
    EXCEPTIONS
      LOG_HEADER_INCONSISTENT = 1
      OTHERS                  = 2.
  IF SY-SUBRC <> 0.
    exit.
  ENDIF.

  loop at mp_protocol assigning <fs_prot>.

    clear ls_msg.
*-  put data into internal table
    ls_msg-msgty     = <fs_prot>-type.
    ls_msg-msgid     = <fs_prot>-id.
    ls_msg-msgno     = <fs_prot>-number.
    ls_msg-msgv1     = <fs_prot>-message_v1.
    ls_msg-msgv2     = <fs_prot>-message_v2.
    ls_msg-msgv3     = <fs_prot>-message_v3.
    ls_msg-msgv4     = <fs_prot>-message_v4.

    case <fs_prot>-type.
      when 'S'.
        ls_msg-probclass = '4'.
      when 'I'.
        ls_msg-probclass = '4'.
      when 'W'.
        ls_msg-probclass = '3'.
      when 'E'.
        ls_msg-probclass = '2'.
      when 'A'.
        ls_msg-probclass = '1'.
      when others.
        ls_msg-probclass = '4'.
    endcase.

*-  write application log
    if <fs_prot>-number is not initial.
      CALL FUNCTION 'BAL_LOG_MSG_ADD'
        EXPORTING
          I_LOG_HANDLE     = ev_loghandle
          I_S_MSG          = ls_msg
        EXCEPTIONS
          LOG_NOT_FOUND    = 1
          MSG_INCONSISTENT = 2
          LOG_IS_FULL      = 3
          OTHERS           = 4.
      IF SY-SUBRC <> 0.
      ENDIF.

    elseif <fs_prot>-message is not initial.
      CALL FUNCTION 'BAL_LOG_MSG_ADD_FREE_TEXT'
        EXPORTING
          I_LOG_HANDLE     = ev_loghandle
          I_MSGTY          = <fs_prot>-type
          I_PROBCLASS      = ls_msg-probclass
          I_TEXT           = <fs_prot>-message
        EXCEPTIONS
          LOG_NOT_FOUND    = 1
          MSG_INCONSISTENT = 2
          LOG_IS_FULL      = 3
          OTHERS           = 4.
      IF SY-SUBRC <> 0.
      ENDIF.

    endif.

  endloop.

endmethod.


METHOD save_applog2db.

*  DATA: ls_log_act    TYPE /scwm/log_act.
  DATA: ls_log        TYPE bal_s_log.
  DATA: lv_severity   TYPE bapi_mtype.
  DATA: lv_create_log TYPE xfeld.

  DATA: lv_loghandle TYPE balloghndl.
  DATA: lt_loghandle TYPE bal_t_logh.
  DATA: lt_lognumbers TYPE bal_t_lgnm.


  CLEAR: es_lognumber.

*  Check whether to Save Log

  CALL METHOD me->get_log
    IMPORTING
      es_log = ls_log.


  CALL METHOD me->get_severity
    RECEIVING
      e_rc_severity = lv_severity.

  IF lv_severity CA 'A'.
    lv_create_log = 'X'.
  ENDIF.

  IF lv_severity CA 'AE'.
    lv_create_log = 'X'.
  ENDIF.

  IF lv_severity CA 'AEW'.
    lv_create_log = 'X'.
  ENDIF.

  IF lv_severity CA 'AEWIS'.
    lv_create_log = 'X'.
  ENDIF.


* Save Log To DB
  IF lv_create_log IS NOT INITIAL.

*   Get Loghandle
    IF iv_loghandle IS INITIAL.

      CALL METHOD me->get_loghandle
        IMPORTING
          ev_loghandle = lv_loghandle.
    ELSE.
      lv_loghandle = iv_loghandle.
    ENDIF.
    APPEND lv_loghandle TO lt_loghandle.

*   Save
    CALL FUNCTION 'BAL_DB_SAVE'
      EXPORTING
        i_t_log_handle = lt_loghandle
      IMPORTING
        e_new_lognumbers = lt_lognumbers
      EXCEPTIONS
        OTHERS         = 4.
    IF sy-subrc <> 0.
      RAISE EXCEPTION TYPE /scwm/cx_basics.
    ENDIF.
    READ TABLE lt_lognumbers INTO es_lognumber
               WITH KEY log_handle = lv_loghandle.

  ENDIF.


ENDMETHOD.


method SET_LOG.

  mp_log = is_log.

endmethod.


METHOD set_loghandle.

  mp_loghandle = iv_loghandle.

 ENDMETHOD.


METHOD set_rowid.
*--------------------------------------------------------------------*
*  Set the ROW ID that is used, if this is not set when adding new
*  messages to the log.
*--------------------------------------------------------------------*
  IF iv_rowid IS NOT INITIAL.
    mv_rowid = iv_rowid.
  ENDIF.
ENDMETHOD.
ENDCLASS.