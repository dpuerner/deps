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
RETURN.
endmethod.


METHOD CONSTRUCTOR .
return.

ENDMETHOD.


METHOD DISPATCH .
return.
ENDMETHOD.


METHOD RUN .
return.
ENDMETHOD.

ENDCLASS.