*"* components of interface IF_IXML_ELEMENT
interface IF_IXML_ELEMENT
  public .


  interfaces IF_IXML_NODE .

  aliases APPEND_CHILD
    for IF_IXML_NODE~APPEND_CHILD .
  aliases CLONE
    for IF_IXML_NODE~CLONE .
  aliases CREATE_FILTER_ANCESTOR
    for IF_IXML_NODE~CREATE_FILTER_ANCESTOR .
  aliases CREATE_FILTER_AND
    for IF_IXML_NODE~CREATE_FILTER_AND .
  aliases CREATE_FILTER_ATTRIBUTE
    for IF_IXML_NODE~CREATE_FILTER_ATTRIBUTE .
  aliases CREATE_FILTER_ATTRIBUTE_NS
    for IF_IXML_NODE~CREATE_FILTER_ATTRIBUTE_NS .
  aliases CREATE_FILTER_NAME
    for IF_IXML_NODE~CREATE_FILTER_NAME .
  aliases CREATE_FILTER_NAME_NS
    for IF_IXML_NODE~CREATE_FILTER_NAME_NS .
  aliases CREATE_FILTER_NODE_TYPE
    for IF_IXML_NODE~CREATE_FILTER_NODE_TYPE .
  aliases CREATE_FILTER_NOT
    for IF_IXML_NODE~CREATE_FILTER_NOT .
  aliases CREATE_FILTER_OR
    for IF_IXML_NODE~CREATE_FILTER_OR .
  aliases CREATE_FILTER_PARENT
    for IF_IXML_NODE~CREATE_FILTER_PARENT .
  aliases CREATE_INLINE_ITERATOR
    for IF_IXML_NODE~CREATE_INLINE_ITERATOR .
  aliases CREATE_ITERATOR
    for IF_IXML_NODE~CREATE_ITERATOR .
  aliases CREATE_ITERATOR_FILTERED
    for IF_IXML_NODE~CREATE_ITERATOR_FILTERED .
  aliases CREATE_REV_INLINE_ITERATOR
    for IF_IXML_NODE~CREATE_REV_INLINE_ITERATOR .
  aliases CREATE_REV_ITERATOR
    for IF_IXML_NODE~CREATE_REV_ITERATOR .
  aliases CREATE_REV_ITERATOR_FILTERED
    for IF_IXML_NODE~CREATE_REV_ITERATOR_FILTERED .
  aliases FIND_FROM_GID
    for IF_IXML_NODE~FIND_FROM_GID .
  aliases GET_ATTRIBUTES
    for IF_IXML_NODE~GET_ATTRIBUTES .
  aliases GET_CHILDREN
    for IF_IXML_NODE~GET_CHILDREN .
  aliases GET_COLUMN
    for IF_IXML_NODE~GET_COLUMN .
  aliases GET_DEPTH
    for IF_IXML_NODE~GET_DEPTH .
  aliases GET_FIRST_CHILD
    for IF_IXML_NODE~GET_FIRST_CHILD .
  aliases GET_GID
    for IF_IXML_NODE~GET_GID .
  aliases GET_HEIGHT
    for IF_IXML_NODE~GET_HEIGHT .
  aliases GET_LAST_CHILD
    for IF_IXML_NODE~GET_LAST_CHILD .
  aliases GET_LINE
    for IF_IXML_NODE~GET_LINE .
  aliases GET_NAME
    for IF_IXML_NODE~GET_NAME .
  aliases GET_NAMESPACE
    for IF_IXML_NODE~GET_NAMESPACE .
  aliases GET_NAMESPACE_CONTEXT
    for IF_IXML_NODE~GET_NAMESPACE_CONTEXT .
  aliases GET_NAMESPACE_PREFIX
    for IF_IXML_NODE~GET_NAMESPACE_PREFIX .
  aliases GET_NAMESPACE_URI
    for IF_IXML_NODE~GET_NAMESPACE_URI .
  aliases GET_NEXT
    for IF_IXML_NODE~GET_NEXT .
  aliases GET_OWNER_DOCUMENT
    for IF_IXML_NODE~GET_OWNER_DOCUMENT .
  aliases GET_PARENT
    for IF_IXML_NODE~GET_PARENT .
  aliases GET_PREV
    for IF_IXML_NODE~GET_PREV .
  aliases GET_ROOT
    for IF_IXML_NODE~GET_ROOT .
  aliases GET_TYPE
    for IF_IXML_NODE~GET_TYPE .
  aliases GET_VALUE
    for IF_IXML_NODE~GET_VALUE .
  aliases HAS_ANCESTOR
    for IF_IXML_NODE~HAS_ANCESTOR .
  aliases INSERT_CHILD
    for IF_IXML_NODE~INSERT_CHILD .
  aliases IS_LEAF
    for IF_IXML_NODE~IS_LEAF .
  aliases IS_ROOT
    for IF_IXML_NODE~IS_ROOT .
  aliases NUM_CHILDREN
    for IF_IXML_NODE~NUM_CHILDREN .
  aliases QUERY_INTERFACE
    for IF_IXML_NODE~QUERY_INTERFACE .
  aliases REMOVE_CHILD
    for IF_IXML_NODE~REMOVE_CHILD .
  aliases REMOVE_NODE
    for IF_IXML_NODE~REMOVE_NODE .
  aliases RENDER
    for IF_IXML_NODE~RENDER .
  aliases REPLACE_CHILD
    for IF_IXML_NODE~REPLACE_CHILD .
  aliases SET_NAME
    for IF_IXML_NODE~SET_NAME .
  aliases SET_NAMESPACE
    for IF_IXML_NODE~SET_NAMESPACE .
  aliases SET_NAMESPACE_PREFIX
    for IF_IXML_NODE~SET_NAMESPACE_PREFIX .
  aliases SET_NAMESPACE_URI
    for IF_IXML_NODE~SET_NAMESPACE_URI .
  aliases SET_VALUE
    for IF_IXML_NODE~SET_VALUE .

  methods CONTAINS
    importing
      !NODE_TYPES type I
    returning
      value(RVAL) type BOOLEAN .
  methods FIND_FROM_NAME
    importing
      !DEPTH type I default 0
      !NAME type STRING
      !NAMESPACE type STRING default ''
    returning
      value(RVAL) type ref to IF_IXML_ELEMENT .
  methods FIND_FROM_NAME_NS
    importing
      !DEPTH type I default 0
      !NAME type STRING
      !URI type STRING default ''
    returning
      value(RVAL) type ref to IF_IXML_ELEMENT .
  methods FIND_FROM_PATH
    importing
      !PATH type STRING
    returning
      value(RVAL) type ref to IF_IXML_ELEMENT .
  methods FIND_FROM_PATH_NS
    importing
      !DEFAULT_URI type STRING
      !PATH type STRING
    returning
      value(RVAL) type ref to IF_IXML_ELEMENT .
  methods GET_ATTRIBUTE
    importing
      !NAME type STRING
      !NAMESPACE type STRING default ''
    returning
      value(RVAL) type STRING .
  methods GET_ATTRIBUTE_NODE
    importing
      !NAME type STRING
      !NAMESPACE type STRING default ''
    returning
      value(RVAL) type ref to IF_IXML_ATTRIBUTE .
  methods GET_ATTRIBUTE_NODE_NS
    importing
      !NAME type STRING
      !URI type STRING default ''
    returning
      value(RVAL) type ref to IF_IXML_ATTRIBUTE .
  methods GET_ATTRIBUTE_NS
    importing
      !NAME type STRING
      !URI type STRING default ''
    returning
      value(RVAL) type STRING .
  methods GET_CONTENT_AS_STRING
    returning
      value(RVAL) type STRING .
  methods GET_ELEMENTS_BY_TAG_NAME
    importing
      !DEPTH type I default 0
      !NAME type STRING
      !NAMESPACE type STRING default ''
    returning
      value(RVAL) type ref to IF_IXML_NODE_COLLECTION .
  methods GET_ELEMENTS_BY_TAG_NAME_NS
    importing
      !DEPTH type I default 0
      !NAME type STRING
      !URI type STRING default ''
    returning
      value(RVAL) type ref to IF_IXML_NODE_COLLECTION .
  methods NORMALIZE .
  methods REMOVE_ATTRIBUTE
    importing
      !NAME type STRING
      !NAMESPACE type STRING default ''
    returning
      value(RVAL) type I .
  methods REMOVE_ATTRIBUTE_NODE
    importing
      !OLD_ATTR type ref to IF_IXML_ATTRIBUTE
    returning
      value(RVAL) type I .
  methods REMOVE_ATTRIBUTE_NODE_NS
    importing
      !OLD_ATTR type ref to IF_IXML_ATTRIBUTE
    returning
      value(RVAL) type I .
  methods REMOVE_ATTRIBUTE_NS
    importing
      !NAME type STRING
      !URI type STRING default ''
    returning
      value(RVAL) type I .
  methods SET_ATTRIBUTE
    importing
      !NAME type STRING
      !NAMESPACE type STRING default ''
      !VALUE type STRING default ''
    returning
      value(RVAL) type I .
  methods SET_ATTRIBUTE_NODE
    importing
      !NEW_ATTR type ref to IF_IXML_ATTRIBUTE
    returning
      value(RVAL) type I .
  methods SET_ATTRIBUTE_NODE_NS
    importing
      !NEW_ATTR type ref to IF_IXML_ATTRIBUTE
    returning
      value(RVAL) type I .
  methods SET_ATTRIBUTE_NS
    importing
      !NAME type STRING
      !PREFIX type STRING default ''
      !URI type STRING default ''
      !VALUE type STRING default ''
    returning
      value(RVAL) type I .
endinterface.