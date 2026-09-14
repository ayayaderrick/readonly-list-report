@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Flight View - CDS Data Model'
@Metadata.ignorePropagatedAnnotations: true
define view entity ZFLIGHT_I_FLIGHT_R
  as select from /dmo/flight as Flight
  association [1] to /DMO/I_Carrier as _Airline on $projection.AirlineId = _Airline.AirlineID
{
      @ObjectModel.text.association: '_Airline'
  key carrier_id     as AirlineId,

  key connection_id  as ConnectionId,
  key flight_date    as FlightDate,

      @Semantics.amount.currencyCode: 'CurrencyCode'
      price          as Price,
      currency_code  as CurrencyCode,
      plane_type_id  as PlaneType,
      seats_max      as MaximumSeats,
      seats_occupied as OccupiedSeats,

      _Airline
}
