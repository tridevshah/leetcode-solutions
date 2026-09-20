# Write your MySQL query statement below
SELECT
    id,
    student
FROM (
    SELECT
        CASE
            WHEN id % 2 = 1 AND next_id IS NOT NULL THEN next_id
            WHEN id % 2 = 0 THEN previous_id
            ELSE id
        END AS id,
        student
    FROM (
        SELECT
            id,
            student,
            LAG(id) OVER (ORDER BY id) AS previous_id,
            LEAD(id) OVER (ORDER BY id) AS next_id
        FROM Seat
    ) t
) x
ORDER BY id ASC;