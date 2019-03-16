USE drinkingBuddies;

DROP TABLE IF EXISTS `Users`;  
CREATE TABLE Users (
  UserId INT NOT NULL AUTO_INCREMENT,
  ProfileName VARCHAR(55) NOT NULL UNIQUE,
  BirthDay DATETIME,
  Gender VARCHAR(15),
  PRIMARY KEY (UserId)
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
  Country VARCHAR(55),
  `Type` VARCHAR(150) NOT NULL,
  PRIMARY KEY (BrewerId)
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
  PRIMARY KEY (BeerId)
);


DROP TABLE IF EXISTS `BeerTypes`;
CREATE TABLE BeerTypes(
  BeerTypeId INT NOT NULL AUTO_INCREMENT,
  Style VARCHAR(55) NOT NULL,
  PRIMARY KEY (BeerTypeId)
);


DROP TABLE IF EXISTS `BarReviews`;
CREATE TABLE BarReviews (
  BarReviewId INT NOT NULL AUTO_INCREMENT,
  UserId INT NOT NULL,
  BarID INT NOT NULL,
  `Text` TEXT NOT NULL,
  Overall DOUBLE NOT NULL,
  `Time` TIMESTAMP,
  PRIMARY KEY (BarReviewId)
);


DROP TABLE IF EXISTS `BeerReviews`;
CREATE TABLE BeerReviews (
  BeerReviewsId INT NOT NULL AUTO_INCREMENT,
  UserId INT NOT NULL,
  BeerId INT NOT NULL,
  Appearance VARCHAR(55),
  Palate VARCHAR(55),
  Taste VARCHAR(55),
  Overall DOUBLE NOT NULL,
  `Text` TEXT NOT NULL,
  `Time` TIMESTAMP,
  PRIMARY KEY (BeerReviewsId)
);

/* */