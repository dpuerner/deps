*"* components of interface /IWBEP/IF_MGW_ODATA_CMPLX_TYPE
"! <p class="shorttext synchronized" lang="en">Interface representing a script-based OData complex type</p>
interface /IWBEP/IF_MGW_ODATA_CMPLX_TYPE
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

  "! <p class="shorttext synchronized" lang="en">Single-Character Indicator</p>
  types S type CHAR1 .

  "! <p class="shorttext synchronized" lang="en">Adds an auto expand include</p>
  "!
  "! @parameter iv_include_name             | <p class="shorttext synchronized" lang="en">Name of an Auto Expand Include</p>
  "! @parameter iv_dummy_field              | <p class="shorttext synchronized" lang="en">Dummy Field (enables the deliverry of an "empty" include)</p>
  "! @parameter iv_bind_conversions         | <p class="shorttext synchronized" lang="en">Consider conversion exits</p>
  "! @raising   /iwbep/cx_mgw_med_exception | <p class="shorttext synchronized" lang="en">Meta data exception</p>
  methods ADD_AUTO_EXPAND_INCLUDE
    importing
      !IV_INCLUDE_NAME type STRING
      !IV_DUMMY_FIELD type FIELDNAME optional
      !IV_BIND_CONVERSIONS type ABAP_BOOL
    raising
      /IWBEP/CX_MGW_MED_EXCEPTION .
  "! <p class="shorttext synchronized" lang="en"> binds a structure to the type using internal names</p>
  "!
  "! @parameter iv_bind_conversions | <p class="shorttext synchronized" lang="en">Consider conv. exits and ref. fields for currency and amount</p>
  methods BIND_STRUCTURE
    importing
      !IV_STRUCTURE_NAME type STRING
      !IV_BIND_CONVERSIONS type ABAP_BOOL default ABAP_FALSE
    raising
      /IWBEP/CX_MGW_MED_EXCEPTION .
  "! <p class="shorttext synchronized" lang="en">creates a complex type as a property</p>
  "!
  "! @parameter ro_complex_prop | <p class="shorttext synchronized" lang="en">OData Complex Property FPI</p>
  methods CREATE_CMPLX_TYPE_PROP
    importing
      !IV_PROPERTY_NAME type /IWBEP/IF_MGW_MED_ODATA_TYPES=>TY_E_MED_ENTITY_NAME
      !IV_COMPLEX_TYPE_NAME type /IWBEP/IF_MGW_MED_ODATA_TYPES=>TY_E_MED_ENTITY_NAME
      !IV_ABAP_FIELDNAME type FIELDNAME optional
    returning
      value(RO_COMPLEX_PROP) type ref to /IWBEP/IF_MGW_ODATA_CMPLX_PROP
    raising
      /IWBEP/CX_MGW_MED_EXCEPTION .
  "! <p class="shorttext synchronized" lang="en">Obsolete - use CREATE_cmplx_type_PROP</p>
  methods CREATE_COMPLEX_PROPERTY
    importing
      !IV_PROPERTY_NAME type /IWBEP/IF_MGW_MED_ODATA_TYPES=>TY_E_MED_ENTITY_NAME
      !IV_COMPLEX_TYPE_NAME type /IWBEP/IF_MGW_MED_ODATA_TYPES=>TY_E_MED_ENTITY_NAME
      !IV_ABAP_FIELDNAME type FIELDNAME optional
    returning
      value(RO_COMPLEX_TYPE) type ref to /IWBEP/IF_MGW_ODATA_CMPLX_TYPE
    raising
      /IWBEP/CX_MGW_MED_EXCEPTION .
  "! <p class="shorttext synchronized" lang="en">creates a single property</p>
  methods CREATE_PROPERTY
    importing
      !IV_PROPERTY_NAME type /IWBEP/IF_MGW_MED_ODATA_TYPES=>TY_E_MED_ENTITY_NAME
      !IV_ABAP_FIELDNAME type FIELDNAME optional
      !IV_SOURCE_NAME type STRING optional
    returning
      value(RO_PROPERTY) type ref to /IWBEP/IF_MGW_ODATA_PROPERTY
    raising
      /IWBEP/CX_MGW_MED_EXCEPTION .
  "! <p class="shorttext synchronized" lang="en">Returns a specific complex property object</p>
  "!
  "! @parameter ro_complex_property         | <p class="shorttext synchronized" lang="en">interface representing a script based odata complex type</p>
  "! @raising   /iwbep/cx_mgw_med_exception | <p class="shorttext synchronized" lang="en">Meta data exception</p>
  methods GET_CMPLX_TYPE_PROPERTY
    importing
      !IV_NAME type /IWBEP/IF_MGW_MED_ODATA_TYPES=>TY_E_MED_ENTITY_NAME
    returning
      value(RO_COMPLEX_PROPERTY) type ref to /IWBEP/IF_MGW_ODATA_CMPLX_PROP
    raising
      /IWBEP/CX_MGW_MED_EXCEPTION .
  "! <p class="shorttext synchronized" lang="en">Returns a list of the complex type's properties</p>
  "!
  "! @parameter rt_properties | <p class="shorttext synchronized" lang="en">List of External Prop. Names &amp; References to the Properties</p>
  methods GET_PROPERTIES
    returning
      value(RT_PROPERTIES) type /IWBEP/IF_MGW_MED_ODATA_TYPES=>TY_T_MGW_ODATA_PROPERTIES .
  "! <p class="shorttext synchronized" lang="en">returns a property object using the external name</p>
  methods GET_PROPERTY
    importing
      !IV_PROPERTY_NAME type /IWBEP/IF_MGW_MED_ODATA_TYPES=>TY_E_MED_ENTITY_NAME
    returning
      value(RO_PROPERTY) type ref to /IWBEP/IF_MGW_ODATA_PROPERTY
    raising
      /IWBEP/CX_MGW_MED_EXCEPTION .
  "! <p class="shorttext synchronized" lang="en">sets the base/super type of the complex type (inheritance)</p>
  methods SET_BASE_TYPE
    importing
      !IV_ENTITY_TYPE type /IWBEP/IF_MGW_MED_ODATA_TYPES=>TY_E_MED_ENTITY_NAME
    raising
      /IWBEP/CX_MGW_MED_EXCEPTION .
  "! <p class="shorttext synchronized" lang="en">disables the complex type</p>
  methods SET_DISABLED
    importing
      !IV_DISABLED type ABAP_BOOL default ABAP_TRUE .
    "! <p class="shorttext synchronized" lang="en">Get the is_enabled flag of the property</p>
  methods GET_IS_DISABLED
    returning
      value(RV_DISABLED) type ABAP_BOOL .
  "! <p class="shorttext synchronized" lang="en">sets the abstract flag on the type (in terms of inheritance)</p>
  methods SET_IS_ABSTRACT
    importing
      !IV_IS_ABSTRACT type ABAP_BOOL default ABAP_TRUE .
  "! <p class="shorttext synchronized" lang="en">Retrieves the base type</p>
  "!
  "! @raising   /iwbep/cx_mgw_med_exception | <p class="shorttext synchronized" lang="en">Meta data exception</p>
  methods GET_BASE_TYPE
    returning
      value(RV_BASE_ENTITY_TYPE) type /IWBEP/IF_MGW_MED_ODATA_TYPES=>TY_E_MED_ENTITY_NAME
    raising
      /IWBEP/CX_MGW_MED_EXCEPTION .
endinterface.