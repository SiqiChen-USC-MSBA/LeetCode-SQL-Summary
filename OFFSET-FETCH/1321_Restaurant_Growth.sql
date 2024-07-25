-- Calculate the rolling sum and average amount over a 7-day window
SELECT 
    visited_on,
    
    -- Compute the rolling sum of 'amount' over the past 7 days including the current day
    SUM(SUM(amount)) OVER (
        ORDER BY visited_on 
        ROWS BETWEEN 6 PRECEDING AND CURRENT ROW
    ) AS amount,
    
    -- Compute the rolling average of 'amount' over the past 7 days including the current day
    CAST(
        SUM(SUM(amount)) OVER (
            ORDER BY visited_on 
            ROWS BETWEEN 6 PRECEDING AND CURRENT ROW
        ) / 7.0
        AS DECIMAL(10, 2)
    ) AS average_amount
FROM Customer
GROUP BY visited_on
ORDER BY visited_on
OFFSET 6 ROWS;
