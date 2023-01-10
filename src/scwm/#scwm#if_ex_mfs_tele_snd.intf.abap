*"* components of interface /SCWM/IF_EX_MFS_TELE_SND
interface /SCWM/IF_EX_MFS_TELE_SND
  public .


  interfaces IF_BADI_INTERFACE .

  class-methods TELE_SND
    importing
      !IV_LGNUM type /SCWM/LGNUM
      !IV_PLC type /SCWM/DE_MFSPLC
      !IV_CHANNEL type /SCWM/DE_MFSCCH
      !IS_ORDIM_O type /SCWM/S_ORDIM_O_INT
      !IV_NO_CHANGE type XFELD optional
      !IT_ORDIM_O type /SCWM/TT_ORDIM_O_INT
    changing
      !CS_TELE_SND type /SCWM/S_MFS_TELETOTAL .
  class-methods GET_START_END_STRING
    importing
      !IV_LGNUM type /SCWM/LGNUM
      !IV_PLC type /SCWM/DE_MFSPLC
      !IV_CHANNEL type /SCWM/DE_MFSCCH
    changing
      !CV_START_UNICODE type CHAR_50
      !CV_END_UNICODE type CHAR_50 .
endinterface.