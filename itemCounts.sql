CREATE PROCEDURE itemCounts()
BEGIN
	SELECT item_name, item_type, count(item_name) 
    FROM availableItems
    GROUP BY item_name, item_type
    ORDER BY item_type , item_name

    ;
END
