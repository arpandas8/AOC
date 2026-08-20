@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'salss and product data'
@Metadata.ignorePropagatedAnnotations: false
@VDM.viewType: #COMPOSITE
@Analytics.dataCategory: #CUBE
define view entity ZI_ATS_AR_CO_SALES as select from ZI_ATS_AR_SALES
as sales association of many to one ZI_ATS_AR_PROD as _Product 
on $projection.Product = _Product.ProductId
{
key ItemId,
OrderId,
Product,
Amount,
CurrencyCode,
Qty,
Uom,
/* Associations */
_Header.buyer as Buyer,
_Product.Category as productcategory,
_Product.Name    as productname
}
