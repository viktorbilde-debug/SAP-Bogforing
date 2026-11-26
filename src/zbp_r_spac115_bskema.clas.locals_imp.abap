CLASS lhc_Bog1 DEFINITION INHERITING FROM cl_abap_behavior_handler.
  PRIVATE SECTION.

    METHODS get_instance_authorizations FOR INSTANCE AUTHORIZATION
      keys REQUEST requested_authorizations FOR Bog1 RESULT result.

    METHODS validateD
      FOR VALIDATE ON SAVE
      IMPORTING keys
      FOR Bog1~validateD.


    METHODS validateK
      FOR VALIDATE ON SAVE
      IMPORTING keys
      FOR Bog1~validateK.

    METHODS validateexist
      FOR VALIDATE ON SAVE
      IMPORTING keys
      FOR Bog1~validateexist.

    METHODS GetNameDepar
      FOR DETERMINE ON SAVE
      IMPORTING keys
      FOR Bog1~GetNameDepar.
ENDCLASS.

CLASS lhc_Bog1 IMPLEMENTATION.

  METHOD get_instance_authorizations.
  ENDMETHOD.

  METHOD validateD.
  DATA failed_record   LIKE LINE OF failed-Bog1.
  DATA reported_record LIKE LINE OF reported-Bog1.

  READ ENTITIES OF ZR_SPAC115_BSKEMA IN LOCAL MODE
  ENTITY Bog1
    FIELDS ( Debet )
    WITH CORRESPONDING #(  keys )
    RESULT DATA(Debets).

   LOOP AT Debets INTO DATA(debet).

      IF debet-debet < 0.

      failed_record-%tky = debet-%tky.
      APPEND failed_record TO failed-Bog1.

      reported_record-%tky = debet-%tky.
      reported_record-%msg = new_message(
                      id       = 'ZSPAC115_MESSAGES'
                      number   = '001'
                      severity = ms-error
                      v1       = debet-debet ).

      APPEND reported_record TO reported-Bog1.
      ENDIF.
    ENDLOOP.
  ENDMETHOD.

  METHOD validateK.
  DATA failed_record   LIKE LINE OF failed-Bog1.
  DATA reported_record LIKE LINE OF reported-Bog1.

  READ ENTITIES OF ZR_SPAC115_BSKEMA IN LOCAL MODE
  ENTITY Bog1
    FIELDS ( Kredit )
    WITH CORRESPONDING #(  keys )
    RESULT DATA(Kredits).

   LOOP AT Kredits INTO DATA(kredit).

      IF kredit-kredit < 0.

      failed_record-%tky = kredit-%tky.
      APPEND failed_record TO failed-Bog1.

      reported_record-%tky = kredit-%tky.
      reported_record-%msg = new_message(
                      id       = 'ZSPAC115_MESSAGES'
                      number   = '002'
                      severity = ms-error ).

      APPEND reported_record TO reported-Bog1.
      ENDIF.
    ENDLOOP.
  ENDMETHOD.

  METHOD validateexist.
  DATA failed_record   LIKE LINE OF failed-Bog1.
  DATA reported_record LIKE LINE OF reported-Bog1.

  READ ENTITIES OF ZR_SPAC115_BSKEMA IN LOCAL MODE
  ENTITY Bog1
    FIELDS ( Konto )
    WITH CORRESPONDING #(  keys )
    RESULT DATA(Konti).

   LOOP AT Konti INTO DATA(konto).

      select single
              from zspac115_bkonti
              fields @abap_true
              where konto = @konto-Konto
              into @DATA(exists).

      if exists is initial.

        failed_record-%tky = konto-%tky.
        APPEND failed_record TO failed-Bog1.

        reported_record-%tky = konto-%tky.
        reported_record-%msg = new_message(
                      id       = 'ZSPAC115_MESSAGES'
                      number   = '003'
                      severity = ms-error
                      v1       = konto-Konto ).

      APPEND reported_record TO reported-Bog1.
      ENDIF.
    ENDLOOP.
  ENDMETHOD.

  METHOD GetNameDepar.

  READ ENTITIES OF ZR_SPAC115_BSKEMA IN LOCAL MODE
  ENTITY Bog1
    FIELDS ( WorkId )
    WITH CORRESPONDING #(  keys )
    RESULT DATA(workers).

   LOOP AT workers INTO DATA(worker).

      select single
              from zspac115_bworker
              fields name, department
              where worker_id = @worker-WorkId
              into (@worker-Name, @worker-Department).

      MODIFY workers from worker.
    ENDLOOP.

    DATA workers_upd TYPE table for update ZR_SPAC115_BSKEMA.
    workers_upd = CORRESPONDING #( workers ).

    MODIFY ENTITIES OF ZR_SPAC115_BSKEMA in local mode
      ENTITY Bog1
      update
      fields ( Name Department )
      with workers_upd
      REPORTED data(reported_records).

    reported-bog1 = CORRESPONDING #( reported_records-bog1 ).

  ENDMETHOD.
ENDCLASS.


CLASS lsc_ZR_SPAC115_STOCK DEFINITION INHERITING FROM cl_abap_behavior_saver.
  PROTECTED SECTION.

    METHODS cleanup_finalize REDEFINITION.
    METHODS adjust_numbers REDEFINITION.


ENDCLASS.

CLASS lsc_ZR_SPAC115_STOCK IMPLEMENTATION.


  METHOD cleanup_finalize.
  ENDMETHOD.

  METHOD adjust_numbers.

  DATA post_id_next TYPE int4.

  SELECT MAX( posting_id )
    FROM zspac115_bskema
    INTO @DATA(post_id_max).

  post_id_next = post_id_max.

  LOOP AT mapped-Bog1 ASSIGNING FIELD-SYMBOL(<obs>).

    post_id_next = post_id_next + 1.

    <obs>-%key-PostID = post_id_next.
  ENDLOOP.

ENDMETHOD.
ENDCLASS.
