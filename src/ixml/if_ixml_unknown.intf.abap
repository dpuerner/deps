*"* components of interface IF_IXML_UNKNOWN
interface IF_IXML_UNKNOWN
  public .


  methods QUERY_INTERFACE
    importing
      !IID type I
    returning
      value(RVAL) type ref to IF_IXML_UNKNOWN .
endinterface.