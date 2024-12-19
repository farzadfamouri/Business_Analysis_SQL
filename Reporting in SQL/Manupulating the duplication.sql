-- Comment out the query after noting the gold medal count
/*SELECT SUM(gold) AS gold_medals
FROM winter_games;*/
-- TOTAL GOLD MEDALS: 47 

-- Calculate the total gold_medals in your query
SELECT SUM(gold_medals) AS gold_medals
FROM
	(SELECT 
     	w.country_id, 
     	SUM(gold) AS gold_medals, 
     	AVG(gdp) AS avg_gdp
    FROM winter_games AS w
    JOIN country_stats AS c
    -- Update the subquery to join on a second field
    ON c.country_id = w.country_id AND CAST(c.year AS date) = w.year

    GROUP BY w.country_id) AS subquery;