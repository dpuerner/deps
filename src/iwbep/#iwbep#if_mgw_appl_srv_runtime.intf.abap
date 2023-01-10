*"* components of interface /IWBEP/IF_MGW_APPL_SRV_RUNTIME
interface /IWBEP/IF_MGW_APPL_SRV_RUNTIME
  public .


  types TY_S_MGW_RESPONSE_ENTITY_CNTXT type /IWBEP/IF_MGW_APPL_TYPES=>TY_S_MGW_RESPONSE_ENTITY_CNTXT .
  types TY_S_MEDIA_RESOURCE type /IWBEP/IF_MGW_APPL_TYPES=>TY_S_MEDIA_RESOURCE .
  types TY_S_MGW_RESPONSE_CONTEXT type /IWBEP/IF_MGW_APPL_TYPES=>TY_S_MGW_RESPONSE_CONTEXT .

  methods BATCH_BEGIN
    importing
      !IT_OPERATION_INFO type /IWBEP/T_MGW_OPERATION_INFO
    exporting
      !EV_DEFERRED_RESPONSE_CREATION type ABAP_BOOL
    raising
      /IWBEP/CX_MGW_BTC_EXCEPTION .
  methods BATCH_END
    changing
      !CT_BATCH_RESPONSE type /IWBEP/IF_MGW_APPL_TYPES=>TY_T_BATCH_RESPONSE
    raising
      /IWBEP/CX_MGW_BTC_EXCEPTION .
  methods CHANGESET_BEGIN
    importing
      !IT_OPERATION_INFO type /IWBEP/T_MGW_OPERATION_INFO
    changing
      !CV_DEFER_MODE type XSDBOOLEAN optional
    raising
      /IWBEP/CX_MGW_BUSI_EXCEPTION
      /IWBEP/CX_MGW_TECH_EXCEPTION .
  methods CHANGESET_END
    raising
      /IWBEP/CX_MGW_BUSI_EXCEPTION
      /IWBEP/CX_MGW_TECH_EXCEPTION .
  methods CHANGESET_PROCESS
    importing
      !IT_CHANGESET_REQUEST type /IWBEP/IF_MGW_APPL_TYPES=>TY_T_CHANGESET_REQUEST
    changing
      !CT_CHANGESET_RESPONSE type /IWBEP/IF_MGW_APPL_TYPES=>TY_T_CHANGESET_RESPONSE
    raising
      /IWBEP/CX_MGW_BUSI_EXCEPTION
      /IWBEP/CX_MGW_TECH_EXCEPTION .
  methods CREATE_DEEP_ENTITY
    importing
      !IV_ENTITY_NAME type STRING optional
      !IV_ENTITY_SET_NAME type STRING optional
      !IV_SOURCE_NAME type STRING optional
      !IO_DATA_PROVIDER type ref to /IWBEP/IF_MGW_ENTRY_PROVIDER
      !IT_KEY_TAB type /IWBEP/T_MGW_NAME_VALUE_PAIR optional
      !IT_NAVIGATION_PATH type /IWBEP/T_MGW_NAVIGATION_PATH optional
      !IO_EXPAND type ref to /IWBEP/IF_MGW_ODATA_EXPAND
      !IO_TECH_REQUEST_CONTEXT type ref to /IWBEP/IF_MGW_REQ_ENTITY_C optional
    exporting
      !ER_DEEP_ENTITY type ref to DATA
    raising
      /IWBEP/CX_MGW_BUSI_EXCEPTION
      /IWBEP/CX_MGW_TECH_EXCEPTION .
  methods CREATE_ENTITY
    importing
      !IV_ENTITY_NAME type STRING optional
      !IV_ENTITY_SET_NAME type STRING optional
      !IV_SOURCE_NAME type STRING optional
      !IO_DATA_PROVIDER type ref to /IWBEP/IF_MGW_ENTRY_PROVIDER
      !IT_KEY_TAB type /IWBEP/T_MGW_NAME_VALUE_PAIR optional
      !IT_NAVIGATION_PATH type /IWBEP/T_MGW_NAVIGATION_PATH optional
      !IO_TECH_REQUEST_CONTEXT type ref to /IWBEP/IF_MGW_REQ_ENTITY_C optional
    exporting
      !ER_ENTITY type ref to DATA
    raising
      /IWBEP/CX_MGW_BUSI_EXCEPTION
      /IWBEP/CX_MGW_TECH_EXCEPTION .
  methods CREATE_STREAM
    importing
      !IV_ENTITY_NAME type STRING optional
      !IV_ENTITY_SET_NAME type STRING optional
      !IV_SOURCE_NAME type STRING optional
      !IS_MEDIA_RESOURCE type TY_S_MEDIA_RESOURCE
      !IT_KEY_TAB type /IWBEP/T_MGW_NAME_VALUE_PAIR optional
      !IT_NAVIGATION_PATH type /IWBEP/T_MGW_NAVIGATION_PATH optional
      !IV_SLUG type STRING
      !IO_TECH_REQUEST_CONTEXT type ref to /IWBEP/IF_MGW_REQ_ENTITY_C optional
    exporting
      !ER_ENTITY type ref to DATA
    raising
      /IWBEP/CX_MGW_BUSI_EXCEPTION
      /IWBEP/CX_MGW_TECH_EXCEPTION .
  methods DELETE_ENTITY
    importing
      !IV_ENTITY_NAME type STRING optional
      !IV_ENTITY_SET_NAME type STRING optional
      !IV_SOURCE_NAME type STRING optional
      !IT_KEY_TAB type /IWBEP/T_MGW_NAME_VALUE_PAIR optional
      !IT_NAVIGATION_PATH type /IWBEP/T_MGW_NAVIGATION_PATH optional
      !IO_TECH_REQUEST_CONTEXT type ref to /IWBEP/IF_MGW_REQ_ENTITY_D optional
    raising
      /IWBEP/CX_MGW_BUSI_EXCEPTION
      /IWBEP/CX_MGW_TECH_EXCEPTION .
  methods DELETE_STREAM
    importing
      !IV_ENTITY_NAME type STRING optional
      !IV_ENTITY_SET_NAME type STRING optional
      !IV_SOURCE_NAME type STRING optional
      !IT_KEY_TAB type /IWBEP/T_MGW_NAME_VALUE_PAIR optional
      !IT_NAVIGATION_PATH type /IWBEP/T_MGW_NAVIGATION_PATH optional
      !IO_TECH_REQUEST_CONTEXT type ref to /IWBEP/IF_MGW_REQ_ENTITY_D optional
    raising
      /IWBEP/CX_MGW_BUSI_EXCEPTION
      /IWBEP/CX_MGW_TECH_EXCEPTION .
  methods EXECUTE_ACTION
    importing
      !IV_ACTION_NAME type STRING optional
      !IT_PARAMETER type /IWBEP/T_MGW_NAME_VALUE_PAIR optional
      !IO_TECH_REQUEST_CONTEXT type ref to /IWBEP/IF_MGW_REQ_FUNC_IMPORT optional
    exporting
      !ER_DATA type ref to DATA
    raising
      /IWBEP/CX_MGW_BUSI_EXCEPTION
      /IWBEP/CX_MGW_TECH_EXCEPTION .
  methods GET_ENTITY
    importing
      !IV_ENTITY_NAME type STRING optional
      !IV_ENTITY_SET_NAME type STRING optional
      !IV_SOURCE_NAME type STRING optional
      !IT_KEY_TAB type /IWBEP/T_MGW_NAME_VALUE_PAIR optional
      !IT_NAVIGATION_PATH type /IWBEP/T_MGW_NAVIGATION_PATH optional
      !IO_TECH_REQUEST_CONTEXT type ref to /IWBEP/IF_MGW_REQ_ENTITY optional
    exporting
      !ER_ENTITY type ref to DATA
      !ES_RESPONSE_CONTEXT type /IWBEP/IF_MGW_APPL_SRV_RUNTIME=>TY_S_MGW_RESPONSE_ENTITY_CNTXT
    raising
      /IWBEP/CX_MGW_BUSI_EXCEPTION
      /IWBEP/CX_MGW_TECH_EXCEPTION .
  methods GET_ENTITYSET
    importing
      !IV_ENTITY_NAME type STRING optional
      !IV_ENTITY_SET_NAME type STRING optional
      !IV_SOURCE_NAME type STRING optional
      !IT_FILTER_SELECT_OPTIONS type /IWBEP/T_MGW_SELECT_OPTION optional
      !IT_ORDER type /IWBEP/T_MGW_SORTING_ORDER optional
      !IS_PAGING type /IWBEP/S_MGW_PAGING optional
      !IT_NAVIGATION_PATH type /IWBEP/T_MGW_NAVIGATION_PATH optional
      !IT_KEY_TAB type /IWBEP/T_MGW_NAME_VALUE_PAIR optional
      !IV_FILTER_STRING type STRING optional
      !IV_SEARCH_STRING type STRING optional
      !IO_TECH_REQUEST_CONTEXT type ref to /IWBEP/IF_MGW_REQ_ENTITYSET optional
    exporting
      !ER_ENTITYSET type ref to DATA
      !ES_RESPONSE_CONTEXT type /IWBEP/IF_MGW_APPL_SRV_RUNTIME=>TY_S_MGW_RESPONSE_CONTEXT
    raising
      /IWBEP/CX_MGW_BUSI_EXCEPTION
      /IWBEP/CX_MGW_TECH_EXCEPTION .
  methods GET_ENTITYSET_DELTA
    importing
      !IO_TECH_REQUEST_CONTEXT type ref to /IWBEP/IF_MGW_REQ_ENTITYSET optional
    exporting
      !ER_ENTITYSET type ref to DATA
      !ER_DELETED_ENTITYSET type ref to DATA
      !ES_RESPONSE_CONTEXT type /IWBEP/IF_MGW_APPL_SRV_RUNTIME=>TY_S_MGW_RESPONSE_CONTEXT
    raising
      /IWBEP/CX_MGW_BUSI_EXCEPTION
      /IWBEP/CX_MGW_TECH_EXCEPTION .
  methods GET_EXPANDED_ENTITY
    importing
      !IV_ENTITY_NAME type STRING optional
      !IV_ENTITY_SET_NAME type STRING optional
      !IV_SOURCE_NAME type STRING optional
      !IT_KEY_TAB type /IWBEP/T_MGW_NAME_VALUE_PAIR optional
      !IT_NAVIGATION_PATH type /IWBEP/T_MGW_NAVIGATION_PATH optional
      !IO_EXPAND type ref to /IWBEP/IF_MGW_ODATA_EXPAND optional
      !IO_TECH_REQUEST_CONTEXT type ref to /IWBEP/IF_MGW_REQ_ENTITY optional
    exporting
      !ER_ENTITY type ref to DATA
      !ES_RESPONSE_CONTEXT type /IWBEP/IF_MGW_APPL_SRV_RUNTIME=>TY_S_MGW_RESPONSE_ENTITY_CNTXT
      !ET_EXPANDED_CLAUSES type STRING_TABLE
      !ET_EXPANDED_TECH_CLAUSES type STRING_TABLE
    raising
      /IWBEP/CX_MGW_BUSI_EXCEPTION
      /IWBEP/CX_MGW_TECH_EXCEPTION .
  methods GET_EXPANDED_ENTITYSET
    importing
      !IV_ENTITY_NAME type STRING optional
      !IV_ENTITY_SET_NAME type STRING optional
      !IV_SOURCE_NAME type STRING optional
      !IT_FILTER_SELECT_OPTIONS type /IWBEP/T_MGW_SELECT_OPTION optional
      !IT_ORDER type /IWBEP/T_MGW_SORTING_ORDER optional
      !IS_PAGING type /IWBEP/S_MGW_PAGING optional
      !IT_NAVIGATION_PATH type /IWBEP/T_MGW_NAVIGATION_PATH optional
      !IT_KEY_TAB type /IWBEP/T_MGW_NAME_VALUE_PAIR optional
      !IV_FILTER_STRING type STRING optional
      !IV_SEARCH_STRING type STRING optional
      !IO_EXPAND type ref to /IWBEP/IF_MGW_ODATA_EXPAND optional
      !IO_TECH_REQUEST_CONTEXT type ref to /IWBEP/IF_MGW_REQ_ENTITYSET optional
    exporting
      !ER_ENTITYSET type ref to DATA
      !ET_EXPANDED_CLAUSES type STRING_TABLE
      !ET_EXPANDED_TECH_CLAUSES type STRING_TABLE
      !ES_RESPONSE_CONTEXT type TY_S_MGW_RESPONSE_CONTEXT
    raising
      /IWBEP/CX_MGW_BUSI_EXCEPTION
      /IWBEP/CX_MGW_TECH_EXCEPTION .
  methods GET_IS_CONDITIONAL_IMPLEMENTED
    importing
      !IV_OPERATION_TYPE type /IWBEP/MGW_OPERATION_TYPE
      !IV_ENTITY_SET_NAME type STRING
    returning
      value(RV_CONDITIONAL_ACTIVE) type ABAP_BOOL .
  methods GET_IS_CONDI_IMPLE_FOR_ACTION
    importing
      !IV_ACTION_NAME type /IWBEP/MGW_TECH_NAME
    returning
      value(RV_CONDITIONAL_ACTIVE) type ABAP_BOOL .
  methods GET_STREAM
    importing
      !IV_ENTITY_NAME type STRING optional
      !IV_ENTITY_SET_NAME type STRING optional
      !IV_SOURCE_NAME type STRING optional
      !IT_KEY_TAB type /IWBEP/T_MGW_NAME_VALUE_PAIR optional
      !IT_NAVIGATION_PATH type /IWBEP/T_MGW_NAVIGATION_PATH optional
      !IO_TECH_REQUEST_CONTEXT type ref to /IWBEP/IF_MGW_REQ_ENTITY optional
    exporting
      !ER_STREAM type ref to DATA
      !ES_RESPONSE_CONTEXT type /IWBEP/IF_MGW_APPL_SRV_RUNTIME=>TY_S_MGW_RESPONSE_ENTITY_CNTXT
    raising
      /IWBEP/CX_MGW_BUSI_EXCEPTION
      /IWBEP/CX_MGW_TECH_EXCEPTION .
  methods PATCH_ENTITY
    importing
      !IV_ENTITY_NAME type STRING optional
      !IV_ENTITY_SET_NAME type STRING optional
      !IV_SOURCE_NAME type STRING optional
      !IO_DATA_PROVIDER type ref to /IWBEP/IF_MGW_ENTRY_PROVIDER
      !IT_KEY_TAB type /IWBEP/T_MGW_NAME_VALUE_PAIR optional
      !IT_NAVIGATION_PATH type /IWBEP/T_MGW_NAVIGATION_PATH optional
      !IO_TECH_REQUEST_CONTEXT type ref to /IWBEP/IF_MGW_REQ_ENTITY_P optional
    exporting
      !ER_ENTITY type ref to DATA
    raising
      /IWBEP/CX_MGW_BUSI_EXCEPTION
      /IWBEP/CX_MGW_TECH_EXCEPTION .
  methods UPDATE_ENTITY
    importing
      !IV_ENTITY_NAME type STRING optional
      !IV_ENTITY_SET_NAME type STRING optional
      !IV_SOURCE_NAME type STRING optional
      !IO_DATA_PROVIDER type ref to /IWBEP/IF_MGW_ENTRY_PROVIDER
      !IT_KEY_TAB type /IWBEP/T_MGW_NAME_VALUE_PAIR optional
      !IT_NAVIGATION_PATH type /IWBEP/T_MGW_NAVIGATION_PATH optional
      !IO_TECH_REQUEST_CONTEXT type ref to /IWBEP/IF_MGW_REQ_ENTITY_U optional
    exporting
      !ER_ENTITY type ref to DATA
    raising
      /IWBEP/CX_MGW_BUSI_EXCEPTION
      /IWBEP/CX_MGW_TECH_EXCEPTION .
  methods UPDATE_STREAM
    importing
      !IV_ENTITY_NAME type STRING optional
      !IV_ENTITY_SET_NAME type STRING optional
      !IV_SOURCE_NAME type STRING optional
      !IS_MEDIA_RESOURCE type TY_S_MEDIA_RESOURCE
      !IT_KEY_TAB type /IWBEP/T_MGW_NAME_VALUE_PAIR optional
      !IT_NAVIGATION_PATH type /IWBEP/T_MGW_NAVIGATION_PATH optional
      !IO_TECH_REQUEST_CONTEXT type ref to /IWBEP/IF_MGW_REQ_ENTITY_U optional
    raising
      /IWBEP/CX_MGW_BUSI_EXCEPTION
      /IWBEP/CX_MGW_TECH_EXCEPTION .
endinterface.