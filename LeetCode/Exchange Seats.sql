DECLARE @len int;
SET @len = (SELECT count(id) FROM Seat); 

SELECT s1.id,
CASE 
    WHEN s1.id%2=0 THEN (SELECT s2.student FROM Seat s2 WHERE s1.id-1 = s2.id)
    WHEN S1.id%2<>0 AND s1.id = @len THEN s1.student
    WHEN s1.id%2<>0 THEN (SELECT s3.student FROM Seat s3 WHERE s1.id+1 = s3.id)
END as student 
FROM Seat s1
