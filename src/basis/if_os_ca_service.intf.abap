*"* components of interface IF_OS_CA_SERVICE
interface IF_OS_CA_SERVICE
  public .


  class-events AGENT_CREATED
    exporting
      value(AGENT) type ref to OBJECT
      value(CLASS_AGENT_NAME) type OBJNAME
      value(CLASS_AGENT_GUID) type OS_GUID
      value(CLASS_NAME) type OBJNAME
      value(CLASS_NAME_GUID) type OS_GUID
      value(CLASS_AGENT_VERSION) type CHAR8 optional .

  methods GET_OID_BY_REF
    importing
      !I_OBJECT type ref to OBJECT
    returning
      value(RESULT) type OS_GUID
    raising
      CX_OS_OBJECT_NOT_FOUND .
  type-pools OSCON .
  methods GET_REF_BY_OID
    importing
      !I_OID type OS_GUID
      !I_LOAD_STATE type OS_BOOLEAN default OSCON_FALSE
    returning
      value(RESULT) type ref to OBJECT .
  methods SAVE_IN_UPDATE_TASK
    importing
      !XCONTAINER type XSTRING optional .
  methods SAVE .
  methods PREPARE_FOR_TOP_TRANSACTION
    importing
      !I_INVALIDATE type OS_BOOLEAN .
  type-pools OSTYP .
  methods OM_SAVE
    importing
      !I_OBJECTS type OSTYP_REF_TAB .
  methods OM_PREPARE_FOR_TOP_TRANSACTION
    importing
      !I_INVALIDATE type OS_BOOLEAN
      !I_OBJECTS type OSTYP_REF_TAB .
endinterface.