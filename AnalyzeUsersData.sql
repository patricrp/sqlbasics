SELECT COUNT(*)
FROM users
WHERE email LIKE '%.com';

SELECT first_name, COUNT(first_name)
FROM users
GROUP BY first_name
ORDER BY COUNT(first_name) DESC;

SELECT ROUND(watch_duration_in_minutes) AS duration,
  COUNT(watch_duration_in_minutes) AS count
FROM watch_history
GROUP BY ROUND(watch_duration_in_minutes)
ORDER BY duration ASC;

SELECT user_id, sum(amount)
FROM payments
WHERE status = 'paid'
GROUP BY user_id
ORDER BY sum(amount) DESC;

SELECT
  user_id, SUM(watch_duration_in_minutes)
FROM
  watch_history
GROUP BY user_id
HAVING SUM(watch_duration_in_minutes) > 400;

SELECT
  ROUND(SUM(watch_duration_in_minutes), 0)
FROM watch_history;

SELECT pay_date, sum(amount)
FROM payments
WHERE status = 'paid'
GROUP BY pay_date
ORDER BY sum(amount) DESC;

SELECT
AVG(amount)
FROM payments
WHERE status='paid';

SELECT
  MAX(watch_duration_in_minutes),
  MIN(watch_duration_in_minutes)
FROM
  watch_history;