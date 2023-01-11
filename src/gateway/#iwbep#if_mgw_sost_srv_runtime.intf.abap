*"* components of interface /IWBEP/IF_MGW_SOST_SRV_RUNTIME
"! <p class="shorttext synchronized" lang="en">SAP Gateway Application Interface for Soft-state</p>
interface /IWBEP/IF_MGW_SOST_SRV_RUNTIME
  public .


  constants:
    BEGIN OF gcs_termination_reason,
      timeout     TYPE i VALUE 1,   "HTTP Session Timeout
      by_consumer TYPE i VALUE 2,   "Consumer has terminated the session
    END OF gcs_termination_reason .

  "! <p class="shorttext synchronized" lang="en">Called before an APPS operation if soft-state mode is active</p>
  "!
  "! @raising   /iwbep/cx_mgw_tech_exception | <p class="shorttext synchronized" lang="en">Technical Exception</p>
  methods OPERATION_START
    importing
      !IV_IS_FIRST_REQUEST type ABAP_BOOL optional
      !IV_IS_LAST_REQUEST type ABAP_BOOL optional
    raising
      /IWBEP/CX_MGW_TECH_EXCEPTION .
  "! <p class="shorttext synchronized" lang="en">Called after an APPS operation if soft-state mode is active</p>
  "!
  "! @raising   /iwbep/cx_mgw_tech_exception | <p class="shorttext synchronized" lang="en">Technical Exception</p>
  methods OPERATION_END
    raising
      /IWBEP/CX_MGW_TECH_EXCEPTION .
  "! <p class="shorttext synchronized" lang="en">Reset of the data provider - Clean up the appl session!</p>
  "!
  "! @raising   /iwbep/cx_mgw_tech_exception | <p class="shorttext synchronized" lang="en">Technical Exception</p>
  methods RESET_DP
    raising
      /IWBEP/CX_MGW_TECH_EXCEPTION .
endinterface.