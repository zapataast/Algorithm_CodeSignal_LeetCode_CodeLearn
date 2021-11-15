Select max(salary) as SecondHighestSalary 
From employee 
Where salary!=(select Max(salary) from employee);
