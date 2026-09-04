@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Connection View'
@Metadata.ignorePropagatedAnnotations: true
define view entity ZFLIGHT_I_CONNECTION_R
  as select from /dmo/connection
  association [1..*] to ZFLIGHT_I_FLIGHT_R as _Flight on  $projection.AirlineId    = _Flight.AirlineId
                                                      and $projection.ConnectionId = _Flight.ConnectionId
{
  key carrier_id      as AirlineId,
  key connection_id   as ConnectionId,
      airport_from_id as DepartureAirport,
      airport_to_id   as DestinationAirport,
      departure_time  as DepartureTime,
      arrival_time    as ArrivalTime,
      @Semantics.quantity.unitOfMeasure: 'DistanceUnit'
      distance        as Distance,
      distance_unit   as DistanceUnit,

      _Flight
}
