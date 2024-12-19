SELECT
	-- Pull month and country_id
	date_part('month', date) AS month,
	country_id,
    -- Pull in current month views
    SUM(views) AS month_views,
    -- Pull in last month views
   LAG(SUM(views)) OVER(PARTITION BY country_id ORDER BY DATE_PART('month', date)) AS previous_month_views,
    -- Calculate the percent change
    (SUM(views)::FLOAT / LAG(SUM(views)) OVER(PARTITION BY country_id ORDER BY DATE_PART('month', date)) - 1) AS perc_change
FROM web_data
WHERE date <= '2018-05-31'
GROUP BY date_part('month', date), country_id;