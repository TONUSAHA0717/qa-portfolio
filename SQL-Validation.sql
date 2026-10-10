-- Fictional e-commerce schema examples. Adapt names to an authorized test DB.
-- Do not run against production without approval.

-- 1. Orders with no matching customer
SELECT o.order_id, o.customer_id
FROM orders o
LEFT JOIN customers c ON c.customer_id = o.customer_id
WHERE c.customer_id IS NULL;

-- 2. Invalid non-positive item quantities
SELECT order_item_id, order_id, product_id, quantity
FROM order_items
WHERE quantity <= 0;

-- 3. Compare order total with item subtotal (include tax/shipping/discounts as applicable)
SELECT o.order_id, o.total_amount, SUM(oi.quantity * oi.unit_price) AS item_subtotal
FROM orders o
JOIN order_items oi ON oi.order_id = o.order_id
GROUP BY o.order_id, o.total_amount
HAVING o.total_amount <> SUM(oi.quantity * oi.unit_price);

-- 4. Duplicate customer emails, if uniqueness is a business rule
SELECT LOWER(email) AS normalized_email, COUNT(*) AS record_count
FROM customers
GROUP BY LOWER(email)
HAVING COUNT(*) > 1;
