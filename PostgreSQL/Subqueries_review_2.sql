SELECT f.name , f.continent , e1.inflation_rate
FROM countries f  INNER JOIN economies e1
ON f.country_code = e1.country_code 
WHERE e1.inflation_rate = (SELECT e.inflation_rate   # яг inflation_rate-тай таарах ганц дээд утггыг тулгаж авч байна
  FROM countries c
  INNER JOIN economies e ON 
  c.country_code = e. country_code
  WHERE e.year = 2015 and f.continent = c.continent
  ORDER by e.inflation_rate desc
  LIMIT 1)
order by f.continent, e1.inflation_rate 
