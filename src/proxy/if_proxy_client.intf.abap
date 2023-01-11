*"* components of interface IF_PROXY_CLIENT
interface IF_PROXY_CLIENT
  public .

  methods EXECUTE
    importing
      !METHOD_NAME type SEOCLNAME
      !USE_XML type PRX_BOOLEAN default SPRX_FALSE
    changing
      !PARMBIND_TAB type ABAP_PARMBIND_TAB
    raising
      CX_AI_SYSTEM_FAULT
      CX_AI_APPLICATION_FAULT .
endinterface.