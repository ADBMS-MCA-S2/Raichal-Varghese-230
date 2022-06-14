drop database company;
create database company;
use company;

drop table employee;
create table employee(
empno int,
ename varchar(15),
job varchar(15),
mgr varchar(15),
hiredate date,
sal int,
comm int,
deptno int
);

drop table department;
create table department(
deptno int,
dname varchar(15)
);

insert into employee values
(101,"Joy","clerk","Sharath","2017-09-06",40000,650,10),
(102,"Roy","designer","Kiran","2018-06-11",45000,1650,30),
(103,"Teena","developer","Sharath","2015-05-26",50000,950,10),
(104,"Sneha","clerk","Devika","2011-03-16",65000,2650,5),
(105,"Manu","HR","John","2010-11-09",75000,3650,8),
(106,"Laenu","DataAnalyst","John","2009-11-09",75000,3650,8),
(107,"Helen","Techinician","Kiran","2010-12-09",25000,650,30);

insert into department values
(10,"A"),
(30,"B"),
(5,"C"),
(8,"D");

select * from employee;

select * from department;



-- 1
select count(*) as NO_OF_CLERKS from employee where job="clerk";

-- 2
select count(*) as count_clerk,deptno from employee where job ="clerk"  group by deptno having count(*)=1;

-- 3 
select count(*) as no_emp ,deptno from employee group by deptno;

-- 4
select deptno,avg(sal) from employee group by deptno order by avg(sal) limit 1;

-- 5
select ename from employee where ename like "La%";

-- 6
select * from employee where deptno=10 having sal>(select max(sal) from employee where deptno=30);