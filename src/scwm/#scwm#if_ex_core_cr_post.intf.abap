*"* components of interface /SCWM/IF_EX_CORE_CR_POST
interface /SCWM/IF_EX_CORE_CR_POST
  public .


  interfaces IF_BADI_INTERFACE .

  methods POST
    importing
      !IV_LGNUM type /SCWM/LGNUM
      !IT_LTAP_VB type /SCWM/TT_LTAP_VB
      !IT_ORDIM_O type /SCWM/TT_ORDIM_O
      !IT_ORDIM_OS type /SCWM/TT_ORDIM_OS .
endinterface.