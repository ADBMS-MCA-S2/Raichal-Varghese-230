create database Org;
use Org;

drop table Library;
CREATE TABLE Library (
    b_id INT,
    Title VARCHAR(20),
    with_date DATE
);

insert into Library values
(1,"Java","2017-09-01"),
(2,"C","2018-05-03"),
(3,"C++","2017-09-11"),
(4,"Python","2015-09-01");

drop table Library_Audit;
create table Library_Audit(
bb_id int,
Titlee varchar(20),
last_with date
);

insert into Library_Audit values
(1,"Java","2017-09-01"),
(2,"C","2018-05-03"),
(3,"C++","2017-09-11"),
(4,"Python","2015-09-01");

set sql_safe_updates=0;

update Library set with_date="2018-11-21" where b_id=2;
update Library set with_date="2017-10-11" where b_id=1;


select * from Library;

delete from Library where b_id=1;

select * from Library_Audit;

insert into Library_Audit values
(1,"Java","2017-09-01");

insert into Library values
(1,"Java","2017-09-01");