# Write your MySQL query statement below
SELECT DISTINCT 
num AS ConsecutiveNums
FROM (
    SELECT 
        num,
        LAG(num) OVER(ORDER BY id) AS previous_num,
        LEAD(num) OVER(ORDER BY id) AS next_num
    FROM Logs
)t
WHERE previous_num = num AND num = next_num