*"* components of interface /SCWM/IF_EX_CORE_CO_POST
interface /SCWM/IF_EX_CORE_CO_POST
  public .


  interfaces IF_BADI_INTERFACE .

  methods POST
    importing
      !IV_LGNUM type /SCWM/LGNUM
      !IT_LTAP_VB type /SCWM/TT_LTAP_VB
      !IT_ORDIM_C type /SCWM/TT_ORDIM_C
      !IT_ORDIM_O_UPD type /SCWM/TT_ORDIM_O_INT
      !IT_ORDIM_H type /SCWM/TT_ORDIM_H
      !IT_ORDIM_E type /SCWM/TT_ORDIM_E
      !IT_ORDIM_CS type /SCWM/TT_ORDIM_CS
      !IT_ORDIM_HS type /SCWM/TT_ORDIM_HS .
endinterface.