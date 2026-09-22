# Write your MySQL query statement below
WITH user_rank AS (
    SELECT
        u.name,
        ROW_NUMBER() OVER (
            ORDER BY COUNT(mr.movie_id) DESC, u.name ASC
        ) AS rn
    FROM Users AS u
    JOIN MovieRating AS mr
        ON u.user_id = mr.user_id
    GROUP BY u.user_id, u.name
),

movie_rank AS (
    SELECT
        m.title,
        ROW_NUMBER() OVER (
            ORDER BY AVG(mr.rating) DESC, m.title ASC
        ) AS rn
    FROM Movies AS m
    JOIN MovieRating AS mr
        ON m.movie_id = mr.movie_id
    WHERE mr.created_at >= '2020-02-01'
      AND mr.created_at < '2020-03-01'
    GROUP BY m.movie_id, m.title
)

SELECT name AS results
FROM user_rank
WHERE rn = 1
UNION ALL
SELECT title AS results
FROM movie_rank
WHERE rn = 1;