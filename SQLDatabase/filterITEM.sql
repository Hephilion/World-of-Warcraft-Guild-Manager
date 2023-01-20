CREATE DEFINER=`ist176180`@`%` PROCEDURE `filterITEM`(IN bITEM_slot nvarchar(30),bITEM_type nvarchar(30))
BEGIN
	DROP TABLE IF EXISTS `FTable` CASCADE;
	DROP TABLE IF EXISTS `HeadTable` CASCADE;
    DROP TABLE IF EXISTS `ShouldersTable` CASCADE;
    DROP TABLE IF EXISTS `WristTable` CASCADE;
    DROP TABLE IF EXISTS `ChestTable` CASCADE;
    DROP TABLE IF EXISTS `WaistTable` CASCADE;
    DROP TABLE IF EXISTS `LegsTable` CASCADE;
    DROP TABLE IF EXISTS `FeetTable` CASCADE;
    IF NULLIF(bITEM_slot,'') IS NULL AND NULLIF(bITEM_type,'') IS NULL THEN
				SELECT * 
                FROM BOSSitem ;
    END IF;
	IF bITEM_slot IS NOT NULL  OR bITEM_type IS NOT NULL
    THEN
		CREATE TABLE `FTable`
		(	`ITEM_name` VARCHAR(255) NOT NULL,
			`ITEM_level` INT NULL,
			`ITEM_slot` VARCHAR(255) NULL,
			`ITEM_type` VARCHAR(255) NULL);
                
		IF bITEM_slot='Head' THEN
        CREATE TABLE HeadTable AS (SELECT * FROM BOSSitem WHERE ITEM_slot='Head') ;
			IF bITEM_type='Leather' THEN
				SELECT * FROM HeadTable
				WHERE ITEM_type='Leather'; 
			END IF;
			IF bITEM_type='Cloth' THEN
				SELECT * FROM HeadTable
				WHERE ITEM_type='Cloth'; 
			END IF;
            IF bITEM_type='Mail' THEN
				SELECT * FROM HeadTable
				WHERE ITEM_type='Mail'; 
			END IF;
            IF bITEM_type='Plate' THEN
				SELECT * FROM HeadTable
				WHERE ITEM_type='Plate'; 
			END IF;
            IF NULLIF(bITEM_type,'') IS NULL THEN
				SELECT * FROM HeadTable;
			END IF;
            #Shoulders
		END IF;
		IF bITEM_slot='Shoulders' THEN
			CREATE TABLE ShouldersTable AS (SELECT * FROM BOSSitem WHERE ITEM_slot='Shoulders') ;
			IF bITEM_type='Leather' THEN
				SELECT * FROM ShouldersTable
				WHERE ITEM_type='Leather'; 
			END IF;
			IF bITEM_type='Cloth' THEN
				SELECT * FROM ShouldersTable
				WHERE ITEM_type='Cloth'; 
			END IF;
            IF bITEM_type='Mail' THEN
				SELECT * FROM ShouldersTable
				WHERE ITEM_type='Mail'; 
			END IF;
            IF bITEM_type='Plate' THEN
				SELECT * FROM ShouldersTable
				WHERE ITEM_type='Plate'; 
			END IF;
            IF NULLIF(bITEM_type,'') IS NULL THEN
				SELECT * FROM ShouldersTable;
			END IF;
        END IF;
        IF bITEM_slot='Wrist' THEN
			CREATE TABLE WristTable AS (SELECT * FROM BOSSitem WHERE ITEM_slot='Wrist') ;
			IF bITEM_type='Leather' THEN
				SELECT * FROM WristTable
				WHERE ITEM_type='Leather'; 
			END IF;
			IF bITEM_type='Cloth' THEN
				SELECT * FROM WristTable
				WHERE ITEM_type='Cloth'; 
			END IF;
            IF bITEM_type='Mail' THEN
				SELECT * FROM WristTable
				WHERE ITEM_type='Mail'; 
			END IF;
            IF bITEM_type='Plate' THEN
				SELECT * FROM WristTable
				WHERE ITEM_type='Plate'; 
			END IF;
            IF NULLIF(bITEM_type,'') IS NULL THEN
				SELECT * FROM WristTable;
			END IF;
        END IF;
         IF bITEM_slot='Chest' THEN
			CREATE TABLE ChestTable AS (SELECT * FROM BOSSitem WHERE ITEM_slot='Chest') ;
			IF bITEM_type='Leather' THEN
				SELECT * FROM ChestTable
				WHERE ITEM_type='Leather'; 
			END IF;
			IF bITEM_type='Cloth' THEN
				SELECT * FROM ChestTable
				WHERE ITEM_type='Cloth'; 
			END IF;
            IF bITEM_type='Mail' THEN
				SELECT * FROM ChestTable
				WHERE ITEM_type='Mail'; 
			END IF;
            IF bITEM_type='Plate' THEN
				SELECT * FROM ChestTable
				WHERE ITEM_type='Plate'; 
			END IF;
            IF NULLIF(bITEM_type,'') IS NULL THEN
				SELECT * FROM ChestTable;
			END IF;
        END IF;
        IF bITEM_slot='Waist' THEN
			CREATE TABLE WaistTable AS (SELECT * FROM BOSSitem WHERE ITEM_slot='Waist') ;
			IF bITEM_type='Leather' THEN
				SELECT * FROM WaistTable
				WHERE ITEM_type='Leather'; 
			END IF;
			IF bITEM_type='Cloth' THEN
				SELECT * FROM WaistTable
				WHERE ITEM_type='Cloth'; 
			END IF;
            IF bITEM_type='Mail' THEN
				SELECT * FROM WaistTable
				WHERE ITEM_type='Mail'; 
			END IF;
            IF bITEM_type='Plate' THEN
				SELECT * FROM WaistTable
				WHERE ITEM_type='Plate'; 
			END IF;
            IF NULLIF(bITEM_type,'') IS NULL THEN
				SELECT * FROM WaistTable;
			END IF;
        END IF;
        IF bITEM_slot='Legs' THEN
			CREATE TABLE LegsTable AS (SELECT * FROM BOSSitem WHERE ITEM_slot='Legs') ;
			IF bITEM_type='Leather' THEN
				SELECT * FROM LegsTable
				WHERE ITEM_type='Leather'; 
			END IF;
			IF bITEM_type='Cloth' THEN
				SELECT * FROM LegsTable
				WHERE ITEM_type='Cloth'; 
			END IF;
            IF bITEM_type='Mail' THEN
				SELECT * FROM LegsTable
				WHERE ITEM_type='Mail'; 
			END IF;
            IF bITEM_type='Plate' THEN
				SELECT * FROM LegsTable
				WHERE ITEM_type='Plate'; 
			END IF;
            IF NULLIF(bITEM_type,'') IS NULL THEN
				SELECT * FROM LegsTable;
			END IF;
        END IF;
        
        IF bITEM_slot='Feet' THEN
			CREATE TABLE FeetTable AS (SELECT * FROM BOSSitem WHERE ITEM_slot='Feet') ;
			IF bITEM_type='Leather' THEN
				SELECT * FROM FeetTable
				WHERE ITEM_type='Leather'; 
			END IF;
			IF bITEM_type='Cloth' THEN
				SELECT * FROM FeetTable
				WHERE ITEM_type='Cloth'; 
			END IF;
            IF bITEM_type='Mail' THEN
				SELECT * FROM FeetTable
				WHERE ITEM_type='Mail'; 
			END IF;
            IF bITEM_type='Plate' THEN
				SELECT * FROM FeetTable
				WHERE ITEM_type='Plate'; 
			END IF;
            IF NULLIF(bITEM_type,'') IS NULL THEN
				SELECT * FROM FeetTable;
			END IF;
        END IF;
        
        IF bITEM_slot='Weapon' THEN
			SELECT * FROM BOSSitem
				WHERE ITEM_slot='Sword' OR ITEM_slot='Mace' OR ITEM_slot='Ranged' OR ITEM_slot='Fist weapon' OR ITEM_slot='Shield' OR ITEM_slot='Staff' OR ITEM_slot='Dagger'OR ITEM_slot='Axe' OR ITEM_slot='Polearm' OR ITEM_slot= 'Off hand';  
        END IF;
        
        IF bITEM_slot='Ring' OR bITEM_type='Ring' THEN
			SELECT * FROM BOSSitem
				WHERE ITEM_type='Ring'; 
        END IF;
		IF bITEM_slot='Trinket' OR bITEM_type='Trinket' THEN
			SELECT * FROM BOSSitem
				WHERE ITEM_type='Trinket'; 
        END IF;
        IF bITEM_slot='Back' THEN
			SELECT * FROM BOSSitem
				WHERE ITEM_slot='Back'; 
        END IF;
        IF bITEM_slot='Neck' THEN
			SELECT * FROM BOSSitem
				WHERE ITEM_slot='Neck'; 
        END IF;
        IF NULLIF(bITEM_slot,'') IS NULL AND bITEM_type='Leather' THEN
				SELECT * 
                FROM BOSSitem 
                WHERE ITEM_type='Leather';
		END IF;
        IF NULLIF(bITEM_slot,'') IS NULL AND bITEM_type='Plate' THEN
				SELECT * 
                FROM BOSSitem 
                WHERE ITEM_type='Plate';
		END IF;
        IF NULLIF(bITEM_slot,'') IS NULL AND bITEM_type='Mail' THEN
				SELECT * 
                FROM BOSSitem 
                WHERE ITEM_type='Mail';
		END IF;
        IF NULLIF(bITEM_slot,'') IS NULL AND bITEM_type='Cloth' THEN
				SELECT * 
                FROM BOSSitem 
                WHERE ITEM_type='Cloth';
		END IF;
        
        
    
		END IF;    
	
      
END