*"* components of interface /SCWM/IF_EX_MFS_WO_DET
interface /SCWM/IF_EX_MFS_WO_DET
  public .


  interfaces IF_BADI_INTERFACE .

  methods WO_DET
    importing
      !IV_LGNUM type /SCWM/LGNUM
      !IV_QUEUE type /SCWM/DE_QUEUE
      !IS_WHO type /SCWM/WHO
      !IV_INTLEAV type /SCWM/DE_MFSINTLEAV
    changing
      !CV_WHO type /SCWM/DE_WHO
      !CT_WHO type /SCWM/TT_WHO optional
      !CO_LOG type ref to /SCWM/CL_LOG optional .
  methods USE_CUST_SELECTION
    importing
      !IV_LGNUM type /SCWM/LGNUM
      !IV_QUEUE type /SCWM/DE_QUEUE
      !IV_INTLEAV type /SCWM/DE_MFSINTLEAV
      !IS_RSRC type /SCWM/RSRC
    exporting
      !EV_USE_CUST_SELECTION type XFELD .
endinterface.