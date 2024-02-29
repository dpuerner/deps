*"* components of interface IF_EX_QPLEXT_LOT_DECISION
interface IF_EX_QPLEXT_LOT_DECISION
  public .


  methods MAP_INT_TO_EXT
    importing
      !IS_INSP_LOT_ERP type QALS
      !IS_INSP_DECISION_ERP type QAVE
      !IT_INSP_POINTS_ERP type QAPPTAB optional
      value(FLT_VAL) type QPART
    exporting
      !ET_EXTENSION1 type QBAPIEXT_TAB
      !ET_EXTENSION2 type QBAPIEXTC_TAB .
endinterface.