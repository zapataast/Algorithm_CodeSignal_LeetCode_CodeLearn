/* MS SQL SERVER */
SELECT t3.name as Department , t1.name as Employee, t1.salary as Salary 
FROM Employee t1
JOIN (SELECT max(salary) as salary,departmentId FROM Employee GROUP BY departmentId) t2 
ON t1.salary = t2.salary
JOIN Department t3 
ON t3.id = t1.departmentId
WHERE t1.departmentId = t2.departmentId 
;
