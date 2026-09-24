-- Query 1: Name with occupation initial
SELECT CONCAT(name, '(', LEFT(occupation, 1), ')')
FROM occupations
ORDER BY name ASC;

-- Query 2: Occupation count summary sentence
SELECT CONCAT('There are a total of', ' ', COUNT(occupation), ' ', LOWER(occupation), 's.')
FROM occupations
GROUP BY occupation
ORDER BY COUNT(occupation), occupation;
