class CX_AI_APPLICATION_FAULT definition
  public
  inheriting from CX_DYNAMIC_CHECK
  create public .

public section.
*"* public components of class CX_AI_APPLICATION_FAULT
*"* do not include other source files here!!!

  interfaces IF_AI_APPLICATION_FAULT .

  aliases TT_FAULT_REASON_TYPE
    for IF_AI_APPLICATION_FAULT~TT_FAULT_REASON_TYPE .
  aliases TT_SUBCODE
    for IF_AI_APPLICATION_FAULT~TT_SUBCODE .

  constants CX_AI_APPLICATION_FAULT type SOTR_CONC value '65B8FEB5F43CC949B7CD662AB888ED34'. "#EC NOTEXT

  methods CONSTRUCTOR
    importing
      !TEXTID like TEXTID optional
      !PREVIOUS like PREVIOUS optional .
protected section.
*"* protected components of class CX_AI_APPLICATION_FAULT
*"* do not include other source files here!!!
private section.
*"* private components of class CX_AI_APPLICATION_FAULT
*"* do not include other source files here!!!
ENDCLASS.



CLASS CX_AI_APPLICATION_FAULT IMPLEMENTATION.


method CONSTRUCTOR.
CALL METHOD SUPER->CONSTRUCTOR
EXPORTING
TEXTID = TEXTID
PREVIOUS = PREVIOUS
.
 IF textid IS INITIAL.
   me->textid = CX_AI_APPLICATION_FAULT .
 ENDIF.
endmethod.


method if_ai_application_fault~add_rt_fault_subcode.

  data:
    lr_server_context      type ref to if_ws_server_context,
    lr_wsprotocol_internal type ref to if_wsprotocol_internal,
    lr_framework           type ref to if_proxy_framework.

  try.
      lr_server_context = cl_proxy_access=>get_server_context( ).
      lr_wsprotocol_internal ?= lr_server_context->get_protocol( 'INTERNAL').
      lr_framework = lr_wsprotocol_internal->get_framework( ).
      if lr_framework->interface_direction = if_proxy_framework=>co_interface_direction_in and
         lr_framework->runtime             = if_proxy_framework=>runtime_ws.
        rv_subcode_added = abap_true.
        insert iv_subcode into table if_ai_application_fault~mt_subcode.
      endif.
    catch cx_ai_system_fault.                           "#EC NO_HANDLER
    catch cx_ai_application_fault.                      "#EC NO_HANDLER
  endtry.

endmethod.


method if_ai_application_fault~add_rt_reason_type.

  data:
    ls_fault_reason_type   type if_ai_application_fault=>ty_fault_reason_type,
    lr_server_context      type ref to if_ws_server_context,
    lr_wsprotocol_internal type ref to if_wsprotocol_internal,
    lr_framework           type ref to if_proxy_framework.

  try.
      lr_server_context = cl_proxy_access=>get_server_context( ).
      lr_wsprotocol_internal ?= lr_server_context->get_protocol( 'INTERNAL').
      lr_framework = lr_wsprotocol_internal->get_framework( ).
      if lr_framework->interface_direction = if_proxy_framework=>co_interface_direction_in and
         lr_framework->runtime             = if_proxy_framework=>runtime_ws.
        ls_fault_reason_type-language = iv_language.
        ls_fault_reason_type-text     = iv_reason_type.
        rv_reason_type_added = abap_true.
        insert ls_fault_reason_type into table if_ai_application_fault~mt_fault_reason_type.
      endif.
    catch cx_ai_system_fault.                           "#EC NO_HANDLER
    catch cx_ai_application_fault.                      "#EC NO_HANDLER
  endtry.

endmethod.


method IF_AI_APPLICATION_FAULT~GET_RT_FAULT_TEXT.
  if previous is bound.
    rval = previous->get_text( ).
  endif.
endmethod.
ENDCLASS.