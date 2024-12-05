SELECT 
	SUM(m.renting_price), -- Get the revenue from movie rentals
	COUNT(r.renting_id), -- Count the number of rentals
	COUNT(DISTINCT(r.customer_id))  -- Count the number of customers
FROM renting AS r
LEFT JOIN movies AS m
ON r.movie_id = m.movie_id
WHERE date_renting BETWEEN '2018-01-01' AND '2018-12-31';