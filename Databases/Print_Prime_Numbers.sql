DECLARE @var int, @div int, @prime int      
DECLARE @STR varchar(700) = '2' -- Declare
SELECT @var = 1                -- Initialization
SELECT @prime = 2
SET @div = 2;

WHILE @var <= 1000                 -- condition
    BEGIN                          -- Begin
    WHILE @prime < @var 
        BEGIN 
        IF @var % @div = 0 
            BEGIN 
            break
            END
        IF @var-1 = @div
            BEGIN
                SET @STR = CONCAT(@STR,'&',CAST(@var as varchar))
            END
        SET @prime = @prime + 1
        SET @div = @div + 1
    END
    SET @var = @var + 1            -- decrement
    SET @div = 2
    SET @prime = 2
END

print @STR
