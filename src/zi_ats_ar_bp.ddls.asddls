@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Business partner Dimension  Basic Interface view'
@Metadata.ignorePropagatedAnnotations: true
@VDM.viewType: #BASIC
@Analytics.dataCategory: #DIMENSION
define view entity ZI_ATS_AR_BP as select from zats_ar_bpa
{
key bp_iduuid as BpIduuid,
case bprole when   '01' then 'Customer'
	  when  '02' then 'Supplier'
	  when  '03' then 'Employee'
	  else 'Other'
	  end as Bptype,
company_name as CompanyName,
street as Street,
country as Country,
region as Region,
city as City    
} where bprole = '01' 
