# Write your MySQL query statement below
SELECT 
person_name
FROM
(
SELECT 
turn,
person_id,
person_name,
weight,
SUM(weight) OVER (
    ORDER BY turn
    ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW
) AS  Accumulated_weight
FROM Queue 
)t
WHERE Accumulated_weight<=1000
ORDER BY turn DESC
LIMIT 1
