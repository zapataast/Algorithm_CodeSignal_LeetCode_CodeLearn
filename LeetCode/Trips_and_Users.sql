SELECT m.request_at as Day , ROUND(CAST(t1.v1/t1.v2 as numeric(36,2)), 2 ) as 'Cancellation Rate'
FROM Trips as m
LEFT JOIN
(SELECT t.request_at,
    SUM(CASE WHEN t.status <> 'completed' AND u.banned = 'No' THEN 1 ELSE 0 END)*1.0 as v1,     SUM(CASE WHEN u.banned = 'No' THEN 1 END) as v2 
FROM Trips as t
INNER JOIN Users as u 
ON t.client_id = u.users_id
WHERE (t.request_at BETWEEN '2013-10-01' AND '2013-10-03') AND (
    --driverd_id banned үгүйг шалгаж байна. 
    SELECT  u1.banned
    FROM Trips 
    INNER JOIN Users u1 
    ON driver_id = u1.users_id
    WHERE t.id = id
    ) = 'No'
GROUP BY t.request_at) as t1
ON t1.request_at = m.request_at

WHERE t1.v1 IS NOT NULL AND t1.v2 IS NOT NULL 
GROUP BY m.request_at, t1.v1, t1.v2

;
