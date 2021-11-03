CREATE PROCEDURE routeLength()
BEGIN
	SELECT ROUND(SUM(SQRT(POW(c2.x-c1.x,2)+POW(c2.y-c1.y,2))),9) as total
    FROM cities as c1
    JOIN cities as c2 on (c1.id+1 = c2.id)
    ;
END
