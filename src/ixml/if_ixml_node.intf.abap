*"* components of interface IF_IXML_NODE
interface IF_IXML_NODE
  public .


  interfaces IF_IXML_UNKNOWN .

  aliases QUERY_INTERFACE
    for IF_IXML_UNKNOWN~QUERY_INTERFACE .

  constants CO_NODE_ATTRIBUTE type I value 8. "#EC NOTEXT
  constants CO_NODE_ATTRIBUTE_DECL type I value 2097152. "#EC NOTEXT
  constants CO_NODE_ATT_LIST_DECL type I value 1048576. "#EC NOTEXT
  constants CO_NODE_CDATA_SECTION type I value 32. "#EC NOTEXT
  constants CO_NODE_COMMENT type I value 512. "#EC NOTEXT
  constants CO_NODE_COND_DTD_SECTION type I value 131072. "#EC NOTEXT
  constants CO_NODE_CONTENT_PARTICLE type I value 524288. "#EC NOTEXT
  constants CO_NODE_DOCUMENT type I value 1. "#EC NOTEXT
  constants CO_NODE_DOCUMENT_FRAGMENT type I value 2. "#EC NOTEXT
  constants CO_NODE_DOCUMENT_TYPE type I value 65536. "#EC NOTEXT
  constants CO_NODE_ELEMENT type I value 4. "#EC NOTEXT
  constants CO_NODE_ELEMENT_DECL type I value 262144. "#EC NOTEXT
  constants CO_NODE_ENTITY_DECL type I value 4194304. "#EC NOTEXT
  constants CO_NODE_ENTITY_REF type I value 64. "#EC NOTEXT
  constants CO_NODE_NAMESPACE_DECL type I value 16777216. "#EC NOTEXT
  constants CO_NODE_NOTATIONS_DECL type I value 8388608. "#EC NOTEXT
  constants CO_NODE_PI_PARSED type I value 256. "#EC NOTEXT
  constants CO_NODE_PI_UNPARSED type I value 128. "#EC NOTEXT
  constants CO_NODE_TEXT type I value 16. "#EC NOTEXT
  constants CO_NODE_XXX type I value 0. "#EC NOTEXT

  methods APPEND_CHILD
    importing
      !NEW_CHILD type ref to IF_IXML_NODE
    returning
      value(RVAL) type I .
  methods CLONE
    importing
      !DEPTH type I default -1
    returning
      value(RVAL) type ref to IF_IXML_NODE .
  methods CREATE_FILTER_ANCESTOR
    importing
      !FILTER_ANCESTOR type ref to IF_IXML_NODE_FILTER
    returning
      value(RVAL) type ref to IF_IXML_NODE_FILTER .
  methods CREATE_FILTER_AND
    importing
      !FILTER1 type ref to IF_IXML_NODE_FILTER
      !FILTER2 type ref to IF_IXML_NODE_FILTER
    returning
      value(RVAL) type ref to IF_IXML_NODE_FILTER .
  methods CREATE_FILTER_ATTRIBUTE
    importing
      !NAME type STRING
      !NAMESPACE type STRING default ''
      !VALUE type STRING default ''
    returning
      value(RVAL) type ref to IF_IXML_NODE_FILTER .
  methods CREATE_FILTER_ATTRIBUTE_NS
    importing
      !NAME type STRING
      !URI type STRING default ''
      !VALUE type STRING default ''
    returning
      value(RVAL) type ref to IF_IXML_NODE_FILTER .
  methods CREATE_FILTER_NAME
    importing
      !NAME type STRING
      !NAMESPACE type STRING default ''
    returning
      value(RVAL) type ref to IF_IXML_NODE_FILTER .
  methods CREATE_FILTER_NAME_NS
    importing
      !NAME type STRING
      !NAMESPACE type STRING default ''
    returning
      value(RVAL) type ref to IF_IXML_NODE_FILTER .
  methods CREATE_FILTER_NODE_TYPE
    importing
      !NODE_TYPES type I
    returning
      value(RVAL) type ref to IF_IXML_NODE_FILTER .
  methods CREATE_FILTER_NOT
    importing
      !FILTER_NOT type ref to IF_IXML_NODE_FILTER
    returning
      value(RVAL) type ref to IF_IXML_NODE_FILTER .
  methods CREATE_FILTER_OR
    importing
      !FILTER1 type ref to IF_IXML_NODE_FILTER
      !FILTER2 type ref to IF_IXML_NODE_FILTER
    returning
      value(RVAL) type ref to IF_IXML_NODE_FILTER .
  methods CREATE_FILTER_PARENT
    importing
      !FILTER_PARENT type ref to IF_IXML_NODE_FILTER
    returning
      value(RVAL) type ref to IF_IXML_NODE_FILTER .
  methods CREATE_INLINE_ITERATOR
    importing
      !DEPTH type I default 0
    returning
      value(RVAL) type ref to IF_IXML_INLINE_ITERATOR .
  methods CREATE_ITERATOR
    importing
      !DEPTH type I default 0
    returning
      value(RVAL) type ref to IF_IXML_NODE_ITERATOR .
  methods CREATE_ITERATOR_FILTERED
    importing
      !DEPTH type I default 0
      !FILTER type ref to IF_IXML_NODE_FILTER
    returning
      value(RVAL) type ref to IF_IXML_NODE_ITERATOR .
  methods CREATE_REV_INLINE_ITERATOR
    importing
      !DEPTH type I default 0
    returning
      value(RVAL) type ref to IF_IXML_INLINE_ITERATOR .
  methods CREATE_REV_ITERATOR
    importing
      !DEPTH type I default 0
    returning
      value(RVAL) type ref to IF_IXML_NODE_ITERATOR .
  methods CREATE_REV_ITERATOR_FILTERED
    importing
      !DEPTH type I default 0
      !FILTER type ref to IF_IXML_NODE_FILTER
    returning
      value(RVAL) type ref to IF_IXML_NODE_ITERATOR .
  methods FIND_FROM_GID
    importing
      !DEPTH type I default 0
      !GID type I
    returning
      value(RVAL) type ref to IF_IXML_NODE .
  methods GET_ATTRIBUTES
    returning
      value(RVAL) type ref to IF_IXML_NAMED_NODE_MAP .
  methods GET_CHILDREN
    returning
      value(RVAL) type ref to IF_IXML_NODE_LIST .
  methods GET_COLUMN
    returning
      value(RVAL) type I .
  methods GET_DEPTH
    returning
      value(RVAL) type I .
  methods GET_FIRST_CHILD
    returning
      value(RVAL) type ref to IF_IXML_NODE .
  methods GET_GID
    returning
      value(RVAL) type I .
  methods GET_HEIGHT
    returning
      value(RVAL) type I .
  methods GET_LAST_CHILD
    returning
      value(RVAL) type ref to IF_IXML_NODE .
  methods GET_LINE
    returning
      value(RVAL) type I .
  methods GET_NAME
    returning
      value(RVAL) type STRING .
  methods GET_NAMESPACE
    returning
      value(RVAL) type STRING .
  methods GET_NAMESPACE_CONTEXT
    returning
      value(RVAL) type ref to IF_IXML_NAMESPACE_CONTEXT .
  methods GET_NAMESPACE_PREFIX
    returning
      value(RVAL) type STRING .
  methods GET_NAMESPACE_URI
    returning
      value(RVAL) type STRING .
  methods GET_NEXT
    returning
      value(RVAL) type ref to IF_IXML_NODE .
  methods GET_OWNER_DOCUMENT
    returning
      value(RVAL) type ref to IF_IXML_DOCUMENT .
  methods GET_PARENT
    returning
      value(RVAL) type ref to IF_IXML_NODE .
  methods GET_PREV
    returning
      value(RVAL) type ref to IF_IXML_NODE .
  methods GET_ROOT
    returning
      value(RVAL) type ref to IF_IXML_NODE .
  methods GET_TYPE
    returning
      value(RVAL) type I .
  methods GET_VALUE
    returning
      value(RVAL) type STRING .
  methods HAS_ANCESTOR
    importing
      !ANCESTOR type ref to IF_IXML_NODE
    returning
      value(RVAL) type BOOLEAN .
  methods INSERT_CHILD
    importing
      !NEW_CHILD type ref to IF_IXML_NODE
      !REF_CHILD type ref to IF_IXML_NODE
    returning
      value(RVAL) type I .
  methods IS_LEAF
    returning
      value(RVAL) type BOOLEAN .
  methods IS_ROOT
    returning
      value(RVAL) type BOOLEAN .
  methods NUM_CHILDREN
    returning
      value(RVAL) type I .
  methods REMOVE_CHILD
    importing
      !OLD_CHILD type ref to IF_IXML_NODE
    returning
      value(RVAL) type I .
  methods REMOVE_NODE .
  methods RENDER
    importing
      !OSTREAM type ref to IF_IXML_OSTREAM
      !RECURSIVE type BOOLEAN default 'X' .
  methods REPLACE_CHILD
    importing
      !NEW_CHILD type ref to IF_IXML_NODE
      !OLD_CHILD type ref to IF_IXML_NODE
    returning
      value(RVAL) type I .
  methods SET_NAME
    importing
      !NAME type STRING
    returning
      value(RVAL) type I .
  methods SET_NAMESPACE
    importing
      !NAMESPACE type STRING
    returning
      value(RVAL) type I .
  methods SET_NAMESPACE_PREFIX
    importing
      !PREFIX type STRING
    returning
      value(RVAL) type I .
  methods SET_NAMESPACE_URI
    importing
      !URI type STRING
    returning
      value(RVAL) type I .
  methods SET_VALUE
    importing
      !VALUE type STRING
    returning
      value(RVAL) type I .
endinterface.