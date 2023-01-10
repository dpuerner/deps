class lcl_check definition final create private friends cl_os_ca_common.
  private section.
    class-methods:
      transaction
        importing i_operation type clike
                  i_class_name type clike,
      poc
        importing i_class_name type clike.
endclass.

class lcl_check implementation.
  method transaction.
    data: transaction_manager     type ref to if_os_transaction_manager.
    data: transaction             type ref to if_os_transaction.
    data: transaction_status      type os_tstatus.

    transaction_manager = cl_os_system=>get_transaction_manager( ).
    transaction         = transaction_manager->get_top_transaction( ).

    assert id sos_transaction
      subkey |NO_TRANSACTION| &&
             |({ i_class_name },{ sy-oncom },{ i_operation })|
      condition transaction is not initial.
    if transaction is not initial.
      transaction_status = transaction->get_status( ).
      assert id sos_transaction
        subkey |TRANSACTION_NOT_RUNNING| &&
               |({ i_class_name },{ transaction_status },{ sy-oncom },{ i_operation })|
        condition transaction_status eq oscon_tstatus_running.
    endif.
  endmethod.
  method poc.
   if ( cl_os_system=>init_state is initial ) .
     assert id sos_transaction
       subkey |INIT_IN_POC({ i_class_name })|
       condition not cl_system_transaction_state=>get_on_commit( ) = 1.
    endif.
  endmethod.
endclass.

class CL_OS_CA_COMMON definition
  public
  abstract
  create public .

*"* public components of class CL_OS_CA_COMMON
*"* do not include other source files here!!!
public section.
  interface IF_OS_STATE load .

  interfaces IF_OS_CA_INSTANCE .
  interfaces IF_OS_CA_PERSISTENCY .
  interfaces IF_OS_CA_SERVICE .
  interfaces IF_OS_FACTORY .

  class-methods INIT .
  type-pools OSCON .
  type-pools OSTYP .
protected section.
*"* protected components of class CL_OS_CA_COMMON
*"* do not include other source files here!!!

  types TYP_INTERNAL_OID type I .
  types TYP_INDEX like SY-TABIX .
  types TYP_OBJECT_IREF type ref to IF_OS_STATE .
  types:
    begin of TYP_OBJECT_INFO ,
      OBJECT_ID     type        TYP_INTERNAL_OID ,
      OBJECT_IREF   type        TYP_OBJECT_IREF ,
      OBJECT_WREF   type ref to CL_ABAP_WEAK_REFERENCE ,
      PM_STATUS     type        OS_OSTATUS ,
      PM_DBSTATUS   type        OS_DSTATUS ,
      PM_SUB_RW     type        OS_BOOLEAN ,
      PM_SUB_CHG    type        OS_BOOLEAN ,
      UM_SUB_WRITE  type        OS_BOOLEAN ,
      EXT_SUB_READ  type        OS_BOOLEAN ,
      EXT_SUB_WRITE type        OS_BOOLEAN ,
      EXT_SUB_CHG   type        OS_BOOLEAN ,
      SM_SUB_READ   type        OS_BOOLEAN ,
      SM_SUB_WRITE  type        OS_BOOLEAN ,
      SM_SUB_CHG    type        OS_BOOLEAN ,
      OM_IGNORE     type        OS_BOOLEAN ,
      TM_USED       type        OS_BOOLEAN ,
    end of TYP_OBJECT_INFO .
  types:
    TYP_OBJECT_INFO_TAB
      type sorted table of TYP_OBJECT_INFO
      with unique key OBJECT_ID .
  types:
    begin of TYP_PM_UNDO_INFO ,
      OBJECT_ID     type        TYP_INTERNAL_OID ,
      OBJECT_IREF   type        TYP_OBJECT_IREF ,
      STATE_OBJECT  type ref to OBJECT ,
      PM_STATUS     type        OS_OSTATUS ,
      PM_DBSTATUS   type        OS_DSTATUS ,
      PM_SUB_RW     type        OS_BOOLEAN ,
      PM_SUB_CHG    type        OS_BOOLEAN ,
      UM_SUB_WRT    type        OS_BOOLEAN ,
      EXT_SUB_READ  type        OS_BOOLEAN ,
      EXT_SUB_WRITE type        OS_BOOLEAN ,
      EXT_SUB_CHG   type        OS_BOOLEAN ,
    end of TYP_PM_UNDO_INFO .
  types:
    TYP_PM_UNDO_INFOS_TAB
      type standard table of TYP_PM_UNDO_INFO
      with default key .
  types:
    begin of TYP_UNDO_TRANSACTION_ITEM ,
      TRANSACTION type ref to IF_OS_TRANSACTION ,
      PM_INDEX    type        TYP_INDEX ,
      EXT_INDEX   type        TYP_INDEX ,
    end of TYP_UNDO_TRANSACTION_ITEM .
  types:
    TYP_UNDO_TRANSACTION_STACK
      type standard table of TYP_UNDO_TRANSACTION_ITEM
      with default key .
  types:
    TYP_OBJECT_TAB
      type standard table of TYP_OBJECT_IREF
      with default key .
  types:
    TYP_INDEX_TAB
      type standard table of TYP_INDEX
      with default key .
  types:
    begin of TYP_CLASS_INFO ,
      CLASS_NAME          type        OBJNAME ,
      CLASS_AGENT_NAME    type        OBJNAME ,
      CLASS_GUID          type        OS_GUID ,
      CLASS_AGENT_GUID    type        OS_GUID ,
      AGENT               type ref to CL_OS_CA_COMMON ,
      STORAGE_LOCATION    type        OBJNAME ,
      CLASS_AGENT_VERSION type        CHAR8 ,
    end of TYP_CLASS_INFO .
  types:
    begin of TYP_INTERNAL_UNDO_INFO ,
      OBJECT_INDEX type TYP_INDEX ,
      OBJECT_INFO  type TYP_OBJECT_INFO ,
      OBJECT_IREF  type TYP_OBJECT_IREF ,
    end of TYP_INTERNAL_UNDO_INFO .
  types:
    TYP_INTERNAL_UNDO_INFO_STACK
      type standard table of TYP_INTERNAL_UNDO_INFO
      with default key .
  types:
    begin of TYP_PM_RUNTIME_CHECK_INFO,
      TABNAME type OBJNAME,
      FLDCNT type N length 4,
    end of TYP_PM_RUNTIME_CHECK_INFO .
  types:
    TYP_PM_RUNTIME_CHECK_INFO_TAB
      type standard table of TYP_PM_RUNTIME_CHECK_INFO
      with default key .
  types TYP_ID_STATUS type INT4 .

  data OBJECT_INFO type TYP_OBJECT_INFO_TAB .
  data UNDO_TRANSACTION_STACK type TYP_UNDO_TRANSACTION_STACK .
  data PM_UNDO_INFO type TYP_PM_UNDO_INFOS_TAB .
  data PM_NEXT_UNDO_INFO type TYP_INDEX .
  data EXT_NEXT_UNDO_INFO type TYP_INDEX .
  data PERSISTENCY_MANAGER type ref to IF_OS_PERSISTENCY_MANAGER .
  data UM_CURRENT_TRANSACTION type TYP_INDEX .
  data CLASS_INFO type TYP_CLASS_INFO .
  data CURRENT_OBJECT_INFO type TYP_OBJECT_INFO .
  data CURRENT_OBJECT_INDEX type TYP_INDEX .
  data CURRENT_OBJECT_IREF type TYP_OBJECT_IREF .
  data INTERNAL_UNDO_INFO type TYP_INTERNAL_UNDO_INFO_STACK .
  data INTERNAL_NEXT_UNDO_INFO type TYP_INDEX value 1 .
  data INTERNAL_TRANSACTION_STACK type TYP_INDEX_TAB .
  data INTERNAL_CURRENT_TRANSACTION type TYP_INDEX .
  constants ID_STATUS_NONE type TYP_ID_STATUS value 0. "#EC NOTEXT
  constants ID_STATUS_BKEY_ONLY type TYP_ID_STATUS value 1. "#EC NOTEXT
  constants ID_STATUS_OID_ONLY type TYP_ID_STATUS value 2. "#EC NOTEXT
  constants ID_STATUS_COMPLETE type TYP_ID_STATUS value 3. "#EC NOTEXT
  type-pools OSCON .
  constants DMODE_DIRECT type OS_DMODE value OSCON_DMODE_DIRECT. "#EC NOTEXT
  data OS_GARBAGE_COLLECTOR_LAST_RUN type ref to CL_GC_LAST_RUN .
  data OS_PM_RUNTIME_CHECK_INFO_TAB type TYP_PM_RUNTIME_CHECK_INFO_TAB .

  methods DELETE_SPECIAL_OBJECT_INFO .
  methods EXT_HANDLER_CHANGED .
  methods EXT_HANDLER_READ_ACCESS .
  methods EXT_HANDLER_WRITE_ACCESS .
  methods EXT_PM_CREATED_PERSISTENT .
  methods EXT_PM_CREATED_REPRESENTANT .
  methods EXT_PM_CREATED_TRANSIENT .
  methods EXT_PM_DELETED_PERSISTENT .
  methods EXT_PM_LOADED_PERSISTENT .
  methods EXT_PM_REFRESHED_PERSISTENT .
  methods EXT_PREPARE_TOP_TRANSACTION
    importing
      !I_INVALIDATE type OS_BOOLEAN .
  methods EXT_UM_TRANSACTION_ENDED .
  methods EXT_UM_TRANSACTION_STARTED .
  methods EXT_UM_UNDO
    importing
      !I_INDEX_TAB type TYP_INDEX_TAB .
  methods HANDLER_CHANGED
    for event CHANGED of IF_OS_STATE
    importing
      !SENDER .
  methods LOAD_SPECIAL_OBJECT_INFO .
  methods HANDLER_READ_ACCESS
    for event READ_ACCESS of IF_OS_STATE
    importing
      !SENDER .
  methods MAP_INVALIDATE
    importing
      !I_OBJECT_IREF_TAB type TYP_OBJECT_TAB .
  methods MAP_RUNTIME_CHECK_CREATE_DATA .
  methods OS_CLEAR_CURRENT .
  methods HANDLER_WRITE_ACCESS
    for event WRITE_ACCESS of IF_OS_STATE
    importing
      !SENDER .
  methods OS_CREATE_NEW_ENTRY_FOR_REPR
    importing
      !I_OBJECT type TYP_OBJECT_IREF
      !I_INTERNAL_OID type TYP_INTERNAL_OID .
  methods OS_GET_INTERNAL_OID_BY_REF
    importing
      !I_OBJECT type TYP_OBJECT_IREF
    returning
      value(RESULT) type TYP_INTERNAL_OID .
  methods OS_GET_REF_BY_INTERNAL_OID
    importing
      !I_INTERNAL_OID type TYP_INTERNAL_OID
    returning
      value(RESULT) type TYP_OBJECT_IREF .
  methods OS_INTERNAL_UNDO .
  methods OS_LOAD_AND_VALIDATE_CURRENT
    importing
      !I_INDEX type TYP_INDEX .
  methods OS_PM_CREATED_PERSISTENT .
  methods OS_PM_CREATED_REPRESENTANT .
  methods OS_PM_CREATED_TRANSIENT .
  methods OS_PM_DELETED_PERSISTENT .
  methods OS_PM_HANDLE_CREATE_ON_EXIST
    importing
      !I_TRANSIENT type OS_BOOLEAN default OSCON_FALSE .
  methods OS_PM_LOADED_PERSISTENT .
  methods OS_PM_DELETE_PERSISTENT .
  methods OS_PM_RUNTIME_CHECK_EXECUTE .
  methods PM_LOAD
    raising
      CX_OS_OBJECT_NOT_FOUND .
  methods REGISTER_CLASS_AGENT
    importing
      !I_CLASS_NAME type OBJNAME
      !I_CLASS_AGENT_NAME type OBJNAME
      !I_CLASS_GUID type SYSUUID_C
      !I_CLASS_AGENT_GUID type SYSUUID_C
      !I_AGENT type ref to OBJECT
      !I_STORAGE_LOCATION type OBJNAME
      !I_CLASS_AGENT_VERSION type CHAR8 .
  methods SAVE_SPECIAL_OBJECT_INFO .
  methods SM_UPDATE_CURRENT_SUBSCRIPTION .
  methods SM_UPDATE_SUBSCRIPTIONS
    importing
      !I_INDEX_TAB type TYP_INDEX_TAB .
  methods PM_HANDLER_CHANGED .
  methods PM_HANDLER_RW_ACCESS
    importing
      !I_WRITE_ACCESS type OS_BOOLEAN default 'X' .
  methods UM_HANDLER_WRITE_ACCESS .
  methods UM_TRANSACTION_ENDED
    for event UNDOABLE_TRANSACTION_ENDED of IF_OS_UNDO_MANAGER
    importing
      !E_TRANSACTION .
  methods UM_TRANSACTION_STARTED
    for event UNDOABLE_TRANSACTION_STARTED of IF_OS_UNDO_MANAGER
    importing
      !E_TRANSACTION .
  methods UM_UNDO
    for event UNDO_REQUESTED of IF_OS_UNDO_MANAGER
    importing
      !E_TRANSACTION .
  type-pools OSTYP .
  methods OM_SET_OBJECTS
    importing
      !I_OBJECTS type OSTYP_REF_TAB .
  methods OM_RESTORE_OBJECTS .
  methods OS_VALID_INSTANCE
    importing
      !I_OBJECT type ref to OBJECT
    returning
      value(RESULT) type OS_BOOLEAN .
private section.
*"* private components of class CL_OS_CA_COMMON
*"* do not include other source files here!!!
ENDCLASS.


CLASS CL_OS_CA_COMMON IMPLEMENTATION.


method DELETE_SPECIAL_OBJECT_INFO . "#EC NEEDED
* to be implemented in subclass!!!
************************************************************************
* Purpose        : Delete current entry SPECIAL_OBJECT_INFO
*
* Version        : 2.0
*
* Precondition   : Index is set in CURRENT_OBJECT_INDEX
*
* Postcondition  : entry is deleted
*
* OO Exceptions  : --
*
* Implementation : must be implemented in subclass
*
************************************************************************
* Changelog:
* - 2000-03-02   : (BGR) Initial Version
************************************************************************

endmethod. "DELETE_SPECIAL_OBJECT_INFO


method EXT_HANDLER_CHANGED. "#EC NEEDED
* to be implemented in subclass!!!
************************************************************************
* Purpose        : Do additional actions while handling the CHANGED
*                  event of the CURRENT object
*
* Version        : 2.0
*
* Precondition   : CURRENT is set, Handler of Persistency Manager has
*                  already been called, EXT_SUB_CHG is TRUE
*
* Postcondition  : CURRENT is still set, OBJECT_INFO table unchanged!
*
* Implementation : can be implemented in subclass
*                  Attention: Save CURRENT before calling an external
*                             method that could cause a call-back to the
*                             class agent.
*
************************************************************************
* Changelog:
* - 2000-03-02   : (BGR) Initial Version
************************************************************************
endmethod. "EXT_HANDLER_CHANGED


method EXT_HANDLER_READ_ACCESS . "#EC NEEDED
* to be implemented in subclass!!!
************************************************************************
* Purpose        : Do additional actions while handling the READ_ACCESS
*                  event of the CURRENT object
*
* Version        : 2.0
*
* Precondition   : CURRENT is set, Handler of Persistency Manager has
*                  already been called, EXT_SUB_READ is TRUE
*
* Postcondition  : CURRENT is still set, OBJECT_INFO table unchanged!
*
* Implementation : can be implemented in subclass
*                  Attention: Save CURRENT before calling an external
*                             method that could cause a call-back to the
*                             class agent.
*
************************************************************************
* Changelog:
* - 2000-03-02   : (BGR) Initial Version
************************************************************************
endmethod. "EXT_HANDLER_READ_ACCESS


method EXT_HANDLER_WRITE_ACCESS . "#EC NEEDED
* to be implemented in subclass!!!
************************************************************************
* Purpose        : Do additional actions while handling the WRITE_ACCESS
*                  event of the CURRENT object
*
* Version        : 2.0
*
* Precondition   : CURRENT is set, Handler of Persistency Manager has
*                  already been called, EXT_SUB_WRITE is TRUE
*
* Postcondition  : CURRENT is still set, OBJECT_INFO table unchanged!
*
* Implementation : can be implemented in subclass
*                  Attention: Save CURRENT before calling an external
*                             method that could cause a call-back to the
*                             class agent.
*
************************************************************************
* Changelog:
* - 2000-03-02   : (BGR) Initial Version
************************************************************************
endmethod. "EXT_HANDLER_WRITE_ACCESS


method EXT_PM_CREATED_PERSISTENT . "#EC NEEDED
* to be implemented in subclass!!!
************************************************************************
* Purpose        : Do additional actions after creating a new persistent
*                  object
*
* Version        : 2.0
*
* Precondition   : CURRENT is set
*
* Postcondition  : CURRENT is still set, OBJECT_INFO table unchanged!
*
* Implementation : can be implemented in subclass
*                  Attention: Save CURRENT before calling an external
*                             method that could cause a call-back to the
*                             class agent.
*
************************************************************************
* Changelog:
* - 2000-03-02   : (BGR) Initial Version
************************************************************************
endmethod. "EXT_PM_CREATED_PERSISTENT


method EXT_PM_CREATED_REPRESENTANT . "#EC NEEDED
* to be implemented in subclass!!!
************************************************************************
* Purpose        : Do additional actions after creating a new
*                  representant
*
* Version        : 2.0
*
* Precondition   : CURRENT is set
*
* Postcondition  : CURRENT is still set, OBJECT_INFO table unchanged!
*
* Implementation : can be implemented in subclass
*                  Attention: Save CURRENT before calling an external
*                             method that could cause a call-back to the
*                             class agent.
*
************************************************************************
* Changelog:
* - 2000-03-02   : (BGR) Initial Version
************************************************************************
endmethod. "EXT_PM_CREATED_REPRESENTANT


method EXT_PM_CREATED_TRANSIENT . "#EC NEEDED
* to be implemented in subclass!!!
************************************************************************
* Purpose        : Do additional actions after creating a new transient
*                  object
*
* Version        : 2.0
*
* Precondition   : CURRENT is set
*
* Postcondition  : CURRENT is still set, OBJECT_INFO table unchanged!
*
* Implementation : can be implemented in subclass
*                  Attention: Save CURRENT before calling an external
*                             method that could cause a call-back to the
*                             class agent.
*
************************************************************************
* Changelog:
* - 2000-03-02   : (BGR) Initial Version
************************************************************************
endmethod. "EXT_PM_CREATED_TRANSIENT


method EXT_PM_DELETED_PERSISTENT . "#EC NEEDED
* to be implemented in subclass!!!
************************************************************************
* Purpose        : Do additional actions after deleting a persistent
*                  object
*
* Version        : 2.0
*
* Precondition   : CURRENT is set
*
* Postcondition  : CURRENT is still set, OBJECT_INFO table unchanged!
*
* Implementation : can be implemented in subclass
*                  Attention: Save CURRENT before calling an external
*                             method that could cause a call-back to the
*                             class agent.
*
************************************************************************
* Changelog:
* - 2000-03-02   : (BGR) Initial Version
************************************************************************
endmethod. "EXT_PM_DELETED_PERSISTENT


method EXT_PM_LOADED_PERSISTENT . "#EC NEEDED
* to be implemented in subclass!!!
************************************************************************
* Purpose        : Do additional actions after loading a persistent
*                  object
*
* Version        : 2.0
*
* Precondition   : CURRENT is set
*
* Postcondition  : CURRENT is still set, OBJECT_INFO table unchanged!
*
* Implementation : can be implemented in subclass
*                  Attention: Save CURRENT before calling an external
*                             method that could cause a call-back to the
*                             class agent.
*
************************************************************************
* Changelog:
* - 2000-03-02   : (BGR) Initial Version
************************************************************************
endmethod." EXT_PM_LOADED_PERSISTENT


method EXT_PM_REFRESHED_PERSISTENT. "#EC NEEDED
* to be implemented in subclass!!!
************************************************************************
* Purpose        : Do additional actions after resetting a persistent
*                  object's state from "loaded" to "not loaded"
*
* Version        : 2.0
*
* Precondition   : CURRENT is set
*
* Postcondition  : CURRENT is still set, OBJECT_INFO table unchanged!
*
* Implementation : can be implemented in subclass
*                  Attention: Save CURRENT before calling an external
*                             method that could cause a call-back to the
*                             class agent.
*
************************************************************************
* Changelog:
* - 2000-03-10   : (BGR) Initial Version
************************************************************************
endmethod. "EXT_PM_REFRESHED_PERSISTENT


method EXT_PREPARE_TOP_TRANSACTION . "#EC NEEDED
* to be implemented in subclass!!!
************************************************************************
* Purpose        : Do additional actions after creating a new persistent
*                  object
*
* Version        : 2.0
*
* Precondition   : CURRENT is set
*
* Postcondition  : CURRENT is still set, OBJECT_INFO table unchanged!
*
* Implementation : can be implemented in subclass
*                  Attention: Save CURRENT before calling an external
*                             method that could cause a call-back to the
*                             class agent.
*
************************************************************************
* Changelog:
* - 2000-03-02   : (BGR) Initial Version
************************************************************************
endmethod. "PM_CREATED_PERSISTENT


method EXT_UM_TRANSACTION_ENDED . "#EC NEEDED
************************************************************************
* Purpose        : Do additional actions for Undo after an undo-relevant
*                  transaction has been ended.
*
* Version        : 2.0
*
* Precondition   : UM_CURRENT_TRANSACTION still has the index to the
*                  entry of UNDO_TRANSACTION_STACK that will be deleted
*                  by the undo manager after this method has ended.
*
* Postcondition  : --
*
* Implementation : can be implemented in subclass
*
************************************************************************
* Changelog:
* - 2000-03-03   : (BGR) Initial Version
************************************************************************
endmethod. "EXT_UM_TRANSACTION_ENDED


method EXT_UM_TRANSACTION_STARTED. "#EC NEEDED
* to be implemented in subclass!!!
************************************************************************
* Purpose        : Do additional actions for Undo after an undo-relevant
*                  transaction has been started.
*
* Version        : 2.0
*
* Precondition   : The common Undo manager has subscribed to all undo
*                  relevant objects.
*                  UM_CURRENT_TRANSACTION is set to the index of the
*                  new entry on UNDO_TRANSACTION_STACK
*
* Postcondition  : --
*
* Implementation : can be implemented in subclass
*
************************************************************************
* Changelog:
* - 2000-03-03   : (BGR) Initial Version
************************************************************************
endmethod. "EXT_UM_TRANSACTION_STARTED


method EXT_UM_UNDO . "#EC NEEDED
       " importing I_INDEX_TAB type TYP_INDEX_TAB
* to be implemented in subclass!!!
************************************************************************
* Purpose        : Do additional actions for Undo after the common Undo
*                  Manager has restored state of all objects in
*                  I_INDEX_TAB
*
* Version        : 2.0
*
* Precondition   : The common Undo manager has restored the state of
*                  all objects in I_INDEX_TAB
*                  The entry on TRANSACTION STACK and
*                  UM_CURRENT_TRANSACTION belong still to the
*                  transaction to be finished by undo
*
* Postcondition  : --
*
* Implementation : can be implemented in subclass
*                  If an own undo info stack has been used, compare
*                  index EXT_INDEX of current entry of TRANSACTION STACK
*                  with index EXT_NEXT_UNDO_INFO
*                  if own undo information have been added to
*                  SPECIAL_OBJECT_INFO, use I_INDEX_TAB to see which
*                  entries have been processed.
*
************************************************************************
* Changelog:
* - 2000-03-03   : (BGR) Initial Version
************************************************************************
endmethod. "EXT_UM_UNDO


method HANDLER_CHANGED .
     " for event IF_OS_STATE~CHANGED
     " importing SENDER type ref to IF_OS_STATE
************************************************************************
* Purpose        : Subscription Manager: Receive Event CHANGED
*                  and call the corresponding handler methods of the
*                  subscribed services.
*
* Version        : 2.0
*
* Precondition   : --
*
* Postcondition  : The handler methods have been called if necessary,
*                  CURRENT is clear.
*
* OO Exceptions  : propagates PM_HANDLER_CHANGED with cleanup
*                  propagates EXT_HANDLER_CHANGED with cleanup
*
* Implementation : 1. get internal OID of the SENDER
*                  2. search entry in OBJECT_INFO and load CURRENT
*                  3. call Persistency Manager: PM_HANDLER_CHANGED
*                  4. call subclass extension: EXT_HANDLER_CHANGED
*                  5. update subscriptions
*                  6. save CURRENT
*                  7. clear CURRENT
*
************************************************************************
* Changelog:
* - 2000-03-02   : (BGR) Initial Version
* - 2000-08-29   : (SB)  OO Exceptions
************************************************************************

  data: INTERNAL_OID type TYP_INTERNAL_OID.

* * 1. get internal OID of the SENDER

  INTERNAL_OID = OS_GET_INTERNAL_OID_BY_REF(
      I_OBJECT = SENDER ).

* * 2. search entry in OBJECT_INFO and load CURRENT
  read table OBJECT_INFO into CURRENT_OBJECT_INFO
       with key OBJECT_ID = INTERNAL_OID.

  if ( sy-subrc <> 0 ). "found no entry

*   * un-subscribe
    set handler HANDLER_CHANGED for SENDER
        activation OSCON_EXT_FALSE.

  else. "( entry found )

*   * load current
    CURRENT_OBJECT_INDEX = sy-tabix.
    CURRENT_OBJECT_IREF  = SENDER.

    call method LOAD_SPECIAL_OBJECT_INFO.

    try.
*       * 3. call Persistency Manager: PM_HANDLER_CHANGED
        if ( CURRENT_OBJECT_INFO-PM_SUB_CHG = OSCON_TRUE ).

          call method PM_HANDLER_CHANGED.

        endif. "( Persistency Manager )

*       * 4. call subclass extension: EXT_HANDLER_CHANGED
        if ( CURRENT_OBJECT_INFO-EXT_SUB_CHG = OSCON_TRUE ).

          call method EXT_HANDLER_CHANGED.

        endif. "( Persistency Manager )

*       * 5. update subscriptions
        call method SM_UPDATE_CURRENT_SUBSCRIPTION.

      cleanup.
        clear: CURRENT_OBJECT_INFO,
               CURRENT_OBJECT_IREF,
               CURRENT_OBJECT_INDEX.
    endtry.

*  * 6. save CURRENT
    modify OBJECT_INFO from CURRENT_OBJECT_INFO
           index CURRENT_OBJECT_INDEX.
    call method SAVE_SPECIAL_OBJECT_INFO.

*   * 7. clear CURRENT
    clear: CURRENT_OBJECT_INFO,
           CURRENT_OBJECT_IREF,
           CURRENT_OBJECT_INDEX.

  endif. "( entry found? )

endmethod. "HANDLER_CHANGED


method HANDLER_READ_ACCESS .
     " for event IF_OS_STATE~READ_ACCESS
     " importing SENDER type ref to IF_OS_STATE
************************************************************************
* Purpose        : Subscription Manager: Receive Event READ_ACCESS
*                  and call the corresponding handler methods of the
*                  subscribed services.
*
* Version        : 2.0
*
* Precondition   : --
*
* Postcondition  : The handler methods have been called if necessary,
*                  CURRENT is clear.
*
* OO Exceptions  : propagates PM_HANDLER_RW_ACCESS with cleanup
*                  propagates EXT_HANDLER_READ_ACCESS with cleanup
*
* Implementation : 1. get internal OID of the SENDER
*                  2. search entry in OBJECT_INFO and load CURRENT
*                  3. call Persistency Manager: PM_HANDLER_RW_ACCESS
*                  4. call subclass extension: EXT_HANDLER_READ_ACCESS
*                  5. update subscriptions
*                  6. save CURRENT
*                  7. clear CURRENT
*
************************************************************************
* Changelog:
* - 2000-03-02   : (BGR) Initial Version
* - 2000-08-29   : (SB)  OO Exceptions
* - 2003-10-31   : (SB)  Fix for Write Access Flag
************************************************************************

  data: INTERNAL_OID type TYP_INTERNAL_OID.

* * 1. get internal OID of the SENDER

  INTERNAL_OID = OS_GET_INTERNAL_OID_BY_REF(
      I_OBJECT = SENDER ).

* * 2. search entry in OBJECT_INFO and load CURRENT
  read table OBJECT_INFO into CURRENT_OBJECT_INFO
       with key OBJECT_ID = INTERNAL_OID.

  if ( sy-subrc <> 0 ). "found no entry

*   * un-subscribe
    set handler HANDLER_READ_ACCESS for SENDER
        activation OSCON_EXT_FALSE.

  else. "( entry found )

*   * load current
    CURRENT_OBJECT_INDEX = sy-tabix.
    CURRENT_OBJECT_IREF  = SENDER.
    current_object_info-tm_used = oscon_true.

    call method LOAD_SPECIAL_OBJECT_INFO.

    try.

*     * internal Undo
      append INTERNAL_NEXT_UNDO_INFO to INTERNAL_TRANSACTION_STACK.
      INTERNAL_CURRENT_TRANSACTION = sy-tabix.

*     * 3. call Persistency Manager: PM_HANDLER_RW_ACCESS
      if ( CURRENT_OBJECT_INFO-PM_SUB_RW = OSCON_TRUE ).

        call method PM_HANDLER_RW_ACCESS
             exporting I_WRITE_ACCESS = OSCON_FALSE.

      endif. "( Persistency Manager )

*     * 4. call subclass extension: EXT_HANDLER_READ_ACCESS
      if ( CURRENT_OBJECT_INFO-EXT_SUB_READ = OSCON_TRUE ).

        call method EXT_HANDLER_READ_ACCESS.

      endif. "( Persistency Manager )


*     * 5. update subscriptions
      call method SM_UPDATE_CURRENT_SUBSCRIPTION.

*    * 6. save CURRENT
      modify OBJECT_INFO from CURRENT_OBJECT_INFO
             index CURRENT_OBJECT_INDEX.
      call method SAVE_SPECIAL_OBJECT_INFO.

    cleanup.
      call method OS_INTERNAL_UNDO.
      clear: CURRENT_OBJECT_INFO,
             CURRENT_OBJECT_IREF,
             CURRENT_OBJECT_INDEX.
    endtry.

*   * 7. clear CURRENT
    clear: CURRENT_OBJECT_INFO,
           CURRENT_OBJECT_IREF,
           CURRENT_OBJECT_INDEX.

*   * Clean-up internal Undo
    delete INTERNAL_TRANSACTION_STACK
           index INTERNAL_CURRENT_TRANSACTION.
    add -1 to INTERNAL_CURRENT_TRANSACTION.
    if ( INTERNAL_TRANSACTION_STACK is initial ).
      clear INTERNAL_UNDO_INFO.
      INTERNAL_NEXT_UNDO_INFO = 1.
    endif. "( INTERNAL_TRANSACTION_STACK is initial? )

  endif. "( entry found? )

endmethod. "HANDLER_READ_ACCESS


method HANDLER_WRITE_ACCESS .
     " for event IF_OS_STATE~WRITE_ACCESS
     " importing SENDER type ref to IF_OS_STATE
************************************************************************
* Purpose        : Subscription Manager: Receive Event WRITE_ACCESS
*                  and call the corresponding handler methods of the
*                  subscribed services.
*
* Version        : 2.0
*
* Precondition   : --
*
* Postcondition  : The handler methods have been called if necessary,
*                  CURRENT is clear.
*
* OO Exceptions  : propagates PM_HANDLER_RW_ACCESS with cleanup
*                  propagates EXT_HANDLER_WRITE_ACCESS with cleanup
*                  propagates UM_HANDLER_WRITE_ACCESS with cleanup
*
* Implementation : 1. get internal OID of the SENDER
*                  2. search entry in OBJECT_INFO and load CURRENT
*                  3. call Persistency Manager: PM_HANDLER_RW_ACCESS
*                  4. call subclass extension: EXT_HANDLER_WRITE_ACCESS
*                  5. call Undo Manager: UM_HANDLER_WRITE_ACCESS
*                  6. update subscriptions
*                  7. save CURRENT
*                  8. clear CURRENT
*
************************************************************************
* Changelog:
* - 2000-03-02   : (BGR) Initial Version
* - 2000-08-29   : (SB)  OO Exceptions
* - 2003-10-31   : (SB)  Fix for Write Access Flag
************************************************************************

  data: INTERNAL_OID type TYP_INTERNAL_OID.

* * 1. get internal OID of the SENDER

  INTERNAL_OID = OS_GET_INTERNAL_OID_BY_REF(
      I_OBJECT = SENDER ).

* * 2. search entry in OBJECT_INFO and load CURRENT
  read table OBJECT_INFO into CURRENT_OBJECT_INFO
       with key OBJECT_ID = INTERNAL_OID.

  if ( sy-subrc <> 0 ). "found no entry

*   * un-subscribe
    set handler HANDLER_WRITE_ACCESS for SENDER
        activation OSCON_EXT_FALSE.

  else. "( entry found )

*   * load current
    CURRENT_OBJECT_INDEX = sy-tabix.
    CURRENT_OBJECT_IREF  = SENDER.
    current_object_info-tm_used = oscon_true.

    call method LOAD_SPECIAL_OBJECT_INFO.

    try.

*       * internal Undo
        append INTERNAL_NEXT_UNDO_INFO to INTERNAL_TRANSACTION_STACK.
        INTERNAL_CURRENT_TRANSACTION = sy-tabix.

*       * 3. call Persistency Manager: PM_HANDLER_RW_ACCESS
        if ( CURRENT_OBJECT_INFO-PM_SUB_RW = OSCON_TRUE ).

          call method PM_HANDLER_RW_ACCESS
               exporting I_WRITE_ACCESS = OSCON_TRUE.

        endif. "( Persistency Manager )

*       * 4. call subclass extension: EXT_HANDLER_WRITE_ACCESS
        if ( CURRENT_OBJECT_INFO-EXT_SUB_WRITE = OSCON_TRUE ).

          call method EXT_HANDLER_WRITE_ACCESS.

        endif. "( Persistency Manager )

*       * 5. call Undo Manager: UM_HANDLER_WRITE_ACCESS
        if ( CURRENT_OBJECT_INFO-UM_SUB_WRITE = OSCON_TRUE ).

          call method UM_HANDLER_WRITE_ACCESS.

        endif. "( Persistency Manager )

*       * 6. update subscriptions
        call method SM_UPDATE_CURRENT_SUBSCRIPTION.

*       * 7. save CURRENT
        modify OBJECT_INFO from CURRENT_OBJECT_INFO
               index CURRENT_OBJECT_INDEX.
        call method SAVE_SPECIAL_OBJECT_INFO.

      cleanup.
        call method OS_INTERNAL_UNDO.
        clear: CURRENT_OBJECT_INFO,
               CURRENT_OBJECT_IREF,
               CURRENT_OBJECT_INDEX.
    endtry.

*   * 8. clear CURRENT
    clear: CURRENT_OBJECT_INFO,
           CURRENT_OBJECT_IREF,
           CURRENT_OBJECT_INDEX.

*   * Clean-up internal Undo
    delete INTERNAL_TRANSACTION_STACK
           index INTERNAL_CURRENT_TRANSACTION.
    add -1 to INTERNAL_CURRENT_TRANSACTION.
    if ( INTERNAL_TRANSACTION_STACK is initial ).
      clear INTERNAL_UNDO_INFO.
      INTERNAL_NEXT_UNDO_INFO = 1.
    endif. "( INTERNAL_TRANSACTION_STACK is initial? )

  endif. "( entry found? )

endmethod. "HANDLER_WRITE_ACCESS


method IF_OS_CA_INSTANCE~GET_CHANGED.
     " returning result type OSTYP_REF_TAB
************************************************************************
* Purpose        : Get list of all objects in status "changed"
*
* Version        : 2.0
*
* Precondition   : --
*
* Postcondition  : RESULT is a list of all object in the desired state
*
* OO Exceptions  : --
*
* Implementation :
*
************************************************************************
* Changelog:
* - 2000-03-08   : (BGR) Initial Version
************************************************************************

  data: TEMP_OBJECT_REF type ref to object.

  field-symbols <FS_OBJECT_INFO> type TYP_OBJECT_INFO.

  loop at OBJECT_INFO assigning <FS_OBJECT_INFO>
       where PM_STATUS = OSCON_OSTATUS_CHANGED.

    TEMP_OBJECT_REF = <FS_OBJECT_INFO>-OBJECT_IREF.
    append TEMP_OBJECT_REF to RESULT.

  endloop. "at OBJECT_INFO

endmethod. "IF_OS_CA_INSTANCE~GET_CHANGED


method IF_OS_CA_INSTANCE~GET_CREATED.
     " returning result type OSTYP_REF_TAB
************************************************************************
* Purpose        : Get list of all objects in status "new"
*
* Version        : 2.0
*
* Precondition   : --
*
* Postcondition  : RESULT is a list of all object in the desired state
*
* OO Exceptions  : --
*
* Implementation :
*
************************************************************************
* Changelog:
* - 2000-03-08   : (BGR) Initial Version
************************************************************************

  data: TEMP_OBJECT_REF type ref to object.

  field-symbols <FS_OBJECT_INFO> type TYP_OBJECT_INFO.

  loop at OBJECT_INFO assigning <FS_OBJECT_INFO>
       where PM_STATUS = OSCON_OSTATUS_NEW.

    TEMP_OBJECT_REF = <FS_OBJECT_INFO>-OBJECT_IREF.
    append TEMP_OBJECT_REF to RESULT.

  endloop. "at OBJECT_INFO

endmethod. "IF_OS_CA_INSTANCE~GET_CREATED


method IF_OS_CA_INSTANCE~GET_DELETED.
     " returning result type OSTYP_REF_TAB
************************************************************************
* Purpose        : Get list of all objects in status "deleted"
*
* Version        : 2.0
*
* Precondition   : --
*
* Postcondition  : RESULT is a list of all object in the desired state
*
* OO Exceptions  : --
*
* Implementation :
*
************************************************************************
* Changelog:
* - 2000-03-08   : (BGR) Initial Version
************************************************************************

  data: TEMP_OBJECT_REF type ref to object.

  field-symbols <FS_OBJECT_INFO> type TYP_OBJECT_INFO.

  loop at OBJECT_INFO assigning <FS_OBJECT_INFO>
       where PM_STATUS = OSCON_OSTATUS_DELETED.

    if ( <FS_OBJECT_INFO>-OBJECT_IREF is initial ).
      TEMP_OBJECT_REF = OS_GET_REF_BY_INTERNAL_OID(
          I_INTERNAL_OID = <FS_OBJECT_INFO>-OBJECT_ID ).
    else. "( strong ref exists )
      TEMP_OBJECT_REF = <FS_OBJECT_INFO>-OBJECT_IREF.
    endif. "( strong ref? )

    if ( not TEMP_OBJECT_REF is initial ).
      append TEMP_OBJECT_REF to RESULT.
    endif.

  endloop. "at OBJECT_INFO

endmethod. "IF_OS_CA_INSTANCE~GET_DELETED


method IF_OS_CA_INSTANCE~GET_LOADED.
     " returning result type OSTYP_REF_TAB
************************************************************************
* Purpose        : Get list of all objects in status "loaded"
*
* Version        : 2.0
*
* Precondition   : --
*
* Postcondition  : RESULT is a list of all object in the desired state
*
* OO Exceptions  : --
*
* Implementation :
*
************************************************************************
* Changelog:
* - 2000-03-08   : (BGR) Initial Version
************************************************************************

  data: TEMP_OBJECT_REF type ref to object.

  field-symbols <FS_OBJECT_INFO> type TYP_OBJECT_INFO.

  loop at OBJECT_INFO assigning <FS_OBJECT_INFO>
       where PM_STATUS = OSCON_OSTATUS_LOADED.

    TEMP_OBJECT_REF = <FS_OBJECT_INFO>-OBJECT_IREF.
    append TEMP_OBJECT_REF to RESULT.

  endloop. "at OBJECT_INFO

endmethod. "IF_OS_CA_INSTANCE~GET_LOADED


method IF_OS_CA_INSTANCE~GET_NOT_LOADED.
     " returning result type OSTYP_REF_TAB
************************************************************************
* Purpose        : Get list of all objects in status "not loaded"
*
* Version        : 2.0
*
* Precondition   : --
*
* Postcondition  : RESULT is a list of all object in the desired state
*                  All entries of objects purged by garbage collection
*                  are deleted
*
* OO Exceptions  : --
*
* Implementation :
*
************************************************************************
* Changelog:
* - 2000-03-08   : (BGR) Initial Version
************************************************************************

  data: TEMP_OBJECT_REF type ref to object.
  field-symbols <FS_OBJECT_INFO> type TYP_OBJECT_INFO.

  loop at OBJECT_INFO assigning <FS_OBJECT_INFO>
       where PM_STATUS = OSCON_OSTATUS_NOT_LOADED.

    TEMP_OBJECT_REF = OS_GET_REF_BY_INTERNAL_OID(
          I_INTERNAL_OID = <FS_OBJECT_INFO>-OBJECT_ID ).

    if ( not TEMP_OBJECT_REF is initial ).

      append TEMP_OBJECT_REF to RESULT.

    else. "( TEMP_OBJECT_REF initial )

      CURRENT_OBJECT_INDEX = sy-tabix.
      call method DELETE_SPECIAL_OBJECT_INFO.
      delete OBJECT_INFO.

    endif. "( TEMP_OBJECT_REF initial? )

  endloop. "at OBJECT_INFO

  clear CURRENT_OBJECT_INDEX.

endmethod. "IF_OS_CA_INSTANCE~GET_NOT_LOADED


method IF_OS_CA_INSTANCE~GET_STATUS.
     " importing I_OBJECT type ref to object
     " returning result type OS_OSTATUS
************************************************************************
* Purpose        : Get status of object I_OBJECT
*
* Version        : 2.0
*
* Precondition   : An entry for I_OBJECT exists
*
* Postcondition  : RESULT is the status of the object.
*
* OO Exceptions  : CX_OS_OBJECT_STATE(UNMANAGED)
*
* Implementation :
*
************************************************************************
* Changelog:
* - 2000-03-08   : (BGR) Initial Version
* - 2000-08-29   : (SB)  OO Exceptions
************************************************************************

  data: INTERNAL_OID  type TYP_INTERNAL_OID,
        TEMP_OBJECT   type TYP_OBJECT_IREF.

  clear: CURRENT_OBJECT_IREF,
         CURRENT_OBJECT_INFO.

* * 1. Look for entry in OBJECT_INFO
  TEMP_OBJECT ?= I_OBJECT.
  INTERNAL_OID = OS_GET_INTERNAL_OID_BY_REF( I_OBJECT = TEMP_OBJECT ).

  read table OBJECT_INFO transporting no fields
       with table key OBJECT_ID = INTERNAL_OID.

  if ( sy-subrc = 0 ).
    call method OS_LOAD_AND_VALIDATE_CURRENT
         exporting I_INDEX = sy-tabix.
  endif.

  if ( CURRENT_OBJECT_IREF is initial ).

*   * 2. No entry found: Error: not in adm. data

*!!!! error: No entry in administrative data
    clear CURRENT_OBJECT_INFO.
    class CX_OS_OBJECT_STATE definition load.
    raise exception type CX_OS_OBJECT_STATE
         exporting OBJECT = I_OBJECT
                   TEXTID = CX_OS_OBJECT_STATE=>UNMANAGED.

  else." ( valid entry found )

    RESULT = CURRENT_OBJECT_INFO-PM_STATUS.
    clear: CURRENT_OBJECT_IREF,
           CURRENT_OBJECT_INFO,
           CURRENT_OBJECT_INDEX.
  endif. "( valid entry found? )

endmethod. "IF_OS_CA_INSTANCE~GET_STATUS


method IF_OS_CA_INSTANCE~GET_TRANSIENT.
     " returning result type OSTYP_REF_TAB
************************************************************************
* Purpose        : Get list of all transient objects
*
* Version        : 2.0
*
* Precondition   : --
*
* Postcondition  : RESULT is a list of all transient objects of this
*                  class
*
* OO Exceptions  : --
*
* Implementation :
*
************************************************************************
* Changelog:
* - 2000-03-08   : (BGR) Initial Version
************************************************************************

  data: TEMP_OBJECT_REF type ref to object.

  field-symbols <FS_OBJECT_INFO> type TYP_OBJECT_INFO.

  loop at OBJECT_INFO assigning <FS_OBJECT_INFO>
       where PM_STATUS = OSCON_OSTATUS_TRANSIENT.

    TEMP_OBJECT_REF = <FS_OBJECT_INFO>-OBJECT_IREF.
    append TEMP_OBJECT_REF to RESULT.

  endloop. "at OBJECT_INFO

endmethod. "IF_OS_CA_INSTANCE~GET_TRANSIENT


method IF_OS_CA_INSTANCE~SET_STATUS.
" obsolete
     " importing I_OBJECT_STATUS_LIST type OSTYP_REFSTATUS_TAB
************************************************************************
* Purpose        : Undo: set state of a list of objects.
*                  Obsolete because undo is handled by class agent
*
* Version        : 2.0
*
* Precondition   : --
*
* Postcondition  : --
*
* OO Exceptions  : CX_NO_IMPLEMENTATION
*
* Implementation :-
*
************************************************************************
* Changelog:
* - 2000-03-08   : (BGR) Initial Version
************************************************************************

*!error: No implementation available
  class CX_OS_NO_IMPLEMENTATION definition load.
  raise exception type CX_OS_NO_IMPLEMENTATION
       exporting TEXTID = CX_OS_NO_IMPLEMENTATION=>SUBCLASS.

endmethod. "IF_OS_CA_INSTANCE~SET_STATUS.


method IF_OS_CA_PERSISTENCY~GET_PERSISTENT_BY_KEY.
     " importing I_KEY type any
     " returning result type ref to object
     " raising   CX_OS_OBJECT_NOT_FOUND
     " raising   CX_OS_CLASS_NOT_FOUND
* to be implemented in subclass!!!
************************************************************************
* Purpose        : Get persistent object by Business Key
*
* Version        : 2.0
*
* Precondition   : There are persistent objects that can be identified
*                  by Business Key.
*
* Postcondition  :
*
* OO Exceptions  : CX_OS_NO_IMPLEMENTATION
*
* Implementation : must be implemented in subclass
*
************************************************************************
* Changelog:
* - 2000-03-08   : (BGR) Initial Version
* - 2000-08-29   : (SB)  OO Exceptions
************************************************************************

*!error: No implementation available
  class CX_OS_NO_IMPLEMENTATION definition load.
  raise exception type CX_OS_NO_IMPLEMENTATION
       exporting TEXTID = CX_OS_NO_IMPLEMENTATION=>SUBCLASS.

endmethod. "IF_OS_CA_PERSISTENCY~GET_PERSISTENT_BY_KEY


method IF_OS_CA_PERSISTENCY~GET_PERSISTENT_BY_KEY_TAB.
     " importing I_KEY_TAB type INDEX TABLE
     " returning result type OSTYP_TABLE_REF
* to be implemented in subclass!!!
************************************************************************
* Purpose        : Get persistent objects by Business Key table
*
* Version        : 2.0
*
* Precondition   : -
*
* Postcondition  : For each entry in the KEY table, there is a corres-
*                  ponding entry in the RESULT table. If the object was
*                  found in the cache or the database, then a reference
*                  to this object can be found in the RESULT table,
*                  if not, the reference is initial.
*
* OO Exceptions  : CX_OS_NO_IMPLEMENTATION
*
* Implementation : must be implemented in subclass
*
************************************************************************
* Changelog:
* - 2004-01-07   : (SB)  Multi Access
************************************************************************

*!error: No implementation available
  class CX_OS_NO_IMPLEMENTATION definition load.
  raise exception type CX_OS_NO_IMPLEMENTATION
       exporting TEXTID = CX_OS_NO_IMPLEMENTATION=>SUBCLASS.

endmethod. "IF_OS_CA_PERSISTENCY~GET_PERSISTENT_BY_KEY_TAB


method IF_OS_CA_PERSISTENCY~GET_PERSISTENT_BY_OID.
     " importing I_OID type OS_GUID
     " returning result type ref to object
     " raising   CX_OS_OBJECT_NOT_FOUND
     " raising   CX_OS_CLASS_NOT_FOUND
* to be implemented in subclass!!!
************************************************************************
* Purpose        : Get persistent object by OID
*
* Version        : 2.0
*
* Precondition   : There are persistent objects that can be identified
*                  by OID.
*
* Postcondition  :
*
* OO Exceptions  : CX_OS_NO_IMPLEMENTATION
*
* Implementation : must be implemented in subclass
*
************************************************************************
* Changelog:
* - 2000-03-08   : (BGR) Initial Version
* - 2000-08-29   : (SB)  OO Exceptions
************************************************************************

*!error: No implementation available
  class CX_OS_NO_IMPLEMENTATION definition load.
  raise exception type CX_OS_NO_IMPLEMENTATION
       exporting TEXTID = CX_OS_NO_IMPLEMENTATION=>SUBCLASS.

endmethod. "IF_OS_CA_PERSISTENCY~GET_PERSISTENT_BY_OID


method IF_OS_CA_PERSISTENCY~GET_PERSISTENT_BY_OID_TAB.
     " importing I_OID_TAB type INDEX TABLE
     " returning result type OSTYP_TABLE_REF
* to be implemented in subclass!!!
************************************************************************
* Purpose        : Get persistent objects by OID table
*
* Version        : 2.0
*
* Precondition   : -
*
* Postcondition  : For each entry in the OID table, there is a corres-
*                  ponding entry in the RESULT table. If the object was
*                  found in the cache or the database, then a reference
*                  to this object can be found in the RESULT table,
*                  if not, the reference is initial.
*
* OO Exceptions  : CX_OS_NO_IMPLEMENTATION
*
* Implementation : must be implemented in subclass
*
************************************************************************
* Changelog:
* - 2004-01-07   : (SB)  Multi Access
************************************************************************

*!error: No implementation available
  class CX_OS_NO_IMPLEMENTATION definition load.
  raise exception type CX_OS_NO_IMPLEMENTATION
       exporting TEXTID = CX_OS_NO_IMPLEMENTATION=>SUBCLASS.

endmethod. "IF_OS_CA_PERSISTENCY~GET_PERSISTENT_BY_OID_TAB


method IF_OS_CA_PERSISTENCY~GET_PERSISTENT_BY_QUERY.
     " importing I_QUERY type ref to IF_OS_QUERY
     "           I_PARAMETER_TAB type standard table optional
     "           I_PAR1 type ANY optional
     "           I_PAR2 type ANY optional
     "           I_PAR3 type ANY optional
     " returning result type OSTYP_REF_TAB
     " raising   CX_OS_OBJECT_NOT_FOUND
     " raising   CX_OS_QUERY_ERROR
* to be implemented in subclass!!!
************************************************************************
* Purpose        : Get persistent objects by Query
*
* Version        : 2.0
*
* Precondition   : -
*
* Postcondition  : -
*
* OO Exceptions  : CX_OS_NO_IMPLEMENTATION
*
* Implementation : must be implemented in subclass
*
************************************************************************
* Changelog:
* - 2004-03-25   : (SB)  Initial Version
************************************************************************

*!error: No implementation available
  class CX_OS_NO_IMPLEMENTATION definition load.
  raise exception type CX_OS_NO_IMPLEMENTATION
       exporting TEXTID = CX_OS_NO_IMPLEMENTATION=>SUBCLASS.

endmethod. "IF_OS_CA_PERSISTENCY~GET_PERSISTENT_BY_QUERY


method IF_OS_CA_SERVICE~GET_OID_BY_REF.
     " importing I_OBJECT type ref to object
     " returning result type OS_GUID
     " raising   CX_OS_OBJECT_NOT_FOUND
* Must be implemented in subclass!
************************************************************************
* Purpose        : Get the OID for a given object reference. If the
*                  OID is not known (only the Business Key), load it
*                  from DB.
*
* Version        : 2.0
*
* Precondition   : A persistent object of this class is identified by
*                  an OID
*                  The object I_OBJECT has an entry in OBJECT_INFO and
*                  is not transient
*
* Postcondition  : The OID of the object is known
*
* OO Exceptions  : CX_OS_NO_IMPLEMENTATION
*
* Implementation : Must be implemented in Subclass
*
************************************************************************
* Changelog:
* - 2000-03-07   : (BGR) Initial Version 2.0
* - 2000-08-29   : (SB)  OO Exceptions
************************************************************************

*!error: No implementation available
  class CX_OS_NO_IMPLEMENTATION definition load.
  raise exception type CX_OS_NO_IMPLEMENTATION
       exporting TEXTID = CX_OS_NO_IMPLEMENTATION=>SUBCLASS.

endmethod. "IF_OS_CA_SERVICE~GET_OID_BY_REF


method IF_OS_CA_SERVICE~GET_REF_BY_OID.
     " importing I_OID        type OS_GUID
     " returning result       type ref to object
* Must be implemented in subclass!
************************************************************************
* Purpose        : Get the object reference for a given OID. If no
*                  object exists, create a new representative object
*                  identified by the given OID. If it is loaded from
*                  DB, the missing Business key is added to the entry.
*
* Version        : 2.0
*
* Precondition   : A persistent object of this class is identified by
*                  an OID
*
* Postcondition  : An object identified by I_OID exists.
*
* OO Exceptions  : CX_OS_NO_IMPLEMENTATION
*
* Implementation : Must be implemented in Subclass
*
************************************************************************
* Changelog:
* - 2000-03-07   : (BGR) Initial Version 2.0
* - 2000-08-29   : (SB)  OO Exceptions
************************************************************************

*!error: No implementation available
  class CX_OS_NO_IMPLEMENTATION definition load.
  raise exception type CX_OS_NO_IMPLEMENTATION
       exporting TEXTID = CX_OS_NO_IMPLEMENTATION=>SUBCLASS.

endmethod. "IF_OS_CA_SERVICE~GET_REF_BY_OID


method if_os_ca_service~om_prepare_for_top_transaction .
************************************************************************
* Purpose        : Prepares administrative data and persistent objects
*                  for the beginning of a new transaction.
*                  Only for objects in I_OBJECT.
*
* Version        : 2.0
*
* Precondition   : --
*
* Postcondition  : All persistent objects are reset to a state that is
*                  not relevant for DB operations.
*                  If I_INVALIDATE is true: All persistent objects have
*                    STATUS NOT_LOADED.
*                  If I_INVALIDATE is false: All persistent objects
*                    with STATUS CHANGED or NEW are now LOADED,
*                    DELETED are now NOT_LOADED.
*
* OO Exceptions  : propagates PREPARE_TOP_TRANSACTION
*
* Implementation : set objects, call PREPARE_FOR_TOP_TRANSACTION, reset
*                  objects
*
************************************************************************
* Changelog:
* - 2001-03-07   : (SB)  Initial Version
************************************************************************

  om_set_objects( i_objects = i_objects ).

  if_os_ca_service~prepare_for_top_transaction(
    i_invalidate = i_invalidate ).

  om_restore_objects( ).

endmethod.


method if_os_ca_service~om_save .
************************************************************************
* Purpose        : Prepare data for database (buffer) transfer.
*                  Only for objects in I_OBJECT.
*
* Version        : 2.0
*
* Precondition   : --
*
* Postcondition  : Data is prepared for saving.
*                  If UPDATE_MODE is direct, it is saved to DB.
*                  If UPDATE_MODE is LOCAL or UPDATE_TASK,
*                    the corresponding function call is registered.
*
* OO Exceptions  : propagates SAVE
*
* Implementation : set objets, call SAVE method, reset objects
*
************************************************************************
* Changelog:
* - 2001-03-07   : (SB)  Initial Version
************************************************************************

  om_set_objects( i_objects = i_objects ).

  if_os_ca_service~save( ).

  om_restore_objects( ).

endmethod.


method if_os_ca_service~prepare_for_top_transaction .
  " importing I_INVALIDATE type OS_BOOLEAN
************************************************************************
* Purpose        : Prepares administrative data and persistent objects
*                  for the beginning of a new transaction.
*
* Version        : 2.0
*
* Precondition   : --
*
* Postcondition  : All persistent objects are reset to a state that is
*                  not relevant for DB operations.
*                  If I_INVALIDATE is true: All persistent objects have
*                    STATUS NOT_LOADED
*                  If I_INVALIDATE is false: All persistent objects
*                    with STATUS CHANGED or NEW are now LOADED,
*                    DELETED are now NOT_LOADED.
*
* OO Exceptions  : propagates EXT_PREPARE_TOP_TRANSACTION
*                  propagates MAP_INVALIDATE
*
* Implementation : 1. Check for each instance if the instance is
*                     removed by garbage collection.
*                  2. Set STATUS for each instance according to the
*                     invalidate argument
*                  3. Invalidate the persistent instances with state
*                     set to NOT_LOADED
*                  4. Update subscriptions for all instances
*                  5. Call subclass extension
*                     EXT_PREPARE_TOP_TRANSACTION
*
************************************************************************
* Changelog:
* - 2000-03-03   : (BGR) Initial Version
* - 2000-08-29   : (SB)  OO Exceptions
* - 2002-01-08   : (CS)  Check for Garbage Collector Activity
************************************************************************

  data: index_list       type typ_index_tab,
        invalidate_tab   type typ_object_tab,
        object_iref      type typ_object_iref.

  field-symbols: <fs_object_info_item> type typ_object_info.

* * 1. Check for each instance if the instance is removed

* * Only if the Garbage Collector has been active since last call
* * to this method. If the Garbage Collector has not been active,
* * then no instances could have been removed, i.e. the check will
* * always return a strong reference to the instance, so no entry
* * will be removed.

  if ( os_garbage_collector_last_run->gc_run( ) = 'X' ).

    loop at object_info assigning <fs_object_info_item>
         where object_iref is initial.

*     * Check if the instance still exists
      object_iref =
        os_get_ref_by_internal_oid( <fs_object_info_item>-object_id ).

*     * No strong reference, remove entry
      if ( object_iref is initial ).

        current_object_index = sy-tabix.
        delete_special_object_info( ).
        delete object_info.
        continue.

      endif.

    endloop. "at object_info

  endif.

* * 2. Set STATUS for each instance
  if ( i_invalidate = oscon_true ).

*   * All persistent instances must be set to STATUS NOT_LOADED
*   * Strong references must be removed and INVALIDATE be called

    loop at object_info assigning <fs_object_info_item>
         where tm_used = oscon_true and om_ignore = oscon_false.

      <fs_object_info_item>-tm_used = oscon_false.
      current_object_index = sy-tabix.

      case <fs_object_info_item>-pm_status.

        when oscon_ostatus_loaded  or
             oscon_ostatus_changed or
             oscon_ostatus_new.

          append <fs_object_info_item>-object_iref to invalidate_tab.

          clear <fs_object_info_item>-object_iref.
          <fs_object_info_item>-pm_status    = oscon_ostatus_not_loaded.
          <fs_object_info_item>-pm_dbstatus  = oscon_dbstatus_unknown.
          <fs_object_info_item>-pm_sub_rw    = oscon_true.
          <fs_object_info_item>-pm_sub_chg   = oscon_false.
          <fs_object_info_item>-um_sub_write = oscon_false.

        when oscon_ostatus_deleted.

          clear <fs_object_info_item>-object_iref.
          <fs_object_info_item>-pm_status    = oscon_ostatus_not_loaded.
          <fs_object_info_item>-pm_dbstatus  = oscon_dbstatus_unknown.
          <fs_object_info_item>-pm_sub_rw    = oscon_true.
          <fs_object_info_item>-pm_sub_chg   = oscon_false.
          <fs_object_info_item>-um_sub_write = oscon_false.

        when oscon_ostatus_not_loaded.

          clear <fs_object_info_item>-object_iref.
          <fs_object_info_item>-pm_dbstatus  = oscon_dbstatus_unknown.
          <fs_object_info_item>-pm_sub_rw    = oscon_true.
          <fs_object_info_item>-pm_sub_chg   = oscon_false.
          <fs_object_info_item>-um_sub_write = oscon_false.

        when oscon_ostatus_transient.

*         * Nothing to prepare

      endcase. "( PM_STATUS )

      append current_object_index to index_list.

    endloop. "at object_info

  else." ( Don't invalidate )

*   * All persistent instances with STATUS CHANGED or NEW are
*   * set to LOADED, instances with STATUS DELETED are set
*   * to NOT_LOADED.

    loop at object_info assigning <fs_object_info_item>
         where tm_used = oscon_true and om_ignore = oscon_false.

      current_object_index = sy-tabix.

      case <fs_object_info_item>-pm_status.

        when oscon_ostatus_not_loaded or
             oscon_ostatus_deleted.

          clear <fs_object_info_item>-object_iref.
          <fs_object_info_item>-pm_status    = oscon_ostatus_not_loaded.
          <fs_object_info_item>-pm_dbstatus  = oscon_dbstatus_unknown.
          <fs_object_info_item>-pm_sub_rw    = oscon_true.
          <fs_object_info_item>-pm_sub_chg   = oscon_false.
          <fs_object_info_item>-um_sub_write = oscon_false.

        when oscon_ostatus_loaded or
             oscon_ostatus_new or
             oscon_ostatus_changed.

          <fs_object_info_item>-pm_status    = oscon_ostatus_loaded.
          <fs_object_info_item>-pm_dbstatus  = oscon_dbstatus_existing.
          <fs_object_info_item>-pm_sub_rw    = oscon_false.
          <fs_object_info_item>-pm_sub_chg   = oscon_true.
          <fs_object_info_item>-um_sub_write = oscon_false.

      endcase." <FS_OBJECT_INFO_ITEM>-PM_STATUS.

      append current_object_index to index_list.

    endloop." at OBJECT_INFO

  endif."( Invalidate? )

* * 3. invalidate persistent instances
  if ( not invalidate_tab is initial ).

    map_invalidate( invalidate_tab ).

  endif." ( Something to invalidate? )

* * 4. update subscriptions
  sm_update_subscriptions( index_list ).

* * 5. call subclass extension
  ext_prepare_top_transaction( i_invalidate ).

endmethod."IF_OS_CA_SERVICE~PREPARE_FOR_TOP_TRANSACTION


method IF_OS_CA_SERVICE~SAVE .
* to be implemented in subclass!!!
************************************************************************
* Purpose        : Prepare data for database (buffer) transfer
*
* Version        : 2.0
*
* Precondition   : --
*
* Postcondition  : data is prepared for saving
*                  if UPDATE_MODE is direct, it is saved to DB
*                  if UPDATE_MODE is LOCAL or UPDATE_TASK,
*                    the corresponding function call is registered
*
* OO Exceptions  : CX_OS_NO_IMPLEMENTATION
*
* Implementation : must be implemented in subclass
*
************************************************************************
* Changelog:
* - 2000-03-02   : (BGR) Initial Version
* - 2000-08-29   : (SB)  OO Exceptions
************************************************************************

*!error: No implementation available
  class CX_OS_NO_IMPLEMENTATION definition load.
  raise exception type CX_OS_NO_IMPLEMENTATION
       exporting TEXTID = CX_OS_NO_IMPLEMENTATION=>SUBCLASS.

endmethod." IF_OS_CA_SERVICE~SAVE


method IF_OS_CA_SERVICE~SAVE_IN_UPDATE_TASK .
* to be implemented in subclass!!!
************************************************************************
* Purpose        : save object data to DB when running in update task
*                  mode.
*
* Version        : 2.0
*
* Precondition   : no object service environment is set, no objects
*                  exist in update task
*
* Postcondition  : data has been saved to DB
*
* OO Exceptions  : CX_OS_NO_IMPLEMENTATION
*
* Implementation : must be implemented in subclass
*
************************************************************************
* Changelog:
* - 2000-03-02   : (BGR) Initial Version
* - 2000-08-29   : (SB)  OO Exceptions
************************************************************************

*!error: No implementation available
  class CX_OS_NO_IMPLEMENTATION definition load.
  raise exception type CX_OS_NO_IMPLEMENTATION
       exporting TEXTID = CX_OS_NO_IMPLEMENTATION=>SUBCLASS.

endmethod." IF_OS_CA_SERVICE~SAVE_IN_UPDATE_TASK


method IF_OS_FACTORY~CREATE_PERSISTENT .
     " returning result type ref to object
* to be implemented in subclass!!!
************************************************************************
* Purpose        : Create persistent object
*
* Version        : 2.0
*
* Precondition   : No business key is needed in this class.
*
* Postcondition  : New persistent object has been created
*
* OO Exceptions  : CX_OS_NO_IMPLEMENTATION
*
* Implementation : must be implemented in subclass
*
************************************************************************
* Changelog:
* - 2000-03-08   : (BGR) Initial Version
* - 2000-08-29   : (SB)  OO Exceptions
************************************************************************

*!error: No implementation available
  class CX_OS_NO_IMPLEMENTATION definition load.
  raise exception type CX_OS_NO_IMPLEMENTATION
       exporting TEXTID = CX_OS_NO_IMPLEMENTATION=>SUBCLASS.

endmethod. "IF_OS_FACTORY~CREATE_PERSISTENT


method IF_OS_FACTORY~CREATE_PERSISTENT_BY_KEY .
" public
     " importing I_KEY type any
     " returning result type ref to object
     " raising   CX_OS_OBJECT_EXISTING
* to be implemented in subclass!!!
************************************************************************
* Purpose        : Create persistent object
*
* Version        : 2.0
*
* Precondition   : A business key is needed in this class.
*
* Postcondition  : New persistent object has been created
*
* OO Exceptions  : CX_OS_NO_IMPLEMENTATION
*
* Implementation : must be implemented in subclass
*
************************************************************************
* Changelog:
* - 2000-03-08   : (BGR) Initial Version
* - 2000-08-29   : (SB)  OO Exceptions
************************************************************************

*!error: No implementation available
  class CX_OS_NO_IMPLEMENTATION definition load.
  raise exception type CX_OS_NO_IMPLEMENTATION
       exporting TEXTID = CX_OS_NO_IMPLEMENTATION=>SUBCLASS.

endmethod. "IF_OS_FACTORY~CREATE_PERSISTENT_BY_KEY


method IF_OS_FACTORY~CREATE_TRANSIENT .
" public
     " returning result type ref to object
* to be implemented in subclass!!!
************************************************************************
* Purpose        : Create transient object
*
* Version        : 2.0
*
* Precondition   : No business key is needed in this class.
*
* Postcondition  : New transient object has been created
*
* OO Exceptions  : CX_OS_NO_IMPLEMENTATION
*
* Implementation : must be implemented in subclass
*
************************************************************************
* Changelog:
* - 2000-03-08   : (BGR) Initial Version
* - 2000-08-29   : (SB)  OO Exceptions
************************************************************************

*!error: No implementation available
  class CX_OS_NO_IMPLEMENTATION definition load.
  raise exception type CX_OS_NO_IMPLEMENTATION
       exporting TEXTID = CX_OS_NO_IMPLEMENTATION=>SUBCLASS.

endmethod. "IF_OS_FACTORY~CREATE_TRANSIENT


method IF_OS_FACTORY~CREATE_TRANSIENT_BY_KEY .
" public
     " importing I_KEY type any
     " returning result type ref to object
     " raising   CX_OS_OBJECT_EXISTING
* to be implemented in subclass!!!
************************************************************************
* Purpose        : Create transient object
*
* Version        : 2.0
*
* Precondition   : A business key is needed in this class.
*
* Postcondition  : New transient object has been created
*
* OO Exceptions  : CX_OS_NO_IMPLEMENTATION
*
* Implementation : must be implemented in subclass
*
************************************************************************
* Changelog:
* - 2000-03-08   : (BGR) Initial Version
* - 2000-08-29   : (SB)  OO Exceptions
************************************************************************

*!error: No implementation available
  class CX_OS_NO_IMPLEMENTATION definition load.
  raise exception type CX_OS_NO_IMPLEMENTATION
       exporting TEXTID = CX_OS_NO_IMPLEMENTATION=>SUBCLASS.

endmethod. "IF_OS_FACTORY~CREATE_PERSISTENT_BY_KEY


method IF_OS_FACTORY~DELETE_PERSISTENT .
     " importing I_OBJECT type ref to IF_OS_STATE
     " raising CX_OS_OBJECT_NOT_EXISTING
************************************************************************
* Purpose        : Delete persistent object. It is marked DELETED in
*                  memory and removed from DB when the top transaction
*                  is closed.
*
* Version        : 2.0
*
* Precondition   : The object is persistent (not transient)
*
* Postcondition  : Instance is marked for deletion.
*
* OO Exceptions  : CX_OS_OBJECT_NOT_EXISTING(UNMANAGED,TRANSIENT,
*                  CREATED_AND_DELETED)
*                  propagates PM_DELETE_PERSISTENT
*
* Implementation : 1. Check if this object is known in this class agent
*                    1a. Check Polymorphism
*                      1a1. Polymorphism: Call sub class agent
*                      1a2. No Polymorphism: Error!
*                  2. If it already exists: call PM_DELETE_PERSISTENT
*                  3. Clean up
*
************************************************************************
* Changelog:
* - 1999-09-21 : (OS)  Initial Version
* - 2000-03-06 : (BGR) Version 2.0
* - 2000-08-02 : (SB)  OO Exceptions
* - 2001-01-29 : (SB)  Polymorphism
* - 2001-11-27 : (SB)  Bugfix for null references
* - 2001-12-13 : (SB)  Move method to CL_OS_CA_COMMON
* - 2001-12-13 : (SB)  Clean up added
************************************************************************

  data: INTERNAL_OID type TYP_INTERNAL_OID.
  data: EX_OS_OBJECT_STATE type ref to CX_OS_OBJECT_STATE.

  data: ANOTHER_CLASS_AGENT type ref to OBJECT.
  data: IS_VALID_INSTANCE           type OS_BOOLEAN.
  data: ANOTHER_CLASS_AGENT_FACTORY type ref to IF_OS_FACTORY.

  clear CURRENT_OBJECT_IREF.

* * 1. Look for entry in SPECIAL_OBJECT_INFO
  INTERNAL_OID = OS_GET_INTERNAL_OID_BY_REF( I_OBJECT = I_OBJECT ).

  read table OBJECT_INFO transporting no fields
       with table key OBJECT_ID = INTERNAL_OID.

  if ( sy-subrc = 0 ).

    OS_LOAD_AND_VALIDATE_CURRENT( sy-tabix ).

  else.

    if ( I_OBJECT is initial ).

*!!!! error: No entry in administrative data
      clear CURRENT_OBJECT_INFO.
      clear CURRENT_OBJECT_IREF.
      clear CURRENT_OBJECT_INDEX.

      class CX_OS_OBJECT_NOT_EXISTING definition load.
      raise exception type CX_OS_OBJECT_NOT_EXISTING
        exporting
          OBJECT = I_OBJECT
          TEXTID = CX_OS_OBJECT_NOT_EXISTING=>UNMANAGED.

    endif.

*   * 1a. Check Polymorphism
*   *     Try to find the responsible class agent
*   *     for this object. Check inheritance.
    try.

        call method CL_OS_SYSTEM=>OS_GET_CLASS_AGENT_BY_REF
          exporting I_OBJECT = I_OBJECT
          receiving RESULT   = ANOTHER_CLASS_AGENT.

      catch CX_OS_CLASS_NOT_FOUND.

*!!!!!! error: Unmanaged Object
        clear CURRENT_OBJECT_INFO.
        clear CURRENT_OBJECT_IREF.
        clear CURRENT_OBJECT_INDEX.

        class CX_OS_OBJECT_NOT_EXISTING definition load.
        raise exception type CX_OS_OBJECT_NOT_EXISTING
          exporting
            OBJECT = I_OBJECT
            TEXTID = CX_OS_OBJECT_NOT_EXISTING=>UNMANAGED.

    endtry.

*   * 1a1. Polymorphism
    if ( ANOTHER_CLASS_AGENT <> ME ).

      call method OS_VALID_INSTANCE
           exporting I_OBJECT       = I_OBJECT
           receiving RESULT         = IS_VALID_INSTANCE.

      if ( IS_VALID_INSTANCE eq OSCON_TRUE ).

        ANOTHER_CLASS_AGENT_FACTORY ?= ANOTHER_CLASS_AGENT.

        clear CURRENT_OBJECT_INFO.
        clear CURRENT_OBJECT_IREF.
        clear CURRENT_OBJECT_INDEX.

        call method ANOTHER_CLASS_AGENT_FACTORY->DELETE_PERSISTENT
             exporting I_OBJECT = I_OBJECT.

        return.

      else.

*!!!!!! error: class agent is responsible
        clear CURRENT_OBJECT_INFO.
        clear CURRENT_OBJECT_IREF.
        clear CURRENT_OBJECT_INDEX.

        raise exception type CX_OS_OBJECT_NOT_EXISTING
          exporting
            OBJECT = I_OBJECT
            TEXTID = CX_OS_OBJECT_NOT_EXISTING=>CLASS_AGENT_MISMATCH.

      endif.

*   * 1a2. No Polymorhism
    else.

*!!!! error: No entry in administrative data
      clear CURRENT_OBJECT_INFO.

      class CX_OS_OBJECT_NOT_EXISTING definition load.
      raise exception type CX_OS_OBJECT_NOT_EXISTING
        exporting
          OBJECT = I_OBJECT
          TEXTID = CX_OS_OBJECT_NOT_EXISTING=>UNMANAGED.

    endif.

  endif. "( entry found? )

  if ( CURRENT_OBJECT_IREF is initial ).

*!! error: No entry in administrative data
    clear CURRENT_OBJECT_INFO.
    clear CURRENT_OBJECT_IREF.
    clear CURRENT_OBJECT_INDEX.

    class CX_OS_OBJECT_NOT_EXISTING definition load.
    raise exception type CX_OS_OBJECT_NOT_EXISTING
      exporting
        OBJECT = I_OBJECT
        TEXTID = CX_OS_OBJECT_NOT_EXISTING=>UNMANAGED.

  else." ( valid entry found )

*   * 2. If it already exists: call PM_DELETE_PERSISTENT
    try.

        call method OS_PM_DELETE_PERSISTENT( ).

      catch CX_OS_OBJECT_STATE into EX_OS_OBJECT_STATE.

        if ( EX_OS_OBJECT_STATE->TEXTID =
             CX_OS_OBJECT_STATE=>TRANSIENT ).

*!!!!!!!! error: instance is transient
          clear CURRENT_OBJECT_INFO.
          clear CURRENT_OBJECT_IREF.
          clear CURRENT_OBJECT_INDEX.

          class CX_OS_OBJECT_NOT_EXISTING definition load.
          raise exception type CX_OS_OBJECT_NOT_EXISTING
            exporting
              OBJECT = I_OBJECT
              TEXTID = CX_OS_OBJECT_NOT_EXISTING=>TRANSIENT.

        endif.

        if ( EX_OS_OBJECT_STATE->TEXTID =
             CX_OS_OBJECT_STATE=>CREATED_AND_DELETED ).

*!!!!!!!! error: new instance already deleted
          clear CURRENT_OBJECT_INFO.
          clear CURRENT_OBJECT_IREF.
          clear CURRENT_OBJECT_INDEX.

          class CX_OS_OBJECT_NOT_EXISTING definition load.
          raise exception type CX_OS_OBJECT_NOT_EXISTING
            exporting
              OBJECT = I_OBJECT
              TEXTID = CX_OS_OBJECT_NOT_EXISTING=>CREATED_AND_DELETED.

        endif.

    endtry.

  endif. "( Valid entry found? )

* * 3. Clean up
  clear CURRENT_OBJECT_INFO.
  clear CURRENT_OBJECT_IREF.
  clear CURRENT_OBJECT_INDEX.

           "IF_OS_FACTORY~DELETE_PERSISTENT
endmethod.


method IF_OS_FACTORY~REFRESH_PERSISTENT.
     " importing I_OBJECT type ref to IF_OS_STATE
     " raising   CX_OS_OBJECT_NOT_REFRESHABLE
************************************************************************
* Purpose        : Set status of a persistent object to "not loaded"
*                  to force a reload from DB when the next access
*                  happens
*
* Version        : 2.0
*
* Precondition   : An entry for I_OBJECT exists and PM_STATUS is
*                  "loaded" or "not loaded"
*
* Postcondition  : The object state is "not loaded"
*
* OO Exceptions  : CX_OS_OBJECT_NOT_REFRESHABLE
*
* Implementation : 1. Get internal OID for I_OBJECT
*                  2. Search and set CURRENT
*                  3. Check PM_STATUS
*                    3a. NOT_LOADED: Nothing to do
*                    3b. LOADED:
*                       3b1. Set Status NOT_LOADED,
*                       3b2. Subscription PM_SUB_RW := True
*                       3b3. call subclass extension
*                              EXT_REFRESHED_PERSISTENT
*                       3b4. update Subscriptions
*                       3b5. Save CURRENT
*                       3b6. Invalidate Object
*                    3c. NEW/CHANGED/DELETED: Error!
*                    3d. TRANSIENT: Error!
*                    3e. No entry in administrative data found:
*                       3e1. Check Polymorhism
*                         3e1A. Polymorhism: Call subclass agent
*                         3e1A. No Polymorhism. Error!
*                  4. Clean up
*
************************************************************************
* Changelog:
* - 2000-03-10   : (BGR) Initial Version
* - 2000-08-29   : (SB)  OO Exceptions
* - 2001-01-12   : (SB)  order in case
* - 2001-01-12   : (SB)  OO Exceptions
* - 2001-06-19   : (SB)  Polymorphism
************************************************************************

  data: INTERNAL_OID   type        TYP_INTERNAL_OID,
        INVALIDATE_TAB type        TYP_OBJECT_TAB.

  data: ANOTHER_CLASS_AGENT         type ref to OBJECT.
  data: IS_VALID_INSTANCE           type OS_BOOLEAN.
  data: ANOTHER_CLASS_AGENT_FACTORY type ref to IF_OS_FACTORY.

* * 1. Get internal OID for I_OBJECT
  INTERNAL_OID = OS_GET_INTERNAL_OID_BY_REF( I_OBJECT ).

* * 2. Search and set CURRENT
  read table OBJECT_INFO into CURRENT_OBJECT_INFO
       with table key  OBJECT_ID = INTERNAL_OID.

  if ( sy-subrc = 0 ).

    CURRENT_OBJECT_INDEX = sy-tabix.
    CURRENT_OBJECT_IREF  = I_OBJECT.
    LOAD_SPECIAL_OBJECT_INFO( ).

*   * 3. Check PM_STATUS
    case CURRENT_OBJECT_INFO-PM_STATUS.

*   * 3a. NOT_LOADED: Nothing to do
    when OSCON_OSTATUS_NOT_LOADED.

*     * Nothing to do

*   * 3b. LOADED:
    when OSCON_OSTATUS_LOADED.

*     * 3b1. Set Status NOT_LOADED
      CURRENT_OBJECT_INFO-PM_STATUS    = OSCON_OSTATUS_NOT_LOADED.
      clear CURRENT_OBJECT_INFO-OBJECT_IREF.

*     * 3b2. Subscription PM_SUB_RW := True
      CURRENT_OBJECT_INFO-PM_SUB_RW    = OSCON_TRUE.
      CURRENT_OBJECT_INFO-PM_SUB_CHG   = OSCON_FALSE.
      CURRENT_OBJECT_INFO-UM_SUB_WRITE = OSCON_FALSE.

      try.
*         * 3b3. call subclass extension
          EXT_PM_REFRESHED_PERSISTENT( ).

*         * 3b4. update Subscriptions
          SM_UPDATE_CURRENT_SUBSCRIPTION( ).

*         * 3b5. Save CURRENT
          modify OBJECT_INFO from CURRENT_OBJECT_INFO
                 index CURRENT_OBJECT_INDEX.
          SAVE_SPECIAL_OBJECT_INFO( ).

*         * 3b6. Invalidate Object
          append CURRENT_OBJECT_IREF to INVALIDATE_TAB.
          MAP_INVALIDATE( INVALIDATE_TAB ).

        cleanup.
          clear CURRENT_OBJECT_INFO.
          clear CURRENT_OBJECT_IREF.
          clear CURRENT_OBJECT_INDEX.
      endtry.

*   * 3c. NEW/CHANGED/DELETED: Error!
    when OSCON_OSTATUS_NEW.

*!!!! Error! Object status is new
      clear CURRENT_OBJECT_INFO.
      clear CURRENT_OBJECT_IREF.
      clear CURRENT_OBJECT_INDEX.

      class CX_OS_OBJECT_NOT_REFRESHABLE definition load.
      raise exception type CX_OS_OBJECT_NOT_REFRESHABLE
           exporting OBJECT = I_OBJECT
                     TEXTID = CX_OS_OBJECT_NOT_REFRESHABLE=>NEW.

    when OSCON_OSTATUS_CHANGED.

*!!!! Error! Object status is changed
      clear CURRENT_OBJECT_INFO.
      clear CURRENT_OBJECT_IREF.
      clear CURRENT_OBJECT_INDEX.

      class CX_OS_OBJECT_NOT_REFRESHABLE definition load.
      raise exception type CX_OS_OBJECT_NOT_REFRESHABLE
           exporting OBJECT = I_OBJECT
                     TEXTID = CX_OS_OBJECT_NOT_REFRESHABLE=>CHANGED.

    when OSCON_OSTATUS_DELETED.

*!!!! Error! Object status is deleted
      clear CURRENT_OBJECT_INFO.
      clear CURRENT_OBJECT_IREF.
      clear CURRENT_OBJECT_INDEX.

      class CX_OS_OBJECT_NOT_REFRESHABLE definition load.
      raise exception type CX_OS_OBJECT_NOT_REFRESHABLE
           exporting OBJECT = I_OBJECT
                     TEXTID = CX_OS_OBJECT_NOT_REFRESHABLE=>DELETED.

*   * 3d. TRANSIENT: Error!
    when OSCON_OSTATUS_TRANSIENT.

*!!!! Error! Object is transient
      clear CURRENT_OBJECT_INFO.
      clear CURRENT_OBJECT_IREF.
      clear CURRENT_OBJECT_INDEX.

      class CX_OS_OBJECT_NOT_REFRESHABLE definition load.
      raise exception type CX_OS_OBJECT_NOT_REFRESHABLE
           exporting OBJECT = I_OBJECT
                     TEXTID = CX_OS_OBJECT_NOT_REFRESHABLE=>TRANSIENT.

    endcase. "PM_STATUS

* * 3e. No entry in administrative data found: Error!
  else. "( No entry in administrative data )

    if ( I_OBJECT is initial ).

*!!!! Error! Unmanaged Object
      clear CURRENT_OBJECT_INFO.
      clear CURRENT_OBJECT_IREF.
      clear CURRENT_OBJECT_INDEX.

      class CX_OS_OBJECT_NOT_REFRESHABLE definition load.
      raise exception type CX_OS_OBJECT_NOT_REFRESHABLE
           exporting OBJECT = I_OBJECT
                     TEXTID = CX_OS_OBJECT_NOT_REFRESHABLE=>UNMANAGED.

    endif.

*   * 3e1. Check Polymorphism
*   *      Try to find the responsible class agent
*   *      for this object. Check inheritance and
*   *      avoid recursion.
    try.

        call method CL_OS_SYSTEM=>OS_GET_CLASS_AGENT_BY_REF
             exporting I_OBJECT     = I_OBJECT
             receiving RESULT       = ANOTHER_CLASS_AGENT.

      catch CX_OS_CLASS_NOT_FOUND.
*!!!!!! Error! Unmanaged Object
        clear CURRENT_OBJECT_INFO.
        clear CURRENT_OBJECT_IREF.
        clear CURRENT_OBJECT_INDEX.

        class CX_OS_OBJECT_NOT_REFRESHABLE definition load.
        raise exception type CX_OS_OBJECT_NOT_REFRESHABLE
          exporting OBJECT = I_OBJECT
                    TEXTID = CX_OS_OBJECT_NOT_REFRESHABLE=>UNMANAGED.
    endtry.

*   * 3e1A. Polymorphism
    if ( ANOTHER_CLASS_AGENT <> ME ).

      call method OS_VALID_INSTANCE
           exporting I_OBJECT       = I_OBJECT
           receiving RESULT         = IS_VALID_INSTANCE.

      if ( IS_VALID_INSTANCE eq OSCON_TRUE ).

        ANOTHER_CLASS_AGENT_FACTORY ?= ANOTHER_CLASS_AGENT.

        clear CURRENT_OBJECT_INFO.
        clear CURRENT_OBJECT_IREF.
        clear CURRENT_OBJECT_INDEX.

        call method ANOTHER_CLASS_AGENT_FACTORY->REFRESH_PERSISTENT
             exporting I_OBJECT = I_OBJECT.

      else.

        clear CURRENT_OBJECT_INFO.
        clear CURRENT_OBJECT_IREF.
        clear CURRENT_OBJECT_INDEX.

        class CX_OS_OBJECT_NOT_REFRESHABLE definition load.
        raise exception type CX_OS_OBJECT_NOT_REFRESHABLE
          exporting
            OBJECT = I_OBJECT
            TEXTID = CX_OS_OBJECT_NOT_REFRESHABLE=>CLASS_AGENT_MISMATCH.

      endif.

*   * 3e1B. No Polymorphism
    else.

*!!!! Error! Unmanaged Object
      clear CURRENT_OBJECT_INFO.
      clear CURRENT_OBJECT_IREF.
      clear CURRENT_OBJECT_INDEX.

      class CX_OS_OBJECT_NOT_REFRESHABLE definition load.
      raise exception type CX_OS_OBJECT_NOT_REFRESHABLE
           exporting OBJECT = I_OBJECT
                     TEXTID = CX_OS_OBJECT_NOT_REFRESHABLE=>UNMANAGED.

    endif.

  endif. "( Entry found? )

* * 4. Clean up
  clear CURRENT_OBJECT_INFO.
  clear CURRENT_OBJECT_IREF.
  clear CURRENT_OBJECT_INDEX.

endmethod. "IF_OS_FACTORY~REFRESH_PERSISTENT


method IF_OS_FACTORY~RELEASE.
     " importing I_OBJECT type ref to IF_OS_STATE
     " raising   CX_OS_OBJECT_NOT_RELEASABLE
************************************************************************
* Purpose        : Remove administrative data entry for the managed
*                  object I_OBJECT and un-subscribe from all events.
*                  With RELEASE you can get rid of managed transient
*                  objects and purge managed objects that use a
*                  part of the ID of a persistent object (BKey or OID)
*
* Version        : 2.0
*
* Precondition   : The object state is transient or not loaded
*
* Postcondition  : The object is not managed anymore.Its events are
*                  ignored, its data won't be saved.
*
* OO Exceptions  : CX_OS_OBJECT_NOT_RELEASABLE
*
* Implementation : 1. Get administrative data for the object
*                    1a. Check Polymorphism
*                      1a1. Polymorphism: Call sub class agent
*                      1a2. No Polymorphism: Error!
*                  2. Check state of object
*                  3. release event subscriptions
*                  4. Delete administrative data
*
************************************************************************
* Changelog:
* - 2000-07-19 : (BGR) Initial Version
* - 2001-01-12 : (SB)  OO Exceptions
* - 2001-06-19 : (SB)  Polymorphism
************************************************************************

  data: INTERNAL_OID  type TYP_INTERNAL_OID.

  data: ANOTHER_CLASS_AGENT         type ref to OBJECT.
  data: IS_VALID_INSTANCE           type OS_BOOLEAN.
  data: ANOTHER_CLASS_AGENT_FACTORY type ref to IF_OS_FACTORY.

  clear: CURRENT_OBJECT_IREF,
         CURRENT_OBJECT_INFO.

* * 1. Get administrative data for the object
  INTERNAL_OID = OS_GET_INTERNAL_OID_BY_REF( I_OBJECT ).

  read table OBJECT_INFO transporting no fields
       with table key OBJECT_ID = INTERNAL_OID.

  if ( sy-subrc = 0 ).

    OS_LOAD_AND_VALIDATE_CURRENT( sy-tabix ).

  else. "( no entry found )

    if ( I_OBJECT is initial ).

*!!!!!! error: No entry in administrative data
      clear CURRENT_OBJECT_INFO.

      class CX_OS_OBJECT_NOT_RELEASABLE definition load.
      raise exception type CX_OS_OBJECT_NOT_RELEASABLE
           exporting OBJECT = I_OBJECT
                     TEXTID = CX_OS_OBJECT_NOT_RELEASABLE=>UNMANAGED.

    endif.

*   * 1a. Check Polymorphism
*   *     Try to find the responsible class agent
*   *     for this object. Check inheritance and
*   *     avoid recursion.
    try.

        call method CL_OS_SYSTEM=>OS_GET_CLASS_AGENT_BY_REF
             exporting I_OBJECT     = I_OBJECT
             receiving RESULT       = ANOTHER_CLASS_AGENT.

      catch CX_OS_CLASS_NOT_FOUND.

*!!!!!! Error! Unmanaged Object
        clear CURRENT_OBJECT_INFO.

        class CX_OS_OBJECT_NOT_RELEASABLE definition load.
        raise exception type CX_OS_OBJECT_NOT_RELEASABLE
             exporting OBJECT = I_OBJECT
                       TEXTID = CX_OS_OBJECT_NOT_RELEASABLE=>UNMANAGED.
    endtry.

*   * 1a1. Polymorphism
    if ( ANOTHER_CLASS_AGENT <> ME ).

      call method OS_VALID_INSTANCE
           exporting I_OBJECT       = I_OBJECT
           receiving RESULT         = IS_VALID_INSTANCE.

      if ( IS_VALID_INSTANCE eq OSCON_TRUE ).

        ANOTHER_CLASS_AGENT_FACTORY ?= ANOTHER_CLASS_AGENT.

        clear CURRENT_OBJECT_INFO.

        call method ANOTHER_CLASS_AGENT_FACTORY->RELEASE
             exporting I_OBJECT = I_OBJECT.

      else.

        raise exception type CX_OS_OBJECT_NOT_RELEASABLE
          exporting
            OBJECT = I_OBJECT
            TEXTID = CX_OS_OBJECT_NOT_RELEASABLE=>CLASS_AGENT_MISMATCH.

      endif.

*   * 1a2. No Polymorhism
    else.

*!!!!!! error: No entry in administrative data
      clear CURRENT_OBJECT_INFO.

      class CX_OS_OBJECT_NOT_RELEASABLE definition load.
      raise exception type CX_OS_OBJECT_NOT_RELEASABLE
           exporting OBJECT = I_OBJECT
                     TEXTID = CX_OS_OBJECT_NOT_RELEASABLE=>UNMANAGED.

    endif.

  endif. "( entry found? )

  if ( CURRENT_OBJECT_IREF is initial ).

*   * The administrative data has been found but the object has
*   * already been purged by garbage collection.
*   * OS_LOAD_AND_VALIDATE_CURRENT has already cleaned up
*   * everything.

  else." ( object still exists )

*   * 2. Check state of object

    case CURRENT_OBJECT_INFO-PM_STATUS.

    when OSCON_OSTATUS_NOT_LOADED
      or OSCON_OSTATUS_LOADED
      or OSCON_OSTATUS_TRANSIENT.

*     * These states allow to release the object.

*     * 3. release event subscriptions

      if ( CURRENT_OBJECT_INFO-SM_SUB_READ = OSCON_TRUE ).
        set handler HANDLER_READ_ACCESS
            for CURRENT_OBJECT_IREF
            activation OSCON_EXT_FALSE.
      endif. "( read access subscription? )

      if ( CURRENT_OBJECT_INFO-SM_SUB_WRITE = OSCON_TRUE ).
        set handler HANDLER_WRITE_ACCESS
            for CURRENT_OBJECT_IREF
            activation OSCON_EXT_FALSE.
      endif. "( write access subscription? )

      if ( CURRENT_OBJECT_INFO-SM_SUB_CHG = OSCON_TRUE ).
        set handler HANDLER_CHANGED
            for CURRENT_OBJECT_IREF
            activation OSCON_EXT_FALSE.
      endif. "( changed subscription? )

*     * 4. Delete entry from administrative data tables
      DELETE_SPECIAL_OBJECT_INFO( ). "Subclass

      delete OBJECT_INFO index CURRENT_OBJECT_INDEX.

    when OSCON_OSTATUS_NEW.

*!!!! error: object state is new
      clear CURRENT_OBJECT_INFO.

      class CX_OS_OBJECT_NOT_RELEASABLE definition load.
      raise exception type CX_OS_OBJECT_NOT_RELEASABLE
           exporting OBJECT = I_OBJECT
                     TEXTID = CX_OS_OBJECT_NOT_RELEASABLE=>NEW.

    when OSCON_OSTATUS_CHANGED.

*!!!! error: object state is changed
      clear CURRENT_OBJECT_INFO.

      class CX_OS_OBJECT_NOT_RELEASABLE definition load.
      raise exception type CX_OS_OBJECT_NOT_RELEASABLE
           exporting OBJECT = I_OBJECT
                     TEXTID = CX_OS_OBJECT_NOT_RELEASABLE=>CHANGED.

    when OSCON_OSTATUS_DELETED.

*!!!! error: object state is deleted
      clear CURRENT_OBJECT_INFO.

      class CX_OS_OBJECT_NOT_RELEASABLE definition load.
      raise exception type CX_OS_OBJECT_NOT_RELEASABLE
           exporting OBJECT = I_OBJECT
                     TEXTID = CX_OS_OBJECT_NOT_RELEASABLE=>DELETED.

    endcase. "CURRENT_OBJECT_INFO-PM_STATUS

    clear CURRENT_OBJECT_INFO.
    clear CURRENT_OBJECT_IREF.
    clear CURRENT_OBJECT_INDEX.

  endif. "( object exists? )

endmethod. "IF_OS_FACTORY~RELEASE


method INIT . "#EC NEEDED
************************************************************************
* Purpose        : Initialize the class agent, dynamic invoked by
*                  system agent cl_os_system
*
* Version        : 2.0
*
* Precondition   : -
*
* Postcondition  : -
*
* OO Exceptions  : -
*
* Implementation : -
*
************************************************************************
* Changelog:
* - 2000-03-02   : (BGR) Initial Version
* - 2000-08-29   : (SB)  OO Exceptions
************************************************************************

endmethod. "INIT


method LOAD_SPECIAL_OBJECT_INFO . "#EC NEEDED
* to be implemented in subclass!!!
************************************************************************
* Purpose        : Load CURRENT_SPECIAL_OBJECT_INFO from
*                  SPECIAL_OBJECT_INFO
*
* Version        : 2.0
*
* Precondition   : Index is set in CURRENT_OBJECT_INDEX
*
* Postcondition  : entry is loaded
*
* OO Exceptions  : --
*
* Implementation : must be implemented in subclass
*
************************************************************************
* Changelog:
* - 2000-03-02   : (BGR) Initial Version
************************************************************************

endmethod."LOAD_SPECIAL_OBJECT_INFO


method MAP_INVALIDATE.
     " importing I_OBJECT_IREF_TAB type TYP_OBJECT_TAB
* to be implemented in subclass!!!
* the implementation for the non-persistent mapping has to be in this
* class, because there no way to generate this method in that case!!!
************************************************************************
* Purpose        : Invalidate state of all objects in I_OBJECT_IREF_TAB
*
* Version        : 2.0
*
* Precondition   : Objects in I_OBJECT_IREF_TAB exist
*
* Postcondition  : Their state in cleared
*
* OO Exceptions  : propagates INVALIDATE
*
* Implementation : must be implemented in subclass
*
************************************************************************
* Changelog:
* - 2000-04-17   : (BGR) Initial Version
* - 2000-08-29   : (SB)  OO Exceptions
************************************************************************

  data: OBJECT_IREF type TYP_OBJECT_IREF.

  loop at I_OBJECT_IREF_TAB into OBJECT_IREF.

    if ( not OBJECT_IREF is initial ).

      call method OBJECT_IREF->INVALIDATE.

    endif. "( not initial )

  endloop. "at I_OBJECT_IREF_TAB

endmethod. "MAP_INVALIDATE


method MAP_RUNTIME_CHECK_CREATE_DATA . "#EC NEEDED
* to be implemented in subclass!!!
************************************************************************
* Purpose        : Create data used for Runtime-Check
*
* Version        : 2.0
*
* Precondition   : -
*
* Postcondition  : Internal table OS_PM_RUNTIME_CHECK_INFO_TAB contains
*                  data for Runtime-Check
*
* OO Exceptions  : -
*
* Implementation : must be implemented in subclass
*
************************************************************************
* Changelog:
* - 2002-01-29   : (SB)  Initial Version
************************************************************************
endmethod.


method OM_RESTORE_OBJECTS .
************************************************************************
* Purpose        : Object Manager: Restore OBJECT_INFO
*
* Version        : 2.0
*
* Precondition   : --
*
* Postcondition  : OM_IGNORE flag in OBJECT_INFO is reset
*
* OO Exceptions  : --
*
* Implementation : Set OM_IGNORE flags in OBJECT_INFO to FALSE.
*
************************************************************************
* Changelog:
* - 2001-03-08   : (MWI) Initial Version
************************************************************************
  data: INFO_WA   type ref to TYP_OBJECT_INFO.

* * 1. clear flags
  loop at OBJECT_INFO reference into INFO_WA.
    INFO_WA->OM_IGNORE = OSCON_FALSE.
  endloop.

endmethod. "OM_RESTORE_OBJECTS


method OM_SET_OBJECTS .
************************************************************************
* Purpose        : Object Manager: Set OBJECT_INFO from given objects
*
* Version        : 2.0
*
* Precondition   : --
*
* Postcondition  : The OM_IGNORE flag in OBJECT_INFO is set for all
*                  objects not in I_OBJECTS
*
* OO Exceptions  : --
*
* Implementation : Set OM_IGNORE flag for all objects except those in
*                  I_OBJECTS.
*
************************************************************************
* Changelog:
* - 2001-03-07   : (MWI) Initial Version
************************************************************************

  data: REFERENCE      type TYP_OBJECT_IREF,
        TEMP           type ref to OBJECT,
        WA_OBJECT_INFO type ref to TYP_OBJECT_INFO,
        INT_OID        type TYP_INTERNAL_OID.

* * set OM_IGNORE flag for all objects then remove it for
* * the objects that should be saved
  loop at OBJECT_INFO reference into WA_OBJECT_INFO.
    WA_OBJECT_INFO->OM_IGNORE = OSCON_TRUE.
  endloop.

  loop at I_OBJECTS into TEMP.

    REFERENCE ?= TEMP.
    INT_OID = OS_GET_INTERNAL_OID_BY_REF( REFERENCE ).

    read table OBJECT_INFO with key OBJECT_ID = INT_OID
        reference into WA_OBJECT_INFO.
    if SY-SUBRC eq 0.
      WA_OBJECT_INFO->OM_IGNORE = OSCON_FALSE.
    endif.

  endloop.

endmethod. "OM_SET_OBJECTS


method OS_CLEAR_CURRENT .
************************************************************************
* Purpose        : clear CURRENT_OBJECT_INFO, CURRENT_OBJECT_IREF
*                  and CURRENT_OBJECT_INDEX
*
* Version        : 2.0
*
* Precondition   : --
*
* Postcondition  : CURRENT is cleared
*
* OO Exceptions  : --
*
* Implementation :
*
************************************************************************
* Changelog:
* - 2000-03-02   : (BGR) Initial Version
************************************************************************

  clear: CURRENT_OBJECT_INFO,
         CURRENT_OBJECT_IREF,
         CURRENT_OBJECT_INDEX.

endmethod. "OS_CLEAR_CURRENT


method os_create_new_entry_for_repr .
  " importing I_OBJECT       type TYP_OBJECT_IREF
  "           I_INTERNAL_OID type TYP_INTERNAL_OID
************************************************************************
* Purpose        : create and insert a new entry in OBJECT_INFO and
*                  set CURRENT.
*
* Version        : 2.0
*
* Precondition   : There is no entry for I_OBJECT yet. The internal OID
*                  and the strong reference must be set in I_OBJECT and
*                  I_INTERNAL_OID
*
* Postcondition  : A new entry is made in OBJECT_INFO, CURRENT* is set,
*                  the administrative state is NOT_LOADED, a strong
*                  reference (OBJECT_IREF) is set, a weak reference
*                  (OBJECT_WREF) prevents the internal OID from being
*                  reused after garbage collection.
*
* OO Exceptions  : --
*
* Implementation :
*
************************************************************************
* Changelog:
* - 2000-03-02   : (BGR) Initial Version
************************************************************************

  clear current_object_info.

* * weak reference
  create object current_object_info-object_wref
         exporting oref = i_object.

  current_object_info-object_id    = i_internal_oid.
  current_object_info-object_iref  = i_object.
  current_object_info-pm_status    = oscon_ostatus_not_loaded.
  current_object_info-pm_dbstatus  = oscon_dbstatus_unknown.
  current_object_info-pm_sub_rw    = oscon_true.
  current_object_info-pm_sub_chg   = oscon_false.
  current_object_info-um_sub_write = oscon_false.
  current_object_info-om_ignore    = oscon_false.
  current_object_info-tm_used      = oscon_true.
* * Insert Object_Info
  insert current_object_info into table object_info.

* * Annoying: When using a sorted table, INSERT must be used which
* * doesn't set sy-tabix.
  read table object_info transporting no fields
       with table key object_id = i_internal_oid.
  current_object_index = sy-tabix.
  current_object_iref  = i_object.

endmethod." OS_CREATE_NEW_ENTRY_FOR_REPR


method OS_GET_INTERNAL_OID_BY_REF .
     " importing I_OBJECT type TYP_OBJECT_IREF
     " returning result type TYP_INTERNAL_OID
************************************************************************
* Purpose        : get the internal OID for a given object reference
*
* Version        : 2.0
*
* Precondition   : I_OBJECT is not an initial reference
*
* Postcondition  : result is the internal OID of the object
*
* OO Exceptions  : --
*
* Implementation : Call kernel function of OBJMGR_GET_INFO
*
************************************************************************
* Changelog:
* - 2000-03-02   : (BGR) Initial Version
************************************************************************

  call 'OBJMGR_GET_INFO' id 'OPNAME' field 'GET_OBJID'
                         id 'OBJID'  field result
                         id 'OBJ'    field I_OBJECT.

endmethod. "OS_GET_INTERNAL_OID_BY_REF


method OS_GET_REF_BY_INTERNAL_OID .
     " importing I_INTERNAL_OID type TYP_INTERNAL_OID
     " returning result type TYP_OBJECT_IREF
************************************************************************
* Purpose        : get the object reference for a given internal OID
*
* Version        : 2.0
*
* Precondition   : --
*
* Postcondition  : result is:
*                  - object reference
*                  - initial if object doesn't exist (anymore)
*
* OO Exceptions  : --
*
* Implementation : Call kernel function of OBJMGR_GET_INFO
*
************************************************************************
* Changelog:
* - 2000-03-02   : (BGR) Initial Version
************************************************************************

  call 'OBJMGR_GET_INFO' id 'OPNAME' field 'WEAK_REF_GET'
                         id 'OID'    field I_INTERNAL_OID
                         id 'OBJ'    field result.

endmethod. "OS_GET_REF_BY_INTERNAL_OID


method OS_INTERNAL_UNDO.
************************************************************************
* Purpose        : Discard Changes made to OBJECT_INFO
*
* Version        : 2.0
*
* Precondition   : INTERNAL_CURRENT_TRANSACTION is set
*                  INTERNAL_NEXT_UNDO_INFO is set
*
* Postcondition  :
*
* OO Exceptions  : --
*
* Implementation :
*
************************************************************************
* Changelog:
* - 2000-03-02   : (BGR) Initial Version
************************************************************************

  data: FROM_INDEX              type TYP_INDEX,
        TO_INDEX                type TYP_INDEX,
        INTERNAL_UNDO_INFO_ITEM type TYP_INTERNAL_UNDO_INFO,
        PROCESSED_ITEMS         type TYP_INDEX_TAB.

  read table INTERNAL_TRANSACTION_STACK into FROM_INDEX
       index INTERNAL_CURRENT_TRANSACTION.

  if ( FROM_INDEX < INTERNAL_NEXT_UNDO_INFO ).

    TO_INDEX = INTERNAL_NEXT_UNDO_INFO - 1.

    loop at INTERNAL_UNDO_INFO into INTERNAL_UNDO_INFO_ITEM
         from FROM_INDEX to TO_INDEX.

      read table PROCESSED_ITEMS
           from INTERNAL_UNDO_INFO_ITEM-OBJECT_INDEX
           transporting no fields.

      if ( sy-subrc <> 0 ).

        append INTERNAL_UNDO_INFO_ITEM-OBJECT_INDEX
               to PROCESSED_ITEMS.
        modify OBJECT_INFO from INTERNAL_UNDO_INFO_ITEM-OBJECT_INFO
               index INTERNAL_UNDO_INFO_ITEM-OBJECT_INDEX.

      endif. "( not yet processed? )

    endloop. "at INTERNAL_UNDO_INFO

  endif. "( Something to Undo? )

* * Clean-up internal Undo
  delete INTERNAL_TRANSACTION_STACK
         index INTERNAL_CURRENT_TRANSACTION.
  add -1 to INTERNAL_CURRENT_TRANSACTION.

  if ( INTERNAL_TRANSACTION_STACK is initial ).

    clear INTERNAL_UNDO_INFO.
    INTERNAL_NEXT_UNDO_INFO = 1.

  elseif ( FROM_INDEX > 1 ).

      delete INTERNAL_UNDO_INFO from FROM_INDEX to TO_INDEX.
      INTERNAL_NEXT_UNDO_INFO = FROM_INDEX .

    else. "( We started from beginning )

      clear INTERNAL_UNDO_INFO.
      INTERNAL_NEXT_UNDO_INFO = 1.

  endif. "( INTERNAL_TRANSACTION_STACK is initial? )

endmethod. "OS_INTERNAL_UNDO


method OS_LOAD_AND_VALIDATE_CURRENT .
     " importing I_INDEX type TYP_INDEX
************************************************************************
* Purpose        : load administrative data from OBJECT_INFO (I_INDEX)
*                  to CURRENT and check if it is still valid (Object
*                  still exists)
*
* Version        : 2.0
*
* Precondition   : I_INDEX points to the entry in OBJECT_INFO
*
* Postcondition  : - if the object doesn't exist anymore, CURRENT is
*                    clear and the entry in OBJECT_INFO and
*                    SPECIAL_OBJECT_INFO is deleted.
*                  - else CURRENT_OBJECT_INFO, CURRENT_OBJECT_INDEX and
*                    CURRENT_OBJECT_IREF is set (even if no strong
*                    reference is set in CURRENT_OBJECT_INFO)
*
* OO Exceptions  : --
*
* Implementation :
*
************************************************************************
* Changelog:
* - 2000-03-02   : (BGR) Initial Version
************************************************************************

  CURRENT_OBJECT_INDEX = I_INDEX.
  read table OBJECT_INFO into CURRENT_OBJECT_INFO
       index I_INDEX.

  if ( CURRENT_OBJECT_INFO-OBJECT_IREF is initial ).

    CURRENT_OBJECT_IREF =  OS_GET_REF_BY_INTERNAL_OID(
                I_INTERNAL_OID = CURRENT_OBJECT_INFO-OBJECT_ID ).

    if ( CURRENT_OBJECT_IREF is initial ).

*     * delete entry from administrative data tables
      call method DELETE_SPECIAL_OBJECT_INFO. "Subclass

      delete OBJECT_INFO index CURRENT_OBJECT_INDEX.
      clear: CURRENT_OBJECT_INFO,
             CURRENT_OBJECT_INDEX.

    endif." ( Garbage Collection was successful! )

  else. "( OBJECT_IREF is not initial )

    CURRENT_OBJECT_IREF = CURRENT_OBJECT_INFO-OBJECT_IREF.

  endif. "( OBJECT_IREF is initial ?)

endmethod. "OS_LOAD_AND_VALIDATE_CURRENT


method OS_PM_CREATED_PERSISTENT .
************************************************************************
* Purpose        : Completion of CREATE PERSISTENT and clean-up
*
* Version        : 2.0
*
* Precondition   : The new object is already created, the entry in
*                  OBJECT_INFO and SPECIAL_OBJECT_INFO exists and
*                  CURRENT is set
*
* Postcondition  : The object is initialized, subscriptions are updated,
*                  the CREATED_PERSISTENT Event has been raised,
*                  CURRENT is clear.
*
* OO Exceptions  : propagates EXT_PM_CREATED_PERSISTENT with cleanup
*                  propagates INIT with cleanup
*                  event CREATED_PERSISTENT
*
* Implementation : 1. store UNDO information if necessary
*                  2. set STATUS new, DBSTATUS not existing,
*                     clear subscriptions
*                  3. call subclass extension EXT_PM_CREATED_PERSISTENT
*                  4. update subscription
*                  5. save CURRENT_OBJECT_INFO in OBJECT_INFO and
*                     CURRENT_SPECIAL_OI in SPECIAL_OI
*                  6. Initialize Object
*                  7. clear CURRENT_OBJECT_INFO, CURRENT_OBJECT_IREF
*                     and CURRENT_OBJECT_INDEX
*                  8. raise event CREATED_PERSISTENT
*
************************************************************************
* Changelog:
* - 2000-03-02   : (BGR) Initial Version
* - 2000-08-29   : (SB)  OO Exceptions
************************************************************************

  data: UNDO_INFO_ITEM   type TYP_PM_UNDO_INFO,
        TEMP_OBJECT_IREF type TYP_OBJECT_IREF.

* * X. *** consistency check ***
  call method LCL_CHECK=>TRANSACTION(
    exporting I_OPERATION = 'CREATE'
              I_CLASS_NAME = CLASS_INFO-CLASS_NAME ).

* * 1. Create Undo Entry if necessary
  if ( not UNDO_TRANSACTION_STACK is initial ).

    move-corresponding CURRENT_OBJECT_INFO to UNDO_INFO_ITEM.
    append UNDO_INFO_ITEM to PM_UNDO_INFO.
    PM_NEXT_UNDO_INFO = sy-tabix + 1.

  endif. "( Undo Aktiv )

* * 2. Modify Object Info
  CURRENT_OBJECT_INFO-PM_STATUS   = OSCON_OSTATUS_NEW.
  CURRENT_OBJECT_INFO-PM_DBSTATUS = OSCON_DBSTATUS_NOT_EXISTING.
  CURRENT_OBJECT_INFO-PM_SUB_RW   = OSCON_FALSE.
  CURRENT_OBJECT_INFO-PM_SUB_CHG  = OSCON_FALSE.
  CURRENT_OBJECT_INFO-UM_SUB_WRITE = OSCON_FALSE.
  current_object_info-tm_used     = OSCON_TRUE.

  try.
*     * 3. call subclass extension
      call method EXT_PM_CREATED_PERSISTENT.

*     * 4. Update Subscription
      call method SM_UPDATE_CURRENT_SUBSCRIPTION.

*     * 5. save CURRENT
      modify OBJECT_INFO from CURRENT_OBJECT_INFO
             index CURRENT_OBJECT_INDEX.
      call method SAVE_SPECIAL_OBJECT_INFO.

*     * 6. Initialize object
      call method CURRENT_OBJECT_IREF->INIT.

    cleanup.
      clear: CURRENT_OBJECT_INFO,
             CURRENT_OBJECT_IREF,
             CURRENT_OBJECT_INDEX.
  endtry.

* * 7. clear CURRENT
  TEMP_OBJECT_IREF = CURRENT_OBJECT_IREF.
  clear: CURRENT_OBJECT_INFO,
         CURRENT_OBJECT_IREF,
         CURRENT_OBJECT_INDEX.

* * 8. raise event
  raise event IF_OS_FACTORY~CREATED_PERSISTENT
        exporting OBJECT = TEMP_OBJECT_IREF.

endmethod. "OS_PM_CREATED_PERSISTENT


method OS_PM_CREATED_REPRESENTANT .
************************************************************************
* Purpose        : Completion of CREATE REPRESENTANT and clean-up
*
* Version        : 2.0
*
* Precondition   : The new object is already created, the entry in
*                  OBJECT_INFO and SPECIAL_OBJECT_INFO exists and
*                  CURRENT is set
*
* Postcondition  : subscriptions are updated, the LOADED_WITHOUT_STATE
*                  Event has been raised, CURRENT is clear.
*                  There is no strong reference for this object in
*                  the administrative data anymore.
*
* OO Exceptions  : propagates EXT_PM_CREATED_REPRESENTANT with cleanup
*                  event LOADED_WITHOUT_STATE
*
* Implementation : 1. call subclass extens. EXT_PM_CREATED_REPRESENTANT
*                  2. update subscription
*                  3. clear strong reference (OBJECT_IREF) in CURRENT_OI
*                     because this object should be free for garbage
*                     collection
*                  4. save CURRENT_OBJECT_INFO in OBJECT_INFO and
*                     CURRENT_SPECIAL_OI in SPECIAL_OI
*                  5. clear CURRENT_OBJECT_INFO, CURRENT_OBJECT_IREF
*                     and CURRENT_OBJECT_INDEX
*                  6. raise event LOADED_WITHOUT_STATE
*
************************************************************************
* Changelog:
* - 2000-03-02   : (BGR) Initial Version
* - 2000-08-29   : (SB)  OO Exceptions
************************************************************************

  data: OBJECT_REF type TYP_OBJECT_IREF.

  try.
*     * 1. Call subclass Extension:
      call method EXT_PM_CREATED_REPRESENTANT.

*     * 2. Update Subscriptions
      call method SM_UPDATE_CURRENT_SUBSCRIPTION.

*     * 3. clear strong reference
      OBJECT_REF = CURRENT_OBJECT_INFO-OBJECT_IREF.
      clear CURRENT_OBJECT_INFO-OBJECT_IREF.

*     * 4. save CURRENT
      modify OBJECT_INFO from CURRENT_OBJECT_INFO
             index CURRENT_OBJECT_INDEX.
      call method SAVE_SPECIAL_OBJECT_INFO.

    cleanup.
      clear: CURRENT_OBJECT_INFO,
             CURRENT_OBJECT_IREF,
             CURRENT_OBJECT_INDEX.
  endtry.

* * 5. clear CURRENT
  clear: CURRENT_OBJECT_INFO,
         CURRENT_OBJECT_IREF,
         CURRENT_OBJECT_INDEX.

* * 6. raise event
  raise event IF_OS_FACTORY~LOADED_WITHOUT_STATE
        exporting OBJECT = OBJECT_REF.

endmethod. "OS_PM_CREATED_REPRESENTANT


method OS_PM_CREATED_TRANSIENT .
************************************************************************
* Purpose        : Completion of CREATE TRANSIENT and clean-up
*
* Version        : 2.0
*
* Precondition   : The new object is already created, the entry in
*                  OBJECT_INFO and SPECIAL_OBJECT_INFO exists and
*                  CURRENT is set
*
* Postcondition  : The object is initialized, subscriptions are updated,
*                  the CREATED_TRANSIENT Event has been raised,
*                  CURRENT is clear.
*
* OO Exceptions  : propagates EXT_PM_CREATED_TRANSIENT with cleanup
*                  propagates INIT with cleanup
*                  event CREATED_TRANSIENT
*
* Implementation : 1. store UNDO information if necessary
*                  2. set STATUS transient, DBSTATUS not existing,
*                     clear subscriptions
*                  3. call subclass extension EXT_PM_CREATED_TRANSIENT
*                  4. update subscription
*                  5. save CURRENT_OBJECT_INFO in OBJECT_INFO and
*                     CURRENT_SPECIAL_OI in SPECIAL_OI
*                  6. Initialize Object
*                  7. clear CURRENT_OBJECT_INFO, CURRENT_OBJECT_IREF
*                     and CURRENT_OBJECT_INDEX
*                  8. raise event CREATED_TRANSIENT
*
************************************************************************
* Changelog:
* - 2000-03-02   : (BGR) Initial Version
* - 2000-08-29   : (SB)  OO Exceptions
************************************************************************

  data: UNDO_INFO_ITEM   type TYP_PM_UNDO_INFO,
        TEMP_OBJECT_IREF type TYP_OBJECT_IREF.

* * 1. Create Undo Entry if necessary
  if ( not UNDO_TRANSACTION_STACK is initial ).

    move-corresponding CURRENT_OBJECT_INFO to UNDO_INFO_ITEM.
    append UNDO_INFO_ITEM to PM_UNDO_INFO.
    PM_NEXT_UNDO_INFO = sy-tabix + 1.

  endif. "( Undo Aktiv )

* * 2. Modify Object Info
  CURRENT_OBJECT_INFO-PM_STATUS   = OSCON_OSTATUS_TRANSIENT.
  CURRENT_OBJECT_INFO-PM_DBSTATUS = OSCON_DBSTATUS_NOT_EXISTING.
  CURRENT_OBJECT_INFO-PM_SUB_RW   = OSCON_FALSE.
  CURRENT_OBJECT_INFO-PM_SUB_CHG  = OSCON_FALSE.
  CURRENT_OBJECT_INFO-UM_SUB_WRITE = OSCON_FALSE.
  current_object_info-tm_used     = OSCON_TRUE.

  try.
*     * 3. subclass extension
      call method EXT_PM_CREATED_TRANSIENT.

*     * 4. Update Subscription
      call method SM_UPDATE_CURRENT_SUBSCRIPTION.

*     * 5. save CURRENT
      modify OBJECT_INFO from CURRENT_OBJECT_INFO
             index CURRENT_OBJECT_INDEX.
      call method SAVE_SPECIAL_OBJECT_INFO.

*     * 6. Initialize object
      call method CURRENT_OBJECT_IREF->INIT.

    cleanup.
      clear: CURRENT_OBJECT_INFO,
             CURRENT_OBJECT_IREF,
             CURRENT_OBJECT_INDEX.
  endtry.

* * 7. clear CURRENT
  TEMP_OBJECT_IREF = CURRENT_OBJECT_IREF.
  clear: CURRENT_OBJECT_INFO,
         CURRENT_OBJECT_IREF,
         CURRENT_OBJECT_INDEX.

* * 8. raise event
  raise event IF_OS_FACTORY~CREATED_TRANSIENT
        exporting OBJECT = TEMP_OBJECT_IREF.

endmethod. "OS_PM_CREATED_TRANSIENT


method OS_PM_DELETED_PERSISTENT .
************************************************************************
* Purpose        : Completion of DELETE PERSISTENT and clean-up
*
* Version        : 2.0
*
* Precondition   : The object has been checked if it is allowed to
*                  be deleted,
*                  CURRENT is set
*
* Postcondition  : The object is marked for deletion except for the
*                  case STATUS = NEW,
*                  the DELETED_PERSISTENT Event has been raised,
*                  CURRENT is clear.
*
* OO Exceptions  : propagates EXT_PM_DELETED_PERSISTENT with cleanup
*                  propagates MAP_INVALIDATE
*                  event DELETED
*
* Implementation : 1. if undo is active store necessary undo information
*                  2. set subscriptions
*                  3. Depending on PM_DBSTATUS set PM_STATUS
*                  4. call subclass extension EXT_PM_DELETED_PERSISTENT
*                  5. update subscription
*                  6. save CURRENT_OBJECT_INFO in OBJECT_INFO and
*                     CURRENT_SPECIAL_OI in SPECIAL_OI
*                  7. Invalidate Object
*                  8. clear CURRENT_OBJECT_INFO, CURRENT_OBJECT_IREF
*                     and CURRENT_OBJECT_INDEX
*                  9. raise event DELETED
*
************************************************************************
* Changelog:
* - 2000-03-07   : (BGR) Initial Version
* - 2000-08-29   : (SB)  OO Exceptions
************************************************************************

  data: TEMP_OBJECT_IREF type TYP_OBJECT_IREF,
        INVALIDATE_TAB   type TYP_OBJECT_TAB.

* * X. *** RTM check ***
  call method LCL_CHECK=>TRANSACTION(
    exporting I_OPERATION = 'DELETE'
              I_CLASS_NAME = CLASS_INFO-CLASS_NAME ).

* * 1. Undo?
  if ( not UNDO_TRANSACTION_STACK is initial ).

*   * UM_HANDLER_WRITE_ACCESS does everything that needs to be done:
*   * save administrative state, save state object if necessary
*   * Precondition: CURRENT is set.
    call method UM_HANDLER_WRITE_ACCESS.
  endif.

* * 2. set subscriptions
  CURRENT_OBJECT_INFO-PM_SUB_RW   = OSCON_TRUE.
  CURRENT_OBJECT_INFO-PM_SUB_CHG  = OSCON_FALSE.
  CURRENT_OBJECT_INFO-OBJECT_IREF = CURRENT_OBJECT_IREF.
  current_object_info-tm_used     = OSCON_TRUE.

* * 3. Depending on PM_DBSTATUS set PM_STATUS
  if ( CURRENT_OBJECT_INFO-PM_DBSTATUS = OSCON_DBSTATUS_NOT_EXISTING ).
    CURRENT_OBJECT_INFO-PM_STATUS   = OSCON_OSTATUS_NOT_LOADED.
  else.
    CURRENT_OBJECT_INFO-PM_STATUS   = OSCON_OSTATUS_DELETED.
  endif. "( PM_DBSTATUS )

  try.
*     * 4. call subclass extension
      call method EXT_PM_DELETED_PERSISTENT.

*     * 5. Update Subscription
      call method SM_UPDATE_CURRENT_SUBSCRIPTION.

*     * 6. save CURRENT
      modify OBJECT_INFO from CURRENT_OBJECT_INFO
             index CURRENT_OBJECT_INDEX.
      call method SAVE_SPECIAL_OBJECT_INFO.

*     * 7. Invalidate Object
      append CURRENT_OBJECT_IREF to INVALIDATE_TAB.
      call method MAP_INVALIDATE
           exporting I_OBJECT_IREF_TAB = INVALIDATE_TAB.

    cleanup.
      clear: CURRENT_OBJECT_INFO,
             CURRENT_OBJECT_IREF,
             CURRENT_OBJECT_INDEX.
  endtry.

* * 8. clear CURRENT
         TEMP_OBJECT_IREF = CURRENT_OBJECT_IREF.
  clear: CURRENT_OBJECT_INFO,
         CURRENT_OBJECT_IREF,
         CURRENT_OBJECT_INDEX.

* * 9. raise event
  raise event IF_OS_FACTORY~DELETED
        exporting OBJECT = TEMP_OBJECT_IREF.

endmethod." OS_PM_DELETED_PERSISTENT


method OS_PM_DELETE_PERSISTENT .
* to be implemented in subclass!!!
************************************************************************
* Purpose        : Delete persistent object. It is marked DELETED in
*                  memory and removed from DB when the top transaction
*                  is closed.
*
* Version        : 2.0
*
* Precondition   : The object is persistent (not transient), CURRENT
*                  is set
*
* Postcondition  : Instance is marked for deletion.
*
* OO Exceptions  : CX_OS_NO_IMPLEMENTATION
*
* Implementation : must be implemented in subclass
*
************************************************************************
* Changelog:
* - 2001-12-14   : (SB)  Initial Version
************************************************************************

*!error: No implementation available
  class CX_OS_NO_IMPLEMENTATION definition load.
  raise exception type CX_OS_NO_IMPLEMENTATION
       exporting TEXTID = CX_OS_NO_IMPLEMENTATION=>SUBCLASS.

endmethod. "OS_PM_DELETE_PERSISTENT .


method OS_PM_HANDLE_CREATE_ON_EXIST .
*      IMPORTING I_TRANSIENT TYPE OS_BOOLEAN DEFAULT OSCON_FALSE
************************************************************************
* Purpose        : Completion of CREATE PERSISTENT/CREATE TRANSIENT
*                  and clean-up if an entry already exists in
*                  administrative data
*
* Version        : 2.0
*
* Precondition   : An entry for the given Key was found in
*                  SPECIAL_OBJECT_INFO and CURRENT is set
*
* Postcondition  : - if the representant could be re-used (status
*                    not_loaded or deleted), the object was initialized,
*                    subscriptions are updated, the CREATED_PERSISTENT/
*                    CREATED_TRANSIENT event has been raised,
*                    CURRENT is cleared
*                  - if status is not no_loaded or deleted, an empty
*                    exception is raised
*
* OO Exceptions  : CX_OS_OBJECT_STATE(TRANSIENT,PERSISTENT)
*                  propagates EXT_PM_CREATED_PERSISTENT with cleanup
*                          or EXT_PM_CREATED_TRANSTENT with cleanup
*                  propagates INIT
*                  event CREATED_PERSISTENT or event CREATED_TRANSIENT
*
* Implementation : 1. copy CURRENT to Undo Info
*                  2. set strong reference
*                  3. set STATUS new, DBSTATUS not existing,
*                     clear subscriptions
*                  4. store UNDO information if necessary
*                  5. call subclass extension EXT_PM_CREATED_PERSISTENT
*                     or EXT_PM_CREATED_TRANSIENT
*                  6. update subscription
*                  7. save CURRENT_OBJECT_INFO in OBJECT_INFO and
*                     CURRENT_SPECIAL_OI in SPECIAL_OI
*                  8. Initialize Object
*                  9. clear CURRENT_OBJECT_INFO, CURRENT_OBJECT_IREF
*                     and CURRENT_OBJECT_INDEX
*                 10. raise event CREATED_PERSISTENT or CREATED_TRANSIENT
*
************************************************************************
* Changelog:
* - 2000-03-02   : (BGR) Initial Version
* - 2000-08-29   : (SB)  OO Exceptions
* - 2003-04-28   : (SB)  reuse of instances reimplemented
************************************************************************

  data: UNDO_INFO_ITEM    type TYP_PM_UNDO_INFO,
        TEMP_OBJECT_IREF  type TYP_OBJECT_IREF.

  current_object_info-tm_used     = OSCON_TRUE.

  case CURRENT_OBJECT_INFO-PM_STATUS.

  when OSCON_OSTATUS_DELETED or
      OSCON_OSTATUS_NOT_LOADED.
*   * if status is DELETED: CREATE sets object in status CHANGED
*   * (it must exist on the database)
*   * if status is NOT_LOADED: CREATE sets object in status NEW

*   * 1. copy CURRENT to undo info
    move-corresponding CURRENT_OBJECT_INFO to UNDO_INFO_ITEM.

*   * 2. set strong reference
    CURRENT_OBJECT_INFO-OBJECT_IREF = CURRENT_OBJECT_IREF.

*   * 3. set status
    if ( I_TRANSIENT = OSCON_FALSE ).

      if ( CURRENT_OBJECT_INFO-PM_DBSTATUS = OSCON_DBSTATUS_EXISTING ).

        CURRENT_OBJECT_INFO-PM_STATUS = OSCON_OSTATUS_CHANGED.

      else."( DB status unknown or not existing )

        CURRENT_OBJECT_INFO-PM_STATUS = OSCON_OSTATUS_NEW.

      endif. "( DB status? )

    else.

      CURRENT_OBJECT_INFO-PM_STATUS = OSCON_OSTATUS_TRANSIENT.

    endif.

  when OSCON_OSTATUS_TRANSIENT.

*!! error: object with specified key already exists transient
*   * Exception object must be created in the subclass because there
*   * is the information about the business key / OID
    class CX_OS_OBJECT_STATE definition load.
    raise exception type CX_OS_OBJECT_STATE
      exporting
        TEXTID = CX_OS_OBJECT_STATE=>TRANSIENT.

  when others.

*!! error: object with specified key already exists persistent
*   * Exception object must be created in the subclass because there
*   * is the information about the business key / OID
    class CX_OS_OBJECT_STATE definition load.
    raise exception type CX_OS_OBJECT_STATE
      exporting
        TEXTID = CX_OS_OBJECT_STATE=>PERSISTENT.

  endcase. "PM_STATUS

* * 4. Store Undo information if necessary
  if ( not UNDO_TRANSACTION_STACK is initial ).

    append UNDO_INFO_ITEM to PM_UNDO_INFO.
    PM_NEXT_UNDO_INFO = sy-tabix + 1.

  endif. "( Undo )

  try.
*     * 5. call subclass extension
      if ( I_TRANSIENT = OSCON_FALSE ).
        call method EXT_PM_CREATED_PERSISTENT.
      else.
        call method EXT_PM_CREATED_TRANSIENT.
      endif.
*     * 6. Update Subscription
      call method SM_UPDATE_CURRENT_SUBSCRIPTION.

*     * 7. save CURRENT
      modify OBJECT_INFO from CURRENT_OBJECT_INFO
             index CURRENT_OBJECT_INDEX.
      call method SAVE_SPECIAL_OBJECT_INFO.

*     * 8. Initialize object
      call method CURRENT_OBJECT_INFO-OBJECT_IREF->INIT.

    cleanup.
      clear: CURRENT_OBJECT_INFO,
             CURRENT_OBJECT_IREF,
             CURRENT_OBJECT_INDEX.
  endtry.

* * 9. clear CURRENT
  TEMP_OBJECT_IREF = CURRENT_OBJECT_IREF.
  clear: CURRENT_OBJECT_INFO,
         CURRENT_OBJECT_IREF,
         CURRENT_OBJECT_INDEX.

* * 10. raise event
  if ( I_TRANSIENT = OSCON_FALSE ).
    raise event IF_OS_FACTORY~CREATED_PERSISTENT
          exporting OBJECT = TEMP_OBJECT_IREF.
  else.
    raise event IF_OS_FACTORY~CREATED_TRANSIENT
          exporting OBJECT = TEMP_OBJECT_IREF.
  endif.

endmethod." OS_PM_HANDLE_CREATE_ON_EXIST


method os_pm_loaded_persistent .
************************************************************************
* Purpose        : Completion of GET PERSISTENT and clean-up
*
* Version        : 2.0
*
* Precondition   : The object data has been loaded and set into the
*                  object
*                  CURRENT is set
*
* Postcondition  : The object is initialized, subscriptions are updated,
*                  the LOADED_WITH_STATE Event has been raised,
*                  CURRENT is clear.
*
* OO Exceptions  : propagates EXT_PM_LOADED_PERSISTENT with cleanup
*                  propagates INIT
*                  event LOADED_WITH_STATE
*
* Implementation : 1. set STATUS loaded, DBSTATUS existing, set CHANGED
*                     subscription
*                  2. if undo is active set Undo WRITE subscription
*                  3. call subclass extension EXT_PM_LOADED_PERSISTENT
*                  4. update subscription
*                  5. save CURRENT_OBJECT_INFO in OBJECT_INFO and
*                     CURRENT_SPECIAL_OI in SPECIAL_OI
*                  6. Initialize Object
*                  7. clear CURRENT_OBJECT_INFO, CURRENT_OBJECT_IREF
*                     and CURRENT_OBJECT_INDEX
*                  8. raise event LOADED_WITH_STATE
*
************************************************************************
* Changelog:
* - 2000-03-02   : (BGR) Initial Version
* - 2000-08-29   : (SB)  OO Exceptions
* - 2003-10-31   : (SB)  Fix for Write Access Flag
************************************************************************

  data: temp_object_iref        type typ_object_iref.

* * 1. set STATUS and strong reference
  current_object_info-pm_status   = oscon_ostatus_loaded.
  current_object_info-pm_dbstatus = oscon_dbstatus_existing.
  current_object_info-pm_sub_rw   = oscon_false.
  current_object_info-pm_sub_chg  = oscon_true.
  current_object_info-object_iref = current_object_iref.
  current_object_info-tm_used     = oscon_true.

* * 2. Undo?
  if ( not undo_transaction_stack is initial ).
    current_object_info-um_sub_write = oscon_true.
  endif.

  try.
*     * 3. call subclass extension
      call method ext_pm_loaded_persistent.

*     * 4. Update Subscription
      call method sm_update_current_subscription.

*     * 5. save CURRENT
      modify object_info from current_object_info
             index current_object_index.
      call method save_special_object_info.

*     * 6. Initialize Object
      call method current_object_iref->init.

    cleanup.
      clear: current_object_info,
             current_object_iref,
             current_object_index.
  endtry.

* * 7. clear CURRENT
  temp_object_iref = current_object_iref.
  clear: current_object_info,
         current_object_iref,
         current_object_index.

* * 8. raise event
  raise event if_os_factory~loaded_with_state
        exporting object       = temp_object_iref
                  write_access = oscon_false.

endmethod." OS_PM_LOADED_PERSISTENT


method OS_PM_RUNTIME_CHECK_EXECUTE .
* to be implemented in subclass!!!
************************************************************************
* Purpose        : Runtime-Check
*
* Version        : 2.0
*
* Precondition   : -
*
* Postcondition  : Generated mapping information is consistent with the
*                  actual table layout.
*
* OO Exceptions  : -
*
* Implementation : Check Nametab for each entry in check table.
*
************************************************************************
* Changelog:
* - 2002-01-29   : (SB)  Initial Version
************************************************************************

  data: X030L_WA type X030L.

  field-symbols:
    <FS_OS_PM_RUNTIME_CHECK_INFO> type TYP_PM_RUNTIME_CHECK_INFO.

* * create data in subclass method!
  call method MAP_RUNTIME_CHECK_CREATE_DATA .

  loop at OS_PM_RUNTIME_CHECK_INFO_TAB
    assigning <FS_OS_PM_RUNTIME_CHECK_INFO>
      where FLDCNT > 0.

* * * check nametab
    call function 'DDIF_NAMETAB_GET'
      exporting
        TABNAME   = <FS_OS_PM_RUNTIME_CHECK_INFO>-TABNAME
        ALL_TYPES = 'X'
      importing
        X030L_WA  = X030L_WA
      exceptions
        NOT_FOUND = 1
        OTHERS    = 2.
    if sy-subrc <> 0.
*!!!!!! * table not found
      raise exception type CX_OS_SYSTEM
        exporting
          TEXTID = CX_OS_SYSTEM=>RUNTIME_CHECK_ERROR.
    else.
      if X030L_WA-FLDCNT <> <FS_OS_PM_RUNTIME_CHECK_INFO>-FLDCNT.
*!!!!!!!! * table field count incorrect
        raise exception type CX_OS_SYSTEM
          exporting
            TEXTID = CX_OS_SYSTEM=>RUNTIME_CHECK_ERROR.
      endif.
    endif.

  endloop. "at OS_PM_RUNTIME_CHECK_INFO_TAB

endmethod.


method OS_VALID_INSTANCE .
************************************************************************
* Purpose        : implements "instance of", returns true if the given
*                  object is a subclass of the managed class
*
* Version        : 2.0
*
* Precondition   : --
*
* Postcondition  : --
*
* OO Exceptions  : --
*
* Implementation :
*
************************************************************************
* Changelog:
* - 2000-06-19   : (SB) Initial Version
************************************************************************

  data: TYPEDESCR type ref to CL_ABAP_TYPEDESCR.
  data: OBJECTDESCR type ref to CL_ABAP_OBJECTDESCR.
  data: TMP_RESULT type ABAP_BOOL.

  call method CL_ABAP_TYPEDESCR=>DESCRIBE_BY_NAME
    exporting
      P_NAME         = CLASS_INFO-CLASS_NAME
    receiving
      P_DESCR_REF    = TYPEDESCR
    exceptions
      TYPE_NOT_FOUND = 4.

  if ( SY-SUBRC eq 0 ).
    OBJECTDESCR ?= TYPEDESCR.
    TMP_RESULT = OBJECTDESCR->APPLIES_TO( I_OBJECT ).
  else.
    TMP_RESULT = ABAP_FALSE.
  endif.

  RESULT = TMP_RESULT.

endmethod.                    "OS_VALID_INSTANCE


method PM_HANDLER_CHANGED .
************************************************************************
* Purpose        : Persistency Manager: Handle CHANGED event for
*                  CURRENT object: Changes have to be written to the
*                  DB at the end of the top transaction
*
* Version        : 2.0
*
* Precondition   : CURRENT is set
*
* Postcondition  : New STATUS of CURRENT is CHANGED if it was LOADED
*                  before
*
* OO Exceptions  : --
*
* Implementation : 1. if STATUS is LOADED, set it to CHANGED
*                  2. un-subscribe by setting PM_SUB_CHG
*
************************************************************************
* Changelog:
* - 2000-03-02   : (BGR) Initial Version
************************************************************************

* * X. *** RTM check ***
  call method LCL_CHECK=>TRANSACTION(
    exporting I_OPERATION = 'CHANGED'
              I_CLASS_NAME = CLASS_INFO-CLASS_NAME ).

* * 1. if STATUS is LOADED, set it to CHANGED
  if ( CURRENT_OBJECT_INFO-PM_STATUS = OSCON_OSTATUS_LOADED ).
    CURRENT_OBJECT_INFO-PM_STATUS = OSCON_OSTATUS_CHANGED.
  endif.

* * 2. un-subscribe by setting PM_SUB_CHG
  CURRENT_OBJECT_INFO-PM_SUB_CHG = OSCON_FALSE.

endmethod. "PM_HANDLER_CHANGED


method PM_HANDLER_RW_ACCESS .
*      importing I_WRITE_ACCESS type OS_BOOLEAN default 'X'
************************************************************************
* Purpose        : Persistency Manager: Handle ACCESS event for
*                  CURRENT object: Load object data from DB. Because
*                  this methods is called by an event handler, a
*                  no check exception is used to encapsulated
*                  the dynamic check exceptions, for that the
*                  exception is propagated the the event raiser.
*
* Version        : 2.0
*
* Precondition   : CURRENT is set
*
* Postcondition  : New STATUS of CURRENT is LOADED if it was NOT_LOADED
*                  before; subscription is cleared; strong reference
*                  to object
*
* OO Exceptions  : CX_OS_OBJECT_NOT_FOUND(DELETED_BY_REF)
*                  propagates PM_LOAD
*                  CX_OS_NO_CHECK_CONTAINER wraps CX_OS_OBJECT_NOT_FOUND
*                  propagates EXT_PM_LOADED_PERSISTENT
*                  propagates INIT (CL)
*
* Implementation : 1. un-subscribe by resetting PM_SUB_RW
*                  2. Check STATUS
*                  2a. If marked for deletion, raise exception
*                  3. if NOT_LOADED, Load object data from DB by
*                       calling the subclass method PM_LOAD,
*                  4.   set CURRENT
*                  5.   if undo is active, set Undo Subscription
*                       UM_SUB_WRITE
*                  6.   call subclass extension EXT_PM_LOADED_PERSISTENT
*                  7.   temporarily save CURRENT
*                  8.   initialize object
*                  9.   raise event LOADED_WITH_STATE
*                 10.   restore CURRENT
*
************************************************************************
* Changelog:
* - 2000-03-02   : (BGR) Initial Version
* - 2003-10-31   : (SB)  Fix for Write Access Flag
* - 2007-10-09   : (WR)  Fix OID in exception
************************************************************************

  data: TEMP_CURRENT_OBJECT_INFO  type TYP_OBJECT_INFO,
        TEMP_CURRENT_OBJECT_INDEX type TYP_INDEX,
        TEMP_CURRENT_OBJECT_IREF  type TYP_OBJECT_IREF.

  data: EX_OS_OBJECT_NOT_FOUND type ref to CX_OS_OBJECT_NOT_FOUND,
        EX_OS_OBJECT_NOT_FOUND_NEW type ref to CX_OS_OBJECT_NOT_FOUND.

* * 1. un-subscribe
  CURRENT_OBJECT_INFO-PM_SUB_RW = OSCON_FALSE.

* * Check STATUS
  if ( CURRENT_OBJECT_INFO-PM_STATUS = OSCON_OSTATUS_DELETED ).

*   * 2a. If marked for deletion, raise exception
*   *     wrap it with a no check exception
*!! Error: Object activation failed - Object marked for deletion
    create object EX_OS_OBJECT_NOT_FOUND
      exporting
        OBJECT = CURRENT_OBJECT_IREF
        TEXTID = CX_OS_OBJECT_NOT_FOUND=>DELETED.
*        TEXTID = CX_OS_OBJECT_NOT_FOUND=>DELETED_BY_REF.
    raise exception type CX_OS_NO_CHECK_CONTAINER
      exporting
        PREVIOUS = EX_OS_OBJECT_NOT_FOUND.

  endif."( PM_Status Deleted? )

* * 3. if NOT_LOADED, Load object data from DB
  if ( CURRENT_OBJECT_INFO-PM_STATUS = OSCON_OSTATUS_NOT_LOADED ).

    try.

        call method PM_LOAD.

*       * Completion like OS_PM_LOADED_PERSISTENT without saving and
*       * clearing CURRENT

*       * 4. set CURRENT
        CURRENT_OBJECT_INFO-PM_STATUS   = OSCON_OSTATUS_LOADED.
        CURRENT_OBJECT_INFO-PM_DBSTATUS = OSCON_DBSTATUS_EXISTING.
        CURRENT_OBJECT_INFO-PM_SUB_CHG  = OSCON_TRUE.
        CURRENT_OBJECT_INFO-OBJECT_IREF = CURRENT_OBJECT_IREF.

*       * 5. if undo is active, set Undo Subscription
        if ( not UNDO_TRANSACTION_STACK is initial ).
          CURRENT_OBJECT_INFO-UM_SUB_WRITE  = OSCON_TRUE.
        endif.

*       * 6. call subclass extension
        call method EXT_PM_LOADED_PERSISTENT.

*       * 7. temporarily save CURRENT
        TEMP_CURRENT_OBJECT_INFO  = CURRENT_OBJECT_INFO.
        TEMP_CURRENT_OBJECT_INDEX = CURRENT_OBJECT_INDEX.
        TEMP_CURRENT_OBJECT_IREF  = CURRENT_OBJECT_IREF.

*       * 8. initialize object
        call method CURRENT_OBJECT_IREF->INIT.

*       * 9. raise event LOADED_WITH_STATE
        raise event IF_OS_FACTORY~LOADED_WITH_STATE
              exporting OBJECT       = CURRENT_OBJECT_IREF
                        WRITE_ACCESS = I_WRITE_ACCESS.

*       * 10. restore CURRENT
        CURRENT_OBJECT_INFO  = TEMP_CURRENT_OBJECT_INFO.
        CURRENT_OBJECT_INDEX = TEMP_CURRENT_OBJECT_INDEX.
        CURRENT_OBJECT_IREF  = TEMP_CURRENT_OBJECT_IREF.

*     * catch dynamic check exception and wrap it with
*     * a no check exception
      catch CX_OS_OBJECT_NOT_FOUND into EX_OS_OBJECT_NOT_FOUND.

        if EX_OS_OBJECT_NOT_FOUND->TEXTID =
             CX_OS_OBJECT_NOT_FOUND=>BY_OID.

          create object EX_OS_OBJECT_NOT_FOUND_NEW
            exporting
              OBJECT = EX_OS_OBJECT_NOT_FOUND->OBJECT
              OID    = EX_OS_OBJECT_NOT_FOUND->OID
              CLASS  = CLASS_INFO-CLASS_GUID
              TEXTID = CX_OS_OBJECT_NOT_FOUND=>BY_REF.

          EX_OS_OBJECT_NOT_FOUND = EX_OS_OBJECT_NOT_FOUND_NEW.

        endif.

        raise exception type CX_OS_NO_CHECK_CONTAINER
          exporting
            PREVIOUS = EX_OS_OBJECT_NOT_FOUND.

    endtry.

  endif. "( STATUS = NOT LOADED? )

endmethod."PM_HANDLER_RW_ACCESS


method PM_LOAD .
     " raising CX_OS_CLASS_NOT_FOUND
* to be implemented in subclass!!!
************************************************************************
* Purpose        : Load data from DB into Object specified by CURRENT
*
* Version        : 2.0
*
* Precondition   : CURRENT_* is set
*
* Postcondition  : object is loaded or exceptions is raised
*
* OO Exceptions  : CX_OS_NO_IMPLEMENTATION
*
* Implementation : must be implemented in subclass
*
************************************************************************
* Changelog:
* - 2000-03-02   : (BGR) Initial Version
* - 2000-08-29   : (SB)  OO Exceptions
************************************************************************

*!error: No implementation available
  class CX_OS_NO_IMPLEMENTATION definition load.
  raise exception type CX_OS_NO_IMPLEMENTATION
       exporting TEXTID = CX_OS_NO_IMPLEMENTATION=>SUBCLASS.

endmethod. "PM_LOAD


method REGISTER_CLASS_AGENT .
  " importing I_CLASS_NAME          type        OBJNAME
  "           I_CLASS_AGENT_NAME    type        OBJNAME
  "           I_CLASS_GUID          type        SYSUUID_C
  "           I_CLASS_AGENT_GUID    type        SYSUUID_C
  "           I_AGENT               type ref to object
  "           I_STORAGE_LOCATION    type        OBJNAME
  "           I_CLASS_AGENT_VERSION type        CHAR8
************************************************************************
* Purpose        : Informs the system that a new class agent exists that
*                  needs to be informed about start and end of top
*                  transactions and that can be asked about his objects.
*                  This method is called by the class constructor of
*                  a class agent class.
*
* Version        : 2.0
*
* Precondition   : --
*
* Postcondition  : The System is up (CL_OS_SYSTEM) and the agent is
*                  registered as active
*
* OO Exceptions  : --
*
* Implementation : 1. Init system. If it is already up, this call can't
*                     do any harm
*                  2. Runtime-Check
*                  3. Set class info
*                  4. inform the system agent
*                  5. Register the class agent at the garbage collector
*                  6. Get references of service agents
*                  7. Subscribe to events
*                  8. Get current undo transaction stack from
*                     undo manager
*
************************************************************************
* Changelog:
* - 2000-03-02   : (BGR) Initial Version
* - 2002-01-08   : (CS)  Register Class Agent at Garbage Collector
* - 2002-01-29   : (SB)  Runtime Check
************************************************************************

  data: UNDO_MANAGER           type ref to IF_OS_UNDO_MANAGER,
        TRANSACTION_STACK_LINE type        OSTYP_TRANSACTION_LINE,
        UNDO_TRANSACTION_LINE  type        TYP_UNDO_TRANSACTION_ITEM,
        AGENT_IF               type ref to CL_OS_CA_COMMON.

  call method LCL_CHECK=>POC(
    exporting i_CLASS_NAME = I_CLASS_NAME ).
*   * *************start of insertion*******************
*   * X. temporary change: rtm check for init ON COMMIT
*  data: RTM type ref to object,
*        SUBKEY type string,
*        TMP_UPDATE_TASK like sy-subrc.
*
*  IF ( CL_OS_SYSTEM=>INIT_STATE is initial ) .
*    if CL_SYSTEM_TRANSACTION_STATE=>GET_ON_COMMIT( ) = 1.
*
*      try.
*          call function 'TH_IN_UPDATE_TASK'
*            importing
*              IN_UPDATE_TASK = TMP_UPDATE_TASK.
*          call method ('CL_OS_RTM')=>('GET_INSTANCE')
*               receiving INSTANCE = RTM.
*          if ( TMP_UPDATE_TASK is initial ).
*            concatenate 'INIT_IN_POC(' I_CLASS_NAME ')'
*                        into SUBKEY.
*          else.
*            concatenate 'INIT_IN_POC_IN_UPDATE_TASK(' I_CLASS_NAME ')'
*                        into SUBKEY.
*          endif.
*          call method RTM->('ADD_ENTRY')
*               exporting SUBKEY = SUBKEY.
*        catch CX_SY_DYN_CALL_ERROR. "#EC NO_HANDLER
*      endtry.
*    endif.
*  endif.
*   * *************end of insertion*********************

* * 1. initialisation of the OO System
  call method CL_OS_SYSTEM=>INIT.

* * 2. Runtime-Check
  call method OS_PM_RUNTIME_CHECK_EXECUTE.

* * 3. set data
  CLASS_INFO-CLASS_GUID          = I_CLASS_GUID.
  CLASS_INFO-CLASS_AGENT_GUID    = I_CLASS_AGENT_GUID.
  CLASS_INFO-CLASS_NAME          = I_CLASS_NAME.
  CLASS_INFO-CLASS_AGENT_NAME    = I_CLASS_AGENT_NAME.
  CLASS_INFO-AGENT              ?= I_AGENT.
  CLASS_INFO-STORAGE_LOCATION    = I_STORAGE_LOCATION.
  CLASS_INFO-CLASS_AGENT_VERSION = I_CLASS_AGENT_VERSION.

* * 4. Inform the system agent
  raise event IF_OS_CA_SERVICE~AGENT_CREATED
        exporting AGENT               = I_AGENT
                  CLASS_NAME          = I_CLASS_NAME
                  CLASS_NAME_GUID     = CLASS_INFO-CLASS_GUID
                  CLASS_AGENT_NAME    = I_CLASS_AGENT_NAME
                  CLASS_AGENT_GUID    = CLASS_INFO-CLASS_AGENT_GUID
                  CLASS_AGENT_VERSION = I_CLASS_AGENT_VERSION.

* * 5. Register the class agent at the garbage collector
  AGENT_IF ?= I_AGENT.
  AGENT_IF->OS_GARBAGE_COLLECTOR_LAST_RUN =
    CL_GC_LAST_RUN=>NEW_HANDLE( ).

* * 6. Get references of service agents
  PERSISTENCY_MANAGER = CL_OS_SYSTEM=>GET_PERSISTENCY_MANAGER( ).
  UNDO_MANAGER        = CL_OS_SYSTEM=>GET_UNDO_MANAGER( ).

* * 7. Subscribe to events
  set handler UM_TRANSACTION_STARTED for UNDO_MANAGER.
  set handler UM_TRANSACTION_ENDED   for UNDO_MANAGER.
  set handler UM_UNDO                for UNDO_MANAGER.

* * 8. Initialize Undo transaction stack if necessary
  if ( not UNDO_MANAGER->UNDO_TRANSACTION_STACK is initial ).

    loop at UNDO_MANAGER->UNDO_TRANSACTION_STACK
         into TRANSACTION_STACK_LINE.

      UNDO_TRANSACTION_LINE-TRANSACTION =
          TRANSACTION_STACK_LINE-TRANSACTION.
      UNDO_TRANSACTION_LINE-PM_INDEX    = 1.
      UNDO_TRANSACTION_LINE-EXT_INDEX   = 1.

      append UNDO_TRANSACTION_LINE to UNDO_TRANSACTION_STACK.

    endloop. "at UNDO_MANAGER->UNDO_TRANSACTION_STACK

    UM_CURRENT_TRANSACTION = SY-TABIX.
    PM_NEXT_UNDO_INFO  = 1.
    EXT_NEXT_UNDO_INFO = 1.

  endif. "( undo already active)

endmethod. "REGISTER_CLASS_AGENT


method SAVE_SPECIAL_OBJECT_INFO . "#EC NEEDED
* to be implemented in subclass!!!
************************************************************************
* Purpose        : Save CURRENT_SPECIAL_OBJECT_INFO into
*                  SPECIAL_OBJECT_INFO
*
* Version        : 2.0
*
* Precondition   : Index is set in CURRENT_OBJECT_INDEX
*
* Postcondition  : entry is saved
*
* OO Exceptions  : --
*
* Implementation : must be implemented in subclass
*
************************************************************************
* Changelog:
* - 2000-03-02   : (BGR) Initial Version
************************************************************************

endmethod. "SAVE_SPECIAL_OBJECT_INFO


method SM_UPDATE_CURRENT_SUBSCRIPTION .
************************************************************************
* Purpose        : Update subscriptions to the access or changed events
*                  of the CURRENT object.
*
* Version        : 2.0
*
* Precondition   : CURRENT is set, SM_SUB_* in CURRENT reflect the
*                  actual subscriptions, PM_SUB*, UM_SUB*, EXT_SUB*
*                  the subscription requests of the services
*
* Postcondition  : Subscriptions to object access events have been
*                  updated if necessary
*
* OO Exceptions  : --
*
* Implementation : For READ_ACCESS, WRITE_ACCESS and CHANGED do:
*                  - check if a subscription is requested but none is
*                    currently active -> subscribe
*                  - else check if no service needs a subscription that
*                    is currently active -> un-subscribe
*
************************************************************************
* Changelog:
* - 2000-03-03   : (BGR) Initial Version
************************************************************************

* * READ ACCESS: activate if a service needs it
  if ( CURRENT_OBJECT_INFO-SM_SUB_READ = OSCON_FALSE and
       ( CURRENT_OBJECT_INFO-PM_SUB_RW    = OSCON_TRUE or
         CURRENT_OBJECT_INFO-EXT_SUB_READ = OSCON_TRUE   ) ).

    CURRENT_OBJECT_INFO-SM_SUB_READ = OSCON_TRUE.
    set handler HANDLER_READ_ACCESS
        for CURRENT_OBJECT_IREF
        activation OSCON_EXT_TRUE.

* * READ ACCESS: de-activate if no service needs it anymore
  elseif ( CURRENT_OBJECT_INFO-SM_SUB_READ  = OSCON_TRUE  and
           CURRENT_OBJECT_INFO-PM_SUB_RW    = OSCON_FALSE and
           CURRENT_OBJECT_INFO-EXT_SUB_READ = OSCON_FALSE     ).

    CURRENT_OBJECT_INFO-SM_SUB_READ = OSCON_FALSE.
    set handler HANDLER_READ_ACCESS
        for CURRENT_OBJECT_IREF
        activation OSCON_EXT_FALSE.

  endif. "( read access? )


* * WRITE ACCESS: activate if a service needs it
  if ( CURRENT_OBJECT_INFO-SM_SUB_WRITE = OSCON_FALSE and
       ( CURRENT_OBJECT_INFO-PM_SUB_RW     = OSCON_TRUE or
         CURRENT_OBJECT_INFO-UM_SUB_WRITE  = OSCON_TRUE or
         CURRENT_OBJECT_INFO-EXT_SUB_WRITE = OSCON_TRUE   ) ).

    CURRENT_OBJECT_INFO-SM_SUB_WRITE = OSCON_TRUE.
    set handler HANDLER_WRITE_ACCESS
        for CURRENT_OBJECT_IREF
        activation OSCON_EXT_TRUE.

* * WRITE ACCESS: de-activate if no service needs it anymore
  elseif ( CURRENT_OBJECT_INFO-SM_SUB_WRITE  = OSCON_TRUE  and
           CURRENT_OBJECT_INFO-PM_SUB_RW     = OSCON_FALSE and
           CURRENT_OBJECT_INFO-UM_SUB_WRITE  = OSCON_FALSE and
           CURRENT_OBJECT_INFO-EXT_SUB_WRITE = OSCON_FALSE     ).

    CURRENT_OBJECT_INFO-SM_SUB_WRITE = OSCON_FALSE.
    set handler HANDLER_WRITE_ACCESS
        for CURRENT_OBJECT_IREF
        activation OSCON_EXT_FALSE.

  endif. "( write access? )


* * CHANGED: activate if a service needs it
  if ( CURRENT_OBJECT_INFO-SM_SUB_CHG = OSCON_FALSE and
       ( CURRENT_OBJECT_INFO-PM_SUB_CHG  = OSCON_TRUE or
         CURRENT_OBJECT_INFO-EXT_SUB_CHG = OSCON_TRUE    ) ).

    CURRENT_OBJECT_INFO-SM_SUB_CHG = OSCON_TRUE.
    set handler HANDLER_CHANGED
        for CURRENT_OBJECT_IREF
        activation OSCON_EXT_TRUE.

* * CHANGED: de-activate if no service needs it anymore
  elseif ( CURRENT_OBJECT_INFO-SM_SUB_CHG  = OSCON_TRUE  and
           CURRENT_OBJECT_INFO-PM_SUB_CHG  = OSCON_FALSE and
           CURRENT_OBJECT_INFO-EXT_SUB_CHG = OSCON_FALSE     ).

    CURRENT_OBJECT_INFO-SM_SUB_CHG = OSCON_FALSE.
    set handler HANDLER_CHANGED
        for CURRENT_OBJECT_IREF
        activation OSCON_EXT_FALSE.

  endif. "( changed? )

endmethod. "SM_UPDATE_CURRENT_SUBSCRIPTION


method SM_UPDATE_SUBSCRIPTIONS .
     " importing I_INDEX_TAB type TYP_INDEX_TAB
************************************************************************
* Purpose        : Update subscriptions to the access or changed events
*                  for all objects identified by their index in the
*                  OBJECT_INFO table
*
* Version        : 2.0
*
* Precondition   : --
*
* Postcondition  : Subscriptions to object access events have been
*                  updated if necessary
*
* OO Exceptions  : --
*
* Implementation : For every entry in I_INDEX_TAB:
*                  1. load CURRENT
*                  2. if no strong reference exists, get it
*                  2a. if the object doesn't exist anymore, ignore it
*                  3. call SM_UPDATE_CURRENT_SUBSCRIPTION
*                  4. save CURRENT
*                  Finally clear CURRENT
*
************************************************************************
* Changelog:
* - 2000-03-03   : (BGR) Initial Version
************************************************************************

* * For every object indexed in I_INDEX_TAB:
  loop at I_INDEX_TAB into CURRENT_OBJECT_INDEX.

*   * 1. load CURRENT
    read table OBJECT_INFO into CURRENT_OBJECT_INFO
         index CURRENT_OBJECT_INDEX.

*   * 2. get strong reference
    if ( CURRENT_OBJECT_INFO-OBJECT_IREF is initial ).

*     * only a weak reference is stored in OBJECT_INFO:
*     * temporarily get the strong reference to the object
      CURRENT_OBJECT_IREF =  OS_GET_REF_BY_INTERNAL_OID(
                  I_INTERNAL_OID = CURRENT_OBJECT_INFO-OBJECT_ID ).

      if ( CURRENT_OBJECT_IREF is initial ).

*       * 2a. The object doesn't exist anymore: Ignore it.
        continue.
      endif." ( Garbage Collection was successful! )

    else. "( OBJECT_IREF is not initial )

      CURRENT_OBJECT_IREF = CURRENT_OBJECT_INFO-OBJECT_IREF.

    endif. "( OBJECT_IREF is initial ?)

*   * 3. update Subscription for the CURRENT object
    call method SM_UPDATE_CURRENT_SUBSCRIPTION.

*   * 4. save CURRENT
    modify OBJECT_INFO from CURRENT_OBJECT_INFO
                       index CURRENT_OBJECT_INDEX.

  endloop." at OBJECT_INFO_INDEX

* * Clean-up
  clear: CURRENT_OBJECT_INFO,
         CURRENT_OBJECT_IREF,
         CURRENT_OBJECT_INDEX.

endmethod. "SM_UPDATE_SUBSCRIPTIONS


method UM_HANDLER_WRITE_ACCESS .
************************************************************************
* Purpose        : Undo Manager: Handle WRITE_ACCESS event for
*                  CURRENT object: Save object state and administrative
*                  data for a later undo
*
* Version        : 2.0
*
* Precondition   : CURRENT is set
*
* Postcondition  : Undo information is saved in PM_UNDO_INFO,
*                  PM_NEXT_UNDO_INFO is set to the index of the next
*                  free entry of PM_UNDO_INFO
*
* OO Exceptions  : --
*
* Implementation : 1. un-subscribe by setting UM_SUB_WRITE
*                  if undo is active:
*                  2. copy CURRENT to PM_UNDO_INFO
*                  3. get copy of object state
*                  4. save PM_UNDO_INFO
*                  5. set PM_NEXT_UNDO_INFO
*
************************************************************************
* Changelog:
* - 2000-03-02   : (BGR) Initial Version
************************************************************************

  data: UNDO_INFO_ITEM   type TYP_PM_UNDO_INFO .

* * 1. un-subscribe
  CURRENT_OBJECT_INFO-UM_SUB_WRITE = OSCON_FALSE.

* * Undo active?
  if ( not UNDO_TRANSACTION_STACK is initial ).

*   * 2. copy CURRENT to PM_UNDO_INFO
    move-corresponding CURRENT_OBJECT_INFO to UNDO_INFO_ITEM.

*   * Set strong reference for undo item
    UNDO_INFO_ITEM-OBJECT_IREF = CURRENT_OBJECT_IREF.

*   * 3. get copy of object state
    call method CURRENT_OBJECT_IREF->GET
         receiving result = UNDO_INFO_ITEM-STATE_OBJECT.

*   * 4. save PM_UNDO_INFO
    append UNDO_INFO_ITEM to PM_UNDO_INFO.

*   * 5. set PM_NEXT_UNDO_INFO

    PM_NEXT_UNDO_INFO = sy-tabix + 1.

  endif. "( Undo active? )

endmethod. "UM_HANDLER_WRITE_ACCESS


method UM_TRANSACTION_ENDED .
     " for event UNDOABLE_TRANSACTION_ENDED of IF_OS_UNDO_MANAGER
     " importing E_TRANSACTION type ref to IF_OS_TRANSACTION
************************************************************************
* Purpose        : Undo Manager: Handle TRANSACTION_ENDED event for
*                  an undo relevant transaction. All undo informations
*                  of the ended Transaction belong now to their super
*                  transaction.
*                  If there is no (undo relevant) super transaction
*                  anymore, de-activate Undo
*
* Version        : 2.0
*
* Precondition   : The transaction has been started undo-relevant.
*
* Postcondition  : The entry on the transaction stack is deleted.
*                  If it was the last entry, de-activate Undo and
*                  un-subscribe to all objects.
*
* OO Exceptions  : --
*
* Implementation : 1. find entry on transaction stack
*                  2. call subclass extension EXT_UM_TRANSACTION_ENDED
*                  3. Last entry?:
*                    3a. clear Undo Info
*                    3b. un-subscribe by resetting UM_SUB_WRITE
*                  4. delete entry from transaction stack, set
*                     UM_CURRENT_TRANSACTION
*
************************************************************************
* Changelog:
* - 2000-03-02   : (BGR) Initial Version
************************************************************************

  data: TRANSACTION_STACK_ITEM type TYP_UNDO_TRANSACTION_ITEM.

  field-symbols <FS_OBJECT_INFO_ITEM>  type TYP_OBJECT_INFO.

* * 1. find entry on transaction stack

* * Check if last transaction on transaction stack
* * and i_transaction are the same
  read table UNDO_TRANSACTION_STACK into TRANSACTION_STACK_ITEM
       index UM_CURRENT_TRANSACTION.
  if ( TRANSACTION_STACK_ITEM-TRANSACTION ne E_TRANSACTION ).

*   * Did someone skip a transaction?
    read table UNDO_TRANSACTION_STACK into TRANSACTION_STACK_ITEM
         with key TRANSACTION = E_TRANSACTION.
    if ( sy-subrc = 0 ).

      UM_CURRENT_TRANSACTION = sy-tabix.

    else." ( Found no entry)

*     * There is no entry on the transaction stack for this transaction
      exit.

    endif. "( Transaction Entry found )
  endif. "( not the same transaction )

* * 2. call subclass extension
  call method EXT_UM_TRANSACTION_ENDED.

* * 3. Last Transaction to be ended?
  if ( UM_CURRENT_TRANSACTION = 1 ).

*   * 3a. Clear all data
    clear: PM_UNDO_INFO,
           UNDO_TRANSACTION_STACK,
           UM_CURRENT_TRANSACTION,
           PM_NEXT_UNDO_INFO,
           EXT_NEXT_UNDO_INFO.

*   * 3b. un-subscribe by resetting UM_SUB_WRITE
    loop at OBJECT_INFO assigning <FS_OBJECT_INFO_ITEM>
         where UM_SUB_WRITE = OSCON_TRUE.

      <FS_OBJECT_INFO_ITEM>-UM_SUB_WRITE = OSCON_FALSE.
    endloop." at OBJECT_INFO

  else." ( there are still one or more transactions left )


*   * 4. delete entry from transaction stack
    delete UNDO_TRANSACTION_STACK index UM_CURRENT_TRANSACTION.
    UM_CURRENT_TRANSACTION = UM_CURRENT_TRANSACTION - 1.

  endif. "( Last transaction? )

endmethod. "UM_TRANSACTION_ENDED


method UM_TRANSACTION_STARTED .
     " for event UNDOABLE_TRANSACTION_STARTED of IF_OS_UNDO_MANAGER
     " importing E_TRANSACTION type ref to IF_OS_TRANSACTION
************************************************************************
* Purpose        : Undo Manager: Handle TRANSACTION_STARTED event for
*                  an undo relevant transaction. Subscribe to
*                  WRITE ACCESS event for all relevant objects.
*
* Version        : 2.0
*
* Precondition   : --
*
* Postcondition  : A new entry on the UNDO TRANSACTION STACK is made,
*                  WRITE_ACCESS subscriptions have been updated for all
*                  objects that are not in state NOT_LOADED or DELETED.
*                  undo is active, UM_CURRENT_TRANSACTION is set
*
* OO Exceptions  : --
*
* Implementation : 1. new entry on transaction stack make undo active
*                  2. Subscribe to all objects that are not in the state
*                     not_loaded or deleted
*                  3. update subscriptions for all relevant objects
*                  4. call subclass extension EXT_UM_TRANSACTION_STARTED
*
************************************************************************
* Changelog:
* - 2000-03-03   : (BGR) Initial Version
************************************************************************

  data: TRANSACTION_STACK_ITEM type TYP_UNDO_TRANSACTION_ITEM,
        INDEX_TAB              type TYP_INDEX_TAB .

  field-symbols <FS_OBJECT_INFO_ITEM> type TYP_OBJECT_INFO.

* * 1. new entry on transaction stack
  TRANSACTION_STACK_ITEM-TRANSACTION = E_TRANSACTION.
  TRANSACTION_STACK_ITEM-PM_INDEX    = PM_NEXT_UNDO_INFO.
  TRANSACTION_STACK_ITEM-EXT_INDEX   = EXT_NEXT_UNDO_INFO.
  append TRANSACTION_STACK_ITEM
      to UNDO_TRANSACTION_STACK.
  UM_CURRENT_TRANSACTION = sy-tabix.

* * 2. Subscribe to all objects that are not in the state
* *    not_loaded or deleted

  loop at OBJECT_INFO assigning <FS_OBJECT_INFO_ITEM>
       where ( ( PM_STATUS <> OSCON_OSTATUS_NOT_LOADED ) and
               ( PM_STATUS <> OSCON_OSTATUS_DELETED ) ).

    <FS_OBJECT_INFO_ITEM>-UM_SUB_WRITE = OSCON_TRUE.

    append sy-tabix to INDEX_TAB.

  endloop. "at OBJECT_INFO

* * 3. update subscriptions for all relevant objects
  call method SM_UPDATE_SUBSCRIPTIONS
       exporting I_INDEX_TAB = INDEX_TAB.

* * 4. call subclass extension
  call method EXT_UM_TRANSACTION_STARTED.

endmethod. "UM_TRANSACTION_STARTED


method UM_UNDO .
     " for event UNDO_REQUESTED of IF_OS_UNDO_MANAGER
     " importing E_TRANSACTION type ref to IF_OS_TRANSACTION
************************************************************************
* Purpose        : Undo Manager: Process Undo for E_TRANSACTION
*                  All changes made since this transaction started are
*                  undone.
*
* Version        : 2.0
*
* Precondition   : The transaction has been started undo relevant
*
* Postcondition  : All changes are undone.
*
* OO Exceptions  : --
*
* Implementation : 1. find entry on transaction stack
*                  2. check if there are entries on the UNDO_INFO stack
*                  3. process all entries on UNDO_INFO stack made since
*                     E_TRANSACTION started:
*                    3a. Check if this object has already been processed
*                    3b. get corresponding entry from OBJECT_INFO
*                    3c. Copy UNDO_INFO to OBJECT_INFO and mark object
*                        as processed
*                    3d. set state of the object using SET or INVALIDATE
*                  4. Update subscriptions
*                  5. call subclass extension EXT_UM_UNDO
*                  6. Last entry?:
*                    6a. clear Undo Info
*                    6b. un-subscribe by resetting UM_SUB_WRITE
*                  7. delete entry from transaction stack, set
*                     UM_CURRENT_TRANSACTION
*
************************************************************************
* Changelog:
* - 2000-03-03   : (BGR) Initial Version
************************************************************************

  types: begin of TYP_OBJECT_REF_LINE ,
           OBJECT_ID type TYP_INTERNAL_OID ,
         end of TYP_OBJECT_REF_LINE ,
         TYP_OBJECT_REF_TAB type hashed table
                            of TYP_OBJECT_REF_LINE with unique key OBJECT_ID.

  data: TRANSACTION_STACK_ITEM type TYP_UNDO_TRANSACTION_ITEM,
        INDEX_FROM             type TYP_INDEX,
        INDEX_TO               type TYP_INDEX,
        PROCESSED_OBJECTS      type TYP_OBJECT_REF_TAB,
        PROCESSED_OBJECT_ITEM  type TYP_OBJECT_REF_LINE,
        INVALIDATE_TAB         type TYP_OBJECT_TAB,
        INDEX_LIST             type TYP_INDEX_TAB,
        OBJECT_INFO_ITEM       type TYP_OBJECT_INFO,
        OBJECT_INFO_INDEX      type TYP_INDEX.

  field-symbols: <FS_UNDO_INFO_ITEM>   type TYP_PM_UNDO_INFO,
                 <FS_OBJECT_INFO_ITEM> type TYP_OBJECT_INFO.


* * 1. find entry on transaction stack
  read table UNDO_TRANSACTION_STACK into TRANSACTION_STACK_ITEM
       index UM_CURRENT_TRANSACTION.
  if ( TRANSACTION_STACK_ITEM-TRANSACTION ne E_TRANSACTION ).

*   * Did someone skip a transaction?
    read table UNDO_TRANSACTION_STACK into TRANSACTION_STACK_ITEM
         with key TRANSACTION = E_TRANSACTION.
    if ( sy-subrc = 0 ).

      UM_CURRENT_TRANSACTION = sy-tabix.

    else." ( Found no entry)

*     * There is no entry on the transaction stack for this transaction
      exit.

    endif. "( Transaction Entry found )

  endif. "( not the same transaction )

* * 2. check if there are entries on the UNDO_INFO stack
  if ( TRANSACTION_STACK_ITEM-PM_INDEX < PM_NEXT_UNDO_INFO ).

*   * 3. process all entries on UNDO_INFO stack made since
*   *    E_TRANSACTION started:
    INDEX_FROM = TRANSACTION_STACK_ITEM-PM_INDEX.
    INDEX_TO   = PM_NEXT_UNDO_INFO - 1.

    loop at PM_UNDO_INFO assigning <FS_UNDO_INFO_ITEM>
         from INDEX_FROM to INDEX_TO.

*     * 3a. Check if this object has already been processed
      read table PROCESSED_OBJECTS
           with key OBJECT_ID = <FS_UNDO_INFO_ITEM>-OBJECT_ID
           transporting no fields.

*     * If there is a entry, we already processed it. skip it.
      if ( sy-subrc = 0 ).
        continue.
      endif.

*     * 3b. get corresponding entry from OBJECT_INFO
      read table OBJECT_INFO into OBJECT_INFO_ITEM
           with key OBJECT_ID = <FS_UNDO_INFO_ITEM>-OBJECT_ID.
      if ( sy-subrc = 0 ).

*       * Remember this entry for later
        OBJECT_INFO_INDEX = sy-tabix.
        append OBJECT_INFO_INDEX to INDEX_LIST.

*       * 3c. Copy UNDO_INFO to OBJECT_INFO and mark object as processed
        move-corresponding <FS_UNDO_INFO_ITEM> to OBJECT_INFO_ITEM.
        PROCESSED_OBJECT_ITEM-OBJECT_ID = <FS_UNDO_INFO_ITEM>-OBJECT_ID.
        insert PROCESSED_OBJECT_ITEM into table PROCESSED_OBJECTS.

*       * 3d. set state of the object using SET or INVALIDATE

*       * No attributes?
        if ( <FS_UNDO_INFO_ITEM>-STATE_OBJECT is initial ).

          append <FS_UNDO_INFO_ITEM>-OBJECT_IREF to INVALIDATE_TAB.

*         * if the object is re-set to the state 'not loaded', garbage
*         * collection must be enabled by removing the strong reference
          if ( OBJECT_INFO_ITEM-PM_STATUS =
                       OSCON_OSTATUS_NOT_LOADED ).
            clear OBJECT_INFO_ITEM-OBJECT_IREF.
          endif. "( Status NOT LOADED )

        else." (there are attributes)

*         * An object with attributes has to be reset to the state in
*         * undo_info and is still undo relevant.

          call method <FS_UNDO_INFO_ITEM>-OBJECT_IREF->SET
               exporting I_STATE = <FS_UNDO_INFO_ITEM>-STATE_OBJECT.

        endif." ( attributes?)

        modify OBJECT_INFO from OBJECT_INFO_ITEM
               index OBJECT_INFO_INDEX.

      endif. "(entry exists)

    endloop. "at PM_UNDO_INFO

    call method MAP_INVALIDATE
         exporting I_OBJECT_IREF_TAB = INVALIDATE_TAB.

*   * 4. Update Subscriptions
    call method SM_UPDATE_SUBSCRIPTIONS
         exporting I_INDEX_TAB = INDEX_LIST.

  endif. "(Something to undo)

* * 5. call subclass extension
  call method EXT_UM_UNDO
       exporting I_INDEX_TAB = INDEX_LIST.

* * 6. Last Transaction to be ended?
  if ( UM_CURRENT_TRANSACTION = 1 ).

*   * 6a. clear Undo Info
    clear: PM_UNDO_INFO,
           UNDO_TRANSACTION_STACK,
           UM_CURRENT_TRANSACTION,
           PM_NEXT_UNDO_INFO,
           EXT_NEXT_UNDO_INFO.

*   * 6b. un-subscribe by resetting UM_SUB_WRITE
    loop at OBJECT_INFO assigning <FS_OBJECT_INFO_ITEM>
         where UM_SUB_WRITE = OSCON_TRUE.

      <FS_OBJECT_INFO_ITEM>-UM_SUB_WRITE = OSCON_FALSE.
    endloop." at OBJECT_INFO

  else." ( there are still one or more transactions left )

*   * 7. delete entry from transaction stack, set UM_CURRENT_TRANSACTION
    delete UNDO_TRANSACTION_STACK index UM_CURRENT_TRANSACTION.
    UM_CURRENT_TRANSACTION = UM_CURRENT_TRANSACTION - 1.

  endif. "( Last transaction? )

endmethod. "UM_UNDO
ENDCLASS.