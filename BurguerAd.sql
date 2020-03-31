SELECT *
FROM orders
LIMIT 10;

SELECT DISTINCT order_date
FROM orders
ORDER BY order_date DESC;

SELECT special_instructions
FROM orders
WHERE special_instructions IS NOT NULL
ORDER BY special_instructions ASC
LIMIT 20;

SELECT id AS '#',
  special_instructions AS 'Notes'
FROM orders
WHERE special_instructions LIKE '%sauce%'
ORDER BY special_instructions ASC;

SELECT id AS '#',
  special_instructions AS 'Notes'
FROM orders
WHERE special_instructions LIKE '%door%';

SELECT id AS '#',
  special_instructions AS 'Notes'
FROM orders
WHERE special_instructions LIKE '%box%';