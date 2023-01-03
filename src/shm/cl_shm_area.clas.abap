class CL_SHM_AREA definition
  public
  inheriting from CL_ABAP_MEMORY_AREA
  abstract
  create public .

*"* public components of class CL_SHM_AREA
*"* do not include other source files here!!!
public section.

  constants ALL_CLIENTS type SHM_CLIENT value '*'. "#EC NOTEXT
  constants ATTACH_MODE_DEFAULT type SHM_ATTACH_MODE value 1302197000. "#EC NOTEXT
  constants ATTACH_MODE_DETACH_READER type SHM_ATTACH_MODE value 1302197001. "#EC NOTEXT
  constants ATTACH_MODE_WAIT type SHM_ATTACH_MODE value 1302197002. "#EC NOTEXT
  constants BUILD_KIND_DUE_TO_INVALIDATION type SHM_BUILD_KIND value 1107197102. "#EC NOTEXT
  constants BUILD_KIND_DUE_TO_READ_REQUEST type SHM_BUILD_KIND value 1107197101. "#EC NOTEXT
  constants BUILD_KIND_NONE type SHM_BUILD_KIND value 1107197100. "#EC NOTEXT
  constants BUILD_KIND_STARTUP type SHM_BUILD_KIND value 1107197103. "#EC NOTEXT
  constants DEFAULT_INSTANCE type SHM_INST_NAME value '$DEFAULT_INSTANCE$'. "#EC NOTEXT
  constants DISPLACE_KIND_DISPLACABLE type SHM_DISPLACE_KIND value 1208200202. "#EC NOTEXT
  constants DISPLACE_KIND_NONE type SHM_DISPLACE_KIND value 1208200200. "#EC NOTEXT
  constants DISPLACE_KIND_SERIALIZABLE type SHM_DISPLACE_KIND value 1208200201. "#EC NOTEXT
  constants INVOCATION_MODE_AUTO_BUILD type SHM_CONSTR_INVOCATION_MODE value 0319200301. "#EC NOTEXT
  constants INVOCATION_MODE_EXPLICIT type SHM_CONSTR_INVOCATION_MODE value 0319200300. "#EC NOTEXT
  constants LIFE_CONTEXT_APPSERVER type SHM_LIFE_CONTEXT value 0109200001. "#EC NOTEXT
  constants LIFE_CONTEXT_MEMORY type SHM_LIFE_CONTEXT value 0109200004. "#EC NOTEXT
  constants LIFE_CONTEXT_MODE type SHM_LIFE_CONTEXT value 0109200003. "#EC NOTEXT
  constants LIFE_CONTEXT_SESSION type SHM_LIFE_CONTEXT value 0109200002. "#EC NOTEXT
  constants LIFETIME_NONE type SHM_LIFETIME_KIND value 1125600000. "#EC NOTEXT
  constants LIFETIME_INVALIDATION type SHM_LIFETIME_KIND value 1125600001. "#EC NOTEXT
  constants LIFETIME_REFRESH type SHM_LIFETIME_KIND value 1125600002. "#EC NOTEXT
  constants LIFETIME_IDLE type SHM_LIFETIME_KIND value 1125600003. "#EC NOTEXT
  constants LOCK_KIND_OUT_OF_MEMORY type SHM_LOCK_KIND value 0109199706. "#EC NOTEXT
  constants LOCK_KIND_COMPLETION_ERROR type SHM_LOCK_KIND value 0109199705. "#EC NOTEXT
  constants LOCK_KIND_DETACHED type SHM_LOCK_KIND value 0109199701. "#EC NOTEXT
  constants LOCK_KIND_READ type SHM_LOCK_KIND value 0109199702. "#EC NOTEXT
  constants LOCK_KIND_UPDATE type SHM_LOCK_KIND value 0109199704. "#EC NOTEXT
  constants LOCK_KIND_WRITE type SHM_LOCK_KIND value 0109199703. "#EC NOTEXT
  constants RC_DONE type SHM_RC value 0304192400. "#EC NOTEXT
  constants RC_INSTANCE_NAME_NOT_FOUND type SHM_RC value 0304192402. "#EC NOTEXT
  constants RC_NOTHING_TO_BE_DONE type SHM_RC value 0304192401. "#EC NOTEXT
  constants PROP_KIND_AUTOMATIC type SHM_PROPAGATION_KIND value 0159200002. "#EC NOTEXT
  constants PROP_KIND_NONE type SHM_PROPAGATION_KIND value 0159200000. "#EC NOTEXT
  constants PROP_KIND_USER_TRIGGERED type SHM_PROPAGATION_KIND value 0159200001. "#EC NOTEXT
  constants AFFECT_LOCAL_SERVER type SHM_AFFECT_SERVER value 281119720. "#EC NOTEXT
  constants AFFECT_ALL_SERVERS type SHM_AFFECT_SERVER value 281119721. "#EC NOTEXT
  constants AFFECT_ALL_SERVERS_BUT_LOCAL type SHM_AFFECT_SERVER value 281119722. "#EC NOTEXT
  data PROPERTIES type SHM_PROPERTIES read-only .
  data INST_NAME type SHM_INST_NAME read-only .
  data CLIENT type MANDT read-only .
  constants _MIN_VERSION_ type I value 21. "#EC NOTEXT

  events SHM_COMMIT_EVENT .
  events SHM_ROLLBACK_EVENT .

  class-methods CLASS_CONSTRUCTOR .
  class-methods DETACH_ALL_AREAS
    returning
      value(RC) type SHM_RC .
  type-pools ABAP .
  class-methods MULTI_ATTACH
    importing
      !IGNORE_ERRORS type ABAP_BOOL default ABAP_FALSE
      !WAIT_TIME type I default 0
    exporting
      !ERROR_FLAG type ABAP_BOOL
    changing
      !ATTACH_TAB type SHM_ATTACH_TAB .
  methods DETACH
    raising
      CX_SHM_WRONG_HANDLE
      CX_SHM_ALREADY_DETACHED .
  methods DETACH_COMMIT
    raising
      CX_SHM_WRONG_HANDLE
      CX_SHM_ALREADY_DETACHED
      CX_SHM_SECONDARY_COMMIT
      CX_SHM_EVENT_EXECUTION_FAILED
      CX_SHM_COMPLETION_ERROR .
  methods DETACH_ROLLBACK
    raising
      CX_SHM_WRONG_HANDLE
      CX_SHM_ALREADY_DETACHED
      CX_SHM_EVENT_EXECUTION_FAILED .
  methods GET_LOCK_KIND
    returning
      value(LOCK_KIND) type SHM_LOCK_KIND .
  methods GET_ROOT
  abstract
    returning
      value(ROOT) type ref to OBJECT
    raising
      CX_SHM_ALREADY_DETACHED .

  methods GET_DETACH_INFO
    redefinition .
  methods HAS_ACTIVE_PROPERTIES
    redefinition .
  methods IS_ACTIVE_VERSION
    redefinition .
  methods IS_SHARED
    redefinition .
  methods IS_VALID
    redefinition .
protected section.

  constants ATTACH_MODE_WAIT_2ND_TRY type SHM_ATTACH_MODE value 1302197003. "#EC NOTEXT
  data _LOCK type %_C_POINTER .
  data INST_TRACE_SERVICE type ref to IF_SHM_TRACE .
  type-pools ABAP .
  data INST_TRACE_ACTIVE type ABAP_BOOL value ABAP_FALSE. "#EC NOTEXT .

  class-methods _DETACH_ALL_AREAS
    returning
      value(RC) type SHM_RC .
  class-methods _DETACH_AREA
    importing
      !AREA_NAME type SHM_AREA_NAME
      !CLIENT type SHM_CLIENT optional
      !CLIENT_SUPPLIED type ABAP_BOOL optional
      !TRANSACTIONAL type ABAP_BOOL default ABAP_FALSE
      !CLIENT_DEPENDENT type ABAP_BOOL default ABAP_FALSE
    returning
      value(RC) type SHM_RC .
  class-methods _DETACH_AREA71
    importing
      !AREA_NAME type SHM_AREA_NAME
      !CLIENT type SHM_CLIENT
      !CLIENT_SUPPLIED type ABAP_BOOL
      !CLIENT_DEPENDENT type ABAP_BOOL default ABAP_FALSE
      !LIFE_CONTEXT type SHM_LIFE_CONTEXT
    returning
      value(RC) type SHM_RC .
  class-methods _FREE_AREA
    importing
      !AREA_NAME type SHM_AREA_NAME
      !CLIENT type SHM_CLIENT optional
      !CLIENT_SUPPLIED type ABAP_BOOL default ABAP_FALSE
      !TRANSACTIONAL type ABAP_BOOL default ABAP_FALSE
      !CLIENT_DEPENDENT type ABAP_BOOL default ABAP_FALSE
      !TERMINATE_CHANGER type ABAP_BOOL
    returning
      value(RC) type SHM_RC
    raising
      CX_SHM_PARAMETER_ERROR .
  class-methods _FREE_INSTANCE
    importing
      !AREA_NAME type SHM_AREA_NAME
      !INST_NAME type SHM_INST_NAME
      !CLIENT type SHM_CLIENT optional
      !CLIENT_SUPPLIED type ABAP_BOOL default ABAP_FALSE
      !TRANSACTIONAL type ABAP_BOOL default ABAP_FALSE
      !CLIENT_DEPENDENT type ABAP_BOOL default ABAP_FALSE
      !TERMINATE_CHANGER type ABAP_BOOL
    returning
      value(RC) type SHM_RC
    raising
      CX_SHM_PARAMETER_ERROR .
  class-methods _FREE_AREA71
    importing
      !AREA_NAME type SHM_AREA_NAME
      !CLIENT type SHM_CLIENT
      !CLIENT_SUPPLIED type ABAP_BOOL default ABAP_FALSE
      !TRANSACTIONAL type ABAP_BOOL default ABAP_FALSE
      !CLIENT_DEPENDENT type ABAP_BOOL default ABAP_FALSE
      !TERMINATE_CHANGER type ABAP_BOOL
      !AFFECT_SERVER type SHM_AFFECT_SERVER
      !LIFE_CONTEXT type SHM_LIFE_CONTEXT default LIFE_CONTEXT_APPSERVER
    returning
      value(RC) type SHM_RC
    raising
      CX_SHM_PARAMETER_ERROR .
  class-methods _FREE_INSTANCE71
    importing
      !AREA_NAME type SHM_AREA_NAME
      !INST_NAME type SHM_INST_NAME
      !CLIENT type SHM_CLIENT
      !CLIENT_SUPPLIED type ABAP_BOOL default ABAP_FALSE
      !TRANSACTIONAL type ABAP_BOOL default ABAP_FALSE
      !CLIENT_DEPENDENT type ABAP_BOOL default ABAP_FALSE
      !TERMINATE_CHANGER type ABAP_BOOL
      !AFFECT_SERVER type SHM_AFFECT_SERVER
      !LIFE_CONTEXT type SHM_LIFE_CONTEXT default LIFE_CONTEXT_APPSERVER
    returning
      value(RC) type SHM_RC
    raising
      CX_SHM_PARAMETER_ERROR .
  class-methods _GET_INSTANCE_INFOS
    importing
      !AREA_NAME type SHM_AREA_NAME
      !CLIENT type SHM_CLIENT optional
      !CLIENT_SUPPLIED type ABAP_BOOL default ABAP_FALSE
      !TRANSACTIONAL type ABAP_BOOL default ABAP_FALSE
      !CLIENT_DEPENDENT type ABAP_BOOL default ABAP_FALSE
    returning
      value(INFOS) type SHM_INST_INFOS .
  class-methods _GET_INSTANCE_INFOS71
    importing
      !AREA_NAME type SHM_AREA_NAME
      !CLIENT type SHM_CLIENT
      !CLIENT_SUPPLIED type ABAP_BOOL default ABAP_FALSE
      !CLIENT_DEPENDENT type ABAP_BOOL default ABAP_FALSE
      !LIFE_CONTEXT type SHM_LIFE_CONTEXT
    returning
      value(INFOS) type SHM_INST_INFOS .
  class-methods _GET_INSTANCE_INFOS804
    importing
      !AREA_NAME type SHM_AREA_NAME
      !CLIENT type SHM_CLIENT
      !CLIENT_SUPPLIED type ABAP_BOOL
      !CLIENT_DEPENDENT type ABAP_BOOL
      !LIFE_CONTEXT type SHM_LIFE_CONTEXT
      !INST_NAME type SHM_INST_NAME
      !INST_NAME_SUPPLIED type ABAP_BOOL
    returning
      value(INFOS) type SHM_INST_INFOS .
  class-methods _INVALIDATE_AREA
    importing
      !AREA_NAME type SHM_AREA_NAME
      !CLIENT type SHM_CLIENT optional
      !CLIENT_SUPPLIED type ABAP_BOOL default ABAP_FALSE
      !TRANSACTIONAL type ABAP_BOOL default ABAP_FALSE
      !CLIENT_DEPENDENT type ABAP_BOOL default ABAP_FALSE
      !TERMINATE_CHANGER type ABAP_BOOL
    returning
      value(RC) type SHM_RC
    raising
      CX_SHM_PARAMETER_ERROR .
  class-methods _INVALIDATE_INSTANCE
    importing
      !AREA_NAME type SHM_AREA_NAME
      !INST_NAME type SHM_INST_NAME
      !CLIENT type SHM_CLIENT optional
      !CLIENT_SUPPLIED type ABAP_BOOL default ABAP_FALSE
      !TRANSACTIONAL type ABAP_BOOL default ABAP_FALSE
      !CLIENT_DEPENDENT type ABAP_BOOL default ABAP_FALSE
      !TERMINATE_CHANGER type ABAP_BOOL
    returning
      value(RC) type SHM_RC
    raising
      CX_SHM_PARAMETER_ERROR .
  class-methods _INVALIDATE_AREA71
    importing
      !AREA_NAME type SHM_AREA_NAME
      !CLIENT type SHM_CLIENT
      !CLIENT_SUPPLIED type ABAP_BOOL default ABAP_FALSE
      !TRANSACTIONAL type ABAP_BOOL default ABAP_FALSE
      !CLIENT_DEPENDENT type ABAP_BOOL default ABAP_FALSE
      !TERMINATE_CHANGER type ABAP_BOOL
      !AFFECT_SERVER type SHM_AFFECT_SERVER
      !LIFE_CONTEXT type SHM_LIFE_CONTEXT default LIFE_CONTEXT_APPSERVER
    returning
      value(RC) type SHM_RC
    raising
      CX_SHM_PARAMETER_ERROR .
  class-methods _INVALIDATE_INSTANCE71
    importing
      !AREA_NAME type SHM_AREA_NAME
      !INST_NAME type SHM_INST_NAME
      !CLIENT type SHM_CLIENT
      !CLIENT_SUPPLIED type ABAP_BOOL default ABAP_FALSE
      !TRANSACTIONAL type ABAP_BOOL default ABAP_FALSE
      !CLIENT_DEPENDENT type ABAP_BOOL default ABAP_FALSE
      !TERMINATE_CHANGER type ABAP_BOOL
      !AFFECT_SERVER type SHM_AFFECT_SERVER
      !LIFE_CONTEXT type SHM_LIFE_CONTEXT default LIFE_CONTEXT_APPSERVER
    returning
      value(RC) type SHM_RC
    raising
      CX_SHM_PARAMETER_ERROR .
  class-methods _PROPAGATE_AREA
    importing
      !AREA_NAME type SHM_AREA_NAME
      !CLIENT type SHM_CLIENT optional
      !CLIENT_SUPPLIED type ABAP_BOOL default ABAP_FALSE
      !TRANSACTIONAL type ABAP_BOOL default ABAP_FALSE
      !CLIENT_DEPENDENT type ABAP_BOOL default ABAP_FALSE
      !AFFECTING_LOCAL_SERVER type ABAP_BOOL default ABAP_FALSE
    raising
      CX_SHM_PARAMETER_ERROR .
  class-methods _PROPAGATE_INSTANCE
    importing
      !AREA_NAME type SHM_AREA_NAME
      !INST_NAME type SHM_INST_NAME
      !CLIENT type SHM_CLIENT optional
      !CLIENT_SUPPLIED type ABAP_BOOL default ABAP_FALSE
      !TRANSACTIONAL type ABAP_BOOL default ABAP_FALSE
      !CLIENT_DEPENDENT type ABAP_BOOL default ABAP_FALSE
      !AFFECTING_LOCAL_SERVER type ABAP_BOOL optional
    raising
      CX_SHM_PARAMETER_ERROR .
  methods _ATTACH_READ
    importing
      !SNEAK_MODE type ABAP_BOOL default ABAP_FALSE
      !AREA_NAME type SHM_AREA_NAME
      !IS_MULTIATTACH type ABAP_BOOL optional
    exporting
      !ROOT type ref to OBJECT
    raising
      CX_SHM_INCONSISTENT
      CX_SHM_NO_ACTIVE_VERSION
      CX_SHM_READ_LOCK_ACTIVE
      CX_SHM_EXCLUSIVE_LOCK_ACTIVE
      CX_SHM_PARAMETER_ERROR
      CX_SHM_CHANGE_LOCK_ACTIVE .
  methods _ATTACH_READ71
    importing
      !SNEAK_MODE type ABAP_BOOL default ABAP_FALSE
      !AREA_NAME type SHM_AREA_NAME
      !LIFE_CONTEXT type SHM_LIFE_CONTEXT
    exporting
      !ROOT type ref to OBJECT
    raising
      CX_SHM_INCONSISTENT
      CX_SHM_NO_ACTIVE_VERSION
      CX_SHM_READ_LOCK_ACTIVE
      CX_SHM_EXCLUSIVE_LOCK_ACTIVE
      CX_SHM_PARAMETER_ERROR
      CX_SHM_CHANGE_LOCK_ACTIVE .
  methods _ATTACH_UPDATE70
    importing
      !AREA_NAME type SHM_AREA_NAME
      !MODE type SHM_ATTACH_MODE
    exporting
      !ROOT type ref to OBJECT
    changing
      !WAIT_TIME type I optional
    raising
      CX_SHM_INCONSISTENT
      CX_SHM_EXCLUSIVE_LOCK_ACTIVE
      CX_SHM_CHANGE_LOCK_ACTIVE
      CX_SHM_VERSION_LIMIT_EXCEEDED
      CX_SHM_NO_ACTIVE_VERSION
      CX_SHM_PARAMETER_ERROR
      CX_SHM_PENDING_LOCK_REMOVED .
  methods _ATTACH_WRITE70
    importing
      !AREA_NAME type SHM_AREA_NAME
      !MODE type SHM_ATTACH_MODE
    exporting
      !ROOT type ref to OBJECT
    changing
      !WAIT_TIME type I optional
    raising
      CX_SHM_VERSION_LIMIT_EXCEEDED
      CX_SHM_EXCLUSIVE_LOCK_ACTIVE
      CX_SHM_CHANGE_LOCK_ACTIVE
      CX_SHM_PARAMETER_ERROR
      CX_SHM_PENDING_LOCK_REMOVED .
  methods _DETACH
    raising
      CX_SHM_WRONG_HANDLE
      CX_SHM_ALREADY_DETACHED .
  methods _DETACH_COMMIT
    raising
      CX_SHM_WRONG_HANDLE
      CX_SHM_ALREADY_DETACHED
      CX_SHM_COMPLETION_ERROR
      CX_SHM_SECONDARY_COMMIT .
  methods _DETACH_ROLLBACK
    raising
      CX_SHM_WRONG_HANDLE
      CX_SHM_ALREADY_DETACHED .
  methods _SET_ROOT
    importing
      !ROOT type ref to OBJECT
    raising
      CX_SHM_WRONG_HANDLE
      CX_SHM_INITIAL_REFERENCE .
  methods _PREPARE_MULTI_ATTACH_READ
    importing
      !SNEAK_MODE type ABAP_BOOL default ABAP_FALSE
      !AREA_NAME type SHM_AREA_NAME
    exporting
      value(ROOT) type ref to OBJECT
    raising
      CX_SHM_INCONSISTENT
      CX_SHM_NO_ACTIVE_VERSION
      CX_SHM_READ_LOCK_ACTIVE
      CX_SHM_EXCLUSIVE_LOCK_ACTIVE
      CX_SHM_PARAMETER_ERROR
      CX_SHM_CHANGE_LOCK_ACTIVE .
  methods _PREPARE_MULTI_ATTACH_READ71
    importing
      !SNEAK_MODE type ABAP_BOOL default ABAP_FALSE
      !AREA_NAME type SHM_AREA_NAME
      !LIFE_CONTEXT type SHM_LIFE_CONTEXT
    exporting
      !ROOT type ref to OBJECT
    raising
      CX_SHM_INCONSISTENT
      CX_SHM_NO_ACTIVE_VERSION
      CX_SHM_READ_LOCK_ACTIVE
      CX_SHM_EXCLUSIVE_LOCK_ACTIVE
      CX_SHM_PARAMETER_ERROR
      CX_SHM_CHANGE_LOCK_ACTIVE .
  methods _PREPARE_MULTI_ATTACH_WRITE70
    importing
      !AREA_NAME type SHM_AREA_NAME
      !MODE type SHM_ATTACH_MODE
      !CHCK_WRLOCK_CNT type ABAP_BOOL default ABAP_TRUE
    exporting
      value(ROOT) type ref to OBJECT
    changing
      !WAIT_TIME type I optional
    raising
      CX_SHM_VERSION_LIMIT_EXCEEDED
      CX_SHM_EXCLUSIVE_LOCK_ACTIVE
      CX_SHM_CHANGE_LOCK_ACTIVE
      CX_SHM_PARAMETER_ERROR
      CX_SHM_PENDING_LOCK_REMOVED .
  methods _PREPARE_MULTI_ATTACH_UPDATE70
    importing
      !AREA_NAME type SHM_AREA_NAME
      !MODE type SHM_ATTACH_MODE
      !CHCK_WRLOCK_CNT type ABAP_BOOL default ABAP_TRUE
    changing
      !ROOT type ref to OBJECT
      !WAIT_TIME type I optional
    raising
      CX_SHM_INCONSISTENT
      CX_SHM_EXCLUSIVE_LOCK_ACTIVE
      CX_SHM_CHANGE_LOCK_ACTIVE
      CX_SHM_VERSION_LIMIT_EXCEEDED
      CX_SHM_NO_ACTIVE_VERSION
      CX_SHM_PARAMETER_ERROR
      CX_SHM_PENDING_LOCK_REMOVED .
  methods _FINISH_MULTI_ATTACH .
  methods _HAS_ACTIVE_PROPERTIES
    importing
      !PROPERTIES type SHM_PROPERTIES
    returning
      value(ACTIVE_PROPERTIES) type ABAP_BOOL .
private section.
*"* private components of class CL_SHM_AREA
*"* do not include other source files here!!!

  class-data STAT_TRACE_SERVICE type ref to IF_SHM_TRACE .
  class-data STAT_TRACE_ACTIVE type ABAP_BOOL value ABAP_FALSE .
ENDCLASS.