class /SCDL/CL_IM_SCHED_COND definition
  public
  create public .

*"* public components of class /SCDL/CL_IM_SCHED_COND
*"* do not include other source files here!!!
public section.
protected section.

  types:
*"* protected components of class /SCDL/CL_IM_SCHED_COND
*"* do not include other source files here!!!
    begin of LTYS_ITM,
      BI_TAB type        /SCDL/DL_ITEM_TAB,
      AI_TAB type        /SCDL/DL_ITEM_TAB,
    end of LTYS_ITM .
  types:
    begin of LTYS_HDR,
      ID     type        GUID,
      DOCCAT type        /SCDL/DL_DOCCAT,
      BI     type ref to /SCDL/CL_DL_HEADER, " DB state
      AI     type ref to /SCDL/CL_DL_HEADER, " current state
    end of LTYS_HDR .
  types:
    begin of LTYS_DOCUMENT,
      HDR type LTYS_HDR,
      ITM type LTYS_ITM,
    end of LTYS_DOCUMENT .

  constants LC_APPL_DLV type PPFDAPPL value '/SCDL/DELIVERY' ##NO_TEXT.
  constants LC_MSGCLASS type SYMSGID value '/SCDL/PPF' ##NO_TEXT.
  constants LC_MSGTYPE_A type SYMSGTY value 'A' ##NO_TEXT.
  constants LC_MSGTYPE_E type SYMSGTY value 'E' ##NO_TEXT.
  constants LC_MSGTYPE_W type SYMSGTY value 'W' ##NO_TEXT.
  constants LC_MSGTYPE_S type SYMSGTY value 'S' ##NO_TEXT.
  constants LC_MSGTYPE_I type SYMSGTY value 'I' ##NO_TEXT.

  methods APPLDATA_ACCESS
    importing
      !IV_ACTTYPE type PPFDTT
      !IV_BADI_FLTVAL type PPFDFLTCO1
      !IO_CONTEXT type ref to CL_CONTEXT_PPF
      !IV_FLTVAL_SCHED type PPFDFLTCO1
    returning
      value(EO_DOCUMENT) type LTYS_DOCUMENT
    raising
      /SCDL/CX_PPF_CONDITIONS .
  methods CHECK_APPL
    importing
      !IV_APPLCTN type PPFDAPPL
      !IV_FILTER type PPFDFLTCO1
      !IV_ACTION type PPFDTT
      !IV_LOG_HANDLE type BALLOGHNDL
    exporting
      !EV_RC type SY-SUBRC .
  methods IS_DELETION
    importing
      !IO_PPF type ref to /SCDL/CL_DLV_PPF
    returning
      value(RV_DELETION) type BOOLE_D .
  methods IS_DELETION_HDR
    importing
      !IO_HEADER type ref to /SCDL/CL_DL_HEADER
    returning
      value(RV_DELETION) type BOOLE_D .
  methods LOG_HDL
    importing
      !IO_LOG_HDL type BALLOGHNDL
      !IV_PROBLEMCLASS type BALPROBCL optional
      !IO_CX_MSG_COND type ref to /SCDL/CX_PPF_CONDITIONS optional .
  methods LOG_EVENT_SCHED
    importing
      !IV_ACTION type PPFDTT
      !IV_NO_RES type BOOLE_D default ABAP_FALSE
      !IV_SCHED_COND type PPFDFLTCO1 .
private section.
*"* private components of class /SCDL/CL_IM_SCHED_COND
*"* do not include other source files here!!!
ENDCLASS.



CLASS /SCDL/CL_IM_SCHED_COND IMPLEMENTATION.


METHOD appldata_access.
*----------------------------------------------------------
* Purpose: Read application data out of ppf context object
*          and return it in a deep structure, holding before
*          image data an after image data including header,
*          document category and items with a generic type
*
* Visibility:
*   private
*
* Interface:
*   Importing
*     IV_ACTTYPE          TYPE PPFDTT      PPF: Name der
*                                          Aktionsdefinition
*     IV_BADI_FLTVAL      TYPE PPFDFLTCO1  Filterwert für BADI
*                                          EVAL_SCHEDCOND_PPF
*     IO_CONTEXT          TYPE REF TO CL_CONTEXT_PPF  PPF
*                                          context object
*
*   Exporting
*     VALUE( EO_DOCUMENT )  TYPE LTYS_DOCUMENT  application data
*
*   Exceptions:
*     /SCDL/CX_ppf_CONDITIONS                Ausnahmeklasse zur
*                                                Findung/ zum Start von
*                                                Nachrichten
* Created: 03.11.2003
* Changed: 22.09.2005
* Reason: internal message 2662551 2005
* Changed:
* Reason:
*----------------------------------------------------------

* Abstract objects
  DATA: lo_ao_dlv      TYPE REF TO /scdl/cl_dlv_ppf,
        ls_bo          TYPE        /scdl/af_ppf_str.
* Headers and Items
  DATA: ls_hdr         TYPE        ltys_hdr,
        ls_itm         TYPE        ltys_itm.

* Exceptions
  DATA: lo_ex_bo            TYPE REF TO /scdl/cx_bo.

* Access appl. data
  lo_ao_dlv ?= io_context->appl. "ref to object -> /scdl/cl_dlv_ppf
  ls_bo      = lo_ao_dlv->get_mo_bo( ).

  ls_hdr-doccat = ls_bo-doccat.
  ls_hdr-id     = ls_bo-docid.

  TRY.
      ls_hdr-ai     = ls_bo-bo->get_header(
                 iv_objectstate = /scdl/if_dl_c=>sc_object_state_curr ).
      ls_bo-bo->get_item_tab(
        EXPORTING iv_objectstate = /scdl/if_dl_c=>sc_object_state_curr
        IMPORTING et_item        = ls_itm-ai_tab ).
      ls_hdr-bi  = ls_bo-bo->get_header(
                   iv_objectstate = /scdl/if_dl_c=>sc_object_state_db ).
      ls_bo-bo->get_item_tab(
        EXPORTING  iv_objectstate = /scdl/if_dl_c=>sc_object_state_db
        IMPORTING  et_item        = ls_itm-bi_tab ).
    CATCH /scdl/cx_bo INTO lo_ex_bo.
      RAISE EXCEPTION TYPE /scdl/cx_ppf_conditions
        EXPORTING
          previous = lo_ex_bo
                  textid   =
                   /scdl/cx_ppf_conditions=>no_auth_or_dbal_err.
  ENDTRY.

  eo_document-hdr = ls_hdr.
  eo_document-itm = ls_itm.


ENDMETHOD.


METHOD CHECK_APPL.

  DATA:
    lv_dummy             TYPE string.                       "#EC NEEDED

  IF iv_applctn = lc_appl_dlv.
    RETURN.
  ENDIF.

* not a delivery application relevant object
  ev_rc = 99.
  MESSAGE ID lc_msgclass TYPE lc_msgtype_e NUMBER '031'
        WITH iv_filter iv_action iv_applctn iv_filter
        INTO lv_dummy.
  log_hdl(
      io_log_hdl      = iv_log_handle
      iv_problemclass = sppf_pclass_1 ).

ENDMETHOD.


METHOD is_deletion.

  IF /scdl/if_dl_c=>sc_objchg_delete = io_ppf->get_updkz( ).
    rv_deletion = abap_true.
  ELSE.
    rv_deletion = abap_false.
  ENDIF.

ENDMETHOD.


METHOD is_deletion_hdr.

  IF io_header->mv_objchg = /scdl/if_dl_c=>sc_objchg_delete.
    rv_deletion = abap_true.
  ELSE.
    rv_deletion = abap_false.
  ENDIF.

ENDMETHOD.


METHOD log_event_sched.

  DATA:
    lo_saf               TYPE REF TO /scdl/cl_af_management,
    lo_tm                TYPE REF TO /scdl/if_af_tm.

  lo_saf = /scdl/cl_af_management=>get_instance( ).
  TRY.
      lo_tm ?= lo_saf->get_service(
          /scdl/if_af_management_c=>sc_trans_manager ).
      lo_tm->log_ppf_sched(
          iv_action     = iv_action
          iv_no_res     = iv_no_res
          iv_sched_cond = iv_sched_cond ).
    CATCH /scdl/cx_af_management.                       "#EC NO_HANDLER
  ENDTRY.

ENDMETHOD.


METHOD log_hdl.
*----------------------------------------------------------
* Purpose: Write log entries to PPF processing log according
*          to a given exception class an its predecessor(s)
*
* Visibility:
*   private
*
* Interface:
*   Importing
*     IO_LOG_HDL      TYPE         BALLOGHNDL
*                                       Anwendungs-Log: Handle
*                                       eines Protokolls
*     IV_PROBLEMCLASS TYPE         BALPROBCL OPTIONAL
*                                       Anwendungs-Log:
*                                       Problemklasse einer Meldung
*     IO_CX_MSG_COND  TYPE REF TO  /SCDL/CX_SRV_MSG_CONDITIONS
*                                       Ausnahmeklasse zur Findung/
*                                       zum Start von Nachrichten
*   Exporting
*     ./.
*
*   Exceptions:
*     ./.
*
* Created: 10.11.2003
* Changed:
* Reason:
* Changed:
* Reason:
*----------------------------------------------------------

*  DATA: lo_cx           TYPE REF TO cx_root.

  DATA: lv_problemclass TYPE        balprobcl,
        lv_dummy        TYPE        string.                 "#EC NEEDED
  DATA: ls_symsg TYPE symsg.

  IF iv_problemclass IS INITIAL.
    lv_problemclass = sppf_pclass_4.
  ELSE.
    lv_problemclass = iv_problemclass.
  ENDIF.
*
  CASE lv_problemclass.
    WHEN sppf_pclass_1.   ls_symsg-msgty = lc_msgtype_a.
    WHEN sppf_pclass_2.   ls_symsg-msgty = lc_msgtype_e.
    WHEN sppf_pclass_3.   ls_symsg-msgty = lc_msgtype_w.
    WHEN sppf_pclass_4.   ls_symsg-msgty = lc_msgtype_i.
    WHEN OTHERS.          ls_symsg-msgty = lc_msgtype_s.
  ENDCASE.

  IF io_cx_msg_cond IS BOUND.
*   message from exception
    MESSAGE io_cx_msg_cond TYPE ls_symsg-msgty.
    MOVE-CORRESPONDING io_cx_msg_cond->if_t100_message~t100key
      TO ls_symsg.
    MOVE io_cx_msg_cond->IF_T100_MESSAGE~t100key-attr1
      TO ls_symsg-msgv1.
    MOVE io_cx_msg_cond->IF_T100_MESSAGE~t100key-attr2
      TO ls_symsg-msgv2.
    MOVE io_cx_msg_cond->IF_T100_MESSAGE~t100key-attr3
      TO ls_symsg-msgv3.
    MOVE io_cx_msg_cond->IF_T100_MESSAGE~t100key-attr4
      TO ls_symsg-msgv4.
    MESSAGE ID ls_symsg-msgid
            TYPE ls_symsg-msgty
            NUMBER ls_symsg-msgno
            INTO lv_dummy
            WITH ls_symsg-msgv1    ls_symsg-msgv2
                 ls_symsg-msgv3    ls_symsg-msgv4.
    CALL METHOD cl_log_ppf=>add_message
      EXPORTING
        ip_problemclass = lv_problemclass
        ip_handle       = io_log_hdl.
  ELSE.
*   regular message (sy-fields have to be filled)
    CHECK NOT sy-msgno IS INITIAL AND
          NOT sy-msgid IS INITIAL.
    CALL METHOD cl_log_ppf=>add_message
      EXPORTING
        ip_problemclass = lv_problemclass
        ip_handle       = io_log_hdl.
  ENDIF.


ENDMETHOD.
ENDCLASS.