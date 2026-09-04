@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Flight Consumption View'
@Metadata.ignorePropagatedAnnotations: true
@Metadata.allowExtensions: true
define view entity ZFLIGHT_C_FLIGHT_R
  as select from ZFLIGHT_I_FLIGHT_R
{
  key CarrierId,
  key ConnectionId,
  key FlightDate,
      @Semantics.amount.currencyCode: 'CurrencyCode'
      Price,
      CurrencyCode,
      PlaneTypeId,
      SeatsMax,
      SeatsOccupied
}
