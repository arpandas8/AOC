@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Consumtion view of total quantity'
@Metadata.ignorePropagatedAnnotations: false
@VDM.viewType: #CONSUMPTION
@Analytics.query: true
define view entity ZC_ATS_AR_TOT_QUAN as select from ZI_ATS_AR_CO_SLS_CUBE
{
@EndUserText.label: 'Spiderman'
    key productcategory,
@EndUserText.label: 'Customer'
    key CompanyName,
@EndUserText.label: 'Place of order'    
    key Country,
@EndUserText.label: 'Unitof Measure'    
    key Uom as UnitOfMeasure,
@EndUserText.label: 'Spiderman'    
    Qty as QuantitySold
}
