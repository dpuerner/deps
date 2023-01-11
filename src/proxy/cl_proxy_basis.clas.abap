class CL_PROXY_BASIS definition
  public
  create public .

*"* public components of class CL_PROXY_BASIS
*"* do not include other source files here!!!
public section.

  interfaces IF_PROXY_BASIS .
  interfaces IF_PROXY_BASIS_INTERNAL .

  aliases GET_PROTOCOL
    for IF_PROXY_BASIS~GET_PROTOCOL .
  aliases GET_TRANSPORT_BINDING
    for IF_PROXY_BASIS~GET_TRANSPORT_BINDING .
protected section.
*"* protected components of class CL_PROXY_BASIS
*"* do not include other source files here!!!

  data PROXY_FRAMEWORK type ref to IF_PROXY_FRAMEWORK_OUTBOUND .
  interface IF_PROXY_FRAMEWORK load .
  constants CO_INTERFACE_DIRECTION_OUT type STRING value IF_PROXY_FRAMEWORK=>CO_INTERFACE_DIRECTION_OUT. "#EC NOTEXT
private section.
*"* private components of class CL_PROXY_BASIS
*"* do not include other source files here!!!
ENDCLASS.



CLASS CL_PROXY_BASIS IMPLEMENTATION.


method if_proxy_basis_internal~create_framework.

  data:
    lv_msg type string,
    lx_root type ref to cx_root,
    lr_framework_ref type ref to cl_proxy_framework_outbound=>t_framework_ref.

  get reference of framework into lr_framework_ref.

  cl_proxy_framework_outbound=>raise_create_framework_event(
    exporting
      framework_ref       = lr_framework_ref    " Outbound Proxy Framework
      implementing_class  = implementing_class
      interface_name      = interface_name
      interface_namespace = interface_namespace
      logical_port_name   = logical_port_name    " Logical Port Name
      r3_name             = r3_name
      r3_object           = r3_object
  ).

  " Hook point for AIF
  if not framework is bound.
    try.
        call method ('/AIF/CL_PROXY_OUTBOUND')=>create_framework
          exporting
            interface_name      = interface_name
            interface_namespace = interface_namespace
            r3_object           = r3_object
            r3_name             = r3_name
            implementing_class  = implementing_class
            logical_port_name   = logical_port_name
          receiving
            framework           = framework.

      catch cx_sy_dyn_call_error. "#EC NO_HANDLER
        "AIF not available
      catch cx_root into lx_root. "#EC NO_HANDLER
        "AIF not working
    endtry.
  endif.


  if not framework is bound.
    framework = cl_proxy_framework_outbound=>create_framework(
    interface_name      = interface_name
    interface_namespace = interface_namespace
    r3_object           = r3_object
    r3_name             = r3_name
    implementing_class  = implementing_class
    logical_port_name   = logical_port_name
  ).
  endif.
endmethod.


method if_proxy_basis~get_protocol.
  protocol = me->proxy_framework->get_protocol( protocol_name ).
endmethod.


method if_proxy_basis~get_transport_binding.

  transport_binding = me->proxy_framework->get_transport_binding( ).

endmethod.
ENDCLASS.