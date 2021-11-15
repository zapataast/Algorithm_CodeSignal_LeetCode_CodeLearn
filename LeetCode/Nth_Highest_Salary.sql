#Mysql 
CREATE FUNCTION getNthHighestSalary(N INT) RETURNS INT
BEGIN
      SET N = N-1;
  RETURN (
      SELECT max(salary)
      FROM Employee 
      WHERE salary = (SELECT DISTINCT salary 
                        FROM Employee
                        ORDER BY salary DESC
                        LIMIT 1
                        OFFSET N)
  );
END
#------------------------------------------------------#
#MS SQL Server 
#------------------------------------------------------#
CREATE FUNCTION getNthHighestSalary(@N INT) RETURNS INT AS
BEGIN
    SET @N = @N-1;
    RETURN (
      SELECT max(salary)
      FROM Employee 
      WHERE salary = (SELECT DISTINCT salary 
                      FROM Employee 
                      ORDER BY salary DESC 
                      OFFSET @N ROWS
                      FETCH NEXT 1 ROWS ONLY)  # LIMIT
    );
END
