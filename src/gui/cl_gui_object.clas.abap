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
  DATA NEW_CACHE_ENTRY TYPE TY_PROPCACHEENTRY.
* Do parameter checking
  IF PROPNAME IS INITIAL.
    RAISE INVALID_NAME.
  ENDIF.
  IF PROP_CACHE_SUPPORTED NE 'X'.
    RAISE CACHE_NOT_INIT.
  ENDIF.
* First check if property is already registered.
  READ TABLE PROPERTY_CACHE WITH TABLE KEY PROPNAME = PROPNAME
                         TRANSPORTING NO FIELDS.
  IF SY-SUBRC EQ 0.
    RAISE PROP_ALREADY_DEFINED.
  ENDIF.
  if property_cache is initial.
    call method cl_gui_cfw=>register_cached_control
         exporting control = me.
  endif.
* Insert new entry
  NEW_CACHE_ENTRY-PROPNAME = PROPNAME.
*  NEW_CACHE_ENTRY-VALIDKEY = 0.
  INSERT NEW_CACHE_ENTRY INTO TABLE PROPERTY_CACHE.
ENDMETHOD.


METHOD ASSIGN_PROPERTY.

* PROPERTY, FROM_OBJ, FROM_PROPERTY
* check handle
  IF H_CONTROL IS INITIAL.
    RAISE CNTL_ERROR.
  ENDIF.



  CALL METHOD OF H_GUI 'AssignProperty2'
      NO FLUSH
      EXPORTING #1 = FROM_OBJ->H_CONTROL-OBJ
                #2 = FROM_PROPERTY
                #3 = ME->H_CONTROL-OBJ "// Me
                #4 = PROPERTY.

  CASE SY-SUBRC.
    WHEN 0.                            "// OK
    WHEN 1.                            "// system_error
      RAISE CNTL_SYSTEM_ERROR.
    WHEN 2.                            "// method_call_error
      RAISE CNTL_ERROR.
    WHEN 3.                            "// property_set_error
      RAISE CNTL_ERROR.
    WHEN 4.                            "// property_get_error
      RAISE CNTL_ERROR.
  ENDCASE.

ENDMETHOD.


METHOD CALL_METHOD.

* (METHOD, P1..P16, P_COUNT, QUEUE_ONLY; => RESULT)
* check handle
  IF H_CONTROL IS INITIAL.
    RAISE CNTL_ERROR.
  ENDIF.

* ToDo: QUEUE_ONLY
  IF KEEP_CACHE IS INITIAL.
*    CUR_CACHE_KEY = CUR_CACHE_KEY + 1.
    call method invalidate_cache.
  ENDIF.
  DATA: VERB TYPE TYPEINFO-VERB.
  VERB = METHOD.

  IF NOT VERB IS INITIAL.
    IF RESULT IS REQUESTED.
*     Result requested
      IF QUEUE_ONLY IS INITIAL.
* result will be transported back to application
        CASE P_COUNT.
          WHEN 0.
            CALL METHOD OF H_CONTROL-OBJ VERB = RESULT NO FLUSH.
          WHEN 1.
            CALL METHOD OF H_CONTROL-OBJ VERB = RESULT NO FLUSH
            EXPORTING #1 = P1.
          WHEN 2.
            CALL METHOD OF H_CONTROL-OBJ VERB = RESULT NO FLUSH
            EXPORTING #1 = P1
                      #2 = P2.
          WHEN 3.
            CALL METHOD OF H_CONTROL-OBJ VERB = RESULT NO FLUSH
            EXPORTING #1 = P1
                      #2 = P2
                      #3 = P3.
          WHEN 4.
            CALL METHOD OF H_CONTROL-OBJ VERB = RESULT NO FLUSH
            EXPORTING #1 = P1
                      #2 = P2
                      #3 = P3
                      #4 = P4.
          WHEN 5.
            CALL METHOD OF H_CONTROL-OBJ VERB = RESULT NO FLUSH
            EXPORTING #1 = P1
                      #2 = P2
                      #3 = P3
                      #4 = P4
                      #5 = P5.
          WHEN 6.
            CALL METHOD OF H_CONTROL-OBJ VERB = RESULT NO FLUSH
            EXPORTING #1 = P1
                      #2 = P2
                      #3 = P3
                      #4 = P4
                      #5 = P5
                      #6 = P6.
          WHEN 7.
            CALL METHOD OF H_CONTROL-OBJ VERB = RESULT NO FLUSH
            EXPORTING #1 = P1
                      #2 = P2
                      #3 = P3
                      #4 = P4
                      #5 = P5
                      #6 = P6
                      #7 = P7.
          WHEN 8.
            CALL METHOD OF H_CONTROL-OBJ VERB = RESULT NO FLUSH
            EXPORTING #1 = P1
                      #2 = P2
                      #3 = P3
                      #4 = P4
                      #5 = P5
                      #6 = P6
                      #7 = P7
                      #8 = P8.
          WHEN 9.
            CALL METHOD OF H_CONTROL-OBJ VERB = RESULT NO FLUSH
            EXPORTING #1 = P1
                      #2 = P2
                      #3 = P3
                      #4 = P4
                      #5 = P5
                      #6 = P6
                      #7 = P7
                      #8 = P8
                      #9 = P9.
          WHEN 10.
            CALL METHOD OF H_CONTROL-OBJ VERB = RESULT NO FLUSH
            EXPORTING #1 = P1
                      #2 = P2
                      #3 = P3
                      #4 = P4
                      #5 = P5
                      #6 = P6
                      #7 = P7
                      #8 = P8
                      #9 = P9
                      #10 = P10.
          WHEN 11.
            CALL METHOD OF H_CONTROL-OBJ VERB = RESULT NO FLUSH
            EXPORTING #1 = P1
                      #2 = P2
                      #3 = P3
                      #4 = P4
                      #5 = P5
                      #6 = P6
                      #7 = P7
                      #8 = P8
                      #9 = P9
                      #10 = P10
                      #11 = P11.
          WHEN 12.
            CALL METHOD OF H_CONTROL-OBJ VERB = RESULT NO FLUSH
            EXPORTING #1 = P1
                      #2 = P2
                      #3 = P3
                      #4 = P4
                      #5 = P5
                      #6 = P6
                      #7 = P7
                      #8 = P8
                      #9 = P9
                      #10 = P10
                      #11 = P11
                      #12 = P12.
          WHEN 13.
            CALL METHOD OF H_CONTROL-OBJ VERB = RESULT NO FLUSH
            EXPORTING #1 = P1
                      #2 = P2
                      #3 = P3
                      #4 = P4
                      #5 = P5
                      #6 = P6
                      #7 = P7
                      #8 = P8
                      #9 = P9
                      #10 = P10
                      #11 = P11
                      #12 = P12
                      #13 = P13.
          WHEN 14.
            CALL METHOD OF H_CONTROL-OBJ VERB = RESULT NO FLUSH
            EXPORTING #1 = P1
                      #2 = P2
                      #3 = P3
                      #4 = P4
                      #5 = P5
                      #6 = P6
                      #7 = P7
                      #8 = P8
                      #9 = P9
                      #10 = P10
                      #11 = P11
                      #12 = P12
                      #13 = P13
                      #14 = P14.
          WHEN 15.
            CALL METHOD OF H_CONTROL-OBJ VERB = RESULT NO FLUSH
            EXPORTING #1 = P1
                      #2 = P2
                      #3 = P3
                      #4 = P4
                      #5 = P5
                      #6 = P6
                      #7 = P7
                      #8 = P8
                      #9 = P9
                      #10 = P10
                      #11 = P11
                      #12 = P12
                      #13 = P13
                      #14 = P14
                      #15 = P15.
          WHEN 16.
            CALL METHOD OF H_CONTROL-OBJ VERB = RESULT NO FLUSH
            EXPORTING #1 = P1
                      #2 = P2
                      #3 = P3
                      #4 = P4
                      #5 = P5
                      #6 = P6
                      #7 = P7
                      #8 = P8
                      #9 = P9
                      #10 = P10
                      #11 = P11
                      #12 = P12
                      #13 = P13
                      #14 = P14
                      #15 = P15
                      #16 = P16.
          WHEN OTHERS.
        ENDCASE.
      ELSE.                            "// queue_only
* result will NOT be transported back to application
        CASE P_COUNT.
          WHEN 0.
          CALL METHOD OF H_CONTROL-OBJ VERB = RESULT NO FLUSH QUEUEONLY.
          WHEN 1.
          CALL METHOD OF H_CONTROL-OBJ VERB = RESULT NO FLUSH QUEUEONLY
              EXPORTING #1 = P1.
          WHEN 2.
          CALL METHOD OF H_CONTROL-OBJ VERB = RESULT NO FLUSH QUEUEONLY
              EXPORTING #1 = P1
                        #2 = P2.
          WHEN 3.
          CALL METHOD OF H_CONTROL-OBJ VERB = RESULT NO FLUSH QUEUEONLY
              EXPORTING #1 = P1
                        #2 = P2
                        #3 = P3.
          WHEN 4.
          CALL METHOD OF H_CONTROL-OBJ VERB = RESULT NO FLUSH QUEUEONLY
              EXPORTING #1 = P1
                        #2 = P2
                        #3 = P3
                        #4 = P4.
          WHEN 5.
          CALL METHOD OF H_CONTROL-OBJ VERB = RESULT NO FLUSH QUEUEONLY
              EXPORTING #1 = P1
                        #2 = P2
                        #3 = P3
                        #4 = P4
                        #5 = P5.
          WHEN 6.
          CALL METHOD OF H_CONTROL-OBJ VERB = RESULT NO FLUSH QUEUEONLY
              EXPORTING #1 = P1
                        #2 = P2
                        #3 = P3
                        #4 = P4
                        #5 = P5
                        #6 = P6.
          WHEN 7.
          CALL METHOD OF H_CONTROL-OBJ VERB = RESULT NO FLUSH QUEUEONLY
              EXPORTING #1 = P1
                        #2 = P2
                        #3 = P3
                        #4 = P4
                        #5 = P5
                        #6 = P6
                        #7 = P7.
          WHEN 8.
          CALL METHOD OF H_CONTROL-OBJ VERB = RESULT NO FLUSH QUEUEONLY
              EXPORTING #1 = P1
                        #2 = P2
                        #3 = P3
                        #4 = P4
                        #5 = P5
                        #6 = P6
                        #7 = P7
                        #8 = P8.
          WHEN 9.
          CALL METHOD OF H_CONTROL-OBJ VERB = RESULT NO FLUSH QUEUEONLY
              EXPORTING #1 = P1
                        #2 = P2
                        #3 = P3
                        #4 = P4
                        #5 = P5
                        #6 = P6
                        #7 = P7
                        #8 = P8
                        #9 = P9.
          WHEN 10.
          CALL METHOD OF H_CONTROL-OBJ VERB = RESULT NO FLUSH QUEUEONLY
              EXPORTING #1 = P1
                        #2 = P2
                        #3 = P3
                        #4 = P4
                        #5 = P5
                        #6 = P6
                        #7 = P7
                        #8 = P8
                        #9 = P9
                        #10 = P10.
          WHEN 11.
          CALL METHOD OF H_CONTROL-OBJ VERB = RESULT NO FLUSH QUEUEONLY
              EXPORTING #1 = P1
                        #2 = P2
                        #3 = P3
                        #4 = P4
                        #5 = P5
                        #6 = P6
                        #7 = P7
                        #8 = P8
                        #9 = P9
                        #10 = P10
                        #11 = P11.
          WHEN 12.
          CALL METHOD OF H_CONTROL-OBJ VERB = RESULT NO FLUSH QUEUEONLY
              EXPORTING #1 = P1
                        #2 = P2
                        #3 = P3
                        #4 = P4
                        #5 = P5
                        #6 = P6
                        #7 = P7
                        #8 = P8
                        #9 = P9
                        #10 = P10
                        #11 = P11
                        #12 = P12.
          WHEN 13.
          CALL METHOD OF H_CONTROL-OBJ VERB = RESULT NO FLUSH QUEUEONLY
              EXPORTING #1 = P1
                        #2 = P2
                        #3 = P3
                        #4 = P4
                        #5 = P5
                        #6 = P6
                        #7 = P7
                        #8 = P8
                        #9 = P9
                        #10 = P10
                        #11 = P11
                        #12 = P12
                        #13 = P13.
          WHEN 14.
          CALL METHOD OF H_CONTROL-OBJ VERB = RESULT NO FLUSH QUEUEONLY
              EXPORTING #1 = P1
                        #2 = P2
                        #3 = P3
                        #4 = P4
                        #5 = P5
                        #6 = P6
                        #7 = P7
                        #8 = P8
                        #9 = P9
                        #10 = P10
                        #11 = P11
                        #12 = P12
                        #13 = P13
                        #14 = P14.
          WHEN 15.
          CALL METHOD OF H_CONTROL-OBJ VERB = RESULT NO FLUSH QUEUEONLY
              EXPORTING #1 = P1
                        #2 = P2
                        #3 = P3
                        #4 = P4
                        #5 = P5
                        #6 = P6
                        #7 = P7
                        #8 = P8
                        #9 = P9
                        #10 = P10
                        #11 = P11
                        #12 = P12
                        #13 = P13
                        #14 = P14
                        #15 = P15.
          WHEN 16.
          CALL METHOD OF H_CONTROL-OBJ VERB = RESULT NO FLUSH QUEUEONLY
              EXPORTING #1 = P1
                        #2 = P2
                        #3 = P3
                        #4 = P4
                        #5 = P5
                        #6 = P6
                        #7 = P7
                        #8 = P8
                        #9 = P9
                        #10 = P10
                        #11 = P11
                        #12 = P12
                        #13 = P13
                        #14 = P14
                        #15 = P15
                        #16 = P16.
          WHEN OTHERS.
        ENDCASE.
      ENDIF.                           "// queue_only
    ELSE.
*     Result NOT requested
      CASE P_COUNT.
        WHEN 0.
          CALL METHOD OF H_CONTROL-OBJ VERB NO FLUSH.
        WHEN 1.
          CALL METHOD OF H_CONTROL-OBJ VERB NO FLUSH
          EXPORTING #1 = P1.
        WHEN 2.
          CALL METHOD OF H_CONTROL-OBJ VERB NO FLUSH
          EXPORTING #1 = P1
                    #2 = P2.
        WHEN 3.
          CALL METHOD OF H_CONTROL-OBJ VERB NO FLUSH
          EXPORTING #1 = P1
                    #2 = P2
                    #3 = P3.
        WHEN 4.
          CALL METHOD OF H_CONTROL-OBJ VERB NO FLUSH
          EXPORTING #1 = P1
                    #2 = P2
                    #3 = P3
                    #4 = P4.
        WHEN 5.
          CALL METHOD OF H_CONTROL-OBJ VERB NO FLUSH
          EXPORTING #1 = P1
                    #2 = P2
                    #3 = P3
                    #4 = P4
                    #5 = P5.
        WHEN 6.
          CALL METHOD OF H_CONTROL-OBJ VERB NO FLUSH
          EXPORTING #1 = P1
                    #2 = P2
                    #3 = P3
                    #4 = P4
                    #5 = P5
                    #6 = P6.
        WHEN 7.
          CALL METHOD OF H_CONTROL-OBJ VERB NO FLUSH
          EXPORTING #1 = P1
                    #2 = P2
                    #3 = P3
                    #4 = P4
                    #5 = P5
                    #6 = P6
                    #7 = P7.
        WHEN 8.
          CALL METHOD OF H_CONTROL-OBJ VERB NO FLUSH
          EXPORTING #1 = P1
                    #2 = P2
                    #3 = P3
                    #4 = P4
                    #5 = P5
                    #6 = P6
                    #7 = P7
                    #8 = P8.
        WHEN 9.
          CALL METHOD OF H_CONTROL-OBJ VERB NO FLUSH
          EXPORTING #1 = P1
                    #2 = P2
                    #3 = P3
                    #4 = P4
                    #5 = P5
                    #6 = P6
                    #7 = P7
                    #8 = P8
                    #9 = P9.
        WHEN 10.
          CALL METHOD OF H_CONTROL-OBJ VERB NO FLUSH
          EXPORTING #1 = P1
                    #2 = P2
                    #3 = P3
                    #4 = P4
                    #5 = P5
                    #6 = P6
                    #7 = P7
                    #8 = P8
                    #9 = P9
                    #10 = P10.
        WHEN 11.
          CALL METHOD OF H_CONTROL-OBJ VERB NO FLUSH
          EXPORTING #1 = P1
                    #2 = P2
                    #3 = P3
                    #4 = P4
                    #5 = P5
                    #6 = P6
                    #7 = P7
                    #8 = P8
                    #9 = P9
                    #10 = P10
                    #11 = P11.
        WHEN 12.
          CALL METHOD OF H_CONTROL-OBJ VERB NO FLUSH
          EXPORTING #1 = P1
                    #2 = P2
                    #3 = P3
                    #4 = P4
                    #5 = P5
                    #6 = P6
                    #7 = P7
                    #8 = P8
                    #9 = P9
                    #10 = P10
                    #11 = P11
                    #12 = P12.
        WHEN 13.
          CALL METHOD OF H_CONTROL-OBJ VERB NO FLUSH
          EXPORTING #1 = P1
                    #2 = P2
                    #3 = P3
                    #4 = P4
                    #5 = P5
                    #6 = P6
                    #7 = P7
                    #8 = P8
                    #9 = P9
                    #10 = P10
                    #11 = P11
                    #12 = P12
                    #13 = P13.
        WHEN 14.
          CALL METHOD OF H_CONTROL-OBJ VERB NO FLUSH
          EXPORTING #1 = P1
                    #2 = P2
                    #3 = P3
                    #4 = P4
                    #5 = P5
                    #6 = P6
                    #7 = P7
                    #8 = P8
                    #9 = P9
                    #10 = P10
                    #11 = P11
                    #12 = P12
                    #13 = P13
                    #14 = P14.
        WHEN 15.
          CALL METHOD OF H_CONTROL-OBJ VERB NO FLUSH
          EXPORTING #1 = P1
                    #2 = P2
                    #3 = P3
                    #4 = P4
                    #5 = P5
                    #6 = P6
                    #7 = P7
                    #8 = P8
                    #9 = P9
                    #10 = P10
                    #11 = P11
                    #12 = P12
                    #13 = P13
                    #14 = P14
                    #15 = P15.
        WHEN 16.
          CALL METHOD OF H_CONTROL-OBJ VERB NO FLUSH
          EXPORTING #1 = P1
                    #2 = P2
                    #3 = P3
                    #4 = P4
                    #5 = P5
                    #6 = P6
                    #7 = P7
                    #8 = P8
                    #9 = P9
                    #10 = P10
                    #11 = P11
                    #12 = P12
                    #13 = P13
                    #14 = P14
                    #15 = P15
                    #16 = P16.
        WHEN OTHERS.
      ENDCASE.
    ENDIF.

    CASE SY-SUBRC.
      WHEN 0.                          "// OK
      WHEN 1.                          "// system_error
        RAISE CNTL_SYSTEM_ERROR.
      WHEN 2.                          "// method_call_error
        RAISE CNTL_ERROR.
      WHEN 3.                          "// property_set_error
        RAISE CNTL_ERROR.
      WHEN 4.                          "// property_get_error
        RAISE CNTL_ERROR.
    ENDCASE.
  ENDIF.                               "// verb initial
ENDMETHOD.


METHOD CALL_METHOD_RESULT_GUI_OBJECT .

* (METHOD, P1..P16, P_COUNT, QUEUE_ONLY; => RESULT)
* check handle
  IF H_CONTROL IS INITIAL.
    RAISE CNTL_ERROR.
  ENDIF.

  IF RESULT_AS_GUI_OBJECT IS INITIAL.
    RAISE CNTL_ERROR.
  ENDIF.

  DATA: VERB TYPE TYPEINFO-VERB.
  VERB = METHOD.

  IF NOT VERB IS INITIAL.
* result will be transported back to application
    IF QUEUE_ONLY IS INITIAL.
      CASE P_COUNT.
        WHEN 0.
          CALL METHOD OF H_CONTROL-OBJ VERB =
            RESULT_AS_GUI_OBJECT->H_CONTROL-OBJ NO FLUSH.
        WHEN 1.
          CALL METHOD OF H_CONTROL-OBJ VERB =
            RESULT_AS_GUI_OBJECT->H_CONTROL-OBJ NO FLUSH
          EXPORTING #1 = P1.
        WHEN 2.
          CALL METHOD OF H_CONTROL-OBJ VERB =
            RESULT_AS_GUI_OBJECT->H_CONTROL-OBJ NO FLUSH
          EXPORTING #1 = P1
                    #2 = P2.
        WHEN 3.
          CALL METHOD OF H_CONTROL-OBJ VERB =
            RESULT_AS_GUI_OBJECT->H_CONTROL-OBJ NO FLUSH
          EXPORTING #1 = P1
                    #2 = P2
                    #3 = P3.
        WHEN 4.
          CALL METHOD OF H_CONTROL-OBJ VERB =
            RESULT_AS_GUI_OBJECT->H_CONTROL-OBJ NO FLUSH
          EXPORTING #1 = P1
                    #2 = P2
                    #3 = P3
                    #4 = P4.
        WHEN 5.
          CALL METHOD OF H_CONTROL-OBJ VERB =
            RESULT_AS_GUI_OBJECT->H_CONTROL-OBJ NO FLUSH
          EXPORTING #1 = P1
                    #2 = P2
                    #3 = P3
                    #4 = P4
                    #5 = P5.
        WHEN 6.
          CALL METHOD OF H_CONTROL-OBJ VERB =
            RESULT_AS_GUI_OBJECT->H_CONTROL-OBJ NO FLUSH
          EXPORTING #1 = P1
                    #2 = P2
                    #3 = P3
                    #4 = P4
                    #5 = P5
                    #6 = P6.
        WHEN 7.
          CALL METHOD OF H_CONTROL-OBJ VERB =
            RESULT_AS_GUI_OBJECT->H_CONTROL-OBJ NO FLUSH
          EXPORTING #1 = P1
                    #2 = P2
                    #3 = P3
                    #4 = P4
                    #5 = P5
                    #6 = P6
                    #7 = P7.
        WHEN 8.
          CALL METHOD OF H_CONTROL-OBJ VERB =
            RESULT_AS_GUI_OBJECT->H_CONTROL-OBJ NO FLUSH
          EXPORTING #1 = P1
                    #2 = P2
                    #3 = P3
                    #4 = P4
                    #5 = P5
                    #6 = P6
                    #7 = P7
                    #8 = P8.
        WHEN 9.
          CALL METHOD OF H_CONTROL-OBJ VERB =
            RESULT_AS_GUI_OBJECT->H_CONTROL-OBJ NO FLUSH
          EXPORTING #1 = P1
                    #2 = P2
                    #3 = P3
                    #4 = P4
                    #5 = P5
                    #6 = P6
                    #7 = P7
                    #8 = P8
                    #9 = P9.
        WHEN 10.
          CALL METHOD OF H_CONTROL-OBJ VERB =
            RESULT_AS_GUI_OBJECT->H_CONTROL-OBJ NO FLUSH
          EXPORTING #1 = P1
                    #2 = P2
                    #3 = P3
                    #4 = P4
                    #5 = P5
                    #6 = P6
                    #7 = P7
                    #8 = P8
                    #9 = P9
                    #10 = P10.
        WHEN 11.
          CALL METHOD OF H_CONTROL-OBJ VERB =
            RESULT_AS_GUI_OBJECT->H_CONTROL-OBJ NO FLUSH
          EXPORTING #1 = P1
                    #2 = P2
                    #3 = P3
                    #4 = P4
                    #5 = P5
                    #6 = P6
                    #7 = P7
                    #8 = P8
                    #9 = P9
                    #10 = P10
                    #11 = P11.
        WHEN 12.
          CALL METHOD OF H_CONTROL-OBJ VERB =
            RESULT_AS_GUI_OBJECT->H_CONTROL-OBJ NO FLUSH
          EXPORTING #1 = P1
                    #2 = P2
                    #3 = P3
                    #4 = P4
                    #5 = P5
                    #6 = P6
                    #7 = P7
                    #8 = P8
                    #9 = P9
                    #10 = P10
                    #11 = P11
                    #12 = P12.
        WHEN 13.
          CALL METHOD OF H_CONTROL-OBJ VERB =
            RESULT_AS_GUI_OBJECT->H_CONTROL-OBJ NO FLUSH
          EXPORTING #1 = P1
                    #2 = P2
                    #3 = P3
                    #4 = P4
                    #5 = P5
                    #6 = P6
                    #7 = P7
                    #8 = P8
                    #9 = P9
                    #10 = P10
                    #11 = P11
                    #12 = P12
                    #13 = P13.
        WHEN 14.
          CALL METHOD OF H_CONTROL-OBJ VERB =
            RESULT_AS_GUI_OBJECT->H_CONTROL-OBJ NO FLUSH
          EXPORTING #1 = P1
                    #2 = P2
                    #3 = P3
                    #4 = P4
                    #5 = P5
                    #6 = P6
                    #7 = P7
                    #8 = P8
                    #9 = P9
                    #10 = P10
                    #11 = P11
                    #12 = P12
                    #13 = P13
                    #14 = P14.
        WHEN 15.
          CALL METHOD OF H_CONTROL-OBJ VERB =
            RESULT_AS_GUI_OBJECT->H_CONTROL-OBJ NO FLUSH
          EXPORTING #1 = P1
                    #2 = P2
                    #3 = P3
                    #4 = P4
                    #5 = P5
                    #6 = P6
                    #7 = P7
                    #8 = P8
                    #9 = P9
                    #10 = P10
                    #11 = P11
                    #12 = P12
                    #13 = P13
                    #14 = P14
                    #15 = P15.
        WHEN 16.
          CALL METHOD OF H_CONTROL-OBJ VERB =
            RESULT_AS_GUI_OBJECT->H_CONTROL-OBJ NO FLUSH
          EXPORTING #1 = P1
                    #2 = P2
                    #3 = P3
                    #4 = P4
                    #5 = P5
                    #6 = P6
                    #7 = P7
                    #8 = P8
                    #9 = P9
                    #10 = P10
                    #11 = P11
                    #12 = P12
                    #13 = P13
                    #14 = P14
                    #15 = P15
                    #16 = P16.
        WHEN OTHERS.
      ENDCASE.
    ELSE.
* result will not be transported back to application
      CASE P_COUNT.
        WHEN 0.
          CALL METHOD OF H_CONTROL-OBJ VERB =
            RESULT_AS_GUI_OBJECT->H_CONTROL-OBJ NO FLUSH QUEUE-ONLY.
        WHEN 1.
          CALL METHOD OF H_CONTROL-OBJ VERB =
            RESULT_AS_GUI_OBJECT->H_CONTROL-OBJ NO FLUSH QUEUE-ONLY
          EXPORTING #1 = P1.
        WHEN 2.
          CALL METHOD OF H_CONTROL-OBJ VERB =
            RESULT_AS_GUI_OBJECT->H_CONTROL-OBJ NO FLUSH QUEUE-ONLY
          EXPORTING #1 = P1
                    #2 = P2.
        WHEN 3.
          CALL METHOD OF H_CONTROL-OBJ VERB =
            RESULT_AS_GUI_OBJECT->H_CONTROL-OBJ NO FLUSH QUEUE-ONLY
          EXPORTING #1 = P1
                    #2 = P2
                    #3 = P3.
        WHEN 4.
          CALL METHOD OF H_CONTROL-OBJ VERB =
            RESULT_AS_GUI_OBJECT->H_CONTROL-OBJ NO FLUSH QUEUE-ONLY
          EXPORTING #1 = P1
                    #2 = P2
                    #3 = P3
                    #4 = P4.
        WHEN 5.
          CALL METHOD OF H_CONTROL-OBJ VERB =
            RESULT_AS_GUI_OBJECT->H_CONTROL-OBJ NO FLUSH QUEUE-ONLY
          EXPORTING #1 = P1
                    #2 = P2
                    #3 = P3
                    #4 = P4
                    #5 = P5.
        WHEN 6.
          CALL METHOD OF H_CONTROL-OBJ VERB =
            RESULT_AS_GUI_OBJECT->H_CONTROL-OBJ NO FLUSH QUEUE-ONLY
          EXPORTING #1 = P1
                    #2 = P2
                    #3 = P3
                    #4 = P4
                    #5 = P5
                    #6 = P6.
        WHEN 7.
          CALL METHOD OF H_CONTROL-OBJ VERB =
            RESULT_AS_GUI_OBJECT->H_CONTROL-OBJ NO FLUSH QUEUE-ONLY
          EXPORTING #1 = P1
                    #2 = P2
                    #3 = P3
                    #4 = P4
                    #5 = P5
                    #6 = P6
                    #7 = P7.
        WHEN 8.
          CALL METHOD OF H_CONTROL-OBJ VERB =
            RESULT_AS_GUI_OBJECT->H_CONTROL-OBJ NO FLUSH QUEUE-ONLY
          EXPORTING #1 = P1
                    #2 = P2
                    #3 = P3
                    #4 = P4
                    #5 = P5
                    #6 = P6
                    #7 = P7
                    #8 = P8.
        WHEN 9.
          CALL METHOD OF H_CONTROL-OBJ VERB =
            RESULT_AS_GUI_OBJECT->H_CONTROL-OBJ NO FLUSH QUEUE-ONLY
          EXPORTING #1 = P1
                    #2 = P2
                    #3 = P3
                    #4 = P4
                    #5 = P5
                    #6 = P6
                    #7 = P7
                    #8 = P8
                    #9 = P9.
        WHEN 10.
          CALL METHOD OF H_CONTROL-OBJ VERB =
            RESULT_AS_GUI_OBJECT->H_CONTROL-OBJ NO FLUSH QUEUE-ONLY
          EXPORTING #1 = P1
                    #2 = P2
                    #3 = P3
                    #4 = P4
                    #5 = P5
                    #6 = P6
                    #7 = P7
                    #8 = P8
                    #9 = P9
                    #10 = P10.
        WHEN 11.
          CALL METHOD OF H_CONTROL-OBJ VERB =
            RESULT_AS_GUI_OBJECT->H_CONTROL-OBJ NO FLUSH QUEUE-ONLY
          EXPORTING #1 = P1
                    #2 = P2
                    #3 = P3
                    #4 = P4
                    #5 = P5
                    #6 = P6
                    #7 = P7
                    #8 = P8
                    #9 = P9
                    #10 = P10
                    #11 = P11.
        WHEN 12.
          CALL METHOD OF H_CONTROL-OBJ VERB =
            RESULT_AS_GUI_OBJECT->H_CONTROL-OBJ NO FLUSH QUEUE-ONLY
          EXPORTING #1 = P1
                    #2 = P2
                    #3 = P3
                    #4 = P4
                    #5 = P5
                    #6 = P6
                    #7 = P7
                    #8 = P8
                    #9 = P9
                    #10 = P10
                    #11 = P11
                    #12 = P12.
        WHEN 13.
          CALL METHOD OF H_CONTROL-OBJ VERB =
            RESULT_AS_GUI_OBJECT->H_CONTROL-OBJ NO FLUSH QUEUE-ONLY
          EXPORTING #1 = P1
                    #2 = P2
                    #3 = P3
                    #4 = P4
                    #5 = P5
                    #6 = P6
                    #7 = P7
                    #8 = P8
                    #9 = P9
                    #10 = P10
                    #11 = P11
                    #12 = P12
                    #13 = P13.
        WHEN 14.
          CALL METHOD OF H_CONTROL-OBJ VERB =
            RESULT_AS_GUI_OBJECT->H_CONTROL-OBJ NO FLUSH QUEUE-ONLY
          EXPORTING #1 = P1
                    #2 = P2
                    #3 = P3
                    #4 = P4
                    #5 = P5
                    #6 = P6
                    #7 = P7
                    #8 = P8
                    #9 = P9
                    #10 = P10
                    #11 = P11
                    #12 = P12
                    #13 = P13
                    #14 = P14.
        WHEN 15.
          CALL METHOD OF H_CONTROL-OBJ VERB =
            RESULT_AS_GUI_OBJECT->H_CONTROL-OBJ NO FLUSH QUEUE-ONLY
          EXPORTING #1 = P1
                    #2 = P2
                    #3 = P3
                    #4 = P4
                    #5 = P5
                    #6 = P6
                    #7 = P7
                    #8 = P8
                    #9 = P9
                    #10 = P10
                    #11 = P11
                    #12 = P12
                    #13 = P13
                    #14 = P14
                    #15 = P15.
        WHEN 16.
          CALL METHOD OF H_CONTROL-OBJ VERB =
            RESULT_AS_GUI_OBJECT->H_CONTROL-OBJ NO FLUSH QUEUE-ONLY
          EXPORTING #1 = P1
                    #2 = P2
                    #3 = P3
                    #4 = P4
                    #5 = P5
                    #6 = P6
                    #7 = P7
                    #8 = P8
                    #9 = P9
                    #10 = P10
                    #11 = P11
                    #12 = P12
                    #13 = P13
                    #14 = P14
                    #15 = P15
                    #16 = P16.
        WHEN OTHERS.
      ENDCASE.
    ENDIF.                             "QUEUE_ONLY

* 'touch' the handle
    RESULT_AS_GUI_OBJECT->H_CONTROL-HANDLE_TYPE = 'NO_OCX'.

    CASE SY-SUBRC.
      WHEN 0.                          "// OK
      WHEN 1.                          "// system_error
        RAISE CNTL_SYSTEM_ERROR.
      WHEN 2.                          "// method_call_error
        RAISE CNTL_ERROR.
      WHEN 3.                          "// property_set_error
        RAISE CNTL_ERROR.
      WHEN 4.                          "// property_get_error
        RAISE CNTL_ERROR.
    ENDCASE.
  ENDIF.                               "// verb initial
ENDMETHOD.


METHOD CLASS_CONSTRUCTOR.

* ...
  if class_init( ) ne 0.
    init_state = init_state_preliminary.
  else.
    init_state = init_state_final.
  endif.

ENDMETHOD.


method CLASS_INIT.
* ...
  class cl_gui_cfw definition load.

  data: CAT_ACTIVE TYPE C,
        CAT_RECORDING TYPE C,
        CAT_PLAYBACK TYPE C.

  data: line type text_72.

* Don't do it again!
  check is_init is initial.

* check if there is a GUI
  CALL FUNCTION 'GUI_IS_AVAILABLE'
       IMPORTING
            RETURN = GUI_IS_RUNNING.

* check if the GUI supports automation
  CALL FUNCTION 'GUI_HAS_ACTIVEX'
       IMPORTING
            RETURN = activex.

* check for javabean support
  IF activex IS INITIAL.
    CALL FUNCTION 'GUI_HAS_JAVABEANS'
         IMPORTING
              RETURN = javabean.
  ELSE.
*   check for ITS/WebGUI

    CALL FUNCTION 'GUI_IS_ITS'
         IMPORTING
              RETURN = www_active.
  ENDIF.

* check if CATT is running
  CALL FUNCTION 'CAT_IS_ACTIVE'
       IMPORTING
            ACTIVE    = CAT_ACTIVE
            RECORDING = CAT_RECORDING
            PLAYBACK  = CAT_PLAYBACK.

  CATT_ACTIV = CAT_ACTIVE.

  call method cl_gui_props_consumer=>set_default_factors
              exporting activex    = activex
                        javabean   = javabean
                        www_active = www_active
                        catt_active = catt_activ
                        gui_is_running = gui_is_running.

* if there is no SAPGUI and CATT is not running exit
  if ( GUI_IS_RUNNING IS INITIAL or
          activex is initial and javabean is initial )
                           AND CAT_ACTIVE is initial.
    rcode = 1.
    cl_gui_cfw=>reason_no_init = cl_gui_cfw=>reason_no_gui.

    concatenate 'GUI_IS_RUNNING=' gui_is_running ' ACTIVEX=' activex ' JAVABEAN=' javabean into line.
    call function 'CONTROL_WRITE_FPRINT_TRACE'
      exporting
        TRACETEXT = line.

    exit.
  endif.

********** Property Cache *************
* 16.04.99 check if cache should be used

  CALL FUNCTION 'SAPGUI_GET_SUPPORT_CTL_CACHE'
       IMPORTING
            CACHESUPPORT = PROP_CACHE_SUPPORTED.

********** XML Blobs supported  *******
* 06.05.99 check if xml blobs should be used

  CALL FUNCTION 'SAPGUI_GET_SUPPORT_BLOBS'
       IMPORTING
            BLOBSUPPORT = XML_BLOB_SUPPORT.

* instantiate ControlManager at frontend
  CREATE OBJECT H_GUI 'SAPGUI.APPLICATION' NO FLUSH.
  IF SY-SUBRC = 0.
    IS_INIT = 'X'.
  ELSE.
*   I cannot raise exception here
*   I cannot message here
  ENDIF.

* ...
endmethod.


METHOD CONSTRUCTOR.

* (CLSID, LIFETIME): Create an OBJECT
* The CL_GUI_OBJECT does NOT call CL_GUI_CFW=>add_OBJECT !!
* This has to be done in the SubClass, if neccessary

  class cl_gui_cfw definition load.
*  CUR_CACHE_KEY = 1.
  IF CLSID IS INITIAL.
*   Create 'empty' object
    EXIT.
  ELSE.
*   check if framework works (is a GUI available, batch, ...)
*   is_init is set cl_gui_object=>class_constructor
    if is_init is initial.
      if init_state ne init_state_preliminary.
        message id 'DC' type 'W' number cl_gui_cfw=>reason_no_init
          raising create_error.
      else.
        if class_init( ) ne 0.
          message id 'DC' type 'W' number cl_gui_cfw=>reason_no_init
            raising create_error.
        endif.
        init_state = init_state_final.
      endif.
    endif.
    ADD 1 TO GLOBAL_GUID.
    H_CONTROL-GUID = GLOBAL_GUID.
    H_CONTROL-HANDLE_TYPE = CNTL_TYPE_NO_OCX.
    CREATE OBJECT H_CONTROL-OBJ CLSID NO FLUSH.
    IF SY-SUBRC NE 0.
      RAISE CREATE_ERROR.
    ENDIF.
    me->m_clsid = clsid.
*   TODO: Lifetime / Raise Lifetime-Error
  ENDIF.
ENDMETHOD.


METHOD FREE.

* ():
* Check Object
  IF H_CONTROL IS INITIAL.
    EXIT.                              "// its already free
*   RAISE CNTL_ERROR.
  ENDIF.

* TODO: LIFETIME-Management
* Call Remove_Object anyway
  CLASS CL_GUI_CFW DEFINITION LOAD.
  CALL METHOD CL_GUI_CFW=>REMOVE_OBJECT
    EXPORTING
      REF = ME.
* Call also in CL_GUI_CONTROL
  call method cl_gui_cfw=>unregister_cached_control
       exporting control = me.

  FREE OBJECT H_CONTROL-OBJ NO FLUSH.
* FLUSH / Exceptionhandling ??
  CLEAR: H_CONTROL.
ENDMETHOD.


METHOD GET_CACHE_PROP.
*+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
* Read a property from the cache
*+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

  FIELD-SYMBOLS: <FCACHEDPROP> TYPE TY_PROPCACHEENTRY.

  class cl_gui_cfw definition load.

  IF PROPNAME IS INITIAL.
    RAISE INVALID_NAME.
  ENDIF.
  IF PROP_CACHE_SUPPORTED NE 'X'.
    RAISE CACHE_NOT_INIT.
  ENDIF.
  if  not cl_gui_cfw=>is_cache_valid( control = me ) is initial.
    READ TABLE PROPERTY_CACHE WITH TABLE KEY PROPNAME = PROPNAME
                                             ASSIGNING <FCACHEDPROP>.
*    IF SY-SUBRC EQ 0 AND <FCACHEDPROP>-VALIDKEY <> 0.
    IF SY-SUBRC EQ 0.
      PROPVALUE = <FCACHEDPROP>-PROPVALUE.
      EXIT.
    ENDIF.
  endif.
  RAISE PROP_NOT_FOUND.

ENDMETHOD.


METHOD GET_PROPERTY.

* (PROPERTY, P1..P16, P_COUNT, QUEUE_ONLY; => VALUE)
* check handle
  DATA : STRPROPNAME TYPE STRING.
  DATA : STRVALUE TYPE STRING.
  DATA : QUEUE_EMPTY TYPE CHAR01.

  class cl_gui_cfw definition load.

  IF ME->H_CONTROL IS INITIAL.
    RAISE CNTL_ERROR.
  ENDIF.
* check for cached property access
  IF  PROP_CACHE_SUPPORTED = 'X' AND
    QUEUE_ONLY IS INITIAL AND P_COUNT = 0.
    if not cl_gui_cfw=>is_cache_valid( control = me ) is initial.

** no longer necessary because we have %_ctl_at_exit in sapmssyd. diag
** xml data is processed there (this was introduced with release 5.0)

**    CALL FUNCTION 'AC_IS_QUEUE_EMPTY'
**         CHANGING
**              IS_QUEUE_EMPTY = QUEUE_EMPTY.
**    IF QUEUE_EMPTY = 'X'.
** In case of exit commands the data change propagation
** has not proccess data until now. In all other cases
** this call has no effect.
*
*      perform handle_diag_input_data in program SAPFGUICNTL.



* modified 07. June. 00  activate at exit version
* modified 15. May. 00 46D Sp01
*
* reason : since we have modified the cache invalidation
* strategy with 4.6C it is possible, that the cache remains
* valid after a call to SetProperty or callMethod. In that
* case a later call to get property would dispatch the xml
* property bag and overwrite the already modifed values. -->
* Just dispatch values here and do not change the valid state
* of the cache.
*
* The same call is coded into setProperty to avoid cache overwrites
*
* IMPORTANT : this code is only here, because it should be tested
* til end of June 2000, because it is also inserted in Hotpackages 46C/D
* Afterwards must be deleted and the xml dispatch call in
* sapmssyd %Ctrl_at_exit has to be activated
*
*
*      call method CL_GUI_DATAMANAGER=>ON_INPUT
*                      exceptions others = 1.
*      if sy-subrc ne 0.
*       perform  handle_data_stream_error in program sapfguicntl.
*      endif.


      STRPROPNAME = PROPERTY.
      CALL METHOD GET_CACHE_PROP EXPORTING
                                    PROPNAME = STRPROPNAME
                                          IMPORTING
                                    PROPVALUE = STRVALUE
                                          EXCEPTIONS
                                    OTHERS = 1.
      IF SY-SUBRC = 0.
        VALUE = STRVALUE.
        EXIT.
      ENDIF.
    ENDIF.
  ENDIF.

  IF QUEUE_ONLY IS INITIAL.
* result will be transported back to application
    CASE P_COUNT.
      WHEN 0.
        GET PROPERTY OF H_CONTROL-OBJ PROPERTY = VALUE NO FLUSH.
      WHEN 1.
        GET PROPERTY OF H_CONTROL-OBJ PROPERTY = VALUE NO FLUSH
          EXPORTING #1 = P1.
      WHEN 2.
        GET PROPERTY OF H_CONTROL-OBJ PROPERTY = VALUE NO FLUSH
          EXPORTING #1 = P1
                    #2 = P2.
      WHEN 3.
        GET PROPERTY OF H_CONTROL-OBJ PROPERTY = VALUE NO FLUSH
          EXPORTING #1 = P1
                    #2 = P2
                    #3 = P3.
      WHEN 4.
        GET PROPERTY OF H_CONTROL-OBJ PROPERTY = VALUE NO FLUSH
          EXPORTING #1 = P1
                    #2 = P2
                    #3 = P3
                    #4 = P4.
      WHEN 5.
        GET PROPERTY OF H_CONTROL-OBJ PROPERTY = VALUE NO FLUSH
          EXPORTING #1 = P1
                    #2 = P2
                    #3 = P3
                    #4 = P4
                    #5 = P5.
      WHEN 6.
        GET PROPERTY OF H_CONTROL-OBJ PROPERTY = VALUE NO FLUSH
          EXPORTING #1 = P1
                    #2 = P2
                    #3 = P3
                    #4 = P4
                    #5 = P5
                    #6 = P6.
      WHEN 7.
        GET PROPERTY OF H_CONTROL-OBJ PROPERTY = VALUE NO FLUSH
          EXPORTING #1 = P1
                    #2 = P2
                    #3 = P3
                    #4 = P4
                    #5 = P5
                    #6 = P6
                    #7 = P7.
      WHEN 8.
        GET PROPERTY OF H_CONTROL-OBJ PROPERTY = VALUE NO FLUSH
          EXPORTING #1 = P1
                    #2 = P2
                    #3 = P3
                    #4 = P4
                    #5 = P5
                    #6 = P6
                    #7 = P7
                    #8 = P8.
      WHEN 9.
        GET PROPERTY OF H_CONTROL-OBJ PROPERTY = VALUE NO FLUSH
          EXPORTING #1 = P1
                    #2 = P2
                    #3 = P3
                    #4 = P4
                    #5 = P5
                    #6 = P6
                    #7 = P7
                    #8 = P8
                    #9 = P9.
      WHEN 10.
        GET PROPERTY OF H_CONTROL-OBJ PROPERTY = VALUE NO FLUSH
          EXPORTING #1 = P1
                    #2 = P2
                    #3 = P3
                    #4 = P4
                    #5 = P5
                    #6 = P6
                    #7 = P7
                    #8 = P8
                    #9 = P9
                   #10 = P10.
      WHEN 11.
        GET PROPERTY OF H_CONTROL-OBJ PROPERTY = VALUE NO FLUSH
          EXPORTING #1 = P1
                    #2 = P2
                    #3 = P3
                    #4 = P4
                    #5 = P5
                    #6 = P6
                    #7 = P7
                    #8 = P8
                    #9 = P9
                   #10 = P10
                   #11 = P11.
      WHEN 12.
        GET PROPERTY OF H_CONTROL-OBJ PROPERTY = VALUE NO FLUSH
          EXPORTING #1 = P1
                    #2 = P2
                    #3 = P3
                    #4 = P4
                    #5 = P5
                    #6 = P6
                    #7 = P7
                    #8 = P8
                    #9 = P9
                   #10 = P10
                   #11 = P11
                   #12 = P12.
      WHEN 13.
        GET PROPERTY OF H_CONTROL-OBJ PROPERTY = VALUE NO FLUSH
          EXPORTING #1 = P1
                    #2 = P2
                    #3 = P3
                    #4 = P4
                    #5 = P5
                    #6 = P6
                    #7 = P7
                    #8 = P8
                    #9 = P9
                   #10 = P10
                   #11 = P11
                   #12 = P12
                   #13 = P13.
      WHEN 14.
        GET PROPERTY OF H_CONTROL-OBJ PROPERTY = VALUE NO FLUSH
          EXPORTING #1 = P1
                    #2 = P2
                    #3 = P3
                    #4 = P4
                    #5 = P5
                    #6 = P6
                    #7 = P7
                    #8 = P8
                    #9 = P9
                   #10 = P10
                   #11 = P11
                   #12 = P12
                   #13 = P13
                   #14 = P14.
      WHEN 15.
        GET PROPERTY OF H_CONTROL-OBJ PROPERTY = VALUE NO FLUSH
          EXPORTING #1 = P1
                    #2 = P2
                    #3 = P3
                    #4 = P4
                    #5 = P5
                    #6 = P6
                    #7 = P7
                    #8 = P8
                    #9 = P9
                   #10 = P10
                   #11 = P11
                   #12 = P12
                   #13 = P13
                   #14 = P14
                   #15 = P15.
      WHEN 16.
        GET PROPERTY OF H_CONTROL-OBJ PROPERTY = VALUE NO FLUSH
          EXPORTING #1 = P1
                    #2 = P2
                    #3 = P3
                    #4 = P4
                    #5 = P5
                    #6 = P6
                    #7 = P7
                    #8 = P8
                    #9 = P9
                   #10 = P10
                   #11 = P11
                   #12 = P12
                   #13 = P13
                   #14 = P14
                   #15 = P15
                   #16 = P16.
    ENDCASE.
  ELSE.                                "// queue_only
* result will not be transported back to application
    CASE P_COUNT.
      WHEN 0.
      GET PROPERTY OF H_CONTROL-OBJ PROPERTY = VALUE NO FLUSH QUEUEONLY.
      WHEN 1.
      GET PROPERTY OF H_CONTROL-OBJ PROPERTY = VALUE NO FLUSH QUEUEONLY
                    EXPORTING #1 = P1.
      WHEN 2.
      GET PROPERTY OF H_CONTROL-OBJ PROPERTY = VALUE NO FLUSH QUEUEONLY
                    EXPORTING #1 = P1
                              #2 = P2.
      WHEN 3.
      GET PROPERTY OF H_CONTROL-OBJ PROPERTY = VALUE NO FLUSH QUEUEONLY
                    EXPORTING #1 = P1
                              #2 = P2
                              #3 = P3.
      WHEN 4.
      GET PROPERTY OF H_CONTROL-OBJ PROPERTY = VALUE NO FLUSH QUEUEONLY
                    EXPORTING #1 = P1
                              #2 = P2
                              #3 = P3
                              #4 = P4.
      WHEN 5.
      GET PROPERTY OF H_CONTROL-OBJ PROPERTY = VALUE NO FLUSH QUEUEONLY
                    EXPORTING #1 = P1
                              #2 = P2
                              #3 = P3
                              #4 = P4
                              #5 = P5.
      WHEN 6.
      GET PROPERTY OF H_CONTROL-OBJ PROPERTY = VALUE NO FLUSH QUEUEONLY
                    EXPORTING #1 = P1
                              #2 = P2
                              #3 = P3
                              #4 = P4
                              #5 = P5
                              #6 = P6.
      WHEN 7.
      GET PROPERTY OF H_CONTROL-OBJ PROPERTY = VALUE NO FLUSH QUEUEONLY
                    EXPORTING #1 = P1
                              #2 = P2
                              #3 = P3
                              #4 = P4
                              #5 = P5
                              #6 = P6
                              #7 = P7.
      WHEN 8.
      GET PROPERTY OF H_CONTROL-OBJ PROPERTY = VALUE NO FLUSH QUEUEONLY
                    EXPORTING #1 = P1
                              #2 = P2
                              #3 = P3
                              #4 = P4
                              #5 = P5
                              #6 = P6
                              #7 = P7
                              #8 = P8.
      WHEN 9.
      GET PROPERTY OF H_CONTROL-OBJ PROPERTY = VALUE NO FLUSH QUEUEONLY
                    EXPORTING #1 = P1
                              #2 = P2
                              #3 = P3
                              #4 = P4
                              #5 = P5
                              #6 = P6
                              #7 = P7
                              #8 = P8
                              #9 = P9.
      WHEN 10.
      GET PROPERTY OF H_CONTROL-OBJ PROPERTY = VALUE NO FLUSH QUEUEONLY
                    EXPORTING #1 = P1
                              #2 = P2
                              #3 = P3
                              #4 = P4
                              #5 = P5
                              #6 = P6
                              #7 = P7
                              #8 = P8
                              #9 = P9
                             #10 = P10.
      WHEN 11.
      GET PROPERTY OF H_CONTROL-OBJ PROPERTY = VALUE NO FLUSH QUEUEONLY
                    EXPORTING #1 = P1
                              #2 = P2
                              #3 = P3
                              #4 = P4
                              #5 = P5
                              #6 = P6
                              #7 = P7
                              #8 = P8
                              #9 = P9
                             #10 = P10
                             #11 = P11.
      WHEN 12.
      GET PROPERTY OF H_CONTROL-OBJ PROPERTY = VALUE NO FLUSH QUEUEONLY
                    EXPORTING #1 = P1
                              #2 = P2
                              #3 = P3
                              #4 = P4
                              #5 = P5
                              #6 = P6
                              #7 = P7
                              #8 = P8
                              #9 = P9
                             #10 = P10
                             #11 = P11
                             #12 = P12.
      WHEN 13.
      GET PROPERTY OF H_CONTROL-OBJ PROPERTY = VALUE NO FLUSH QUEUEONLY
                    EXPORTING #1 = P1
                              #2 = P2
                              #3 = P3
                              #4 = P4
                              #5 = P5
                              #6 = P6
                              #7 = P7
                              #8 = P8
                              #9 = P9
                             #10 = P10
                             #11 = P11
                             #12 = P12
                             #13 = P13.
      WHEN 14.
      GET PROPERTY OF H_CONTROL-OBJ PROPERTY = VALUE NO FLUSH QUEUEONLY
                    EXPORTING #1 = P1
                              #2 = P2
                              #3 = P3
                              #4 = P4
                              #5 = P5
                              #6 = P6
                              #7 = P7
                              #8 = P8
                              #9 = P9
                             #10 = P10
                             #11 = P11
                             #12 = P12
                             #13 = P13
                             #14 = P14.
      WHEN 15.
      GET PROPERTY OF H_CONTROL-OBJ PROPERTY = VALUE NO FLUSH QUEUEONLY
                    EXPORTING #1 = P1
                              #2 = P2
                              #3 = P3
                              #4 = P4
                              #5 = P5
                              #6 = P6
                              #7 = P7
                              #8 = P8
                              #9 = P9
                             #10 = P10
                             #11 = P11
                             #12 = P12
                             #13 = P13
                             #14 = P14
                             #15 = P15.
      WHEN 16.
      GET PROPERTY OF H_CONTROL-OBJ PROPERTY = VALUE NO FLUSH QUEUEONLY
                    EXPORTING #1 = P1
                              #2 = P2
                              #3 = P3
                              #4 = P4
                              #5 = P5
                              #6 = P6
                              #7 = P7
                              #8 = P8
                              #9 = P9
                             #10 = P10
                             #11 = P11
                             #12 = P12
                             #13 = P13
                             #14 = P14
                             #15 = P15
                             #16 = P16.
    ENDCASE.
  ENDIF.                               "// queue_only
* Errorhandling
  CASE SY-SUBRC.
    WHEN 0.
    WHEN 1.
      RAISE CNTL_SYSTEM_ERROR.
    WHEN 2.
      RAISE CNTL_ERROR.
    WHEN OTHERS.
      RAISE CNTL_SYSTEM_ERROR.
  ENDCASE.
ENDMETHOD.


METHOD GET_PROPERTY_GUI_OBJECT .

* (PROPERTY, P1..P16, P_COUNT, QUEUE_ONLY; => VALUE)
* check handle
  IF ME->H_CONTROL IS INITIAL.
    RAISE CNTL_ERROR.
  ENDIF.

  IF VALUE_AS_GUI_OBJECT IS INITIAL.
    RAISE CNTL_ERROR.
  ENDIF.

  IF QUEUE_ONLY IS INITIAL.
* result will be transported back to application
    CASE P_COUNT.
      WHEN 0.
        GET PROPERTY OF H_CONTROL-OBJ PROPERTY =
          VALUE_AS_GUI_OBJECT->H_CONTROL-OBJ NO FLUSH.
      WHEN 1.
        GET PROPERTY OF H_CONTROL-OBJ PROPERTY =
          VALUE_AS_GUI_OBJECT->H_CONTROL-OBJ NO FLUSH
          EXPORTING #1 = P1.
      WHEN 2.
        GET PROPERTY OF H_CONTROL-OBJ PROPERTY =
          VALUE_AS_GUI_OBJECT->H_CONTROL-OBJ NO FLUSH
          EXPORTING #1 = P1
                    #2 = P2.
      WHEN 3.
        GET PROPERTY OF H_CONTROL-OBJ PROPERTY =
          VALUE_AS_GUI_OBJECT->H_CONTROL-OBJ NO FLUSH
          EXPORTING #1 = P1
                    #2 = P2
                    #3 = P3.
      WHEN 4.
        GET PROPERTY OF H_CONTROL-OBJ PROPERTY =
          VALUE_AS_GUI_OBJECT->H_CONTROL-OBJ NO FLUSH
          EXPORTING #1 = P1
                    #2 = P2
                    #3 = P3
                    #4 = P4.
      WHEN 5.
        GET PROPERTY OF H_CONTROL-OBJ PROPERTY =
          VALUE_AS_GUI_OBJECT->H_CONTROL-OBJ NO FLUSH
          EXPORTING #1 = P1
                    #2 = P2
                    #3 = P3
                    #4 = P4
                    #5 = P5.
      WHEN 6.
        GET PROPERTY OF H_CONTROL-OBJ PROPERTY =
          VALUE_AS_GUI_OBJECT->H_CONTROL-OBJ NO FLUSH
          EXPORTING #1 = P1
                    #2 = P2
                    #3 = P3
                    #4 = P4
                    #5 = P5
                    #6 = P6.
      WHEN 7.
        GET PROPERTY OF H_CONTROL-OBJ PROPERTY =
          VALUE_AS_GUI_OBJECT->H_CONTROL-OBJ NO FLUSH
          EXPORTING #1 = P1
                    #2 = P2
                    #3 = P3
                    #4 = P4
                    #5 = P5
                    #6 = P6
                    #7 = P7.
      WHEN 8.
        GET PROPERTY OF H_CONTROL-OBJ PROPERTY =
          VALUE_AS_GUI_OBJECT->H_CONTROL-OBJ NO FLUSH
          EXPORTING #1 = P1
                    #2 = P2
                    #3 = P3
                    #4 = P4
                    #5 = P5
                    #6 = P6
                    #7 = P7
                    #8 = P8.
      WHEN 9.
        GET PROPERTY OF H_CONTROL-OBJ PROPERTY =
          VALUE_AS_GUI_OBJECT->H_CONTROL-OBJ NO FLUSH
          EXPORTING #1 = P1
                    #2 = P2
                    #3 = P3
                    #4 = P4
                    #5 = P5
                    #6 = P6
                    #7 = P7
                    #8 = P8
                    #9 = P9.
      WHEN 10.
        GET PROPERTY OF H_CONTROL-OBJ PROPERTY =
          VALUE_AS_GUI_OBJECT->H_CONTROL-OBJ NO FLUSH
          EXPORTING #1 = P1
                    #2 = P2
                    #3 = P3
                    #4 = P4
                    #5 = P5
                    #6 = P6
                    #7 = P7
                    #8 = P8
                    #9 = P9
                   #10 = P10.
      WHEN 11.
        GET PROPERTY OF H_CONTROL-OBJ PROPERTY =
          VALUE_AS_GUI_OBJECT->H_CONTROL-OBJ NO FLUSH
          EXPORTING #1 = P1
                    #2 = P2
                    #3 = P3
                    #4 = P4
                    #5 = P5
                    #6 = P6
                    #7 = P7
                    #8 = P8
                    #9 = P9
                   #10 = P10
                   #11 = P11.
      WHEN 12.
        GET PROPERTY OF H_CONTROL-OBJ PROPERTY =
          VALUE_AS_GUI_OBJECT->H_CONTROL-OBJ NO FLUSH
          EXPORTING #1 = P1
                    #2 = P2
                    #3 = P3
                    #4 = P4
                    #5 = P5
                    #6 = P6
                    #7 = P7
                    #8 = P8
                    #9 = P9
                   #10 = P10
                   #11 = P11
                   #12 = P12.
      WHEN 13.
        GET PROPERTY OF H_CONTROL-OBJ PROPERTY =
          VALUE_AS_GUI_OBJECT->H_CONTROL-OBJ NO FLUSH
          EXPORTING #1 = P1
                    #2 = P2
                    #3 = P3
                    #4 = P4
                    #5 = P5
                    #6 = P6
                    #7 = P7
                    #8 = P8
                    #9 = P9
                   #10 = P10
                   #11 = P11
                   #12 = P12
                   #13 = P13.
      WHEN 14.
        GET PROPERTY OF H_CONTROL-OBJ PROPERTY =
          VALUE_AS_GUI_OBJECT->H_CONTROL-OBJ NO FLUSH
          EXPORTING #1 = P1
                    #2 = P2
                    #3 = P3
                    #4 = P4
                    #5 = P5
                    #6 = P6
                    #7 = P7
                    #8 = P8
                    #9 = P9
                   #10 = P10
                   #11 = P11
                   #12 = P12
                   #13 = P13
                   #14 = P14.
      WHEN 15.
        GET PROPERTY OF H_CONTROL-OBJ PROPERTY =
          VALUE_AS_GUI_OBJECT->H_CONTROL-OBJ NO FLUSH
          EXPORTING #1 = P1
                    #2 = P2
                    #3 = P3
                    #4 = P4
                    #5 = P5
                    #6 = P6
                    #7 = P7
                    #8 = P8
                    #9 = P9
                   #10 = P10
                   #11 = P11
                   #12 = P12
                   #13 = P13
                   #14 = P14
                   #15 = P15.
      WHEN 16.
        GET PROPERTY OF H_CONTROL-OBJ PROPERTY =
          VALUE_AS_GUI_OBJECT->H_CONTROL-OBJ NO FLUSH
          EXPORTING #1 = P1
                    #2 = P2
                    #3 = P3
                    #4 = P4
                    #5 = P5
                    #6 = P6
                    #7 = P7
                    #8 = P8
                    #9 = P9
                   #10 = P10
                   #11 = P11
                   #12 = P12
                   #13 = P13
                   #14 = P14
                   #15 = P15
                   #16 = P16.
    ENDCASE.
  ELSE.
* RESULT WILL NOT BE TRANSPORTED BACK TO APPLICATION
    CASE P_COUNT.
      WHEN 0.
        GET PROPERTY OF H_CONTROL-OBJ PROPERTY =
          VALUE_AS_GUI_OBJECT->H_CONTROL-OBJ NO FLUSH QUEUE-ONLY.
      WHEN 1.
        GET PROPERTY OF H_CONTROL-OBJ PROPERTY =
          VALUE_AS_GUI_OBJECT->H_CONTROL-OBJ NO FLUSH QUEUE-ONLY
          EXPORTING #1 = P1.
      WHEN 2.
        GET PROPERTY OF H_CONTROL-OBJ PROPERTY =
         VALUE_AS_GUI_OBJECT->H_CONTROL-OBJ NO FLUSH QUEUE-ONLY
         EXPORTING #1 = P1
                   #2 = P2.
      WHEN 3.
        GET PROPERTY OF H_CONTROL-OBJ PROPERTY =
          VALUE_AS_GUI_OBJECT->H_CONTROL-OBJ NO FLUSH QUEUE-ONLY
          EXPORTING #1 = P1
                    #2 = P2
                    #3 = P3.
      WHEN 4.
        GET PROPERTY OF H_CONTROL-OBJ PROPERTY =
           VALUE_AS_GUI_OBJECT->H_CONTROL-OBJ NO FLUSH QUEUE-ONLY
           EXPORTING #1 = P1
                     #2 = P2
                     #3 = P3
                     #4 = P4.
      WHEN 5.
        GET PROPERTY OF H_CONTROL-OBJ PROPERTY =
          VALUE_AS_GUI_OBJECT->H_CONTROL-OBJ NO FLUSH QUEUE-ONLY
          EXPORTING #1 = P1
                    #2 = P2
                    #3 = P3
                    #4 = P4
                    #5 = P5.
      WHEN 6.
        GET PROPERTY OF H_CONTROL-OBJ PROPERTY =
          VALUE_AS_GUI_OBJECT->H_CONTROL-OBJ NO FLUSH QUEUE-ONLY
          EXPORTING #1 = P1
                    #2 = P2
                    #3 = P3
                    #4 = P4
                    #5 = P5
                    #6 = P6.
      WHEN 7.
        GET PROPERTY OF H_CONTROL-OBJ PROPERTY =
          VALUE_AS_GUI_OBJECT->H_CONTROL-OBJ NO FLUSH QUEUE-ONLY
          EXPORTING #1 = P1
                    #2 = P2
                    #3 = P3
                    #4 = P4
                    #5 = P5
                    #6 = P6
                    #7 = P7.
      WHEN 8.
        GET PROPERTY OF H_CONTROL-OBJ PROPERTY =
          VALUE_AS_GUI_OBJECT->H_CONTROL-OBJ NO FLUSH QUEUE-ONLY
          EXPORTING #1 = P1
                    #2 = P2
                    #3 = P3
                    #4 = P4
                    #5 = P5
                    #6 = P6
                    #7 = P7
                    #8 = P8.
      WHEN 9.
        GET PROPERTY OF H_CONTROL-OBJ PROPERTY =
          VALUE_AS_GUI_OBJECT->H_CONTROL-OBJ NO FLUSH QUEUE-ONLY
          EXPORTING #1 = P1
                    #2 = P2
                    #3 = P3
                    #4 = P4
                    #5 = P5
                    #6 = P6
                    #7 = P7
                    #8 = P8
                    #9 = P9.
      WHEN 10.
        GET PROPERTY OF H_CONTROL-OBJ PROPERTY =
          VALUE_AS_GUI_OBJECT->H_CONTROL-OBJ NO FLUSH QUEUE-ONLY
          EXPORTING #1 = P1
                    #2 = P2
                    #3 = P3
                    #4 = P4
                    #5 = P5
                    #6 = P6
                    #7 = P7
                    #8 = P8
                    #9 = P9
                   #10 = P10.
      WHEN 11.
        GET PROPERTY OF H_CONTROL-OBJ PROPERTY =
          VALUE_AS_GUI_OBJECT->H_CONTROL-OBJ NO FLUSH QUEUE-ONLY
          EXPORTING #1 = P1
                    #2 = P2
                    #3 = P3
                    #4 = P4
                    #5 = P5
                    #6 = P6
                    #7 = P7
                    #8 = P8
                    #9 = P9
                   #10 = P10
                   #11 = P11.
      WHEN 12.
        GET PROPERTY OF H_CONTROL-OBJ PROPERTY =
          VALUE_AS_GUI_OBJECT->H_CONTROL-OBJ NO FLUSH QUEUE-ONLY
          EXPORTING #1 = P1
                    #2 = P2
                    #3 = P3
                    #4 = P4
                    #5 = P5
                    #6 = P6
                    #7 = P7
                    #8 = P8
                    #9 = P9
                   #10 = P10
                   #11 = P11
                   #12 = P12.
      WHEN 13.
        GET PROPERTY OF H_CONTROL-OBJ PROPERTY =
          VALUE_AS_GUI_OBJECT->H_CONTROL-OBJ NO FLUSH QUEUE-ONLY
          EXPORTING #1 = P1
                    #2 = P2
                    #3 = P3
                    #4 = P4
                    #5 = P5
                    #6 = P6
                    #7 = P7
                    #8 = P8
                    #9 = P9
                   #10 = P10
                   #11 = P11
                   #12 = P12
                   #13 = P13.
      WHEN 14.
        GET PROPERTY OF H_CONTROL-OBJ PROPERTY =
          VALUE_AS_GUI_OBJECT->H_CONTROL-OBJ NO FLUSH QUEUE-ONLY
          EXPORTING #1 = P1
                    #2 = P2
                    #3 = P3
                    #4 = P4
                    #5 = P5
                    #6 = P6
                    #7 = P7
                    #8 = P8
                    #9 = P9
                   #10 = P10
                   #11 = P11
                   #12 = P12
                   #13 = P13
                   #14 = P14.
      WHEN 15.
        GET PROPERTY OF H_CONTROL-OBJ PROPERTY =
          VALUE_AS_GUI_OBJECT->H_CONTROL-OBJ NO FLUSH QUEUE-ONLY
          EXPORTING #1 = P1
                    #2 = P2
                    #3 = P3
                    #4 = P4
                    #5 = P5
                    #6 = P6
                    #7 = P7
                    #8 = P8
                    #9 = P9
                   #10 = P10
                   #11 = P11
                   #12 = P12
                   #13 = P13
                   #14 = P14
                   #15 = P15.
      WHEN 16.
        GET PROPERTY OF H_CONTROL-OBJ PROPERTY =
          VALUE_AS_GUI_OBJECT->H_CONTROL-OBJ NO FLUSH QUEUE-ONLY
          EXPORTING #1 = P1
                    #2 = P2
                    #3 = P3
                    #4 = P4
                    #5 = P5
                    #6 = P6
                    #7 = P7
                    #8 = P8
                    #9 = P9
                   #10 = P10
                   #11 = P11
                   #12 = P12
                   #13 = P13
                   #14 = P14
                   #15 = P15
                   #16 = P16.
    ENDCASE.
  ENDIF.
* 'touch' the handle
  VALUE_AS_GUI_OBJECT->H_CONTROL-HANDLE_TYPE = 'NO_OCX'.

* Errorhandling
  CASE SY-SUBRC.
    WHEN 0.
    WHEN 1.
      RAISE CNTL_SYSTEM_ERROR.
    WHEN 2.
      RAISE CNTL_ERROR.
    WHEN OTHERS.
      RAISE CNTL_SYSTEM_ERROR.
  ENDCASE.
ENDMETHOD.


METHOD IF_CACHED_PROP~GET_NEXT_PROP.
  RAISE NO_MORE_PROPS.
ENDMETHOD.


method IF_CACHED_PROP~SEEK_FIRST_PROP.
   PROP_CACHE_CURSOR = 1.
endmethod.


METHOD IF_CACHED_PROP~SET_PROP.

  IF PROPNAME IS INITIAL.
    RAISE INVALID_NAME.
  ENDIF.
  IF PROP_CACHE_SUPPORTED <> 'X'.
    RAISE ERROR_SET_PROPERTY.
  ENDIF.

  CALL METHOD SET_CACHE_PROP EXPORTING
                                PROPNAME = PROPNAME
                                PROPVALUE = PROPVALUE
                              EXCEPTIONS
                                INVALID_NAME = 1
                                PROP_NOT_FOUND = 2
                                OTHERS = 3.
  IF SY-SUBRC NE 0.
    CASE SY-SUBRC.
      WHEN 1. RAISE INVALID_NAME.
      WHEN 2. RAISE PROP_NOT_FOUND.
      WHEN OTHERS. RAISE ERROR_SET_PROPERTY.
    ENDCASE.
  ENDIF.
ENDMETHOD.


method INVALIDATE_CACHE.
* ...
  call method cl_gui_cfw=>invalidate_cache
       exporting control = me.

endmethod.


METHOD IS_CACHED_PROP.
  IF PROP_CACHE_SUPPORTED NE 'X'.
    RAISE CACHE_NOT_INIT.
  ENDIF.
  READ TABLE PROPERTY_CACHE WITH TABLE KEY PROPNAME = PROPNAME
                               TRANSPORTING NO FIELDS.
  IF SY-SUBRC EQ 0.
    IS_IN_CACHE = 'X'.
  ELSE.
    CLEAR IS_IN_CACHE.
  ENDIF.
ENDMETHOD.


method IS_CACHE_VALID.
* ...
  IF PROP_CACHE_SUPPORTED is initial.
    clear valid.
    exit.
  endif.
  valid = cl_gui_cfw=>is_cache_valid( control = me ).

endmethod.


METHOD IS_VALID.

* check for valid frontend-object
  IF H_CONTROL-OBJ-HANDLE IS INITIAL.
    RESULT = 0.
  ELSE.
    RESULT = 1.
  ENDIF.
ENDMETHOD.



























METHOD REMOVE_CACHE_PROP.
*+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
* Remove a property from property cache
*+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

* Do parameter checking
  IF PROPNAME IS INITIAL.
    RAISE INVALID_NAME.
  ENDIF.
  IF PROP_CACHE_SUPPORTED NE 'X'.
    RAISE CACHE_NOT_INIT.
  ENDIF.
  DELETE TABLE PROPERTY_CACHE WITH TABLE KEY PROPNAME = PROPNAME.
  IF SY-SUBRC NE 0.
    RAISE PROP_NOT_FOUND.
  ENDIF.
  if property_cache is initial.
    call method cl_gui_cfw=>unregister_cached_control
         exporting control = me.
  endif.

ENDMETHOD.


METHOD SET_CACHE_PROP.
*+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
* Store a property in the cache
*+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

  FIELD-SYMBOLS: <FCACHEDPROP> TYPE TY_PROPCACHEENTRY.
  IF PROPNAME IS INITIAL.
    RAISE INVALID_NAME.
  ENDIF.
  IF PROP_CACHE_SUPPORTED NE 'X'.
    RAISE CACHE_NOT_INIT.
  ENDIF.
  READ TABLE PROPERTY_CACHE WITH TABLE KEY PROPNAME = PROPNAME
                                         ASSIGNING <FCACHEDPROP>.
  IF SY-SUBRC EQ 0.
    <FCACHEDPROP>-PROPVALUE = PROPVALUE.
*    <FCACHEDPROP>-VALIDKEY = CUR_CACHE_KEY.
    EXIT.
  ENDIF.
  RAISE PROP_NOT_FOUND.

ENDMETHOD.


METHOD SET_PROPERTY.

  DATA STRPROPNAME TYPE STRING.
  DATA STRVALUE TYPE STRING.
  data l_oldstrvalue type string.
* (PROPERTY, P1..P16, P_COUNT, VALUE)
* check handle
  IF ME->H_CONTROL IS INITIAL.
    RAISE CNTL_ERROR.
  ENDIF.

  if not PROP_CACHE_SUPPORTED is initial and p_count = 0.
    STRPROPNAME = PROPERTY.

*   special unicode handling....... start
*    IF SY-UNAME <> 'LAYERK'.
      DATA: ref TYPE ref to cl_abap_typedescr.

*     check for OLE2_OBJECT
      ref = cl_abap_typedescr=>describe_by_data( VALUE ).

      IF ref->absolute_name = '\TYPE-POOL=OLE2\TYPE=OLE2_OBJECT' OR
         ref->absolute_name = '\TYPE-POOL=CNTL\TYPE=CNTL_HANDLE' OR
         ref->absolute_name = '\TYPE=OBJ_RECORD'.
        FIELD-SYMBOLS: <MY_X1> TYPE C.
        ASSIGN VALUE TO <MY_X1> CASTING.
        MOVE <MY_X1> TO STRVALUE.
      ELSE.
        STRVALUE = VALUE.
      ENDIF.
*    ELSE.
*      STRVALUE = VALUE.
*    ENDIF.
*   ...............................end



* modified 07. June. 00  activate at exit version
* modified 15. May. 00 46D Sp01
*
* reason : since we have modified the cache invalidation
* strategy with 4.6C it is possible, that the cache remains
* valid after a call to SetProperty or callMethod. In that
* case a later call to get property would dispatch the xml
* property bag and overwrite the already modifed values. -->
* Just dispatch values here and do not change the valid state
* of the cache.
*
* The same call is coded into setProperty to avoid cache overwrites
*
* IMPORTANT : this code is only here, because it should be tested
* til end of June 2000, because it is also inserted in Hotpackages 46C/D
* Afterwards must be deleted and the xml dispatch call in
* sapmssyd %Ctrl_at_exit has to be activated
*
*    call method CL_GUI_DATAMANAGER=>ON_INPUT
*                    exceptions others = 1.
*    if sy-subrc ne 0.
*      perform  handle_data_stream_error in program sapfguicntl.
*    endif.




    if not is_cache_valid( ) is initial.
      describe field value type sy-ftype.
      if sy-ftype = 'I'.
        if strvalue ca space.
          strvalue = strvalue(sy-fdpos).
        endif.

      elseif sy-ftype = cl_abap_typedescr=>typekind_int8.
        if strvalue ca space.
          strvalue = strvalue(sy-fdpos).
        endif.

      endif.
      call method get_cache_prop
           exporting propname  = STRPROPNAME
           importing PROPVALUE = l_oldstrvalue
           exceptions others   = 1.
      if sy-subrc = 0 and l_oldstrvalue = STRVALUE. " No change
        exit.
      endif.
    endif.
* check for cached property access
*  IF  PROP_CACHE_SUPPORTED = 'X' AND P_COUNT = 0 and KEEP_CACHE = 'X'.

    if not keep_cache is initial.
* Check whether queue is empty, otherwise cache is invalid
*    STRPROPNAME = PROPERTY.
*    STRVALUE = VALUE.
      CALL METHOD SET_CACHE_PROP EXPORTING
                                   PROPNAME = STRPROPNAME
                                   PROPVALUE = STRVALUE
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

  CASE P_COUNT.
    WHEN 0.
      SET PROPERTY OF H_CONTROL-OBJ PROPERTY = VALUE NO FLUSH.
    WHEN 1.
      SET PROPERTY OF H_CONTROL-OBJ PROPERTY = VALUE NO FLUSH
        EXPORTING #1 = P1.
    WHEN 2.
      SET PROPERTY OF H_CONTROL-OBJ PROPERTY = VALUE NO FLUSH
        EXPORTING #1 = P1
                  #2 = P2.
    WHEN 3.
      SET PROPERTY OF H_CONTROL-OBJ PROPERTY = VALUE NO FLUSH
        EXPORTING #1 = P1
                  #2 = P2
                  #3 = P3.
    WHEN 4.
      SET PROPERTY OF H_CONTROL-OBJ PROPERTY = VALUE NO FLUSH
        EXPORTING #1 = P1
                  #2 = P2
                  #3 = P3
                  #4 = P4.
    WHEN 5.
      SET PROPERTY OF H_CONTROL-OBJ PROPERTY = VALUE NO FLUSH
        EXPORTING #1 = P1
                  #2 = P2
                  #3 = P3
                  #4 = P4
                  #5 = P5.
    WHEN 6.
      SET PROPERTY OF H_CONTROL-OBJ PROPERTY = VALUE NO FLUSH
        EXPORTING #1 = P1
                  #2 = P2
                  #3 = P3
                  #4 = P4
                  #5 = P5
                  #6 = P6.
    WHEN 7.
      SET PROPERTY OF H_CONTROL-OBJ PROPERTY = VALUE NO FLUSH
        EXPORTING #1 = P1
                  #2 = P2
                  #3 = P3
                  #4 = P4
                  #5 = P5
                  #6 = P6
                  #7 = P7.
    WHEN 8.
      SET PROPERTY OF H_CONTROL-OBJ PROPERTY = VALUE NO FLUSH
        EXPORTING #1 = P1
                  #2 = P2
                  #3 = P3
                  #4 = P4
                  #5 = P5
                  #6 = P6
                  #7 = P7
                  #8 = P8.
    WHEN 9.
      SET PROPERTY OF H_CONTROL-OBJ PROPERTY = VALUE NO FLUSH
        EXPORTING #1 = P1
                  #2 = P2
                  #3 = P3
                  #4 = P4
                  #5 = P5
                  #6 = P6
                  #7 = P7
                  #8 = P8
                  #9 = P9.
    WHEN 10.
      SET PROPERTY OF H_CONTROL-OBJ PROPERTY = VALUE NO FLUSH
        EXPORTING #1 = P1
                  #2 = P2
                  #3 = P3
                  #4 = P4
                  #5 = P5
                  #6 = P6
                  #7 = P7
                  #8 = P8
                  #9 = P9
                 #10 = P10.
    WHEN 11.
      SET PROPERTY OF H_CONTROL-OBJ PROPERTY = VALUE NO FLUSH
        EXPORTING #1 = P1
                  #2 = P2
                  #3 = P3
                  #4 = P4
                  #5 = P5
                  #6 = P6
                  #7 = P7
                  #8 = P8
                  #9 = P9
                 #10 = P10
                 #11 = P11.
    WHEN 12.
      SET PROPERTY OF H_CONTROL-OBJ PROPERTY = VALUE NO FLUSH
        EXPORTING #1 = P1
                  #2 = P2
                  #3 = P3
                  #4 = P4
                  #5 = P5
                  #6 = P6
                  #7 = P7
                  #8 = P8
                  #9 = P9
                 #10 = P10
                 #11 = P11
                 #12 = P12.
    WHEN 13.
      SET PROPERTY OF H_CONTROL-OBJ PROPERTY = VALUE NO FLUSH
        EXPORTING #1 = P1
                  #2 = P2
                  #3 = P3
                  #4 = P4
                  #5 = P5
                  #6 = P6
                  #7 = P7
                  #8 = P8
                  #9 = P9
                 #10 = P10
                 #11 = P11
                 #12 = P12
                 #13 = P13.
    WHEN 14.
      SET PROPERTY OF H_CONTROL-OBJ PROPERTY = VALUE NO FLUSH
        EXPORTING #1 = P1
                  #2 = P2
                  #3 = P3
                  #4 = P4
                  #5 = P5
                  #6 = P6
                  #7 = P7
                  #8 = P8
                  #9 = P9
                 #10 = P10
                 #11 = P11
                 #12 = P12
                 #13 = P13
                 #14 = P14.
    WHEN 15.
      SET PROPERTY OF H_CONTROL-OBJ PROPERTY = VALUE NO FLUSH
        EXPORTING #1 = P1
                  #2 = P2
                  #3 = P3
                  #4 = P4
                  #5 = P5
                  #6 = P6
                  #7 = P7
                  #8 = P8
                  #9 = P9
                 #10 = P10
                 #11 = P11
                 #12 = P12
                 #13 = P13
                 #14 = P14
                 #15 = P15.
    WHEN 16.
      SET PROPERTY OF H_CONTROL-OBJ PROPERTY = VALUE NO FLUSH
        EXPORTING #1 = P1
                  #2 = P2
                  #3 = P3
                  #4 = P4
                  #5 = P5
                  #6 = P6
                  #7 = P7
                  #8 = P8
                  #9 = P9
                 #10 = P10
                 #11 = P11
                 #12 = P12
                 #13 = P13
                 #14 = P14
                 #15 = P15
                 #16 = P16.
  ENDCASE.
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


method VALIDATE_CACHE.
* ...
endmethod.
ENDCLASS.