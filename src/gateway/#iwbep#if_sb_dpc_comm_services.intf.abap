*"* components of interface /IWBEP/IF_SB_DPC_COMM_SERVICES
interface /IWBEP/IF_SB_DPC_COMM_SERVICES
  public .


  methods GET_GENERATION_STRATEGY
    returning
      value(RV_GENERATION_STRATEGY) type I .
  methods RFC_EXCEPTION_HANDLING
    importing
      !IV_SUBRC type SY-SUBRC
      !IV_EXP_MESSAGE_TEXT type /IWBEP/MGW_BOP_RFC_EXCEP_TEXT
    raising
      /IWBEP/CX_MGW_BUSI_EXCEPTION
      /IWBEP/CX_MGW_TECH_EXCEPTION .
  methods RFC_SAVE_LOG
    importing
      !IS_RETURN type ANY optional
      !IT_RETURN type ANY TABLE optional
      !IV_ENTITY_TYPE type STRING optional
      !IT_KEY_TAB type /IWBEP/T_MGW_NAME_VALUE_PAIR optional
    raising
      /IWBEP/CX_MGW_BUSI_EXCEPTION .
  methods SET_INJECTION
    importing
      !IO_UNIT type ref to /IWBEP/IF_SB_GEN_DPC_INJECTION .
  methods LOG_MESSAGE
    importing
      !IV_MSG_TYPE type SYMSGTY
      !IV_MSG_ID type SYMSGID optional
      !IV_MSG_NUMBER type SYMSGNO optional
      !IV_MSG_V1 type ANY optional
      !IV_MSG_V2 type ANY optional
      !IV_MSG_V3 type ANY optional
      !IV_MSG_V4 type ANY optional .
  methods COMMIT_WORK
    importing
      !IV_RFC_DEST type /IWBEP/DEFI_RFC_DEST optional
    raising
      /IWBEP/CX_MGW_BUSI_EXCEPTION
      /IWBEP/CX_MGW_TECH_EXCEPTION .
endinterface.