*"* components of interface /SCWM/IF_EX_CORE_CR_UPD_TAB_DI
interface /SCWM/IF_EX_CORE_CR_UPD_TAB_DI
  public .


  interfaces IF_BADI_INTERFACE .

  methods UPD_TABLES_DEL_ITEM
    importing
      !IS_LTAP type /SCWM/LTAP
    exporting
      !ET_BAPIRET type BAPIRETTAB
    changing
      !CS_ORDIM_CUST type /SCWM/INCL_EEW_S_ORDIM .
endinterface.