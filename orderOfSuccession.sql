CREATE PROCEDURE orderOfSuccession()
BEGIN
	/* Write your SQL here. Terminate each statement with a semicolon. */
    #SELECT CASE WHEN country is null then 'Total:' else country end country, count(country) as competitors
    SELECT
    CASE 
        WHEN gender = 'F' THEN CONCAT("Queen ", name)
        WHEN gender = 'M' THEN CONCAT("King ", name)
    END AS name
    FROM Successors 
    ORDER BY birthday;
END
