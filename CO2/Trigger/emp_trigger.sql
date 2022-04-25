drop database college_employee;
create database college_employee;
use college_employee;
create table new_employee(emp_id int,emp_name varchar(20),emp_department varchar(20));
insert into new_employee values(101,'Riya','MCA');
insert into new_employee values(102,'Rekha','CS');
create table department_MCA(dept_id int,dept_name varchar(20),dept_emp varchar(20));
create table department_cs(dept_id int,dept_name varchar(20),dept_emp varchar(20));
insert into new_employee values(105,'Kevin','MCA');
select * from new_employee;
select * from department_MCA;
select * from department_cs;
drop trigger new_employee_AFTER_INSERT;

-- trigger
/*
CREATE DEFINER=`root`@`localhost` TRIGGER `new_employee_AFTER_INSERT` AFTER INSERT ON `new_employee` FOR EACH ROW BEGIN
if(new.emp_department='MCA') then
insert into department_MCA set
dept_id=new.emp_id,dept_name=new.emp_name,dept_emp="Assist proff filled";
end if;
if(new.emp_department='CS') then
insert into department_cs set
dept_id=new.emp_id,dept_name=new.emp_name,dept_emp="Assist proff filled";
end if;
END
*/
