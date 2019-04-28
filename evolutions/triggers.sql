use drinkingBuddies;

DELIMITER //

DROP TRIGGER  IF EXISTS `trg_Users_Delete`//
CREATE TRIGGER trg_Users_Delete
BEFORE DELETE
	ON USERS FOR EACH ROW
BEGIN
	START TRANSACTION;

	call usp_FriendsDeleteAll(OLD.UserId);

	# uncommon so no stored proc
	DELETE FROM BarReviews
    WHERE UserId = Old.UserId;
    
	# uncommon so no stored proc
    DELETE FROM BeerReviews
    WHERE UserId = Old.UserId;

	call usp_VisitedDeleteAll(OLD.UserId);
    
    call usp_FavoriteBarsDeleteAll(OLD.UserId);
    
    call usp_FavoriteBeersDeleteAll(OLD.UserId);
    
    call usp_DrinksDeleteAll(OLD.UserId);

	COMMIT;
END;

DELIMITER ;