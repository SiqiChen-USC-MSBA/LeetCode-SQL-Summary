-- Calculate the Click-Through Rate (CTR) for each ad
WITH tb1 AS (
    SELECT 
        ad_id, 
        ISNULL([Clicked], 0) AS Clicked,
        ISNULL([Viewed], 0) AS Viewed,
        ISNULL([Ignored], 0) AS Ignored
    FROM Ads
    PIVOT (
        COUNT(action) 
        FOR action IN ([Clicked], [Viewed], [Ignored])
    ) AS pvt
)

SELECT 
    ad_id,
    -- Calculate the CTR (Click-Through Rate) as a percentage
    CASE
        WHEN SUM(Clicked + Viewed) = 0 THEN 0.0
        ELSE CAST(SUM(Clicked) * 100.0 / SUM(Clicked + Viewed) AS DECIMAL(5, 2))
    END AS ctr
FROM tb1
GROUP BY ad_id
ORDER BY ctr DESC, ad_id;
