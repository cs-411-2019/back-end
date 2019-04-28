use drinkingBuddies;

ALTER TABLE BarReviews
ADD FOREIGN KEY (UserId) REFERENCES Users(UserId);

ALTER TABLE BeerReviews
Add FOREIGN KEY (BeerId) REFERENCES Beers(BeerId);

ALTER TABLE BeerReviews
ADD FOREIGN KEY (UserId) REFERENCES Users(UserId);
