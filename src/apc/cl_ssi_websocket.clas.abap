class CL_SSI_WEBSOCKET definition
  public
  final
  create public

  global friends CL_APC_MANAGER .

public section.

  constants CO_SESSION_MODE_INVALID type I value 0 ##NO_TEXT.
  constants CO_SESSION_MODE_STATELESS type I value 1 ##NO_TEXT.
  constants CO_SESSION_MODE_STATEFUL type I value 2 ##NO_TEXT.
  constants CO_STATE_FREE type I value 0 ##NO_TEXT.
  constants CO_STATE_CONNECTING type I value 1 ##NO_TEXT.
  constants CO_STATE_CONNECTED type I value 2 ##NO_TEXT.
  constants CO_STATE_DELETING type I value 3 ##NO_TEXT.
  data SERVER_NAME type SSI_SERVERNAME read-only .
  constants CO_ROLE_CLIENT type I value 0 ##NO_TEXT.
  constants CO_ROLE_SERVER type I value 1 ##NO_TEXT.
  constants CO_ROLE_DETACHED_CLIENT type I value 2 ##NO_TEXT.
  constants CO_CONNECTION_TYPE_WS type I value 1 ##NO_TEXT.
  constants CO_CONNECTION_TYPE_TCP type I value 2 ##NO_TEXT.

  methods READ_TABLE
    returning
      value(TABLE) type SSI_WEBSOCKET_TABLE
    raising
      CX_SSI_INTERNAL
      CX_SSI_NO_AUTH .
  methods CONSTRUCTOR
    importing
      !SERVER_NAME type SSI_SERVERNAME optional .
  methods FORCE_CLOSE
    importing
      !WEBSOCKET_HANDLE type SSI_WEBSOCKET_HANDLE
    raising
      CX_SSI_INTERNAL
      CX_SSI_NO_AUTH
      CX_SSI_BAD_PARAMETER
      CX_SSI_NOT_FOUND .
  methods GET_TECHINFO
    importing
      !WEBSOCKET_HANDLE type SSI_WEBSOCKET_HANDLE
    returning
      value(TECHINFO) type SSI_TECHINFO_TABLE
    raising
      CX_SSI_INTERNAL
      CX_SSI_NO_AUTH
      CX_SSI_BAD_PARAMETER
      CX_SSI_NOT_FOUND .
  methods SWITCH_TRACE
    importing
      !WEBSOCKET_HANDLE type SSI_WEBSOCKET_HANDLE
      !LEVEL type I
    raising
      CX_SSI_INTERNAL
      CX_SSI_NO_AUTH
      CX_SSI_NOT_FOUND
      CX_SSI_NOT_SUPPORTED
      CX_SSI_BAD_PARAMETER .
  class-methods GET_SESSION_POOLING
    importing
      !WEBSOCKET_HANDLE type SSI_WEBSOCKET_HANDLE optional
    returning
      value(POOLING) type ABAP_BOOL
    raising
      CX_SSI_INTERNAL
      CX_SSI_BAD_PARAMETER
      CX_SSI_NOT_FOUND
      CX_SSI_NO_AUTH .
  class-methods SET_SESSION_POOLING
    importing
      !POOLING type ABAP_BOOL default 'X'
      !WEBSOCKET_HANDLE type SSI_WEBSOCKET_HANDLE optional
    raising
      CX_SSI_INTERNAL
      CX_SSI_NOT_FOUND
      CX_SSI_NOT_SUPPORTED
      CX_SSI_BAD_PARAMETER
      CX_SSI_NO_AUTH .
  class-methods SET_SESSION_PRIORITY
    importing
      !PRIORITY type SSI_PRIORITY
      !WEBSOCKET_HANDLE type SSI_WEBSOCKET_HANDLE optional
    raising
      CX_SSI_INTERNAL
      CX_SSI_NOT_FOUND
      CX_SSI_NOT_SUPPORTED
      CX_SSI_BAD_PARAMETER
      CX_SSI_NO_AUTH .
  class-methods CHECK_WEB_SOCKET
    importing
      !WEB_SOCKET type SSI_WEBSOCKET_HANDLE
    returning
      value(WEB_SOCKET_OK) type SSI_BOOL .
protected section.

  class-methods SYSWIDE_HANDLE_TO_HANDLE
    importing
      !I_SYSWIDE_WEBSOCKET_HANDLE type SSI_WEBSOCKET_SYSWIDE_HANDLE
    exporting
      !E_SERVER_NAME type SSI_SERVERNAME
      !E_WEBSOCKET_HANDLE type SSI_WEBSOCKET_HANDLE
    raising
      CX_SSI_BAD_PARAMETER .
  class-methods SET_SESSION_POOLING_I
    importing
      !POOLING type ABAP_BOOL default 'X'
      !WEBSOCKET_HANDLE type SSI_WEBSOCKET_HANDLE optional
    raising
      CX_SSI_INTERNAL
      CX_SSI_NOT_FOUND
      CX_SSI_NOT_SUPPORTED
      CX_SSI_BAD_PARAMETER .
  class-methods SET_SESSION_PRIORITY_I
    importing
      !PRIORITY type SSI_PRIORITY
      !WEBSOCKET_HANDLE type SSI_WEBSOCKET_HANDLE optional
    raising
      CX_SSI_INTERNAL
      CX_SSI_NOT_FOUND
      CX_SSI_NOT_SUPPORTED
      CX_SSI_BAD_PARAMETER .
  class-methods POOL_SESSION .
private section.

  data IS_THIS_SERVER type SSI_BOOL value '1' ##NO_TEXT.

  class-methods _GET_SESSION_POOLING
    importing
      !WEBSOCKET_HANDLE type SSI_WEBSOCKET_HANDLE optional
    returning
      value(POOLING) type SSI_BOOL
    raising
      CX_SSI_INTERNAL .
  methods _READ_TABLE
    exporting
      !RETURN_CODE type I
      !TABLE type SSI_WEBSOCKET_TABLE
    raising
      CX_SSI_INTERNAL .
  methods _READ_TECHINFO
    importing
      !WEBSOCKET_HANDLE type SSI_WEBSOCKET_HANDLE
      !OP_CODE type I
    exporting
      !RETURN_CODE type I
      !TECHINFO type SSI_TECHINFO_TABLE
    raising
      CX_SSI_INTERNAL .
  methods _FORCE_CLOSE
    importing
      !WEBSOCKET_HANDLE type SSI_WEBSOCKET_HANDLE
    exporting
      !RETURN_CODE type I
    raising
      CX_SSI_INTERNAL .
  methods _SWITCH_TRACE
    importing
      !WEBSOCKET_HANDLE type SSI_WEBSOCKET_HANDLE
      !LEVEL type I
    exporting
      !RETURN_CODE type I
    raising
      CX_SSI_INTERNAL .
  class-methods _SET_SESSION_POOLING
    importing
      !POOLING type SSI_BOOL default '1'
      !WEBSOCKET_HANDLE type SSI_WEBSOCKET_HANDLE optional
    exporting
      !RETURN_CODE type I
    raising
      CX_SSI_INTERNAL .
  class-methods _SET_SESSION_PRIORITY
    importing
      !PRIORITY type SSI_PRIORITY
      !WEBSOCKET_HANDLE type SSI_WEBSOCKET_HANDLE optional
    exporting
      !RETURN_CODE type I
    raising
      CX_SSI_INTERNAL .
  class-methods _POOL_SESSION .
ENDCLASS.



CLASS CL_SSI_WEBSOCKET IMPLEMENTATION.


METHOD check_web_socket.
  DATA:
    websocket_table     TYPE ssi_websocket_table,
    websocket_table_row TYPE ssi_websocket_table_row,
    "websocket_table_row_disp TYPE ssi_websocket_table_row_disp,
    lo_websocket        TYPE REF TO cl_ssi_websocket.

  web_socket_ok = '1'.

  TRY.
      "CLEAR websocket_table_row_disp.
      CREATE OBJECT lo_websocket.

      websocket_table = lo_websocket->read_table( ).
      LOOP AT websocket_table INTO websocket_table_row.
        IF web_socket = websocket_table_row-websocket_handle.
          RETURN.
        ENDIF.
      ENDLOOP.
    CATCH cx_ssi_no_auth.
      RETURN.
    CATCH cx_ssi_internal.
      RETURN.
  ENDTRY.
  web_socket_ok = '0'.
ENDMETHOD.


  METHOD constructor.
    IF server_name IS SUPPLIED AND server_name IS NOT INITIAL.
      me->server_name = server_name.
      IF server_name <> cl_abap_syst=>get_instance_name( ).
        me->is_this_server = '0'.
      ENDIF.
    ELSE.
      me->server_name = cl_abap_syst=>get_instance_name( ).
    ENDIF.
  ENDMETHOD.


  METHOD force_close.

    " This method implements a last resort to delete an entry
    " from the WebSocket table using transaction SMWS.
    " This method is NOT part of the WebSocket/APC API.
    " NEVER EVER CALL THIS METHOD FROM YOUR OWN PROGRAM !!!
    " IT COULD HARM YOUR SYSTEM !!!

    DATA: return_code TYPE i.

    " Remote switch not yet supported
    IF is_this_server <> '1'.
      RAISE EXCEPTION TYPE cx_ssi_internal.
    ENDIF.

    " Check authority
    AUTHORITY-CHECK OBJECT 'S_ADMI_FCD'
      ID 'S_ADMI_FCD' FIELD 'PADM'.
    IF sy-subrc <> 0.
      RAISE EXCEPTION TYPE cx_ssi_no_auth.
    ENDIF.
    AUTHORITY-CHECK OBJECT 'S_TCODE'
    ID 'TCD' FIELD 'SMWS'.
    IF sy-subrc <> 0.
      RAISE EXCEPTION TYPE cx_ssi_no_auth.
    ENDIF.

    _force_close( EXPORTING websocket_handle = websocket_handle
                  IMPORTING return_code = return_code ).

    IF return_code EQ 4.
      RAISE EXCEPTION TYPE cx_ssi_not_found
        EXPORTING
          textid = cx_ssi_not_found=>apc_not_found.
    ENDIF.
    IF return_code EQ 6.
      RAISE EXCEPTION TYPE cx_ssi_bad_parameter.
    ENDIF.
    IF return_code <> 0.
      RAISE EXCEPTION TYPE cx_ssi_internal.
    ENDIF.
  ENDMETHOD.


  METHOD get_session_pooling.
    DATA: lv_pooling  TYPE ssi_bool.

    " Check authority
    AUTHORITY-CHECK OBJECT 'S_TCODE'
      ID 'TCD' FIELD 'SMWS'.
    IF sy-subrc <> 0.
      RAISE EXCEPTION TYPE cx_ssi_no_auth.
    ENDIF.

    lv_pooling = _get_session_pooling( websocket_handle = websocket_handle ).
    IF lv_pooling = 1.
      pooling = abap_true.
    ELSE.
      pooling = abap_false.
    ENDIF.
  ENDMETHOD.


  METHOD get_techinfo.
    DATA: return_code TYPE i.

    " Remote switch not yet supported
    IF is_this_server <> '1'.
      RAISE EXCEPTION TYPE cx_ssi_internal.
    ENDIF.

    " Check authority
    AUTHORITY-CHECK OBJECT 'S_TCODE'
      ID 'TCD' FIELD 'SMWS'.
    IF sy-subrc <> 0.
      RAISE EXCEPTION TYPE cx_ssi_no_auth.
    ENDIF.

    _read_techinfo( EXPORTING websocket_handle = websocket_handle
                              op_code = 1 " get full list
                    IMPORTING return_code = return_code
                              techinfo = techinfo ).

    IF return_code EQ 4.
      RAISE EXCEPTION TYPE cx_ssi_not_found
        EXPORTING
          textid = cx_ssi_not_found=>apc_not_found.
    ENDIF.
    IF return_code EQ 6.
      RAISE EXCEPTION TYPE cx_ssi_bad_parameter.
    ENDIF.
    IF return_code <> 0.
      RAISE EXCEPTION TYPE cx_ssi_internal.
    ENDIF.
  ENDMETHOD.


  method POOL_SESSION.
    _pool_session( ).
  endmethod.


  METHOD read_table.
    DATA: return_code TYPE i.

    " Check authority
    AUTHORITY-CHECK OBJECT 'S_TCODE'
      ID 'TCD' FIELD 'SMWS'.
    if sy-subrc <> 0.
      RAISE EXCEPTION TYPE cx_ssi_no_auth.
    endif.

    IF is_this_server = '1'.
      _read_table(
      IMPORTING table = table
                return_code = return_code ).
      IF return_code <> 0.
        RAISE EXCEPTION TYPE cx_ssi_internal.
      ENDIF.
    ELSE.
      CALL FUNCTION 'SSI_MSG_READ_WS_TABLE'
        DESTINATION server_name
        IMPORTING
          table        = table
        EXCEPTIONS
          ssi_no_auth  = 1
          ssi_internal = 2
          others       = 99 ##NUMBER_OK.
      CASE sy-subrc.
        WHEN 0.
          " ok
        WHEN 1.
          RAISE EXCEPTION TYPE cx_ssi_no_auth.
        WHEN 2.
          RAISE EXCEPTION TYPE cx_ssi_internal.
        WHEN OTHERS.
          RAISE EXCEPTION TYPE cx_ssi_internal.
      ENDCASE.
    ENDIF.
  ENDMETHOD.


  METHOD set_session_pooling.
    " Check authority
    AUTHORITY-CHECK OBJECT 'S_ADMI_FCD'
    ID 'S_ADMI_FCD' FIELD 'PADM'.
    IF SY-SUBRC NE 0.
      RAISE EXCEPTION TYPE cx_ssi_no_auth.
    ENDIF.

    set_session_pooling_i( EXPORTING websocket_handle = websocket_handle
                                     pooling = pooling ).
  ENDMETHOD.


  METHOD set_session_pooling_i.
    DATA: return_code TYPE i,
          lv_pooling  TYPE ssi_bool.

    IF pooling = abap_true.
      lv_pooling = 1.
    ELSE.
      lv_pooling = 0.
    ENDIF.

    _set_session_pooling( EXPORTING websocket_handle = websocket_handle
                                    pooling = lv_pooling
                          IMPORTING return_code = return_code ).
    IF return_code EQ 4.
      RAISE EXCEPTION TYPE cx_ssi_not_found
        EXPORTING
          textid = cx_ssi_not_found=>apc_not_found.
    ENDIF.
    IF return_code EQ 5.
      RAISE EXCEPTION TYPE cx_ssi_not_supported.
    ENDIF.
    IF return_code EQ 6.
      RAISE EXCEPTION TYPE cx_ssi_bad_parameter.
    ENDIF.
    IF return_code <> 0.
      RAISE EXCEPTION TYPE cx_ssi_internal.
    ENDIF.
  ENDMETHOD.


  METHOD SET_SESSION_PRIORITY.
    " Check authority
    AUTHORITY-CHECK OBJECT 'S_ADMI_FCD'
    ID 'S_ADMI_FCD' FIELD 'PADM'.
    IF SY-SUBRC NE 0.
      RAISE EXCEPTION TYPE cx_ssi_no_auth.
    ENDIF.

    set_session_priority_i( EXPORTING websocket_handle = websocket_handle
                                      priority = priority ).
  ENDMETHOD.


  METHOD set_session_priority_i.
    DATA: return_code TYPE i.

    _set_session_priority( EXPORTING websocket_handle = websocket_handle
                                     priority = priority
                           IMPORTING return_code = return_code ).
    IF return_code EQ 4.
      RAISE EXCEPTION TYPE cx_ssi_not_found
        EXPORTING
          textid = cx_ssi_not_found=>apc_not_found.
    ENDIF.
    IF return_code EQ 5.
      RAISE EXCEPTION TYPE cx_ssi_not_supported.
    ENDIF.
    IF return_code EQ 6.
      RAISE EXCEPTION TYPE cx_ssi_bad_parameter.
    ENDIF.
    IF return_code <> 0.
      RAISE EXCEPTION TYPE cx_ssi_internal.
    ENDIF.
  ENDMETHOD.


  METHOD switch_trace.
    DATA: return_code TYPE i.

    " Remote switch not yet supported
    IF is_this_server <> '1'.
      RAISE EXCEPTION TYPE cx_ssi_internal.
    ENDIF.

    AUTHORITY-CHECK OBJECT 'S_ADMI_FCD'
    ID 'S_ADMI_FCD' FIELD 'PADM'.
    IF sy-subrc NE 0.
      RAISE EXCEPTION TYPE cx_ssi_no_auth.
    ENDIF.

    _switch_trace( EXPORTING websocket_handle = websocket_handle
                             level = level
                   IMPORTING return_code = return_code ).

    IF return_code EQ 4.
      RAISE EXCEPTION TYPE cx_ssi_not_found
        EXPORTING
          textid = cx_ssi_not_found=>apc_not_found.
    ENDIF.
    IF return_code EQ 5.
      RAISE EXCEPTION TYPE cx_ssi_not_supported.
    ENDIF.
    IF return_code EQ 6.
      RAISE EXCEPTION TYPE cx_ssi_bad_parameter.
    ENDIF.
    IF return_code <> 0.
      RAISE EXCEPTION TYPE cx_ssi_internal.
    ENDIF.
  ENDMETHOD.


  METHOD syswide_handle_to_handle.
    " The input string must have the format '(x,(y/z))'
    " where y and z are positive integers.
    FIND REGEX '\(([^,]+)\,(\([0-9]+/[0-9]+\))\)'           "#EC NOTEXT
       IN i_syswide_websocket_handle IGNORING CASE
       SUBMATCHES e_server_name e_websocket_handle.

    IF sy-subrc <> 0.
      RAISE EXCEPTION TYPE cx_ssi_bad_parameter.
    ENDIF.
  ENDMETHOD.


  method _FORCE_CLOSE by kernel module ThrtWebSocketForceCloseAndDelete fail.
  endmethod.


  method _GET_SESSION_POOLING by kernel module ThrtWebSocketGetSessionPooling ignore.
  endmethod.


  method _POOL_SESSION by kernel module ThrtWebSocketPoolSession ignore.
  endmethod.


  method _READ_TABLE by kernel module ThrtWebSocketReadTable fail.
  endmethod.


  method _READ_TECHINFO by kernel module ThrtWebSocketReadTechInfo fail.
  endmethod.


  method _SET_SESSION_POOLING by kernel module ThrtWebSocketSetSessionPooling ignore.
  endmethod.


  method _SET_SESSION_PRIORITY by kernel module ThrtWebSocketSetPriority fail.
  endmethod.


  method _SWITCH_TRACE by kernel module ThrtWebSocketSwitchTrace fail.
  endmethod.
ENDCLASS.