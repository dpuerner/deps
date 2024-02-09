class CX_STATIC_CHECK definition
  public
  inheriting from CX_ROOT
  abstract
  create public .

*"* public components of class CX_STATIC_CHECK
*"* do not include other source files here!!!
public section.

  methods CONSTRUCTOR
    importing
      !TEXTID like TEXTID optional
      !PREVIOUS like PREVIOUS optional .
protected section.
*"* protected components of class CX_STATIC_CHECK
*"* do not include other source files here!!!
private section.
ENDCLASS.



CLASS CX_STATIC_CHECK IMPLEMENTATION.


method CONSTRUCTOR .
CALL METHOD SUPER->CONSTRUCTOR
EXPORTING
TEXTID = TEXTID
PREVIOUS = PREVIOUS
.
endmethod.
ENDCLASS.