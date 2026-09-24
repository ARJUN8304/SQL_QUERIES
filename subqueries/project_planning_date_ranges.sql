SELECT 
    s.start_date,
    MIN(e.end_date)
FROM
    (SELECT start_date 
     FROM projects
     WHERE start_date NOT IN 
        (SELECT end_date FROM projects)
    ) AS s,
    (SELECT end_date 
     FROM projects
     WHERE end_date NOT IN 
        (SELECT start_date FROM projects)
    ) AS e
WHERE s.start_date < e.end_date
GROUP BY s.start_date
ORDER BY 
    DATEDIFF(day, s.start_date, MIN(e.end_date)) ASC,
    s.start_date;
