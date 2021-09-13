SELECT 
    COALESCE(country, 'Total:') AS country,
    count(country) as competitors
FROM
    foreignCompetitors
GROUP BY ROLLUP (country)
;

