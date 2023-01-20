CREATE DEFINER=`ist176180`@`%` PROCEDURE `selectBoss`( nameBoss VARCHAR(255))
BEGIN
		DROP TABLE IF EXISTS `BOSSitem` CASCADE;
        
        CREATE TABLE BOSSitem 
		(`ITEM_name` VARCHAR(255) NOT NULL)	;
    
        INSERT INTO BOSSitem
		SELECT ITEM_name 
		FROM Drops
		WHERE BOSS_name=nameBoss; 
        
        SELECT * 
		FROM  BOSSitem
		NATURAL JOIN ITEM;
        
        
        
        
        
		
END