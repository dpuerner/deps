*"* components of interface IF_PROXY_BASIS_INTERNAL
interface IF_PROXY_BASIS_INTERNAL
  public .


  class-methods CREATE_FRAMEWORK
    importing
      !INTERFACE_NAME type ANY
      !INTERFACE_NAMESPACE type ANY
      !R3_OBJECT type ANY
      !R3_NAME type ANY
      !IMPLEMENTING_CLASS type ANY optional
      !LOGICAL_PORT_NAME type PRX_LOGICAL_PORT_NAME optional
    returning
      value(FRAMEWORK) type ref to IF_PROXY_FRAMEWORK_OUTBOUND
    raising
      CX_AI_SYSTEM_FAULT .
endinterface.