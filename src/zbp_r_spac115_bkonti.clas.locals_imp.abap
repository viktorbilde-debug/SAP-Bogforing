CLASS lhc_ZR_SPAC115_BKONTI DEFINITION INHERITING FROM cl_abap_behavior_handler.
  PRIVATE SECTION.

    METHODS get_instance_authorizations FOR INSTANCE AUTHORIZATION
      keys REQUEST requested_authorizations FOR zr_spac115_bkonti RESULT result.

ENDCLASS.

CLASS lhc_ZR_SPAC115_BKONTI IMPLEMENTATION.

  METHOD get_instance_authorizations.
  ENDMETHOD.

ENDCLASS.
