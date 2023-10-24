CLASS zekf_cl_show_report DEFINITION PUBLIC.

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .

ENDCLASS.

**********************************************************************

CLASS zekf_cl_show_report IMPLEMENTATION.

  METHOD if_oo_adt_classrun~main.

    SELECT *
        FROM zekf_cds_travel
        INTO @DATA(ti_travel)
        UP TO 50 ROWS.
    ENDSELECT.

    out->write( EXPORTING data = ti_travel ).

  ENDMETHOD.

ENDCLASS.



