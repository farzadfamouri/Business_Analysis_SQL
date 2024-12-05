SELECT a.gender, -- Report for male and female actors from the USA 
       MIN(a.year_of_birth), -- The year of birth of the oldest actor
       MAX(a.year_of_birth) -- The year of birth of the youngest actor
FROM
   ( SELECT *  -- Use a subsequen SELECT to get all information about actors from the USA
   FROM actors
   WHERE nationality = 'USA') AS a
    -- Give the table the name a
GROUP BY a.gender;