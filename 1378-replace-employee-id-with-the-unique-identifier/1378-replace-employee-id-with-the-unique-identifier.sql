# Write your MySQL query statement below
SELECT 
    unique_id,
    name
FROM Employees e 
LEFT JOIN EmployeeUNI eunique
ON e.id = eunique.id