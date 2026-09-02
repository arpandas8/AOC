@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Booking entity as first child of travel'
@Metadata.ignorePropagatedAnnotations: true
@VDM.viewType: #BASIC
define view entity ZATS_AR_M_BOOKING
  as select from /dmo/booking_m
  composition [1..*] of ZATS_AR_M_BOOKSUPPL   as _Booksuppl
  association     to parent ZATR_AR_M_TRAVEL      as _Travel on  $projection.TravelId = _Travel.TravelId
  association [1] to /DMO/I_Customer          as _Customer   on  $projection.CustomerId = _Customer.CustomerID
  association [1] to /DMO/I_Carrier           as _Carrier    on  $projection.CarrierId = _Carrier.AirlineID
  association [1] to /DMO/I_Connection        as _connection on  $projection.CarrierId    = _connection.AirlineID
                                                             and $projection.ConnectionId = _connection.ConnectionID
  association [1] to I_Currency               as _Currency   on  $projection.CurrencyCode = _Currency.Currency
  association [1] to /DMO/I_Booking_Status_VH as _Bookstatus on  $projection.BookingStatus = _Bookstatus.BookingStatus



{
  key travel_id                                                     as TravelId,
  key booking_id                                                    as BookingId,
      booking_date                                                  as BookingDate,
      @ObjectModel.text.element: ['CustomerName']
      @Consumption.valueHelpDefinition: [
                                   { entity.name:  '/DMO/I_Customer',
                                     entity.element: 'CustomerId'
                                    }
                                         ]

      customer_id                                                   as CustomerId,
      _Customer.LastName                                            as CustomerName,
      @ObjectModel.text.element: ['AirlineName']
   @Consumption.valueHelpDefinition: [
                                { entity.name:  '/DMO/I_Carrier',
                                  entity.element: 'AirlineId'
                                 }
                                      ]
      
      carrier_id                                                    as CarrierId,
      _Carrier.Name                                                 as AirlineName,
       @Consumption.valueHelpDefinition: [
                                { entity.name:  '/DMO/I_Connection',
                                  entity.element: 'ConnectionId',
                                  additionalBinding: [
                                  {
                                  element: 'AirlineId',
                                  localElement: 'CarrierId'                                                
                                  }]
                                 }
                                      ]  
      connection_id                                                 as ConnectionId,
      flight_date                                                   as FlightDate,
      @Semantics.amount.currencyCode: 'CurrencyCode'
            @Consumption.valueHelpDefinition: [
                                   { entity.name:  'I_CURRENCY',
                                     entity.element: 'Currency'
                                    }
                                         ]
      flight_price                                                  as FlightPrice,
      currency_code                                                 as CurrencyCode,
      @ObjectModel.text.element: ['BookingStatusText']
      @Consumption.valueHelpDefinition: [
                                   { entity.name:  '/DMO/I_Booking_Status_VH',
                                     entity.element: 'BookingStatus'
                                    }
                                         ]


      booking_status                                                as BookingStatus,
      _Bookstatus._Text[ Language = $session.system_language ].Text as BookingStatusText,
      last_changed_at                                               as LastChangedAt,
      _Customer,
      _Carrier,
      _connection,
      _Currency,
      _Bookstatus,
      _Travel,
      _Booksuppl
}
