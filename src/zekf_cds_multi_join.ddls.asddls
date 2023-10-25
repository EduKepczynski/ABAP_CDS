@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'CDS View using Multiple Joins'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
define view entity ZEKF_CDS_MULTI_JOIN
  as select from     /dmo/agency   as A
    right outer join /dmo/travel   as T on T.agency_id = A.agency_id
    inner join       /dmo/customer as C on T.customer_id = C.customer_id
    inner join       /dmo/booking  as B on T.travel_id = B.travel_id

{
  coalesce( A.agency_id, 'ID not found' ) as Agency_Id,
  coalesce( A.name, 'Name not found')     as Agency_Name,

  T.travel_id                             as Travel_Id,
  @Semantics.amount.currencyCode: 'Currency_Code'
  T.total_price                           as Total_Price,
  T.currency_code                         as Currency_Code,

  C.customer_id                           as Customer_Id,
  C.first_name                            as First_Name,
  C.last_name                             as Last_Name,

  B.booking_id                            as Booking_Id,
  B.flight_date                           as Flight_Date
}
