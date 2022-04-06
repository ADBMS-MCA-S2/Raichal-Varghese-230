CREATE DEFINER=`root`@`localhost` FUNCTION `percentage`(M1 int,M2 int,M3 int) RETURNS int(11)
BEGIN
declare percentage float;
RETURN (M1+M2+M3)/3;
END
