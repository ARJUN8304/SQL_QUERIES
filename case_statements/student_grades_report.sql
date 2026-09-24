SELECT 
    CASE 
        WHEN g.Grade < 8 THEN NULL
        ELSE n.name
    END AS name,
    g.Grade,
    n.marks
FROM students n
INNER JOIN Grades g ON n.marks BETWEEN g.min_mark AND g.max_mark
ORDER BY 
    g.Grade DESC,
    CASE WHEN g.Grade >= 8 THEN n.name END ASC,
    CASE WHEN g.Grade < 8 THEN n.marks END ASC;
