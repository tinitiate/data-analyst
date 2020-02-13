-- List of software to get
-- BITNAMI  WAMP / BITNAMI LAMP / BITNAMI MAMP
-- https://www.mysql.com/products/workbench/
-- only for windows https://notepad-plus-plus.org/


-- Helpful links
https://www.w3schools.com/sql/sql_create_db.asp


-- Step 1.
-- Create Database
create database dataanalyst;

-- Step 2.
-- Use the Database
use dataanalyst;

-- Step 3.
-- Create a Table, using DDL (Create / Alter)
Create table dept (
	deptid  integer
   ,dname   varchar(100)
);

-- Add Primary Key 
alter table dept add constraint pk_dept PRIMARY key (deptid);

-- Step 4.
-- Insert Some data using DML(Insert) 
insert into dept values(1,'SALES');
insert into dept values(2,'MKTG');
insert into dept values(3,'IT');
insert into dept values(4,'Admin');

-- Step 5.
-- Save Changes using TCL (Commit)
commit;

-- Step 6.
-- Use DSL to select all rows
select * from dept;
select deptid from dept;
select dname from dept;
select deptid,dname from dept;


--------------------------------------------------------------------------
SQL
	DDL  data defn language
		Create
        Alter
        Drop
        
    DML Data Manipulation Language
		Insert
        Update
        Delete
    TCL
		commit;
        rollback;
    DSL Data Selection Language
		select
        from,where,group by,having,order by
    DCL
		grant / revoke
--------------------------------------------------------------------------
        