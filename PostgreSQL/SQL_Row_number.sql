SELECT
	-- Creating ID 
	ROW_NUMBER() OVER() AS newId,
	-- oldId from items table
	id AS oldId
FROM
	items;
