
-- OLAP
-- Online Analytical Processing
-- Denormalized Data Model


-- Assignment Create This Data model and load data (10 rows) (ME)
-- OLTP DataModel
Employee
    Same Cols as Dim_EMP
    
Products
    Same as dim_product

Stores
   Same as dim_stores
   
Sales
    sale_id (PK)
    sale_type
    sale_date_time
    product_id
    price
    quantity

--
select * from stores


            ETL - Extract Transform Load (Venkat) 

-- OLAP datmodel = The Star Schema 6 Tables
-- Assignment Create This Data model (ME)
-- Star Schema from below link
-- https://www.vertabelo.com/blog/data-warehouse-modeling-star-schema-vs-snowflake-schema/


-- -------------------- -------------------- -------------------- -------------------- -------------------- ------------------
--  OLAP Data Model
-- -------------------- -------------------- -------------------- -------------------- -------------------- ------------------

create table dim_sales_type
(
sales_type_id integer,
type_name varchar(128)
);
alter table dim_sales_type add constraint primary key(sales_type_id);


create table dim_store
(
store_id integer,
store_address varchar(256),
city varchar(128),
region varchar(128),
state varchar(128),
country varchar(128)
);

alter table dim_store add constraint primary key(store_id);


create table dim_employee
(
employee_id integer,
first_name varchar(200),
last_name varchar(200),
birth_year integer
) ;
alter table dim_employee add constraint primary key(employee_id);



create table dim_time
(
time_id integer,
action_date date,
action_week integer,
action_year integer,
action_month integer,
action_weekday varchar(16)
);
alter table dim_time add constraint primary key(time_id);

create table dim_product
(
product_id integer,
product_name varchar(256),
product_type varchar(256)
);
alter table dim_product add constraint primary key(product_id);

drop table fact_sale;
create table fact_sale
(
product_id integer,
time_id integer,
store_id integer,
employee_id integer,
sales_type_id integer,
price decimal(8,2),
quentity decimal(16,2)
);

alter table fact_sale add constraint FK_product_fact foreign key(product_id) references dim_product(product_id);
alter table fact_sale add constraint FK_time_fact foreign key(time_id) references dim_time(time_id);
alter table fact_sale add constraint FK_store_fact foreign key(store_id) references dim_store(store_id);
alter table fact_sale add constraint FK_employee_fact foreign key(employee_id) references dim_employee(employee_id);
alter table fact_sale add constraint FK_sales_fact foreign key(sales_type_id) references dim_sales_type(sales_type_id);



-- -----------------------------------------
-- ETL (extract Transform load)
-- -----------------------------------------
-- Source : OTLP
-- Target:  OLAP

-- Load dim_employee
insert into dim_employee (employee_id, first_name, last_name, birth_year)
select eid, first_name, last_name, birth_year
from   employee;

commit;

select * from dim_employee;

insert into dim_product (product_id, product_name, product_type )
select prod_id, prod_name, prod_type 
from   products;

commit;

select * from dim_product;

insert into dim_store ( store_id, store_address, city, region, state, country )
select  store_id, store_address, city, region, state, country
from    stores;

commit;

select * from dim_store

-- Transform - Load Example
-- -------------------------

select * from dim_sales_type;

insert into dim_sales_type
select   @rownum := @rownum + 1 AS sales_type_id
        ,a.type_name
from    (select distinct sale_type as type_name from sales) a
      ,(SELECT @rownum := 0) r;

commit;

insert into sales values (1, 'online','2020/02/10',1,1,2,400,2);
insert into sales values (2, 'online','2020/03/10',2,2,2,500,3);
insert into sales values (3, 'store','2019/10/11',3,3,3,600,4);
insert into sales values (4, 'store','2020/02/10',1,1,1,300,2);
insert into sales values (5, 'store','2019/12/25',1,1,1,800,5);
insert into sales values (6, 'online','2019/11/30',2,2,1,900,6);
insert into sales values (7, 'store','2020/01/10',2,2,1,1000,7);

-- Load Data into dim_time
-- -----------------------
insert into dim_time values (7,'2020/01/10',null,2020,1,null);
insert into dim_time values (1,'2020/02/10',null,2020,2,null);
insert into dim_time values (2,'2020/03/10',null,2020,3,null);
insert into dim_time values (3,'2019/10/11',null,2019,10,null);
insert into dim_time values (5,'2019/12/25',null,2019,12,null);
insert into dim_time values (6,'2019/11/30',null,2019,11,null);
commit;

select * from dim_time;

update dim_time t
set    t.action_week    = week(t.action_date)
	  ,t.action_weekday = dayname(t.action_date);

select action_date, week(action_date), dayname(action_date) from dim_time;


create table dim_sales_type
(
sales_type_id integer,
type_name varchar(128)

select * from  sales  s

insert into fact_sale
select  prod_id, 
        (select time_id from dim_time t where t.action_date = s.sale_datetime),
        store_id,
        eid,
        (select sales_type_id from dim_sales_type t where t.type_name = s.sale_type), 
        price,
        quantity
from    sales  s;

select * from fact_sale

 select time_id from dim_time t where t.action_date = '2020-02-10'

-- set theory

-- All Data
select *
from   fact_sale;

-- List Products by total sales
select product_id, sum(price)
from   fact_sale
group by product_id;

-- Get max sales
select max(sum_sales)
from   (
		select product_id, sum(price) sum_sales
		from   fact_sale
		group by product_id) Products_total_sales;


select  product_id
from   (select product_id, sum(price) sum_sales
		from   fact_sale
		group by product_id) src
where  sum_sales = (select max(sum_sales)
					from   (
							select product_id, sum(price) sum_sales
							from   fact_sale
							group by product_id) Products_total_sales);
        






