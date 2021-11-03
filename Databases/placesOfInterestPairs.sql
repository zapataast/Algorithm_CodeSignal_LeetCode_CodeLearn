CREATE PROCEDURE placesOfInterestPairs()
BEGIN
    SELECT 
    CASE 
        WHEN s2.place1 > s2.place2 THEN s2.place2 ELSE s2.place1
    END as pl,
    CASE 
        WHEN s2.place2 > s2.place1 THEN s2.place2 ELSE s2.place1 
    END as pl2
    FROM sights s1,
    (Select DISTINCT 
    CASE
        WHEN u1.id >= u.id THEN u.name 
        ELSE u1.name 
    END place1,
    CASE 
        WHEN u1.id < u.id THEN u.name 
        ELSE u1.name 
    END place2  , u.id
    From sights u CROSS JOIN sights u1
    WHERE u.name != u1.name AND SQRT(POW(u.x-u1.x,2) + POW(u.y-u1.y,2)) < 5
    ) s2
    GROUP BY 
        s2.place1, s2.place2
    ORDER BY 
        pl, pl2 
    ;
END
