*"* components of interface IF_EX_QPLEXT_LOT_CHANGE
interface IF_EX_QPLEXT_LOT_CHANGE
  public .


  methods MAP_EXT_TO_INT
    importing
      !IS_INSP_HEADER type QPLEXT_INSP_HEADER
      !IT_SAMPLES type QPLEXT_INSP_SAMPLES_TAB
      !IT_EXTENSION1 type QBAPIEXT_TAB
      !IT_EXTENSION2 type QBAPIEXTC_TAB
      value(FLT_VAL) type QPART
    exporting
      !ET_SAMPLES_ERP type QPRSTAB
      !ES_INSP_LOT_ERP type QALS .
endinterface.