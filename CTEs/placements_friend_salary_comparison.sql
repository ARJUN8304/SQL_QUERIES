WITH person_salary AS (
    SELECT 
        s.name,
        s.id,
        SUM(p.salary) AS salary
    FROM students s
    INNER JOIN packages p ON s.id = p.id
    GROUP BY s.name, s.id
),
friend_salary AS (
    SELECT 
        f.id,
        f.friend_id,
        SUM(p.salary) AS salary
    FROM friends f
    INNER JOIN packages p ON f.friend_id = p.id
    GROUP BY f.id, f.friend_id
)
SELECT p.name 
FROM person_salary p
INNER JOIN friend_salary f ON p.id = f.id
WHERE f.salary > p.salary
ORDER BY f.salary ASC;
