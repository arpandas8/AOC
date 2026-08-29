@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'processor Supplement'
@Metadata.ignorePropagatedAnnotations: false
@VDM.viewType: #CONSUMPTION
define view entity ZATS_AR_M_BOOKSUPPL_PROCESSOR as projection on ZATS_AR_M_BOOKSUPPL
{
    key TravelId,
    key BookingId,
    key BookingSupplementId,
    SupplementId,
    Price,
    CurrencyCode,
    LastChangedAt,
    /* Associations */
    _Booking: redirected to parent ZATS_AR_M_BOOKING_PROCESSOR,
    _product,
    _producttext,
    _Travel: redirected to ZATS_AR_M_TRAVEL_PROCESSOR
}
