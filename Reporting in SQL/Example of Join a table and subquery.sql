SELECT
	-- Pull in region and calculate avg tallest height
	region,
    AVG(height) AS avg_tallest
FROM countries AS c
JOIN
    (SELECT 
   	    -- Pull in country_id and height
        country_id, 
        height, 
        -- Number the height of each country's athletes
        ROW_NUMBER() OVER (PARTITION BY country_id ORDER BY height DESC) AS row_num
    FROM winter_games AS w 
    JOIN athletes AS a 
    ON w.athlete_id = a.id
    GROUP BY country_id, height
    -- Alias as subquery
    ORDER BY country_id, height DESC) AS subquery
ON subquery.country_id = c.id
-- Only include the tallest height for each country
WHERE row_num = 1
GROUP BY region;