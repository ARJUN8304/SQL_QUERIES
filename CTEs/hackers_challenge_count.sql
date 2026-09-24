WITH challenge_count AS (
    SELECT 
        h.hacker_id,
        h.name,
        COUNT(*) AS count
    FROM hackers h 
    INNER JOIN challenges c ON h.hacker_id = c.hacker_id 
    GROUP BY h.hacker_id, h.name
),
frequency_count AS (
    SELECT 
        count,
        COUNT(*) AS frequency
    FROM challenge_count
    GROUP BY count
)
SELECT 
    h.hacker_id,
    h.name,
    cc.count
FROM hackers h 
INNER JOIN challenge_count cc ON h.hacker_id = cc.hacker_id
INNER JOIN frequency_count f ON cc.count = f.count
WHERE 
    f.frequency = 1
    OR cc.count = (SELECT MAX(count) FROM challenge_count)
ORDER BY 
    cc.count DESC,
    h.hacker_id;
