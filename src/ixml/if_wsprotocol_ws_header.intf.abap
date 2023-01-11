*"* components of interface IF_WSPROTOCOL_WS_HEADER
interface IF_WSPROTOCOL_WS_HEADER
  public .


  interfaces IF_WSPROTOCOL .

  data VALUES type PRX_WS_HEADERS .

  methods SET_REQUEST_HEADER
    importing
      !NAME type STRING
      !NAMESPACE type STRING
      !DOM type ref to IF_IXML_ELEMENT
      !MUST_UNDERSTAND type BOOLEAN default SPACE .
  methods GET_RESPONSE_HEADER
    importing
      !NAME type STRING
      !NAMESPACE type STRING
    returning
      value(DOM) type ref to IF_IXML_ELEMENT .
endinterface.