CREATE DEFINER=`ist176180`@`%` PROCEDURE `addToGroup`( IN nameTag VARCHAR(255))
BEGIN
	INSERT INTO GroupList
	SELECT * FROM MemberList
    WHERE CHAR_name=nameTag;
    
    SET SQL_SAFE_UPDATES = 0;
    DELETE FROM MemberList WHERE CHAR_name=nameTag; 
    SET SQL_SAFE_UPDATES = 1;
       
    
END