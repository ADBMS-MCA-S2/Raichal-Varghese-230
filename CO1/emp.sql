drop database emp;
set autocommit=0;
create database emp;
use emp;
drop table Employee;

create table Employee(
EMPNO VARCHAR(5),
EMP_NAME VARCHAR(10),
DEPT VARCHAR(15),
SALARY INT,
DOJ DATE,
BRANCH VARCHAR(10)
); 
show tables;
INSERT INTO  Employee(EMPNO,EMP_NAME,DEPT,SALARY,DOJ,BRANCH) VALUES
('E101','Amit','Production',45000,'00-03-12','Bangalore');
select * from Employee;
INSERT INTO  Employee(EMPNO,EMP_NAME,DEPT,SALARY,DOJ,BRANCH) VALUES
('E102','Amit','HR',70000,'03-07-02','Bangalore');

INSERT INTO  Employee(EMPNO,EMP_NAME,DEPT,SALARY,DOJ,BRANCH) VALUES
('E103','sunita','Management',120000,'01-01-11','mysore');
delete from Employee where SALARY=45000; 

COMMIT;
delete from Employee where EMPNO='E104';
INSERT INTO  Employee(EMPNO,EMP_NAME,DEPT,SALARY,DOJ,BRANCH) VALUES
('E104','sunita','IT',67000,'01-08-01','mysore');
ROLLBACK;
savepoint A;
select * from Employee;
rollback TO A;
select * from Employee;

INSERT INTO  Employee(EMPNO,EMP_NAME,DEPT,SALARY,DOJ,BRANCH) VALUES
('E105','mahesh','Civil',145000,'03-09-20','Mumbai');
select EMPNO,SALARY FROM Employee;
select avg(SALARY) from Employee;
select count(empno) from Employee;
select distinct emp_name from Employee;
select emp_name,count(emp_name) as count from Employee group by emp_name;
select sum(salary) from Employee;
select emp_name,salary from Employee where salary>120000;
select emp_name from Employee order by emp_name desc;
select * from Employee where emp_name='Amit' and salary>50000;