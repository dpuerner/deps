*"* components of interface /SCWM/IF_EX_EXCP_EXC_FLT_FUP
interface /SCWM/IF_EX_EXCP_EXC_FLT_FUP
  public .


  interfaces IF_BADI_INTERFACE .

  methods FILTER_FOLLOW_UP_ACTIONS
    importing
      !IV_LGNUM type /SCWM/LGNUM
      !IS_APPL_ITEM_DATA type ANY
      !IS_EXCCODE type /SCWM/S_IEXCCODE
      !IO_EXCEP type ref to /SCWM/CL_EXCEPTION
      !IO_LOG type ref to /SCWM/CL_LOG
    changing
      !CT_WORKFLOW type /SCWM/TT_EXCEPWF
      !CT_ALERT type /SCWM/TT_EXCEPALT
      !CT_STM type /SCWM/TT_EXCEXESTM .
endinterface.