CREATE DEFINER=`ist176180`@`%` PROCEDURE `filterGroupRole`( IN isTanky BOOL,isDPSy BOOL, isHealery BOOL)
BEGIN
	DROP TABLE IF EXISTS `TankyTable` CASCADE;
    DROP TABLE IF EXISTS `DPSyTable` CASCADE;
    DROP TABLE IF EXISTS `HealeryTable` CASCADE;
    DROP TABLE IF EXISTS `GroupTable` CASCADE;
    DROP TABLE IF EXISTS `TEMP1` CASCADE;
    DROP TABLE IF EXISTS `TEMP2` CASCADE;
    DROP TABLE IF EXISTS `TEMP3` CASCADE;
	IF isTanky=1 or isDPSy=1 or isHealery=1
    THEN
		CREATE TABLE `GroupTable`
			(`CHAR_name` VARCHAR(255) NOT NULL,
			`CHAR_race` VARCHAR(255) NULL,
            `CHAR_class` VARCHAR(255) NULL,
			 `CHAR_role` VARCHAR(255) NULL,
			 `CHAR_GS` INT NULL);
        INSERT INTO `GroupTable` VALUES 
        ('JOHN', 'W', 'H', 'D', '0');
		IF isTanky=1 THEN
			CREATE TEMPORARY TABLE TankyTable
			SELECT CHAR_name, CHAR_race, CHAR_class, CHAR_role, CHAR_GS 
            FROM GroupList
            WHERE CHAR_role='Tank';
			CREATE TABLE TEMP1 AS (SELECT * FROM GroupTable) UNION (SELECT * FROM TankyTable);
            DROP TABLE IF EXISTS `GroupTable` CASCADE;
			RENAME TABLE `TEMP1` TO `GroupTable`;
		END IF;
		IF isDPSy=1 THEN
			CREATE TEMPORARY TABLE DPSyTable
			SELECT CHAR_name, CHAR_race, CHAR_class, CHAR_role, CHAR_GS 
            FROM GroupList
            WHERE CHAR_role='DPS';
            CREATE TABLE TEMP2 AS (SELECT * FROM GroupTable) UNION (SELECT * FROM DPSyTable);
            DROP TABLE IF EXISTS `GroupTable` CASCADE;
			RENAME TABLE `TEMP2` TO `GroupTable`;
		END IF;
		IF isHealery=1 THEN
			CREATE TEMPORARY TABLE HealeryTable
			SELECT CHAR_name, CHAR_race, CHAR_class, CHAR_role, CHAR_GS 
            FROM GroupList
            WHERE CHAR_role='Healer';
            CREATE TABLE TEMP3 AS (SELECT * FROM GroupTable) UNION (SELECT * FROM HealeryTable);
			DROP TABLE IF EXISTS `GroupTable` CASCADE;
			RENAME TABLE `TEMP3` TO `GroupTable`;
		END IF; 
        
        SET SQL_SAFE_UPDATES = 0;
        DELETE FROM GroupTable WHERE CHAR_name='JOHN'; 
        SET SQL_SAFE_UPDATES = 1;
        
        SELECT CHAR_name, CHAR_race, CHAR_class, CHAR_role, CHAR_GS FROM GroupTable;
        
		
	ELSEIF (isTanky=0 AND isDPSy=0 AND isHealery=0) THEN
		#INSERT INTO TEMPML2
        SELECT CHAR_name, CHAR_race, CHAR_class, CHAR_role, CHAR_GS FROM GroupList;	
	END IF;
    
    DROP TABLE IF EXISTS `GroupTable` CASCADE;    
	DROP TABLE IF EXISTS `TankyTable` CASCADE;
    DROP TABLE IF EXISTS `DPSyTable` CASCADE;
    DROP TABLE IF EXISTS `HealeryTable` CASCADE;
    DROP TABLE IF EXISTS `TEMP1` CASCADE;
    DROP TABLE IF EXISTS `TEMP2` CASCADE;
    DROP TABLE IF EXISTS `TEMP3` CASCADE;
        
END