CREATE PROCEDURE pastEvents()

BEGIN

    SET @var1 = (SELECT max(event_date) FROM Events);  
    
    SELECT name , event_date 
    FROM Events
    WHERE DATE_SUB(@var1, INTERVAL 1 WEEK) <= event_date AND 
    DATE(@var1) != event_date
    ORDER BY event_date DESC, name
    ; 
END
