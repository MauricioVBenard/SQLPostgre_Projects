-- Perform data validation checks to ensure integrity and quality of the dataset.

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