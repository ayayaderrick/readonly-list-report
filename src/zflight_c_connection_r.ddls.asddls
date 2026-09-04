@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Connection Consumption View'
@Metadata.ignorePropagatedAnnotations: true
define view entity ZFLIGHT_C_CONNECTION_R
  as select from ZFLIGHT_I_CONNECTION_R
{
  key CarrierId,
  key ConnectionId,
      AirportFromId,
      AirportToId,
      DepartureTime,
      ArrivalTime,
      Distance,
      DistanceUnit
}
