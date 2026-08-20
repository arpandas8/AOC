@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'sales cube'
@Metadata.ignorePropagatedAnnotations: false
@VDM.viewType: #COMPOSITE
@Analytics.dataCategory: #CUBE
define view entity ZI_ATS_AR_CO_SLS_CUBE as select from ZI_ATS_AR_CO_SALES
association of many to one ZI_ATS_AR_BP as _buinesspartner
on $projection.Buyer = _buinesspartner.BpIduuid
{
key ItemId,
OrderId,
Product,
@DefaultAggregation: #SUM
Amount,
CurrencyCode,
@DefaultAggregation: #SUM
Qty,
Uom,
Buyer,
productcategory,
productname, 
_buinesspartner.CompanyName,
_buinesspartner.Country
}
