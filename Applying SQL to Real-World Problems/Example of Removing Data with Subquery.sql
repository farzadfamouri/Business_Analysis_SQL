DELETE FROM customer
WHERE address_id IN
	(SELECT address_id
	FROM address
	WHERE city = "Woodridge");