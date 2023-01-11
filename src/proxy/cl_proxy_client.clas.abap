class CL_PROXY_CLIENT definition
  public
  inheriting from CL_PROXY_BASIS
  create public .

public section.
*"* public components of class CL_PROXY_CLIENT
*"* do not include other source files here!!!

  interfaces IF_PROXY_CLIENT .

  class-methods CLASS_CONSTRUCTOR .
  methods CONSTRUCTOR
    importing
      !INTF_NAME type SEOCLNAME optional
      !CLASS_NAME type SEOCLNAME optional
      !LOGICAL_PORT_NAME type PRX_LOGICAL_PORT_NAME optional
    raising
      CX_AI_SYSTEM_FAULT .
protected section.

  data ENH_NAME type PRX_R3NAME .
private section.
*"* private components of class CL_PROXY_CLIENT
*"* do not include other source files here!!!

  data R3_OBJ type PRX_R3OBJ .
  data R3_NAME type SEOCLNAME .
  class CL_PROXY_METADATA definition load .
  data METHODS type CL_PROXY_METADATA=>T_OUTBOUND_METHODS .
  data SIGNATURES type SPRX_SIG_T .
  data IFR_NAME type STRING .
  data IFR_NSPACE type STRING .
  data TRACER type ref to IF_PROXY_TRACER .
  class-data NO_TRACE type ABAP_BOOL value ABAP_FALSE. "#EC NOTEXT .
ENDCLASS.



CLASS CL_PROXY_CLIENT IMPLEMENTATION.


method class_constructor.
  no_trace = cl_proxy_local_settings=>get_flag_general( 'PROXY_OUTBOUND_TRACE_OFF' ).
endmethod.


method constructor.
  data:
    ls_esr_name type qname.

  super->constructor( ).

* either pass class or interface name
  assert not class_name is initial and intf_name is initial
      or class_name is initial and not intf_name is initial.

  if class_name is initial.
    me->r3_obj  = 'INTF'.
    me->r3_name = intf_name.
    call method cl_proxy_metadata=>get_inbound_proxy_data
      exporting
        intf_name = intf_name
      importing
        porttype  = ls_esr_name
      exceptions
        not_found = 1
        others    = 2.
    if sy-subrc <> 0.
      cl_proxy_runtime_errors=>system_fault_from_params(
        id = cx_xms_syserr_proxy=>co_id_object_no_proxy
        value1 = 'INTF_NAME'
        value2 = intf_name
      ).
    endif.
    ifr_name = ls_esr_name-name.
    ifr_nspace = ls_esr_name-namespace.
  else.
    me->r3_obj  = 'CLAS'.
    me->r3_name = class_name.

    "check if an extension is active: get enhancement name from lp name
    me->enh_name = cl_proxy_metadata=>get_enh_for_lp(
      class_name        = class_name
      lp_name           = logical_port_name
    ).

    call method cl_proxy_metadata=>get_outbound_proxy_data
      exporting
        class_name     = class_name
      importing
*       TEXT           =
        ifr_name       = ifr_name
        ifr_nspce      = ifr_nspace
      exceptions
        not_found      = 1
        internal_error = 2
        others         = 3.
    if sy-subrc <> 0.
      cl_proxy_runtime_errors=>system_fault_from_params(
        id = cx_xms_syserr_proxy=>co_id_object_no_proxy
        value1 = 'CLASS_NAME'
        value2 = class_name
      ).
    endif.
  endif.

  if no_trace = abap_false.
    try.
        ls_esr_name-name      = ifr_name.
        ls_esr_name-namespace = ifr_nspace.
        call method ('CL_SOAP_MONI_ECATT_TRACER')=>if_proxy_trace_factory~get_tracer
          exporting
            class_name        = class_name
            esr_name          = ls_esr_name
            logical_port_name = logical_port_name
            location          = if_proxy_trace_factory=>location_consumer
          receiving
            tracer            = tracer.
      catch cx_root                                         "#EC NO_HANDLER
        .                                                   "#EC CATCH_ALL
    endtry.
  endif.


  proxy_framework = cl_proxy_basis=>if_proxy_basis_internal~create_framework(
    interface_name      = ifr_name
    interface_namespace = ifr_nspace
    r3_object           = me->r3_obj
    r3_name             = me->r3_name
    logical_port_name   = logical_port_name
  ).

  proxy_framework->init_framework(
    interface_name      = ifr_name
    interface_namespace = ifr_nspace
    interface_direction = if_proxy_framework=>co_interface_direction_out
    r3_object           = r3_obj
    r3_name             = r3_name
    logical_port_name   = logical_port_name
  ).

endmethod.


method if_proxy_client~execute.
  data:
    lr_fault type ref to cx_ai_application_fault,
    lt_signatures type sprx_sig_t,
    ls_method type cl_proxy_metadata=>t_outbound_method,
    lr_method type ref to cl_proxy_metadata=>t_outbound_method.

  field-symbols:
    <sproxsig> type sproxsig,
    <parmbind> like line of parmbind_tab.

  read table methods                                     "#EC CI_STDSEQ
    with key method_name = method_name reference into lr_method.

  if sy-subrc <> 0.
    call method cl_proxy_metadata=>get_method_signature
      exporting
        object      = me->r3_obj
        name        = me->r3_name
        name2       = me->enh_name
        method      = method_name
      importing
        method_data = ls_method
        signatures  = lt_signatures
      exceptions
        others      = 1.
    if sy-subrc <> 0.
      cl_proxy_runtime_errors=>system_fault_from_params(
        id = cx_xms_syserr_proxy=>co_id_object_no_proxy
        value1 = 'R3_NAME'
        value2 = me->r3_name
      ).
    endif.
    append ls_method to methods.
    append lines of lt_signatures to signatures.
    read table methods                                   "#EC CI_STDSEQ
      with key method_name = method_name reference into lr_method.
    assert sy-subrc = 0.
  endif.

  proxy_framework->call_init(
    r3_method                   = method_name
    interface_operation         = lr_method->operation
    use_xml                     = use_xml
  ).

  loop at parmbind_tab assigning <parmbind>.             "#EC CI_STDSEQ
    read table signatures with                           "#EC CI_STDSEQ
      key param = <parmbind>-name
          object1 = sprx_const_method
          obj_name1 = method_name
      assigning <sproxsig>.

    proxy_framework->call_add_parameter(
      name          = <parmbind>-name
      value         = <parmbind>-value
      direction     = <sproxsig>-decl
      type_name     = <sproxsig>-typename
      ifr_name      = <sproxsig>-msg_name
      ifr_namespace = <sproxsig>-msg_namespace
      xml_name      = <sproxsig>-xml_msg_name
      xml_namespace = <sproxsig>-xml_msg_namespac
    ).

  endloop.

  loop at signatures assigning <sproxsig>                "#EC CI_STDSEQ
    where decl = '4'
      and object1 = sprx_const_method
      and obj_name1 = method_name.

    proxy_framework->call_add_exception(
      name                 = <sproxsig>-msg_name
      namespace            = <sproxsig>-msg_namespace
      xml_name             = <sproxsig>-xml_msg_name
      xml_namespace        = <sproxsig>-xml_msg_namespac
      exception_class_name = <sproxsig>-typename
    ).
  endloop.

  if not tracer is initial.
    try.
        try.
*           trace before execution
            tracer->trace_before(
              method      = method_name
              operation   = lr_method->operation
              is_synchron = lr_method->synchron
              parameter   = parmbind_tab
            ).
          catch cx_root                                         "#EC NO_HANDLER
            .                                                   "#EC CATCH_ALL
        endtry.

*       execution
        proxy_framework->call_execute_out( ).

        try.
*           trace after execution
            tracer->trace_after(
              method      = method_name
              operation   = lr_method->operation
              is_synchron = lr_method->synchron
              parameter   = parmbind_tab
            ).
          catch cx_root                                         "#EC NO_HANDLER
            .                                                   "#EC CATCH_ALL
        endtry.

      catch cx_ai_application_fault into lr_fault.
*       trace exception
        try.
            tracer->trace_exception(
              method      = method_name
              operation   = lr_method->operation
              is_synchron = lr_method->synchron
              exception   = lr_fault
            ).
          catch cx_root                                         "#EC NO_HANDLER
            .                                                   "#EC CATCH_ALL
        endtry.
*       propagate exception
        raise exception lr_fault.
    endtry.

  else.

*   execution without trace
    proxy_framework->call_execute_out( ).

  endif.

endmethod.                    "if_proxy_client~execute
ENDCLASS.