*"* components of interface /SCMB/IF_AH_ASPECT
interface /SCMB/IF_AH_ASPECT
  public .


  methods SET_ATTRIBUTES
    importing
      !IO_ASPECT_KEY type ref to DATA
      !IV_FIELD type STRING
      !IV_PROPERTY type STRING
      !IV_VALUE type CHAR1 .
endinterface.