use dataanalyst;

-- Comments are ignored by the ode compiler
-- Create Phone, (4 Records)
-- ------------------------------------------------------------------
create table phone (
	phoneid      integer          -- (pk)
   ,phone_name   varchar(100)
   ,phone_make   varchar(100) );
   
-- Create the PK for Phone Table
alter table phone add constraint pk_phone PRIMARY key (phoneid);

/*
insert into phone values (1,'Iphone 8','Apple');
insert into phone values (1,'Iphone 9','Apple');
1 'Iphone 8' 'Apple'
2 'Iphone 10' 'Apple'
3 'Note10'    'Samsung'
*/

-- Plan 3 Rows
create table plan (
  planid           integer
 ,planname         varchar(100)
 ,mins             integer
 ,tot_cost         decimal(6,2)
 ,overtime_cost    decimal(6,2)  --  This is the amount that is charged per overtime minute
 );


-- Create the PK for Plan Table
alter table plan add constraint pk_plan PRIMARY key (planid);
/*
1            'A'       500    50        2
2            'B'       1000   75        1

600  250
200   50
600 = 500 + 100
      50  + 100*2
    = 250  
*/

-- PhonePlan (8 rows/records)
create table phoneplan (
  ppid     integer
 ,phoneid  integer
 ,planid   integer);
 
10.1 -- decimal
10   -- int

-- Create the PK for PhonePlan Table
alter table phoneplan add constraint pk_PhonePlan PRIMARY key (ppid);

-- Add Foreign Key
ALTER TABLE phoneplan ADD CONSTRAINT FK_phoneplan_phoneid FOREIGN KEY (phoneid) REFERENCES phone(phoneid);
ALTER TABLE phoneplan ADD CONSTRAINT FK_phoneplan_planid FOREIGN KEY (planid) REFERENCES plan(planid);

-- cust 30 rows
create table cust (
	 custid    integer  -- (pk)   
	,cname     varchar(100)
);

alter table cust add constraint pk_cust PRIMARY key (custid);

-- CustPhonePlan 30 rows
create table CustPhonePlan (
	cppid	integer	-- (pk)
    ,ppid	integer	-- (fk)
    ,custid	integer	-- (fk)
);

alter table CustPhonePlan add constraint pk_CustPhonePlan PRIMARY key (cppid);
-- Add Foreign Key
ALTER TABLE CustPhonePlan ADD CONSTRAINT FK_CustPhonePlan_pp FOREIGN KEY (ppid) REFERENCES phoneplan(ppid);
ALTER TABLE CustPhonePlan ADD CONSTRAINT FK_CustPhonePlan_cust FOREIGN KEY (custid) REFERENCES cust(custid);

-- 3 mons = 30 * 3 Rows
create table Billing (
	 billid			integer-- (pk)
    ,cppid			integer-- (fk)  
    ,bill_year       integer
    ,bill_month      varchar(3)
    ,mins_used       integer
    ,final_price     decimal(6,2)
);

alter table Billing add constraint pk_Billing PRIMARY key (billid);
ALTER TABLE Billing ADD CONSTRAINT FK_Billing_cppid FOREIGN KEY (cppid) REFERENCES CustPhonePlan(cppid);

-- Data
insert into Billing values (1,1,2020,'jan',600,null);
