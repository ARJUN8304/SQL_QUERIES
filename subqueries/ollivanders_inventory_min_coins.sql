SELECT 
    w.id,
    a.age,
    a.coins_needed,
    a.power 
FROM (
    SELECT 
        wp.age,
        MIN(w.coins_needed) AS coins_needed,
        w.power 
    FROM wands w
    INNER JOIN wands_property wp ON w.code = wp.code
    WHERE wp.is_evil = 0
    GROUP BY wp.age, w.power 
) a
LEFT JOIN (
    SELECT 
        w.id,
        wp.age,
        w.coins_needed,
        w.power 
    FROM wands w
    INNER JOIN wands_property wp ON w.code = wp.code
    WHERE wp.is_evil = 0
) w
ON a.age = w.age 
AND a.coins_needed = w.coins_needed 
AND a.power = w.power
ORDER BY 
    a.power DESC,
    a.age DESC;
