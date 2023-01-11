*"* components of interface IF_IXML_NAMED_NODE_MAP
interface IF_IXML_NAMED_NODE_MAP
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
  methods GET_NAMED_ITEM
    importing
      !NAME type STRING
      !NAMESPACE type STRING default ''
    returning
      value(RVAL) type ref to IF_IXML_NODE .
  methods GET_NAMED_ITEM_NS
    importing
      !NAME type STRING
      !URI type STRING default ''
    returning
      value(RVAL) type ref to IF_IXML_NODE .
  methods REMOVE_NAMED_ITEM
    importing
      !NAME type STRING
      !NAMESPACE type STRING default ''
    returning
      value(RVAL) type I .
  methods REMOVE_NAMED_ITEM_NS
    importing
      !NAME type STRING
      !URI type STRING default ''
    returning
      value(RVAL) type I .
  methods SET_NAMED_ITEM
    importing
      !NODE type ref to IF_IXML_NODE
    returning
      value(RVAL) type I .
  methods SET_NAMED_ITEM_NS
    importing
      !NODE type ref to IF_IXML_NODE
    returning
      value(RVAL) type I .
endinterface.