-- Calculate revenue
SELECT SUM(orders.order_quantity * meal_price) AS revenue
  FROM meals
  JOIN orders ON meals.meal_id = orders.meal_id
-- Keep only the records of customer ID 15
WHERE orders.user_id = 15;