@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Porduct CDS Entty Basic interface dimension'
@Metadata.ignorePropagatedAnnotations: true
@VDM.viewType: #BASIC
@Analytics.dataCategory: #DIMENSION
define view entity ZI_ATS_AR_PROD as select from zats_ar_product
{
key product_id as ProductId,
name as Name,
category as Category,
@Semantics.amount.currencyCode: 'currency'
price as Price,
currency as Currency,
discount as Discount 
}
