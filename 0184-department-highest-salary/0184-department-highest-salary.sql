# Write your MySQL query statement below
SELECT 
Department,
Employee, 
salary
FROM (
    SELECT 
        d.name AS Department,
        e.name AS Employee,
        e.salary,
        MAX(e.salary) OVER(PARTITION BY d.name) AS max_salary
    FROM Employee e
    JOIN Department d
        ON e.departmentId = d.id
) t
WHERE salary = max_salary;