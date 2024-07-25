-- Solution 1: Using JOIN to delete duplicate records
DELETE p1 
FROM person p1
JOIN person p2
    ON p1.email = p2.email 
    AND p1.id > p2.id;

-- Solution 2: Using a Subquery to delete duplicate records
DELETE FROM person
WHERE id NOT IN (
    SELECT id
    FROM (
        SELECT MIN(id) AS id
        FROM person
        GROUP BY email
    ) AS tb1
);

