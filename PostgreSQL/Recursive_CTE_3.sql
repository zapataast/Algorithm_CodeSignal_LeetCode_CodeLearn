-- Create the CTE employee_hierarchy
WITH RECURSIVE employee_hierarchy AS (
	SELECT
		id, name, Supervisor
	FROM employees
  	-- Start with the IT Director
  	WHERE Supervisor = 0
	UNION ALL
	SELECT e.id, e.name, e.Supervisor
    FROM employees e
         JOIN employee_hierarchy e1 ON e1.id = e.Supervisor
)
    
SELECT 
    cte.name as employee_name,
    emp.name as manager_name
FROM employee_hierarchy as CTE
	JOIN employees as emp
	-- Perform the JOIN on supervisor and id
	ON CTE.supervisor = emp.id
ORDER BY cte.name, emp.name
