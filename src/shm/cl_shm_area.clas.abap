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



CLASS CL_SHM_AREA IMPLEMENTATION.


METHOD class_constructor.

* TRACE { DO NOT REMOVE THIS LINE !

  stat_trace_active = abap_false.

  TRY.

      stat_trace_service =
        cl_shm_service=>trace_get_service( '*' ).

      IF NOT stat_trace_service IS INITIAL.

        stat_trace_active =
          cl_shm_service=>trace_is_variant_active(
            stat_trace_service->variant-def_name
          ).

      ENDIF.

    CATCH cx_root. "#EC NO_HANDLER
                   "#EC CATCH_ALL

  ENDTRY.

* TRACE } DO NOT REMOVE THIS LINE !

ENDMETHOD.


METHOD detach.

  DATA:
    l_cx TYPE REF TO cx_root.

  FIELD-SYMBOLS:
    <area_name> TYPE shm_area_name.

  IF inst_trace_active = abap_false
  OR inst_trace_service->variant-detach = abap_false.
*   >
    me->_detach( ).
*   <
  ELSE.

    TRY.
*       >
        me->_detach( ).
*       <
        ASSIGN me->('AREA_NAME') TO <area_name>.
        inst_trace_service->trin_detach(
          area_name = <area_name>
          inst_name = me->inst_name ).

      CLEANUP INTO l_cx.

        ASSIGN me->('AREA_NAME') TO <area_name>.
        inst_trace_service->trcx_detach(
          area_name = <area_name>
          inst_name = me->inst_name
          cx        = l_cx
        ).

    ENDTRY.

  ENDIF.

ENDMETHOD.


METHOD detach_all_areas.

* >
  rc = _detach_all_areas( ).
* <
  IF stat_trace_active = abap_true.
    IF stat_trace_service->variant-detach_all_areas = abap_true.
      stat_trace_service->trin_detach_all_areas( rc = rc ).
    ENDIF.
  ENDIF.

ENDMETHOD.


METHOD detach_commit.

  DATA:
    l_cx TYPE REF TO cx_root.

  FIELD-SYMBOLS:
    <area_name> TYPE shm_area_name.

  TRY.
      RAISE EVENT shm_commit_event.
    CATCH cx_sy_no_handler INTO l_cx.
      RAISE EXCEPTION TYPE cx_shm_event_execution_failed
        EXPORTING previous = l_cx->previous.
  ENDTRY.

  IF inst_trace_active = abap_false
  OR inst_trace_service->variant-detach_commit = abap_false.
*   >
    me->_detach_commit( ).
*   <
  ELSE.

    TRY.
*       >
        me->_detach_commit( ).
*       <
        ASSIGN me->('AREA_NAME') TO <area_name>.
        inst_trace_service->trin_detach_commit(
          area_name = <area_name>
          inst_name = me->inst_name ).

      CLEANUP INTO l_cx.

        ASSIGN me->('AREA_NAME') TO <area_name>.
        inst_trace_service->trcx_detach_commit(
          area_name = <area_name>
          inst_name = me->inst_name
          cx        = l_cx
        ).

    ENDTRY.

  ENDIF.

ENDMETHOD.                    "detach_commit


METHOD detach_rollback.

  DATA:
    l_cx TYPE REF TO cx_root.

  FIELD-SYMBOLS:
    <area_name> TYPE shm_area_name.

  TRY.
      RAISE EVENT shm_rollback_event.
    CATCH cx_sy_no_handler INTO l_cx.
      RAISE EXCEPTION TYPE cx_shm_event_execution_failed
        EXPORTING previous = l_cx->previous.
  ENDTRY.

  IF inst_trace_active = abap_false
  OR inst_trace_service->variant-detach_rollback = abap_false.
*   >
    me->_detach_rollback( ).
*   <
  ELSE.

    TRY.
*       >
        me->_detach_rollback( ).
*       <
        ASSIGN me->('AREA_NAME') TO <area_name>.
        inst_trace_service->trin_detach_rollback(
          area_name = <area_name>
          inst_name = me->inst_name ).

      CLEANUP INTO l_cx.

        ASSIGN me->('AREA_NAME') TO <area_name>.
        inst_trace_service->trcx_detach_rollback(
          area_name = <area_name>
          inst_name = me->inst_name
          cx        = l_cx
        ).

    ENDTRY.

  ENDIF.

ENDMETHOD.


method GET_DETACH_INFO by kernel module ab_ShmkmGetDetachInfo.
endmethod.


method GET_LOCK_KIND by kernel module ab_ShmkmGetLockKind.
endmethod.


METHOD has_active_properties.

  FIELD-SYMBOLS <area>       TYPE shm_area_name.
  DATA          l_attributes TYPE shma_attributes.

  ASSIGN me->('AREA_NAME') TO <area>.

  cl_shm_service=>initialize(
    EXPORTING area_name       = <area>
              client          = me->client
    IMPORTING attributes      = l_attributes
  ).

  active_properties = _has_active_properties( properties = l_attributes-properties ).

ENDMETHOD.


method IS_ACTIVE_VERSION by kernel module ab_ShmkmIsActiveVersion.
endmethod.


method IS_SHARED.
  shared = abap_true.
endmethod.


method IS_VALID by kernel module ab_ShmkmIsValid.
endmethod.


METHOD multi_attach.

  DATA:  l_area_name               TYPE string,
         l_inst_name               TYPE string,
         l_client                  TYPE string,
         l_value                   TYPE string,
         l_root                    TYPE REF TO object,
         l_chck_wrlock_cnt         TYPE abap_bool VALUE abap_true,
         l_attributes              TYPE shma_attributes,
         l_act_client              TYPE mandt,
         l_attaches_with_wait_mode TYPE i,
         l_wait_time               TYPE i,
         l_wait_time_per_loop      TYPE i,
         l_wait_time_per_loop_sec  TYPE f.

  FIELD-SYMBOLS: <l_shm_attach>   TYPE shm_attach,
                 <l_other_attach> TYPE shm_attach,
                 <l_life_context> TYPE shm_life_context,
                 <l_root>         TYPE ANY.

  error_flag   = abap_false.
  l_act_client = cl_abap_syst=>get_client( ).
  SORT attach_tab BY level ASCENDING.

* clear returning information and (if nessessary) count number of
* attaches with wait_time and calculate the different wait_times
  IF 0 = wait_time.

    LOOP AT attach_tab ASSIGNING <l_shm_attach>.
      CLEAR: <l_shm_attach>-handle,
             <l_shm_attach>-exception.
    ENDLOOP.

  ELSE.

    LOOP AT attach_tab ASSIGNING <l_shm_attach>.
      CLEAR: <l_shm_attach>-handle,
             <l_shm_attach>-exception.
      IF cl_shm_area=>attach_mode_wait = <l_shm_attach>-attach_mode AND
         ( cl_shm_area=>lock_kind_write  = <l_shm_attach>-lock_kind OR
           cl_shm_area=>lock_kind_update = <l_shm_attach>-lock_kind ).
        l_attaches_with_wait_mode = l_attaches_with_wait_mode + 1.
      ENDIF.
    ENDLOOP.

    IF 0 <> l_attaches_with_wait_mode.

      l_wait_time = wait_time.
      l_wait_time_per_loop = l_wait_time / ( 10 * l_attaches_with_wait_mode ).

*     wait_time_per_loop should be at least 2 * SHMATTACHWRITE_MAXACTIVEWAITTIME
      IF l_wait_time_per_loop < 2000.
        l_wait_time_per_loop = 2000.
      ELSEIF l_wait_time_per_loop > 300000.
        l_wait_time_per_loop = 300000.
      ENDIF.

      l_wait_time_per_loop_sec = l_wait_time_per_loop / 1000.

    ELSE.
*     Wait time is given but no attach_for_write/update needs it
      LOOP AT attach_tab ASSIGNING <l_shm_attach>
        where lock_kind <> cl_shm_area=>lock_kind_read.

        IF <l_other_attach> IS NOT ASSIGNED.
*         First loop step with a change lock
          CREATE OBJECT <l_shm_attach>-exception TYPE cx_shm_parameter_error
            EXPORTING textid = cx_shm_parameter_error=>wait_time_not_initial.
          IF abap_false = ignore_errors.
            error_flag = abap_true.
            RETURN.
          ENDIF.
          ASSIGN <l_shm_attach> TO <l_other_attach>.
          CONTINUE.
        ENDIF.
        <l_shm_attach>-exception = <l_other_attach>-exception.
      ENDLOOP.
      error_flag = abap_true.
    ENDIF.

  ENDIF. " 0 = wait_time

* Loop over all areas and check if attach is possible.
* If the current attach is alreay failed due to a parameter error (wait_time_not_initial), we skip this line
  LOOP AT attach_tab ASSIGNING <l_shm_attach>.
    CHECK <l_shm_attach>-exception IS INITIAL.

* Create handles
    TRY.
        CREATE OBJECT <l_shm_attach>-handle TYPE (<l_shm_attach>-area_name).

      CATCH cx_sy_create_object_error.                  "#EC NO_HANDLER
        error_flag = abap_true.
        CLEAR <l_shm_attach>-handle.
        l_value = <l_shm_attach>-area_name.
        CREATE OBJECT <l_shm_attach>-exception TYPE cx_shm_parameter_error
          EXPORTING parameter =  'AREA_NAME'
                    value     =  l_value.
        IF ignore_errors = abap_false.
          EXIT.
        ELSE.
          CONTINUE.
        ENDIF.
    ENDTRY.

    <l_shm_attach>-handle->inst_name = <l_shm_attach>-inst_name.
    <l_shm_attach>-handle->client    = <l_shm_attach>-client.

* differ between READ and CHANGE ATTACH and attach with the handles
    IF cl_shm_area=>lock_kind_read = <l_shm_attach>-lock_kind.
* READ ATTACH
      CLEAR l_root.
      ASSIGN <l_shm_attach>-handle->('_LIFE_CONTEXT') TO <l_life_context>.

* try sneak mode first
      TRY.
**************** Support of old areas, remove in next release !!!! *****************
          if 0 = sy-subrc. " New version of area class
            <l_shm_attach>-handle->_prepare_multi_attach_read71(
                      EXPORTING area_name    = <l_shm_attach>-area_name
                                sneak_mode   = abap_true
                                life_context = <l_life_context>
                      IMPORTING root         = l_root ).
          else. " Old version of area class
            <l_shm_attach>-handle->_prepare_multi_attach_read(
                      EXPORTING area_name  = <l_shm_attach>-area_name
                                sneak_mode = abap_true
                      IMPORTING root       = l_root ).
          endif.
          ASSIGN <l_shm_attach>-handle->('ROOT') TO <l_root>.
          <l_root> ?= l_root.
        CATCH cx_shm_attach_error cx_shm_general_error cx_shm_failure. "#EC NO_HANDLER
          ASSERT 1 = 2. " should never occur
      ENDTRY.
      IF l_root IS INITIAL.
* sneak mode failed
        cl_shm_service=>initialize(
          EXPORTING area_name    = <l_shm_attach>-area_name
                    client       = <l_shm_attach>-client
          IMPORTING attributes   = l_attributes
        ).
        <l_shm_attach>-handle->properties = l_attributes-properties.

* no autobuild in client <> act_client
        IF l_attributes-properties-auto_build = abap_true AND
           <l_shm_attach>-client <> l_act_client.
          error_flag = abap_true.
          CLEAR <l_shm_attach>-handle.
          l_area_name = <l_shm_attach>-area_name.
          l_inst_name = <l_shm_attach>-inst_name.
          l_client    = <l_shm_attach>-client.
          CREATE OBJECT <l_shm_attach>-exception TYPE cx_shm_multi_attach_error
            EXPORTING area_name = l_area_name
                      inst_name = l_inst_name
                      client    = l_client
                      textid    = cx_shm_multi_attach_error=>illegal_auto_build_client.
          IF ignore_errors = abap_false.
            EXIT.
          ELSE.
            CONTINUE.
          ENDIF.
        ENDIF.

* no client spec for client independent areas
        IF l_attributes-properties-client_dependent = abap_false AND
           <l_shm_attach>-client IS NOT INITIAL.
          error_flag = abap_true.
          CLEAR <l_shm_attach>-handle.
          l_area_name = <l_shm_attach>-area_name.
          l_inst_name = <l_shm_attach>-inst_name.
          l_client    = <l_shm_attach>-client.
          CREATE OBJECT <l_shm_attach>-exception TYPE cx_shm_multi_attach_error
            EXPORTING area_name = l_area_name
                      inst_name = l_inst_name
                      client    = l_client
                      textid    = cx_shm_multi_attach_error=>illegal_client_for_area.
          IF ignore_errors = abap_false.
            EXIT.
          ELSE.
            CONTINUE.
          ENDIF.
        ENDIF.

        TRY.
            <l_shm_attach>-handle->_prepare_multi_attach_read(
                      EXPORTING area_name  = <l_shm_attach>-area_name
                      IMPORTING root       = l_root ).
*           The read attach should fail in nearly all cases (except the rare case that
*           the version was build between the sneak attach and this attach)
            ASSIGN <l_shm_attach>-handle->('ROOT') TO <l_root>.
            <l_root> ?= l_root.
          CATCH cx_shm_attach_error cx_shm_general_error cx_shm_failure
                INTO <l_shm_attach>-exception.
            error_flag = abap_true.
            CLEAR <l_shm_attach>-handle.
            IF ignore_errors = abap_false.
              EXIT.
            ENDIF.
        ENDTRY.
      ENDIF. " l_root IS INITIAL

    ELSE. " lock_kind_read = <l_shm_attach>-lock_kind
* CHANGE ATTACH
      cl_shm_service=>initialize(
            EXPORTING area_name  = <l_shm_attach>-area_name
                      client     = <l_shm_attach>-client
            IMPORTING attributes = l_attributes ).
      <l_shm_attach>-handle->properties = l_attributes-properties.

* no change attach to autobuild areas with client <> act_client
      IF l_attributes-properties-auto_build = abap_true AND
         <l_shm_attach>-client <> l_act_client.
        error_flag = abap_true.
        CLEAR <l_shm_attach>-handle.
        l_area_name = <l_shm_attach>-area_name.
        l_inst_name = <l_shm_attach>-inst_name.
        l_client    = <l_shm_attach>-client.
        CREATE OBJECT <l_shm_attach>-exception TYPE cx_shm_multi_attach_error
          EXPORTING area_name = l_area_name
                    inst_name = l_inst_name
                    client    = l_client
                    textid    = cx_shm_multi_attach_error=>illegal_auto_build_client.
        IF ignore_errors = abap_false.
          EXIT.
        ELSE.
          CONTINUE.
        ENDIF.
      ENDIF.

* no client spec for client independent areas
      IF l_attributes-properties-client_dependent = abap_false AND
         <l_shm_attach>-client IS NOT INITIAL.
        error_flag = abap_true.
        CLEAR <l_shm_attach>-handle.
        l_area_name = <l_shm_attach>-area_name.
        l_inst_name = <l_shm_attach>-inst_name.
        l_client    = <l_shm_attach>-client.
        CREATE OBJECT <l_shm_attach>-exception TYPE cx_shm_multi_attach_error
          EXPORTING area_name = l_area_name
                    inst_name = l_inst_name
                    client    = l_client
                    textid    = cx_shm_multi_attach_error=>illegal_client_for_area.
        IF ignore_errors = abap_false.
          EXIT.
        ELSE.
          CONTINUE.
        ENDIF.
      ENDIF.

* Check if this area is already accesed by a write lock;
* only possible, if we have a write and an update attach to
*   same area instance and in same client
* only first attach will be proceed
      CASE <l_shm_attach>-lock_kind.
        WHEN cl_shm_area=>lock_kind_update.
          READ TABLE attach_tab
            ASSIGNING <l_other_attach>
            WITH TABLE KEY area_name = <l_shm_attach>-area_name
                           inst_name = <l_shm_attach>-inst_name
                           client    = <l_shm_attach>-client
                           lock_kind = cl_shm_area=>lock_kind_write.

        WHEN cl_shm_area=>lock_kind_write.
          READ TABLE attach_tab
            ASSIGNING <l_other_attach>
            WITH TABLE KEY area_name = <l_shm_attach>-area_name
                           inst_name = <l_shm_attach>-inst_name
                           client    = <l_shm_attach>-client
                           lock_kind = cl_shm_area=>lock_kind_update.

        WHEN OTHERS.
* illegal lock_kind
          l_area_name = <l_shm_attach>-area_name.
          l_inst_name = <l_shm_attach>-inst_name.
          l_client    = <l_shm_attach>-client.
          l_value     = <l_shm_attach>-lock_kind.
          CREATE OBJECT <l_shm_attach>-exception TYPE cx_shm_parameter_error
            EXPORTING parameter = 'LOCK_KIND'
                      value     = l_value
                      area_name = l_area_name
                      inst_name = l_inst_name
                      client    = l_client.
          error_flag = abap_true.
          CLEAR <l_shm_attach>-handle.
          IF abap_false = ignore_errors.
            EXIT.
          ELSE.
            CONTINUE.
          ENDIF.
      ENDCASE. " <l_shm_attach>-lock_kind

      IF 0 = sy-subrc.
* two attach_tab lines contains a change lock to same area instance in same client
        IF <l_other_attach>-handle IS NOT INITIAL OR
           abap_false = ignore_errors.
* we can't set the second change lock (if we don't ignore errors, we can stop now)
          l_area_name = <l_shm_attach>-area_name.
          l_inst_name = <l_shm_attach>-inst_name.
          l_client    = <l_shm_attach>-client.
          CREATE OBJECT <l_shm_attach>-exception TYPE cx_shm_multi_attach_error
            EXPORTING  area_name = l_area_name
                       inst_name = l_inst_name
                       client    = l_client
                       textid    = cx_shm_multi_attach_error=>duplicate_change_lock.
          error_flag = abap_true.
          CLEAR <l_shm_attach>-handle.
          IF ignore_errors = abap_false.
            EXIT.
          ELSE.
            CONTINUE.
          ENDIF.
        ENDIF.
      ENDIF.

* within this multi attach no change lock to this area instance set
      TRY.
          IF <l_shm_attach>-lock_kind = cl_shm_area=>lock_kind_write.
* WRITE ATTACH
            <l_shm_attach>-handle->_prepare_multi_attach_write70(
                   EXPORTING area_name       = <l_shm_attach>-area_name
                             mode            = <l_shm_attach>-attach_mode
                             chck_wrlock_cnt = l_chck_wrlock_cnt
                   CHANGING  wait_time       = l_wait_time ).

            IF cl_shm_area=>attach_mode_wait = <l_shm_attach>-attach_mode.

              WHILE <l_shm_attach>-handle->_lock IS INITIAL.

                IF l_wait_time_per_loop > l_wait_time.
                  l_wait_time_per_loop = l_wait_time.
                  l_wait_time_per_loop_sec = l_wait_time_per_loop / 1000.
                ENDIF.

                WAIT UP TO l_wait_time_per_loop_sec SECONDS.
                l_wait_time = l_wait_time - l_wait_time_per_loop.

                <l_shm_attach>-handle->_prepare_multi_attach_write70(
                       EXPORTING area_name       = <l_shm_attach>-area_name
                                 mode            = cl_shm_area=>attach_mode_wait_2nd_try
                                 chck_wrlock_cnt = l_chck_wrlock_cnt
                       CHANGING  wait_time       = l_wait_time ).

              ENDWHILE.
            ENDIF.
          ELSE.
* UPDATE ATTACH
            CLEAR l_root.
            <l_shm_attach>-handle->_prepare_multi_attach_update70(
                   EXPORTING area_name       = <l_shm_attach>-area_name
                             mode            = <l_shm_attach>-attach_mode
                             chck_wrlock_cnt = l_chck_wrlock_cnt
                   CHANGING  root            = l_root
                             wait_time       = l_wait_time ).

            IF abap_true = l_attributes-properties-has_versions AND
               <l_shm_attach>-handle->_lock IS NOT INITIAL.
* if we have to start class constructors we need a second turn
              <l_shm_attach>-handle->_prepare_multi_attach_update70(
                     EXPORTING area_name       = <l_shm_attach>-area_name
                               mode            = <l_shm_attach>-attach_mode
                               chck_wrlock_cnt = abap_false
                     CHANGING  root            = l_root
                               wait_time       = l_wait_time ).
            ENDIF.

            IF cl_shm_area=>attach_mode_wait = <l_shm_attach>-attach_mode.

              WHILE <l_shm_attach>-handle->_lock IS INITIAL.

                IF l_wait_time_per_loop > l_wait_time.
                  l_wait_time_per_loop = l_wait_time.
                  l_wait_time_per_loop_sec = l_wait_time_per_loop / 1000.
                ENDIF.

                WAIT UP TO l_wait_time_per_loop_sec SECONDS.
                l_wait_time = l_wait_time - l_wait_time_per_loop.

                <l_shm_attach>-handle->_prepare_multi_attach_update70(
                       EXPORTING area_name       = <l_shm_attach>-area_name
                                 mode            = cl_shm_area=>attach_mode_wait_2nd_try
                                 chck_wrlock_cnt = l_chck_wrlock_cnt
                       CHANGING  root            = l_root
                                 wait_time       = l_wait_time ).

                IF abap_true = l_attributes-properties-has_versions AND
                   <l_shm_attach>-handle->_lock IS NOT INITIAL.
* if we have to start class constructors we need a second turn
                  <l_shm_attach>-handle->_prepare_multi_attach_update70(
                         EXPORTING area_name       = <l_shm_attach>-area_name
                                   mode            = cl_shm_area=>attach_mode_wait_2nd_try
                                   chck_wrlock_cnt = l_chck_wrlock_cnt
                         CHANGING  root            = l_root
                                   wait_time       = l_wait_time ).
                ENDIF.
              ENDWHILE.
            ENDIF.

            ASSIGN <l_shm_attach>-handle->('ROOT') TO <l_root>.
            <l_root> ?= l_root.

          ENDIF.
          l_chck_wrlock_cnt = abap_false.
        CATCH cx_shm_attach_error cx_shm_general_error cx_shm_failure
              INTO <l_shm_attach>-exception.
          error_flag = abap_true.
          CLEAR <l_shm_attach>-handle.
          IF ignore_errors = abap_false.
            EXIT.
          ENDIF.
      ENDTRY.

    ENDIF." lock_kind_read = <l_shm_attach>-lock_kind

  ENDLOOP.

  IF error_flag = abap_false OR ignore_errors = abap_true.
* Loop over all areas and attach to them
    LOOP AT attach_tab ASSIGNING <l_shm_attach>.
      IF <l_shm_attach>-handle IS NOT INITIAL.
        <l_shm_attach>-handle->_finish_multi_attach( ).
      ENDIF.
    ENDLOOP.

  ELSE.
* Detach all meanwhile succesfull attached areas
    LOOP AT attach_tab ASSIGNING <l_shm_attach>.
      IF NOT <l_shm_attach>-handle IS INITIAL.
        IF <l_shm_attach>-lock_kind = cl_shm_area=>lock_kind_read.
          <l_shm_attach>-handle->detach( ).
        ELSE.
          <l_shm_attach>-handle->detach_rollback( ).
        ENDIF.
        CLEAR <l_shm_attach>-handle.
      ELSE.
        EXIT.
      ENDIF.
    ENDLOOP.
  ENDIF.

  IF stat_trace_active = abap_true.
    IF stat_trace_service->variant-multi_attach = abap_true.
      stat_trace_service->trin_multi_attach(
                           ignore_errors = ignore_errors
                           wait_time     = wait_time
                           error_flag    = error_flag
                           attach_tab    = attach_tab ).
    ENDIF.
  ENDIF.

ENDMETHOD.


method _ATTACH_READ by kernel module ab_ShmkmAttachRead.
endmethod.


method _ATTACH_READ71 by kernel module ab_ShmkmAttachRead71.
endmethod.


METHOD _attach_update70 BY KERNEL MODULE ab_shmkmattachupdate70.
ENDMETHOD.


METHOD _attach_write70 BY KERNEL MODULE ab_shmkmattachwrite70.
ENDMETHOD.


method _DETACH by kernel module ab_ShmkmDetach.
endmethod.


method _DETACH_ALL_AREAS by kernel module ab_ShmkmDetachAllArea.
endmethod.


method _DETACH_AREA by kernel module ab_ShmkmDetachArea.
endmethod.


method _DETACH_AREA71 by kernel module ab_ShmkmDetachArea71.
endmethod.


method _DETACH_COMMIT by kernel module ab_ShmkmDetachCommit.
endmethod.


method _DETACH_ROLLBACK by kernel module ab_ShmkmDetachRollback.
endmethod.


method _FINISH_MULTI_ATTACH by kernel module ab_ShmkmFinishMultiAttach.
endmethod.


method _FREE_AREA by kernel module ab_ShmkmFreeArea.
endmethod.


METHOD _free_area71 BY KERNEL MODULE ab_shmkmfreearea71.
ENDMETHOD.


method _FREE_INSTANCE by kernel module ab_ShmkmFreeInstance.
endmethod.


METHOD _free_instance71 BY KERNEL MODULE ab_shmkmfreeinstance71.
ENDMETHOD.


method _GET_INSTANCE_INFOS by kernel module ab_ShmkmGetInstanceInfos.
endmethod.


method _GET_INSTANCE_INFOS71 by kernel module ab_ShmkmGetInstanceInfos71.
endmethod.


method _GET_INSTANCE_INFOS804 by kernel module ab_ShmkmGetInstanceInfos804 fail.
endmethod.


method _HAS_ACTIVE_PROPERTIES by kernel module ab_ShmkmHasActiveProperties.
endmethod.


method _INVALIDATE_AREA by kernel module ab_ShmkmInvalidateArea.
endmethod.


METHOD _invalidate_area71 BY KERNEL MODULE ab_shmkminvalidatearea71.
ENDMETHOD.


method _INVALIDATE_INSTANCE by kernel module ab_ShmkmInvalidateInstance.
endmethod.


METHOD _invalidate_instance71 BY KERNEL MODULE ab_shmkminvalidateinstance71.
ENDMETHOD.


method _PREPARE_MULTI_ATTACH_READ by kernel module ab_ShmkmPrepareMultiAttachRead.
endmethod.


method _PREPARE_MULTI_ATTACH_READ71 by kernel module ab_ShmkmPrepareMultiAttachRead71.
endmethod.


METHOD _prepare_multi_attach_update70 BY KERNEL MODULE ab_shmkmpreparemultiattachupdate70.
ENDMETHOD.


METHOD _prepare_multi_attach_write70 BY KERNEL MODULE ab_shmkmpreparemultiattachwrite70.
ENDMETHOD.


METHOD _propagate_area.

  DATA:
    l_affect_server TYPE shm_affect_server.

  IF abap_true = affecting_local_server.
    l_affect_server = cl_shm_area=>affect_all_servers.
  ELSE.
    l_affect_server = cl_shm_area=>affect_all_servers_but_local.
  ENDIF.

  _invalidate_area71(
    area_name         = area_name
    client            = client
    client_supplied   = client_supplied
    transactional     = transactional
    client_dependent  = client_dependent
    terminate_changer = abap_false
    affect_server     = l_affect_server
    life_context      = life_context_appserver ).

ENDMETHOD.


METHOD _propagate_instance.

  DATA:
    l_affect_server TYPE shm_affect_server.

  IF abap_true = affecting_local_server.
    l_affect_server = cl_shm_area=>affect_all_servers.
  ELSE.
    l_affect_server = cl_shm_area=>affect_all_servers_but_local.
  ENDIF.

  _invalidate_instance71(
    area_name         = area_name
    inst_name         = inst_name
    client            = client
    client_supplied   = client_supplied
    transactional     = transactional
    client_dependent  = client_dependent
    terminate_changer = abap_false
    affect_server     = l_affect_server
    life_context      = life_context_appserver ).

ENDMETHOD.


method _SET_ROOT by kernel module ab_ShmkmSetRoot.
endmethod.
ENDCLASS.