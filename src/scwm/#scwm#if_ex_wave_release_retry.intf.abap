interface /SCWM/IF_EX_WAVE_RELEASE_RETRY
  public .


  interfaces IF_BADI_INTERFACE .

  methods CHANGE_RETRY_CONTROL
    importing
      !IS_WAVE_HEADER type /SCWM/S_WAVEHDR_INT
      !IT_WAVE_ITEMS type /SCWM/TT_WAVEITM_INT
    changing
      !CV_RETRY_RELEASE type BOOLE_D
      !CV_RELEASE_RETRY_INTERVAL type /SCWM/DE_WAVE_RETRY_INTERVAL .
endinterface.