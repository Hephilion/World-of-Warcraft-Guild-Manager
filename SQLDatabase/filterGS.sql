CREATE DEFINER=`ist176180`@`%` PROCEDURE `filterGS`( IN GSTag INT)
BEGIN
	INSERT INTO TEMP1 
    SELECT CHAR_name, CHAR_race, CHAR_class, CHAR_role, CHAR_GS 
    FROM MemberList
    WHERE CHAR_GS>=GSTag;
    
    
END