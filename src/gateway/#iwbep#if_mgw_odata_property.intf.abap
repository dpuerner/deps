*"* components of interface /IWBEP/IF_MGW_ODATA_PROPERTY
"! <p class="shorttext synchronized" lang="en">Interface representing a script-based OData property</p>
interface /IWBEP/IF_MGW_ODATA_PROPERTY
  public .

  type-pools ABAP .
  interface /IWBEP/IF_MGW_APPL_TYPES load .
  interface /IWBEP/IF_MGW_MED_ODATA_TYPES load .

  interfaces /IWBEP/IF_MGW_ODATA_ANNOTATABL .
  interfaces /IWBEP/IF_MGW_ODATA_ITEM .

  aliases GET_ID
    for /IWBEP/IF_MGW_ODATA_ITEM~GET_ID .
  aliases SET_LABEL_FROM_TEXT_ELEMENT
    for /IWBEP/IF_MGW_ODATA_ITEM~SET_LABEL_FROM_TEXT_ELEMENT .
  aliases SET_NAME
    for /IWBEP/IF_MGW_ODATA_ITEM~SET_NAME .

  "! <p class="shorttext synchronized" lang="en">Single-Character Indicator</p>
  types S type CHAR1 .

  constants:
    BEGIN OF gcs_value_list_type_property,
      fixed_values TYPE /iwbep/mgw_med_prop_value_list VALUE 'F',  "has value help with a few values
      standard     TYPE /iwbep/mgw_med_prop_value_list VALUE 'S',  "has value help with an unforeseeable number of values
    END OF gcs_value_list_type_property .

  methods SET_VALUE_LIST
    importing
      !IV_VALUE_LIST_TYPE type /IWBEP/MGW_MED_PROP_VALUE_LIST default /IWBEP/IF_MGW_ODATA_PROPERTY=>GCS_VALUE_LIST_TYPE_PROPERTY-STANDARD .
  "! <p class="shorttext synchronized" lang="en">binds a ddic data element to the property</p>
  methods BIND_DATA_ELEMENT
    importing
      !IV_ELEMENT_NAME type STRING
      !IV_BIND_CONVERSIONS type ABAP_BOOL default ABAP_FALSE
    raising
      /IWBEP/CX_MGW_MED_EXCEPTION .
  "! <p class="shorttext synchronized" lang="en">binds a ddic data element to the property for text</p>
  methods BIND_DATA_ELEMENT_FOR_TEXT
    importing
      !IV_ELEMENT_NAME type STRING
    raising
      /IWBEP/CX_MGW_MED_EXCEPTION .
  "! <p class="shorttext synchronized" lang="en">Disables the conversion for the property</p>
  methods DISABLE_CONVERSION .
  "! <p class="shorttext synchronized" lang="en">Enables the conversion for the property</p>
  "!
  "! @raising   /iwbep/cx_mgw_med_exception | <p class="shorttext synchronized" lang="en">Meta data exception</p>
  methods ENABLE_CONVERSION
    raising
      /IWBEP/CX_MGW_MED_EXCEPTION .
  "! <p class="shorttext synchronized" lang="en">sets the feed customization for the author atom element</p>
  methods SET_AS_AUTHOR
    importing
      !IV_KEEP_IN_CONTENT type ABAP_BOOL default ABAP_FALSE
    raising
      /IWBEP/CX_MGW_MED_EXCEPTION .
  "! <p class="shorttext synchronized" lang="en">sets the property as content source (href) for media types</p>
  "!
  "! @raising   /iwbep/cx_mgw_med_exception | <p class="shorttext synchronized" lang="en">Meta data exception</p>
  methods SET_AS_CONTENT_SOURCE
    raising
      /IWBEP/CX_MGW_MED_EXCEPTION .
  "! <p class="shorttext synchronized" lang="en">sets the property as content type (mime) for media types</p>
  "!
  "! @raising   /iwbep/cx_mgw_med_exception | <p class="shorttext synchronized" lang="en">Meta data exception</p>
  methods SET_AS_CONTENT_TYPE
    raising
      /IWBEP/CX_MGW_MED_EXCEPTION .
  "! <p class="shorttext synchronized" lang="en">sets the property as etag value</p>
  methods SET_AS_ETAG
    raising
      /IWBEP/CX_MGW_MED_EXCEPTION .
  "! <p class="shorttext synchronized" lang="en">sets the feed customization for the published atom element</p>
  "!
  "! @raising   /iwbep/cx_mgw_med_exception | <p class="shorttext synchronized" lang="en">Meta data exception</p>
  methods SET_AS_PUBLISHED
    importing
      !IV_KEEP_IN_CONTENT type ABAP_BOOL default ABAP_FALSE
    raising
      /IWBEP/CX_MGW_MED_EXCEPTION .
  "! <p class="shorttext synchronized" lang="en">sets the feed customization for the title atom element</p>
  "!
  "! @parameter iv_keep_in_content | <p class="shorttext synchronized" lang="en">keeps the property in the payload depending on the parameter</p>
  methods SET_AS_TITLE
    importing
      !IV_KEEP_IN_CONTENT type ABAP_BOOL default ABAP_FALSE
    raising
      /IWBEP/CX_MGW_MED_EXCEPTION .
  "! <p class="shorttext synchronized" lang="en">sets the feed customization for the updated atom element</p>
  methods SET_AS_UPDATED
    importing
      !IV_KEEP_IN_CONTENT type ABAP_BOOL default ABAP_FALSE
    raising
      /IWBEP/CX_MGW_MED_EXCEPTION .
  "! <p class="shorttext synchronized" lang="en">sets the name of conversion exit for the property</p>
  "!
  "! @parameter iv_round_sign | <p class="shorttext synchronized" lang="en">Unit amount only (+ up, - down, X commercial, b no rounding)</p>
  methods SET_CONVERSION_EXIT
    importing
      !IV_CONV_EXIT type /IWBEP/IF_MGW_MED_ODATA_TYPES=>TY_E_MED_CONV_EXIT
      !IV_ROUND_SIGN type CHAR1 default SPACE .
  "! <p class="shorttext synchronized" lang="en">sets the creatable flag in terms of the sdata spec</p>
  methods SET_CREATABLE
    importing
      !IV_CREATABLE type ABAP_BOOL default ABAP_TRUE .
  "! <p class="shorttext synchronized" lang="en">sets the is_enabled flag of the property</p>
  methods SET_DISABLED
    importing
      !IV_DISABLED type ABAP_BOOL default ABAP_TRUE .
  "! <p class="shorttext synchronized" lang="en">Get the is_enabled flag of the property</p>
  methods GET_IS_DISABLED
    returning
      value(RV_DISABLED) type ABAP_BOOL .
  "! <p class="shorttext synchronized" lang="en">sets the feed customization generically</p>
  methods SET_FC_TARGET_PATH
    importing
      !IV_KEEP_IN_CONTENT type ABAP_BOOL default ABAP_FALSE
      !IV_FC_TARGET_PATH type STRING
    raising
      /IWBEP/CX_MGW_MED_EXCEPTION .
  "! <p class="shorttext synchronized" lang="en">sets the property that contains the field control</p>
  "!
  "! @parameter iv_field_control_property | <p class="shorttext synchronized" lang="en">Name of the property used to control the property</p>
  methods SET_FIELD_CONTROL
    importing
      !IV_FIELD_CONTROL_PROPERTY type /IWBEP/IF_MGW_MED_ODATA_TYPES=>TY_E_MED_ENTITY_NAME
    raising
      /IWBEP/CX_MGW_MED_EXCEPTION .
  "! <p class="shorttext synchronized" lang="en">sets the filterable flag meaning that is usable as filter</p>
  methods SET_FILTERABLE
    importing
      !IV_FILTERABLE type ABAP_BOOL default ABAP_TRUE .
  "! <p class="shorttext synchronized" lang="en">USAGE NOT RECOMMENDED - sets the internal abap length</p>
  methods SET_INTERNAL_LENGTH
    importing
      !IV_INTERNAL_LENGTH type I .
  "! <p class="shorttext synchronized" lang="en">sets the internal abap type for the property</p>
  methods SET_INTERNAL_TYPE
    importing
      !IV_TYPE type ABAP_TYPEKIND .
  "! <p class="shorttext synchronized" lang="en">sets the is-extension-field flag for the property</p>
  methods SET_IS_EXTENSION_FIELD
    importing
      !IV_IS_EXTENSION_FIELD type ABAP_BOOL default ABAP_TRUE .
  "! <p class="shorttext synchronized" lang="en">sets the is key flag</p>
  methods SET_IS_KEY
    importing
      !IV_KEY type ABAP_BOOL default ABAP_TRUE .
  "! <p class="shorttext synchronized" lang="en">sets the maximal length of the property for input fields</p>
  methods SET_MAXLENGTH
    importing
      !IV_MAX_LENGTH type I .
  "! <p class="shorttext synchronized" lang="en">sets the nullable flag, meaning that it is optional</p>
  methods SET_NULLABLE
    importing
      !IV_NULLABLE type ABAP_BOOL default ABAP_TRUE .
  "! <p class="shorttext synchronized" lang="en">sets the precesion, decimals for the property</p>
  methods SET_PRECISON
    importing
      !IV_PRECISION type I .
  "! <p class="shorttext synchronized" lang="en">sets the name of a property in the same type</p>
  "!
  "! @parameter iv_annotation_key | <p class="shorttext synchronized" lang="en">Annotation key</p>
  "! @parameter iv_property       | <p class="shorttext synchronized" lang="en">Name of the property refered to</p>
  methods SET_REFERENCE_ANNOTATION
    importing
      !IV_ANNOTATION_KEY type /IWBEP/MED_ANNOTATION_KEY
      !IV_PROPERTY type /IWBEP/MED_EXTERNAL_NAME
    raising
      /IWBEP/CX_MGW_MED_EXCEPTION .
  "! <p class="shorttext synchronized" lang="en">sets the semantic field for the property</p>
  methods SET_SEMANTIC
    importing
      !IV_SEMANTIC type /IWBEP/IF_MGW_MED_ODATA_TYPES=>TY_E_MED_SEMANTIC .
  "! <p class="shorttext synchronized" lang="en">sets the sortable flag for the property</p>
  methods SET_SORTABLE
    importing
      !IV_SORTABLE type ABAP_BOOL default ABAP_TRUE .
  "! <p class="shorttext synchronized" lang="en">set arbitary provider specific information</p>
  methods SET_PROVIDER_INFO
    importing
      !IV_PROVIDER_INFO type STRING .
  "! <p class="shorttext synchronized" lang="en">sets a text key</p>
  "!
  "! @parameter iv_text_element_type | <p class="shorttext synchronized" lang="en">Label etc</p>
  "! @parameter iv_create            | <p class="shorttext synchronized" lang="en">do not use &#64;deprecated</p>
  methods SET_TEXT_KEY
    importing
      !IV_TEXT_KEY type /IWBEP/IF_MGW_MED_ODATA_TYPES=>TY_E_MED_TEXT_KEY
      !IV_TEXT_OBJECT_TYPE type /IWBEP/IF_MGW_MED_ODATA_TYPES=>TY_E_MED_TEXT_OBJ_TYPE
      !IV_TEXT_ELEMENT_TYPE type /IWBEP/IF_MGW_MED_ODATA_TYPES=>TY_E_MED_TEXT_ELEMENT_TYPE default 'L'
      !IV_CREATE type ABAP_BOOL default ABAP_TRUE
    raising
      /IWBEP/CX_MGW_MED_EXCEPTION .
  "! <p class="shorttext synchronized" lang="en">sets the edm type binary to the property</p>
  methods SET_TYPE_EDM_BINARY .
  "! <p class="shorttext synchronized" lang="en">sets the edm type boolean to the property</p>
  methods SET_TYPE_EDM_BOOLEAN .
  "! <p class="shorttext synchronized" lang="en">sets the edm type byte to the property</p>
  methods SET_TYPE_EDM_BYTE .
  "! <p class="shorttext synchronized" lang="en">sets the edm type datetime to the property</p>
  methods SET_TYPE_EDM_DATETIME .
  "! <p class="shorttext synchronized" lang="en">sets the edm type datetimeofset to the property</p>
  methods SET_TYPE_EDM_DATETIMEOFFSET .
  "! <p class="shorttext synchronized" lang="en">sets the edm type decimal to the property</p>
  methods SET_TYPE_EDM_DECIMAL .
  "! <p class="shorttext synchronized" lang="en">sets the edm type double to the property</p>
  methods SET_TYPE_EDM_DOUBLE .
  "! <p class="shorttext synchronized" lang="en">sets the edm type float to the property</p>
  methods SET_TYPE_EDM_FLOAT .
  "! <p class="shorttext synchronized" lang="en">sets the edm type guid to the property</p>
  methods SET_TYPE_EDM_GUID .
  "! <p class="shorttext synchronized" lang="en">sets the edm typeint16 to the property</p>
  methods SET_TYPE_EDM_INT16 .
  "! <p class="shorttext synchronized" lang="en">sets the edm type int32 to the property</p>
  methods SET_TYPE_EDM_INT32 .
  "! <p class="shorttext synchronized" lang="en">sets the edm type int64 to the property</p>
  methods SET_TYPE_EDM_INT64 .
  "! <p class="shorttext synchronized" lang="en">sets the edm type byte to the property</p>
  methods SET_TYPE_EDM_SBYTE .
  "! <p class="shorttext synchronized" lang="en">sets the edm type single to the property</p>
  methods SET_TYPE_EDM_SINGLE .
  "! <p class="shorttext synchronized" lang="en">sets the edm type string to the property</p>
  methods SET_TYPE_EDM_STRING .
  "! <p class="shorttext synchronized" lang="en">sets the edm type time to the property</p>
  methods SET_TYPE_EDM_TIME .
  "! <p class="shorttext synchronized" lang="en">obsolete - use SET_UNIT_PROPERTY</p>
  methods SET_UNIT
    importing
      !IV_UNIT_PROPERTY_PATH type STRING
    raising
      /IWBEP/CX_MGW_MED_EXCEPTION .
  "! <p class="shorttext synchronized" lang="en">obsolete - use SET_UNIT_PRECISION_PROPERTY</p>
  "!
  "! @raising   /iwbep/cx_mgw_med_exception | <p class="shorttext synchronized" lang="en">Meta data exception</p>
  methods SET_UNIT_PRECISION
    importing
      !IV_UNIT_PRECISION_PROP_PATH type STRING
    raising
      /IWBEP/CX_MGW_MED_EXCEPTION .
  "! <p class="shorttext synchronized" lang="en">sets the property that contains the precision for this unit</p>
  "!
  "! @parameter iv_precision_property | <p class="shorttext synchronized" lang="en">Name of the property containing the precision</p>
  methods SET_UNIT_PRECISION_PROPERTY
    importing
      !IV_PRECISION_PROPERTY type /IWBEP/IF_MGW_MED_ODATA_TYPES=>TY_E_MED_ENTITY_NAME
    raising
      /IWBEP/CX_MGW_MED_EXCEPTION .
  "! <p class="shorttext synchronized" lang="en">sets the property that contains the unit for this number</p>
  "!
  "! @parameter iv_unit_property | <p class="shorttext synchronized" lang="en">Name of the property used as Unit field</p>
  methods SET_UNIT_PROPERTY
    importing
      !IV_UNIT_PROPERTY type /IWBEP/IF_MGW_MED_ODATA_TYPES=>TY_E_MED_ENTITY_NAME
    raising
      /IWBEP/CX_MGW_MED_EXCEPTION .
  "! <p class="shorttext synchronized" lang="en">sets the updatable flag in terms of the sdata spec</p>
  methods SET_UPDATABLE
    importing
      !IV_UPDATABLE type ABAP_BOOL default ABAP_TRUE .
  methods SET_IS_UPPERCASE
    importing
      !IV_IS_UPPERCASE type ABAP_BOOL
    raising
      /IWBEP/CX_MGW_MED_EXCEPTION .
  methods SET_DEFAULT_VALUE
    importing
      !IV_ANY type ANY
    raising
      /IWBEP/CX_MGW_MED_EXCEPTION .
endinterface.