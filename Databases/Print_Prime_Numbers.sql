DECLARE @var int , @prime int      
DECLARE @STR varchar(700) = '2' -- Declare
SELECT @var = 1                -- Initialization
SELECT @prime = 2


WHILE @var <= 1000                 -- condition
    BEGIN                          -- Begin
    WHILE @prime < @var 
        BEGIN 
        IF @var % @prime = 0 
            BEGIN 
            break
            END
        IF @var-1 = @prime
            BEGIN
                SET @STR = CONCAT(@STR,'&',CAST(@var as varchar))
            END
        SET @prime = @prime + 1
    END
    SET @var = @var + 1            -- decrement
    SET @prime = 2
END

print @STR
