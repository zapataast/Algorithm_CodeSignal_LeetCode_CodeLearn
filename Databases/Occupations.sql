SELECT  d.name , p.name , s.name , a.name 
FROM (SELECT ROW_NUMBER() OVER() AS r, NAME 
FROM OCCUPATIONS
WHERE OCCUPATION = 'Doctor' ORDER by name ) as d RigHT JOIN
(SELECT ROW_NUMBER() OVER() AS r, NAME 
FROM OCCUPATIONS
WHERE OCCUPATION = 'Professor' order by name) as p ON p.r = d.r
LEFT JOIN (SELECT ROW_NUMBER() OVER() AS r, NAME 
FROM OCCUPATIONS
WHERE OCCUPATION = 'Singer' order by name) as s ON p.r = s.r 
LEFT JOIN (SELECT ROW_NUMBER() OVER() AS r, NAME 
FROM OCCUPATIONS
WHERE OCCUPATION = 'Actor' order by name) as a ON a.r = p.r
