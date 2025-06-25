-- Check products.brand_id
SELECT p.product_id, p.brand_id AS orphaned_brand_id
FROM products p
LEFT JOIN brands b ON p.brand_id = b.brand_id
WHERE b.brand_id IS NULL;
-- Expected Result: 0 rows returned.
-- Insight: All products successfully link to an existing brand.

-- Check order_items.order_id
SELECT oi.order_item_id, oi.order_id AS orphaned_order_id
FROM order_items oi
LEFT JOIN orders o ON oi.order_id = o.order_id
WHERE o.order_id IS NULL;
-- Expected Result: 0 rows returned.
-- Insight: All order items successfully link to an existing order.

-- Check order_items.product_id
SELECT oi.order_item_id, oi.product_id AS orphaned_product_id
FROM order_items oi
LEFT JOIN products p ON oi.product_id = p.product_id
WHERE p.product_id IS NULL;
-- Expected Result: 0 rows returned.
-- Insight: All order items successfully link to an existing product.
