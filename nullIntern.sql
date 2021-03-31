CREATE PROCEDURE nullIntern()
BEGIN
	SELECT count(ID) as gg
    FROM departments 
    WHERE description IS NULL
    OR UPPER(TRIM(description)) IN ('NULL','-','NIL')  ## description-нээс TRIM ашиглан хоёр талынх нь whitespace-ыг арилгаад , 
                                                       ## мөн UPPER ашиглан description-үсгүүдийг нь томоор бичиж байна. 
    ;
END
