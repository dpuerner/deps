*"* components of interface /SCWM/IF_EX_WRKC_UI_DETA_SCR
interface /SCWM/IF_EX_WRKC_UI_DETA_SCR
  public .


  interfaces IF_BADI_INTERFACE .

  methods SET_TAB_NAME
    importing
      !IO_PACK type ref to /SCWM/IF_PACK optional
    exporting
      !EV_TEXT_DETAIL_BADI_1 type CHAR40
      !EV_TEXT_DETAIL_BADI_2 type CHAR40
      !EV_TEXT_DETAIL_BADI_3 type CHAR40
      !EV_TEXT_DETAIL_BADI_4 type CHAR40
      !EV_TEXT_DETAIL_BADI_5 type CHAR40 .
  methods SET_INVISIBLE
    importing
      !IV_GUID_TYPE type /SCWM/DE_GUID_TYPE
      !IV_DYNNR type SCRADNUM
    exporting
      !EV_INVISIBLE type BOOLE_D .
endinterface.