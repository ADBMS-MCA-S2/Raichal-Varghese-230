create database DEPARTMENT;
use DEPARTMENT;
drop table Dept;
CREATE TABLE Dept(
DEPTNO int,
DNAME VARCHAR(20),
LOC varchar(15)
);
alter table Dept rename department;
alter table department add PINCODE VARCHAR(6) NOT NULL;
alter table department drop column PINCODE;
ALTER TABLE department rename column DNAME to DEPT_NAME;
ALTER TABLE department modify LOC varchar(10);
drop table department;
