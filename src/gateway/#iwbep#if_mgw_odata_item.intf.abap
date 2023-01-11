*"* components of interface /IWBEP/IF_MGW_ODATA_ITEM
interface /IWBEP/IF_MGW_ODATA_ITEM
  public .


  types S type CHAR1 .

  methods SET_HEADING_FROM_TEXT_ELEMENT
    importing
      !IV_TEXT_ELEMENT_SYMBOL type TEXTPOOLKY
      !IV_TEXT_ELEMENT_CONTAINER type STRING optional
      !IO_OBJECT_REF type ref to OBJECT optional
    raising
      /IWBEP/CX_MGW_MED_EXCEPTION .
  methods SET_LABEL_FROM_TEXT_ELEMENT
    importing
      !IV_TEXT_ELEMENT_SYMBOL type TEXTPOOLKY
      !IV_TEXT_ELEMENT_CONTAINER type STRING optional
      !IO_OBJECT_REF type ref to OBJECT optional
    raising
      /IWBEP/CX_MGW_MED_EXCEPTION .
  methods GET_ID
    returning
      value(RV_ID) type /IWBEP/IF_MGW_MED_ODATA_TYPES=>TY_E_MED_ENTITY_ID .
  methods SET_NAME
    importing
      !IV_NAME type /IWBEP/IF_MGW_MED_ODATA_TYPES=>TY_E_MED_ENTITY_NAME
    raising
      /IWBEP/CX_MGW_MED_EXCEPTION .
  methods SET_SOURCE_NAME
    importing
      !IV_SOURCE_NAME type STRING .
  methods GET_SOURCE_NAME
    returning
      value(RV_SOURCE_NAME) type STRING .
  methods CREATE_DOCUMENTATION
    returning
      value(RO_DOCUMENTATION) type ref to /IWBEP/IF_MGW_ODATA_DOCUMENTTN
    raising
      /IWBEP/CX_MGW_MED_EXCEPTION .
endinterface.