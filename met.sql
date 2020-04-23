SELECT *
FROM met
LIMIT 10;

SELECT COUNT(*) as 'Total pieces'
FROM met;

SELECT COUNT(*) as 'Pieces with celery'
FROM met
WHERE category LIKE '%celery%';

SELECT DISTINCT category
FROM met
WHERE category LIKE '%celery%';

SELECT MIN(date)
FROM met;

SELECT title,
medium
FROM met
WHERE date LIKE '%1600%';

SELECT country,
COUNT(*)
FROM met
WHERE country IS NOT NULL
GROUP BY country
ORDER BY COUNT(*) DESC
LIMIT 10;

SELECT category,
COUNT(*)
FROM met
GROUP BY category
HAVING COUNT(*) > 100;

SELECT medium, COUNT(*) AS 'pieces with gold or silver'
FROM met
WHERE medium LIKE '%gold%' OR 
  medium LIKE '%silver%'
GROUP BY medium
ORDER BY 2 DESC;