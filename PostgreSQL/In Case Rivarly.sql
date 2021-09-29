/* Implement the missing code, denoted by ellipses. 
You may not modify the pre-existing code. */
SELECT 
	-- date column
	m.date AS date ,
	CASE 
		WHEN m.hometeam_id = 5 THEN 'FC Barcelona'
		ELSE 'Real Madrid CF'
	END 
	as home,
	CASE 
		WHEN m.hometeam_id = 4 THEN 'FC Barcelona'
		ELSE 'Real Madrid CF'
	END 
	as away,
	CASE 
		WHEN m.hometeam_id = 5 AND m.home_goal > m.away_goal THEN 'Barcelona win!'
		WHEN m.hometeam_id = 5 AND m.home_goal < m.away_goal THEN 'Real Madrid win!'
		WHEN m.hometeam_id = 4 AND m.home_goal > m.away_goal THEN 'Real Madrid win!'
		WHEN m.hometeam_id = 4 AND m.home_goal < m.away_goal THEN 'Barcelona win!'
		ELSE 'Tie!'
	END 
	as outcome

FROM matches_spain m
	LEFT JOIN teams_spain t
	ON t.id= m.hometeam_id
WHERE 
	(m.hometeam_id = 5 AND m.awayteam_id = 4) OR (m.hometeam_id = 4 AND m.awayteam_id = 5)
ORDER BY 
	m.id
;
