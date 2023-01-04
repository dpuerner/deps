*"* components of interface /SCWM/IF_EX_WRKC_UI_GUI_STATUS
interface /SCWM/IF_EX_WRKC_UI_GUI_STATUS
  public .


  interfaces IF_BADI_INTERFACE .

  methods SET_STATUS
    importing
      !IV_LGNUM type /SCWM/LGNUM
    changing
      !CV_STATUS type SYPFKEY
      !CV_PROGRAM type SYREPID
      !CT_UCOMM type SYUCOMM_T .
endinterface.