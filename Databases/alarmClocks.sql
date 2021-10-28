CREATE PROCEDURE alarmClocks()
BEGIN
    
    DECLARE ans varchar(256);
    set @ans = "";
    set @var1 = (SELECT input_date FROM userInput);  # begin date year
    set @var2 = YEAR(DATE_ADD((SELECT input_date FROM userInput) , INTERVAL 1 YEAR)); # last date year
    set @x = 0;
    
    ##CREATE TEMP TABLE
    DROP TABLE IF EXISTS temptalarm; 
    Create Table temptalarm(
        alarm_date DATETIME
    );
    
    WHILE YEAR(@var1) < @var2 DO
        
        INSERT INTO temptalarm (alarm_date)
            SELECT @var1;   
            
        SET @x = @x + 1;
        SET @var1 = DATE_ADD((SELECT input_date from userInput), INTERVAL @x WEEK);
        
    END WHILE
    ;
    
    SELECT * 
    FROM temptalarm ;

	
END
