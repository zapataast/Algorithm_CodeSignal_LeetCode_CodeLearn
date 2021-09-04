SELECT 
q.name  AS names
FROM (
    --Find the last 5 employees who were hired recently from pr_department
    (SELECT name, 1 n
    FROM pr_department p
    ORDER BY date_joined DESC
    LIMIT 5)
    UNION ALL
    --Find the last 5 employees who were hired recently from it_department
    (SELECT name, 2 n
    FROM it_department i
    ORDER BY date_joined DESC
    LIMIT 5)
    UNION ALL
    --Find the last 5 employees who were hired recently from hr_department
    (SELECT name, 3 n
    FROM hr_department h
    ORDER BY date_joined DESC
    LIMIT 5)
    -- name уудыг тус тусад нь тоогоор дугаарлаж өгсөнөөр , гадаах Select -нд тус тусдаар эрэмблэж байна. 
    
) q
ORDER by q.n, q.name;
