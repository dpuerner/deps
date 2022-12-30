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
	
*" protected components of class CL_GUI_PICTURE
*" do not include other source files here!!!
PROTECTED SECTION.
 
*" private components of class CL_GUI_TIMER
*" do not include other source files here!!!
private section.
