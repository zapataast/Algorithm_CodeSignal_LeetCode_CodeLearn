SELECT name as country_name ,
CASE 
    WHEN c2.gg is null then 0.00
    ELSE c2.gg
END as avg_seasonal_high_scores
FROM country as c LEFT JOIN (
SELECT country_id, round( count(country_id)*1.0/ count(distinct season),2) as gg
FROM matches
Where away_goal >= 3 OR home_goal >=3 
group by country_id) as c2
ON c2.country_id = c.id
ORDER By avg_seasonal_high_scores desc
