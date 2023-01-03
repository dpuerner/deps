*"* components of interface /SCMB/IF_MH_ASPECT
interface /SCMB/IF_MH_ASPECT
  public .


  methods SET_FOCUS
    importing
      !IV_FIELD_NAME type STRING
      !IS_KEY type ref to DATA .
endinterface.