drop database Movie;
create database Movie;
use Movie;

create table ACTOR(
Act_id int,
Act_Name varchar(10),
Act_Gender varchar(9),
check(Gender in ('M','F')),
primary key(Act_id)
);

drop TABLE DIRECTOR;
create table Director(
Dir_id int,
Dir_Name varchar(10),
Dir_Phone int,
primary key(Dir_id)
);

drop table MOVIES;
create table MOVIES(
Mov_id int,
Mov_Title varchar(10),
Mov_Year int,
Mov_Lang varchar(10),
Dir_id int,
primary key(Mov_id)
);

DROP TABLE MOVIE_CAST;
create table MOVIE_CAST(
Act_id int,
Mov_id int,
Role varchar(10)
);

create table RATING(
Mov_id int,
Rev_Stars varchar(10)
);

insert into ACTOR VALUES(1,'KIM','M');
insert into ACTOR VALUES(2,'Jaden’','F');
insert into ACTOR VALUES(3,'Hazel','F');
insert into ACTOR VALUES(4,'John','M');

insert into DIRECTOR VALUES(1,'Hitchcock',980708);
insert into DIRECTOR VALUES(2,'Steven Spielberg',9867708);
insert into DIRECTOR VALUES(3,'Sam',101708);

insert into MOVIES VALUES(1,'Tenet',2000,'English',1);
insert into MOVIES VALUES(2,'Green Book',2011,'English',3);
insert into MOVIES VALUES(3,'Dark knight',2008,'English',1);
insert into MOVIES VALUES(4,'Insception',2016,'English',2);

insert into MOVIE_CAST values(1,1,'Hero');
insert into MOVIE_CAST values(1,2,'Hero');
insert into MOVIE_CAST values(3,3,'Hero');
insert into MOVIE_CAST values(4,4,'Hero');

insert into RATING values(1,8.1);
insert into RATING values(2,6.1);
insert into RATING values(3,5.1);
insert into RATING values(4,9.1);

select * from MOVIES;
select * from MOVIE_CAST;
select * from RATING;
select * from DIRECTOR;
select * from ACTOR;

-- 1. List the titles of all movies directed by ‘Hitchcock’. 
select m.Mov_Title from MOVIES m JOIN DIRECTOR d on m.Dir_id=d.Dir_id WHERE d.Dir_Name='Hitchcock' ;

-- 2. Find the movie names where one or more actors acted in two or more movies. 
select m.Mov_Title,count(m.Mov_id) as movie,mc.Act_id as Actor from MOVIES m join MOVIE_CAST mc on m.Mov_id=mc.Mov_id group by m.Mov_Title;


-- 3. List all actors who acted in a movie before 2000 and also in a movieafter 2015 (use JOIN operation). 
select m.Mov_Year,mc.Act_id from MOVIES m join MOVIE_CAST mc on m.Mov_id=mc.Mov_id where (m.Mov_Year<2000 or m.Mov_Year>2015);


-- 4. Find the title of movies and number of stars for each movie that has at least one rating and find the highest number of stars that movie received. Sort the result by movie title. 
select m.Mov_Title,r.Rev_Stars from MOVIES m join RATING r on m.Mov_id=r.Mov_id where r.Rev_Stars>1 group by m.Mov_Title;
select m.Mov_Title,max(r.Rev_Stars) from MOVIES m join RATING r on m.Mov_id=r.Mov_id where r.Rev_Stars>1 ;

-- 5. Update rating of all movies directed by ‘Steven Spielberg’ to5.
select * from MOVIES m join RATING r on m.Mov_id=r.Mov_id;

update RATING 
set Rev_Stars=5
where(
select * from DIRECTOR d JOIN (select m.Dir_id,r.Mov_id,r.Rev_Stars from MOVIES m JOIN RATING r ON m.Mov_id=r.Mov_id ) e on d.Dir_id=e.Dir_id where d.Dir_Name='Steven Spi');