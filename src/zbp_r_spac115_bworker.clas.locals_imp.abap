CLASS lhc_ZR_SPAC115_BWorker DEFINITION INHERITING FROM cl_abap_behavior_handler.
  PRIVATE SECTION.

    METHODS get_instance_authorizations FOR INSTANCE AUTHORIZATION
      keys REQUEST requested_authorizations FOR ZR_SPAC115_BWorker RESULT result.

ENDCLASS.

CLASS lhc_ZR_SPAC115_BWorker IMPLEMENTATION.

  METHOD get_instance_authorizations.
  ENDMETHOD.

ENDCLASS.
