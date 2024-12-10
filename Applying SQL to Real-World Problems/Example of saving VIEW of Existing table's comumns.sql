CREATE VIEW table_columns AS

SELECT table_name,
		STRING_AGG(column_name, '_') AS columns
FROM information_schema.columns
WHERE table_schema = 'public'
GROUP BY table_name; 
