*"* components of interface /SCWM/IF_EX_CORE_CO_CHECK_CONF
interface /SCWM/IF_EX_CORE_CO_CHECK_CONF
  public .


  interfaces IF_BADI_INTERFACE .

  methods CHECK_CONF
    importing
      !IS_TAP type /SCWM/LTAP
      !IT_CONF_EXC type /SCWM/TT_CONF_EXC_INT optional
      !IT_CONF_SERID type /SCWM/TT_CONF_SERID optional
    exporting
      !EV_NOT_CONFIRM type XFELD
      !ET_BAPIRET type BAPIRETTAB .
  methods CHECK_CANC
    importing
      !IS_TAP type /SCWM/LTAP
      !IT_CANCL_EXC type /SCWM/TT_CONF_EXC_INT
    exporting
      !EV_NOT_CANCEL type XFELD
      !ET_BAPIRET type BAPIRETTAB .
endinterface.