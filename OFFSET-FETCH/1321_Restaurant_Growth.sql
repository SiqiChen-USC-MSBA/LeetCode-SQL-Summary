-- Calculate the rolling sum and average amount over a 7-day window
SELECT 
    visited_on, 
    -- Compute the rolling sum over a 7-day window
    SUM(SUM(amount)) OVER (
        ORDER BY visited_on 
        ROWS BETWEEN 6 PRECEDING AND CURRENT ROW
    ) AS amount,
    
    -- Compute the rolling average amount over a 7-day window
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
