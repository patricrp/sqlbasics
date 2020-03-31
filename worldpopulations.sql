-- This is the first query:

SELECT DISTINCT year from population_years;

-- Add your additional queries below:

SELECT MAX(population)
FROM population_years
WHERE country = 'Gabon';

SELECT country, population
FROM population_years
ORDER BY population ASC
LIMIT 10;

SELECT DISTINCT country
FROM population_years
WHERE population > 100
AND year = 2010;

SELECT COUNT(DISTINCT country)
FROM population_years
WHERE country LIKE '%Islands%';

SELECT population
FROM population_years
WHERE country = 'Indonesia' AND year BETWEEN 2000 AND 2010;

SELECT p10.population - p00.population
FROM population_years p00
JOIN population_years p10 
ON p00.country = p10.country AND p10.year = 2010
WHERE p00.country = 'Indonesia'
AND p00.year = 2000;