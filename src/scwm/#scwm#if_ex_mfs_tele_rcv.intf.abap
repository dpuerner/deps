*"* components of interface /SCWM/IF_EX_MFS_TELE_RCV
interface /SCWM/IF_EX_MFS_TELE_RCV
  public .


  interfaces IF_BADI_INTERFACE .

  class-methods TELE_RCV
    importing
      !IV_LGNUM type /SCWM/LGNUM
      !IV_PLC type /SCWM/DE_MFSPLC
      !IV_CHANNEL type /SCWM/DE_MFSCCH
      !IV_TELE_RCV type /SCWM/DE_MFSTELE
    changing
      !CS_TELE_RCV type /SCWM/S_MFS_TELETOTAL
      !CV_CONT_ERR type XFELD optional .
endinterface.