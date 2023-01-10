*"* components of interface /SCWM/IF_EX_CORE_PTS_FILT_SORT
interface /SCWM/IF_EX_CORE_PTS_FILT_SORT
  public .


  interfaces IF_BADI_INTERFACE .

  methods FILT_SORT
    importing
      !IS_T331 type /SCWM/T331
      !IS_T333 type /SCWM/T333
      !IS_LTAP type /SCWM/LTAP
      !IS_MAT_GLOBAL type /SCWM/S_MATERIAL_GLOBAL
      !IS_MAT_LGNUM type /SCWM/S_MATERIAL_LGNUM
      !IS_MAT_LGTYP type /SCWM/S_MATERIAL_LGTYP
      !IS_MAT_HAZARD type /SCWM/S_MATERIAL_HAZARD
      !IT_MAT_UOM type /SCWM/TT_MATERIAL_UOM
    exporting
      !ET_BAPIRET type BAPIRETTAB
    changing
      !CT_LAGP_RESERV type /SCWM/TT_NEARFIXBIN optional
      !CT_QMAT type /SCWM/TT_AQUA_INT optional
      !CT_HLPLAGPL type /SCWM/TT_LAGPL optional
      !CS_ORDIM_CUST type /SCWM/INCL_EEW_S_ORDIM optional .
endinterface.