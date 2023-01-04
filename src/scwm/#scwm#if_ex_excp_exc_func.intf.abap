*"* components of interface /SCWM/IF_EX_EXCP_EXC_FUNC
interface /SCWM/IF_EX_EXCP_EXC_FUNC
  public .


  interfaces IF_BADI_INTERFACE .

  methods EXECUTE_FUNCTIONS
    importing
      !IV_LGNUM type /SCWM/LGNUM
      !IS_APL_ITEM_DATA type ANY
      !IO_EXCEP type ref to /SCWM/CL_EXCEPTION
      !IO_LOG type ref to /SCWM/CL_LOG .
endinterface.