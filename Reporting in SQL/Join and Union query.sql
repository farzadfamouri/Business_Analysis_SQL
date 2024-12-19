-- Query season, country, and events for all summer events
SELECT 
    'summer' AS season, 
    c.country, 
    COUNT(DISTINCT s.event) AS events
FROM summer_games AS s
JOIN countries AS c
ON c.id = s.country_id
GROUP BY c.country

UNION ALL

-- Query season, country, and events for all winter events
SELECT 
    'winter' AS season, 
    c.country, 
    COUNT(DISTINCT w.event) AS events
FROM winter_games AS w
JOIN countries AS c
ON c.id = w.country_id
GROUP BY c.country

-- Sort the results to show the most events at the top
ORDER BY events DESC;