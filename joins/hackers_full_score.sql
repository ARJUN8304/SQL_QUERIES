SELECT 
    h.hacker_id,
    h.name
FROM hackers h
INNER JOIN submissions s ON h.hacker_id = s.hacker_id
INNER JOIN challenges c ON c.challenge_id = s.challenge_id
INNER JOIN difficulty d ON d.difficulty_level = c.difficulty_level
WHERE d.score = s.score
GROUP BY h.hacker_id, h.name
HAVING COUNT(c.challenge_id) > 1
ORDER BY 
    COUNT(c.challenge_id) DESC,
    h.hacker_id ASC;
