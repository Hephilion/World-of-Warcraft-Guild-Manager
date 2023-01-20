CREATE DEFINER=`ist176180`@`%` PROCEDURE `filterRole`( IN isTank BOOL,isDPS BOOL, isHealer BOOL)
BEGIN
	DROP TABLE IF EXISTS `TankTable` CASCADE;
    DROP TABLE IF EXISTS `DPSTable` CASCADE;
    DROP TABLE IF EXISTS `HealerTable` CASCADE;
    DROP TABLE IF EXISTS `FullTable` CASCADE;
    DROP TABLE IF EXISTS `TEMP1` CASCADE;
    DROP TABLE IF EXISTS `TEMP2` CASCADE;
    DROP TABLE IF EXISTS `TEMP3` CASCADE;
	IF isTank=1 or isDPS=1 or isHealer=1
    THEN
		CREATE TABLE `FullTable`
			(`CHAR_name` VARCHAR(255) NOT NULL,
			`CHAR_race` VARCHAR(255) NULL,
            `CHAR_class` VARCHAR(255) NULL,
			 `CHAR_role` VARCHAR(255) NULL,
			 `CHAR_GS` INT NULL);
        INSERT INTO `FullTable` VALUES 
        ('JOHN', 'W', 'H', 'D', '0');
		IF isTank=1 THEN
			CREATE TEMPORARY TABLE TankTable
			SELECT CHAR_name, CHAR_race, CHAR_class, CHAR_role, CHAR_GS 
            FROM MemberList
            WHERE CHAR_role='Tank';
			CREATE TABLE TEMP1 AS (SELECT * FROM FullTable) UNION (SELECT * FROM TankTable);
            DROP TABLE IF EXISTS `FullTable` CASCADE;
			RENAME TABLE `TEMP1` TO `FullTable`;
		END IF;
		IF isDPS=1 THEN
			CREATE TEMPORARY TABLE DPSTable
			SELECT CHAR_name, CHAR_race, CHAR_class, CHAR_role, CHAR_GS 
            #INTO DPSTable
            FROM MemberList
            WHERE CHAR_role='DPS';
            CREATE TABLE TEMP2 AS (SELECT * FROM FullTable) UNION (SELECT * FROM DPSTable);
            DROP TABLE IF EXISTS `FullTable` CASCADE;
			RENAME TABLE `TEMP2` TO `FullTable`;
		END IF;
		IF isHealer=1 THEN
			CREATE TEMPORARY TABLE HealerTable
			SELECT CHAR_name, CHAR_race, CHAR_class, CHAR_role, CHAR_GS 
            FROM MemberList
            WHERE CHAR_role='Healer';
            CREATE TABLE TEMP3 AS (SELECT * FROM FullTable) UNION (SELECT * FROM HealerTable);
			DROP TABLE IF EXISTS `FullTable` CASCADE;
			RENAME TABLE `TEMP3` TO `FullTable`;
		END IF; 
        
        SET SQL_SAFE_UPDATES = 0;
        DELETE FROM FullTable WHERE CHAR_name='JOHN'; 
        SET SQL_SAFE_UPDATES = 1;
        
        INSERT INTO TEMPML2
		SELECT * FROM FullTable;
        
		
	ELSEIF (isTank=0 AND isDPS=0 AND isHealer=0) THEN
		INSERT INTO TEMPML2
        SELECT CHAR_name, CHAR_race, CHAR_class, CHAR_role, CHAR_GS FROM MemberList;	
	END IF;
    
    DROP TABLE IF EXISTS `FullTable` CASCADE;    
	DROP TABLE IF EXISTS `TankTable` CASCADE;
    DROP TABLE IF EXISTS `DPSTable` CASCADE;
    DROP TABLE IF EXISTS `HealerTable` CASCADE;
    DROP TABLE IF EXISTS `TEMP1` CASCADE;
    DROP TABLE IF EXISTS `TEMP2` CASCADE;
    DROP TABLE IF EXISTS `TEMP3` CASCADE;
        
END