drop database student;
create database student;
use student;

drop table Stud;

show tables;

create table Stud(
s_id VARCHAR(5),
Stud_NAME VARCHAR(10),
M1 INT,
M2 INT,
M3 INT,
Status VARCHAR(8)
); 

call onmark('1','Anju',98,80,81);
call onmark('2','Ann',98,50,41);
call onmark('3','John',98,60,81);
call onmark('4','Joe',38,30,31);

select *,percentage(M1,M2,M3) from Stud;
