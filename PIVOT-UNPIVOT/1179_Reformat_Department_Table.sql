-- Pivot table to display revenue for each month across departments
SELECT 
    id, 
    COALESCE([Jan], 0) AS Jan_Revenue,
    COALESCE([Feb], 0) AS Feb_Revenue,
    COALESCE([Mar], 0) AS Mar_Revenue,
    COALESCE([Apr], 0) AS Apr_Revenue,
    COALESCE([May], 0) AS May_Revenue,
    COALESCE([Jun], 0) AS Jun_Revenue,
    COALESCE([Jul], 0) AS Jul_Revenue,
    COALESCE([Aug], 0) AS Aug_Revenue,
    COALESCE([Sep], 0) AS Sep_Revenue,
    COALESCE([Oct], 0) AS Oct_Revenue,
    COALESCE([Nov], 0) AS Nov_Revenue,
    COALESCE([Dec], 0) AS Dec_Revenue
FROM department
PIVOT (
    MAX(revenue)
    FOR month IN ([Jan], [Feb], [Mar], [Apr], [May], [Jun], [Jul], [Aug], [Sep], [Oct], [Nov], [Dec])
) AS pvt;
