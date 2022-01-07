/* Write your T-SQL query statement below */
SELECT * 
FROM Stadium as s1 
WHERE (s1.people >= 100 AND (SELECT s2.people
                        FROM Stadium as s2
                        WHERE s1.id-1 = s2.id
                        ) >= 100 AND (SELECT s3.people
                        FROM Stadium as s3
                        WHERE s1.id-2 = s3.id
                        ) >= 100) OR 
      (s1.people >= 100 AND (SELECT s2.people
                        FROM Stadium as s2
                        WHERE s1.id+1 = s2.id
                        ) >= 100 AND (SELECT s3.people
                        FROM Stadium as s3
                        WHERE s1.id+2 = s3.id
                        ) >= 100) OR
      (s1.people >= 100 AND (SELECT s2.people
                        FROM Stadium as s2
                        WHERE s1.id+1 = s2.id
                        ) >= 100 AND (SELECT s3.people
                        FROM Stadium as s3
                        WHERE s1.id-1 = s3.id
                        ) >= 100)
                        
;
