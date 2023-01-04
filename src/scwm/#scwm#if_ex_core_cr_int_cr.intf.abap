*"* components of interface /SCWM/IF_EX_CORE_CR_INT_CR
interface /SCWM/IF_EX_CORE_CR_INT_CR
  public .


  interfaces IF_BADI_INTERFACE .

  methods INSERT
    importing
      !IS_LTAP type /SCWM/LTAP
    exporting
      !ET_BAPIRET type BAPIRETTAB
    changing
      !CS_LTAP_CUST type /SCWM/INCL_EEW_S_ORDIM .
endinterface.