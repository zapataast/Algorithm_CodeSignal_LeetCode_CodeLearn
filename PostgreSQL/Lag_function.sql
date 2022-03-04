WITH weightlifting_gold AS (
  SELECT year , country as champion,
  LAG(country,1) OVER (ORDER BY year) c2
  FROM summer_medals 
  WHERE sport = 'Weightlifting' and medal = 'Gold'

)

SELECT
  year, champion , CASE wHEN c2 is null tHEN 'N/A' ELSE c2 END as last_champion
FROM weightlifting_gold
