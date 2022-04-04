CREATE DATABASE bank; CREATE TABLE customer(
cid int primary key,
cname varchar(20),
loc varchar(20),
sex varchar(20),
dob varchar(20));
CREATE TABLE bank_branch(
bcode varchar(10) primary key,
bloc varchar(20),
bstate varchar(20));
CREATE TABLE deposit(
dacno int primary key,
dtype varchar(20),
ddate varchar(20),
damt varchar(20));
CREATE TABLE loan(
lacno int primary key,
ltype varchar(20),
ldate varchar(20),
lamt float(20));
CREATE TABLE accounts_in(
bcode varchar(20) ,
cid int,
FOREIGN KEY (bcode) REFERENCES bank_branch(bcode) ON DELETE CASCADE,
FOREIGN KEY (cid) REFERENCES customer(cid) ON DELETE CASCADE);
CREATE TABLE Depositor(
cid int ,
dacno int,
FOREIGN KEY (dacno) REFERENCES deposit(dacno) ON DELETE CASCADE,
FOREIGN KEY (cid) REFERENCES customer(cid) ON DELETE CASCADE);
CREATE TABLE Borrower(
cid int ,
lacno int,
FOREIGN KEY (lacno) REFERENCES loan(lacno) ON DELETE CASCADE,
FOREIGN KEY (cid) REFERENCES customer(cid) ON DELETE CASCADE);
DESCRIBE customer;
DESCRIBE bank_branch;
DESCRIBE deposit;
DESCRIBE loan;
DESCRIBE accounts_in;
DESCRIBE Depositor;
DESCRIBE Borrower;
DROP TABLE customer;
DROP TABLE bank_branch;
DROP TABLE deposit;
DROP TABLE loan;
DROP TABLE accounts_in;
DROP TABLE Depositor;
DROP TABLE Borrower;