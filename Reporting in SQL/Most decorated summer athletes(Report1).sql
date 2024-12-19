SELECT 
	name AS athlete_name, 
    COUNT(gold) AS gold_medals
FROM summer_games AS s
JOIN athletes AS a
ON a.id = s.athlete_id 
GROUP BY name
-- Filter for only athletes with 3 gold medals or more
HAVING COUNT(gold) >= 3
-- Sort to show the most gold medals at the top
ORDER BY gold_medals DESC;