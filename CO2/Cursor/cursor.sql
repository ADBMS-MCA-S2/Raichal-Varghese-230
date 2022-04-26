create database college;
use college;
drop table library;
create table library(shelf_no int,category varchar(10),book_name varchar(20));
insert into library values(101,'Topology','Real Analysis');
insert into library values(102,'Algebra','Linear Algebra');
insert into library values(103,'Analysis','Complex Analysis');
insert into library values(104,'OR','Operations Research');
insert into library values(106,'NumberSys','AbstractAlg');

create table book_by_order(book_shelf int,book_category varchar(20),bookname varchar(20));
select * from library;

call book_details();
/*
CREATE DEFINER=`root`@`localhost` PROCEDURE `book_details`()
BEGIN
declare book_shelf int;
declare bookname varchar(20);
declare book_category varchar(10);
declare C_finished integer default 0;
declare C1 cursor for select shelf_no,category,book_name from library;
declare continue handler for not found set C_finished = 1;
open C1;
book_details:loop
if C_finished=1 then
leave book_details;
end if;
if C_finished = 0 then
Fetch from C1 into book_shelf,book_category,bookname;
if book_category = 'OR' then
insert into book_by_order values(book_shelf,bookname,book_category);
end if;
end if;
end loop;
close C1;

END
*/
