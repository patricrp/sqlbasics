SELECT * FROM trips;

SELECT * FROM riders;

SELECT * FROM cars;


SELECT riders.first,
riders.last,
cars.model
FROM riders
CROSS JOIN cars;

SELECT trips.date,
  trips.car_id,
  riders.first,
  riders.last
FROM trips
LEFT JOIN riders
ON trips.rider_id = riders.id;

SELECT trips.date,
  trips.type,
  cars.model
FROM trips
INNER JOIN cars
ON trips.car_id = cars.id;

SELECT *
FROM riders
UNION
SELECT *
FROM riders2;

SELECT ROUND(AVG(cost),2) as average
FROM trips;

SELECT *
FROM riders
WHERE total_trips < 500
UNION
SELECT *
FROM riders2
WHERE total_trips < 500;

SELECT COUNT(*) as total
FROM cars
WHERE status = 'active';

SELECT *
FROM cars
ORDER BY trips_completed DESC
LIMIT 2;