-- Add outer layer to pull season, country and unique events
SELECT 
	season, 
    c.country, 
    COUNT(DISTINCT event) AS events
FROM
    -- Pull season, country_id, and event for both seasons
    (SELECT 
     	'summer' AS season, 
     	country_id, 
     	 event
    FROM summer_games
    UNION
    SELECT 
     	'winter' AS season, 
     	country_id, 
     	event
    FROM winter_games) AS subquery
JOIN countries AS c
ON c.id = subquery.country_id
-- Group by any unaggregated fields
GROUP BY season, c.country
-- Order to show most events at the top
ORDER BY events DESC;