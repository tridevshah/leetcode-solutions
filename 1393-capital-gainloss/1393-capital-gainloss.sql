# Write your MySQL query statement below
SELECT 
    stock_name, 
    SUM( 
        CASE 
            WHEN operation = 'Sell' THEN price 
            WHEN operation = 'Buy' THEN -price 
        END 
    ) AS capital_gain_loss 
FROM (
    SELECT  
        stock_name, 
        operation, 
        price, 
        operation_day, 
        RANK() OVER(
            PARTITION BY stock_name 
            ORDER BY operation_day
        ) AS rnk 
    FROM Stocks 
) t 
GROUP BY stock_name 
ORDER BY ABS(capital_gain_loss);