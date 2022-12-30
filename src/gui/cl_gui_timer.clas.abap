class CL_GUI_TIMER definition
  public
  inheriting from CL_GUI_CONTROL
  create public .

*" public components of class CL_GUI_TIMER
*" do not include other source files here!!!
public section.


*" constants
constants:
  EVENTID_FINISHED type I value 1 .

*" instance attributes
data:
  INTERVAL type I value 0 .

*" events
events:
  FINISHED .

*" methods
methods:
  CANCEL
      exceptions
        ERROR ,
  CONSTRUCTOR
      importing
        LIFETIME type I optional
        value(SHELLSTYLE) type I optional
        value(PARENT) type ref to CL_GUI_CONTAINER optional
      exceptions
        ERROR ,
  RUN
      exceptions
        ERROR .

*" methods
methods:
  DISPATCH
    redefinition .
PROTECTED SECTION.
*" protected components of class CL_GUI_PICTURE
*" do not include other source files here!!!
 .
private section.
*" private components of class CL_GUI_TIMER
*" do not include other source files here!!!

ENDCLASS.



CLASS CL_GUI_TIMER IMPLEMENTATION.


method CANCEL.
CALL METHOD call_method
    EXPORTING
              method  = 'SetTimer'
              P_COUNT = 1
              p1      = -1
              QUEUE_ONLY = 'X'
     EXCEPTIONS OTHERS = 1.
IF SY-SUBRC NE 0.
  RAISE ERROR.
ENDIF.

endmethod.


METHOD CONSTRUCTOR .

  data CLSID(80).
  data event_tab type cntl_simple_events.
  data event_tab_line type cntl_simple_event.

  IF CLSID IS INITIAL.
    DATA: RETURN,
          GUITYPE TYPE I.

    GUITYPE = 0.

* Check for WinGUI
    CALL FUNCTION 'GUI_HAS_OBJECTS'
         EXPORTING
              OBJECT_MODEL = SFES_OBJ_ACTIVEX
         IMPORTING
              RETURN       = RETURN
         EXCEPTIONS
              OTHERS       = 1.
    IF SY-SUBRC NE 0.
      RAISE ERROR.
    ENDIF.

    IF RETURN = 'X'.
      GUITYPE = 1.
    ENDIF.

* Check for JavaGUI
    IF GUITYPE = 0.
      CALL FUNCTION 'GUI_HAS_OBJECTS'
           EXPORTING
                OBJECT_MODEL = SFES_OBJ_JAVABEANS
           IMPORTING
                RETURN       = RETURN
           EXCEPTIONS
                OTHERS       = 1.
      IF SY-SUBRC NE 0.
        RAISE ERROR.
      ENDIF.

      IF RETURN = 'X'.
        GUITYPE = 2.
      ENDIF.
    ENDIF.

* Check for WebGUI
    IF GUITYPE = 0.
      CALL FUNCTION 'GUI_IS_ITS'
       IMPORTING
         RETURN        = RETURN.
      IF RETURN = 'X'.
        GUITYPE = 3.
      ENDIF.
    ENDIF.

    CASE GUITYPE.
      WHEN 1.
        CLSID = 'Sapgui.InfoCtrl.1'.
      WHEN 2.
        CLSID = 'Sapgui.InfoCtrl.1'.
      WHEN 3.
        CLSID = 'Sapgui.InfoCtrl.1'.
    ENDCASE.
  ENDIF.

  call method super->constructor
    exporting
      clsid = clsid
      shellstyle = 0
      PARENT = cl_gui_container=>default_screen
      autoalign = space
       EXCEPTIONS OTHERS = 1.
  IF SY-SUBRC NE 0.
    RAISE ERROR.
  ENDIF.

  CALL METHOD CL_GUI_CFW=>SUBSCRIBE
    EXPORTING
       SHELLID = H_CONTROL-SHELLID
       REF = ME
       EXCEPTIONS OTHERS = 1.
  IF SY-SUBRC NE 0.
    RAISE ERROR.
  ENDIF.

* Register the events
     EVENT_TAB_LINE-EVENTID = CL_GUI_TIMER=>EVENTID_FINISHED.
     append EVENT_TAB_LINE to EVENT_TAB.

     CALL METHOD SET_REGISTERED_EVENTS
       exporting
         EVENTS = event_tab.

ENDMETHOD.


METHOD DISPATCH .

  case EVENTID.
    WHEN  EVENTID_finished.
      RAISE EVENT finished.

  endcase.

ENDMETHOD.


METHOD RUN .

  CALL METHOD call_method
      EXPORTING
                method = 'SetTimer'
                P_COUNT = 1
                p1     = INTERVAL
                QUEUE_ONLY = 'X'
       EXCEPTIONS OTHERS = 1.
  IF SY-SUBRC NE 0.
    RAISE ERROR.
  ENDIF.

ENDMETHOD.

ENDCLASS.