interface IF_APC_WSP_EVENT_HANDLER
  public .


  interfaces IF_APC_WSP_EVENT_HANDLER_BASE .

  constants CO_EVENT_HANDLER_TYPE type STRING value ''. "#EC NOTEXT

  methods ON_OPEN
    importing
      !I_CONTEXT type ref to IF_APC_WSP_CLIENT_CONTEXT
      !I_MESSAGE_MANAGER type ref to IF_APC_WSP_MESSAGE_MANAGER
    raising
      CX_APC_ERROR .
  methods ON_MESSAGE
    importing
      !I_MESSAGE type ref to IF_APC_WSP_MESSAGE
      !I_MESSAGE_MANAGER type ref to IF_APC_WSP_MESSAGE_MANAGER
      !I_CONTEXT type ref to IF_APC_WSP_CLIENT_CONTEXT .
  methods ON_CLOSE
    importing
      !I_REASON type STRING
      !I_CODE type I
      !I_CONTEXT_BASE type ref to IF_APC_WSP_CLIENT_CONTEXT_BASE .
  methods ON_ERROR
    importing
      !I_REASON type STRING
      !I_CODE type I
      !I_CONTEXT_BASE type ref to IF_APC_WSP_CLIENT_CONTEXT_BASE .
endinterface.