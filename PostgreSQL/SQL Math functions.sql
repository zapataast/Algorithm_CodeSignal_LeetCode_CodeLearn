/* Implement the missing code, denoted by ellipses. 
You may not modify the pre-existing code. */
--round( CAST(float8 '3.1415927' as numeric), 2);


SELECT 
	ROUND( CAST( SUM(SQRT(POW(m.x-c.x,2)+POW(m.y-c.y,2))) as numeric),9) as total
FROM
	cities c , cities m
WHERE
	m.id = c.id + 1
;
