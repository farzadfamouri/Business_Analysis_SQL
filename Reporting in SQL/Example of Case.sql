SELECT 
	name,
    -- Output 'Tall Female', 'Tall Male', or 'Other'
	CASE WHEN gender = 'F' AND height >= 175 THEN 'Tall Female'
    WHEN gender = 'M' AND height >= 190 THEN 'Tall Male'
    ELSE 'Other' END AS segment
FROM athletes;