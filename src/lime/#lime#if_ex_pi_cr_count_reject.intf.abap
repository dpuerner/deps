*"* components of interface /LIME/IF_EX_PI_CR_COUNT_REJECT
interface /LIME/IF_EX_PI_CR_COUNT_REJECT
  public .


  interfaces IF_BADI_INTERFACE .

  type-pools ABAP .
  methods ON_COUNT_REJECT_ITEM
    importing
      !I_SIM_MODE type /LIME/SIM_MODE
      !IS_HEAD type /LIME/PI_HEAD_ATTRIBUTES
      !I_REFO_PI_ITEM type ref to /LIME/IF_PI_ITEM
      !I_REFO_DOC_ALL type ref to /LIME/IF_PI_DOC_ALL
    exporting
      !EV_REJECT_ITEM type ABAP_BOOL .
endinterface.