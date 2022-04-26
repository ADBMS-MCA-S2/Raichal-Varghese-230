create database shop;
use shop;
drop table product;
drop table purchase;
create table product(p_id int,p_name varchar(20),quantity int,price int);
create table purchase(pid int ,p_nm varchar(20),purchased_quant int);
insert into product values(1,'Soap',5,35);
insert into product values(2,'mirror',3,60);
insert into product values(3,'comb',2,30);
insert into product values(4,'Pen',20,5);
select * from product;
insert into purchase values(2,'mirror',1);
insert into purchase values(4,'Pen',4);
select * from purchase;
/*
CREATE DEFINER=`root`@`localhost` TRIGGER `purchase_AFTER_INSERT` AFTER INSERT ON `purchase` FOR EACH ROW BEGIN
set sql_safe_updates= 0;
update product set
quantity=quantity-new.purchased_quant where p_name= new.p_nm ;
END
*/