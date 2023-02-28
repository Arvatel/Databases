SELECT customerName FROM customer_t WHERE (customerId) = 
(
	SELECT customerId FROM order_date_t WHERE (orderId) = 
	(
		SELECT orderId FROM receipt_t 
		JOIN price_t 
		ON receipt_t.itemId = price_t.itemId
		GROUP BY orderId 
		ORDER BY SUM(price_t.price * receipt_t.quantity) DESC LIMIT 1
	)
);