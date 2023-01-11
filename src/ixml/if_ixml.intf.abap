*"* components of interface IF_IXML
interface IF_IXML
  public .


  interfaces IF_IXML_UNKNOWN .

  constants CO_MULTIPLE_DOCUMENTS type I value 0. "#EC NOTEXT
  constants CO_SINGLE_DOCUMENT type I value 1. "#EC NOTEXT
  constants CO_SINGLE_LARGE_DOCUMENT type I value 3. "#EC NOTEXT
  constants CO_SINGLE_SMALL_DOCUMENT type I value 2. "#EC NOTEXT

  methods ACTIVATE .
  methods CREATE_DOCUMENT
    returning
      value(RVAL) type ref to IF_IXML_DOCUMENT .
  methods CREATE_ENCODING
    importing
      !BYTE_ORDER type I
      !CHARACTER_SET type STRING
    returning
      value(RVAL) type ref to IF_IXML_ENCODING .
  methods CREATE_PARSER
    importing
      !DOCUMENT type ref to IF_IXML_DOCUMENT
      !ISTREAM type ref to IF_IXML_ISTREAM
      !STREAM_FACTORY type ref to IF_IXML_STREAM_FACTORY
    returning
      value(RVAL) type ref to IF_IXML_PARSER .
  methods CREATE_RENDERER
    importing
      !DOCUMENT type ref to IF_IXML_DOCUMENT
      !OSTREAM type ref to IF_IXML_OSTREAM
    returning
      value(RVAL) type ref to IF_IXML_RENDERER .
  methods CREATE_STREAM_FACTORY
    returning
      value(RVAL) type ref to IF_IXML_STREAM_FACTORY .
  methods CREATE_TOKEN_PARSER
    importing
      !DOCUMENT type ref to IF_IXML_DOCUMENT
      !ISTREAM type ref to IF_IXML_ISTREAM
      !STREAM_FACTORY type ref to IF_IXML_STREAM_FACTORY
    returning
      value(RVAL) type ref to IF_IXML_TOKEN_PARSER .
  methods CREATE_TOKEN_RENDERER
    importing
      !OSTREAM type ref to IF_IXML_OSTREAM
    returning
      value(RVAL) type ref to IF_IXML_TOKEN_RENDERER .
  methods GET_VERSION
    returning
      value(RVAL) type I .
  methods HAS_FEATURE
    importing
      !FEATURE type STRING
      !VERSION type STRING
    returning
      value(RVAL) type BOOLEAN .
  methods SET_CONVERSION_BEHAVIOUR
    importing
      !CODEPAGE type STRING default '*'
      !FAIL_ON_ERROR type BOOLEAN default ' '
      !REPLACEMENT_CHAR type IXML_C1 default '#'
    returning
      value(RVAL) type I .
endinterface.