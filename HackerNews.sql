SELECT title, score
 FROM hacker_news
 ORDER BY score DESC
 LIMIT 5;

 SELECT SUM(score) as total
 FROM hacker_news;

 SELECT user,
 SUM(score) AS total
 FROM hacker_news
 GROUP BY user
 HAVING SUM(score) > 200
 ORDER BY 2 DESC;

SELECT (517 + 309 + 304 + 282) / 6366.0;

SELECT user, COUNT(*)
FROM hacker_news
WHERE url LIKE '%watch?v=dQw4w9WgXcQ%'
GROUP BY user
ORDER BY COUNT(*) DESC;

SELECT
  CASE
  WHEN url LIKE '%github%' THEN 'GitHub'
  WHEN url LIKE '%medium%' THEN 'Medium'
  WHEN url LIKE '%nytimes%' THEN 'New York Times'
  ELSE 'Other'
  END AS 'Source',
COUNT(*)
FROM hacker_news
GROUP BY Source;

SELECT timestamp
FROM hacker_news
LIMIT 10;

SELECT timestamp,
strftime('%H', timestamp)
FROM hacker_news
GROUP BY 1
LIMIT 20;

SELECT strftime('%H', timestamp) as 'Hour',
ROUND(AVG(score)) as 'Average',
COUNT(*) as 'Total stories'
FROM hacker_news
WHERE Hour IS NOT NULL
GROUP BY Hour
ORDER BY 1;