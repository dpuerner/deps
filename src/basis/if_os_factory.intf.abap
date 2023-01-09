*"* components of interface IF_OS_FACTORY
interface IF_OS_FACTORY
  public .


  events CREATED_PERSISTENT
    exporting
      value(OBJECT) type ref to IF_OS_STATE .
  events LOADED_WITH_STATE
    exporting
      value(OBJECT) type ref to IF_OS_STATE
      value(WRITE_ACCESS) type OS_BOOLEAN default 'X' .
  events TO_BE_DELETED
    exporting
      value(OBJECT) type ref to IF_OS_STATE .
  events CREATED_TRANSIENT
    exporting
      value(OBJECT) type ref to IF_OS_STATE .
  events LOADED_WITHOUT_STATE
    exporting
      value(OBJECT) type ref to IF_OS_STATE .
  events DELETED
    exporting
      value(OBJECT) type ref to IF_OS_STATE .

  methods CREATE_PERSISTENT
    returning
      value(RESULT) type ref to OBJECT .
  methods CREATE_PERSISTENT_BY_KEY
    importing
      !I_KEY type ANY
    returning
      value(RESULT) type ref to OBJECT
    raising
      CX_OS_OBJECT_EXISTING .
  methods CREATE_TRANSIENT
    returning
      value(RESULT) type ref to OBJECT .
  methods CREATE_TRANSIENT_BY_KEY
    importing
      !I_KEY type ANY
    returning
      value(RESULT) type ref to OBJECT
    raising
      CX_OS_OBJECT_EXISTING .
  methods DELETE_PERSISTENT
    importing
      !I_OBJECT type ref to IF_OS_STATE
    raising
      CX_OS_OBJECT_NOT_EXISTING .
  methods REFRESH_PERSISTENT
    importing
      !I_OBJECT type ref to IF_OS_STATE
    raising
      CX_OS_OBJECT_NOT_REFRESHABLE .
  methods RELEASE
    importing
      !I_OBJECT type ref to IF_OS_STATE
    raising
      CX_OS_OBJECT_NOT_RELEASABLE .
  type-pools OSCON .
endinterface.