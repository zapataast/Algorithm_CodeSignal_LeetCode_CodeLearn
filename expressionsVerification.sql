CREATE PROCEDURE expressionsVerification()
BEGIN
 	SELECT *
    FROM expressions
    WHERE IF(operation = '+', a+b , 
    IF(operation = '/', a div b + a % b,    ## div integer ytga bytsaana, 
    IF(operation = '*', a*b, a-b ))) like c    
    

    ;
END
