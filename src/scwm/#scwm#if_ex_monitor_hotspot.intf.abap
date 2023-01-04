interface /SCWM/IF_EX_MONITOR_HOTSPOT
  public .


  interfaces IF_BADI_INTERFACE .

  methods NAVIGATE
    importing
      !IV_WAREHOUSE_NUMBER type /SCWM/LGNUM
      !IV_HOTSPOT type /SCWM/DE_HOTSPOT
      !IV_STRUCTURE type /SCWM/DE_FORM_ST
      !IT_ROW_DATA type STANDARD TABLE
      !IV_NEW_SESSION type BOOLE_D
      !IO_LOG type ref to /SCWM/CL_LOG .
endinterface.