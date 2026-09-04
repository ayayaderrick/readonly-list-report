@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Connection Consumption View'
@Metadata.ignorePropagatedAnnotations: true
@Metadata.allowExtensions: true
define view entity ZFLIGHT_C_CONNECTION_R
  as select from ZFLIGHT_I_CONNECTION_R
  association [1..*] to ZFLIGHT_C_FLIGHT_R as _Flight on  $projection.AirlineId    = _Flight.AirlineId
                                                      and $projection.ConnectionId = _Flight.ConnectionId
{
  key AirlineId,
  key ConnectionId,
      concat( concat( AirlineId, '-' ), ltrim( ConnectionId, '0' ) ) as ConnectionTitle,
      DepartureAirport,
      DestinationAirport,
      DepartureTime,
      ArrivalTime,
      Distance,
      DistanceUnit,

      _Flight
}
