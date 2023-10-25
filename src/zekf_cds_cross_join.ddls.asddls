@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'CDS View using CROSS JOIN'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
define view entity ZEKF_CDS_CROSS_JOIN
  as select from /dmo/booking  as B
    cross join   /dmo/customer as C
  // We don't need to specify a common field to join, such as 'on C.customer_id = B.customer_id'
{
      // Left side table
  key C.customer_id                        as Customer_ID,
      C.first_name                         as First_Name,
      C.last_name                          as Last_Name,

      // Right side table
      B.booking_id                         as Booking_ID,
      B.booking_date                       as Booking_Date,
      B.carrier_id                         as Carrier_ID,
      B.connection_id                      as Connection_ID,

      // If, for some reason, any field may have no data, we can show a customized text in it
      // Supposing flight date may be initial, we print 'No Date' on the screen.
      // We use the keyword COALESCE
      coalesce( B.flight_date, 'No Date' ) as Flight_Date
}

// CROSS JOIN fetched a lot of wrong data in this scenario.
// It multiplies the number of rows of both tables.
// Could be used, for example, when you want to join a sales order table with a tax table.
// For every sale order on left table, it will show all the taxes (all the rows) of right table.
