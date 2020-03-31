SELECT *
FROM startups;

SELECT COUNT(*) AS total
FROM startups;

SELECT SUM(valuation) AS total
FROM startups;

SELECT MAX(valuation) AS max
FROM startups;

SELECT MAX(valuation) AS max
FROM startups
WHERE stage = 'Seed';

SELECT MAX(founded) as oldest
FROM startups;

SELECT AVG(valuation) as medium
FROM startups;

SELECT category, AVG(valuation) as medium
FROM startups
GROUP BY category;

SELECT category, ROUND(AVG(valuation),2) as medium
FROM startups
GROUP BY category;

SELECT category, ROUND(AVG(valuation),2) as medium
FROM startups
GROUP BY category;

SELECT category, ROUND(AVG(valuation),2) as medium
FROM startups
GROUP BY category
ORDER BY ROUND(AVG(valuation),2) DESC;

SELECT category, COUNT(name)
FROM startups
GROUP BY category
HAVING COUNT(name) > 3;

SELECT AVG(employees), location
FROM startups
GROUP BY location;

SELECT AVG(employees), location
FROM startups
GROUP BY location
HAVING AVG(employees) > 500;