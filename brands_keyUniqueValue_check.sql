--Primary Key Uniqueness Check
-- Purpose: Ensure all primary key columns contain unique values.
SELECT 'brands' AS table_name, 'brand_id' AS pk_column, brand_id, COUNT(*)
FROM brands GROUP BY brand_id HAVING COUNT(*) > 1
UNION ALL
SELECT 'products', 'product_id', product_id, COUNT(*)
FROM products GROUP BY product_id HAVING COUNT(*) > 1
UNION ALL
SELECT 'customers', 'customer_id', customer_id, COUNT(*)
FROM customers GROUP BY customer_id HAVING COUNT(*) > 1
UNION ALL
SELECT 'orders', 'order_id', order_id, COUNT(*)
FROM orders GROUP BY order_id HAVING COUNT(*) > 1
UNION ALL
SELECT 'order_items', 'order_item_id', order_item_id, COUNT(*)
FROM order_items GROUP BY order_item_id HAVING COUNT(*) > 1;