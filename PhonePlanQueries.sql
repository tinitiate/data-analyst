-- Queries

use dataanalyst;


-- 1. Get all Phone Details
select * from phone;
select phoneid, phone_name, phone_make from phone;

-- 2. Get the number of customers who are with PLAN 'A'
select  count(c.custid)  -- ,count(cpp.custid),count(1),count('aaa')
from    plan            p
       ,phoneplan       pp
       ,cust            c
       ,CustPhonePlan   cpp
-- JOINS
where  p.planid = pp.planid
and    pp.ppid  = cpp.ppid
and    c.custid = cpp.custid
-- FILTER
and   p.planname = 'A'

-- 3. What is the most popular phone
select  a1.phone_Name
from   (select  p.phone_Name, count(cpp.custid) count_custId
		from    phone           p
			   ,phoneplan       pp
			   ,cust            c
			   ,CustPhonePlan   cpp
		-- JOINS
		where  p.phoneid = pp.phoneid
		and    pp.ppid  = cpp.ppid
		and    c.custid = cpp.custid
		group by p.phone_Name
        ) a1
where  a1.count_custId =  ( select  max(count_custId)
							from   (select  p.phone_Name, count(cpp.custid) count_custId
								    from    phone           p
									       ,phoneplan       pp
									       ,cust            c
									       ,CustPhonePlan   cpp
									-- JOINS
									where  p.phoneid = pp.phoneid
									and    pp.ppid  = cpp.ppid
									and    c.custid = cpp.custid
									group by p.phone_Name ) a 
                            )

-- 4. What is the least popular plan name
select  a1.planName
from   (select  p.planName, count(cpp.custid) count_custId
		from    plan           p
			   ,phoneplan       pp
			   ,cust            c
			   ,CustPhonePlan   cpp
		-- JOINS
		where  p.planid = pp.planid
		and    pp.ppid  = cpp.ppid
		and    c.custid = cpp.custid
		group by p.planName
        ) a1
where  a1.count_custId =  ( select  min(count_custId)
							from   (select  p.planName, count(cpp.custid) count_custId
								    from    plan           p
									       ,phoneplan       pp
									       ,cust            c
									       ,CustPhonePlan   cpp
									-- JOINS
									where  p.planid = pp.planid
									and    pp.ppid  = cpp.ppid
									and    c.custid = cpp.custid
									group by p.planName ) a 
                            )

-- 5. Whats the most popular phone name in the most expensive plan
select planid
from   plan 
where  tot_cost =  (select  max(tot_cost)
				    from    plan);

select *
from   (select  p.phone_name, count(cpp.custid) count_custId
			from    phone           p
				   ,phoneplan       pp
				   ,cust            c
				   ,CustPhonePlan   cpp
			-- JOINS
			where  p.phoneid = pp.phoneid
			and    pp.ppid  = cpp.ppid
			and    c.custid = cpp.custid
			and    pp.planid = (select planid
								from   plan 
								where  tot_cost =  (select  max(tot_cost)
													from    plan))
			group by p.phone_name) s1
where  s1.count_custId =   (select max(s2.count_custId)
						 from  (
								select  p.phone_name, count(cpp.custid) count_custId
								from    phone           p
									   ,phoneplan       pp
									   ,cust            c
									   ,CustPhonePlan   cpp
								-- JOINS
								where  p.phoneid = pp.phoneid
								and    pp.ppid  = cpp.ppid
								and    c.custid = cpp.custid
								and    pp.planid = (select planid
													from   plan 
													where  tot_cost =  (select  max(tot_cost)
																		from    plan))
								group by p.phone_name) s2)

-- 6. Least popular phone name
-- 7. Most popular phone make / phone brand

-- 8. The Total Bill
select * from billing;


dept
deptid  dname
1       sales
2       IT

emp
empid deptid  ename joindate sal
1     1       A     jan 01   1000
2     2       B     Mar 01
3     1       C     dec 01



update billing tar,
	  (
      select    b.billid, p.mins, p.tot_cost, p.overtime_cost, b.mins_used,
				CASE
					WHEN p.mins <= b.mins_used THEN  p.tot_cost + ( b.mins_used - p.mins) * p.overtime_cost
					WHEN p.mins >= b.mins_used THEN  p.tot_cost
				END total_bill_price
							from    plan            p
								   ,phoneplan       pp
								   ,CustPhonePlan   cpp
								   ,billing         b
							-- JOINS
							where  p.planid = pp.planid
							and    pp.ppid  = cpp.ppid
							and    b.cppid = cpp.cppid 
        )  src
set    tar.final_price = src.total_bill_price
-- join 
where  tar.billid = src.billid;


-- and    tar.billid in (4,5,6);

commit;
                    



select * from phone;

update phone
set    phone_name = 'Iphone 11'
where  phoneid = 1;

commit;

DDL
	Create
    Alter
    Drop
    
DML = Data manipulation Language
  Insert
  UPdate
  Delete
commit;
rollback

select * from billing where billid = 6;
delete from billing where billid = 6;
commit;



-- To the PLAN
-- (1)
-- Add two columns using alter statement
-- DueDate      varchar
-- OverTimeFee  decimal(6,2)

-- (2)
-- Write Update statements to add data

-- To the BILLING
-- (1)
-- Add two columns using alter statement
-- PaymentDate  date
-- OverTimeFee  decimal(6,2)

-- (2)
-- Write Update statements to add data












