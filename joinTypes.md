#Join Algos
* Nested Loop
* Hash Join
* Merge Join

## JOIN Types
```
-- Source ---------------------
dept
deptid dname 
1      sales 
2      mktg 
3      Admin

emp
empid ename deptid
1     A     1 
2     B     2
3     C     1
4     D     
-- Source ---------------------
```


### Inner Join
```sql
select e.empid,e.ename, d.dname
from   emp e, dept d
where  e.deptid = d.depid;
-- 
empid ename dname
1     A     Sales A
2     B     Sales B
3     C     Sales A
```

### left Join
```sql
select e.empid,e.ename, d.dname
from   emp e left join dept d
on   e.deptid = d.depid;
--
empid ename dname
1     A     Sales A
2     B     Sales B
3     C     Sales A
4     D     
```

### Right Join
```sql
select e.empid,e.ename, d.dname
from   emp e right join dept d
on   e.deptid = d.depid;
--
empid ename dname
1     A     Sales A
2     B     Sales B
3     C     Sales A
            Admin
```

### Full Join
```sql
select e.empid,e.ename, d.dname
from   emp e full outer join dept d
on   e.deptid = d.depid;

select e.empid,e.ename, d.dname
from   dept d full outer join emp e 
on   e.deptid = d.depid;

-- 
empid ename dname
1     A     Sales A
2     B     Sales B
3     C     Sales A
            Admin
4     D     
```

