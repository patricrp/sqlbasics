 SELECT *
 FROM survey
 LIMIT 10;
 
SELECT question,
COUNT(DISTINCT user_id) as 'total_users'
FROM survey
GROUP BY question;

SELECT *
FROM quiz
LIMIT 5;

SELECT *
FROM home_try_on
LIMIT 5;

SELECT *
FROM purchase
LIMIT 5;

SELECT DISTINCT q.user_id,
h.user_id IS NOT NULL AS 'is_home_try_on',
h.number_of_pairs,
p.user_id IS NOT NULL AS 'is_purchase'
FROM quiz q
LEFT JOIN home_try_on h
ON q.user_id = h.user_id
LEFT JOIN purchase p
ON p.user_id = q.user_id
LIMIT 10;


WITH funnel AS (
SELECT DISTINCT q.user_id,
h.number_of_pairs,
h.user_id IS NOT NULL AS 'is_home_try_on',
h.number_of_pairs,
p.user_id IS NOT NULL AS 'is_purchase'
FROM quiz q
LEFT JOIN home_try_on h
ON q.user_id = h.user_id
LEFT JOIN purchase p
ON p.user_id = q.user_id)
SELECT number_of_pairs,
COUNT(*) as 'total',
SUM(is_home_try_on) AS 'num_home',
SUM(is_purchase) AS 'num_purchase',
ROUND(1.0 * SUM(is_home_try_on) / COUNT(*) ,2) AS 'per_hom',
ROUND(1.0 * SUM(is_purchase) / SUM(is_home_try_on) ,2) AS 'per_purchase',
ROUND(1.0 * SUM(is_purchase) / COUNT(*) ,2) AS 'per_purchase_total'
FROM funnel
WHERE number_of_pairs IS NOT NULL
GROUP BY number_of_pairs;


