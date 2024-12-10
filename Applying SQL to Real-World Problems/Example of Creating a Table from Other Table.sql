-- Create a new table named family_films using this query
CREATE TABLE family_films AS
SELECT *
FROM film
WHERE rating IN ('G', 'PG');