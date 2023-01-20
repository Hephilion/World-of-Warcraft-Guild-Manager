CREATE DEFINER=`ist176180`@`%` PROCEDURE `addMember`( IN New_name VARCHAR(255),
 New_class VARCHAR(255),
 New_race VARCHAR(255) ,
 New_AP INT,
 New_role VARCHAR(255),
 New_level INT ,	
 New_prof1 VARCHAR(255),	
 New_prof2 VARCHAR(255),
 New_GS INT, New_rank VARCHAR(255) )
BEGIN
	 INSERT INTO `CHARACTERS` VALUES 
	 (New_name,New_class, New_race, New_AP , New_role , New_level ,New_prof1 , New_prof2 , New_GS );
     INSERT INTO `GBelongs` VALUES
     (0, New_rank, 'Mythic Dawn',New_name);
     INSERT INTO `MemberList` VALUES 
	 (New_name,New_class, New_race, New_AP , New_role , New_level ,New_prof1 , New_prof2 , New_GS );
END