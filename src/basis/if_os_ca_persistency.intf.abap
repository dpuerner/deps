*"* components of interface IF_OS_CA_PERSISTENCY
interface IF_OS_CA_PERSISTENCY
  public .


  methods GET_PERSISTENT_BY_OID
    importing
      !I_OID type OS_GUID
    returning
      value(RESULT) type ref to OBJECT
    raising
      CX_OS_OBJECT_NOT_FOUND
      CX_OS_CLASS_NOT_FOUND .
  methods GET_PERSISTENT_BY_KEY
    importing
      !I_KEY type ANY
    returning
      value(RESULT) type ref to OBJECT
    raising
      CX_OS_OBJECT_NOT_FOUND
      CX_OS_CLASS_NOT_FOUND .
  methods GET_PERSISTENT_BY_OID_TAB
    importing
      !I_OID_TAB type INDEX TABLE
    returning
      value(RESULT) type OSREFTAB
    raising
      CX_OS_OBJECT_NOT_FOUND .
  methods GET_PERSISTENT_BY_KEY_TAB
    importing
      !I_KEY_TAB type INDEX TABLE
    returning
      value(RESULT) type OSREFTAB
    raising
      CX_OS_OBJECT_NOT_FOUND .
  type-pools OSCON .
  interface IF_OS_QUERY_OPTIONS load .
  methods GET_PERSISTENT_BY_QUERY
    importing
      !I_QUERY type ref to IF_OS_QUERY
      !I_PARAMETER_TAB type OSDREFTAB optional
      !I_PAR1 type ANY optional
      !I_PAR2 type ANY optional
      !I_PAR3 type ANY optional
      !I_SUBCLASSES type OS_BOOLEAN default OSCON_FALSE
      !I_UPTO type I default 0
      !I_OPTIONS type IF_OS_QUERY_OPTIONS=>OPTIONS default IF_OS_QUERY_OPTIONS=>DEFAULT_OPTIONS
    returning
      value(RESULT) type OSREFTAB
    raising
      CX_OS_OBJECT_NOT_FOUND
      CX_OS_QUERY_ERROR .
endinterface.