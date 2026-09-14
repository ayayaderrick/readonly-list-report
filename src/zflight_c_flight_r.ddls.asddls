@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Flight Consumption View'
@Metadata.ignorePropagatedAnnotations: true
@Metadata.allowExtensions: true

@Search.searchable: true

define view entity ZFLIGHT_C_FLIGHT_R
  as select from ZFLIGHT_I_FLIGHT_R
{
      @Search.defaultSearchElement: true
      @ObjectModel.text.element: [ 'AirlineName' ]
  key AirlineId,
  key ConnectionId,
  key FlightDate,

      _Airline.Name as AirlineName,

      @Semantics.amount.currencyCode: 'CurrencyCode'
      Price,
      CurrencyCode,

      @Search.defaultSearchElement: true
      @Search.fuzzinessThreshold: 0.7
      PlaneType,
      MaximumSeats,
      OccupiedSeats,
      OccupiedSeats as OccupiedSeatsForChart,

      _Airline
}
