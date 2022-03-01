SELECT p1.id as id1, (SELECT p.id as d2
FROM positions p , positions d 
WHERE p.id != d.id and d.id = p1.id
order by d.id , SQRT(POW(p.x-d.x,2)+POW(p.y-d.y,2))
LIMIT 1) as id2
FROM positions p1 
