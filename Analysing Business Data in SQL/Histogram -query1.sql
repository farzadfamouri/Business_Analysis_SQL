WITH user_orders AS (SELECT
user_id,
COUNT(DISTINCT order_id) AS orders
FROM meals
JOIN orders ON meals.meal_id = orders.meal_id
GROUP BY user_id)

SELECT
	orders,
	COUNT(DISTINCT user_id) AS users
FROM user_orders
GROUP BY orders
ORDER BY orders ASC;