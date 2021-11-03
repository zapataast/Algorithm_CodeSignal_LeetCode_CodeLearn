CREATE PROCEDURE localCalendar()
BEGIN
    SELECT e.event_id , 
    IF(hours=12, DATE_FORMAT(DATE_ADD(e.date, INTERVAL s.timeshift MINUTE) , "%Y-%m-%d %h:%i %p"), DATE_FORMAT(DATE_ADD(e.date ,INTERVAL s.timeshift MINUTE), "%Y-%m-%d %H:%i")) as formatted_date
    FROM events as e 
    JOIN settings as s ON (e.user_id = s.user_id)
    ;   
END
