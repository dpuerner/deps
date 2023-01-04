*"* components of interface /SCWM/IF_EX_WHO_CREATE
interface /SCWM/IF_EX_WHO_CREATE
  public .


  interfaces IF_BADI_INTERFACE .

  class-methods CREATE
    importing
      !IV_SET_ON_HOLD type XFELD
      !IT_DIRECT type /SCWM/TT_ORDIM_O_INT
      !IT_SSEQ type /SCWM/TT_ORDIM_O_INT
    changing
      !CT_WHO type /SCWM/TT_WHO
      !CT_WHOHU type /SCWM/TT_WHOHU
      !CT_TO type /SCWM/TT_ORDIM_O_INT
      !CT_LOG type /SCWM/TT_WHOLOG .
endinterface.