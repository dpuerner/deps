*"* components of interface QPLEXT_COMM_TEC_IF
interface QPLEXT_COMM_TEC_IF
  public .


  interfaces IF_BADI_INTERFACE .

  class-methods DETERMINE_TECHNOLOGY
    importing
      !IP_QALS type QALS
    exporting
      !EP_COMM_TECHNOLOGY type QPLEXT_COMM_TECHNOLOGY
    exceptions
      INVALID_IMPORT_PARAMETER
      MISSING_IMPORT_PARAMETER .
endinterface.