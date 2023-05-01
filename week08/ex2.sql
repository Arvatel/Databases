-- Query 1
SELECT film.title
FROM film
LEFT JOIN inventory ON film.film_id = inventory.film_id
LEFT JOIN film_category ON film.film_id = film_category.film_id
LEFT JOIN category ON film_category.category_id = category.category_id
WHERE inventory.inventory_id IS NULL
AND (film.rating = 'R' OR film.rating = 'PG-13')
AND (category.name = 'Horror' OR category.name = 'Sci-Fi');


-- Query 2
SELECT store.store_id, city.city, SUM(payment.amount) AS total_sales
FROM payment
JOIN rental ON rental.rental_id = payment.rental_id
JOIN inventory ON inventory.inventory_id = rental.inventory_id
JOIN store ON store.store_id = inventory.store_id
JOIN address ON address.address_id = store.address_id
JOIN city ON city.city_id = address.city_id
WHERE payment.payment_date >= (SELECT MAX(payment_date) FROM payment) - INTERVAL '1 month'
GROUP BY store.store_id, city.city
ORDER BY total_sales DESC;


-- Based on the `EXPLAIN ANALYZE` output, the most expensive step of the query is 
--  - the `Hash Join` between the `payment` and `rental` tables.
--  - `GROUP BY` step also expensive 

-- So as a possible solution creation of INDEXES for 'payment', 'rental' columns 
-- may help to optimize second query