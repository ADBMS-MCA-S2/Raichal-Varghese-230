drop database emp;
create database emp;
use emp;
DROP TABLE employee;
create table employee(
EMPNO VARCHAR(5),
EMP_NAME VARCHAR(20),
DEPT VARCHAR(20),
SALARY INT,
DOJ DATE,
BRANCH VARCHAR(15)
);
INSERT INTO employee(EMPNO,EMP_NAME,DEPT,SALARY,DOJ,BRANCH) values('E101','Amit','Production',4500,'2000-03-12','Bangalore');
INSERT INTO employee(EMPNO,EMP_NAME,DEPT,SALARY,DOJ,BRANCH) values('E102','Amit','HR',70000,'02-07-03','Bangalore');
INSERT INTO employee(EMPNO,EMP_NAME,DEPT,SALARY,DOJ,BRANCH) values('E103','sunita','Management',120000,'01-01-11','mysore');
INSERT INTO employee(EMPNO,EMP_NAME,DEPT,SALARY,DOJ,BRANCH) values('E104','sunita','IT',67000,'01-08-01','mysore');
INSERT INTO employee(EMPNO,EMP_NAME,DEPT,SALARY,DOJ,BRANCH) values('E105','mahesh','Civil',145000,'03-9-20','Mumbai');


-- 1
select * from employee;
-- 2
select empno,salary from employee;
-- 3
select avg(salary) from employee;
-- 4
select count(empno) from employee;
-- 5
select distinct count(empno) from employee;
-- 6
select sum(salary) from employee;
select distinct emp_name,count(emp_name) from employee;
select sum(salary),emp_name,count(*) as occurence from employee group by emp_name;
-- 7
select sum(salary) from employee where salary>120000;
-- 8
select emp_name from employee order by emp_name desc;
-- 9
select * from employee where (emp_name='Amit' and salary>50000);

