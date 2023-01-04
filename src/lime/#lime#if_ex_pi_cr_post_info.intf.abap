*"* components of interface /LIME/IF_EX_PI_CR_POST_INFO
interface /LIME/IF_EX_PI_CR_POST_INFO
  public .


  interfaces IF_BADI_INTERFACE .

  methods ON_POST_INFO
    importing
      !IS_HEAD type /LIME/PI_HEAD_ATTRIBUTES
      !I_REFO_DOC_ALL type ref to /LIME/IF_PI_DOC_ALL .
endinterface.