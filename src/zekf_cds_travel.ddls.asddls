@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Data Definition for table Travel'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
define view entity ZEKF_CDS_TRAVEL

  // Declaration with PARAMETERS and SELECT-OPTIONS
  with parameters
    stat          : /dmo/travel_status,
    //SELECT-OPTIONS needs the low and high values
    travelId_low  : /dmo/travel_id,
    travelId_high : /dmo/travel_id

  //    {
  //    // Alias can be defined here in header level, instead of the option below at field level
  //    TravelId,
  //    AgencyId,
  //    CustomerId,
  //
  //    etc...
  //    }

  as select from /dmo/travel
{
  key travel_id     as TravelId,
      agency_id     as AgencyId,
      customer_id   as CustomerId,
      begin_date    as BeginDate,
      end_date      as EndDate,
      @Semantics.amount.currencyCode: 'CurrencyCode'
      booking_fee   as BookingFee,
      @Semantics.amount.currencyCode: 'CurrencyCode'
      total_price   as TotalPrice,
      currency_code as CurrencyCode,
      description   as Description,
      status        as Status,
      createdby     as Createdby,
      createdat     as Createdat,
      lastchangedby as Lastchangedby,
      lastchangedat as Lastchangedat
}

//  // We can define where clause here
//  where
//     status = 'B'
//     or status = 'N'



// Or we can define the where clause with the parameter data.
// It will open a popup to get the parameter data. It's case sensitive.
where
      status    = $parameters.stat
  // These are the select-options values
  and travel_id between $parameters.travelId_low and $parameters.travelId_high
