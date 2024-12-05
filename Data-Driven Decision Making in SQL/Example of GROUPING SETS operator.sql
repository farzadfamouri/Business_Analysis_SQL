SELECT nationality,
gender,
COUNT(*)
FROM actors
GROUP BY  GROUPING SETS(nationality, gender);