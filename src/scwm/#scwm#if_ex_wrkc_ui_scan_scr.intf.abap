*"* components of interface /SCWM/IF_EX_WRKC_UI_SCAN_SCR
interface /SCWM/IF_EX_WRKC_UI_SCAN_SCR
  public .


  interfaces IF_BADI_INTERFACE .

  methods SET_TAB_NAME
    importing
      !IO_PACK type ref to /SCWM/IF_PACK optional
    exporting
      !EV_TEXT_SCANNER_BADI_1 type CHAR40
      !EV_TEXT_SCANNER_BADI_2 type CHAR40
      !EV_TEXT_SCANNER_BADI_3 type CHAR40 .
endinterface.