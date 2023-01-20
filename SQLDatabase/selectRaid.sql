CREATE DEFINER=`ist176180`@`%` PROCEDURE `selectRaid`( nameRaid VARCHAR(255))
BEGIN
		      
        DROP TABLE IF EXISTS `BOSSfromRaid` CASCADE;
        DROP TABLE IF EXISTS `BOSSitem` CASCADE;
        
        CREATE TABLE BOSSfromRaid 
		(`Boss_name` VARCHAR(255) NOT NULL)	;
    
        INSERT INTO BOSSfromRaid
		SELECT BOSS_name
        FROM `RBelongs`
        WHERE DR_name=nameRaid
        ORDER BY DR_position ;
        
        SELECT * 
		FROM  BOSSfromRaid
		NATURAL JOIN BOSS;
		
END