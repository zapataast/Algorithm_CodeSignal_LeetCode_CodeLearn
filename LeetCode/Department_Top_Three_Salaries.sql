/* MS SQL SERVER*/
SELECT D.name as Department , E.name as Employee, E.salary  as Salary
FROM Employee E JOIN Department D ON E.departmentId = D.id
WHERE E.salary in (SELECT DISTINCT salary
                    FROM Employee 
                    WHERE departmentId = E.departmentId 
                    ORDER BY salary DESC
                    OFFSET 0 ROWS
                    FETCH NEXT 3 ROWS ONLY) 

;
