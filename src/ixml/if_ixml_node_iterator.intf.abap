*"* components of interface IF_IXML_NODE_ITERATOR
interface IF_IXML_NODE_ITERATOR
  public .


  interfaces IF_IXML_UNKNOWN .

  aliases QUERY_INTERFACE
    for IF_IXML_UNKNOWN~QUERY_INTERFACE .

  methods GET_FILTER
    returning
      value(RVAL) type ref to IF_IXML_NODE_FILTER .
  methods GET_NEXT
    returning
      value(RVAL) type ref to IF_IXML_NODE .
  methods RESET .
  methods SET_FILTER
    importing
      !FILTER type ref to IF_IXML_NODE_FILTER
    returning
      value(RVAL) type I .
endinterface.