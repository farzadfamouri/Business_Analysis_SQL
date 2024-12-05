SELECT gender, -- Extract information of a pivot table of gender and country for the number of customers
	   country,
	   COUNT(*)
FROM customers
GROUP BY CUBE (gender, country)
ORDER BY country;