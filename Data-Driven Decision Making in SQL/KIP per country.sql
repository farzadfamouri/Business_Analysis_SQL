SELECT 
    c.country,                     -- Report KPIs for each country
    COUNT(*) AS number_renting,    -- Total number of movie rentals
    AVG(r.rating) AS average_rating, -- Average rating of all movies
    SUM(m.renting_price) AS revenue -- Total revenue from movie rentals
FROM renting AS r
LEFT JOIN customers AS c
ON c.customer_id = r.customer_id
LEFT JOIN movies AS m
ON m.movie_id = r.movie_id
WHERE r.date_renting >= '2019-01-01' -- Rentals since 2019
GROUP BY c.country; -- Group by country for KPIs