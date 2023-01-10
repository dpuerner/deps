*"* components of interface /SCWM/IF_EX_DLV_DET_AFTER_SAVE
interface /SCWM/IF_EX_DLV_DET_AFTER_SAVE
  public .


  interfaces IF_BADI_INTERFACE .

  methods AFTER_SAVE
    importing
      !IV_DOCCAT type /SCDL/DL_DOCCAT
      !IT_KEYS type /SCWM/DLV_DOCID_TAB
    changing
      !CT_MESSAGES type /SCWM/DLV_DETVAL_MSG_TAB .
endinterface.