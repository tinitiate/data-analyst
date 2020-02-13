---
create database oltp_sales;
use oltp_sales;

-- -------------------- -------------------- -------------------- -------------------- -------------------- ------------------
--  OLTP Data Model
-- -------------------- -------------------- -------------------- -------------------- -------------------- ------------------
create table employee
    (
        eid integer,
        first_name varchar(200),
        last_name varchar(200),
        birth_year integer
    );

alter table employee add constraint primary key(eid);

-- Employee CSV Data
-- ------------------
1, 'AAA', 'AAA', 1995
2, 'BBB', 'BBB', 1980
3, 'CCC', 'CCC', 2000
4, 'AAAA', 'AAAA', 1979
5, 'BBBB', 'BBBB', 1980
6, 'CCCC', 'CCCC', 1990
7, 'A1', 'A1', 1995
8, 'B1', 'B1', 1980
9, 'C1', 'C1', 2000
10, 'AAA1', 'AAA1', 1996
11, 'BBB1', 'BBB1', 1985
12, 'CCC1', 'CCC1', 2001
13, 'AAA2', 'AAA2', 1991
14, 'BBB2', 'BBB2', 1988
15, 'CCC2', 'CCC2', 2004
----

load data local infile 'E:/code/CODING_DataAnalyst/oltp_employee.csv' into table employee fields terminated by ',' enclosed by "'" LINES TERMINATED BY '\r\n' 
(eid, first_name, last_name, birth_year);


create table products
(
prod_id   integer,
Prod_name varchar(100),
prod_type varchar(100),
price     decimal(6,2)
) ;

alter table products add constraint primary key(prod_id);

SHOW VARIABLES LIKE "secure_file_priv";

-- products CSV
1, 'Iphone 10', 'electronics',899
2, 'Dell 10', 'electronics',1200
3, 'samsung', 'electronics',800
4, 'Apples', 'fruit',1
5, 'Mangoes', 'fruit'2
6, 'Bananas', 'fruit',1
7, 'Dish Wash Cleaner', 'cleaning',3
8, 'Laundry Cleaner', 'cleaning',3
9, 'Floor Cleaner', 'cleaning',2
10, 'Milk', 'dairy',4
11, 'Butter', 'dairy',4
12, 'Cheese', 'dairy',4
13, 'Printer ink', 'Office Supplies',10
14, 'Paper Rolls', 'Office Supplies',10
15, 'Pens', 'Office Supplies',3
16, 'Printer', 'electronics',50
17, 'HDTV', 'electronics',300
18, 'UHDTV', 'electronics',400
19, 'Cereal', 'food',4
20, 'Chips', 'food',3
21, 'pop corn', 'food',3
22, 'Batter', 'food',5
23, 'cake', 'food',5
24, 'dry fruits', 'food',8
25, 'ice cream', 'frozen food',8
26, 'frozen pizza', 'frozen food',5
27, 'frozen peas', 'frozen food',3
28, 'veg breakfast', 'food',5
29, 'egg breakfast', 'food',6
30, 'chicken breakfast', 'food',7
------
load data local infile 'E:/code/CODING_DataAnalyst/oltp_products.csv' into table products fields terminated by ',' enclosed by "'" LINES TERMINATED BY '\r\n' 
(prod_id, Prod_name, prod_type, price);



create table stores 
(
store_id integer,
store_address varchar(256),
city varchar(128),
region varchar(128),
state varchar(128),
country varchar(128)
);

alter table stores add constraint primary key(store_id);

-- stores CSV
1, '100 A Street,','City A', 'A', 'NJ', 'United States'
2, '1000 B Street','City B', 'B', 'AS', 'United States'
3, '1000 C Street','City C', 'C', 'TX', 'United States'
4, '1000 D Street','City D', 'D', 'AR', 'United States'
5, '1000 E Street','City E', 'A', 'NE', 'United States'
6, '1000 F Street','City F', 'B', 'MN', 'United States'
7, '1000 G Street','City G', 'C', 'ME', 'United States'
8, '1000 H Street','City H', 'D', 'NY', 'United States'
----
load data local infile 'E:/code/CODING_DataAnalyst/oltp_stores.csv' into table stores fields terminated by ',' enclosed by "'" LINES TERMINATED BY '\r\n' 
(store_id, store_address, city, region, state, country);


drop table sales;
create table sales
(
sale_id        integer,
sale_type      varchar(100),
sale_datetime  date,
store_id       integer,
eid            integer,
prod_id 	   integer,
price 		   decimal(6,2),
quantity 	   integer
);

alter table sales add constraint primary key(sale_id);
alter table sales add constraint FK_sales foreign key(prod_id) references products(prod_id);
alter table sales add constraint FK_empid foreign key(eid) references employee(eid);
alter table sales add constraint FK_storeid foreign key(store_id) references stores(store_id);

-- Load data script
load data local infile 'E:/code/CODING_DataAnalyst/oltp_sales.csv' into table sales fields terminated by ',' enclosed by "'" LINES TERMINATED BY '\r\n' 
(sale_id, sale_type, @sale_data, store_id, eid, prod_id, price, quantity)
SET sale_datetime = STR_TO_DATE(@sale_data, '%d-%b-%y');

-- Get Data from 
-- sale.csv

-- update the sales final price
update   sales tar
        ,(select  s.sale_id, p.prod_id,p.price, s.quantity, p.price*s.quantity  final_price
		  from    products  p
		  	     ,sales     s
		  where   p.prod_id = s.prod_id) src
set    tar.price = src.final_price
where  tar.sale_id = src.sale_id;

commit;
