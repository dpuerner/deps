*"* components of interface IF_REST_REQUEST
interface IF_REST_REQUEST
  public .


  interfaces IF_REST_MESSAGE .

  aliases GC_METHOD_DELETE
    for IF_REST_MESSAGE~GC_METHOD_DELETE .
  aliases GC_METHOD_GET
    for IF_REST_MESSAGE~GC_METHOD_GET .
  aliases GC_METHOD_HEAD
    for IF_REST_MESSAGE~GC_METHOD_HEAD .
  aliases GC_METHOD_MERGE
    for IF_REST_MESSAGE~GC_METHOD_MERGE .
  aliases GC_METHOD_OPTIONS
    for IF_REST_MESSAGE~GC_METHOD_OPTIONS .
  aliases GC_METHOD_PATCH
    for IF_REST_MESSAGE~GC_METHOD_PATCH .
  aliases GC_METHOD_POST
    for IF_REST_MESSAGE~GC_METHOD_POST .
  aliases GC_METHOD_PUT
    for IF_REST_MESSAGE~GC_METHOD_PUT .
  aliases GET_ENTITY
    for IF_REST_MESSAGE~GET_ENTITY .
  aliases GET_HEADER_FIELD
    for IF_REST_MESSAGE~GET_HEADER_FIELD .
  aliases GET_HEADER_FIELDS
    for IF_REST_MESSAGE~GET_HEADER_FIELDS .

  constants GC_HEADER_METHOD_OVERRIDE type STRING value 'X-HTTP-Method-Override' ##no_text .
  constants GC_HEADER_REQUESTED_WITH type STRING value 'X-Requested-With' ##no_text .
  constants GC_HEADER_HTTP_METHOD type STRING value 'X-HTTP-Method' ##no_text .
  constants GC_HEADER_CSRF_TOKEN type STRING value 'X-CSRF-Token' ##no_text .

  methods SET_URI_ATTRIBUTES
    importing
      !IT_ATTRIBUTES type TIHTTPNVP .
  type-pools ABAP .
  methods GET_URI_ATTRIBUTE
    importing
      !IV_NAME type STRING
      !IV_ENCODED type ABAP_BOOL default ABAP_TRUE
    returning
      value(RV_VALUE) type STRING .
  methods GET_URI
    importing
      !IV_ENCODED type ABAP_BOOL default ABAP_TRUE
    returning
      value(RV_REQUEST_URI) type STRING .
  methods GET_METHOD
    returning
      value(RV_METHOD) type STRING .
  methods GET_URI_ATTRIBUTES
    importing
      !IV_ENCODED type ABAP_BOOL default ABAP_TRUE
    returning
      value(RT_ATTRIBUTES) type TIHTTPNVP .
  methods GET_URI_PATH
    importing
      !IV_ENCODED type ABAP_BOOL default ABAP_TRUE
    returning
      value(RV_REST_PATH) type STRING .
  methods GET_URI_MATRIX_PARAMETER
    importing
      !IV_NAME type STRING
    returning
      value(RV_VALUE) type STRING .
  methods GET_URI_QUERY_PARAMETER
    importing
      !IV_NAME type STRING
      !IV_ENCODED type ABAP_BOOL default ABAP_TRUE
    returning
      value(RV_VALUE) type STRING .
  methods GET_URI_MATRIX_PARAMETERS
    returning
      value(RT_PARAMETERS) type TIHTTPNVP .
  methods GET_URI_QUERY_PARAMETERS
    importing
      !IV_NAME type STRING optional
      !IV_ENCODED type ABAP_BOOL default ABAP_TRUE
    returning
      value(RT_PARAMETERS) type TIHTTPNVP .
  methods HAS_URI_QUERY_PARAMETER
    importing
      !IV_NAME type STRING
    returning
      value(RV_CONTAINS_PARAMETER) type ABAP_BOOL .
  methods GET_URI_SEGMENTS
    returning
      value(RT_SEGMENTS) type STRING_TABLE .
  methods GET_URI_FRAGMENT
    returning
      value(RV_FRAGMENT) type STRING .
endinterface.