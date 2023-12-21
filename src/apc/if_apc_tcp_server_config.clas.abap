interface IF_APC_TCP_SERVER_CONFIG
  public .


  methods ON_CONNECTION_SETUP
    importing
      !I_INITIAL_REQUEST type ref to IF_APC_WSP_INITIAL_REQUEST
    exporting
      !E_FRAME type APC_TCP_FRAME .
	  
endinterface.