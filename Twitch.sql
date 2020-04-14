SELECT *
FROM stream
LIMIT 20;

SELECT *
FROM chat
LIMIT 20;

SELECT DISTINCT game
FROM stream;

SELECT DISTINCT channel
FROM stream;

SELECT game,
COUNT(*)
FROM stream
GROUP BY game;

SELECT country,
COUNT(*)
FROM stream
WHERE game = 'League of Legends'
GROUP BY country
ORDER BY COUNT(*) DESC;

SELECT player,
COUNT(*)
FROM stream
GROUP BY player
ORDER BY COUNT(*) DESC;

SELECT game, 
CASE 
WHEN game = 'League of Legends' THEN 'MOBA'
WHEN game = 'Dota 2' THEN 'MOBA'
WHEN game = 'Heroes of the Strom' THEN 'MOBA'
WHEN game = 'Counter-Strike: Global Offensive' THEN 'FPS'
WHEN game = 'DayZ' THEN 'Survival'
WHEN game = 'Survival Evolved' THEN 'Survival'
ELSE 'Other'
END AS 'genre',
COUNT(*)
FROM stream
GROUP BY genre
ORDER BY COUNT(*) DESC;

SELECT time
FROM stream
LIMIT 10;

SELECT
strftime('%H', time) AS hour,
COUNT(*)
FROM stream
WHERE country = 'US'
GROUP BY strftime('%H', time);

SELECT * 
FROM stream str
INNER JOIN chat cha
ON str.device_id = cha.device_id;