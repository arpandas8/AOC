@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Booking processor'
@Metadata.ignorePropagatedAnnotations: false
@VDM.viewType: #CONSUMPTION
@Metadata.allowExtensions: true
define view entity ZATS_AR_M_BOOKING_PROCESSOR as projection on ZATS_AR_M_BOOKING
{
    key TravelId,
    key BookingId,
    BookingDate,
    CustomerId,
    CarrierId,
    ConnectionId,
    FlightDate,
    FlightPrice,
    CurrencyCode,
    BookingStatus,
    LastChangedAt,
    BookingStatusText,
    CustomerName,
    AirlineName,
    /* Associations */
    _Bookstatus,
    _Booksuppl : redirected to composition child ZATS_AR_M_BOOKSUPPL_PROCESSOR,
    _Carrier,
    _connection,
    _Currency,
    _Customer,
    _Travel: redirected to parent ZATS_AR_M_TRAVEL_PROCESSOR
}
