-- -----------------------------------------
-- SALES OLTP-OLAP ETL (extract Transform load)
-- -----------------------------------------
-- Source DataBase: oltp_sales
-- Target DataBase: olap_sales

use olap_sales;

-- ETL for dim_employee
-- ------------------------------------------------------------------
insert into dim_employee (employee_id, first_name, last_name, birth_year)
select eid, first_name, last_name, birth_year
from   oltp_sales.employee;
commit;

-- Test Query
select * from dim_employee;


-- ETL for dim_product 
-- ------------------------------------------------------------------
insert into dim_product (product_id, product_name, product_type,price )
select prod_id, prod_name, prod_type,price
from   oltp_sales.products;

commit;

-- Test Query
-- delete from dim_product;
select * from dim_product;


-- ETL for dim_store 
-- ------------------------------------------------------------------
insert into dim_store ( store_id, store_address, city, region, state, country )
select  store_id, store_address, city, region, state, country
from    oltp_sales.stores;

commit;

select * from dim_store;

-- ETL for dim_sales_type 
-- ------------------------------------------------------------------
insert into dim_sales_type
select   @rownum := @rownum + 1 AS sales_type_id
        ,a.type_name
from    (select distinct sale_type as type_name from oltp_sales.sales) a
      ,(SELECT @rownum := 0) r;

commit;

select * from dim_sales_type;


-- Load Data into dim_time
-- -----------------------
-- Step 1. Get all DateTimes from sales
drop procedure load_time_dim;

DELIMITER //
create procedure load_time_dim()
begin
	declare st_date date;
    declare ed_date date;
    declare time_id int;
    
	SELECT MIN(sale_datetime), MAX(sale_datetime)
	INTO   @st_date , @ed_date
    from   oltp_sales.sales;

    set @time_id = 1;

    label1: WHILE @st_date <= @ed_date DO
       set @st_date = ADDDATE( @st_date, INTERVAL 1 DAY);
       set @time_id = @time_id + 1;
       
       -- select @time_id, @st_date , @ed_date;

       insert into olap_sales.dim_time(time_id, action_date, action_week, action_year, action_month, action_weekday)
       values (@time_id, @st_date, WEEKOFYEAR(@st_date), YEAR(@st_date), MONTH(@st_date), DAYNAME(@st_date));

    END WHILE label1;
end //
DELIMITER //;

delete from dim_time;
call  load_time_dim();
commit;

select * from dim_time;

-- Load Fact
-- -------------------------------------------------------------------------
delete from fact_sale;
insert into fact_sale
select  prod_id, 
        (select time_id from dim_time t where t.action_date = s.sale_datetime),
        store_id,
        eid,
        (select sales_type_id from dim_sales_type t where t.type_name = s.sale_type), 
        price,
        quantity
from    oltp_sales.sales  s;

commit;

select * from fact_sale;

-- Delete all OLAP Data
-- --------------------
use olap_sales;
delete from fact_sale;
delete from dim_time;
delete from dim_sales_type;
delete from dim_store;
delete from dim_product;
delete from dim_employee;
commit;


