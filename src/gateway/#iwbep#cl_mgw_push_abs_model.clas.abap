class /IWBEP/CL_MGW_PUSH_ABS_MODEL definition
  public
  inheriting from /IWBEP/CL_MGW_ABS_MODEL
  create public .

*"* public components of class /IWBEP/CL_MGW_PUSH_ABS_MODEL
*"* do not include other source files here!!!
public section.

  constants GC_ENT_TYPE_NOTIFICATION type STRING value 'Notification'. "#EC NOTEXT
  constants GC_ENT_TYPE_SUBSCRIPTION type STRING value 'Subscription'. "#EC NOTEXT

  methods DEFINE
    redefinition .
protected section.
*"* protected components of class /IWBEP/CL_MGW_PUSH_ABS_MODEL
*"* do not include other source files here!!!
private section.
*"* private components of class /IWBEP/CL_MGW_PUSH_ABS_MODEL
*"* do not include other source files here!!!
ENDCLASS.



CLASS /IWBEP/CL_MGW_PUSH_ABS_MODEL IMPLEMENTATION.


METHOD define.

  DATA:
        lo_data_object  TYPE REF TO /iwbep/if_mgw_odata_entity_typ,
        lo_do_conv      TYPE REF TO /iwbep/if_mgw_odata_etype_conv,
        lo_property     TYPE REF TO /iwbep/if_mgw_odata_property.
*        lo_action       TYPE REF TO /iwbep/if_mgw_odata_action,
*        lo_parameter    TYPE REF TO /iwbep/if_mgw_odata_parameter.

  lo_data_object = model->create_entity_type( 'Subscription' ). "#EC NOTEXT
  lo_data_object->set_creatable( abap_true ).
  lo_data_object->set_updatable( abap_true ).
  lo_data_object->set_deletable( abap_true ).

  " todo consumer type + connectivity server
  lo_do_conv ?=  lo_data_object.

  lo_do_conv->create_properties(
     iv_comma_sep_abap_names =
      'ID,USERNAME,CHANGED_TIMESTMP,TITLE,DELIVERY_ADDRESS,PERSIST_NOTIF,COLLECTION_NAME,FILTER_PARAMETER,SELECT_PARAMETER,CHANGE_TYPE'
     iv_comma_sep_ext_names =
      'ID,user,updated,title,deliveryAddress,persistNotifications,collection,filter,select,changeType'
  ).

  lo_data_object->bind_structure( '/IWBEP/S_MGW_SUB_DATA' ).
  lo_property =  lo_data_object->get_property( 'ID' ).
  lo_property->set_is_key( ).
  lo_property->set_creatable( abap_false ).
  lo_property->set_updatable( abap_false ).
  lo_property->set_filterable( abap_false ).

  lo_property = lo_data_object->get_property( 'updated' ).
  lo_property->set_as_updated( abap_false ).
  lo_property->set_creatable( abap_false ).
  lo_property->set_filterable( abap_false ).

  lo_property = lo_data_object->get_property( 'user' ).
  lo_property->set_as_author( abap_false ).
  lo_property->set_creatable( abap_false ).
  lo_property->set_filterable( abap_false ).

  lo_property = lo_data_object->get_property( 'title' ).
  lo_property->set_as_title( abap_false ).
  lo_property->set_creatable( ).
  lo_property->set_updatable( ).
  lo_property->set_filterable( abap_false ).

  lo_property = lo_data_object->get_property( 'deliveryAddress' ).
  lo_property->set_creatable( ).
  lo_property->set_updatable( ).
  lo_property->set_filterable( abap_false ).

  lo_property = lo_data_object->get_property( 'persistNotifications' ).
  lo_property->set_creatable( ).
  lo_property->set_updatable( ).
  lo_property->set_filterable( abap_false ).

  lo_property = lo_data_object->get_property( 'collection' ).
  lo_property->set_creatable( ).
  lo_property->set_updatable( ).
  lo_property->set_filterable( abap_false ).

  lo_property = lo_data_object->get_property( 'filter' ).
  lo_property->set_creatable( ).
  lo_property->set_updatable( ).
  lo_property->set_filterable( abap_false ).

  lo_property = lo_data_object->get_property( 'select' ).
  lo_property->set_creatable( ).
  lo_property->set_updatable( ).
  lo_property->set_filterable( abap_false ).

  lo_property = lo_data_object->get_property( 'changeType' ).
  lo_property->set_creatable( ).
  lo_property->set_updatable( ).

*------set semantics
  lo_data_object->set_semantic( 'subscriptions' ).

**-----Function import for Create Subscription in all backend systems
*  lo_action = model->create_action( iv_action_name = 'CreateSubscriptionInAllSystems' ).
*  lo_action->set_action_for( 'Subscription' ).              "#EC NOTEXT
*
*  lo_action->set_return_entity_type( iv_data_object_name = 'Subscription' ). "#EC NOTEXT
*  lo_action->set_return_multiplicity( iv_cardinality = /iwbep/cl_mgw_abs_model=>cardinality_feed ). "Cardinality 0:N
*  lo_action->set_http_method( 'POST' ).
*
*  lo_parameter = lo_action->create_input_parameter( iv_parameter_name = 'title' iv_abap_fieldname = 'TITLE').
*  lo_parameter->bind_data_element( '/IWBEP/MGW_SUB_TITLE' ).
*
*  lo_parameter = lo_action->create_input_parameter( iv_parameter_name = 'deliveryAddress' iv_abap_fieldname = 'DELIVERY_ADDRESS').
*  lo_parameter->bind_data_element( '/IWBEP/MGW_SUB_DELVERY_ADDRESS' ).
*
*  lo_parameter = lo_action->create_input_parameter( iv_parameter_name = 'persistNotifications' iv_abap_fieldname = 'PERSIST_NOTIF').
*  lo_parameter->bind_data_element( '/IWBEP/MGW_SUB_PERSIST_NOTIF' ).
*
*  lo_parameter = lo_action->create_input_parameter( iv_parameter_name = 'collection' iv_abap_fieldname = 'COLLECTION_NAME').
*  lo_parameter->bind_data_element( '/IWBEP/MGW_SUB_COLLECTION' ).
*
*  lo_parameter = lo_action->create_input_parameter( iv_parameter_name = 'filter' iv_abap_fieldname = 'FILTER_PARAMETER').
*  lo_parameter->bind_data_element( '/IWBEP/MGW_SUB_FILTER' ).
*
*  lo_parameter = lo_action->create_input_parameter( iv_parameter_name = 'select' iv_abap_fieldname = 'SELECT_PARAMETER').
*  lo_parameter->bind_data_element( '/IWBEP/MGW_SUB_SELECT' ).
*
*  lo_parameter = lo_action->create_input_parameter( iv_parameter_name = 'changeType' iv_abap_fieldname = 'CHANGE_TYPE').
*  lo_parameter->bind_data_element( '/IWBEP/MGW_SUB_ENT_CHANGE_TYPE' ).


* ------Notification----------------------------------------------------------------------
  lo_data_object = model->create_entity_type( 'Notification' ). "#EC NOTEXT
  lo_data_object->set_creatable( abap_false ).
  lo_data_object->set_updatable( abap_false ).
  lo_data_object->set_deletable( abap_false ).
  lo_data_object->set_addressable( abap_false ).

  lo_do_conv ?=  lo_data_object.

  lo_do_conv->create_properties(
     iv_comma_sep_abap_names =
      'ID,COLLECTION,TEXT,UPDATED,OPERATION_TYPE,ENTRIES_OF_INTEREST'
     iv_comma_sep_ext_names =
      'ID,collection,title,updated,changeType,entriesOfInterest'
  ).
  lo_data_object->bind_structure( '/IWBEP/S_MGW_NOTIF_DATA' ).

  lo_property = lo_data_object->create_property( 'recipient' ).
  lo_property->set_creatable( abap_false ).
  lo_property->set_updatable( abap_false ).
  lo_property->bind_data_element( '/IWBEP/MGW_NOTIF_RECIPIENT' ).

  lo_property =  lo_data_object->get_property( 'ID' ).
  lo_property->set_is_key( ).

  lo_property = lo_data_object->get_property( 'title' ).
  lo_property->set_as_title( abap_false ).

  lo_property = lo_data_object->get_property( 'updated' ).
  lo_property->set_as_updated( abap_false ).

*-set semantics
  lo_data_object->set_semantic( 'notifications' ).

ENDMETHOD.
ENDCLASS.