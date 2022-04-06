CREATE DEFINER=`root`@`localhost` PROCEDURE `onmark`(s_id varchar(5),Stud_NAME varchar(10),M1 int,M2 int,M3 int)
BEGIN
IF(M1<40 OR M2<40 OR M3<40) THEN 
INSERT INTO Stud values(s_id,Stud_NAME,M1,M2,M3,'FAIL');
END IF;
IF(M1>40 AND M2>40 AND M3>40) THEN 
INSERT INTO Stud values(s_id,Stud_NAME,M1,M2,M3,'PASS');
END IF;
END
