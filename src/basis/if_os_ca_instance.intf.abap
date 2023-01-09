*"* components of interface IF_OS_CA_INSTANCE
interface IF_OS_CA_INSTANCE
  public .


  type-pools OSTYP .
  methods GET_CHANGED
    returning
      value(RESULT) type OSTYP_REF_TAB .
  methods GET_CREATED
    returning
      value(RESULT) type OSTYP_REF_TAB .
  methods GET_DELETED
    returning
      value(RESULT) type OSTYP_REF_TAB .
  methods GET_LOADED
    returning
      value(RESULT) type OSTYP_REF_TAB .
  methods GET_NOT_LOADED
    returning
      value(RESULT) type OSTYP_REF_TAB .
  methods GET_STATUS
    importing
      !I_OBJECT type ref to OBJECT
    returning
      value(RESULT) type OS_OSTATUS .
  methods SET_STATUS
    importing
      !I_OBJECT_STATUS_LIST type OSTYP_REFSTATUS_TAB .
  methods GET_TRANSIENT
    returning
      value(RESULT) type OSTYP_REF_TAB .
endinterface.