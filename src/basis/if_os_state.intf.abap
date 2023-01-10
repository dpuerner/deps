*"* components of interface IF_OS_STATE
interface IF_OS_STATE
  public .


  events CHANGED .
  events WRITE_ACCESS .
  events READ_ACCESS .

  methods HANDLE_EXCEPTION
    importing
      !I_EXCEPTION type ref to IF_OS_EXCEPTION_INFO optional
      !I_EX_OS type ref to CX_OS_OBJECT_NOT_FOUND optional
    raising
      CX_OS_OBJECT_NOT_FOUND .
  methods GET
    returning
      value(RESULT) type ref to OBJECT .
  methods INIT .
  methods SET
    importing
      !I_STATE type ref to OBJECT .
  methods INVALIDATE .
endinterface.