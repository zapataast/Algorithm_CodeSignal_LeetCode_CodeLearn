CREATE PROCEDURE correctIPs()
BEGIN

	SELECT i2.id , CONCAT(i2.d1 ,'.', i2.d2 ,'.', i2.d3 ,'.', i2.d4) as ip
    
    FROM ips as i1 , (SELECT id,
    ip,
    SUBSTRING( ip , 1, CASE
        WHEN (Length(ip) - Length(REPLACE(ip,".",""))) = 3 THEN POSITION("." IN SUBSTRING(ip, 1, 4))-1  # энд тухайн хаяг 3 аас олон цэгтэй үгүйг шалгаж байна 
    END) as d1,
    #SUBSTRING(ip, 1, REGEXP_INSTR(ip, '[[:punctuation:]]' , 1, 1)-1) as d1,
    
    #METHOD 1 POSITION , 
    SUBSTRING(ip, LENGTH((SELECT d1))+2, POSITION("." IN SUBSTRING(ip, LENGTH((SELECT d1))+2, 4))-1) as d2, 
    
    #METHOD 2 REGEXP_INSTR 
    SUBSTRING(ip, REGEXP_INSTR(ip, '[[:punctuation:]]' , 1, 2)+1, REGEXP_INSTR(ip, '[[:punctuation:]]', 1, 3)-REGEXP_INSTR(ip, '[[:punctuation:]]', 1, 2)-1) as d3,
    SUBSTRING(ip, REGEXP_INSTR(ip, '[[:punctuation:]]' , 1, 3)+1, Length(ip) - REGEXP_INSTR(ip, '[[:punctuation:]]', 1, 3)) as d4 
    FROM ips ) as i2
    
    WHERE i2.d1 is NOT NULL AND (Length(i2.d1)>1 OR Length(i2.d2) > 1) AND CAST(i2.d1 AS UNSIGNED) < 256 AND CAST(i2.d2 AS UNSIGNED) < 256 AND CAST(i2.d3 AS UNSIGNED) < 256 AND CAST(i2.d4 AS UNSIGNED) < 256 OR (i2.d4 = "99" AND i2.d3 = "0") OR (i2.d3 = "99" AND i2.d2 = "0")
    GROUP BY i2.id
    ORDER BY i2.id
    ;
END
