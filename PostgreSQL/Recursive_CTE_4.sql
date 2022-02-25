WITH RECURSIVE employee_hierarchy AS (
	SELECT
		id, name, Supervisor, position
	FROM employees
  	-- Start with the IT Director
  	WHERE Supervisor = 0
	UNION ALL
	SELECT e.id, e.name, e.Supervisor, e.position
    FROM employees e
         JOIN employee_hierarchy e1 ON e1.id = e.Supervisor
)

SELECT CASE
	WHEN dv3 is null and dv2 is null THEN dv1
	WHEN dv3 is null THEN Concat(dv2, ' -> ',dv1) 
	ELSE Concat(dv3, ' -> ', dv2 , ' -> ' , dv1) 
END as path
FROM (SELECT 
	CASE WHEN d.position = 'Developer' THEN d.name else null END as dv1 ,
	CASE WHEN d.Supervisor = e.id and e.Supervisor != 0 THEN e.name else null END as dv2,
	CASE WHEN c.id != 1 THEN c.name else null end as dv3
FROM 
	employee_hierarchy as d LEFT JOIN employees as e ON e.id = d.Supervisor 
	LEFT JOIN employees as c ON e.Supervisor = c.id
WHERE
	d.position LIKE 'Developer'
ORDER by d.name
) as g
