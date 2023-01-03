class CL_GUI_CONTROL definition
  public
  inheriting from CL_GUI_OBJECT
  create public .

*"* public components of class CL_GUI_CONTROL
*"* do not include other source files here!!!
*"* protected components of class CL_GUI_CONTROL
*"* do not include other source files here!!!
public section.

  constants ADUST_DESIGN_FALSE type I value 0. "#EC NOTEXT
  constants ADUST_DESIGN_TRUE type I value 1. "#EC NOTEXT
  constants ALIGN_AT_BOTTOM type I value 8. "#EC NOTEXT
  constants ALIGN_AT_LEFT type I value 1. "#EC NOTEXT
  constants ALIGN_AT_RIGHT type I value 2. "#EC NOTEXT
  constants ALIGN_AT_TOP type I value 4. "#EC NOTEXT
  constants LIFETIME_DEFAULT type I value 0. "#EC NOTEXT
  constants LIFETIME_DYNPRO type I value 1. "#EC NOTEXT
  constants LIFETIME_IMODE type I value 2. "#EC NOTEXT
  constants METRIC_DEFAULT type I value 0. "#EC NOTEXT
  constants METRIC_MM type I value 2. "#EC NOTEXT
  constants METRIC_PIXEL type I value 1. "#EC NOTEXT
  constants MODE_DESIGN type I value 1. "#EC NOTEXT
  constants MODE_RUN type I value 0. "#EC NOTEXT
  constants PROPERTY_METRIC type I value 410. "#EC NOTEXT
  constants STATE_ALIVE type I value 0. "#EC NOTEXT
  constants STATE_ALIVE_ON_OTHER_SCREEN type I value 1. "#EC NOTEXT
  constants STATE_DEAD type I value -1. "#EC NOTEXT
  constants VISIBLE_FALSE type CHAR1 value '0'. "#EC NOTEXT
  constants VISIBLE_TRUE type CHAR1 value '1'. "#EC NOTEXT
  constants WS_BORDER type I value 8388608. "#EC NOTEXT
  constants WS_CHILD type I value 1073741824. "#EC NOTEXT
  constants WS_CLIPCHILDREN type I value 33554432. "#EC NOTEXT
  constants WS_CLIPSIBLINGS type I value 67108864. "#EC NOTEXT
  constants WS_MAXIMIZEBOX type I value  65536. "#EC NOTEXT
  constants WS_MINIMIZEBOX type I value  131072. "#EC NOTEXT
  constants WS_SYSMENU type I value 524288. "#EC NOTEXT
  constants WS_THICKFRAME type I value  262144. "#EC NOTEXT
  constants WS_VISIBLE type I value 268435456. "#EC NOTEXT
  class-data CUR_EVENT type ref to CL_GUI_EVENT .
  class-data PROPERTY_TABSTOP type I read-only value 240. "#EC NOTEXT
  data LIFETIME type I read-only value cntl_lifetime_imode. "#EC NOTEXT
  data PARENT type ref to CL_GUI_CONTAINER read-only .

  events RIGHT_CLICK .
  events LEFT_CLICK_DESIGN .
  events MOVE_CONTROL .
  events SIZE_CONTROL .
  events LEFT_CLICK_RUN .

  class-methods GET_FOCUS
    exporting
      !CONTROL type ref to CL_GUI_CONTROL
    exceptions
      CNTL_ERROR
      CNTL_SYSTEM_ERROR .
  class-methods SET_FOCUS
    importing
      !CONTROL type ref to CL_GUI_CONTROL
    exceptions
      CNTL_ERROR
      CNTL_SYSTEM_ERROR .
  methods SET_NAME
    importing
      value(NAME) type STRING
    exceptions
      CNTL_ERROR
      PARENT_NO_NAME
      ILLEGAL_NAME .
  methods GET_NAME
    returning
      value(NAME) type STRING .
  methods GET_ENABLE
    exporting
      !ENABLE type C
    exceptions
      CNTL_ERROR .
  methods SET_ENABLE
    importing
      !ENABLE type C
    exceptions
      CNTL_ERROR
      CNTL_SYSTEM_ERROR .
  methods CONSTRUCTOR
    importing
      value(CLSID) type C optional
      value(LIFETIME) type I default lifetime_default
      value(SHELLSTYLE) type I optional
      value(PARENT) type ref to CL_GUI_OBJECT optional
      value(AUTOALIGN) type C default 'x'
      value(LICENSEKEY) type C optional
      value(NAME) type STRING optional
    exceptions
      CNTL_ERROR
      CNTL_SYSTEM_ERROR
      CREATE_ERROR
      LIFETIME_ERROR
      PARENT_IS_SPLITTER .
  methods DISPATCH
    importing
      value(CARGO) type SYUCOMM
      value(EVENTID) type I
      value(IS_SHELLEVENT) type CHAR1
      value(IS_SYSTEMDISPATCH) type CHAR1 optional
    exceptions
      CNTL_ERROR .
  methods FINALIZE .
  methods GET_ADJUST_DESIGN
    exporting
      !ADJUST_DESIGN type I
    exceptions
      CNTL_ERROR
      CNTL_SYSTEM_ERROR .
  methods GET_GRID_HANDLE
    exporting
      !GRID_HANDLE type I
    exceptions
      CNTL_ERROR
      CNTL_SYSTEM_ERROR .
  methods GET_GRID_STEP
    exporting
      !GRID_STEP type I
    exceptions
      CNTL_ERROR
      CNTL_SYSTEM_ERROR .
  methods GET_HEIGHT
    exporting
      !HEIGHT type I
    exceptions
      CNTL_ERROR .
  methods GET_LEFT
    exporting
      !LEFT type I
    exceptions
      CNTL_ERROR .
  methods GET_METRIC
    exporting
      !METRIC type I
    exceptions
      CNTL_ERROR
      CNTL_SYSTEM_ERROR .
  methods GET_MODE
    exporting
      !MODE type I
    exceptions
      CNTL_ERROR
      CNTL_SYSTEM_ERROR .
  methods GET_REGISTERED_EVENTS
    exporting
      !EVENTS type CNTL_SIMPLE_EVENTS
    exceptions
      CNTL_ERROR .
  methods GET_TOP
    exporting
      !TOP type I
    exceptions
      CNTL_ERROR .
  methods GET_VISIBLE
    exporting
      !VISIBLE type C
    exceptions
      CNTL_ERROR
      CNTL_SYSTEM_ERROR .
  methods GET_WIDTH
    exporting
      !WIDTH type I
    exceptions
      CNTL_ERROR .
  methods IS_ALIVE
    returning
      value(STATE) type I .
  methods REG_EVENT_LEFT_CLICK_DESIGN
    importing
      !REGISTER type I default 1
    exceptions
      ERROR_REGIST_EVENT
      ERROR_UNREGIST_EVENT
      CNTL_ERROR
      EVENT_ALREADY_REGISTERED
      EVENT_NOT_REGISTERED .
  methods REG_EVENT_LEFT_CLICK_RUN_MODE
    importing
      !REGISTER type I default 1
    exceptions
      ERROR_REGIST_EVENT
      ERROR_UNREGIST_EVENT
      CNTL_ERROR
      EVENT_ALREADY_REGISTERED
      EVENT_NOT_REGISTERED .
  methods REG_EVENT_MOVE_CONTROL
    importing
      !REGISTER type I default 1
    exceptions
      ERROR_REGIST_EVENT
      ERROR_UNREGIST_EVENT
      CNTL_ERROR
      EVENT_ALREADY_REGISTERED
      EVENT_NOT_REGISTERED .
  methods REG_EVENT_RIGHT_CLICK
    importing
      !REGISTER type I default 1
    exceptions
      ERROR_REGIST_EVENT
      ERROR_UNREGIST_EVENT
      CNTL_ERROR
      EVENT_ALREADY_REGISTERED
      EVENT_NOT_REGISTERED .
  methods REG_EVENT_SIZE_CONTROL
    importing
      !REGISTER type I default 1
    exceptions
      ERROR_REGIST_EVENT
      ERROR_UNREGIST_EVENT
      CNTL_ERROR
      EVENT_ALREADY_REGISTERED
      EVENT_NOT_REGISTERED .
  methods SET_ADJUST_DESIGN
    importing
      value(ADJUST_DESIGN) type I
    exceptions
      CNTL_ERROR
      CNTL_SYSTEM_ERROR .
  methods SET_ALIGNMENT
    importing
      !ALIGNMENT type I
    exceptions
      CNTL_ERROR
      CNTL_SYSTEM_ERROR .
  methods SET_GRID_HANDLE
    importing
      value(GRID_HANDLE) type I
    exceptions
      CNTL_ERROR
      CNTL_SYSTEM_ERROR .
  methods SET_GRID_STEP
    importing
      value(GRID_STEP) type I
    exceptions
      CNTL_ERROR
      CNTL_SYSTEM_ERROR .
  methods SET_HEIGHT
    importing
      !HEIGHT type I
    exceptions
      CNTL_ERROR .
  methods SET_LEFT
    importing
      !LEFT type I
    exceptions
      CNTL_ERROR .
  methods SET_METRIC
    importing
      value(METRIC) type I
    exceptions
      CNTL_ERROR
      CNTL_SYSTEM_ERROR .
  methods SET_MODE
    importing
      value(MODE) type I
    exceptions
      CNTL_ERROR
      CNTL_SYSTEM_ERROR .
  methods SET_POSITION
    importing
      value(HEIGHT) type I optional
      value(LEFT) type I optional
      value(TOP) type I optional
      value(WIDTH) type I optional
    exceptions
      CNTL_ERROR
      CNTL_SYSTEM_ERROR .
  methods SET_REGISTERED_EVENTS
    importing
      !EVENTS type CNTL_SIMPLE_EVENTS
    exceptions
      CNTL_ERROR
      CNTL_SYSTEM_ERROR
      ILLEGAL_EVENT_COMBINATION .
  methods SET_TOP
    importing
      !TOP type I
    exceptions
      CNTL_ERROR .
  methods SET_VISIBLE
    importing
      value(VISIBLE) type C
    exceptions
      CNTL_ERROR
      CNTL_SYSTEM_ERROR .
  methods SET_WIDTH
    importing
      !WIDTH type I
    exceptions
      CNTL_ERROR .
  methods GET_PATH
    returning
      value(PATH) type STRING .
  methods GET_ACCDESCRIPTION
    exporting
      !ACCDESCRIPTION type STRING
    exceptions
      CNTL_ERROR .
  methods SET_ACCDESCRIPTION
    importing
      !ACCDESCRIPTION type STRING
    exceptions
      CNTL_ERROR
      CNTL_SYSTEM_ERROR .

  methods FREE
    redefinition .
protected section.
*"* protected components of class CL_GUI_CONTROL
*"* do not include other source files here!!!

  constants CFALSE type I value 0. "#EC NOTEXT
  constants CTRUE type I value 1. "#EC NOTEXT
  constants EVENT_LEFT_CLICK_DESIGN type I value 1. "#EC NOTEXT
  constants EVENT_LEFT_CLICK_RUN type I value 16. "#EC NOTEXT
  constants EVENT_MOVE type I value 11. "#EC NOTEXT
  constants EVENT_RIGHT_CLICK type I value 2. "#EC NOTEXT
  constants EVENT_SIZE type I value 12. "#EC NOTEXT
  constants PROPERTY_ADJUST_DESIGN type I value 460. "#EC NOTEXT
  constants PROPERTY_ALIGN type I value 10. "#EC NOTEXT
  constants PROPERTY_CAPTION type I value 60. "#EC NOTEXT
  constants PROPERTY_ENABLE type I value 90. "#EC NOTEXT
  constants PROPERTY_GRID_HANDLE type I value 450. "#EC NOTEXT
  constants PROPERTY_GRID_STEP type I value 420. "#EC NOTEXT
  constants PROPERTY_HEIGHT type I value 120. "#EC NOTEXT
  constants PROPERTY_INNER_HEIGHT type I value 500. "#EC NOTEXT
  constants PROPERTY_INNER_WIDTH type I value 510. "#EC NOTEXT
  constants PROPERTY_LEFT type I value 170. "#EC NOTEXT
  constants PROPERTY_MODE type I value 210. "#EC NOTEXT
  constants PROPERTY_NAME type I value 520. "#EC NOTEXT
  constants PROPERTY_TOP type I value 270. "#EC NOTEXT
  constants PROPERTY_VISIBLE type I value 290. "#EC NOTEXT
  constants PROPERTY_WIDTH type I value 300. "#EC NOTEXT
  constants SHELLEVT_CTXMNU_REQ type I value 13. "#EC NOTEXT
  constants SHELLEVT_CTXMNU_SEL type I value 14. "#EC NOTEXT
  constants SHELLEVT_DRAG type I value 16. "#EC NOTEXT
  constants SHELLEVT_DRAGDROP type I value 15. "#EC NOTEXT
  constants SHELLEVT_DROP type I value 17. "#EC NOTEXT
  data CFW_MODE type I value MODE_RUN. "#EC NOTEXT
  data EVENTS_TO_REGISTER_CONTROL type CNTL_SIMPLE_EVENTS .
  data M_METRIC type I value METRIC_DEFAULT. "#EC NOTEXT
  data M_NAME type STRING .
  data REGISTERED_EVENTS type CNTL_EVENTS .
  data REGISTERED_EVENTS_COUNT type I .
  data REGISTERED_SIMPLE_EVENTS type CNTL_SIMPLE_EVENTS .
  data SHELLSTYLE type I .
  constants PROPERTY_ACCDESCRIPTION type I value 540. "#EC NOTEXT

  methods CONTROL_REGISTER_EVENT
    importing
      !EVENT type CNTL_SIMPLE_EVENT
    exceptions
      ERROR_EVENT_CONTROL
      EVENT_ALREADY_REGISTERED .
  methods CONTROL_UNREGISTER_EVENT
    importing
      !EVENT type CNTL_SIMPLE_EVENT
    exceptions
      ERROR_EVENT_CONTROL
      EVENT_NOT_REGISTERED .
  methods GET_EVENT_PARAMETER
    importing
      value(QUEUE_ONLY) type C default 'X'
      value(PARAMETER_ID) type I
    exporting
      !PARAMETER type ANY
    exceptions
      CNTL_ERROR
      CNTL_SYSTEM_ERROR .
  methods GET_REGISTERED_EVENTS_EX
    exporting
      !EVENTTAB type CNTL_EVENTS
    exceptions
      CNTL_ERROR .
  methods GET_WINDOW_PROPERTY
    importing
      value(PROPERTY_ID) type I
      value(QUEUE_ONLY) type C default 'X'
    exporting
      !VALUE type ANY
    exceptions
      CNTL_ERROR
      CNTL_SYSTEM_ERROR .
  methods INIT_CONTROL
    importing
      value(CLSID) type C
      value(LIFETIME) type I default cntl_lifetime_default
      value(SHELLSTYLE) type I optional
      value(PARENT) type ref to CL_GUI_CONTAINER optional
      value(AUTOALIGN) type C default 'x'
      value(LICENSEKEY) type C optional
      value(NAME) type STRING optional
    exceptions
      CNTL_ERROR
      CNTL_SYSTEM_ERROR
      CREATE_ERROR
      LIFETIME_ERROR .
  methods INIT_CONTROL_WITH_HWND
    importing
      value(CLSID) type C
      value(LIFETIME) type I optional
      value(PARENT) type ref to CL_GUI_CONTAINER
      !PARENT_HWND type I
      value(SHELLSTYLE) type I optional
      value(LICENSEKEY) type C optional
      value(NAME) type STRING optional .
  methods REGISTER_CACHED_PROPERTY
    importing
      value(PROPERTY) type C
    exceptions
      PROP_ALREADY_DEFINED
      INVALID_NAME
      ERROR_REGISTER_PROP
      CNTL_ERROR .
  methods REGISTER_CACHED_W_PROPERTY
    importing
      value(PROPERTY_ID) type I
    exceptions
      PROP_ID_ALREADY_DEFINED
      INVALID_ID
      ERROR_REGISTER_PROP_ID
      CNTL_ERROR .
  methods SET_REGISTERED_EVENTS_EX
    importing
      !EVENTTAB type CNTL_EVENTS optional
    exceptions
      CNTL_ERROR
      CNTL_SYSTEM_ERROR
      ILLEGAL_EVENT_COMBINATION .
  methods SET_WINDOW_PROPERTY
    importing
      value(PROPERTY_ID) type I
      !VALUE type ANY
      !KEEP_CACHE type CHAR01 optional
    exceptions
      CNTL_ERROR
      CNTL_SYSTEM_ERROR .
  methods UNREGISTER_CACHED_PROPERTY
    importing
      value(PROPERTY) type C
    exceptions
      PROP_NOT_FOUND
      INVALID_NAME
      ERROR_UNREGISTER_PROP
      CNTL_ERROR .
  methods UNREGISTER_CACHED_W_PROPERTY
    importing
      value(PROPERTY_ID) type I
    exceptions
      PROP_ID_NOT_FOUND
      INVALID_ID
      ERROR_UNREGISTER_PROP_ID
      CNTL_ERROR .
private section.
*"* private components of class CL_GUI_CONTROL
*"* do not include other source files here!!!
ENDCLASS.



CLASS CL_GUI_CONTROL IMPLEMENTATION.


METHOD CONSTRUCTOR.
* CLSID,LIFETIME,SHELLSTYLE, PARENT

* The CL_GUI_OBJECT does NOT call CL_GUI_CFW=>SUBSCRIBE !!
* This has to be done in the SubClass

* This is a syntax dummy
  CALL METHOD SUPER->CONSTRUCTOR
    EXPORTING
      CLSID = SPACE
    exceptions
      create_error = 1
      others       = 2.
  if sy-subrc ne 0.
*   happens if the framework is not initialized properly / batch-mode
*   should not happen, because CLSID is empty
    class cl_gui_cfw definition load.
    message id 'DC' type 'W' number cl_gui_cfw=>reason_no_init
      raising create_error.
  endif.

* ShellStyle-Default
  data: temp_shellstyle like shellstyle.
  TEMP_SHELLSTYLE = shellstyle.
  if temp_shellstyle is initial.
    temp_shellstyle = ws_visible
                    + ws_child
                    + WS_CLIPSIBLINGS.
  endif.
  IF CLSID IS INITIAL.
*   Create 'empty' object
    EXIT.
  ELSE.
*  now a real control should be created, check if framework runs
    if is_init is initial.
      message id 'DC' type 'W' number cl_gui_cfw=>reason_no_init
        raising create_error.
    endif.

    DATA temp type ref to cl_gui_container.
    temp ?= parent.

    if not temp is initial.
      if temp->get_container_type( ) =
           cl_gui_container=>CONTAINER_TYPE_SPLITTER
           or
         temp->get_container_type( ) =
                   cl_gui_container=>CONTAINER_TYPE_EASY_SPLITTER and
                   clsid ne 'SAPGUI.SplitterCtrl.1' and
                   clsid ne 'com.sap.platin.cet.GuiSplitterShell'.
        raise parent_is_splitter.
      endif.
    endif.

    CALL METHOD ME->INIT_CONTROL
     EXPORTING
       CLSID      = CLSID
       SHELLSTYLE = temp_SHELLSTYLE
       LIFETIME   = LIFETIME
       PARENT     = TEMP
       LICENSEKEY = LICENSEKEY
       autoalign = autoalign
     EXCEPTIONS
       CNTL_ERROR        = 1
       CNTL_SYSTEM_ERROR = 2
       CREATE_ERROR      = 3
       LIFETIME_ERROR    = 4
       OTHERS            = 5.
    CASE SY-SUBRC.
      WHEN 0.
      WHEN 1. RAISE CNTL_ERROR.
      WHEN 2. RAISE CNTL_SYSTEM_ERROR.
      WHEN 3.
        message id 'DC' type 'W' number cl_gui_cfw=>reason_no_init
          raising create_error.
      WHEN 4. RAISE LIFETIME_ERROR.
      WHEN OTHERS.
        RAISE CNTL_ERROR.
    ENDCASE.
* Register control in any case !!!!
    CALL METHOD CL_GUI_CFW=>SUBSCRIBE
                    EXPORTING
                        SHELLID = H_CONTROL-SHELLID
                        REF = ME
                    EXCEPTIONS OTHERS = 1.
    IF SY-SUBRC NE 0.
       RAISE create_ERROR.
    ENDIF.
  ENDIF.
ENDMETHOD.


method CONTROL_REGISTER_EVENT.

* define work area
  data: wa_event type CNTL_SIMPLE_EVENT.

* check whether event is already registered
  READ TABLE REGISTERED_SIMPLE_EVENTS
     WITH KEY TABLE_LINE = EVENT
     into wa_event.

  if sy-subrc = 0.
* event is already registered
    RAISE EVENT_ALREADY_REGISTERED.

  else.
* event is not yet registered

*   actualize EVENTS_TO_REGISTER
    move REGISTERED_SIMPLE_EVENTS to EVENTS_TO_REGISTER_CONTROL.

*   fill work area
    wa_event = event.

*   append work area to table of registered events
    append wa_event to EVENTS_TO_REGISTER_CONTROL.

*   init registration of event by control framework
    call method SET_REGISTERED_EVENTS
         exporting EVENTS = EVENTS_TO_REGISTER_CONTROL.
    IF SY-SUBRC <> 0.
      RAISE ERROR_EVENT_CONTROL.
    ENDIF.

  endif.
endmethod.


method CONTROL_UNREGISTER_EVENT.
* define work area
  data: wa_event type CNTL_SIMPLE_EVENT,
        event_tabix type sy-tabix.

  clear event_tabix.

* actualize EVENTS_TO_REGISTER
  move REGISTERED_SIMPLE_EVENTS to EVENTS_TO_REGISTER_CONTROL.

  loop at events_to_register_CONTROL into wa_event.
    if wa_event-eventid = event-eventid.
      event_tabix = sy-tabix.
    endif.
  endloop.

  if not event_tabix is initial.
* registered event with event_id was found

*   delete event
    delete events_to_register_CONTROL index event_tabix.

*   update registration of event by control framework
    CALL METHOD SET_REGISTERED_EVENTS
         EXPORTING EVENTS = EVENTS_TO_REGISTER_CONTROL.
    IF SY-SUBRC <> 0.
      RAISE ERROR_EVENT_CONTROL.
    ENDIF.

  else.
* event was not registered
   raise event_not_registered.

  endif.
endmethod.


METHOD DISPATCH.

* This method must be REDEFINED
* This method gets called by via CL_GUI_CFW=>DISPATCH
* TODO: Raise ABAP-EVENT here, if necessary
* TODO: check if system-event or 'normal' event
*       REGISTERED_EVENTS[]-is_systemevent

    case eventid.
        when EVENT_LEFT_CLICK_DESIGN.
            raise event LEFT_CLICK_DESIGN.
        when EVENT_LEFT_CLICK_RUN.
            raise event LEFT_CLICK_RUN.
        when event_right_click.
            raise event right_click.
        when EVENT_MOVE.
            raise event Move_Control.
        when EVENT_SIZE.
            raise event Size_Control.
    endcase.
ENDMETHOD.


METHOD FINALIZE.

* ...
* Called by 'FREE' or by 'END_OF_IMODE_NOTIFICATION
* must be redefined

ENDMETHOD.


METHOD FREE.

* ...
  CALL METHOD ME->FINALIZE.

* TODO: Must call control_detroy (method of H_GUI)
  IF H_CONTROL IS INITIAL.
    RAISE CNTL_ERROR.
  ENDIF.

* Unsubscribe Anyway
  CLASS CL_GUI_CFW DEFINITION LOAD.
  CALL METHOD CL_GUI_CFW=>UNSUBSCRIBE
    EXPORTING
      REF = ME.
* Call also in CL_GUI_OBJECT
  call method cl_gui_cfw=>unregister_cached_control
       exporting control = me.

* be careful with lifetime-Management
*   OBJECT WAS CREATED AS CONTROL
*   CALL METHOD OF H_GUI 'DestroyWindow' = THIS_DUMMY_VALUE
  IF not H_CONTROL-OBJ-HANDLE IS INITIAL.
    CALL METHOD OF H_GUI 'DestroyWindow'
      NO FLUSH
      EXPORTING #1 = H_CONTROL-SHELLID.
    CASE SY-SUBRC.
      WHEN 1.
        RAISE CNTL_SYSTEM_ERROR.
      WHEN 2.
        RAISE CNTL_ERROR.
    ENDCASE.

    FREE OBJECT H_CONTROL-OBJ NO FLUSH.

    CASE SY-SUBRC.
      WHEN 1.
        RAISE CNTL_SYSTEM_ERROR.
      WHEN 2.
        RAISE CNTL_ERROR.
    ENDCASE.
  endif.
DATA temp type ref to cl_gui_container.

temp ?= parent.

   CALL METHOD LCL_FRIEND_OF_GUI_CONTAINER=>LCL_REMOVE_CHILD
           EXPORTING PARENT = temp
                    CHILD = ME.

  CALL METHOD CL_GUI_CFW=>UNREGISTER_LIFETIME
              EXPORTING REF = ME.

* Clear the handle
  CLEAR H_CONTROL.
ENDMETHOD.


method GET_ACCDESCRIPTION.
* ...
* check handle
  IF ME->H_CONTROL IS INITIAL.
    RAISE CNTL_ERROR.
  ENDIF.

  CALL METHOD GET_WINDOW_PROPERTY
       EXPORTING
            PROPERTY_ID    = CL_GUI_CONTROL=>PROPERTY_ACCDESCRIPTION
            queue_only = Space
       importing
            VALUE     = ACCDESCRIPTION
       EXCEPTIONS
         OTHERS = 1.
  IF SY-SUBRC <> 0.
      RAISE CNTL_ERROR.
  ENDIF.

endmethod.


method GET_ADJUST_DESIGN.
* check handle
  IF ME->H_CONTROL IS INITIAL.
    RAISE CNTL_ERROR.
  ENDIF.
  CALL METHOD GET_WINDOW_PROPERTY
       EXPORTING
            PROPERTY_ID    = CL_GUI_CONTROL=>PROPERTY_ADJUST_DESIGN
            queue_only = Space
       importing
            VALUE     = ADJUST_DESIGN
       EXCEPTIONS
         OTHERS = 1.
  IF SY-SUBRC <> 0.
      RAISE CNTL_ERROR.
  ENDIF.
endmethod.


method GET_ENABLE.
* ...
* check handle
  IF ME->H_CONTROL IS INITIAL.
    RAISE CNTL_ERROR.
  ENDIF.

  CALL METHOD GET_WINDOW_PROPERTY
       EXPORTING
            PROPERTY_ID    = CL_GUI_CONTROL=>PROPERTY_ENABLE
            queue_only = Space
       importing
            VALUE     = ENABLE
       EXCEPTIONS
         OTHERS = 1.
  IF SY-SUBRC <> 0.
      RAISE CNTL_ERROR.
  ENDIF.

endmethod.


METHOD GET_EVENT_PARAMETER.

  DATA : PARAMVAL TYPE STRING.
  data l_event type ref to cl_gui_event.
* (PARAMETER_ID, QUEUE_ONLY; PARAMETER)
* check handle
  IF H_CONTROL IS INITIAL.
    RAISE CNTL_ERROR.
  ENDIF.
  IF XML_BLOB_SUPPORT EQ 'X'.
    call method cl_gui_cfw=>get_current_event_object
         receiving event_object = l_event.
    if not l_event is initial.
      CALL METHOD l_EVENT->GET_EVENT_PARAM
                                  EXPORTING
                                         PID = PARAMETER_ID
                                  IMPORTING
                                         VALUE = PARAMVAL.
      PARAMETER = PARAMVAL.
    endif.
  ELSE.
    IF QUEUE_ONLY IS INITIAL.
* PARAMETER will be transported to application
      CALL METHOD OF H_GUI 'GetEventParam' = PARAMETER
        NO FLUSH
        EXPORTING #1 = H_CONTROL-SHELLID
                  #2 = PARAMETER_ID.
    ELSE.
* PARAMETER will NOT be transported to application
      CALL METHOD OF H_GUI 'GetEventParam' = PARAMETER
        NO FLUSH
        QUEUEONLY
        EXPORTING #1 = H_CONTROL-SHELLID
                  #2 = PARAMETER_ID.
    ENDIF.
  ENDIF.

  CASE SY-SUBRC.
    WHEN 0.                            "// ok
    WHEN 1.                            "// system_error
      RAISE CNTL_SYSTEM_ERROR.
    WHEN 2.                            "// method_call_error
      RAISE CNTL_ERROR.
    WHEN 3.                            "// property_set_error
      RAISE CNTL_ERROR.
    WHEN 4.                            "// property_get_error
      RAISE CNTL_ERROR.
    WHEN OTHERS.
  ENDCASE.

ENDMETHOD.


METHOD GET_FOCUS.

* (CONTROL)
* This needs a FLUSH !!
* FIXME: Automation rausnehmen!
  DATA: SHELLID TYPE I.
  DATA: CONTROL_FOCUS_SUPPORTED TYPE I.
  DATA: L_STR TYPE STRING.

  CLASS CL_GUI_CFW DEFINITION LOAD.

* check supportbit
  CALL 'C_GUI_SUPPORT'
    ID 'FEATURE' FIELD 'CONTROL_FOCUS'
    ID 'VALUE' FIELD CONTROL_FOCUS_SUPPORTED.

  IF CONTROL_FOCUS_SUPPORTED = 1 AND CATT_ACTIV IS INITIAL.

    CALL 'DY_GET_FOCUS_CONTROL'
         ID 'FOCUS_OBJECT' FIELD L_STR.

    IF SY-SUBRC NE 0.
*     FIXME: andere Exception?
      RAISE CNTL_ERROR.
    ENDIF.

    IF L_STR CO '0123456789'.
      SHELLID = L_STR.
    ELSE.
      RAISE CNTL_ERROR.
    ENDIF.

  ELSE.

    CALL METHOD OF H_GUI 'GetFocus' = SHELLID.

    CASE SY-SUBRC.
      WHEN 0.
      WHEN 1.                          "// system_error
        RAISE CNTL_SYSTEM_ERROR.
      WHEN 2.                          "// method_call_error
        RAISE CNTL_ERROR.
      WHEN 3.                          "// property_set_error
        RAISE CNTL_ERROR.
      WHEN 4.                          "// property_get_error
        RAISE CNTL_ERROR.
      WHEN OTHERS.
        RAISE CNTL_ERROR.
    ENDCASE.

  ENDIF.

* Find the corresponding object

* look at subscriberlist / dispatch (CL_GUI_CFW)
  CLASS CL_GUI_CFW DEFINITION LOAD.
  CALL METHOD CL_GUI_CFW=>GET_SUBSCRIBER_BY_ID
    EXPORTING
      SHELLID = SHELLID
    IMPORTING
      SUBSCRIBER = CONTROL
    exceptions
      cntl_error = 1
      others = 2.

  IF SY-SUBRC <> 0.
    RAISE CNTL_ERROR.                  "// Control not found
  ENDIF.
ENDMETHOD.


method GET_GRID_HANDLE.
* check handle
  IF ME->H_CONTROL IS INITIAL.
    RAISE CNTL_ERROR.
  ENDIF.
  CALL METHOD GET_WINDOW_PROPERTY
       EXPORTING
            PROPERTY_ID    = CL_GUI_CONTROL=>PROPERTY_GRID_HANDLE
            queue_only = Space
       importing
            VALUE     = GRID_HANDLE
       EXCEPTIONS
         OTHERS = 1.
  IF SY-SUBRC <> 0.
      RAISE CNTL_ERROR.
  ENDIF.
endmethod.


method GET_GRID_STEP.
* check handle
  IF ME->H_CONTROL IS INITIAL.
    RAISE CNTL_ERROR.
  ENDIF.
  CALL METHOD GET_WINDOW_PROPERTY
       EXPORTING
            PROPERTY_ID    = CL_GUI_CONTROL=>PROPERTY_GRID_STEP
            queue_only = Space
       importing
            VALUE     = GRID_STEP
       EXCEPTIONS
         OTHERS = 1.
  IF SY-SUBRC <> 0.
      RAISE CNTL_ERROR.
  ENDIF.
endmethod.


METHOD GET_HEIGHT.

* check handle
  IF ME->H_CONTROL IS INITIAL.
    RAISE CNTL_ERROR.
  ENDIF.
  CALL METHOD GET_WINDOW_PROPERTY
       EXPORTING
            PROPERTY_ID    = CL_GUI_CONTROL=>PROPERTY_HEIGHT
            queue_only = Space
       importing
            VALUE     = HEIGHT
       EXCEPTIONS
         OTHERS = 1.
  IF SY-SUBRC <> 0.
      RAISE CNTL_ERROR.
  ENDIF.
ENDMETHOD.


method GET_LEFT.
* check handle
  IF ME->H_CONTROL IS INITIAL.
    RAISE CNTL_ERROR.
  ENDIF.
  CALL METHOD GET_WINDOW_PROPERTY
       EXPORTING
            PROPERTY_ID    = CL_GUI_CONTROL=>PROPERTY_LEFT
            queue_only = Space
       importing
            VALUE     = Left
       EXCEPTIONS
         OTHERS = 1.
  IF SY-SUBRC <> 0.
      RAISE CNTL_ERROR.
  ENDIF.
endmethod.


method GET_METRIC.
* check handle
  IF ME->H_CONTROL IS INITIAL.
    RAISE CNTL_ERROR.
  ENDIF.
  metric = m_metric.
*  CALL METHOD GET_WINDOW_PROPERTY
*       EXPORTING
*            PROPERTY_ID    = CL_GUI_CONTROL=>PROPERTY_METRIC
*            queue_only = Space
*       importing
*            VALUE     = METRIC
*       EXCEPTIONS
*         OTHERS = 1.
*  IF SY-SUBRC <> 0.
*      RAISE CNTL_ERROR.
*  ENDIF.
endmethod.


method GET_MODE.
* check handle
  IF ME->H_CONTROL IS INITIAL.
    RAISE CNTL_ERROR.
  ENDIF.
  mode = cfw_mode.
*  CALL METHOD GET_WINDOW_PROPERTY
*       EXPORTING
*            PROPERTY_ID    = CL_GUI_CONTROL=>PROPERTY_MODE
*            queue_only = Space
*       importing
*            VALUE     = MODE
*       EXCEPTIONS
*         OTHERS = 1.
*  IF SY-SUBRC <> 0.
*      RAISE CNTL_ERROR.
*  ENDIF.
endmethod.


method GET_NAME.
  name = m_name.
endmethod.


method GET_PATH.
  data l_cont type ref to cl_gui_container.
  data l_str type string.

  path = m_name.
  if m_name is initial.
    exit.
  endif.
  l_cont = parent.

  do.
    if l_cont is initial.
      exit.
    endif.
    l_str = l_cont->get_name( ).
    if l_str is initial.
      exit.
    endif.
    concatenate l_str '/' path into path.
    l_cont = l_cont->parent.
  enddo.

endmethod.


METHOD GET_REGISTERED_EVENTS.

* EVENTS Type CNTL_SIMPLE_EVENTS

* check handle
  IF H_CONTROL IS INITIAL.
    RAISE CNTL_ERROR.
  ENDIF.

  EVENTS[] = REGISTERED_SIMPLE_EVENTS[].

ENDMETHOD.


METHOD GET_REGISTERED_EVENTS_EX .

* (-> EventTab)

* check handle
  IF H_CONTROL IS INITIAL.
    RAISE CNTL_ERROR.
  ENDIF.

* get a copy
  EVENTTAB[] = REGISTERED_EVENTS[].
ENDMETHOD.


method GET_TOP.
* check handle
  IF ME->H_CONTROL IS INITIAL.
    RAISE CNTL_ERROR.
  ENDIF.
  CALL METHOD GET_WINDOW_PROPERTY
       EXPORTING
            PROPERTY_ID    = CL_GUI_CONTROL=>PROPERTY_TOP
            queue_only = Space
       importing
            VALUE     = Top
       EXCEPTIONS
         OTHERS = 1.
  IF SY-SUBRC <> 0.
      RAISE CNTL_ERROR.
  ENDIF.
endmethod.


method GET_VISIBLE.
* check handle
  IF ME->H_CONTROL IS INITIAL.
    RAISE CNTL_ERROR.
  ENDIF.
  CALL METHOD GET_WINDOW_PROPERTY
       EXPORTING
            PROPERTY_ID    = CL_GUI_CONTROL=>PROPERTY_VISIBLE
            queue_only = Space
       importing
            VALUE     = VISIBLE
       EXCEPTIONS
         OTHERS = 1.
  IF SY-SUBRC <> 0.
      RAISE CNTL_ERROR.
  ENDIF.
endmethod.


METHOD GET_WIDTH.

* check handle
  IF ME->H_CONTROL IS INITIAL.
    RAISE CNTL_ERROR.
  ENDIF.
  CALL METHOD GET_WINDOW_PROPERTY
       EXPORTING
            PROPERTY_ID    = CL_GUI_CONTROL=>PROPERTY_WIDTH
            queue_only = Space
       importing
            VALUE     = WIDTH
       EXCEPTIONS
         OTHERS = 1.
  IF SY-SUBRC <> 0.
      RAISE CNTL_ERROR.
  ENDIF.
ENDMETHOD.


METHOD GET_WINDOW_PROPERTY.

* (PROPERTY_ID, QUEUE_ONLY; VALUE)

  DATA: QUEUE_EMPTY TYPE CHAR01,
        l_c(8) type c,
        l_STRPROPNAME TYPE STRING,
        l_STRVALUE TYPE STRING.

  class cl_gui_cfw definition load.

* check handle
  IF H_CONTROL IS INITIAL.
    RAISE CNTL_ERROR.
  ENDIF.

* FIXME: Umstellung in GET_PROPERTY nachziehen
* check for cached property access
  IF  PROP_CACHE_SUPPORTED = 'X' AND
    QUEUE_ONLY IS INITIAL.
    if not is_cache_valid( ) is initial.
*    if sy-uname ne 'KSCHMIDT2'.
*    CALL FUNCTION 'AC_IS_QUEUE_EMPTY'
*         CHANGING
*              IS_QUEUE_EMPTY = QUEUE_EMPTY.
*    else.
*      QUEUE_EMPTY = cl_gui_cfw=>is_cache_valid( control = me ).
*    endif.
*    IF QUEUE_EMPTY = 'X'.
* In case of exit commands the data change propagation
* has not proccess data until now. In all other cases
* this call has no effect.

      perform handle_diag_input_data in program SAPFGUICNTL.

      unpack property_id to l_c.
      if l_c co '0'.
        l_STRPROPNAME = '0'.
      else.
        l_STRPROPNAME = l_c+sy-fdpos(*).
      endif.
      CALL METHOD GET_CACHE_PROP EXPORTING
                                    PROPNAME = l_STRPROPNAME
                                          IMPORTING
                                    PROPVALUE = l_STRVALUE
                                          EXCEPTIONS
                                    OTHERS = 1.
      IF SY-SUBRC = 0.
        VALUE = l_STRVALUE.
        EXIT.
      ENDIF.
    ENDIF.
  ENDIF.


* get property
  IF QUEUE_ONLY IS INITIAL.
*   result will be transported to application server
    CALL METHOD OF H_GUI 'GetProperty' = VALUE
      NO FLUSH
      EXPORTING #1 = H_CONTROL-SHELLID
                #2 = PROPERTY_ID.
  ELSE.
*   result will NOT be transported to application server
    CALL METHOD OF H_GUI 'GetProperty' = VALUE
      NO FLUSH
      QUEUEONLY
      EXPORTING #1 = H_CONTROL-SHELLID
                #2 = PROPERTY_ID.
  ENDIF.

  CASE SY-SUBRC.
    WHEN 0.
    WHEN 1.                            "// system_error
      RAISE CNTL_SYSTEM_ERROR.
    WHEN 2.                            "// method_call_error
      RAISE CNTL_ERROR.
    WHEN 3.                            "// property_set_error
      RAISE CNTL_ERROR.
    WHEN 4.                            "// property_get_error
      RAISE CNTL_ERROR.
    WHEN OTHERS.
      RAISE CNTL_ERROR.
  ENDCASE.

ENDMETHOD.


METHOD INIT_CONTROL.

* ...
* TODO: CLSID-Check (Freigabe-Status)

  data l_mode type i.

  CLASS CL_GUI_CFW DEFINITION LOAD.
* ShellId
  CALL FUNCTION 'CNTH_GET_NEW_SHELLID'
       IMPORTING
            NEW_SHELLID = H_CONTROL-SHELLID.
* Imode
  SYSTEM-CALL INTERNAL MODE INTO h_control-imode.
* Update CNTL_LIST
  CALL FUNCTION 'CNTH_APPEND_HANDLE'
       EXPORTING
            H_CONTROL = H_CONTROL.

  DATA: CASTED_PARENT TYPE REF TO CL_GUI_CONTROL.
  DATA: PARENTID TYPE I.

  IF LIFETIME > CNTL_LIFETIME_IMODE.
    RAISE LIFETIME_ERROR.
  ENDIF.

  IF NOT PARENT IS INITIAL.
*--- Local class lcl_friend_of_gui_container is used to call protected
*    method add_child in container "parent" as friend
    CALL METHOD LCL_FRIEND_OF_GUI_CONTAINER=>LCL_ADD_CHILD
        EXPORTING PARENT = PARENT
             NEW_CHILD = ME.
    ME->PARENT = PARENT.
    CASTED_PARENT = PARENT.
    PARENTID = CASTED_PARENT->H_CONTROL-SHELLID.
* Lifetime
    CASE LIFETIME.
      WHEN CNTL_LIFETIME_DEFAULT.
        ME->LIFETIME = PARENT->LIFETIME.
      WHEN OTHERS.
        IF PARENT->LIFETIME < LIFETIME.
          RAISE LIFETIME_ERROR.
        ENDIF.
        ME->LIFETIME = LIFETIME.
    ENDCASE.
  ELSE.
    CASE LIFETIME.
      WHEN CNTL_LIFETIME_DEFAULT.
        ME->LIFETIME = CNTL_LIFETIME_IMODE.
      WHEN OTHERS.
        ME->LIFETIME = LIFETIME.
    ENDCASE.
    PARENTID = CL_GUI_CFW=>DYNPRO_DEFAULT.
  ENDIF.

* ParentId
  IF PARENTID = CL_GUI_CFW=>DYNPRO_DEFAULT.
    CALL FUNCTION 'GUI_GET_PARENT_DYNPRO'
         IMPORTING
              PARENT = H_CONTROL-PARENTID
         EXCEPTIONS
              ERROR  = 1
              OTHERS = 2.
    IF SY-SUBRC <> 0.
*    RAISE INVALID_PARENTID.
    ENDIF.
  ELSE.
    H_CONTROL-PARENTID    = PARENTID.
  ENDIF.

* Name nur, wenn Parent Namen hat
  If not name is initial.
    if parentid <= cl_gui_cfw=>dynpro_9 or
       name cn 'ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789_'.
      raise cntl_error.
    endif.
    m_name = name.
  endif.


* Complete handle
  ADD 1 TO GLOBAL_GUID.
  H_CONTROL-CLSID       = CLSID.
  H_CONTROL-ORIGIN      = 'CFW_OO'.
  H_CONTROL-HANDLE_TYPE = CNTL_TYPE_OCX.
  H_CONTROL-GUID = GLOBAL_GUID.
* ShellStyle-Default
  data: temp_shellstyle like shellstyle.
  TEMP_SHELLSTYLE = shellstyle.
  if temp_shellstyle is initial.
    temp_shellstyle = ws_visible
                    + ws_child
                    + WS_CLIPSIBLINGS.
  endif.

* Check Control
*  CALL FUNCTION 'CHECK_CONTROL'
*       EXPORTING
*            PROG_ID = CLSID.

* Create Now!
  IF LICENSEKEY IS INITIAL.
    CALL METHOD OF H_GUI 'CreateControl' = H_CONTROL-OBJ NO FLUSH
      EXPORTING #1 = H_CONTROL-SHELLID
                #2 = CLSID
                #3 = temp_shellstyle
                #4 = H_CONTROL-PARENTID.
  ELSE.
    CALL METHOD OF H_GUI 'CreateControlWithLicenseKey' = H_CONTROL-OBJ
    NO FLUSH
    EXPORTING #1 = H_CONTROL-SHELLID
              #2 = CLSID
              #3 = temp_shellstyle
              #4 = H_CONTROL-PARENTID
              #5 = LICENSEKEY.
  ENDIF.

  IF SY-SUBRC <> 0.
*   RAISE CNTL_ERROR.
    RAISE CREATE_ERROR.
  ENDIF.

  CALL METHOD CL_GUI_CFW=>REGISTER_LIFETIME
     EXPORTING
       REF            = ME.

* check parent
  IF NOT PARENT IS INITIAL.
    call method parent->get_mode
         importing mode = l_mode
         exceptions others = 1.

    if l_mode = mode_design and
       ( parent->get_container_type( ) =
              cl_gui_container=>container_type_simple or
         parent->get_container_type( ) =
              cl_gui_container=>container_type_easy_splitter ).
      call method me->set_mode
           exporting mode = mode_design
        exceptions others = 1.
    elseif not autoalign is initial.
      call method set_alignment( 15 ).
    endif.
  ENDIF.


*  if not autoalign is initial.
*    call method set_alignment( 15 ).
*  endif.

  If not m_name is initial.
    call method set_window_property
         exporting property_id = property_name
                   value       = m_name
                   keep_cache  = 'X'
         exceptions others = 1.
    if sy-subrc ne 0.
      clear m_name.
    endif.
  endif.

  me->m_clsid = clsid.
  me->shellstyle = temp_shellstyle.


* Aufnahme in Tabchain passiert defaultmässig auf C-Seite
*  call method set_window_property exporting
*       property_id = CL_GUI_CONTROL=>PROPERTY_TABSTOP
*       VALUE = 1.
*
ENDMETHOD.


METHOD INIT_CONTROL_WITH_HWND.


  DATA: L_PROGRAM TYPE SYST-REPID,
        L_DYNNR TYPE SYST-DYNNR,
        L_STACKPOS TYPE I.

  CLASS CL_GUI_CFW DEFINITION LOAD.
* ShellId
  CALL FUNCTION 'CNTH_GET_NEW_SHELLID'
       IMPORTING
            NEW_SHELLID = H_CONTROL-SHELLID.
* Imode
  SYSTEM-CALL INTERNAL MODE INTO h_control-imode.
* Update CNTL_LIST
  CALL FUNCTION 'CNTH_APPEND_HANDLE'
       EXPORTING
            H_CONTROL = H_CONTROL.

  DATA L_LIFETIME TYPE I.
  DATA: CASTED_PARENT TYPE REF TO CL_GUI_CONTROL.
  DATA: PARENTID TYPE I.

  IF NOT PARENT IS INITIAL.
*--- Local class lcl_friend_of_gui_container is used to call protected
*    method add_child in container "parent" as friend
    CALL METHOD LCL_FRIEND_OF_GUI_CONTAINER=>LCL_ADD_CHILD
         EXPORTING PARENT = PARENT
              NEW_CHILD = ME.
    ME->PARENT = PARENT.
    CASTED_PARENT = PARENT.
    PARENTID = CASTED_PARENT->H_CONTROL-SHELLID.
* Lifetime
    CASE LIFETIME.
      WHEN CNTL_LIFETIME_DEFAULT.
        ME->LIFETIME = PARENT->LIFETIME.
      WHEN OTHERS.
        ME->LIFETIME = LIFETIME.
    ENDCASE.
  ELSE.
    CASE LIFETIME.
      WHEN CNTL_LIFETIME_DEFAULT.
        ME->LIFETIME = CNTL_LIFETIME_IMODE.
      WHEN OTHERS.
        ME->LIFETIME = LIFETIME.
    ENDCASE.
    PARENTID = CL_GUI_CFW=>DYNPRO_DEFAULT.
  ENDIF.

* ParentId
  IF PARENTID = CL_GUI_CFW=>DYNPRO_DEFAULT.
    CALL FUNCTION 'GUI_GET_PARENT_DYNPRO'
         IMPORTING
              PARENT = H_CONTROL-PARENTID
         EXCEPTIONS
              ERROR  = 1
              OTHERS = 2.
    IF SY-SUBRC <> 0.
*    RAISE INVALID_PARENTID.
    ENDIF.
  ELSE.
    H_CONTROL-PARENTID    = PARENTID.
  ENDIF.

* Name nur, wenn Parent Namen hat
  If not name is initial and parentid > cl_gui_cfw=>dynpro_9 and
     name co 'ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789_'.
    m_name = name.
  endif.

* Complete handle
  ADD 1 TO GLOBAL_GUID.
  H_CONTROL-CLSID       = CLSID.
  H_CONTROL-ORIGIN      = 'CFW_OO'.
  H_CONTROL-HANDLE_TYPE = CNTL_TYPE_OCX.
  H_CONTROL-GUID = GLOBAL_GUID.
* ShellStyle-Default
  data: temp_shellstyle like shellstyle.
  TEMP_SHELLSTYLE = shellstyle.
  if temp_shellstyle is initial.
    temp_shellstyle = ws_visible
                    + ws_child
                    + WS_CLIPSIBLINGS.
  endif.

* Check Control
*  CALL FUNCTION 'CHECK_CONTROL'
*       EXPORTING
*            PROG_ID = CLSID.

* Create Now!
  IF LICENSEKEY IS INITIAL.
    CALL METHOD OF H_GUI 'CreateControl2' = H_CONTROL-OBJ NO FLUSH
        EXPORTING #1 = H_CONTROL-SHELLID
                  #2 = CLSID
                  #3 = temp_shellstyle
                  #4 = PARENT_HWND.
  ELSE.
    CALL METHOD OF H_GUI 'CreateControl2WithLicensKey' = H_CONTROL-OBJ
        NO FLUSH
        EXPORTING #1 = H_CONTROL-SHELLID
                  #2 = CLSID
                  #3 = temp_shellstyle
                  #4 = PARENT_HWND
                  #5 = LICENSEKEY.
  ENDIF.

  IF SY-SUBRC <> 0.
*   RAISE CNTL_ERROR.
*    raise create_error.
  ENDIF.

  ME->PARENT = PARENT.

  If not m_name is initial.
    call method set_window_property
         exporting property_id = property_name
                   value       = m_name
                   keep_cache  = 'X'
         exceptions others = 1.
    if sy-subrc ne 0.
      clear m_name.
    endif.
  endif.

  CALL METHOD CL_GUI_CFW=>REGISTER_LIFETIME
     EXPORTING
       REF            = ME.

ENDMETHOD.


METHOD IS_ALIVE.

* state

  CALL METHOD CL_GUI_CFW=>IS_ALIVE EXPORTING REF    = ME
                                   RECEIVING STATE  = STATE.

ENDMETHOD.


METHOD REGISTER_CACHED_PROPERTY .
  DATA : STRPROPNAME TYPE STRING.

  IF PROP_CACHE_SUPPORTED = 'X'.
    STRPROPNAME = PROPERTY.
    CALL METHOD ADD_CACHE_PROP EXPORTING
                                  PROPNAME = STRPROPNAME
                               EXCEPTIONS
                                  INVALID_NAME = 1
                                  PROP_ALREADY_DEFINED = 2
                                  OTHERS = 3.
    IF SY-SUBRC NE 0.
      CASE SY-SUBRC.
        WHEN 1 . RAISE INVALID_NAME.
        WHEN 2 . RAISE PROP_ALREADY_DEFINED.
        WHEN OTHERS. RAISE ERROR_REGISTER_PROP.
      ENDCASE.
    ENDIF.
* Tell control mnager to register property in cache for this control
    CALL METHOD OF H_GUI 'RegisterCachedProp' NO FLUSH
                             EXPORTING #1 = H_CONTROL-SHELLID
                                       #2 = PROPERTY.
    IF SY-SUBRC NE 0.
      RAISE CNTL_ERROR.
    ENDIF.
  ENDIF.
ENDMETHOD.


method REGISTER_CACHED_W_PROPERTY.
* ...

 data l_c(8) type c.

 unpack property_id to l_c.
 if l_c co '0'.
   l_c = '0'.
 else.
   l_c = l_c+sy-fdpos(*).
 endif.

 CALL METHOD REGISTER_CACHED_PROPERTY
   EXPORTING
     PROPERTY             = l_c
   EXCEPTIONS
     PROP_ALREADY_DEFINED = 1
     INVALID_NAME         = 2
     ERROR_REGISTER_PROP  = 3
     CNTL_ERROR           = 4
     others               = 5
         .
 case SY-SUBRC.
   when 0.
   when 1.
     raise PROP_ID_ALREADY_DEFINED.
   when 2.
     raise INVALID_ID.
   when 3.
     raise ERROR_REGISTER_PROP_id.
   when 4.
     raise CNTL_ERROR.
 ENDcase.


endmethod.


method REG_EVENT_LEFT_CLICK_DESIGN.
  data: event type  CNTL_SIMPLE_EVENT.
  event-eventid = EVENT_LEFT_CLICK_DESIGN.

* check handle
  IF H_CONTROL IS INITIAL.
    RAISE CNTL_ERROR.
  ENDIF.

if REGISTER = CTRUE.
* register for event left click run
    CALL METHOD CONTROL_REGISTER_EVENT
        EXPORTING
            EVENT = EVENT
        EXCEPTIONS
            EVENT_ALREADY_REGISTERED = 1
            ERROR_EVENT_CONTROL = 2.
    IF SY-SUBRC NE 0.
      if sy-subrc = 1.
         RAISE EVENT_ALREADY_REGISTERED.
      else.
         RAISE ERROR_REGIST_EVENT.
      endif.
    ENDIF.
else.
* unregister for event left click run
    CALL METHOD CONTROL_UNREGISTER_EVENT
        EXPORTING
            EVENT = EVENT
        EXCEPTIONS
            EVENT_NOT_REGISTERED = 1
            ERROR_EVENT_CONTROL = 2.
    IF SY-SUBRC NE 0.
      if sy-subrc = 1.
         RAISE EVENT_NOT_REGISTERED.
      else.
         RAISE ERROR_UNREGIST_EVENT.
      endif.
    ENDIF.
endif.
endmethod.


method REG_EVENT_LEFT_CLICK_RUN_MODE.
  data: event type  CNTL_SIMPLE_EVENT.
  event-eventid = EVENT_LEFT_CLICK_RUN.

* check handle
  IF H_CONTROL IS INITIAL.
    RAISE CNTL_ERROR.
  ENDIF.

if REGISTER = CTRUE.
* register for event left click design
    CALL METHOD CONTROL_REGISTER_EVENT
        EXPORTING
            EVENT = EVENT
        EXCEPTIONS
            EVENT_ALREADY_REGISTERED = 1
            ERROR_EVENT_CONTROL = 2.
    IF SY-SUBRC NE 0.
      if sy-subrc = 1.
         RAISE EVENT_ALREADY_REGISTERED.
      else.
         RAISE ERROR_REGIST_EVENT.
      endif.
    ENDIF.
else.
* unregister for event left click design
    CALL METHOD CONTROL_UNREGISTER_EVENT
        EXPORTING
            EVENT = EVENT
        EXCEPTIONS
            EVENT_NOT_REGISTERED = 1
            ERROR_EVENT_CONTROL = 2.
    IF SY-SUBRC NE 0.
      if sy-subrc = 1.
         RAISE EVENT_NOT_REGISTERED.
      else.
         RAISE ERROR_UNREGIST_EVENT.
      endif.
    ENDIF.
endif.
endmethod.


method REG_EVENT_MOVE_CONTROL.
  data: event type  CNTL_SIMPLE_EVENT.
  event-eventid = EVENT_MOVE.

* check handle
  IF H_CONTROL IS INITIAL.
    RAISE CNTL_ERROR.
  ENDIF.

if REGISTER = CTRUE.
* register for event move control
    CALL METHOD CONTROL_REGISTER_EVENT
        EXPORTING
            EVENT = EVENT
        EXCEPTIONS
            EVENT_ALREADY_REGISTERED = 1
            ERROR_EVENT_CONTROL = 2.
    IF SY-SUBRC NE 0.
      if sy-subrc = 1.
         RAISE EVENT_ALREADY_REGISTERED.
      else.
         RAISE ERROR_REGIST_EVENT.
      endif.
    ENDIF.
else.
* unregister for event move control
    CALL METHOD CONTROL_UNREGISTER_EVENT
        EXPORTING
            EVENT = EVENT
        EXCEPTIONS
            EVENT_NOT_REGISTERED = 1
            ERROR_EVENT_CONTROL = 2.
    IF SY-SUBRC NE 0.
      if sy-subrc = 1.
         RAISE EVENT_NOT_REGISTERED.
      else.
         RAISE ERROR_UNREGIST_EVENT.
      endif.
    ENDIF.
endif.
endmethod.


method REG_EVENT_RIGHT_CLICK.
  data: event type  CNTL_SIMPLE_EVENT.
  event-eventid = EVENT_RIGHT_CLICK.

* check handle
  IF H_CONTROL IS INITIAL.
    RAISE CNTL_ERROR.
  ENDIF.

if REGISTER = CTRUE.
* register for event right click
    CALL METHOD CONTROL_REGISTER_EVENT
        EXPORTING
            EVENT = EVENT
        EXCEPTIONS
            EVENT_ALREADY_REGISTERED = 1
            ERROR_EVENT_CONTROL = 2.
    IF SY-SUBRC NE 0.
      if sy-subrc = 1.
         RAISE EVENT_ALREADY_REGISTERED.
      else.
         RAISE ERROR_REGIST_EVENT.
      endif.
    ENDIF.
else.
* unregister for event right click
    CALL METHOD CONTROL_UNREGISTER_EVENT
        EXPORTING
            EVENT = EVENT
        EXCEPTIONS
            EVENT_NOT_REGISTERED = 1
            ERROR_EVENT_CONTROL = 2.
    IF SY-SUBRC NE 0.
      if sy-subrc = 1.
         RAISE EVENT_NOT_REGISTERED.
      else.
         RAISE ERROR_UNREGIST_EVENT.
      endif.
    ENDIF.
endif.
endmethod.


method REG_EVENT_SIZE_CONTROL.
  data: event type  CNTL_SIMPLE_EVENT.
  event-eventid = EVENT_SIZE.

* check handle
  IF H_CONTROL IS INITIAL.
    RAISE CNTL_ERROR.
  ENDIF.

if REGISTER = CTRUE.
* register for event size control
    CALL METHOD CONTROL_REGISTER_EVENT
        EXPORTING
            EVENT = EVENT
        EXCEPTIONS
            EVENT_ALREADY_REGISTERED = 1
            ERROR_EVENT_CONTROL = 2.
    IF SY-SUBRC NE 0.
      if sy-subrc = 1.
         RAISE EVENT_ALREADY_REGISTERED.
      else.
         RAISE ERROR_REGIST_EVENT.
      endif.
    ENDIF.
else.
* unregister for event size control
    CALL METHOD CONTROL_UNREGISTER_EVENT
        EXPORTING
            EVENT = EVENT
        EXCEPTIONS
            EVENT_NOT_REGISTERED = 1
            ERROR_EVENT_CONTROL = 2.
    IF SY-SUBRC NE 0.
      if sy-subrc = 1.
         RAISE EVENT_NOT_REGISTERED.
      else.
         RAISE ERROR_UNREGIST_EVENT.
      endif.
    ENDIF.
endif.
endmethod.


method SET_ACCDESCRIPTION.

* check handle
  IF ME->H_CONTROL IS INITIAL.
    RAISE CNTL_ERROR.
  ENDIF.

* set properties
  CALL METHOD SET_WINDOW_PROPERTY
       EXPORTING
         PROPERTY_ID    = CL_GUI_CONTROL=>PROPERTY_ACCDESCRIPTION
         VALUE          = ACCDESCRIPTION
       EXCEPTIONS
         CNTL_ERROR = 1
         CNTL_SYSTEM_ERROR = 2
         OTHERS = 3.
  CASE SY-SUBRC.
    WHEN 0.
    WHEN 1. RAISE CNTL_ERROR.
    WHEN 2. RAISE CNTL_SYSTEM_ERROR.
    WHEN OTHERS. RAISE CNTL_SYSTEM_ERROR.
  ENDCASE.

endmethod.


method SET_ADJUST_DESIGN.
* check handle
  IF ME->H_CONTROL IS INITIAL.
    RAISE CNTL_ERROR.
  ENDIF.
* set properties
  CALL METHOD SET_WINDOW_PROPERTY
       EXPORTING
         PROPERTY_ID    = CL_GUI_CONTROL=>PROPERTY_ADJUST_DESIGN
         VALUE     = ADJUST_DESIGN
       EXCEPTIONS
         OTHERS = 1.
  IF SY-SUBRC <> 0.
      RAISE CNTL_ERROR.
  ENDIF.
endmethod.


METHOD SET_ALIGNMENT.

* (Alignment)

* check handle
  IF ME->H_CONTROL IS INITIAL.
    RAISE CNTL_ERROR.
  ENDIF.

* set properties
  CALL METHOD SET_WINDOW_PROPERTY
       EXPORTING
         PROPERTY_ID    = CL_GUI_CONTROL=>PROPERTY_ALIGN
         VALUE     = ALIGNMENT
       EXCEPTIONS
         CNTL_ERROR = 1
         CNTL_SYSTEM_ERROR = 2
         OTHERS = 3.
  CASE SY-SUBRC.
    WHEN 0.
    WHEN 1. RAISE CNTL_ERROR.
    WHEN 2. RAISE CNTL_SYSTEM_ERROR.
    WHEN OTHERS. RAISE CNTL_SYSTEM_ERROR.
  ENDCASE.
ENDMETHOD.


method SET_ENABLE .
* ...

  DATA: TEMP_ENABLE(1).
  TEMP_ENABLE = 1.
  CASE ENABLE.
    WHEN '1'.
    WHEN 'X'.
    WHEN 'x'.
    WHEN 'TRUE'.
    WHEN OTHERS.
      TEMP_ENABLE = 0.
  ENDCASE.

* check handle
  IF ME->H_CONTROL IS INITIAL.
    RAISE CNTL_ERROR.
  ENDIF.

* set properties
  CALL METHOD SET_WINDOW_PROPERTY
       EXPORTING
         PROPERTY_ID    = CL_GUI_CONTROL=>PROPERTY_ENABLE
         VALUE          = TEMP_ENABLE
       EXCEPTIONS
         CNTL_ERROR = 1
         CNTL_SYSTEM_ERROR = 2
         OTHERS = 3.
  CASE SY-SUBRC.
    WHEN 0.
    WHEN 1. RAISE CNTL_ERROR.
    WHEN 2. RAISE CNTL_SYSTEM_ERROR.
    WHEN OTHERS. RAISE CNTL_SYSTEM_ERROR.
  ENDCASE.


endmethod.


METHOD SET_FOCUS.
* (control)

  DATA L_C(8) TYPE C.
  DATA L_STR  TYPE STRING.
  DATA CONTROL_FOCUS_SUPPORTED TYPE I.

* check control
  IF CONTROL->H_CONTROL IS INITIAL.
    RAISE CNTL_ERROR.
  ENDIF.


* check supportbit control focus over DIAG
  CALL 'C_GUI_SUPPORT'
    ID 'FEATURE' FIELD 'CONTROL_FOCUS'
    ID 'VALUE' FIELD CONTROL_FOCUS_SUPPORTED.

  IF CONTROL_FOCUS_SUPPORTED = 1 AND CATT_ACTIV IS INITIAL.

*   unpack shellID
    UNPACK CONTROL->H_CONTROL-SHELLId to l_c.
    IF L_C CO '0'.
      L_STR = '0'.
    ELSE.
      L_STR = L_C+SY-FDPOS(*).
    ENDIF.

*   give shellID to dynp
    CALL 'DY_SET_FOCUS_CONTROL'
          ID 'FOCUS_OBJECT' FIELD L_STR.

  ELSE.

*   send control focus over automation queue
    CALL METHOD OF H_GUI 'SetFocus'
      NO FLUSH
        EXPORTING #1 = CONTROL->H_CONTROL-SHELLID.

    CASE SY-SUBRC.
      WHEN 0.
      WHEN 1.                          "// system_error
        RAISE CNTL_SYSTEM_ERROR.
      WHEN 2.                          "// method_call_error
        RAISE CNTL_ERROR.
      WHEN 3.                          "// property_set_error
        RAISE CNTL_ERROR.
      WHEN 4.                          "// property_get_error
        RAISE CNTL_ERROR.
      WHEN OTHERS.
        RAISE CNTL_ERROR.
    ENDCASE.

  ENDIF.

ENDMETHOD.


method SET_GRID_HANDLE.
* check handle
  IF ME->H_CONTROL IS INITIAL.
    RAISE CNTL_ERROR.
  ENDIF.

  CALL METHOD SET_WINDOW_PROPERTY
       EXPORTING
         PROPERTY_ID    = CL_GUI_CONTROL=>PROPERTY_GRID_HANDLE
         VALUE     = GRID_HANDLE
       EXCEPTIONS
         OTHERS = 1.
  IF SY-SUBRC <> 0.
      RAISE CNTL_ERROR.
  ENDIF.
endmethod.


method SET_GRID_STEP.
* check handle
  IF ME->H_CONTROL IS INITIAL.
    RAISE CNTL_ERROR.
  ENDIF.
* set properties
  CALL METHOD SET_WINDOW_PROPERTY
       EXPORTING
         PROPERTY_ID    = CL_GUI_CONTROL=>PROPERTY_GRID_STEP
         VALUE     = GRID_STEP
       EXCEPTIONS
         OTHERS = 1.
  IF SY-SUBRC <> 0.
      RAISE CNTL_ERROR.
  ENDIF.
endmethod.


method SET_HEIGHT.
* check handle
  IF ME->H_CONTROL IS INITIAL.
    RAISE CNTL_ERROR.
  ENDIF.
  CALL METHOD SET_WINDOW_PROPERTY
       EXPORTING
            PROPERTY_ID    = CL_GUI_CONTROL=>PROPERTY_HEIGHT
            VALUE     = HEIGHT
       EXCEPTIONS
         OTHERS = 1.
  IF SY-SUBRC <> 0.
      RAISE CNTL_ERROR.
  ENDIF.
endmethod.


method SET_LEFT.
* check handle
  IF ME->H_CONTROL IS INITIAL.
    RAISE CNTL_ERROR.
  ENDIF.
* set properties
  CALL METHOD SET_WINDOW_PROPERTY
       EXPORTING
         PROPERTY_ID    = CL_GUI_CONTROL=>PROPERTY_LEFT
         VALUE     = LEFT
       EXCEPTIONS
         OTHERS = 1.
  IF SY-SUBRC <> 0.
      RAISE CNTL_ERROR.
  ENDIF.
endmethod.


method SET_METRIC.
* check handle
  IF ME->H_CONTROL IS INITIAL.
    RAISE CNTL_ERROR.
  ENDIF.
  check metric ne m_metric.
* set properties
  CALL METHOD SET_WINDOW_PROPERTY
       EXPORTING
         PROPERTY_ID    = CL_GUI_CONTROL=>PROPERTY_METRIC
         VALUE     = METRIC
       EXCEPTIONS
         OTHERS = 1.
  IF SY-SUBRC <> 0.
      RAISE CNTL_ERROR.
  ENDIF.
  m_metric = metric.
endmethod.


method SET_MODE.
* check handle
  IF ME->H_CONTROL IS INITIAL or
     mode ne mode_run and mode ne mode_design.
    RAISE CNTL_ERROR.
  ENDIF.

  check mode ne cfw_mode.

* set properties
  CALL METHOD SET_WINDOW_PROPERTY
       EXPORTING
         PROPERTY_ID    = CL_GUI_CONTROL=>PROPERTY_MODE
         VALUE     = MODE
       EXCEPTIONS
         OTHERS = 1.
  IF SY-SUBRC <> 0.
      RAISE CNTL_ERROR.
  ENDIF.

  cfw_mode = mode.
  if cfw_mode = mode_design.
    CALL METHOD ME->REGISTER_CACHED_W_PROPERTY
      EXPORTING
        PROPERTY_ID             = property_height
      EXCEPTIONS
        PROP_ID_ALREADY_DEFINED = 1
        INVALID_ID              = 2
        ERROR_REGISTER_PROP_ID  = 3
        CNTL_ERROR              = 4
        others                  = 5.
    IF SY-SUBRC <> 0.
    ENDIF.

    CALL METHOD ME->REGISTER_CACHED_W_PROPERTY
      EXPORTING
        PROPERTY_ID             = property_width
      EXCEPTIONS
        PROP_ID_ALREADY_DEFINED = 1
        INVALID_ID              = 2
        ERROR_REGISTER_PROP_ID  = 3
        CNTL_ERROR              = 4
        others                  = 5.
    IF SY-SUBRC <> 0.
    ENDIF.
    CALL METHOD ME->REGISTER_CACHED_W_PROPERTY
      EXPORTING
        PROPERTY_ID             = property_top
      EXCEPTIONS
        PROP_ID_ALREADY_DEFINED = 1
        INVALID_ID              = 2
        ERROR_REGISTER_PROP_ID  = 3
        CNTL_ERROR              = 4
        others                  = 5.
    IF SY-SUBRC <> 0.
    ENDIF.

    CALL METHOD ME->REGISTER_CACHED_W_PROPERTY
      EXPORTING
        PROPERTY_ID             = property_left
      EXCEPTIONS
        PROP_ID_ALREADY_DEFINED = 1
        INVALID_ID              = 2
        ERROR_REGISTER_PROP_ID  = 3
        CNTL_ERROR              = 4
        others                  = 5.
    IF SY-SUBRC <> 0.
    ENDIF.
  endif.

endmethod.


method SET_NAME.
  data l_control type ref to cl_gui_control.
  class cl_gui_cfw definition load.

  if name cn 'ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789_'.
    raise illegal_name.
  endif.

  l_control ?= parent.
  if l_control->h_control-shellid > cl_gui_cfw=>dynpro_9 and
     parent->get_name( ) is initial.
    raise parent_no_name.
  endif.

  If m_name ne name.
    m_name = name.
    call method set_window_property
         exporting property_id = property_name
                   value       = m_name
                   keep_cache  = 'X'
         exceptions others = 1.
    if sy-subrc ne 0.
      clear m_name.
      raise cntl_error.
    endif.
  endif.

endmethod.


METHOD SET_POSITION.

* (TOP, LEFT, WIDTH, HEIGTH)

* check handle
  IF ME->H_CONTROL IS INITIAL.
    RAISE CNTL_ERROR.
  ENDIF.
* set properties
  CALL METHOD SET_WINDOW_PROPERTY
       EXPORTING
         PROPERTY_ID    = CL_GUI_CONTROL=>PROPERTY_TOP
         VALUE     = TOP
       EXCEPTIONS
         OTHERS = 1.
  IF SY-SUBRC <> 0. RAISE CNTL_ERROR. ENDIF.
  CALL METHOD SET_WINDOW_PROPERTY
       EXPORTING
         PROPERTY_ID    = CL_GUI_CONTROL=>PROPERTY_LEFT
         VALUE     = LEFT
       EXCEPTIONS
         OTHERS = 1.
  IF SY-SUBRC <> 0. RAISE CNTL_ERROR. ENDIF.
  CALL METHOD SET_WINDOW_PROPERTY
       EXPORTING
            PROPERTY_ID    = CL_GUI_CONTROL=>PROPERTY_WIDTH
            VALUE     = WIDTH
       EXCEPTIONS
         OTHERS = 1.
  IF SY-SUBRC <> 0. RAISE CNTL_ERROR. ENDIF.
  CALL METHOD SET_WINDOW_PROPERTY
       EXPORTING
            PROPERTY_ID    = CL_GUI_CONTROL=>PROPERTY_HEIGHT
            VALUE     = HEIGHT
       EXCEPTIONS
         OTHERS = 1.
  IF SY-SUBRC <> 0. RAISE CNTL_ERROR. ENDIF.
ENDMETHOD.


METHOD SET_REGISTERED_EVENTS.

* PUBLIC(EVENTS Type CNTL_SIMPLE_EVENTS)

* This method is used because it is not possible to have
* structured constants, so I need type 'I' here

* inherited classes should rewrite this
* map simple_events to events and call me->SET_REGISTERED_EVENT_EX

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


METHOD SET_REGISTERED_EVENTS_EX .

* PUBLIC(EVENTTAB Type CNTL_EVENTS)

* inherited classes MUST NOT rewrite the method
* use SET_REGISTERED_EVENTS

* SET_REGISTERED_EVENTS_EX intentionally is private

* check handle
  IF H_CONTROL IS INITIAL.
    RAISE CNTL_ERROR.
  ENDIF.

  DATA: CURRENT_EVENT TYPE CNTL_EVENT.

* check for illegal event combinations
* GL 27.1.1999
* check if (EventId-Is_Shellevent) combination exists more than once
  data: temp_tab type cntl_events.
  temp_tab = eventtab.
* sort the table
  sort temp_tab by eventid is_shellevent.
* delete all duplicates
  delete adjacent duplicates from temp_tab.
* check for 'related' entries now (same event as appl. and systemevent)
  delete adjacent duplicates from temp_tab
    comparing eventid is_shellevent.
* related entries are ILLEGAL
  if sy-subrc = 0.
    raise ILLEGAL_EVENT_COMBINATION.
  endif.

* unregister all current events
  LOOP AT REGISTERED_EVENTS INTO CURRENT_EVENT.
*   IF CURRENT_EVENT-IS_SHELLEVENT IS INITIAL.
*   ENDIF.
    IF CURRENT_EVENT-IS_SHELLEVENT IS INITIAL.
*   native OCX-Events.............................
      CALL METHOD OF H_GUI 'UnregisterOcxEvent'
        NO FLUSH
        EXPORTING #1 = H_CONTROL-SHELLID
                  #2 = CURRENT_EVENT-EVENTID.
    ELSE.
*   native Shell-Events...........................
*   SHELL_DOUBLE_CLICK   3
*   SHELL_CLICK          5
*   SHELL_CLOSE          8
*   SHELL_MENU_CLICK    10
*   SHELL_MOVE          11
*   SHELL_SIZE          12
      CALL METHOD OF H_GUI 'UnRegisterEvent'
        NO FLUSH
          EXPORTING #1 = H_CONTROL-SHELLID
                    #2 = CURRENT_EVENT-EVENTID.
    ENDIF.
    CASE SY-SUBRC.
      WHEN 0.                          "// ok
      WHEN 1.                          "// cntl_system-error
        RAISE CNTL_SYSTEM_ERROR.
      WHEN 2.                          "// cntl_error
        RAISE CNTL_ERROR.
      WHEN OTHERS.
    ENDCASE.
  ENDLOOP.

* Unregister ALL Systemevetns (call CL_GUI_CFW)
* TODO GL 20.11.98

* register all new events
  LOOP AT EVENTTAB INTO CURRENT_EVENT.
    IF CURRENT_EVENT-IS_SHELLEVENT IS INITIAL.
*   native OCX-Events......................................
      CALL METHOD OF H_GUI 'RegisterOcxEvent'
        NO FLUSH
        EXPORTING #1 = H_CONTROL-SHELLID
                  #2 = CURRENT_EVENT-EVENTID.
    ELSE.
*   native Shell-Events....................................
*   SHELL_DOUBLE_CLICK   3
*   SHELL_CLICK          5
*   SHELL_CLOSE          8
*   SHELL_MENU_CLICK    10
*   SHELL_MOVE          11
*   SHELL_SIZE          12
      CALL METHOD OF H_GUI 'RegisterEvent'
        NO FLUSH
        EXPORTING #1 = H_CONTROL-SHELLID
                  #2 = CURRENT_EVENT-EVENTID.
    ENDIF.
    CASE SY-SUBRC.
      WHEN 0.                          "// ok
      WHEN 1.                          "// cntl_system-error
        RAISE CNTL_SYSTEM_ERROR.
      WHEN 2.                          "// cntl_error
        RAISE CNTL_ERROR.
      WHEN OTHERS.
    ENDCASE.
  ENDLOOP.


* Register ALL Systemevents (call CL_GUI_CFW) / GL 20.11.98

  DATA: MY_SYSTEMEVENTS TYPE CNTL_EVENTS.
  LOOP AT EVENTTAB INTO CURRENT_EVENT
   WHERE NOT IS_SYSTEMEVENT IS INITIAL.
    CURRENT_EVENT-SHELLID = ME->H_CONTROL-SHELLID.
    APPEND CURRENT_EVENT TO MY_SYSTEMEVENTS.
  ENDLOOP.
  CALL METHOD CL_GUI_CFW=>REGISTER_SYSTEMEVENTS
    EXPORTING
      SHELLID      = H_CONTROL-SHELLID
      SYSTEMEVENTS = MY_SYSTEMEVENTS.

* Update REGISTERED_EVENTS[]
  REGISTERED_EVENTS[] = EVENTTAB[].

* Subscribe / Unsubscribe

  DATA: NEW_EVENTCOUNT LIKE REGISTERED_EVENTS_COUNT.

  DESCRIBE TABLE REGISTERED_EVENTS LINES NEW_EVENTCOUNT.
  IF REGISTERED_EVENTS_COUNT = 0 AND NEW_EVENTCOUNT > 0.
*   subscribe
    CALL METHOD CL_GUI_CFW=>SUBSCRIBE
      EXPORTING
        REF = ME
        SHELLID = ME->H_CONTROL-SHELLID.
  ENDIF.
  IF REGISTERED_EVENTS_COUNT > 0 AND NEW_EVENTCOUNT = 0.
*   unsubscribe
    CALL METHOD CL_GUI_CFW=>UNSUBSCRIBE
      EXPORTING
        REF = ME.
  ENDIF.
  REGISTERED_EVENTS_COUNT = NEW_EVENTCOUNT.

ENDMETHOD.


method SET_TOP.
* check handle
  IF ME->H_CONTROL IS INITIAL.
    RAISE CNTL_ERROR.
  ENDIF.
* set properties
  CALL METHOD SET_WINDOW_PROPERTY
       EXPORTING
         PROPERTY_ID    = CL_GUI_CONTROL=>PROPERTY_TOP
         VALUE     = TOP
       EXCEPTIONS
         OTHERS = 1.
  IF SY-SUBRC <> 0.
      RAISE CNTL_ERROR.
  ENDIF.
endmethod.


METHOD SET_VISIBLE .

* (visible)

  data: temp_visible(1).
  temp_visible = cl_gui_control=>visible_true.
  case visible.
    when '1'.
    when 'X'.
    when 'x'.
    when 'TRUE'.
    when others.
      temp_visible = cl_gui_control=>visible_false.
  endcase.

* check handle
  IF ME->H_CONTROL IS INITIAL.
    RAISE CNTL_ERROR.
  ENDIF.

* set properties
  CALL METHOD SET_WINDOW_PROPERTY
       EXPORTING
         PROPERTY_ID    = CL_GUI_CONTROL=>PROPERTY_VISIBLE
         VALUE          = temp_VISIBLE
       EXCEPTIONS
         CNTL_ERROR = 1
         CNTL_SYSTEM_ERROR = 2
         OTHERS = 3.
  CASE SY-SUBRC.
    WHEN 0.
    WHEN 1. RAISE CNTL_ERROR.
    WHEN 2. RAISE CNTL_SYSTEM_ERROR.
    WHEN OTHERS. RAISE CNTL_SYSTEM_ERROR.
  ENDCASE.

*  IF LIFETIME = CNTL_LIFETIME_DYNPRO.
    CALL METHOD CL_GUI_CFW=>SET_VISIBLE_NOTIFICATION
         EXPORTING REF     = ME
                   VISIBLE = temp_VISIBLE.
*  ENDIF.

ENDMETHOD.


method SET_WIDTH.
* check handle
  IF ME->H_CONTROL IS INITIAL.
    RAISE CNTL_ERROR.
  ENDIF.
  CALL METHOD SET_WINDOW_PROPERTY
       EXPORTING
            PROPERTY_ID    = CL_GUI_CONTROL=>PROPERTY_WIDTH
            VALUE     = WIDTH
       EXCEPTIONS
         OTHERS = 1.
  IF SY-SUBRC <> 0.
      RAISE CNTL_ERROR.
  ENDIF.
endmethod.


METHOD SET_WINDOW_PROPERTY.

* (PROPERTY_ID, VALUE)

  DATA: QUEUE_EMPTY TYPE CHAR01,
        l_c(8) type c,
        l_STRPROPNAME TYPE STRING,
        l_STRVALUE TYPE STRING,
        l_oldSTRVALUE TYPE STRING.

* check handle
  IF H_CONTROL IS INITIAL.
    RAISE CNTL_ERROR.
  ENDIF.

* FIXME
* check for cached property access
  IF  PROP_CACHE_SUPPORTED = 'X'.
* Check whether queue is empty, otherwise cache is invalid
    unpack property_id to l_c.
    if l_c co '0'.
      l_STRPROPNAME = '0'.
    else.
      l_STRPROPNAME = l_c+sy-fdpos(*).
    endif.
    l_STRVALUE = VALUE.
    if not is_cache_valid( ) is initial.
      describe field value type sy-ftype.
      if sy-ftype = 'I'.
        if l_strvalue ca space.
          l_strvalue = l_strvalue(sy-fdpos).
        endif.
* added to handle new variable int8 varable condition
        elseif sy-ftype = cl_abap_typedescr=>typekind_int8.
        if l_strvalue ca space.
          l_strvalue = l_strvalue(sy-fdpos).
        endif.

      endif.
      call method get_cache_prop
           exporting propname  = l_STRPROPNAME
           importing PROPVALUE = l_oldstrvalue
           exceptions others   = 1.
      if sy-subrc = 0 and l_oldstrvalue = l_STRVALUE. " No change
        exit.
      endif.
    endif.
    if KEEP_CACHE = 'X'.
      CALL METHOD SET_CACHE_PROP EXPORTING
                                   PROPNAME = l_STRPROPNAME
                                   PROPVALUE = l_STRVALUE
                                        EXCEPTIONS
                                   PROP_NOT_FOUND = 1
                                   OTHERS = 2.
      IF SY-SUBRC = 2.
* In case this does not work invalidate entire cache and use standard
* automation. Ignore PROP_NOT_FOUND.
*      CUR_CACHE_KEY = CUR_CACHE_KEY + 1.
        call method invalidate_cache.
      ENDIF.
    endif.
  ENDIF.
  IF KEEP_CACHE NE 'X'.
    call method invalidate_cache.
*    CUR_CACHE_KEY = CUR_CACHE_KEY + 1.
  ENDIF.

* set property
CALL METHOD OF H_GUI 'SetProperty'
  NO FLUSH
  EXPORTING #1 = H_CONTROL-SHELLID
            #2 = PROPERTY_ID
            #3 = VALUE.
* just in case of force_flush
 CASE SY-SUBRC.
   WHEN 0.
   WHEN 1.                            "// system_error
     RAISE CNTL_SYSTEM_ERROR.
   WHEN 2.                            "// method_call_error
     RAISE CNTL_ERROR.
   WHEN 3.                            "// property_set_error
     RAISE CNTL_ERROR.
   WHEN 4.                            "// property_get_error
     RAISE CNTL_ERROR.
   WHEN OTHERS.
     RAISE CNTL_ERROR.
 ENDCASE.

  IF SY-SUBRC <> 0.
    RAISE CNTL_ERROR.
  ENDIF.
ENDMETHOD.


METHOD UNREGISTER_CACHED_PROPERTY.
  DATA : STRPROPNAME TYPE STRING.

  IF PROP_CACHE_SUPPORTED = 'X'.
    STRPROPNAME = PROPERTY.
    CALL METHOD REMOVE_CACHE_PROP EXPORTING
                                     PROPNAME = STRPROPNAME
                                  EXCEPTIONS
                                     PROP_NOT_FOUND = 1
                                     INVALID_NAME = 2
                                     OTHERS = 3.
    IF SY-SUBRC NE 0.
      CASE SY-SUBRC.
        WHEN 1. RAISE PROP_NOT_FOUND.
        WHEN 2. RAISE INVALID_NAME.
        WHEN 3. RAISE ERROR_UNREGISTER_PROP.
      ENDCASE.
    ENDIF.

* Tell control mnager to register property in cache for this control
    CALL METHOD OF H_GUI 'UnRegisterCachedProp' NO FLUSH
                             EXPORTING #1 = H_CONTROL-SHELLID
                                       #2 = PROPERTY.
    IF SY-SUBRC NE 0.
      RAISE CNTL_ERROR.
    ENDIF.
  ENDIF.
ENDMETHOD.


method UNREGISTER_CACHED_W_PROPERTY.
* ...

 data l_c(8) type c.

 unpack property_id to l_c.
 if l_c co '0'.
   l_c = '0'.
 else.
   l_c = l_c+sy-fdpos(*).
 endif.

 CALL METHOD unREGISTER_CACHED_PROPERTY
   EXPORTING
     PROPERTY             = l_c
   EXCEPTIONS
     PROP_NOT_FOUND         = 1
     INVALID_NAME           = 2
     ERROR_UNREGISTER_PROP  = 3
     CNTL_ERROR             = 4
     others                 = 5
         .
 case SY-SUBRC.
   when 0.
   when 1.
     raise PROP_ID_not_found.
   when 2.
     raise INVALID_ID.
   when 3.
     raise ERROR_unREGISTER_PROP_id.
   when others.
     raise CNTL_ERROR.
 ENDcase.
endmethod.
ENDCLASS.