-- List all tables in the public schema
SELECT * 
FROM pg_catalog.pg_tables
WHERE schemaname = 'public';

-- Explore the tables and fill in the correct one
SELECT * 
FROM payment 
LIMIT 10;

-- Prepare the result
SELECT EXTRACT(MONTH FROM payment_date) AS month, 
       SUM(amount) AS total_payment
FROM payment 
GROUP BY EXTRACT(MONTH FROM payment_date);