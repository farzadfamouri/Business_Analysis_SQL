-- Pull in sport, bmi_bucket, and athletes
SELECT 
	sport,
    -- Bucket BMI in three groups: <.25, .25-.30, and >.30	
    CASE WHEN  (100 * weight / POWER(height ,2)) < 0.25  THEN '<.25'
    WHEN (100 * weight / POWER(height ,2)) < 0.30 THEN '.25-.30'
    WHEN (100 * weight / POWER(height ,2)) > 0.3 THEN '>.30' 
	ELSE 'No weight recorded' END AS bmi_bucket,
    COUNT(DISTINCT id) AS athletes
FROM summer_games AS s
JOIN athletes AS a
ON a.id = s.athlete_id
-- GROUP BY non-aggregated fields
GROUP BY sport, bmi_bucket
-- Sort by sport and then by athletes in descending order
ORDER BY sport, athletes DESC;