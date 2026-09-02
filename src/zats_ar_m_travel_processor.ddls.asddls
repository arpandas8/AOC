@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Root Entity Projection Layer'
@Metadata.ignorePropagatedAnnotations: false
@VDM.viewType: #COMPOSITE
@Metadata.allowExtensions: true
define root view entity ZATS_AR_M_TRAVEL_PROCESSOR as projection on ZATR_AR_M_TRAVEL
{
    key TravelId,
    AgencyID,
    CustomerId,
    BeginDate,
    EndDate,
    BookingFee,
    TotalPrice,
    CurrencyCode,
    Description,
    OverallStatus,
     /* Associations */
    _Agency,
    _Booking: redirected to composition child ZATS_AR_M_BOOKING_PROCESSOR ,
    _Currency,
    _Customer,
    _Overallstatus,
    AgencyName,
    CustomerName,
    StatusText,
    Minion 
}
