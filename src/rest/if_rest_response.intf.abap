*"* components of interface IF_REST_RESPONSE
interface IF_REST_RESPONSE
  public .


  interfaces IF_REST_MESSAGE .

  aliases GC_METHOD_DELETE
    for IF_REST_MESSAGE~GC_METHOD_DELETE .
  aliases GC_METHOD_GET
    for IF_REST_MESSAGE~GC_METHOD_GET .
  aliases GC_METHOD_HEAD
    for IF_REST_MESSAGE~GC_METHOD_HEAD .
  aliases GC_METHOD_OPTIONS
    for IF_REST_MESSAGE~GC_METHOD_OPTIONS .
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

  methods GET_STATUS
    returning
      value(RV_STATUS) type I .
  methods SET_STATUS
    importing
      !IV_STATUS type I
      !IV_REASON_PHRASE type STRING optional .
  methods GET_ETAG
    returning
      value(RS_ETAG) type REST_ETAG_S .
  methods SET_ETAG
    importing
      !IS_ETAG type REST_ETAG_S .
  type-pools ABAP .
  methods SET_ENTITY_TAG
    importing
      !IV_WEAK type ABAP_BOOL default ABAP_FALSE
      !IV_ETAG type STRING .
  methods GET_ENTITY_TAG
    exporting
      !EV_WEAK type ABAP_BOOL
      !EV_ETAG type STRING .
  methods SET_HEADER_FIELD
    importing
      !IV_NAME type STRING
      !IV_VALUE type STRING .
  methods SET_HEADER_FIELDS
    importing
      !IT_HEADER_FIELDS type TIHTTPNVP .
  methods CREATE_ENTITY
    importing
      !IV_MULTIPART type ABAP_BOOL default ABAP_FALSE
    returning
      value(RO_ENTITY) type ref to IF_REST_ENTITY .
  methods SET_REASON
    importing
      !IV_REASON type STRING .
  methods GET_REASON
    returning
      value(RV_REASON) type STRING .
endinterface.