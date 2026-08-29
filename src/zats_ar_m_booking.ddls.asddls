@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Booking entity as first child of travel'
@Metadata.ignorePropagatedAnnotations: true
@VDM.viewType: #BASIC
define view entity ZATS_AR_M_BOOKING as select from /dmo/booking_m
composition[1..*] of ZATS_AR_M_BOOKSUPPL as _Booksuppl
association to parent ZATR_AR_M_TRAVEL as _Travel on $projection.TravelId  = _Travel.TravelId
association [1] to /DMO/I_Customer as _Customer on $projection.CustomerId  = _Customer.CustomerID
association [1] to /DMO/I_Carrier as _Carrier on $projection.CarrierId  = _Carrier.AirlineID
association [1] to /DMO/I_Connection as _connection 
on $projection.CarrierId = _connection.AirlineID
and $projection.ConnectionId = _connection.ConnectionID      
association [1] to I_Currency as _Currency on $projection.CurrencyCode  = _Currency.Currency
association [1] to /DMO/I_Booking_Status_VH as _Bookstatus on $projection.BookingStatus  = _Bookstatus.BookingStatus

                                              

{
key travel_id as TravelId,
key booking_id as BookingId,
booking_date as BookingDate,
customer_id as CustomerId,
carrier_id as CarrierId,
connection_id as ConnectionId,
flight_date as FlightDate,
@Semantics.amount.currencyCode: 'CurrencyCode'
flight_price as FlightPrice,
currency_code as CurrencyCode,
booking_status as BookingStatus,
last_changed_at as LastChangedAt,
_Customer,
_Carrier,      
_connection,
_Currency,
_Bookstatus,
_Travel,
_booksuppl
}
