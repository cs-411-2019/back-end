use drinkingBuddies;

DELIMITER //

DROP VIEW IF EXISTS vw_Users_Stats//
CREATE VIEW vw_Users_Stats
AS
	SELECT
		Users.UserId,
		Users.ProfileName,
        FriendsCnt.FriendsCount,
        BarReviewsCnt.BarReviewsCount,
        BeerReviewsCnt.BeerReviewsCount,
        VisitedCnt.VisitedCount,
        DrinksCnt.DrinksCount,
        FavoriteBarsCnt.FavoriteBarsCount,
        FavoriteBeersCnt.FavoriteBeersCount
	FROM
		Users
			LEFT JOIN (SELECT UserId, count(*) as FriendsCount FROM Friends GROUP BY UserId) as FriendsCnt
				ON Users.UserId = FriendsCnt.UserId
			LEFT JOIN (SELECT UserId, count(*) as BarReviewsCount FROM BarReviews GROUP BY UserId) as BarReviewsCnt
				ON Users.UserId = BarReviewsCnt.UserId
			LEFT JOIN (SELECT UserId, count(*) as BeerReviewsCount FROM BeerReviews GROUP BY UserId) as BeerReviewsCnt
				ON Users.UserId = BeerReviewsCnt.UserId
			LEFT JOIN (SELECT UserId, count(*) as VisitedCount FROM Visited GROUP BY UserId) as VisitedCnt
				ON Users.UserId = VisitedCnt.UserId
			LEFT JOIN (SELECT UserId, count(*) as DrinksCount FROM Drinks GROUP BY UserId) as DrinksCnt
				ON Users.UserId = DrinksCnt.UserId
			LEFT JOIN (SELECT UserId, count(*) as FavoriteBarsCount FROM FavoriteBars GROUP BY UserId) as FavoriteBarsCnt
				ON Users.UserId = FavoriteBarsCnt.UserId
			LEFT JOIN (SELECT UserId, count(*) as FavoriteBeersCount FROM FavoriteBeers GROUP BY UserId) as FavoriteBeersCnt
				ON Users.UserId = FavoriteBeersCnt.UserId
	//

DELIMITER ;