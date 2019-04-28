use drinkingBuddies;


call usp_BeerReviewsCreate (1, 1, "Appearance", "Aroma", "Palate", "Taste", 5.0, "Text", '2008-01-01');

call usp_BeerReviewReadAllByBeer(1);

call usp_BeerReviewsReadOne(30);

call usp_BeerReviewReadAllByBeer(1);

call usp_BeerReviewReadAllByUser(2);

call usp_BeerReviewsUpdate(26, 2, 1, "Appearance2", "Aroma2", "Palate2", "Taste", 3.0, "Text", '2008-01-01');
call usp_BeerReviewsReadOne(26);

call usp_BeerReviewsDelete(25);

Insert into Breweries (`Name`, Lat, `Long`, Address, City, State, PostalCode, Country, `Type`)
VALUES ("New Brew", 60.0, 60.0, "Address", "city", "ST", "46321", "USA", "Old School");

Insert into Breweries (`Name`, Lat, `Long`, Address, City, State, PostalCode, Country, `Type`)
VALUES ("New Brew2", 60.0, 60.0, "Address", "city", "ST", "46321", "USA", "Old School");

Call usp_BreweriesReadOne(1);

Call usp_BreweriesReadAll();

Call usp_BeerTypesReadOne(1);

select * from Bars;
select * from Users;
select * from Beers;
select * from FavoriteBeers;

call usp_VisitedCreate(1, 1, '2008-01-01');
call usp_VisitedReadAll(1);
call usp_VisitedDeleteOne(1, 1);
call usp_VisitedDeleteAll(1);

call usp_FavoriteBarsCreate(1, 1);
call usp_FavoriteBarsReadByUser(1);
call usp_FavoriteBarsReadByBar(1);
call usp_FavoriteBarsDeleteOne(1, 1);
call usp_FavoriteBarsDeleteAll(1);

call usp_FavoriteBeersCreate(1, 1);
call usp_FavoriteBeersReadByUser(1);
call usp_FavoriteBeersReadByBeer(1);
call usp_FavoriteBeersDeleteOne(1, 1);
call usp_FavoriteBeersDeleteAll(1);

call usp_DrinksCreate(1, 1, '2008-01-01');
call usp_DrinksReadAll(1);
call usp_DrinksDeleteOne(1, 1);
call usp_DrinksDeleteAll(1);


select count(*) from information_schema.statistics where table_name = 'Users' and index_name = 'idx_Bars_Name' and table_schema = database();

call usp_GetAllAssociatedUserData(1);


select * from vw_Users_Stats;



