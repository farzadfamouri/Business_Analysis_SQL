SELECT * 
FROM movies AS m
WHERE 5 < 
    (SELECT COUNT(*) 
     FROM renting AS r 
     WHERE r.movie_id = m.movie_id);