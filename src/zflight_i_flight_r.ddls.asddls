@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Flight View - CDS Data Model'
@Metadata.ignorePropagatedAnnotations: true
define view entity ZFLIGHT_I_FLIGHT_R
  as select from /dmo/flight as Flight
{
  key carrier_id     as CarrierId,
  key connection_id  as ConnectionId,
  key flight_date    as FlightDate,
      @Semantics.amount.currencyCode: 'CurrencyCode'
      price          as Price,
      currency_code  as CurrencyCode,
      plane_type_id  as PlaneType,
      seats_max      as MaximumSeats,
      seats_occupied as OccupiedSeats
}
