*"* components of interface /IWBEP/IF_MGW_ODATA_ENTITY_TYP
interface /IWBEP/IF_MGW_ODATA_ENTITY_TYP
  public .


  interfaces /IWBEP/IF_MGW_ODATA_ANNOTATABL .
  interfaces /IWBEP/IF_MGW_ODATA_ITEM .

  aliases CREATE_ANNOTATION
    for /IWBEP/IF_MGW_ODATA_ANNOTATABL~CREATE_ANNOTATION .
  aliases GET_ID
    for /IWBEP/IF_MGW_ODATA_ITEM~GET_ID .
  aliases SET_LABEL_FROM_TEXT_ELEMENT
    for /IWBEP/IF_MGW_ODATA_ITEM~SET_LABEL_FROM_TEXT_ELEMENT .
  aliases SET_NAME
    for /IWBEP/IF_MGW_ODATA_ITEM~SET_NAME .

  types S type CHAR1 .

  methods SET_IS_VALUE_LIST
    importing
      !IV_IS_VALUE_LIST type ABAP_BOOL .
  methods BIND_STRUCTURE
    importing
      !IV_STRUCTURE_NAME type STRING
      !IV_BIND_CONVERSIONS type ABAP_BOOL default ABAP_FALSE
    raising
      /IWBEP/CX_MGW_MED_EXCEPTION .
  methods CREATE_PROPERTY
    importing
      !IV_PROPERTY_NAME type /IWBEP/IF_MGW_MED_ODATA_TYPES=>TY_E_MED_ENTITY_NAME
      !IV_ABAP_FIELDNAME type FIELDNAME optional
    returning
      value(RO_PROPERTY) type ref to /IWBEP/IF_MGW_ODATA_PROPERTY
    raising
      /IWBEP/CX_MGW_MED_EXCEPTION .
  methods GET_PROPERTY
    importing
      !IV_PROPERTY_NAME type /IWBEP/IF_MGW_MED_ODATA_TYPES=>TY_E_MED_ENTITY_NAME
    returning
      value(RO_PROPERTY) type ref to /IWBEP/IF_MGW_ODATA_PROPERTY
    raising
      /IWBEP/CX_MGW_MED_EXCEPTION .
  methods SET_CREATABLE
    importing
      !IV_CREATABLE type ABAP_BOOL default ABAP_TRUE .
  methods SET_UPDATABLE
    importing
      !IV_UPDATABLE type ABAP_BOOL default ABAP_TRUE .
  methods GET_IS_UPDATABLE
    returning
      value(RV_UPDATABLE) type ABAP_BOOL .
  methods SET_DELETABLE
    importing
      !IV_DELTABLE type ABAP_BOOL default ABAP_TRUE .
  methods SET_PAGEABLE
    importing
      !IV_PAGEABLE type ABAP_BOOL default ABAP_TRUE .
  methods SET_ADDRESSABLE
    importing
      !IV_ADDRESSABLE type ABAP_BOOL default ABAP_TRUE .
  methods SET_IS_MEDIA
    importing
      !IV_IS_MEDIA type ABAP_BOOL default ABAP_TRUE .
  methods GET_IS_MEDIA
    returning
      value(RV_IS_MEDIA) type ABAP_BOOL .
  methods SET_IS_ABSTRACT
    importing
      !IV_IS_ABSTRACT type ABAP_BOOL default ABAP_TRUE .
  methods SET_SUBSCRIBABLE
    importing
      !IV_SUBSCRIBABLE type ABAP_BOOL default ABAP_TRUE .
  methods SET_FILTER_REQUIRED
    importing
      !IV_REQ_FILTER type ABAP_BOOL default ABAP_TRUE .
  methods SET_HAS_FTXT_SEARCH
    importing
      !IV_FSEARCH type ABAP_BOOL default ABAP_TRUE .
  methods SET_SEMANTIC
    importing
      !IV_SEMANTIC type /IWBEP/IF_MGW_MED_ODATA_TYPES=>TY_E_MED_SEMANTIC .
  methods SET_IS_THING_TYPE
    importing
      !IV_THINGTYPE type ABAP_BOOL default ABAP_TRUE
    raising
      /IWBEP/CX_MGW_MED_EXCEPTION .
  methods SET_BASE_TYPE
    importing
      !IV_ENTITY_TYPE type /IWBEP/IF_MGW_MED_ODATA_TYPES=>TY_E_MED_ENTITY_NAME
    raising
      /IWBEP/CX_MGW_MED_EXCEPTION .
  methods CREATE_CMPLX_TYPE_PROPERTY
    importing
      !IV_PROPERTY_NAME type /IWBEP/IF_MGW_MED_ODATA_TYPES=>TY_E_MED_ENTITY_NAME
      !IV_COMPLEX_TYPE_NAME type /IWBEP/IF_MGW_MED_ODATA_TYPES=>TY_E_MED_ENTITY_NAME
      !IV_ABAP_FIELDNAME type FIELDNAME optional
      !IV_SOURCE_NAME type STRING optional
    returning
      value(RO_COMPLEX_PROP) type ref to /IWBEP/IF_MGW_ODATA_CMPLX_PROP
    raising
      /IWBEP/CX_MGW_MED_EXCEPTION .
  methods CREATE_COMPLEX_PROPERTY
    importing
      !IV_PROPERTY_NAME type /IWBEP/IF_MGW_MED_ODATA_TYPES=>TY_E_MED_ENTITY_NAME
      !IV_COMPLEX_TYPE_NAME type /IWBEP/IF_MGW_MED_ODATA_TYPES=>TY_E_MED_ENTITY_NAME
      !IV_ABAP_FIELDNAME type FIELDNAME optional
      !IV_SOURCE_NAME type STRING optional
    returning
      value(RO_COMPLEX_TYPE) type ref to /IWBEP/IF_MGW_ODATA_CMPLX_TYPE
    raising
      /IWBEP/CX_MGW_MED_EXCEPTION .
  methods CREATE_ENTITY_SET
    importing
      !IV_ENTITY_SET_NAME type /IWBEP/IF_MGW_MED_ODATA_TYPES=>TY_E_MED_ENTITY_NAME
    returning
      value(RO_ENTITY_SET) type ref to /IWBEP/IF_MGW_ODATA_ENTITY_SET
    raising
      /IWBEP/CX_MGW_MED_EXCEPTION .
  methods SET_FC_TARGET_PATH
    importing
      !IV_KEEP_IN_CONTENT type ABAP_BOOL default ABAP_FALSE
      !IV_FC_TARGET_PATH type STRING
    raising
      /IWBEP/CX_MGW_MED_EXCEPTION .
  methods CREATE_NAVIGATION_PROPERTY
    importing
      !IV_PROPERTY_NAME type /IWBEP/IF_MGW_MED_ODATA_TYPES=>TY_E_MED_ENTITY_NAME
      !IV_ASSOCIATION_NAME type /IWBEP/IF_MGW_MED_ODATA_TYPES=>TY_E_MED_ENTITY_NAME
      !IV_ABAP_FIELDNAME type FIELDNAME optional
    returning
      value(RO_NAVIGATION_PROPERTY) type ref to /IWBEP/IF_MGW_ODATA_NAV_PROP
    raising
      /IWBEP/CX_MGW_MED_EXCEPTION .
  methods GET_PROPERTIES
    returning
      value(RT_PROPERTIES) type /IWBEP/IF_MGW_MED_ODATA_TYPES=>TY_T_MGW_ODATA_PROPERTIES .
  methods get_property_infos
    exporting
      !ET_PROPERTY_INFOS type /IWBEP/IF_MGW_MED_ODATA_TYPES=>TY_T_MGW_ODATA_PROPERTIES_INFO .
  methods SET_TEXT_KEY
    importing
      !IV_TEXT_KEY type /IWBEP/IF_MGW_MED_ODATA_TYPES=>TY_E_MED_TEXT_KEY
      !IV_TEXT_OBJECT_TYPE type /IWBEP/IF_MGW_MED_ODATA_TYPES=>TY_E_MED_TEXT_OBJ_TYPE
      !IV_TEXT_ELEMENT_TYPE type /IWBEP/IF_MGW_MED_ODATA_TYPES=>TY_E_MED_TEXT_ELEMENT_TYPE default 'L'
      !IV_CREATE type ABAP_BOOL default ABAP_FALSE
    raising
      /IWBEP/CX_MGW_MED_EXCEPTION .
  methods SET_DISABLED
    importing
      !IV_DISABLED type BOOLEAN default ABAP_TRUE .
  methods GET_NAVIGATION_PROPERTY
    importing
      !IV_NAME type /IWBEP/MED_EXTERNAL_NAME
    returning
      value(RO_NAVIGATION_PROPERTY) type ref to /IWBEP/IF_MGW_ODATA_NAV_PROP
    raising
      /IWBEP/CX_MGW_MED_EXCEPTION .
  methods GET_CMPLX_TYPE_PROPERTY
    importing
      !IV_NAME type /IWBEP/IF_MGW_MED_ODATA_TYPES=>TY_E_MED_ENTITY_NAME
    returning
      value(RO_COMPLEX_PROPERTY) type ref to /IWBEP/IF_MGW_ODATA_CMPLX_PROP
    raising
      /IWBEP/CX_MGW_MED_EXCEPTION .
  methods GET_COMPLEX_PROPERTY
    importing
      !IV_NAME type /IWBEP/IF_MGW_MED_ODATA_TYPES=>TY_E_MED_ENTITY_NAME
    returning
      value(RO_COMPLEX_PROPERTY) type ref to /IWBEP/IF_MGW_ODATA_CMPLX_TYPE
    raising
      /IWBEP/CX_MGW_MED_EXCEPTION .
  methods ADD_AUTO_EXPAND_INCLUDE
    importing
      !IV_INCLUDE_NAME type STRING
      !IV_DUMMY_FIELD type FIELDNAME optional
      !IV_BIND_CONVERSIONS type ABAP_BOOL
    raising
      /IWBEP/CX_MGW_MED_EXCEPTION .
  methods GET_BASE_TYPE
    returning
      value(RV_BASE_ENTITY_TYPE) type /IWBEP/IF_MGW_MED_ODATA_TYPES=>TY_E_MED_ENTITY_NAME
    raising
      /IWBEP/CX_MGW_MED_EXCEPTION .
endinterface.