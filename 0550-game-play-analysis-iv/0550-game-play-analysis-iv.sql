# Write your MySQL query statement below
With FirstLogin AS (
    SELECT 
    player_id,
    MIN(event_date) AS first_date
    FROM Activity
    GROUP BY player_id
),
ReturnedPlayer AS (
    SELECT DISTINCT 
    f.player_id
    FROM FirstLogin f
    JOIN Activity a
    ON f.player_id = a.player_id
    AND a.event_date = f.first_date+INTERVAL 1 DAY
)

SELECT 
    ROUND(
        COUNT(*)/(SELECT COUNT(*) FROM FirstLogin) , 2) AS fraction
FROM ReturnedPlayer;