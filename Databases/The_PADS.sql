SELECT
CASE 
    WHEN Left(Occupation,1) = "D" THEN CONCAT(Name,"(D)")
    WHEN Left(Occupation,1) = "P" THEN CONCAT(Name,"(P)")
    WHEN Left(Occupation,1) = "A" THEN CONCAT(Name,"(A)")
    WHEN Left(Occupation,1) = "S" THEN CONCAT(Name,"(S)")
END as gg
FROM OCCUPATIONS 
ORDER BY gg;
SELECT CONCAT("There are a total of ", count(Occupation)," ", LOWER(Occupation),"s.") as gg
FROM OCCUPATIONS
GROUP BY Occupation
ORDER BY LEFT(gg,22), LEFT(gg,24)
