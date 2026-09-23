# Write your MySQL query statement
SELECT 
u.name AS name,
SUM(amount) AS balance
FROM Users u 
JOIN Transactions t 
ON u.account = t.account
GROUP BY t.account
HAVING SUM(amount) > 10000