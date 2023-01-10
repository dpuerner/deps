*"* components of interface IF_REST_RESOURCE
interface IF_REST_RESOURCE
  public .


  methods HEAD .
  methods GET .
  methods DELETE .
  methods OPTIONS .
  methods POST
    importing
      !IO_ENTITY type ref to IF_REST_ENTITY .
  methods PUT
    importing
      !IO_ENTITY type ref to IF_REST_ENTITY .
endinterface.