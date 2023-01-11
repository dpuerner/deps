*"* components of interface IF_REST_APPLICATION
interface IF_REST_APPLICATION
  public .


  methods GET_ROOT_HANDLER
    returning
      value(RO_ROOT_HANDLER) type ref to IF_REST_HANDLER .
endinterface.