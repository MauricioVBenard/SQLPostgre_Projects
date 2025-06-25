-- DATA_VALIDATION_QUERIES.SQL
-- 1. Row Counts Verification
-- Purpose: To confirm that the expected number of records were loaded into each table.
SELECT 'brands' AS table_name, COUNT(*) AS row_count FROM brands
UNION ALL
SELECT 'products', COUNT(*) FROM products
UNION ALL
SELECT 'customers', COUNT(*) FROM customers
UNION ALL
SELECT 'orders', COUNT(*) FROM orders
UNION ALL
SELECT 'order_items', COUNT(*) FROM order_items;
-- Expected Result: Counts should match the numbers used in data_population.sql (e.g., brands=10, products=51, customers=50, orders=30, order_items=57).
-- Insight: Confirms complete data load.


-- 2. Primary Key Uniqueness Check
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
-- Expected Result: 0 rows returned for all checks.
-- Insight: All primary keys are unique, ensuring each record is uniquely identifiable.


-- 3. Foreign Key Integrity Check (Orphan Records)
-- Purpose: Verify all foreign key references point to existing records in parent tables.
-- Check orders.customer_id
SELECT o.order_id, o.customer_id AS orphaned_customer_id
FROM orders o
LEFT JOIN customers c ON o.customer_id = c.customer_id
WHERE c.customer_id IS NULL;
-- Expected Result: 0 rows returned.
-- Insight: All orders successfully link to an existing customer.

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


-- 4. Data Range and Consistency Checks
-- Purpose: Identify illogical or out-of-bounds values.

-- Check for non-positive retail prices in products
SELECT product_id, product_name, retail_price FROM products WHERE retail_price <= 0;
-- Expected Result: 0 rows returned.
-- Insight: All products have positive retail prices.

-- Check for negative current stock in products
SELECT product_id, product_name, current_stock FROM products WHERE current_stock < 0;
-- Expected Result: 0 rows returned.
-- Insight: All products have non-negative stock levels.

-- Check for non-positive quantities in order_items
SELECT order_item_id, quantity FROM order_items WHERE quantity <= 0;
-- Expected Result: 0 rows returned.
-- Insight: All order items have positive quantities.

-- Check for negative or zero total_amount in orders
SELECT order_id, total_amount FROM orders WHERE total_amount <= 0;
-- Expected Result: Some rows might be 0 if orders have no items, but no negative.
-- Insight: Order total amounts are calculated correctly and are non-negative.

-- Check for future order dates (assuming current data is historical)
SELECT order_id, order_date FROM orders WHERE order_date > CURRENT_DATE;
-- Expected Result: 0 rows returned (assuming test data is in the past or present).
-- Insight: All order dates are valid and not in the future.