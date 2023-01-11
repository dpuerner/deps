*"* components of interface IF_REST_ENTITY
interface IF_REST_ENTITY
  public .


  methods GET_CONTENT_TYPE
    exporting
      !EV_MEDIA_TYPE type STRING
      !ET_PARAMETER type TIHTTPNVP .
  methods SET_CONTENT_TYPE
    importing
      !IV_MEDIA_TYPE type STRING
      !IT_PARAMETER type TIHTTPNVP optional .
  methods GET_CONTENT_LANGUAGE
    returning
      value(RV_LANGUAGE) type LANGU .
  methods SET_CONTENT_LANGUAGE
    importing
      !IV_LANGUAGE type LANGU .
  type-pools ABAP .
  methods GET_CONTENT_COMPRESSION
    returning
      value(RV_COMPRESSION) type ABAP_BOOL .
  methods SET_CONTENT_COMPRESSION
    importing
      !IV_COMPRESSION type ABAP_BOOL .
  methods SET_CONTENT_LOCATION
    importing
      !IV_LOCATION type STRING .
  methods GET_CONTENT_LOCATION
    returning
      value(RV_LOCATION) type STRING .
  methods GET_EXPIRATION_DATE
    returning
      value(RV_EXPIRATION_DATE) type TIMESTAMP .
  methods SET_EXPIRATION_DATE
    importing
      !IV_EXPIRATION_DATE type TIMESTAMP .
  methods GET_MODIFICATION_DATE
    returning
      value(RV_MODIFICATION_DATE) type TIMESTAMP .
  methods SET_MODIFICATION_DATE
    importing
      !IV_MODIFICATION_DATE type TIMESTAMP .
  methods GET_BINARY_DATA
    returning
      value(RV_DATA) type XSTRING .
  methods GET_STRING_DATA
    returning
      value(RV_DATA) type STRING .
  methods SET_BINARY_DATA
    importing
      !IV_DATA type XSTRING .
  methods SET_STRING_DATA
    importing
      !IV_DATA type STRING .
  methods SET_HEADER_FIELD
    importing
      !IV_NAME type STRING
      !IV_VALUE type STRING .
  methods GET_HEADER_FIELD
    importing
      !IV_NAME type STRING
    returning
      value(RV_VALUE) type STRING .
  methods SET_HEADER_FIELDS
    importing
      !IT_HEADER_FIELDS type TIHTTPNVP .
  methods GET_HEADER_FIELDS
    returning
      value(RT_HEADER_FIELDS) type TIHTTPNVP .
  methods GET_CONTENT_LENGTH
    returning
      value(RV_CONTENT_LENGTH) type I .
  methods SET_VIRUS_SCAN_PROFILE
    importing
      !IV_PROFILE type VSCAN_PROFILE optional .
  methods GET_VIRUS_SCAN_PROFILE
    returning
      value(RD_PROFILE) type ref to VSCAN_PROFILE .
endinterface.