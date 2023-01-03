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