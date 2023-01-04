*"* components of interface /SCWM/IF_EX_WRKC_UI_DTL_TABS
interface /SCWM/IF_EX_WRKC_UI_DTL_TABS
  public .


  interfaces IF_BADI_INTERFACE .

  class-methods SET_ACT_TAB
    importing
      !IV_OBJECT_TYPE type /SCWM/DE_GUID_TYPE
      !IV_OBJECT type GUID_16
      !IV_OBJECT_PARENT type GUID_16
      !IS_WORKSTATION type /SCWM/TWORKST
      !IS_WORKSTTYP type /SCWM/TWRKTYP
      !IO_PACK type ref to /SCWM/IF_PACK optional
    changing
      !CV_TAB type SYUCOMM .
endinterface.