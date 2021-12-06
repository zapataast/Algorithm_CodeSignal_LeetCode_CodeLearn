SELECT 
	l.name AS league_name,
	ROUND((CAST(SUM(m.home_goal + m.away_goal) as numeric)/COUNT(l.name)),2) as avg_goals,
	ROUND((SELECT (SUM(home_goal)+SUM(away_goal))::numeric/COUNT(id) FROM matches WHERE date BETWEEN '2011-07-01' AND '2011-08-31'),2) as overall_avg
FROM 
	matches as m INNER JOIN league as l 
	ON l.country_id = m.country_id

WHERE m.date BETWEEN '2011-07-01' AND '2011-08-31'
GROUP BY
	l.name
ORDER BY
	l.name
;
