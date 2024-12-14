SELECT DISTINCT
  -- Select the order date
  order_date,
  -- Format the order date
  To_CHAR(order_date, 'FMDay DD, FMMonth YYYY') AS format_order_date
FROM orders
ORDER BY order_date ASC
LIMIT 3;