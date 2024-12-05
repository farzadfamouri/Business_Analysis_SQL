SELECT 
    c.country,              -- Select country
    m.genre,                -- Select genre
    AVG(r.rating) AS avg_rating,  -- Average rating per country and genre
    COUNT(*) AS num_rentals       -- Total number of rentals
FROM renting AS r
LEFT JOIN movies AS m
    ON r.movie_id = m.movie_id  
LEFT JOIN customers AS c
    ON r.customer_id = c.customer_id  
GROUP BY ROLLUP(c.country, m.genre)  -- Rollup for subtotals and grand total
ORDER BY c.country, m.genre;