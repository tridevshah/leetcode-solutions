# Write your MySQL query statement below
SELECT 
    tweet_id
FROM Tweets
WHERE Length(content) > 15  AND  content REGEXP '^[A-Za-z0-9! ]+$'
