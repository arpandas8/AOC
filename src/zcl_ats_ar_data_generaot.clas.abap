CLASS zcl_ats_ar_data_generaot DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
  INTERFACES if_oo_adt_classrun.
  PROTECTED SECTION.
  PRIVATE SECTION.
  METHODS flush.
  METHODS fill_master_data.
  METHODS fill_transaction_data.
ENDCLASS.



CLASS zcl_ats_ar_data_generaot IMPLEMENTATION.
METHOD if_oo_adt_classrun~main.
flush( ).
fill_master_data(  ).
fill_transaction_data(  ).
out->write( 'Data processed successfully' ).
ENDMETHOD.
METHOD fill_master_data.
DATA: lt_bp TYPE TABLE of zats_ar_bpa,
	  lt_prod TYPE TABLE of zats_ar_product.
APPEND VALUE #( bp_iduuid = cl_uuid_factory=>create_system_uuid( )->create_uuid_c32(  )
                bprole = '01'
                company_name = 'TACUM'
                street = 'Victoria street'
                country = 'IN'
                region = 'APJ'
                city = 'Kolkata' ) TO lt_bp.

APPEND VALUE #( bp_iduuid = cl_uuid_factory=>create_system_uuid( )->create_uuid_c32(  )
                bprole = '01'
                company_name = 'TACUM'
                street = 'Victoria street'
                country = 'IN'
                region = 'APJ'
                city = 'Kolkata' ) TO lt_bp.

APPEND VALUE #( bp_iduuid = cl_uuid_factory=>create_system_uuid( )->create_uuid_c32(  )
                bprole = '01'
                company_name = 'TACUM'
                street = 'Victoria street'
                country = 'IN'
                region = 'APJ'
                city = 'Kolkata' ) TO lt_bp.

APPEND VALUE #( product_id = cl_uuid_factory=>create_system_uuid( )->create_uuid_c32(  )
                name = 'Gaming Laptop'
                category = 'PCs'
                price = 10000
                currency = 'INR'
                discount = 8 ) TO lt_prod.


APPEND VALUE #( product_id = cl_uuid_factory=>create_system_uuid( )->create_uuid_c32(  )
                name = 'Gaming Roadblock'
                category = 'PCs'
                price = 15000
                currency = 'INR'
                discount = 9 ) TO lt_prod.


APPEND VALUE #( product_id = cl_uuid_factory=>create_system_uuid( )->create_uuid_c32(  )
                name = 'Gaming Robolox'
                category = 'PCs'
                price = 20000
                currency = 'INR'
                discount = 7 ) TO lt_prod.
  INSERT zats_ar_bpa FROM TABLE @lt_bp.
  INSERT zats_ar_product FROM TABLE @lt_prod.
ENDMETHOD.
METHOD fill_transaction_data.
DATA:o_rand type ref to cl_abap_random_int,
n type i,
seed type i,
lv_date type timestamp,
lv_ord_id type zats_Ar_dte_id,
lt_so type table of zats_ar_so_hdr,
lt_So_i TYPE TABLE of zats_ar_so_item.
seed = cl_Abap_random=>seed( ).
cl_abap_random_int=>create(
EXPORTING seed = seed
min = 1
max = 7
RECEIVING
prng = o_rand ).
get TIME STAMP FIELD lv_date.
SELECT * FROM zats_ar_bpa into TABLE @DATA(lt_bpa).
SELECT * FROM zats_ar_product into TABLE @DATA(lt_prod).
do 50 times.
  lv_ord_id = cl_uuid_factory=>create_system_uuid( )->create_uuid_c32(  ).
  n = o_rand->get_next( ).
  READ TABLE lt_bpa INDEX n INTO DATA(ls_bpa).
  APPEND VALUE #( order_id = lv_ord_id
				  order_no = sy-index
				  buyer = ls_bpa-bp_iduuid
				  gross_amount = 10 * n
				  currency_code = 'INR'
				  created_by = 'ATS'
				  created_at = sy-datum
				  changed_by = 'ATS'
				  changed_at = sy-datum ) TO lt_so.
do 2 TIMES.		
READ TABLE lt_prod INDEX n INTO DATA(ls_prod).		
  APPEND VALUE #( item_id = cl_uuid_factory=>create_system_uuid( )->create_uuid_c32(  )
                  order_id = lv_ord_id
				  product = ls_prod-product_id
				  qty = n
				  UOM = 'EA'
				  amount = n * ls_prod-price
				  currency_code = ls_prod-currency ) TO lt_So_i.
ENDDO.
ENDDO.
INSERT zats_ar_so_hdr FROM TABLE @lt_so.
INSERT zats_ar_so_item FROM TABLE @lt_So_i.
ENDMETHOD.
METHOD flush.
DELETE FROM : zats_ar_so_hdr,zats_ar_so_item,zats_ar_bpa,zats_ar_product.
ENDMETHOD.
ENDCLASS.
