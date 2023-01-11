*"* components of interface IF_IXML_NODE_LIST
interface IF_IXML_NODE_LIST
  public .


  interfaces IF_IXML_UNKNOWN .

  aliases QUERY_INTERFACE
    for IF_IXML_UNKNOWN~QUERY_INTERFACE .

  methods CREATE_ITERATOR
    returning
      value(RVAL) type ref to IF_IXML_NODE_ITERATOR .
  methods CREATE_ITERATOR_FILTERED
    importing
      !FILTER type ref to IF_IXML_NODE_FILTER
    returning
      value(RVAL) type ref to IF_IXML_NODE_ITERATOR .
  methods CREATE_REV_ITERATOR
    returning
      value(RVAL) type ref to IF_IXML_NODE_ITERATOR .
  methods CREATE_REV_ITERATOR_FILTERED
    importing
      !FILTER type ref to IF_IXML_NODE_FILTER
    returning
      value(RVAL) type ref to IF_IXML_NODE_ITERATOR .
  methods GET_ITEM
    importing
      !INDEX type I
    returning
      value(RVAL) type ref to IF_IXML_NODE .
  methods GET_LENGTH
    returning
      value(RVAL) type I .
endinterface.