/* Write your T-SQL query statement below */
Select name 
from Employee as Emp inner join (SELECT managerId
    FROM Employee
    Group by managerId
    Having Count(managerid) >= 5
    ) as result 
on emp.id = result.managerId
