## Databases 25
CREATE PROCEDURE nullIntern()
BEGIN
	SELECT count(ID) as gg
    FROM departments 
    WHERE description IS NULL
    OR UPPER(TRIM(description)) IN ('NULL','-','NIL')  ## description-нээс TRIM ашиглан хоёр талынх нь whitespace-ыг арилгаад , 
                                                       ## мөн UPPER ашиглан description-үсгүүдийг нь томоор бичиж байна. 
    ;
END

## Databases 26
DROP PROCEDURE IF EXISTS legsCount;
CREATE PROCEDURE legsCount()
    SELECT SUM( CASE WHEN type='human' THEN 2 WHEN type='cat' THEN 4 ELSE 4 END) as summary_legs
    FROM creatures
    ORDER BY id;
