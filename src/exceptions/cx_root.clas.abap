class CX_ROOT definition
  public
  abstract
  create public .

*"* public components of class CX_ROOT
*"* do not include other source files here!!!
public section.

  interfaces IF_MESSAGE .
  interfaces IF_SERIALIZABLE_OBJECT .

  aliases GET_LONGTEXT
    for IF_MESSAGE~GET_LONGTEXT .
  aliases GET_TEXT
    for IF_MESSAGE~GET_TEXT .

  constants CX_ROOT type SOTR_CONC value '16AA9A3937A9BB56E10000000A11447B'. "#EC NOTEXT
  data TEXTID type SOTR_CONC read-only .
  data PREVIOUS type ref to CX_ROOT read-only .
  data KERNEL_ERRID type S380ERRID read-only .
  type-pools ABAP .
  data IS_RESUMABLE type ABAP_BOOL read-only .

  methods CONSTRUCTOR
    importing
      !TEXTID like TEXTID optional
      !PREVIOUS like PREVIOUS optional .
  methods GET_SOURCE_POSITION
    exporting
      !PROGRAM_NAME type SYREPID
      !INCLUDE_NAME type SYREPID
      !SOURCE_LINE type I .
protected section.
*"* protected components of class CX_ROOT
*"* do not include other source files here!!!
private section.
*"* private components of class CX_ROOT
*"* do not include other source files here!!!

  data INTERNAL_SOURCE_POS type SCX_SRCPOS .
ENDCLASS.

CLASS CX_ROOT IMPLEMENTATION.

METHOD constructor.
ENDMETHOD.

METHOD get_source_position.
endmethod.

METHOD if_message~get_longtext .
ENDMETHOD.

METHOD if_message~get_text .
ENDMETHOD.
ENDCLASS.