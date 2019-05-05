use drinkingBuddies;

DELIMITER //

#
# Users Table Procs
#

DROP PROCEDURE IF EXISTS `usp_UsersCreate`//
CREATE PROCEDURE usp_UsersCreate (
   IN p_profileName VARCHAR(55),
   IN p_birthDay DATETIME,
   IN p_gender varchar(15)
)
BEGIN
	START TRANSACTION;

    INSERT INTO Users (
		ProfileName,
		BirthDay,
		Gender)
    VALUES (
		p_profileName,
		p_birthDay,
		p_gender
	);	

	SELECT LAST_INSERT_ID() as UserId;
        
	COMMIT;
END//

DROP PROCEDURE IF EXISTS `usp_UsersReadOne`//
CREATE PROCEDURE usp_UsersReadOne (
   IN p_userId INT
)
BEGIN
    SELECT
		UserId,
		ProfileName,
        BirthDay,
        Gender
    FROM
		Users
    WHERE
		UserId = p_userId;
END//


DROP PROCEDURE IF EXISTS `usp_UsersReadAll`//
CREATE PROCEDURE usp_UsersReadAll ()
BEGIN
    SELECT
		UserId,
		ProfileName,
        BirthDay,
        Gender
    FROM
		Users;
END//

DROP PROCEDURE IF EXISTS `usp_UsersUpdate`//
CREATE PROCEDURE usp_UsersUpdate (
   IN p_userId INT,
   IN p_profileName VARCHAR(55),
   IN p_birthDay DATETIME,
   IN p_gender varchar(15)
)
BEGIN
    UPDATE Users SET
		ProfileName = p_profileName,
		BirthDay = p_birthDay,
		Gender = p_gender
	WHERE
		UserId = p_userId;
END//

DROP PROCEDURE IF EXISTS `usp_UsersDelete`//
CREATE PROCEDURE usp_UsersDelete (
   IN p_userId INT
)
BEGIN
    DELETE FROM Users
	WHERE
		UserId = p_userId;
END//

#
# Friends Table Procs
#

DROP PROCEDURE IF EXISTS `usp_FriendsCreate`//
CREATE PROCEDURE usp_FriendsCreate (
   IN p_userId INT,
   IN p_friendUserId INT
)
BEGIN
	INSERT INTO Friends (
		UserId,
        FriendUserId)
	VALUES (
		p_userId,
        p_friendUserId
	);

	SELECT
		UserId, FriendUserId
	FROM
		Friends
	WHERE
		UserId = p_userId and FriendUserId = p_friendUserId;
END//

DROP PROCEDURE IF EXISTS `usp_FriendsReadAll`//
CREATE PROCEDURE usp_FriendsReadAll (
   IN p_userId INT
)
BEGIN
    SELECT
		UserId,
		ProfileName,
    BirthDay,
    Gender
    FROM
		 Users WHERE UserId IN
       (SELECT F2.FriendUserId FROM Users JOIN Friends F2 on Users.UserId = F2.FriendUserId WHERE F2.UserId = p_userId);
END//


DROP PROCEDURE IF EXISTS `usp_FriendsDeleteOne`//
CREATE PROCEDURE usp_FriendsDeleteOne (
   IN p_userId INT,
   IN p_friendUserId INT
)
BEGIN
    DELETE FROM Friends
	WHERE
		UserId = p_userId AND FriendUserId = p_friendUserId;
END//

DROP PROCEDURE IF EXISTS `usp_FriendsDeleteAll`//
CREATE PROCEDURE usp_FriendsDeleteAll (
   IN p_userId INT
)
BEGIN
    DELETE FROM Friends
	WHERE
		UserId = p_userId;
END//


#
# Bars Table Procs
# HOLD HOLD HOLD
#CREATE TABLE Bars(
#  BarId  INT NOT NULL AUTO_INCREMENT,
#  `Name` VARCHAR(55) NOT NULL,
#  Address VARCHAR(150),
#  Lat DECIMAL(10, 8) NOT NULL,
#  `Long` DECIMAL(11, 8) NOT NULL,
#  City VARCHAR(150) NOT NULL,
#  State VARCHAR(2) NOT NULL,
#  PostalCode VARCHAR(6) NOT NULL,
#  Phone VARCHAR(10),
#  Website VARCHAR(150),
#

DROP PROCEDURE IF EXISTS `usp_BarsReadOne`//
CREATE PROCEDURE usp_BarsReadOne (
   IN p_barId INT
)
BEGIN
    SELECT
		BarId,
		`Name`,
		Address,
		Lat,
		`Long`,
		City,
		State,
		PostalCode,
		Phone,
		Website
    FROM
		Bars
    WHERE
		BarId = p_barId;
END//


DROP PROCEDURE IF EXISTS `usp_BarsReadAll`//
CREATE PROCEDURE usp_BarsReadAll ()
BEGIN
    SELECT
		BarId,
		`Name`,
		Address,
		Lat,
		`Long`,
		City,
		State,
		PostalCode,
		Phone,
		Website
    FROM
		Bars;
END//


#
# Breweries Table Procs
# HOLD HOLD HOLD
# CREATE TABLE Breweries(
#  BrewerId  INT NOT NULL AUTO_INCREMENT,
#  `Name` VARCHAR(55) NOT NULL,
#  Lat DECIMAL(10, 8) NOT NULL,
#  `Long` DECIMAL(11, 8) NOT NULL,
#  Address VARCHAR(150),
#  City VARCHAR(150) NOT NULL,
#  State VARCHAR(2) NOT NULL,
#  PostalCode VARCHAR(6) NOT NULL,
# Country VARCHAR(55),
#  `Type` VARCHAR(150) NOT NULL,
#

DROP PROCEDURE IF EXISTS `usp_BreweriesReadOne`//
CREATE PROCEDURE usp_BreweriesReadOne (
   IN p_brewerId INT
)
BEGIN
    SELECT
		BrewerId,
		`Name`,
		Lat,
		`Long`,
		Address,
		City,
		State,
		PostalCode,
		Country,
		`Type`
	FROM
		Breweries
    WHERE
		BrewerId = p_brewerId;
END//

DROP PROCEDURE IF EXISTS `usp_BreweriesReadAll`//
CREATE PROCEDURE usp_BreweriesReadAll ()
BEGIN
    SELECT
		BrewerId,
		`Name`,
		Lat,
		`Long`,
		Address,
		City,
		State,
		PostalCode,
		Country,
		`Type`
	FROM
		Breweries;
END//

#
# BeerTypes Table Procs
# HOLD HOLD HOLD
#  BeerTypeId INT NOT NULL AUTO_INCREMENT,
# Style VARCHAR(55) NOT NULL,
#

DROP PROCEDURE IF EXISTS `usp_BeerTypesReadOne`//
CREATE PROCEDURE usp_BeerTypesReadOne (
   IN p_beerTypeId INT
)
BEGIN
    SELECT
		BeerTypeId,
		Style
	FROM
		BeerTypes
    WHERE
		BeerTypeId = p_beerTypeId;
END//

DROP PROCEDURE IF EXISTS `usp_BeerTypesReadAll`//
CREATE PROCEDURE usp_BeerTypesReadAll ()
BEGIN
    SELECT
		BeerTypeId,
		Style
	FROM
		BeerTypes;
END//


#
# Beers Table Procs
#

DROP PROCEDURE IF EXISTS `usp_BeersCreate`//
CREATE PROCEDURE usp_BeersCreate (
   IN p_name VARCHAR(55),
   IN p_brewerId INT,
   IN p_beerTypeId INT,
   IN p_ABV DOUBLE,
   IN p_availability varchar(15),
   IN p_retired BOOLEAN
)
BEGIN
	START TRANSACTION;

    INSERT INTO Beers (
		`Name`,
        BrewerId,
		BeerTypeId,
		ABV,
		Availability,
		Retired)
    VALUES (
		p_name,
        p_brewerId,
        p_beerTypeId,
        p_ABV,
        p_availability,
        p_retired
	);	

	SELECT LAST_INSERT_ID() as BeerId;
    
    COMMIT;
END//

DROP PROCEDURE IF EXISTS `usp_BeersReadOne`//
CREATE PROCEDURE usp_BeersReadOne (
   IN p_beerId INT
)
BEGIN
    SELECT
		BeerId,
		`Name`,
        BrewerId,
		BeerTypeId,
		ABV,
		Availability,
		Retired
    FROM
		Beers
    WHERE
		BeerId = p_beerId;
END//

DROP PROCEDURE IF EXISTS `usp_BeersReadAll`//
CREATE PROCEDURE usp_BeersReadAll ()
BEGIN
    SELECT
		BeerId,
		`Name`,
        BrewerId,
		BeerTypeId,
		ABV,
		Availability,
		Retired
    FROM
		Beers;
END//


DROP PROCEDURE IF EXISTS `usp_BeersUpdate`//
CREATE PROCEDURE usp_BeersUpdate (
   IN p_beerId INT,
   IN p_name VARCHAR(55),
   IN p_brewerId INT,
   IN p_beerTypeId INT,
   IN p_ABV DOUBLE,
   IN p_availability varchar(15),
   IN p_retired BOOLEAN
)
BEGIN
    UPDATE Beers SET
		`Name` = p_name,
        BrewerId = p_brewerId,
		BeerTypeId = p_beerTypeId,
		ABV = p_ABV,
		Availability = p_availability,
		Retired = p_retired
	WHERE
		BeerId = p_beerId;
END//

DROP PROCEDURE IF EXISTS `usp_BeersDelete`//
CREATE PROCEDURE usp_BeersDelete (
   IN p_beerId INT
)
BEGIN
    DELETE FROM Beers
	WHERE
		BeerId = p_beerId;
END//


#
# BarReviews Table Procs
#

DROP PROCEDURE IF EXISTS `usp_BarReviewsCreate`//
CREATE PROCEDURE usp_BarReviewsCreate (
   IN p_userId INT,
   IN p_barId INT,
   IN p_text TEXT,
   IN p_overall DOUBLE,
   IN p_time TIMESTAMP
)
BEGIN
    INSERT INTO BarReviews (
		UserId,
		BarId,
		`Text`,
		Overall,
		`Time`)
    VALUES (
		p_userId,
		p_barId,
		p_text,
		p_overall,
		p_time
	);

	SELECT LAST_INSERT_ID() as BarReviewId;
    
	COMMIT;
END//

DROP PROCEDURE IF EXISTS `usp_BarReviewsReadOne`//
CREATE PROCEDURE usp_BarReviewsReadOne (
   IN p_barReviewId INT
)
BEGIN
    SELECT
		BarReviewId,
		UserId,
		BarId,
		`Text`,
		Overall,
		`Time`
    FROM
		BarReviews
    WHERE
		BarReviewId = p_barReviewId;
END//


DROP PROCEDURE IF EXISTS `usp_BarReviewReadAllByBar`//
CREATE PROCEDURE usp_BarReviewReadAllByBar(
   IN p_barId INT
)
BEGIN
    SELECT
		BarReviewId,
		UserId,
		BarId,
		`Text`,
		Overall,
		`Time`
    FROM
		BarReviews
	WHERE
		BarId = p_barId;
END//

DROP PROCEDURE IF EXISTS `usp_BarReviewReadAllByUser`//
CREATE PROCEDURE usp_BarReviewReadAllByUser(
   IN p_userId INT
)
BEGIN
    SELECT
		BarReviewId,
		UserId,
		BarId,
		`Text`,
		Overall,
		`Time`
    FROM
		BarReviews
	WHERE
		UserId = p_userId;
END//

DROP PROCEDURE IF EXISTS `usp_BarReviewsUpdate`//
CREATE PROCEDURE usp_BarReviewsUpdate (
   IN p_barReviewId INT,
   IN p_userId INT,
   IN p_barId INT,
   IN p_text TEXT,
   IN p_overall DOUBLE,
   IN p_time TIMESTAMP
)
BEGIN
    UPDATE BarReviews SET
		UserId = p_userId,
		BarId = p_barId,
		`Text` = p_text,
		Overall = p_overall,
		`Time` = p_time
	WHERE
		BarReviewId = p_barReviewId;
END//

DROP PROCEDURE IF EXISTS `usp_BarReviewsDelete`//
CREATE PROCEDURE usp_BarReviewsDelete (
   IN p_barReviewId INT
)
BEGIN
    DELETE FROM BarReviews
	WHERE
		BarReviewId = p_barReviewId;
END//


#
# Serves Table Procs
#

DROP PROCEDURE IF EXISTS `usp_ServesCreate`//
CREATE PROCEDURE usp_ServesCreate (
   IN p_barId INT,
   IN p_beerId INT
)
BEGIN
    INSERT INTO Serves (
		BarId,
		BeerId)
    VALUES (
		p_barId,
		p_beerId
	);	

    SELECT
		BarId,
		BeerId
    FROM
		Serves
    WHERE
		BarId = p_barId AND BeerId = p_beerId;
END//

DROP PROCEDURE IF EXISTS `usp_ServesReadAllByBar`//
CREATE PROCEDURE usp_ServesReadAllByBar (
   IN p_barId INT
)
BEGIN
    SELECT
		BarId,
		BeerId
    FROM
		Serves
    WHERE
		BarId = p_barId;
END//


DROP PROCEDURE IF EXISTS `usp_ServesReadAllByBeers`//
CREATE PROCEDURE usp_ServesReadAllByBeers (
   IN p_beerId INT
)
BEGIN
    SELECT
		BarId,
		BeerId
    FROM
		Serves
    WHERE
		BeerId = p_beerId;
END//

DROP PROCEDURE IF EXISTS `usp_ServesDelete`//
CREATE PROCEDURE usp_ServesDelete (
   IN p_barId INT,
   IN p_beerId INT
)
BEGIN
    DELETE FROM Serves
	WHERE
		BarId = p_barId AND BeerId = p_beerId;
END//


#
# BeerReviews Table Procs
#

DROP PROCEDURE IF EXISTS `usp_BeerReviewsCreate`//
CREATE PROCEDURE usp_BeerReviewsCreate (
   IN p_userId INT,
   IN p_beerId INT,
   IN p_appearance VARCHAR(55),
   IN p_aroma VARCHAR(55),
   IN p_palate VARCHAR(55),
   IN p_taste VARCHAR(55),
   IN p_overall DOUBLE,
   IN p_text TEXT,
   IN p_time TIMESTAMP
)
BEGIN

	DECLARE beerReviewId INT;

	START TRANSACTION;

    INSERT INTO BeerReviews (
		UserId,
		BeerId,
		Appearance,
		Aroma,
		Palate,
		Taste,
		Overall,
		`Text`,
		`Time`)
    VALUES (
		p_userId,
		p_beerId,
		p_appearance,
		p_aroma,
		p_palate,
		p_taste,
		p_overall,
		p_text,
		p_time
	);

    SELECT last_insert_id() as BeerReviewId;
        
 	COMMIT;     
END//

DROP PROCEDURE IF EXISTS `usp_BeerReviewsReadOne`//
CREATE PROCEDURE usp_BeerReviewsReadOne (
   IN p_beerReviewId INT
)
BEGIN
    SELECT
		BeerReviewId,
		UserId,
		BeerId,
		Appearance,
		Aroma,
		Palate,
		Taste,
		Overall,
		`Text`,
		`Time`
    FROM
		BeerReviews
    WHERE
		BeerReviewId = p_beerReviewId;
END//


DROP PROCEDURE IF EXISTS `usp_BeerReviewReadAllByBeer`//
CREATE PROCEDURE usp_BeerReviewReadAllByBeer(
   IN p_beerId INT
)
BEGIN
    SELECT
		BeerReviewId,
		UserId,
		BeerId,
		Appearance,
		Aroma,
		Palate,
		Taste,
		Overall,
		`Text`,
		`Time`
    FROM
		BeerReviews
	WHERE
		BeerId = p_beerId;
END//

DROP PROCEDURE IF EXISTS `usp_BeerReviewReadAllByUser`//
CREATE PROCEDURE usp_BeerReviewReadAllByUser(
   IN p_userId INT
)
BEGIN
    SELECT
		BeerReviewId,
		UserId,
		BeerId,
		Appearance,
		Aroma,
		Palate,
		Taste,
		Overall,
		`Text`,
		`Time`
    FROM
		BeerReviews
	WHERE
		UserId = p_userId;
END//

DROP PROCEDURE IF EXISTS `usp_BeerReviewsUpdate`//
CREATE PROCEDURE usp_BeerReviewsUpdate (
   IN p_beerReviewId INT,
   IN p_userId INT,
   IN p_beerId INT,
   IN p_appearance VARCHAR(55),
   IN p_aroma VARCHAR(55),
   IN p_palate VARCHAR(55),
   IN p_taste VARCHAR(55),
   IN p_overall DOUBLE,
   IN p_text TEXT,
   IN p_time TIMESTAMP
)
BEGIN
    UPDATE BeerReviews SET
		UserId = p_userId,
		BeerId = p_beerId,
		Appearance = p_appearance,
		Aroma = p_aroma,
		Palate = p_palate,
		Taste = p_taste,
		Overall = p_overall,
		`Text` = p_text,
		`Time` = p_time
	WHERE
		BeerReviewId = p_beerReviewId;
END//

DROP PROCEDURE IF EXISTS `usp_BeerReviewsDelete`//
CREATE PROCEDURE usp_BeerReviewsDelete (
   IN p_beerReviewId INT
)
BEGIN
    DELETE FROM BeerReviews
	WHERE
		BeerReviewId = p_beerReviewId;
END//


#
# Visited Table Procs
#

DROP PROCEDURE IF EXISTS `usp_VisitedCreate`//
CREATE PROCEDURE usp_VisitedCreate (
   IN p_userId INT,
   IN p_barId INT,
   IN p_Time TIMESTAMP
)
BEGIN
	START TRANSACTION;

    INSERT INTO Visited (
		UserId,
		BarId,
		`Time`)
    VALUES (
		p_userId,
		p_barId,
		p_Time
	);	

	SELECT
		UserId, BarId, `Time`
	FROM
		Visited
	WHERE
		UserId = p_userId and BarId = p_barId;

	COMMIT;
END//

DROP PROCEDURE IF EXISTS `usp_VisitedReadAll`//
CREATE PROCEDURE usp_VisitedReadAll (
   IN p_userId INT
)
BEGIN
    SELECT
		Users.UserId,
        Users.ProfileName,
		Bars.BarId,
        Bars.`Name`,
		`Time`
    FROM
		Visited JOIN Users on Visited.UserId = Users.UserId
				JOIN Bars on Visited.BarId = Bars.BarId
    WHERE
		Users.UserId = p_userId;
END//

DROP PROCEDURE IF EXISTS `usp_VisitedDeleteOne`//
CREATE PROCEDURE usp_VisitedDeleteOne (
   IN p_userId INT,
   IN p_barId INT
)
BEGIN
    DELETE FROM Visited
	WHERE
		UserId = p_userId AND BarId = p_barId;
END//

DROP PROCEDURE IF EXISTS `usp_VisitedDeleteAll`//
CREATE PROCEDURE usp_VisitedDeleteAll (
   IN p_userId INT
)
BEGIN
    DELETE FROM Visited
	WHERE
		UserId = p_userId;
END//


#
# FavoriteBars Table Procs
#

DROP PROCEDURE IF EXISTS `usp_FavoriteBarsCreate`//
CREATE PROCEDURE usp_FavoriteBarsCreate (
   IN p_userId INT,
   IN p_barId INT
)
BEGIN
	START TRANSACTION;

    INSERT INTO FavoriteBars (
		UserId,
		BarId)
    VALUES (
		p_userId,
		p_barId
	);	

	SELECT
		UserId, BarId
	FROM
		FavoriteBars
	WHERE
		UserId = p_userId and BarId = p_barId;

	COMMIT;
END//

DROP PROCEDURE IF EXISTS `usp_FavoriteBarsReadByUser`//
CREATE PROCEDURE usp_FavoriteBarsReadByUser (
   IN p_userId INT
)
BEGIN
    SELECT
		Users.UserId,
        Users.ProfileName,
		Bars.BarId,
        Bars.`Name`
    FROM
		FavoriteBars JOIN Users on FavoriteBars.UserId = Users.UserId
				     JOIN Bars on FavoriteBars.BarId = Bars.BarId
    WHERE
		Users.UserId = p_userId;
END//

DROP PROCEDURE IF EXISTS `usp_FavoriteBarsReadByBar`//
CREATE PROCEDURE usp_FavoriteBarsReadByBar (
   IN p_barId INT
)
BEGIN
    SELECT
		Users.UserId,
        Users.ProfileName,
		Bars.BarId,
        Bars.`Name`
    FROM
		FavoriteBars JOIN Users on FavoriteBars.UserId = Users.UserId
				     JOIN Bars on FavoriteBars.BarId = Bars.BarId
    WHERE
		Bars.BarId = p_barId;
END//

DROP PROCEDURE IF EXISTS `usp_FavoriteBarsDeleteOne`//
CREATE PROCEDURE usp_FavoriteBarsDeleteOne (
   IN p_userId INT,
   IN p_barId INT
)
BEGIN
    DELETE FROM FavoriteBars
	WHERE
		UserId = p_userId AND BarId = p_barId;
END//

DROP PROCEDURE IF EXISTS `usp_FavoriteBarsDeleteAll`//
CREATE PROCEDURE usp_FavoriteBarsDeleteAll (
   IN p_userId INT
)
BEGIN
    DELETE FROM FavoriteBars
	WHERE
		UserId = p_userId;
END//


#
# FavoriteBeers Table Procs
#

DROP PROCEDURE IF EXISTS `usp_FavoriteBeersCreate`//
CREATE PROCEDURE usp_FavoriteBeersCreate (
   IN p_userId INT,
   IN p_beerId INT
)
BEGIN
	START TRANSACTION;

    INSERT INTO FavoriteBeers (
		UserId,
		BeerId)
    VALUES (
		p_userId,
		p_beerId
	);	

	SELECT
		UserId, BeerId
	FROM
		FavoriteBeers
	WHERE
		UserId = p_userId and BeerId = p_beerId;

	COMMIT;
END//

DROP PROCEDURE IF EXISTS `usp_FavoriteBeersReadByUser`//
CREATE PROCEDURE usp_FavoriteBeersReadByUser (
   IN p_userId INT
)
BEGIN
    SELECT
		Users.UserId,
        Users.ProfileName,
		Beers.BeerId,
        Beers.`Name`
    FROM
		FavoriteBeers JOIN Users on FavoriteBeers.UserId = Users.UserId
				     JOIN Beers on FavoriteBeers.BeerId = Beers.BeerId
    WHERE
		Users.UserId = p_userId;
END//

DROP PROCEDURE IF EXISTS `usp_FavoriteBeersReadByBeer`//
CREATE PROCEDURE usp_FavoriteBeersReadByBeer (
   IN p_beerId INT
)
BEGIN
    SELECT
		Users.UserId,
        Users.ProfileName,
		Beers.BeerId,
        Beers.`Name`
    FROM
		FavoriteBeers JOIN Users on FavoriteBeers.UserId = Users.UserId
				     JOIN Beers on FavoriteBeers.BeerId = Beers.BeerId
    WHERE
		Beers.BeerId = p_beerId;
END//

DROP PROCEDURE IF EXISTS `usp_FavoriteBeersDeleteOne`//
CREATE PROCEDURE usp_FavoriteBeersDeleteOne (
   IN p_userId INT,
   IN p_beerId INT
)
BEGIN
    DELETE FROM FavoriteBeers
	WHERE
		UserId = p_userId AND BeerId = p_beerId;
END//

DROP PROCEDURE IF EXISTS `usp_FavoriteBeersDeleteAll`//
CREATE PROCEDURE usp_FavoriteBeersDeleteAll (
   IN p_userId INT
)
BEGIN
    DELETE FROM FavoriteBeers
	WHERE
		UserId = p_userId;
END//


#
# FavoriteBeers Table Procs
#

DROP PROCEDURE IF EXISTS `usp_DrinksCreate`//
CREATE PROCEDURE usp_DrinksCreate (
   IN p_userId INT,
   IN p_beerId INT
 )
BEGIN
	START TRANSACTION;

    INSERT INTO Drinks (
		UserId,
		BeerId,
        `Time`)
    VALUES (
		p_userId,
		p_beerId,
		NOW()        
	);	

	SELECT
		UserId, BeerId, `Time`
	FROM
		Drinks
	WHERE
		UserId = p_userId and BeerId = p_beerId;

	COMMIT;
END//

DROP PROCEDURE IF EXISTS `usp_DrinksReadAll`//
CREATE PROCEDURE usp_DrinksReadAll (
   IN p_userId INT
)
BEGIN
    SELECT
		Users.UserId,
        Users.ProfileName,
		Beers.BeerId,
        Beers.`Name`
    FROM
		Drinks JOIN Users on Drinks.UserId = Users.UserId
				     JOIN Beers on Drinks.BeerId = Beers.BeerId
    WHERE
		Users.UserId = p_userId;
END//

DROP PROCEDURE IF EXISTS `usp_DrinksDeleteOne`//
CREATE PROCEDURE usp_DrinksDeleteOne (
   IN p_userId INT,
   IN p_beerId INT
)
BEGIN
    DELETE FROM Drinks
	WHERE
		UserId = p_userId AND BeerId = p_beerId;
END//

DROP PROCEDURE IF EXISTS `usp_DrinksDeleteAll`//
CREATE PROCEDURE usp_DrinksDeleteAll (
   IN p_userId INT
)
BEGIN
    DELETE FROM Drinks
	WHERE
		UserId = p_userId;
END//


DROP PROCEDURE IF EXISTS `usp_GetAllAssociatedUserData`//
CREATE PROCEDURE usp_GetAllAssociatedUserData (
   IN p_userId INT
)
BEGIN

	# Retrieve user data
	call usp_UsersReadOne(p_userId);

	# Retrieve friends data
	call usp_FriendsReadAll(p_userId);
    
	# Retrieve bar reviews data
    call usp_BarReviewReadAllByUser(p_userId);
    
	# Retrieve beer reviews data
    call usp_BeerReviewReadAllByUser(p_userId);

	# Retrieve visited bars data
    call usp_VisitedReadAll(p_userId);

	# Retrieve drinks beer data
    call usp_DrinksReadAll(p_userId);

	# Retrieve favorite bars data
    call usp_FavoriteBarsReadByUser(p_userId);
    
	# Retrieve favorite beers data
    call usp_FavoriteBeersReadByUser(p_userId);

END//

	
use drinkingBuddies;

DELIMITER //

	
#
# Complex query - Nearby Bars
#

DROP PROCEDURE IF EXISTS `usp_BarsNearby`//
CREATE PROCEDURE usp_BarsNearby (
	IN p_lat DECIMAL(10,8),
    IN p_long DECIMAL(11,8),
    IN p_radius DECIMAL(11,8)
)
BEGIN

    #uses distances on a curve to check if bars are close.
    #uses a bounding box similar to the QuadTree to first limit possible choices
	
    DECLARE distance_units DECIMAL(10,8);
    
    SET distance_units = 69.172; # miles
    #SET distance_units = 111.045; # kilometers
    
	SELECT
		d.BarId,
		d.`Name`,
		d.Lat,
		d.`Long`,
        d.PostalCode,
		d.City,
		distance
	 FROM (
		SELECT b.BarId,
			b.`Name`,
            b.PostalCode,
			b.City,
			b.Lat,
            b.`Long`,
			p_radius as radius,
			distance_units
				* DEGREES(ACOS(COS(RADIANS(p_lat))
                * COS(RADIANS(b.Lat))
                * COS(RADIANS(p_long - b.`Long`))
                + SIN(RADIANS(p_lat))
                * SIN(RADIANS(b.Lat)))) AS distance
		FROM Bars AS b
		WHERE b.Lat
			BETWEEN p_lat - (p_radius / distance_units)
				AND p_lat + (p_radius / distance_units)
			AND b.`Long`
				BETWEEN p_long - (p_radius / (distance_units * COS(RADIANS(p_lat))))
					AND p_long + (p_radius / (distance_units * COS(RADIANS(p_long))))
	) AS d
	WHERE distance <= d.radius
	ORDER BY distance
	LIMIT 15;
END//


DROP PROCEDURE IF EXISTS `usp_Login`//
CREATE PROCEDURE usp_Login (
   IN p_profileName VARCHAR(55),
   IN p_password VARCHAR(55)
)
BEGIN
  SELECT UserId FROM Users JOIN Login ON Users.ProfileName = Login.ProfileName
  WHERE Login.ProfileName = p_profileName AND Login.Password = p_password;
END//


DROP PROCEDURE IF EXISTS `usp_UserStats`//
CREATE PROCEDURE usp_UserStats (
   IN p_userId INT
 )
BEGIN
	START TRANSACTION;
	SELECT *  FROM vw_Users_Stats WHERE UserId = p_userId;
COMMIT;
END//

										       
DROP PROCEDURE IF EXISTS `usp_FindFriendsBarAndBeerRecommendation`//
CREATE PROCEDURE usp_FindFriendsBarAndBeerRecommendation (
   IN p_userId INT
)
proc_Exit:BEGIN

	DECLARE IsFound BOOL;

	SET IsFound = 0;

#	IF p_userId = 1 THEN
#		SELECT
#			p_userId as UserId,
#			u.ProfileName as ProfileName,
#			2 as FriendUserId,
#			"BeerSox" as FriendProfileName,
#			1 as BarId,
#			"1123 Awesome Dr" as Address,
#			39.76840000 as Lat,
#			86.15810000 as `Long`,
#			"Indianapolis" as City,
#			"IN" as State,
#			"46202" as PostalCode,
#			"8675309" as Phone,
#			"rupsis.io" as Website,
# 		    "Olde Cogitator" as BeerName,
#			161 as BrewerId,
#			"Cherry's Place" as BrewerName,
#			1 as BeerTypeId,
#			"English Oatmeal Stout" as Style,
#			7.3 as ABV,
#			"Rotating" as Availability
#		FROM
#			Users u
#		WHERE
#			u.UserId = p_userId;
#
#		SET IsFound = 1;
#	ELSE
#		SELECT
#			p_userId as UserId,
#			u.ProfileName as ProfileName,
#			0 as FriendUserId,
#			NULL as FriendProfileName,
#			0 as BarId,
#			NULL as BarName,
#			NULL as Address,
#			0.00 as Lat,
#			0.00 as `Long`,
#			NULL as City,
#			NULL as State,
#			NULL as PostalCode,
#			NULL as Phone,
#			NULL as Website,
#			0 as BeerId,
#			NULL as BeerName,
#			0 as BrewerId,
#			NULL as BrewerName,
#			0 as BeerTypeId,
#			NULL as Style,
#			0.0 as ABV,
#			NULL as Availability
#		FROM
#			Users u
#		WHERE
#			u.UserId = p_userId;
 #   
#		SET IsFound = 1;
#	END IF;

	# Find a Bar AND Beer
	# 1 Friend favorite of bar
    # 2 Friend favorite of beer
    # 3 Bar not favorite of user
    # 4 Beer ot favorite of user
    # 5 Bar servers the selected beer
    # 6 Sorted by Bar ratings then by Beer Ratings
	SELECT
		p_userId as UserId,
        u.ProfileName as ProfileName,
		fu.UserId as FriendUserId,
        fu.ProfileName as FriendProfileName,
        fb.BarId,
        fb.`Name` as BarName,
        fb.Address,
        fb.Lat,
        fb.`Long`,
        fb.City,
        fb.State,
        fb.PostalCode,
        fb.Phone,
        fb.WebSite,
        fbeers.BeerId,
        fbeers.`Name` as BeerName,
        fbeers.BrewerId,
        fbrews.`Name` as BrewerName,
        fbeers.BeerTypeId,
        fbeertypes.Style,
        fbeers.ABV,
        fbeers.Availability
	FROM
		Users u JOIN Friends f on u.UserId = f.UserId			# My Friends
			JOIN Users fu ON f.FriendUserId = fu.UserId			# Friend's User Record
            JOIN FavoriteBars ffb on fu.UserId = ffb.UserId		# Friend's FavoriteBars
            JOIN Bars fb on ffb.BarId = fb.BarId				# Friend's FavortieBar details
            JOIN FavoriteBars myfb on myfb.UserId = u.UserId AND  fb.BarId != myfb.BarId	# So I select new bars not already my favorite
			JOIN FavoriteBeers ffbeers on fu.UserId = ffbeers.UserId	# Friend's Favorite Beers
            JOIN Beers fbeers on ffbeers.BeerId = fbeers.BeerId			#Friends' FavoriteBeers details
            JOIN Breweries fbrews on fbeers.BrewerId = fbrews.BrewerId	#Link to Brewer table
            JOIN BeerTypes fbeertypes on fbeertypes.BeerTypeId = fbeers.BeerTypeId	#Link to BeerType table
            JOIN FavoriteBeers myfbeers on myfbeers.UserId = u.UserId AND fbeers.BeerId != myfbeers.BeerId # So I select new beers not already my favorite
			JOIN Serves serves on (serves.BeerId = fbeers.BeerId AND serves.BarId = fb.BarId)	# The beer and bar ARE combined OR there is no Beer
			LEFT JOIN (SELECT rb.BarId, AVG(rb.Overall) as barAvg FROM BarReviews rb GROUP BY BarId)
				as revbarrate on revbarrate.BarId = fb.BarId				# Get the rating to use for sort
			LEFT JOIN (SELECT rbeers.BeerId, AVG(rbeers.Overall) as beerAvg FROM BeerReviews rbeers GROUP BY BeerId)
				as revbeerrate on revbeerrate.BeerId = fbeers.BeerId				# Get the rating to use for sort
	WHERE
		u.UserId = p_userId
	ORDER BY
		revbarrate.barAvg DESC,
        revbeerrate.beerAvg DESC;

	IF FOUND_ROWS() > 0 THEN
		SET isFound = 1;
	END IF;

    IF IsFound = 1 THEN
		LEAVE proc_Exit;
    END IF;



	# Find a Bar AND Beer
	# 1 Friend favorite of bar
    # 3 Bar not favorite of user
    # 6 Sorted by Bar ratings then by Beer Ratings
	SELECT
		p_userId as UserId,
        u.ProfileName as ProfileName,
		fu.UserId as FriendUserId,
        fu.ProfileName as FriendProfileName,
        fb.BarId,
        fb.`Name` as BarName,
        fb.Address,
        fb.Lat,
        fb.`Long`,
        fb.City,
        fb.State,
        fb.PostalCode,
        fb.Phone,
        fb.WebSite,
		0 as BeerId,
		NULL as BeerName,
		0 as BrewerId,
		NULL as BrewerName,
		0 as BeerTypeId,
		NULL as Style,
		0.0 as ABV,
		NULL as Availability
	FROM
		Users u JOIN Friends f on u.UserId = f.UserId			# My Friends
			JOIN Users fu ON f.FriendUserId = fu.UserId			# Friend's User Record
            JOIN FavoriteBars ffb on fu.UserId = ffb.UserId		# Friend's FavoriteBars
            JOIN Bars fb on ffb.BarId = fb.BarId				# Friend's FavortieBar details
            JOIN FavoriteBars myfb on myfb.UserId = u.UserId AND  fb.BarId != myfb.BarId	# So I select new bars not already my favorite
			LEFT JOIN (SELECT rb.BarId, AVG(rb.Overall) as barAvg FROM BarReviews rb GROUP BY BarId)
				as revbarrate on revbarrate.BarId = fb.BarId				# Get the rating to use for sort
	WHERE
		u.UserId = p_userId
	ORDER BY
		revbarrate.barAvg DESC;
        
	IF FOUND_ROWS() > 0 THEN
		SET isFound = 1;
	END IF;

    IF IsFound = 1 THEN
		LEAVE proc_Exit;
    END IF;

	SELECT
		p_userId as UserId,
		u.ProfileName as ProfileName,
		0 as FriendUserId,
		NULL as FriendProfileName,
		0 as BarId,
		NULL as BarName,
		NULL as Address,
		0.00 as Lat,
		0.00 as `Long`,
		NULL as City,
		NULL as State,
		NULL as PostalCode,
		NULL as Phone,
		NULL as Website,
		0 as BeerId,
		NULL as BeerName,
		0 as BrewerId,
		NULL as BrewerName,
		0 as BeerTypeId,
		NULL as Style,
		0.0 as ABV,
		NULL as Availability
	FROM
		Users u
	WHERE
		u.UserId = p_userId;
    
END//										       
										       
										       
										       
										       
DELIMITER ;
