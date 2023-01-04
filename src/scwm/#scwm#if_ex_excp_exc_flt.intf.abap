*"* components of interface /SCWM/IF_EX_EXCP_EXC_FLT
interface /SCWM/IF_EX_EXCP_EXC_FLT
  public .


  interfaces IF_BADI_INTERFACE .

  methods FILTER_EXCEPTION_CODES
    importing
      !IV_LGNUM type /SCWM/LGNUM
      !IS_APL_ITEM_DATA type ANY
      !IO_EXCEP type ref to /SCWM/CL_EXCEPTION
      !IO_LOG type ref to /SCWM/CL_LOG
    exporting
      !ET_EXCCODE type /SCWM/TT_EXCCODE .
endinterface.