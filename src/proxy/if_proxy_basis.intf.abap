*"* components of interface IF_PROXY_BASIS
interface IF_PROXY_BASIS
  public .


  methods GET_PROTOCOL
    importing
      !PROTOCOL_NAME type STRING
    returning
      value(PROTOCOL) type ref to IF_WSPROTOCOL
    raising
      CX_AI_SYSTEM_FAULT .
  methods GET_TRANSPORT_BINDING
    returning
      value(TRANSPORT_BINDING) type ref to IF_WS_TRANSPORT_BINDING .
endinterface.