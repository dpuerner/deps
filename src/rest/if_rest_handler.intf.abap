*"* components of interface IF_REST_HANDLER
interface IF_REST_HANDLER
  public .


  methods HANDLE
    importing
      !IO_REQUEST type ref to IF_REST_REQUEST
      !IO_RESPONSE type ref to IF_REST_RESPONSE
      !IO_CONTEXT type ref to IF_REST_CONTEXT optional .
endinterface.