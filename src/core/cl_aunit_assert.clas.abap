"! ABAP Unit: Outdated Assertions (see longtext)
class cl_Aunit_Assert definition  public  abstract  create public
  global friends _If_Aunit_Friend_To_Assert.

  public section.
    interfaces if_Aunit_Constants.

    aliases class         for if_Aunit_Constants~class.
    aliases critical      for if_Aunit_Constants~critical.
    aliases fatal         for if_Aunit_Constants~fatal.
    aliases method        for if_Aunit_Constants~method.
    aliases no            for if_Aunit_Constants~no.
    aliases program       for if_Aunit_Constants~program.
    aliases tolerable     for if_Aunit_Constants~tolerable.

    aliases tolerant      for if_Aunit_Constants~tolerant.

    types:
      n1 type n length 1.

    "! Default Tolerance for comparison type F
    constants rtol_Default type f value '1.E-14' ##no_Text.
    "! Default tolerance for comparison type "Decfloat"
    constants rtol_Default_Df34 type decfloat34 value '1.E-14' ##no_Text.


    "! Abort test Execution due to Missing Context
    "!
    "! @parameter msg    | Error Message
    "! @parameter detail | Detailed Message
    "! @parameter quit   | Flow Control in Case of Error
    class-methods abort
      importing
        msg type csequence optional
        detail type csequence optional
        quit type aunit_Flowctrl default cl_Aunit_Assert=>class
      preferred parameter msg.
    type-pools abap.

    "! Ensure the validity of the reference
    "!
    "! @parameter act              | Reference variable to be checked
    "! @parameter msg              | Error message
    "! @parameter level            | Error severity
    "! @parameter quit             | Flow Control in Case of Error
    "! @parameter assertion_Failed | Condition not met
    class-methods assert_Bound
      importing   act type any
                  msg type csequence optional
                  level type aunit_Level default critical
                  quit type aunit_Flowctrl default method
      returning   value(assertion_Failed) type abap_Bool.

    "! Ensure that Character String Fits to Simple Pattern
    "!
    "! @parameter act              | Actual Object
    "! @parameter exp              | Expected Template
    "! @parameter msg              | Message in Case of Error
    "! @parameter level            | Error Severity
    "! @parameter quit             | Flow Control in Case of Error
    "! @parameter assertion_Failed | Condition not met
    class-methods
      assert_Char_Cp
        importing     act type csequence
                      exp type csequence
                      msg type csequence optional
                      level type aunit_Level default critical
                      quit type aunit_Flowctrl default method
      returning       value(assertion_Failed) type abap_Bool.

    "! Ensure that Character String does not fit to Simple Pattern
    "!
    "! @parameter act              | Actual Object
    "! @parameter exp              | Template Expected must Not adhere
    "! @parameter msg              | Message in Case of Error
    "! @parameter level            | Error Severity
    "! @parameter quit             | Flow Control in Case of Error
    "! @parameter assertion_Failed | Condition not met
    class-methods
      assert_Char_Np
        importing act type csequence
                  exp type csequence
                  msg type csequence optional
                  level type aunit_Level default critical
                  quit type aunit_Flowctrl default method
      returning   value(assertion_Failed) type abap_Bool.

    "! Ensure Difference between 2 (Elementary) data Objects
    "!
    "! @parameter exp              | Compare Object with Unexpected Value
    "! @parameter act              | Data Object with Current Value
    "! @parameter msg              | Message in Case of Error
    "! @parameter level            | Error Severity
    "! @parameter tol              | Tolerance Range for Floating Point Numbers
    "! @parameter quit             | Flow Control in Case of Error
    "! @parameter assertion_Failed | Condition not met
    class-methods
      assert_Differs
        importing exp type simple
                  act type simple
                  msg type csequence optional
                  level type aunit_Level default critical
                  tol type f optional
                  quit type aunit_Flowctrl default method
      returning   value(assertion_Failed) type abap_Bool.

    "! Ensure Equality of 2 data Objects
    "!
    "! @parameter exp                  | Data Object with Expected Type
    "! @parameter act                  | Data Object with Current Value
    "! @parameter msg                  | Message in Case of Error
    "! @parameter level                | Error Severity
    "! @parameter tol                  | Tolerance Range for Floating Point Numbers
    "! @parameter quit                 | Flow Control in Case of Error
    "! @parameter ignore_Hash_Sequence | Ignore change sequence in hash tables
    "! @parameter assertion_Failed     | Condition not met
    class-methods
      assert_Equals
        importing     exp type any
                      act type any
                      msg type csequence optional
                      level type aunit_Level default critical
                      tol type f optional
                      quit type aunit_Flowctrl default method
                      ignore_Hash_Sequence type abap_Bool default abap_False
        returning     value(assertion_Failed) type abap_Bool.

    "! Ensure Approximate Consistency of 2 Numbers of Type F
    "!
    "! @parameter exp              | Data Object with Expected Value
    "! @parameter act              | Data Object with Current Value
    "! @parameter msg              | Message in Case of Error
    "! @parameter rtol             | Relative Tolerance
    "! @parameter level            | Error Severity
    "! @parameter quit             | Flow Control in Case of Error
    "! @parameter assertion_Failed | Condition Not Met
    class-methods
      assert_Equals_F
        importing     exp type f
                      act type f
                      msg type csequence optional
                      rtol type f default cl_Aunit_Assert=>rtol_Default
                      level type aunit_Level default critical
                      quit type aunit_Flowctrl default method
        returning     value(assertion_Failed) type abap_Bool.

    "! Ensure Approximate Consistency of 2 Floating Point Numbers
    "!
    "! @parameter exp              | Data Object with Expected Value
    "! @parameter act              | Data Object with Current Value
    "! @parameter msg              | Message in Case of Error
    "! @parameter rtol             | Relative Tolerance
    "! @parameter level            | Error Severity
    "! @parameter quit             | Flow Control in Case of Error
    "! @parameter assertion_Failed | Condition Not Met
    class-methods
      assert_Equals_Float
        importing     exp type numeric
                      act type numeric
                      msg type csequence optional
                      rtol type numeric default cl_Aunit_Assert=>rtol_Default
                      level type aunit_Level default critical
                      quit type aunit_Flowctrl default method
        returning     value(assertion_Failed) type abap_Bool.

    "! Ensure that data Object has its Initial Value
    "!
    "! @parameter act              | Actual Data Object
    "! @parameter msg              | Message in Case of Error
    "! @parameter level            | Error Severity
    "! @parameter quit             | Flow Control in Case of Error
    "! @parameter assertion_Failed | Condition not met
    class-methods
      assert_Initial
        importing     act type any
                      msg type csequence optional
                      level type aunit_Level default critical
                      quit type aunit_Flowctrl default method
        returning     value(assertion_Failed) type abap_Bool.

    "! Ensure Invalidity of the Reference of a Reference Variable
    "!
    "! @parameter act              | Reference Variable to Be Checked
    "! @parameter msg              | Error Message
    "! @parameter level            | Error Severity
    "! @parameter quit             | Flow Control in Case of Error
    "! @parameter assertion_Failed | Condition not met
    class-methods
      assert_Not_Bound
        importing         act type any
                          msg type csequence optional
                          level type aunit_Level default critical
                          quit type aunit_Flowctrl default method
        returning         value(assertion_Failed) type abap_Bool.

    "! Ensure that Data Object does NOT have its Initial Value
    "!
    "! @parameter act              | Actual Data Object
    "! @parameter msg              | Message in Case of Error
    "! @parameter level            | Error Severity
    "! @parameter quit             | Flow Control in Case of Error
    "! @parameter assertion_Failed | Condition not met
    class-methods
      assert_Not_Initial
        importing     act type any
                      msg type csequence optional
                      level type aunit_Level default critical
                      quit type aunit_Flowctrl default method
        returning     value(assertion_Failed) type abap_Bool.

    "! Ensure Specific Value of Return code
    "!
    "! @parameter exp              | Expected return code, optional, if not zero
    "! @parameter act              | Actual Return Code Value, e.g. sy-subrc
    "! @parameter msg              | Message in Case of Error
    "! @parameter level            | Error Severity
    "! @parameter quit             | Flow Control in Case of Error
    "! @parameter symsg            | System Message
    "! @parameter assertion_Failed | Condition not met
    class-methods
      assert_Subrc
        importing     value(exp) type sysubrc default 0
                      value(act) type sysubrc
                      msg type csequence optional
                      level type aunit_Level default critical
                      quit type aunit_Flowctrl default method
                      symsg type symsg optional
        returning     value(assertion_Failed) type abap_Bool.

    "! Ensure that a Constraint is met by data Object
    "!
    "! @parameter act   | Data Object which should Adhere to Constraint
    "! @parameter exp   | Constraint Data Object needs to Adhere
    "! @parameter msg   | Message in Case of Error
    "! @parameter level | Error Severity
    "! @parameter quit  | Flow Control in Case of Error
    class-methods
      assert_That
        importing     act type data
                      exp type ref to if_Constraint
                      msg type csequence optional
                      level type aunit_Level default critical
                      quit type aunit_Flowctrl default method
        returning     value(assertion_Failed) type abap_Bool.

    "! Report Unconditional Error
    "!
    "! @parameter msg    | Error Message
    "! @parameter level  | Error Severity
    "! @parameter quit   | Flow Control in Case of Error
    "! @parameter detail | Detailed Message
    class-methods
      fail
        importing     msg type csequence optional
                      level type aunit_Level default critical
                      quit type aunit_Flowctrl default method
                      detail type csequence optional
        preferred parameter msg.

  protected section.
    " -----

  private section.
    "! Minimum Tolerance for comparison type F
    constants rtol_Min type f value '1.E-15' ##no_Text.
    "! Minimum Tolerance for comparison type F
    constants rtol_Min_Df34 type decfloat34 value '1.E-15' ##no_Text.
    "! Number of Invocations
    class-data fg_Num_Called type i value 0.

ENDCLASS.



CLASS CL_AUNIT_ASSERT IMPLEMENTATION.


  method abort.
    "delegate to new assertion class
    cl_Abap_Unit_Assert=>abort(
      msg    = msg
      detail = detail
      quit   = quit ).
  endmethod.


  method assert_Bound.
    "delegate to new assertion class
    assertion_Failed =
      cl_Abap_Unit_Assert=>assert_Bound(
        act   = act
        msg   = msg
        level = level
        quit  = quit ).
  endmethod.


  method assert_Char_Cp.
    "delegate to new assertion class
    assertion_Failed = cl_Abap_Unit_Assert=>assert_Char_Cp(
      act   = act
      exp   = exp
      msg   = msg
      level = level
      quit  = quit ).
  endmethod.


  method assert_Char_Np.
    "delegate to new assertion class
    assertion_Failed =
      cl_Abap_Unit_Assert=>assert_Char_Np(
        act   = act
        exp   = exp
        msg   = msg
        level = level
        quit  = quit ).
  endmethod.


  method assert_Differs.
    " Only defined for SIMPLE data types: that is elementary Types
    " including structure with char like fields only

    "delegate to new assertion class
    assertion_Failed = cl_Abap_Unit_Assert=>assert_Differs(
      exp   = exp
      act   = act
      msg   = msg
      level = level
      tol   = tol
      quit  = quit ).
  endmethod.


  method assert_Equals.
    "delegate to new assertion class
    assertion_Failed = cl_Abap_Unit_Assert=>assert_Equals(
      exp                  = exp
      act                  = act
      msg                  = msg
      level                = level
      tol                  = tol
      quit                 = quit
      ignore_Hash_Sequence = ignore_Hash_Sequence ).
  endmethod.


  method assert_Equals_F.
    "delegate to new assertion class
    assertion_Failed = cl_Abap_Unit_Assert=>assert_Equals_Float(
      exp   = exp
      act   = act
      msg   = msg
      rtol  = rtol
      level = level
      quit  = quit ).
  endmethod.


  method assert_Equals_Float.
    "delegate to new assertion class
    assertion_Failed = cl_Abap_Unit_Assert=>assert_Equals_Float(
      exp   = exp
      act   = act
      msg   = msg
      rtol  = rtol
      level = level
      quit  = quit ).
  endmethod.


  method assert_Initial.
    "delegate to new assertion class
    assertion_Failed = cl_Abap_Unit_Assert=>assert_Initial(
      act   = act
      msg   = msg
      level = level
      quit  = quit ).
  endmethod.


  method assert_Not_Bound.
    "delegate to new assertion class
    assertion_Failed = cl_Abap_Unit_Assert=>assert_Not_Bound(
      act   = act
      msg   = msg
      level = level
      quit  = quit ).
  endmethod.


  method assert_Not_Initial.
    "delegate to new assertion class
    assertion_Failed = cl_Abap_Unit_Assert=>assert_Not_Initial(
      act   = act
      msg   = msg
      level = level
      quit  = quit ).
  endmethod.


  method assert_Subrc.
    "delegate to new assertion class
    assertion_Failed = cl_Abap_Unit_Assert=>assert_Subrc(
      exp   = exp
      act   = act
      msg   = msg
      level = level
      quit  = quit
      symsg = symsg ).
  endmethod.


  method assert_That.
    "delegate to new assertion class
    assertion_Failed = cl_Abap_Unit_Assert=>assert_That(
      act   = act
      exp   = exp
      msg   = msg
      level = level
      quit  = quit ).
  endmethod.


  method fail.
    "delegate to new assertion class
    cl_Abap_Unit_Assert=>fail(
      msg    = msg
      level  = level
      quit   = quit
      detail = detail ).
  endmethod.
ENDCLASS.