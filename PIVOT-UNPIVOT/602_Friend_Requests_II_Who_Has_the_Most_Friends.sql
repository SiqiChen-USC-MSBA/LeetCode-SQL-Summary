-- Retrieve the ID with the highest count of occurrences from requester_id and accepter_id
SELECT TOP 1 
    upvt.id, 
    COUNT(*) AS num
FROM request_accepted
-- Unpivot the columns requester_id and accepter_id into a single column 'id'
UNPIVOT (
    id FOR ids IN (requester_id, accepter_id)
) AS upvt
-- Group by the unpivoted ID to get the count
GROUP BY upvt.id
-- Order by count in descending order to get the most frequent ID
ORDER BY COUNT(*) DESC;
