*"* components of interface /IWBEP/IF_MGW_MED_LOAD
interface /IWBEP/IF_MGW_MED_LOAD
  public .


  methods LOAD_META_DATA
    importing
      !IV_VERSION type /IWBEP/MED_MDL_VERSION
      !IV_TECHNICAL_NAME type /IWBEP/MED_MDL_TECHNICAL_NAME
    changing
      !CS_HEADER type /IWBEP/IF_MGW_MED_ODATA_TYPES=>TY_S_MED_HEADER
      !CT_NODES type /IWBEP/IF_MGW_MED_ODATA_TYPES=>TY_T_MED_ENTITY_TYPES
      !CT_REFERENCES type /IWBEP/IF_MGW_MED_ODATA_TYPES=>TY_T_MED_REFERENCE
      !CT_OPERATIONS type /IWBEP/IF_MGW_MED_ODATA_TYPES=>TY_T_MED_FUNCTIONS
      !CT_TEXT_KEYS type /IWBEP/IF_MGW_MED_ODATA_TYPES=>TY_T_MED_TEXTS
      !CT_DOCUMENTATION type /IWBEP/IF_MGW_MED_ODATA_TYPES=>TY_T_MED_DOCUMENTATION
      !CT_PRIVATE_ANNOTATIONS type /IWBEP/IF_MGW_MED_ODATA_TYPES=>TY_T_MED_ENTITY_ANNOS
      !CT_PUBLIC_ANNOTATIONS type /IWBEP/IF_MGW_MED_ODATA_TYPES=>TY_T_MED_ENTITY_ANNOS
      !CT_MAPPING type /IWBEP/IF_MGW_MED_ODATA_TYPES=>TY_T_MED_MAPPING
      !CT_MODEL_USAGE type /IWBEP/IF_MGW_MED_ODATA_TYPES=>TY_S_MED_MODEL_USAGE optional
      !CT_MODEL_USAGES type /IWBEP/IF_MGW_MED_ODATA_TYPES=>TY_T_MED_MDL_USAGE
      !CT_TAGS type /IWBEP/IF_MGW_MED_ODATA_TYPES=>TY_T_MED_SERVICE_TAGS
      !CS_VOCAN_MODEL type /IWBEP/IF_MGW_MED_ODATA_TYPES=>TY_S_VOCAN_MODEL
    raising
      /IWBEP/CX_MGW_MED_EXCEPTION .
  methods GET_LAST_MODIFIED
    importing
      !IV_VERSION type /IWBEP/MED_MDL_VERSION
      !IV_TECHNICAL_NAME type /IWBEP/MED_MDL_TECHNICAL_NAME
    changing
      !CV_LAST_MODIFIED type TIMESTAMP .
  methods INITIALIZE
    importing
      !IS_DEFAULT_SYSTEM_ALIAS_INFO type /IWBEP/S_DEFI_ALIAS_INFO optional
      !IV_SERVICE_VERSION type /IWBEP/MED_GRP_VERSION optional
      !IV_SERVICE_TECHNICAL_NAME type /IWBEP/MED_GRP_TECHNICAL_NAME optional
      !IV_MODEL_VERSION type /IWBEP/MED_MDL_VERSION optional
      !IV_MODEL_TECHNICAL_NAME type /IWBEP/MED_MDL_TECHNICAL_NAME optional
      !IV_VOCAN_VERSION type /IWBEP/MED_VA_FILE_VERSION optional
      !IV_VOCAN_TECHNICAL_NAME type /IWBEP/MED_VA_FILE_TECH_NAME optional
    raising
      /IWBEP/CX_MGW_MED_EXCEPTION .
  methods GET_VOCAN_TEXTS
    importing
      !IV_LANGUAGE type SY-LANGU
      !IT_VOCAN_TEXT_KEYS type /IWBEP/IF_MGW_MED_ODATA_TYPES=>TY_T_MED_VOCAN_TEXTS
    changing
      !CT_VOCAN_TEXTS_OBJ type /IWBEP/IF_MGW_MED_ODATA_TYPES=>TY_T_MED_OBJ_VOCAN_TEXTS
    raising
      /IWBEP/CX_MGW_MED_EXCEPTION .
endinterface.