INTERFACE if_ex_cts_request_check
  PUBLIC .


  METHODS check_before_creation
    IMPORTING
      !type       TYPE trfunction
      !tool_flag  TYPE char1 DEFAULT ' '
    CHANGING
      !text       TYPE as4text
      !attributes TYPE scts_attrs
    EXCEPTIONS
      cancel .
  METHODS check_before_release
    IMPORTING
      !request    TYPE trkorr OPTIONAL
      !type       TYPE trfunction OPTIONAL
      !owner      TYPE tr_as4user OPTIONAL
      !objects    TYPE tr_objects OPTIONAL
      !keys       TYPE tr_keys OPTIONAL
      !keys_str   TYPE e071k_strtyp OPTIONAL
      !dialog     TYPE trboolean OPTIONAL
      !tarsystem  TYPE tr_target OPTIONAL
      !adt        TYPE trboolean OPTIONAL
    CHANGING
      !text       TYPE as4text OPTIONAL
      !attributes TYPE trattributes OPTIONAL
    EXCEPTIONS
      cancel .
  METHODS check_before_changing_owner
    IMPORTING
      !request   TYPE trkorr
      !type      TYPE trfunction
      !old_owner TYPE tr_as4user
      !new_owner TYPE tr_as4user
    EXCEPTIONS
      cancel .
  METHODS check_before_add_objects
    IMPORTING
      !request    TYPE trkorr OPTIONAL
      !type       TYPE trfunction OPTIONAL
      !owner      TYPE tr_as4user OPTIONAL
      !objects    TYPE tr_objects OPTIONAL
      !keys       TYPE tr_keys OPTIONAL
      !dialog     TYPE trboolean OPTIONAL
      !is_gtabkey TYPE gtabkey OPTIONAL
    CHANGING
      !text       TYPE as4text OPTIONAL
      !attributes TYPE trattributes OPTIONAL
    EXCEPTIONS
      cancel .
  METHODS check_before_release_slin
    IMPORTING
      !request       TYPE trkorr OPTIONAL
      !type          TYPE trfunction OPTIONAL
      !owner         TYPE tr_as4user OPTIONAL
      !objects       TYPE tr_objects OPTIONAL
      !keys          TYPE tr_keys OPTIONAL
      !keys_str      TYPE e071k_strtyp OPTIONAL
      !dialog        TYPE trboolean OPTIONAL
    CHANGING
      !text          TYPE as4text OPTIONAL
      !attributes    TYPE trattributes OPTIONAL
      !lv_current    TYPE c OPTIONAL
      !lv_error_type TYPE trwbo_charflag OPTIONAL
    EXCEPTIONS
      cancel .
ENDINTERFACE.