CREATE PROCEDURE newsSubscribers()
BEGIN
    SELECT DISTINCT subscriber FROM half_year
    WHERE newspaper like "%Daily%"
    UNION
    SELECT Distinct subscriber FROM full_year
    WHERE newspaper like "%Daily%"
    ORDER by subscriber 
    
    
    
    

    ;
EN
