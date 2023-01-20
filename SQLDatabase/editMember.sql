CREATE DEFINER=`ist176180`@`%` PROCEDURE `editMember`( IN Edit_name VARCHAR(255),
 Edit_class VARCHAR(255),
 Edit_race VARCHAR(255) ,
 Edit_AP INT,
 Edit_role VARCHAR(255),
 Edit_level INT ,	
 Edit_prof1 VARCHAR(255),	
 Edit_prof2 VARCHAR(255),
 Edit_GS INT, 
 Edit_rank VARCHAR(255),
 Edit_DKP INT )
BEGIN
	IF NULLIF(Edit_class,'') IS NOT NULL THEN
		UPDATE CHARACTERS
		SET CHAR_class = Edit_class
		WHERE CHAR_name = Edit_name;
        UPDATE MemberList
		SET CHAR_class = Edit_class
		WHERE CHAR_name = Edit_name;
        UPDATE GroupList
		SET CHAR_class = Edit_class
		WHERE CHAR_name = Edit_name;
	END IF;
    IF NULLIF(Edit_race,'') IS NOT NULL THEN
		UPDATE CHARACTERS
		SET CHAR_race = Edit_race
		WHERE CHAR_name = Edit_name;
        UPDATE MemberList
		SET CHAR_race = Edit_race
		WHERE CHAR_name = Edit_name;
        UPDATE GroupList
		SET CHAR_race = Edit_race
		WHERE CHAR_name = Edit_name;
	END IF;
	IF  NOT Edit_AP=0 THEN
		UPDATE CHARACTERS
		SET CHAR_AP = Edit_AP
		WHERE CHAR_name = Edit_name;
        UPDATE GroupList
		SET CHAR_AP = Edit_AP
		WHERE CHAR_name = Edit_name;
        UPDATE MemberList
		SET CHAR_AP = Edit_AP
		WHERE CHAR_name = Edit_name;
	END IF;
    IF NULLIF(Edit_role,'') IS NOT NULL THEN
		UPDATE CHARACTERS
		SET CHAR_role = Edit_role
		WHERE CHAR_name = Edit_name;
        UPDATE GroupList
		SET CHAR_role = Edit_role
		WHERE CHAR_name = Edit_name;
        UPDATE MemberList
		SET CHAR_role = Edit_role
		WHERE CHAR_name = Edit_name;
	END IF;
    IF NOT Edit_level=0 THEN
		UPDATE CHARACTERS
		SET CHAR_level = Edit_level
		WHERE CHAR_name = Edit_name;
        UPDATE MemberList
		SET CHAR_level = Edit_level
		WHERE CHAR_name = Edit_name;
        UPDATE GroupList
		SET CHAR_level = Edit_level
		WHERE CHAR_name = Edit_name;
	END IF;
    IF NULLIF(Edit_prof1,'') IS NOT NULL THEN
		UPDATE CHARACTERS
		SET CHAR_prof1 = Edit_prof1
		WHERE CHAR_name = Edit_name;	
	END IF;
    IF NULLIF(Edit_prof2,'') IS NOT NULL THEN
		UPDATE CHARACTERS
		SET CHAR_prof2 = Edit_prof2
		WHERE CHAR_name = Edit_name;
        UPDATE MemberList
		SET CHAR_prof2 = Edit_prof2
		WHERE CHAR_name = Edit_name;
        UPDATE GroupList
		SET CHAR_prof2 = Edit_prof2
		WHERE CHAR_name = Edit_name;
	END IF;
	IF NOT Edit_GS=0 THEN
		UPDATE CHARACTERS
		SET CHAR_GS = Edit_GS
		WHERE CHAR_name = Edit_name;
        UPDATE GroupList
		SET CHAR_GS = Edit_GS
		WHERE CHAR_name = Edit_name;
        UPDATE MemberList
		SET CHAR_GS = Edit_GS
		WHERE CHAR_name = Edit_name;
	END IF;
    IF NULLIF(Edit_rank,'') IS NOT NULL THEN
		UPDATE GBelongs
		SET `rank` = Edit_rank
		WHERE CHAR_name = Edit_name;	
	END IF;
    IF NOT Edit_DKP=0 THEN
		UPDATE GBelongs
		SET DKP = Edit_DKP
		WHERE CHAR_name = Edit_name;	
	END IF;
    
    
     
END