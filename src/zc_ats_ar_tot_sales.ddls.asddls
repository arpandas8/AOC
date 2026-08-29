@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Total sales by dimension'
@Metadata.ignorePropagatedAnnotations: false
@VDM.viewType: #CONSUMPTION
@Analytics.query: true
define view entity ZC_ATS_AR_TOT_SALES as select from ZI_ATS_AR_CO_SLS_CUBE
{
    key productcategory,
    key CompanyName,
    key Country,
    key CurrencyCode,
    Amount
    

}
