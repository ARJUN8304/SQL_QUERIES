WITH max_score AS (
    SELECT 
        h.hacker_id,
        h.name,
        s.challenge_id,
        MAX(score) AS score
    FROM hackers h
    INNER JOIN submissions s ON h.hacker_id = s.hacker_id  
    GROUP BY h.hacker_id, h.name, s.challenge_id  
)
SELECT 
    h.hacker_id,
    h.name,
    SUM(s.score)
FROM hackers h 
INNER JOIN max_score s ON h.hacker_id = s.hacker_id
WHERE s.score != 0
GROUP BY h.hacker_id, h.name
ORDER BY 
    SUM(s.score) DESC,
    h.hacker_id ASC;
