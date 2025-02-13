class CL_ABAP_MEMORY_AREA definition
  public
  abstract
  create public .

public section.
*"* public components of class CL_ABAP_MEMORY_AREA
*"* do not include other source files here!!!

  constants DETACH_INFO_AREA type SHM_DETACH_INFO value 1109200103. "#EC NOTEXT
  constants DETACH_INFO_ATTACH type SHM_DETACH_INFO value 1109200104. "#EC NOTEXT
  constants DETACH_INFO_FREE type SHM_DETACH_INFO value 1109200107. "#EC NOTEXT
  constants DETACH_INFO_HANDLE type SHM_DETACH_INFO value 1109200102. "#EC NOTEXT
  constants DETACH_INFO_INVALIDATE type SHM_DETACH_INFO value 1109200105. "#EC NOTEXT
  constants DETACH_INFO_NOT_DETACHED type SHM_DETACH_INFO value 1109200101. "#EC NOTEXT
  constants DETACH_INFO_PROPAGATE type SHM_DETACH_INFO value 1109200106. "#EC NOTEXT

  type-pools ABAP .
  methods IS_SHARED
  abstract
    returning
      value(SHARED) type ABAP_BOOL .
  methods IS_VALID
  abstract
    returning
      value(VALID) type ABAP_BOOL .
  methods IS_ACTIVE_VERSION
  abstract
    returning
      value(ACTIVE_VERSION) type ABAP_BOOL .
  methods HAS_ACTIVE_PROPERTIES
  abstract
    returning
      value(ACTIVE_PROPERTIES) type ABAP_BOOL .
  methods GET_DETACH_INFO
  abstract
    returning
      value(DETACH_INFO) type SHM_DETACH_INFO .
  class-methods GET_HANDLE_BY_OREF
    importing
      !OREF type ref to OBJECT
    returning
      value(HANDLE) type ref to CL_ABAP_MEMORY_AREA
    raising
      CX_SHM_INITIAL_REFERENCE .
  class-methods GET_HANDLE_BY_DREF
    importing
      !DREF type ref to DATA
    returning
      value(HANDLE) type ref to CL_ABAP_MEMORY_AREA
    raising
      CX_SHM_INITIAL_REFERENCE .
  class-methods GET_HANDLE_BY_DATA
    importing
      !DATAOBJECT type ANY
    returning
      value(HANDLE) type ref to CL_ABAP_MEMORY_AREA .
protected section.
*"* protected components of class CL_ABAP_MEMORY_AREA
*"* do not include other source files here!!!

  class-methods _GET_HANDLE_BY_OREF
    importing
      !OREF type ref to OBJECT
    returning
      value(HANDLE) type ref to CL_ABAP_MEMORY_AREA .
  class-methods _GET_HANDLE_BY_DREF
    importing
      !DREF type ref to DATA
    returning
      value(HANDLE) type ref to CL_ABAP_MEMORY_AREA .
private section.
*"* private components of class CL_ABAP_MEMORY_AREA
*"* do not include other source files here!!!
ENDCLASS.



CLASS CL_ABAP_MEMORY_AREA IMPLEMENTATION.


METHOD get_handle_by_data.

  DATA:
    dref TYPE REF TO data.

  GET REFERENCE OF dataobject INTO dref.

  handle = _get_handle_by_dref( dref ).

  IF handle IS INITIAL.
*   we have to return the imode-handle
    handle = cl_imode_area=>get_imode_handle( ).
  ENDIF.

ENDMETHOD.


METHOD get_handle_by_dref.

  IF dref IS INITIAL.
    RAISE EXCEPTION TYPE cx_shm_initial_reference.
  ELSE.
    handle = _get_handle_by_dref( dref ).

    IF handle IS INITIAL.
*     we have to return the imode-handle
      handle = cl_imode_area=>get_imode_handle( ).
    ENDIF.
  ENDIF.

ENDMETHOD.


METHOD get_handle_by_oref.

  IF oref IS INITIAL.
    RAISE EXCEPTION TYPE cx_shm_initial_reference.
  ELSE.
    handle = _get_handle_by_oref( oref ).

    IF handle IS INITIAL.
*     we have to return the imode-handle
      handle = cl_imode_area=>get_imode_handle( ).
    ENDIF.
  ENDIF.

ENDMETHOD.


method _GET_HANDLE_BY_DREF by kernel module ab_ShmkmGetHandleByDref fail.
endmethod.


method _GET_HANDLE_BY_OREF by kernel module ab_ShmkmGetHandleByOref fail.
endmethod.
ENDCLASS.