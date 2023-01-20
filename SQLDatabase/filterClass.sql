CREATE DEFINER=`ist176180`@`%` PROCEDURE `filterClass`( isWarrior BOOL, isPaladin BOOL, isHunter BOOL, isRogue BOOL, isPriest BOOL, isDK BOOL, isShaman BOOL, isMage BOOL, isWarlock BOOL ,isDruid BOOL)
BEGIN
	DROP TABLE IF EXISTS `FullTable` CASCADE;
    DROP TABLE IF EXISTS `WarriorTable` CASCADE;
    DROP TABLE IF EXISTS `PaladinTable` CASCADE;
    DROP TABLE IF EXISTS `HunterTable` CASCADE;
    DROP TABLE IF EXISTS `RogueTable` CASCADE;
    DROP TABLE IF EXISTS `PriestTable` CASCADE;
    DROP TABLE IF EXISTS `DKTable` CASCADE;
    DROP TABLE IF EXISTS `ShamanTable` CASCADE;
    DROP TABLE IF EXISTS `MageTable` CASCADE;
    DROP TABLE IF EXISTS `WarlockTable` CASCADE;
    DROP TABLE IF EXISTS `DruidTable` CASCADE;
    DROP TABLE IF EXISTS `T1` CASCADE;
    DROP TABLE IF EXISTS `T2` CASCADE;
    DROP TABLE IF EXISTS `T3` CASCADE;
    DROP TABLE IF EXISTS `T4` CASCADE;
    DROP TABLE IF EXISTS `T5` CASCADE;
    DROP TABLE IF EXISTS `T6` CASCADE;
    DROP TABLE IF EXISTS `T7` CASCADE;
    DROP TABLE IF EXISTS `T8` CASCADE;
    DROP TABLE IF EXISTS `T9` CASCADE;
    DROP TABLE IF EXISTS `T10` CASCADE;
    
    
	IF isWarrior=1 OR isPaladin=1 OR isHunter=1 OR isRogue=1 OR isPriest=1 OR isDK=1 OR isShaman=1 OR isMage=1 OR isWarlock=1 OR isDruid=1
    THEN
		CREATE TABLE `FullTable`
			(`CHAR_name` VARCHAR(255) NOT NULL,
			`CHAR_race` VARCHAR(255) NULL,
            `CHAR_class` VARCHAR(255) NULL,
			 `CHAR_role` VARCHAR(255) NULL,
			 `CHAR_GS` INT NULL);
        INSERT INTO `FullTable` VALUES 
        ('Helena', 'W', 'H', 'D', '0');
                
		IF isWarrior=1 THEN
			CREATE TEMPORARY TABLE WarriorTable
			SELECT CHAR_name, CHAR_race, CHAR_class, CHAR_role, CHAR_GS
            FROM MemberList
            WHERE CHAR_class='Warrior';
            CREATE TABLE T1 AS (SELECT * FROM FullTable) UNION (SELECT * FROM WarriorTable);
            DROP TABLE IF EXISTS `FullTable` CASCADE;
			RENAME TABLE `T1` TO `FullTable`;
            
		END IF;
        IF isPaladin=1 THEN
			CREATE TEMPORARY TABLE PaladinTable
			SELECT CHAR_name, CHAR_race, CHAR_class, CHAR_role, CHAR_GS 
            FROM MemberList
            WHERE CHAR_class='Paladin';
            CREATE TABLE T2 AS (SELECT * FROM FullTable) UNION (SELECT * FROM PaladinTable);
            DROP TABLE IF EXISTS `FullTable` CASCADE;
			RENAME TABLE `T2` TO `FullTable`;
		END IF;
        IF isHunter=1 THEN
			CREATE TEMPORARY TABLE HunterTable
			SELECT CHAR_name, CHAR_race, CHAR_class, CHAR_role, CHAR_GS 
            FROM MemberList
            WHERE CHAR_class='Hunter';
            CREATE TABLE T3 AS (SELECT * FROM FullTable) UNION (SELECT * FROM HunterTable);
            DROP TABLE IF EXISTS `FullTable` CASCADE;
			RENAME TABLE `T3` TO `FullTable`;
		END IF;
        IF isRogue=1 THEN
			CREATE TEMPORARY TABLE RogueTable
			SELECT CHAR_name, CHAR_race, CHAR_class, CHAR_role, CHAR_GS 
            FROM MemberList
            WHERE CHAR_class='Rogue';
            CREATE TABLE T4 AS (SELECT * FROM FullTable) UNION (SELECT * FROM RogueTable);
            DROP TABLE IF EXISTS `FullTable` CASCADE;
			RENAME TABLE `T4` TO `FullTable`;
		END IF;
        IF isPriest=1 THEN
			CREATE TEMPORARY TABLE PriestTable
			SELECT CHAR_name, CHAR_race, CHAR_class, CHAR_role, CHAR_GS 
            FROM MemberList
            WHERE CHAR_class='Priest';
            CREATE TABLE T5 AS (SELECT * FROM FullTable) UNION (SELECT * FROM PriestTable);
            DROP TABLE IF EXISTS `FullTable` CASCADE;
			RENAME TABLE `T5` TO `FullTable`;
		END IF;
        IF isDK=1 THEN
			CREATE TEMPORARY TABLE DKTable
			SELECT CHAR_name, CHAR_race, CHAR_class, CHAR_role, CHAR_GS 
            FROM MemberList
            WHERE CHAR_class='Death Knight';
            CREATE TABLE T6 AS (SELECT * FROM FullTable) UNION (SELECT * FROM DKTable);
            DROP TABLE IF EXISTS `FullTable` CASCADE;
			RENAME TABLE `T6` TO `FullTable`;
		END IF;
        IF isShaman=1 THEN
			CREATE TEMPORARY TABLE ShamanTable
			SELECT CHAR_name, CHAR_race, CHAR_class, CHAR_role, CHAR_GS 
            FROM MemberList
            WHERE CHAR_class='Shaman';
            CREATE TABLE T7 AS (SELECT * FROM FullTable) UNION (SELECT * FROM ShamanTable);
            DROP TABLE IF EXISTS `FullTable` CASCADE;
			RENAME TABLE `T7` TO `FullTable`;
		END IF;
        IF isMage=1 THEN
			CREATE TEMPORARY TABLE MageTable
			SELECT CHAR_name, CHAR_race, CHAR_class, CHAR_role, CHAR_GS 
            FROM MemberList
            WHERE CHAR_class='Mage';
            CREATE TABLE T8 AS (SELECT * FROM FullTable) UNION (SELECT * FROM MageTable);
            DROP TABLE IF EXISTS `FullTable` CASCADE;
			RENAME TABLE `T8` TO `FullTable`;
		END IF;
        IF isWarlock=1 THEN
			CREATE TEMPORARY TABLE WarlockTable
			SELECT CHAR_name, CHAR_race, CHAR_class, CHAR_role, CHAR_GS 
            FROM MemberList
            WHERE CHAR_class='Warlock';
            CREATE TABLE T9 AS (SELECT * FROM FullTable) UNION (SELECT * FROM WarlockTable);
            DROP TABLE IF EXISTS `FullTable` CASCADE;
			RENAME TABLE `T9` TO `FullTable`;
		END IF;
        IF isDruid=1 THEN
			CREATE TEMPORARY TABLE DruidTable
			SELECT CHAR_name, CHAR_race, CHAR_class, CHAR_role, CHAR_GS 
            FROM MemberList
            WHERE CHAR_class='Druid';
            CREATE TABLE T10 AS (SELECT * FROM FullTable) UNION (SELECT * FROM DruidTable);
            DROP TABLE IF EXISTS `FullTable` CASCADE;
			RENAME TABLE `T10` TO `FullTable`;
		END IF;
        
		SET SQL_SAFE_UPDATES = 0;
			DELETE FROM FullTable WHERE CHAR_name='Helena'; 
        SET SQL_SAFE_UPDATES = 1;
        
        INSERT INTO TEMPML3 
		SELECT * FROM FullTable;
        
	ELSEIF (isWarrior=0 AND isPaladin=0 AND isHunter=0 AND isRogue=0 AND isPriest=0 AND isDK=0 AND isShaman=0 AND isMage=0 AND isWarlock=0 AND isDruid=0) THEN
		INSERT INTO TEMPML3
        SELECT CHAR_name, CHAR_race, CHAR_class, CHAR_role, CHAR_GS FROM MemberList;	
	
    END IF;
    
    DROP TABLE IF EXISTS `FullTable` CASCADE;
    DROP TABLE IF EXISTS `WarriorTable` CASCADE;
    DROP TABLE IF EXISTS `PaladinTable` CASCADE;
    DROP TABLE IF EXISTS `HunterTable` CASCADE;
    DROP TABLE IF EXISTS `RogueTable` CASCADE;
    DROP TABLE IF EXISTS `PriestTable` CASCADE;
    DROP TABLE IF EXISTS `DKTable` CASCADE;
    DROP TABLE IF EXISTS `ShamanTable` CASCADE;
    DROP TABLE IF EXISTS `MageTable` CASCADE;
    DROP TABLE IF EXISTS `WarlockTable` CASCADE;
    DROP TABLE IF EXISTS `DruidTable` CASCADE;
END