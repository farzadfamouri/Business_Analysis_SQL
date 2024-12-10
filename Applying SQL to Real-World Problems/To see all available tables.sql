SELECT *
FROM pg_catalog.pg_tables	
WHERE schemaname = 'public';


SELECT *
FROM information_schema.columns	
WHERE table_schema = 'public';
