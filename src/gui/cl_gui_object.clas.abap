class CL_GUI_OBJECT definition
  public
  create public .

*"* public components of class CL_GUI_OBJECT
*"* do not include other source files here!!!
public section.

  interfaces IF_CACHED_PROP .

  class-data ACTIVEX type CHAR01 read-only .
  class-data CATT_ACTIV type CHAR01 read-only .
  class-data GUI_IS_RUNNING type CHAR01 read-only .
  type-pools OLE2 .
  class-data H_GUI type OLE2_OBJECT read-only .
  class-data IS_INIT type CHAR1 read-only .
  class-data JAVABEAN type CHAR01 read-only .
  class-data WWW_ACTIVE type CHAR01 read-only .

  class-methods CLASS_CONSTRUCTOR .
  methods IS_VALID
    exporting
      value(RESULT) type I .
  methods CONSTRUCTOR
    importing
      value(CLSID) type C optional
      value(LIFETIME) type I optional
    exceptions
      CREATE_ERROR
      LIFETIME_ERROR .
  methods FREE
    exceptions
      CNTL_ERROR
      CNTL_SYSTEM_ERROR .
  type-pools CNTL .
protected section.
*"* protected components of class CL_GUI_OBJECT
*"* do not include other source files here!!!

  class-data CONTROLS_SUPPORTED type CHAR1 .
  class-data GLOBAL_GUID type I .
  class-data PROP_CACHE_SUPPORTED type CHAR01 .
  class-data XML_BLOB_SUPPORT type CHAR01 .
  type-pools CNTL .
  data H_CONTROL type CNTL_HANDLE .
  data M_CLSID type CHAR255 .

  methods GET_PROPERTY
    importing
      !P1 type ANY optional
      !P2 type ANY optional
      !P3 type ANY optional
      !P4 type ANY optional
      !P5 type ANY optional
      !P6 type ANY optional
      !P7 type ANY optional
      !P8 type ANY optional
      !P9 type ANY optional
      !P10 type ANY optional
      !P11 type ANY optional
      !P12 type ANY optional
      !P13 type ANY optional
      !P14 type ANY optional
      !P15 type ANY optional
      !P16 type ANY optional
      value(PROPERTY) type C
      value(P_COUNT) type I optional
      value(QUEUE_ONLY) type C default 'X'
    exporting
      !VALUE type ANY
    exceptions
      CNTL_ERROR
      CNTL_SYSTEM_ERROR .
  methods SET_PROPERTY
    importing
      !P1 type ANY optional
      !P2 type ANY optional
      !P3 type ANY optional
      !P4 type ANY optional
      !P5 type ANY optional
      !P6 type ANY optional
      !P7 type ANY optional
      !P8 type ANY optional
      !P9 type ANY optional
      !P10 type ANY optional
      !P11 type ANY optional
      !P12 type ANY optional
      !P13 type ANY optional
      !P14 type ANY optional
      !P15 type ANY optional
      !P16 type ANY optional
      value(PROPERTY) type C
      value(P_COUNT) type I optional
      !VALUE type ANY
      !KEEP_CACHE type CHAR01 optional
    exceptions
      CNTL_ERROR
      CNTL_SYSTEM_ERROR .
  methods CALL_METHOD
    importing
      !P1 type ANY optional
      !P2 type ANY optional
      !P3 type ANY optional
      !P4 type ANY optional
      !P5 type ANY optional
      !P6 type ANY optional
      !P7 type ANY optional
      !P8 type ANY optional
      !P9 type ANY optional
      !P10 type ANY optional
      !P11 type ANY optional
      !P12 type ANY optional
      !P13 type ANY optional
      !P14 type ANY optional
      !P15 type ANY optional
      !P16 type ANY optional
      value(METHOD) type C
      value(P_COUNT) type I optional
      value(QUEUE_ONLY) type C default 'X'
      !KEEP_CACHE type CHAR01 optional
    exporting
      !RESULT type ANY
    exceptions
      CNTL_ERROR
      CNTL_SYSTEM_ERROR .
  methods ASSIGN_PROPERTY
    importing
      value(PROPERTY) type C
      !FROM_OBJ type ref to CL_GUI_OBJECT
      value(FROM_PROPERTY) type C
    exceptions
      CNTL_ERROR
      CNTL_SYSTEM_ERROR .
  methods GET_PROPERTY_GUI_OBJECT
    importing
      !P1 type ANY optional
      !P2 type ANY optional
      !P3 type ANY optional
      !P4 type ANY optional
      !P5 type ANY optional
      !P6 type ANY optional
      !P7 type ANY optional
      !P8 type ANY optional
      !P9 type ANY optional
      !P10 type ANY optional
      !P11 type ANY optional
      !P12 type ANY optional
      !P13 type ANY optional
      !P14 type ANY optional
      !P15 type ANY optional
      !P16 type ANY optional
      value(PROPERTY) type C
      value(P_COUNT) type I optional
      value(QUEUE_ONLY) type C default 'X'
      value(VALUE_AS_GUI_OBJECT) type ref to CL_GUI_OBJECT
    exceptions
      CNTL_ERROR
      CNTL_SYSTEM_ERROR .
  methods CALL_METHOD_RESULT_GUI_OBJECT
    importing
      !P1 type ANY optional
      !P2 type ANY optional
      !P3 type ANY optional
      !P4 type ANY optional
      !P5 type ANY optional
      !P6 type ANY optional
      !P7 type ANY optional
      !P8 type ANY optional
      !P9 type ANY optional
      !P10 type ANY optional
      !P11 type ANY optional
      !P12 type ANY optional
      !P13 type ANY optional
      !P14 type ANY optional
      !P15 type ANY optional
      !P16 type ANY optional
      value(METHOD) type C
      value(P_COUNT) type I optional
      value(QUEUE_ONLY) type C default 'X'
      value(RESULT_AS_GUI_OBJECT) type ref to CL_GUI_OBJECT
    exceptions
      CNTL_ERROR
      CNTL_SYSTEM_ERROR .
  methods IS_CACHED_PROP
    importing
      !PROPNAME type STRING
    returning
      value(IS_IN_CACHE) type CHAR01
    exceptions
      CACHE_NOT_INIT .
  methods ADD_CACHE_PROP
    importing
      !PROPNAME type STRING
    exceptions
      INVALID_NAME
      PROP_ALREADY_DEFINED
      CACHE_NOT_INIT .
  methods REMOVE_CACHE_PROP
    importing
      !PROPNAME type STRING
    exceptions
      INVALID_NAME
      PROP_NOT_FOUND
      CACHE_NOT_INIT .
  methods GET_CACHE_PROP
    importing
      !PROPNAME type STRING
    exporting
      !PROPVALUE type STRING
    exceptions
      PROP_NOT_FOUND
      INVALID_NAME
      PROP_INVALID
      CACHE_NOT_INIT .
  methods SET_CACHE_PROP
    importing
      !PROPNAME type STRING
      !PROPVALUE type STRING
    exceptions
      PROP_NOT_FOUND
      INVALID_NAME
      CACHE_NOT_INIT .
  methods IS_CACHE_VALID
    returning
      value(VALID) type CHAR01 .
  methods INVALIDATE_CACHE .
private section.
*"* private components of class CL_GUI_OBJECT
*"* do not include other source files here!!!

  types:
    BEGIN OF TY_PROPCACHEENTRY ,
    PROPNAME TYPE STRING,
    PROPVALUE TYPE STRING,
    VALIDKEY TYPE I,
  END OF TY_PROPCACHEENTRY .
  types:
    TY_PROPCACHE TYPE HASHED TABLE OF TY_PROPCACHEENTRY WITH
                            UNIQUE KEY PROPNAME .

  constants INIT_STATE_FINAL type I value 2 .
  constants INIT_STATE_PRELIMINARY type I value 1 .
  class-data GUI_DATA_CONSUMER type ref to OBJECT .
  class-data INIT_STATE type I .
  data PROPERTY_CACHE type TY_PROPCACHE .
  data PROP_CACHE_CURSOR type I .

  class-methods CLASS_INIT
    returning
      value(RCODE) type I .
  methods VALIDATE_CACHE .
ENDCLASS.



CLASS CL_GUI_OBJECT IMPLEMENTATION.


METHOD ADD_CACHE_PROP.
return.
ENDMETHOD.


METHOD ASSIGN_PROPERTY.
return.
ENDMETHOD.


METHOD CALL_METHOD.
return.
ENDMETHOD.


METHOD CALL_METHOD_RESULT_GUI_OBJECT .
return.
ENDMETHOD.


METHOD CLASS_CONSTRUCTOR.
return.
ENDMETHOD.


method CLASS_INIT.
return.
endmethod.


METHOD CONSTRUCTOR.
return.
ENDMETHOD.


METHOD FREE.
return.
ENDMETHOD.


METHOD GET_CACHE_PROP.
return.
ENDMETHOD.


METHOD GET_PROPERTY.
return.
ENDMETHOD.


METHOD GET_PROPERTY_GUI_OBJECT .
return.
ENDMETHOD.


METHOD IF_CACHED_PROP~GET_NEXT_PROP.
return.
ENDMETHOD.


method IF_CACHED_PROP~SEEK_FIRST_PROP.
return.
endmethod.


METHOD IF_CACHED_PROP~SET_PROP.
return.
ENDMETHOD.


method INVALIDATE_CACHE.
return.
endmethod.


METHOD IS_CACHED_PROP.
return.
ENDMETHOD.


method IS_CACHE_VALID.
return.
endmethod.


METHOD IS_VALID.
return.
ENDMETHOD.

METHOD REMOVE_CACHE_PROP.
return.
ENDMETHOD.


METHOD SET_CACHE_PROP.
return.
ENDMETHOD.


METHOD SET_PROPERTY.
return.
ENDMETHOD.


method VALIDATE_CACHE.
return.
endmethod.
ENDCLASS.