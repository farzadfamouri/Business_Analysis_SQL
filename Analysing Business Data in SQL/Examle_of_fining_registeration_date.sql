-- Wrap the query you wrote in a CTE named reg_dates
WITH reg_dates AS (
  SELECT
    user_id,
    MIN(order_date) AS reg_date
  FROM orders
  GROUP BY user_id)

SELECT
  -- Count the unique user IDs by registration month
  DATE_TRUNC('month', reg_date) AS delivr_month,
  COUNT(user_id) AS regs
FROM reg_dates
GROUP BY delivr_month
ORDER BY delivr_month ASC; 