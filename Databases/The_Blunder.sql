SELECT CEILING(avg(cast(salary as decimal))- avg(CAST(REPLACE(CAST(salary as varchar(100)), '0', '') as decimal)))
FROM employees
