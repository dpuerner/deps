*"* components of interface /SCWM/IF_EX_MFS_HU_AT_CP
interface /SCWM/IF_EX_MFS_HU_AT_CP
  public .


  interfaces IF_BADI_INTERFACE .

  class-methods ACCEPT
    importing
      !IV_LGNUM type /SCWM/LGNUM
      !IV_TELECAT type /SCWM/DE_MFSTELECAT
      !IS_TELEGRAM type /SCWM/S_MFS_TELETOTAL
      !IS_TMFSPLC type /SCWM/TMFSPLC
      !IS_TMFSCP type /SCWM/TMFSCP
      !IS_HUHDR type /SCWM/S_HUHDR_INT
      !IS_ORDIM_O type /SCWM/ORDIM_O
      !IT_ORDIM_O type /SCWM/TT_ORDIM_O
      !IO_LOG type ref to /SCWM/CL_LOG
    exporting
      value(EV_HU_AT_CP_ACCEPT) type /SCWM/DE_MFS_HU_AT_CP_ACCEPT .
endinterface.