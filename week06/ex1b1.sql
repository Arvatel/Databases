SELECT orderId, SUM(quantity * price) 
FROM receipt_t 
JOIN price_t ON receipt_t.itemId=price_t.itemId
GROUP BY orderId;