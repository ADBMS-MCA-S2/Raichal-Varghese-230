CREATE TABLE dept(
id int primary key,
name varchar(20));

CREATE TABLE student(
id int primary key,
name varchar(20),
dept_id int ,
dob date,
FOREIGN KEY (dept_id) REFERENCES dept(id) ON DELETE CASCADE);

CREATE TABLE faculty(
name varchar(20),
id int primary key,
salary double,
dept_id int,
FOREIGN KEY (dept_id) REFERENCES dept(id) ON DELETE CASCADE);

INSERT INTO dept VALUES(3,'Physics');
INSERT INTO dept VALUES(4,'Chemistry');
INSERT INTO dept VALUES(5,'Maths');

INSERT INTO student VALUES(10,'Marvin',1,'2001-01-01');
INSERT INTO student VALUES(11,'Shibili',1,'2000-01-02');
INSERT INTO student VALUES(12,'Soni',3,'2002-01-03');
INSERT INTO student VALUES(13,'Joyal',4,'1999-01-04');
INSERT INTO student VALUES(14,'Jeslin',2,'1998-01-05');

INSERT INTO faculty VALUES('Mike',101,12000,1);
INSERT INTO faculty VALUES('Sam',102,23000,1);
INSERT INTO faculty VALUES('Ethan',103,45000,3);
INSERT INTO faculty VALUES('Ross',104,50000,2);
INSERT INTO faculty VALUES('Rachel',105,120000,4);

SELECT *
FROM student
ORDER BY dob;

SELECT *
FROM student s JOIN dept d
ON s.dept_id=d.id
WHERE d.name="CS";

SELECT *
FROM faculty
ORDER BY salary DESC;

SELECT d.name, count(s.id) 'student'
FROM student s JOIN dept d
ON s.dept_id=d.id
GROUP BY d.id;

SELECT d.name,count(f.id) 'faculty'
FROM faculty f JOIN dept d
ON f.dept_id=d.id
where f.salary>25000