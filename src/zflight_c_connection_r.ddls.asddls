@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Connection Consumption View'
@Metadata.ignorePropagatedAnnotations: true
@Metadata.allowExtensions: true

@Search.searchable: true

define view entity ZFLIGHT_C_CONNECTION_R
  as select from ZFLIGHT_I_CONNECTION_R
  association [1..*] to ZFLIGHT_C_FLIGHT_R as _Flight on  $projection.AirlineId    = _Flight.AirlineId
                                                      and $projection.ConnectionId = _Flight.ConnectionId
{
      @Search.defaultSearchElement: true
      @Consumption.valueHelpDefinition: [{ entity: {name: '/DMO/I_Carrier_StdVH', element: 'AirlineID' }}]
      @ObjectModel.text.element: [ 'AirlineName' ]
  key AirlineId,

  key ConnectionId,

      _Airline.Name                                                  as AirlineName,

      concat( concat( AirlineId, '-' ), ltrim( ConnectionId, '0' ) ) as ConnectionTitle,

      @Search.defaultSearchElement: true
      @Search.fuzzinessThreshold: 0.7
      @Consumption.valueHelpDefinition: [{ entity: {name: '/DMO/I_Airport_StdVH', element: 'AirportID' }, useForValidation: true }]
      @ObjectModel.text.element: [ 'DepartureAirportName' ]
      DepartureAirport,
      _AirportFrom.Name                                              as DepartureAirportName,

      @Search.defaultSearchElement: true
      @Search.fuzzinessThreshold: 0.7
      @Consumption.valueHelpDefinition: [{ entity: {name: '/DMO/I_Airport_StdVH', element: 'AirportID' }, useForValidation: true }]
      @ObjectModel.text.element: [ 'DestinationAirportName' ]
      DestinationAirport,
      _AirportTo.Name                                                as DestinationAirportName,

      DepartureTime,
      ArrivalTime,
      Distance,
      DistanceUnit,

      @Search.defaultSearchElement: true
      _Flight,
      _Airline,
      _AirportFrom,
      _AirportTo
}
