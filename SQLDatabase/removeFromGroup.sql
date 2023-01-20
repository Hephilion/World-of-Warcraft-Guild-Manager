CREATE DEFINER=`ist176180`@`%` PROCEDURE `removeFromGroup`( IN nameTag VARCHAR(255))
BEGIN
	INSERT INTO MemberList
	SELECT * FROM GroupList
    WHERE CHAR_name=nameTag;
    
    SET SQL_SAFE_UPDATES = 0;
    DELETE FROM GroupList WHERE CHAR_name=nameTag; 
    SET SQL_SAFE_UPDATES = 1;
       
    
END