# Write your MySQL query statement below
SELECT 
    ROUND(
        SUM(
            CASE
                WHEN order_type = 'immediate' THEN 1
                ELSE 0
            END
        ) / COUNT(*) * 100,
        2
    ) AS immediate_percentage
FROM (
    SELECT 
        d.customer_id,
        CASE
            WHEN d.customer_pref_delivery_date = d.order_date THEN 'immediate'
            ELSE 'scheduled'
        END AS order_type
    FROM Delivery AS d
    JOIN (
        SELECT 
            customer_id,
            MIN(order_date) AS first_order_date
        FROM Delivery
        GROUP BY customer_id
    ) AS f
    ON d.customer_id = f.customer_id
    AND d.order_date = f.first_order_date
) AS t;