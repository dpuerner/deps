*"* components of interface /IWBEP/IF_MGW_ODATA_ENTITY_SET
"! <p class="shorttext synchronized" lang="en">Interface representing a script-based OData entity set</p>
interface /IWBEP/IF_MGW_ODATA_ENTITY_SET
  public .


  interfaces /IWBEP/IF_MGW_ODATA_ITEM .

  aliases GET_ID
    for /IWBEP/IF_MGW_ODATA_ITEM~GET_ID .
  aliases SET_LABEL_FROM_TEXT_ELEMENT
    for /IWBEP/IF_MGW_ODATA_ITEM~SET_LABEL_FROM_TEXT_ELEMENT .
  aliases SET_NAME
    for /IWBEP/IF_MGW_ODATA_ITEM~SET_NAME .

  "! <p class="shorttext synchronized" lang="en">Single-Character Indicator</p>
  types S type CHAR1 .

  "! <p class="shorttext synchronized" lang="en">Set Is Value Help</p>
  methods SET_IS_VALUE_HELP
    importing
      !IV_IS_VALUE_HELP type ABAP_BOOL .
  "! <p class="shorttext synchronized" lang="en">Set EntitySet features</p>
  methods SET_ENTITY_SET_FEATURES
    importing
      !IS_ENTITY_SET_FEATURES type /IWBEP/IF_MGW_APPL_TYPES=>TY_S_ENTITY_SET_FEATURES .
  "! <p class="shorttext synchronized" lang="en">creates an annotation container for all sets of entity type</p>
  "!
  "! @parameter iv_annotation_namespace | <p class="shorttext synchronized" lang="en">Single-Character Indicator</p>
  methods CREATE_ANNOTATION
    importing
      !IV_ANNOTATION_NAMESPACE type /IWBEP/MED_ANNO_NAMESPACE
    returning
      value(RO_ANNOTATION) type ref to /IWBEP/IF_MGW_ODATA_ANNOTATION
    raising
      /IWBEP/CX_MGW_MED_EXCEPTION .
  "! <p class="shorttext synchronized" lang="en">DEPRECATED - use set_label_from_text_element</p>
  "!
  "! @raising   /iwbep/cx_mgw_med_exception | <p class="shorttext synchronized" lang="en">Meta data exception</p>
  methods SET_TITLE
    importing
      !IV_TEXT_KEY type /IWBEP/IF_MGW_MED_ODATA_TYPES=>TY_E_MED_TEXT_KEY
      !IV_TEXT_OBJ_TYPE type /IWBEP/IF_MGW_MED_ODATA_TYPES=>TY_E_MED_TEXT_OBJ_TYPE
    raising
      /IWBEP/CX_MGW_MED_EXCEPTION .
  "! <p class="shorttext synchronized" lang="en">Set singular title (member:title)</p>
  "!
  "! @raising   /iwbep/cx_mgw_med_exception | <p class="shorttext synchronized" lang="en">Meta data exception</p>
  methods SET_MEMBER_TITLE
    importing
      !IV_TEXT_KEY type /IWBEP/IF_MGW_MED_ODATA_TYPES=>TY_E_MED_TEXT_KEY
      !IV_TEXT_OBJ_TYPE type /IWBEP/IF_MGW_MED_ODATA_TYPES=>TY_E_MED_TEXT_OBJ_TYPE
    raising
      /IWBEP/CX_MGW_MED_EXCEPTION .
  "! <p class="shorttext synchronized" lang="en">sets the member title from a text element of a report/object</p>
  methods SET_MEMBER_TITLE_FR_TELEMENT
    importing
      !IV_TEXT_ELEMENT_SYMBOL type TEXTPOOLKY
      !IV_TEXT_ELEMENT_CONTAINER type STRING optional
      !IO_OBJECT_REF type ref to OBJECT optional
    raising
      /IWBEP/CX_MGW_MED_EXCEPTION .
  "! <p class="shorttext synchronized" lang="en">Sets the creatable flag</p>
  methods SET_CREATABLE
    importing
      !IV_CREATABLE type ABAP_BOOL default ABAP_TRUE .
  "! <p class="shorttext synchronized" lang="en">Sets the updatable flag</p>
  methods SET_UPDATABLE
    importing
      !IV_UPDATABLE type ABAP_BOOL default ABAP_TRUE .
  "! <p class="shorttext synchronized" lang="en">Sets the deletable flag</p>
  methods SET_DELETABLE
    importing
      !IV_DELETABLE type ABAP_BOOL default ABAP_TRUE .
  "! <p class="shorttext synchronized" lang="en">Sets the pageable flag</p>
  methods SET_PAGEABLE
    importing
      !IV_PAGEABLE type ABAP_BOOL default ABAP_TRUE .
  "! <p class="shorttext synchronized" lang="en">Sets the addressable flag</p>
  methods SET_ADDRESSABLE
    importing
      !IV_ADDRESSABLE type ABAP_BOOL default ABAP_TRUE .
  "! <p class="shorttext synchronized" lang="en">Sets the flag that a filter is required for getting feeds</p>
  methods SET_FILTER_REQUIRED
    importing
      !IV_REQ_FILTER type ABAP_BOOL default ABAP_TRUE .
  "! <p class="shorttext synchronized" lang="en">Sets the freetext search flag</p>
  methods SET_HAS_FTXT_SEARCH
    importing
      !IV_FSEARCH type ABAP_BOOL default ABAP_TRUE .
  "! <p class="shorttext synchronized" lang="en">Sets the subscribable flag</p>
  methods SET_SUBSCRIBABLE
    importing
      !IV_SUBSCRIBABLE type ABAP_BOOL default ABAP_TRUE .
  "! <p class="shorttext synchronized" lang="en">Set the disabled flag</p>
  "!
  "! @parameter iv_disabled | <p class="shorttext synchronized" lang="en">Boolean Variable (X=True, -=False, Space=Unknown)</p>
  methods SET_DISABLED
    importing
      !IV_DISABLED type BOOLEAN default ABAP_TRUE .
  "! <p class="shorttext synchronized" lang="en">Set if "Cached Request Processing" (CRP) is supported</p>
  "!
  "! @parameter iv_use_crp | <p class="shorttext synchronized" lang="en">Default used from model-feature if not called</p>
  methods SET_USE_CRP
    importing
      !IV_USE_CRP type ABAP_BOOL .
endinterface.