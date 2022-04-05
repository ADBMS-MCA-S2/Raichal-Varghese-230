drop database emp;
create database emp;
use emp;
-- 1
drop table employee;
create table employee(
E_ID int,
E_NAME VARCHAR(10),
AGE INT,
SALARY INT
);
select * from employee;
INSERT INTO employee(E_ID,E_NAME,AGE,SALARY) VALUES (101,'ANU',22,9000);
INSERT INTO employee(E_ID,E_NAME,AGE,SALARY) VALUES (102,'Shane',29,8000);
INSERT INTO employee(E_ID,E_NAME,AGE,SALARY) VALUES (103,'Rohan',34,6000);
INSERT INTO employee(E_ID,E_NAME,AGE,SALARY) VALUES (104,'Scott',44,10000);
INSERT INTO employee(E_ID,E_NAME,AGE,SALARY) VALUES (105,'Tiger',35,8000);
INSERT INTO employee(E_ID,E_NAME,AGE,SALARY) VALUES (106,'Alex',27,7000);
INSERT INTO employee(E_ID,E_NAME,AGE,SALARY) VALUES (107,'Abhi',29,8000);
-- 2
select count(E_ID) from employee;
-- 3
select max(AGE) FROM employee;
-- 4
select min(AGE) FROM employee;
-- 5
select sum(AGE) FROM employee;
--  6
select avg(AGE) FROM employee;
DROP VIEW EMPAGE;
-- 7
create view EMPAGE AS
SELECT AGE FROM employee ;
-- 8
SELECT * FROM EMPAGE;
-- 9
select E_NAME,SALARY FROM employee group by e_name;
-- 10
SELECT E_NAME,SALARY FROM employee order by salary asc;
-- 11
SELECT E_NAME,SALARY FROM employee order by salary desc;