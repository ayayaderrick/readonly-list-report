@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Connection View'
@Metadata.ignorePropagatedAnnotations: true
define view entity ZFLIGHT_I_CONNECTION_R
  as select from /dmo/connection as Connection
  association [1..*] to ZFLIGHT_I_FLIGHT_R as _Flight      on  $projection.AirlineId    = _Flight.AirlineId
                                                           and $projection.ConnectionId = _Flight.ConnectionId
  association [1]    to /DMO/I_Carrier     as _Airline     on  $projection.AirlineId = _Airline.AirlineID
  association [1]    to /DMO/I_Airport     as _AirportFrom on  $projection.DepartureAirport = _AirportFrom.AirportID
  association [1]    to /DMO/I_Airport     as _AirportTo   on  $projection.DestinationAirport = _AirportTo.AirportID
{
      @ObjectModel.text.association: '_Airline'
  key carrier_id      as AirlineId,
  key connection_id   as ConnectionId,

      @ObjectModel.text.association: '_AirportFrom'
      airport_from_id as DepartureAirport,

      @ObjectModel.text.association: '_AirportTo'
      airport_to_id   as DestinationAirport,

      departure_time  as DepartureTime,
      arrival_time    as ArrivalTime,

      @Semantics.quantity.unitOfMeasure: 'DistanceUnit'
      distance        as Distance,
      distance_unit   as DistanceUnit,

      _Flight,
      _Airline,
      _AirportFrom,
      _AirportTo
}
