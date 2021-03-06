USE drinkingBuddies;

/* Disable foreign key checks to be able to drop tables */
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;

DROP TABLE IF EXISTS `Users`;  
CREATE TABLE Users (
  UserId INT NOT NULL AUTO_INCREMENT,
  ProfileName VARCHAR(55) NOT NULL UNIQUE,
  BirthDay DATETIME,
  Gender VARCHAR(15),
  PRIMARY KEY (UserId)
);

DROP TABLE IF EXISTS `Friends`;
CREATE TABLE Friends (
  UserId INT NOT NULL,
  FriendUserId INT NOT NULL,
  PRIMARY KEY (UserId, FriendUserId),
  FOREIGN KEY (UserId)
    REFERENCES Users(UserId),
  FOREIGN KEY (FriendUserId)
    REFERENCES Users(UserId)
);

DROP TABLE IF EXISTS `Bars`;  
CREATE TABLE Bars(
  BarId  INT NOT NULL AUTO_INCREMENT,
  `Name` VARCHAR(55) NOT NULL,
  Address VARCHAR(150),
  Lat DECIMAL(10, 8) NOT NULL,
  `Long` DECIMAL(11, 8) NOT NULL,
  City VARCHAR(150) NOT NULL,
  State VARCHAR(2) NOT NULL,
  PostalCode VARCHAR(6) NOT NULL,
  Phone VARCHAR(10),
  Website VARCHAR(150),
  PRIMARY KEY (BarId)
);

DROP TABLE IF EXISTS `Breweries`;  
CREATE TABLE Breweries(
  BrewerId  INT NOT NULL AUTO_INCREMENT,
  `Name` VARCHAR(55) NOT NULL,
  Lat DECIMAL(10, 8) NOT NULL,
  `Long` DECIMAL(11, 8) NOT NULL,
  Address VARCHAR(150),
  City VARCHAR(150) NOT NULL,
  State VARCHAR(2) NOT NULL,
  PostalCode VARCHAR(6) NOT NULL,
  Country VARCHAR(55),
  `Type` VARCHAR(150) NOT NULL,
  PRIMARY KEY (BrewerId)
);

DROP TABLE IF EXISTS `BeerTypes`;
CREATE TABLE BeerTypes(
  BeerTypeId INT NOT NULL AUTO_INCREMENT,
  Style VARCHAR(55) NOT NULL,
  PRIMARY KEY (BeerTypeId)
);

DROP TABLE IF EXISTS `Beers`; 
CREATE TABLE Beers(
  BeerId  INT NOT NULL AUTO_INCREMENT,
  `Name` VARCHAR(55) NOT NULL,
  BrewerId INT NOT NULL,
  BeerTypeId INT NOT NULL,
  ABV DOUBLE NOT NULL,
  Availability VARCHAR(55) NOT NULL ,
  Retired BOOLEAN DEFAULT FALSE NOT NULL,
  PRIMARY KEY (BeerId),
  FOREIGN KEY (BeerTypeId)
	REFERENCES BeerTypes(BeerTypeId)
);

DROP TABLE IF EXISTS `BarReviews`;
CREATE TABLE BarReviews (
  BarReviewId INT NOT NULL AUTO_INCREMENT,
  UserId INT NOT NULL,
  BarId INT NOT NULL,
  `Text` TEXT NOT NULL,
  Overall DOUBLE NOT NULL,
  `Time` TIMESTAMP,
  PRIMARY KEY (BarReviewId),
  FOREIGN KEY (BarId)
	REFERENCES Bars(BarId),
  FOREIGN KEY (UserId)
	REFERENCES Users(UserId)
);

DROP TABLE IF EXISTS `Serves`;
CREATE TABLE Serves (
  BarId INT NOT NULL,
  BeerId INT NOT NULL,
  PRIMARY KEY (BarId, BeerId),
  FOREIGN KEY (BarId)
	REFERENCES Bars(BarId),
  FOREIGN KEY (BeerId)
    REFERENCES Beers(BeerId)
);

DROP TABLE IF EXISTS `BeerReviews`;
CREATE TABLE BeerReviews (
  BeerReviewId INT NOT NULL AUTO_INCREMENT,
  UserId INT NOT NULL,
  BeerId INT NOT NULL,
  Appearance VARCHAR(55),
  Aroma VARCHAR(55),
  Palate VARCHAR(55),
  Taste VARCHAR(55),
  Overall DOUBLE NOT NULL,
  `Text` TEXT NOT NULL,
  `Time` TIMESTAMP,
  PRIMARY KEY (BeerReviewId),
  FOREIGN KEY (BeerId)
	REFERENCES Beers(BeerId),
  FOREIGN KEY (UserId)
	REFERENCES Users(UserId)

);

DROP TABLE IF EXISTS `Visited`;
CREATE TABLE Visited (
  UserId INT NOT NULL,
  BarId INT NOT NULL,
  `Time` TIMESTAMP,
  PRIMARY KEY (UserId, BarId),
  FOREIGN KEY (UserId)
    REFERENCES Users(UserId),
  FOREIGN KEY (BarId)
	REFERENCES Bars(BarId)
);

DROP TABLE IF EXISTS `FavoriteBars`;
CREATE TABLE FavoriteBars (
  UserId INT NOT NULL,
  BarId INT NOT NULL,
  PRIMARY KEY (UserId, BarId),
  FOREIGN KEY (UserId)
    REFERENCES Users(UserId),
  FOREIGN KEY (BarId)
	REFERENCES Bars(BarId)
);

DROP TABLE IF EXISTS `FavoriteBeers`;
CREATE TABLE FavoriteBeers (
  UserId INT NOT NULL,
  BeerId INT NOT NULL,
  PRIMARY KEY (UserId, BeerId),
  FOREIGN KEY (UserId)
    REFERENCES Users(UserId),
  FOREIGN KEY (BeerId)
	REFERENCES Beers(BeerId)
);

DROP TABLE IF EXISTS `Drinks`;
CREATE TABLE Drinks (
  UserId INT NOT NULL,
  BeerId INT NOT NULL,
  `Time` TIMESTAMP,
  PRIMARY KEY (UserId, BeerId),
  FOREIGN KEY (UserId)
    REFERENCES Users(UserId),
  FOREIGN KEY (BeerId)
	REFERENCES Beers(BeerId)
);


DROP TABLE IF EXISTS `Login`;
CREATE TABLE Login (
  ProfileName VARCHAR(55) NOT NULL UNIQUE,
  Password VARCHAR(55) NOT NULL,
  PRIMARY KEY (ProfileName, Password),
  FOREIGN KEY (ProfileName)
    REFERENCES Users(ProfileName)
);

SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;

/* */

