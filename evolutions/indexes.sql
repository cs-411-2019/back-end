use drinkingBuddies;

DELIMITER //

##
## Primary key and foreign key constraints already have indexes
## Also Unique fields have indexes also such as ProfileName on Users
##

## Adding Bars Index for Name
set @exist := (select count(*) from information_schema.statistics where table_name = 'Bars' and index_name = 'idx_Bars_Name' and table_schema = database())//
set @sqlstmt := if( @exist > 0, 'select ''INFO: Index already exists.''', 'create index idx_Bars_Name on Bars ( Name )')//
PREPARE stmt FROM @sqlstmt//
EXECUTE stmt//

## Adding Beers Index for Name
set @exist := (select count(*) from information_schema.statistics where table_name = 'Beers' and index_name = 'idx_Beers_Name' and table_schema = database())//
set @sqlstmt := if( @exist > 0, 'select ''INFO: Index already exists.''', 'create index idx_Beers_Name on Beers ( Name )')//
PREPARE stmt FROM @sqlstmt//
EXECUTE stmt//


DELIMITER ;