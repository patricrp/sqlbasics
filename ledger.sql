SELECT *
FROM transactions;

SELECT SUM(money_in) as total_in
FROM transactions;

SELECT SUM(money_out) as total_out
FROM transactions;

SELECT COUNT(money_in) as trans_in
FROM transactions;

SELECT COUNT(money_in) as trans_BIT
FROM transactions
WHERE currency = 'BIT';

SELECT 21.0 / 43.0;

SELECT MAX(money_in) as max_in,
MAX(money_out) as max_out
FROM transactions;

SELECT AVG(money_in) as average_ETH
FROM transactions
WHERE currency = 'ETH';


SELECT date,
ROUND(AVG(money_in),2) AS average_in,
ROUND(AVG(money_out),2) AS average_out,
ROUND(AVG(money_in) - AVG(money_out),2) AS earning
FROM transactions
GROUP BY date;