CREATE DEFINER=`ist176180`@`%` PROCEDURE `getInfo`(IN Cname nvarchar(30))
BEGIN
	    DROP TABLE IF EXISTS `INFO` CASCADE;
        
        CREATE TEMPORARY TABLE INFO (
		`CHAR_name` VARCHAR(255) NOT NULL,
		`CHAR_class` VARCHAR(255) NULL,
		`CHAR_race` VARCHAR(255) NULL,
		`CHAR_AP` INT NULL,
		`CHAR_role` VARCHAR(255) NULL,
		`CHAR_level` INT NULL,	
		`CHAR_prof1` VARCHAR(255) NULL,	
		`CHAR_prof2` VARCHAR(255) NULL,
		`CHAR_GS` INT NULL,
        `DKP` INT NULL,
		`rank` VARCHAR(255) NULL,
		`GUILD_name` VARCHAR(255) NOT NULL);
        
        
        INSERT INTO  INFO
        SELECT * 
		FROM  CHARACTERS
		NATURAL JOIN GBelongs;
        
        SELECT *
        FROM INFO
        WHERE CHAR_name=Cname;
    
END