-- Select the age of the oldest athlete for each region
SELECT 
	region, 
    MAX(age) AS age_of_oldest_athlete
FROM athletes AS a
-- First JOIN statement
JOIN summer_games AS s 
ON s.athlete_id = a.id
-- Second JOIN statement
JOIN countries AS c
ON c.id = s.country_id
GROUP BY region;