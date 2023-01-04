*"* components of interface IF_EX_EVAL_SCHEDCOND_PPF
interface IF_EX_EVAL_SCHEDCOND_PPF
  public .


  methods EVALUATE_SCHEDULE_CONDITION
    importing
      !IO_CONTEXT type ref to CL_CONTEXT_PPF
      !IP_PROTOCOL type BALLOGHNDL
      !IP_TTYPE type PPFDTT
      value(FLT_VAL) type PPFDFLTCO1
      value(II_CONTAINER) type ref to IF_SWJ_PPF_CONTAINER
    exporting
      !EP_RC type SY-SUBRC .
endinterface.