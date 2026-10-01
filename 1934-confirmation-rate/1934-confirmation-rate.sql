# Write your MySQL query statement below
SELECT 
    user_id,
    ROUND(
        Confirmed_Category / COALESCE(NULLIF(Action_count, 0), 1),
        2
    ) AS confirmation_rate
FROM (
    SELECT 
        s.user_id,
        COUNT(c.action) AS Action_count,
        SUM(
            CASE 
                WHEN c.action = 'confirmed' THEN 1
                ELSE 0
            END
        ) AS Confirmed_Category
    FROM Signups s
    LEFT JOIN Confirmations c
        ON s.user_id = c.user_id
    GROUP BY s.user_id
) t;