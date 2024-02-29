interface IF_APC_WS_INITIAL_REQUEST
  public .


  constants CO_FORMFIELD_ENCODING_RAW type I value 1. "#EC NOTEXT
  constants CO_FORMFIELD_ENCODING_ENCODED type I value 2. "#EC NOTEXT

  methods GET_FORM_FIELD
    importing
      !I_NAME type STRING
      !I_FORMFIELD_ENCODING type I default 0
    returning
      value(R_VALUE) type STRING
    raising
      CX_APC_ERROR .
  methods GET_FORM_FIELD_CS
    importing
      !I_NAME type STRING
      !I_FORMFIELD_ENCODING type I default 0
    returning
      value(R_VALUE) type STRING
    raising
      CX_APC_ERROR .
  methods GET_HEADER_FIELD
    importing
      !I_NAME type STRING
    returning
      value(R_VALUE) type STRING
    raising
      CX_APC_ERROR .
  methods GET_HEADER_FIELDS
    changing
      value(C_FIELDS) type TIHTTPNVP
    raising
      CX_APC_ERROR .
  methods GET_FORM_FIELDS
    importing
      !I_FORMFIELD_ENCODING type I default 0
    changing
      !C_FIELDS type TIHTTPNVP
    raising
      CX_APC_ERROR .
  methods GET_COOKIE
    importing
      !I_NAME type STRING
      !I_PATH type STRING default ''
    exporting
      !E_VALUE type STRING
      !E_DOMAIN type STRING
      !E_EXPIRES type STRING
      !E_SECURE type I
    raising
      CX_APC_ERROR .
  methods GET_COOKIES
    changing
      !C_COOKIES type TIHTTPCKI
    raising
      CX_APC_ERROR .
endinterface.