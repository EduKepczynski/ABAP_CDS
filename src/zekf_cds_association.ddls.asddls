@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'CDS View using Association'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
define view entity ZEKF_CDS_ASSOCIATION
  as select from /dmo/travel as T
  association [1..1] to /dmo/customer as _toCust on T.customer_id = _toCust.customer_id
{
  key travel_id   as TravelId,
      agency_id   as AgencyId,
      customer_id as CustomerId,
      begin_date  as BeginDate,
      end_date    as EndDate,

      _toCust //Make this association public
}
