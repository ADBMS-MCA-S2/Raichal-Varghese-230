drop database Movie;
create database Movie;
use Movie;

drop table ACTOR;
create table ACTOR(
Act_id varchar(5),
Act_Name varchar(20),
Act_Gender varchar(9),
check(Act_Gender in ('M','F')),
primary key(Act_id)
);

drop table DIRECTOR;
create table Director(
Dir_id varchar(5),
Dir_Name varchar(20),
Dir_Phone int,
primary key(Dir_id)
);

drop table MOVIES;
create table MOVIES(
Mov_id varchar(5),
Mov_Title varchar(20),
Mov_Year int,
Mov_Lang varchar(20),
Dir_id varchar(5),
primary key(Mov_id)
);

DROP TABLE MOVIE_CAST;
create table MOVIE_CAST(
Act_id varchar(5),
Mov_id varchar(5),
Role varchar(10)
);

drop table RATING;
create table RATING(
Mov_id varchar(5),
Rev_Stars varchar(5)
);
SHOW TABLES;

insert into ACTOR VALUES('A01','Simon Pegg','M');
insert into ACTOR VALUES('A02','James McGarth','M');
insert into ACTOR VALUES('A03','Titus Welliver','M');
insert into ACTOR VALUES('A04','Richard Jaeckal','M');
insert into ACTOR VALUES('A05','Angelina Jolie','F');
insert into ACTOR VALUES('A06','Jennifer Garner','F');
insert into ACTOR VALUES('A07','Lena Headey','F');
SELECT * FROM ACTOR;

insert into DIRECTOR VALUES('D01','Hitchcock',980708);
insert into DIRECTOR VALUES('D02','StevenSpielberg',9867708);
insert into DIRECTOR VALUES('D03','JJ Abraham',101708);
insert into DIRECTOR VALUES('D04','Ben Affleck',101708);
insert into DIRECTOR VALUES('D05','Robert Aldrich',101708);
insert into DIRECTOR VALUES('D06','Woody Allen',101708);
SELECT * FROM DIRECTOR;

insert into MOVIES VALUES('M01','Mission Impossible',2006,'English','D01');
insert into MOVIES VALUES('M02','Green Book',2011,'English','D02');
insert into MOVIES VALUES('M03','Dark knight',2018,'English','D03');
insert into MOVIES VALUES('M04','Star Trek',2016,'French','D04');
insert into MOVIES VALUES('M05','Darkness',2014,'English','D05');
insert into MOVIES VALUES('M06','Alias',1999,'Chinese','D06');
insert into MOVIES VALUES('M07','Argo',2004,'English','D04');
insert into MOVIES VALUES('M08','Vera Cruz',1978,'Korean','D01');
insert into MOVIES VALUES('M09','Big Knife',2001,'English','D06');
insert into MOVIES VALUES('M10','Deadly',2021,'English','D03');
SELECT * FROM MOVIES;


insert into MOVIE_CAST values('A01','M01','Tony');
insert into MOVIE_CAST values('A02','M01','Rene');
insert into MOVIE_CAST values('A03','M02','Micheal');
insert into MOVIE_CAST values('A04','M03','Elliot');
insert into MOVIE_CAST values('A05','M04','Jane');
insert into MOVIE_CAST values('A03','M10','Jack');
insert into MOVIE_CAST values('A07','M05','Rachel');
insert into MOVIE_CAST values('A02','M04','Henry');
insert into MOVIE_CAST values('A06','M01','Angel');
insert into MOVIE_CAST values('A07','M06','Monica');
insert into MOVIE_CAST values('A01','M10','John');
insert into MOVIE_CAST values('A04','M07','Martin');
insert into MOVIE_CAST values('A06','M08','Kate');
insert into MOVIE_CAST values('A07','M09','Kylie');
SELECT * FROM MOVIE_CAST;


insert into RATING values('M01',8.1);
insert into RATING values('M02',6.1);
insert into RATING values('M03',5.1);
insert into RATING values('M04',2.1);
insert into RATING values('M05',3.5);
insert into RATING values('M06',7.6);
insert into RATING values('M07',9.9);
insert into RATING values('M08',9.2);
insert into RATING values('M09',6.1);
insert into RATING values('M10',4.1);

select * from RATING;

-- 1. List the titles of all movies directed by ‘Hitchcock’. 

select m.Mov_Title,d.Dir_Name from MOVIES m JOIN DIRECTOR d on m.Dir_id=d.Dir_id WHERE d.Dir_Name='Hitchcock' ;

-- 2. Find the actors who one acted in two or more movies. 

select a.Act_Name,c.Mov_Title from ACTOR a join (select m.Mov_Title,m.Mov_id as movie,mc.Act_id as Actor,mc.Act_id from MOVIES m join MOVIE_CAST mc on m.Mov_id=mc.Mov_id group by m.Mov_Title) c on a.Act_id=c.Act_id group by a.Act_Name having count(a.Act_Name)>1 ; 

-- 3. List all actors who acted in a movie before 2000 and also in a movieafter 2015 (use JOIN operation).
 
select a.Act_Name as ACTOR,b.Mov_Title as Title,b.Mov_Year as Year from ACTOR a join (select m.Mov_Year,mc.Act_id,m.Mov_id,m.Mov_Title from MOVIES m join MOVIE_CAST mc on m.Mov_id=mc.Mov_id where (m.Mov_Year<2000 or m.Mov_Year>2015)) b on a.Act_id=b.Act_id;

-- 4. Find the title of movies and number of stars for each movie that has at least one rating and find the highest number of stars that movie received. Sort the result by movie title. 
select m.Mov_Title,r.Rev_Stars from MOVIES m join RATING r on m.Mov_id=r.Mov_id where r.Rev_Stars>1 group by m.Mov_Title having max(r.Rev_Stars)>0 order by m.Mov_Title;


-- 5. Update rating of all movies directed by ‘Steven Spielberg’ to5.
select * from RATING;

select d.Dir_Name,a.Mov_Title,a.Rev_Stars from DIRECTOR d  join (select m.Mov_Title,r.Rev_Stars,m.Dir_id from MOVIES m join RATING r on m.Mov_id = r.Mov_id) a on d.Dir_id = a.Dir_id where d.Dir_Name = "StevenSpielberg";

update RATING 
set Rev_Stars = 5
where  Mov_id in
(select Mov_id from MOVIES WHERE Dir_id in
(select Dir_id from DIRECTOR WHERE Dir_Name ='StevenSpielberg') );

select d.Dir_Name,a.Mov_Title,a.Rev_Stars from DIRECTOR d  join (select m.Mov_Title,r.Rev_Stars,m.Dir_id from MOVIES m join RATING r on m.Mov_id = r.Mov_id) a on d.Dir_id = a.Dir_id where d.Dir_Name = "StevenSpielberg";



