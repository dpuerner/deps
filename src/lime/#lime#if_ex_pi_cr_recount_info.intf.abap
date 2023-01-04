*"* components of interface /LIME/IF_EX_PI_CR_RECOUNT_INFO
interface /LIME/IF_EX_PI_CR_RECOUNT_INFO
  public .


  interfaces IF_BADI_INTERFACE .

  methods ON_RECOUNT_INFO
    importing
      !IS_HEAD type /LIME/PI_HEAD_ATTRIBUTES
      !I_REFO_DOC_ALL type ref to /LIME/IF_PI_DOC_ALL .
endinterface.