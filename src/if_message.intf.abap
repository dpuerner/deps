INTERFACE if_message.

  METHODS get_text RETURNING VALUE(result) TYPE string.

  METHODS get_longtext
    IMPORTING preserve_newlines TYPE abap_bool
    RETURNING VALUE(result) TYPE string.

ENDINTERFACE.
