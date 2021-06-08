CREATE PROCEDURE marketReport()
BEGIN
    
	SELECT CASE WHEN country is null then 'Total:' else country end country, count(country) as competitors
    FROM foreignCompetitors
    GROUP BY country WITH ROLLUP
    ;
END
