use dataanalyst;


select * from plan;

-- Mathematical Functions,
-- These will get ONE value
select min(mins), max(mins), count(mins), sum(mins), avg(mins) from plan;

-- Mathematical Operators(+, -, *, /)
select mins, tot_cost + overtime_cost 
from   plan;

-- Simple numerica value based join
select *
from   plan
where  tot_cost < 500;

select *
from   plan
where  tot_cost >= 500;

-- string value join
select *
from   plan
where  planname = 'C';

-- Multiple values
select *
from   plan
where  planname in ('A','C');

select *
from   plan
where  planid in (6,7);


select *
from   plan
where  planid in (6);

select *
from   plan
where  planid = 6;

-- psuedo column
select 'Tinitiate',1000,planid
from   plan

SELECT UPPER("MySql");
SELECT lower("MySql");

SELECT lower(planname), planname from plan;

SELECT * from plan
where lower(planname)  = 'a';


select ltrim('   hello');
select rtrim('   hello   ');
select trim('   hello   ');
select '   hello   ';

SELECT GREATEST(3, 12, 34, 8, 3333333,25);

-- String Functions
select 'abc.xyz@gmail.com', length('abc.xyz@gmail.com');
select 'abc.xyz@yahoo.com', length('abc.xyz@yahoo.com');

select 'abc.xyz@yahoo.com', substring('abc.xyz@yahoo.com',1,3);
select 'abc.xyz@yahoo.com', substring('abc.xyz@yahoo.com',5,3);
select 'abc.xyz@yahoo.com', instr('abc.xyz@yahoo.com','@')

select 'abc.xyz@yahoo.com', substring_index('abc.xyz@yahoo.com','.',-1)
select 'abc.xyz@yahoo.com', substring_index('abc.xyz@yahoo.com','@',1)


select 'abc.xyz@outlook.com', substring_index('abc.xyz@outlook.com','@',-1), substring_index(substring_index('abc.xyz@outlook.com','@',-1),'.',1)

select 'abc.xyz@outlook.com', substring( 'abc.xyz@outlook.com'
                                        ,instr('abc.xyz@outlook.com','@')+1
                                        ,5) ;

-- Date / Time Functions
SELECT DATE_FORMAT("2017-06-15", "%Y-%m-%d");

select extract(WEEK from DATE_FORMAT("2017-06-15", "%Y-%m-%d"))

SELECT DATEDIFF(DATE_FORMAT("2017-06-25", "%Y-%m-%d"), DATE_FORMAT("2017-06-15", "%Y-%m-%d"));

SELECT LOCALTIMESTAMP();
SELECT CURRENT_DATE();

create table date_test (
	data1    int
   ,tnx_date date
   ,tnx_dttm datetime
   ,tnx_ts   timestamp
);

SET TIME_ZONE = '+04:00';  -- EST
SET TIME_ZONE = '+00:00';  -- GMT

insert into date_test values (2,DATE_FORMAT("2017-01-15", "%Y-%m-%d"), LOCALTIMESTAMP(), DATE_FORMAT("2017-06-15 11:00:00", "%Y-%m-%d %T"));
commit;

select * from date_test where tnx_date = DATE_FORMAT("2017-01-15", "%Y-%m-%d");
select * from date_test where tnx_date between DATE_FORMAT("2017-01-01", "%Y-%m-%d") and DATE_FORMAT("2017-01-30", "%Y-%m-%d");








