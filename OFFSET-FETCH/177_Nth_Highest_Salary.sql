-- Function to get the N-th highest salary from the employee table
CREATE FUNCTION getNthHighestSalary(@N INT) 
RETURNS INT 
AS
BEGIN
    RETURN (
        SELECT DISTINCT salary
        FROM employee
        ORDER BY salary DESC
        OFFSET @N - 1 ROWS
        FETCH NEXT 1 ROW ONLY
    );
END;
