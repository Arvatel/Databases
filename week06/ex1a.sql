SELECT orderId, itemId, quantity INTO receipt_t FROM orders;
SELECT itemId, itemName, price INTO price_t FROM orders;
SELECT customerId, customerName, city INTO customer_t FROM orders;
SELECT orderId, customerId, date INTO order_date_t FROM orders;

