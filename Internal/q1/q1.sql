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

/*CREATE DEFINER=`root`@`localhost` TRIGGER `org`.`library_BEFORE_DELETE` BEFORE DELETE ON `library` FOR EACH ROW
BEGIN
set sql_safe_updates=0;
delete from Library_Audit 
where old.b_id=bb_id;
END*/

/*
CREATE DEFINER=`root`@`localhost` TRIGGER `org`.`library_AFTER_UPDATE` AFTER UPDATE ON `library` FOR EACH ROW
BEGIN
set sql_safe_updates=0;
update Library_Audit 
set new.with_date=last_with where new.b_id=bb_id;
END
*/