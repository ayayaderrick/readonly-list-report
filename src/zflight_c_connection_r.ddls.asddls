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
      @ObjectModel.text.element: [ 'AirlineName' ]
  key AirlineId,

  key ConnectionId,

      _Airline.Name                                                  as AirlineName,

      concat( concat( AirlineId, '-' ), ltrim( ConnectionId, '0' ) ) as ConnectionTitle,

      @ObjectModel.text.element: [ 'DepartureAirportName' ]
      DepartureAirport,
      _AirportFrom.Name                                              as DepartureAirportName,

      @ObjectModel.text.element: [ 'DestinationAirportName' ]
      DestinationAirport,
      _AirportTo.Name                                                as DestinationAirportName,

      DepartureTime,
      ArrivalTime,
      Distance,
      DistanceUnit,

      _Flight,
      _Airline,
      _AirportFrom,
      _AirportTo
}
