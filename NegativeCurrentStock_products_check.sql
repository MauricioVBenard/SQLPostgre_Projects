-- 4. Data Range and Consistency Checks
-- Purpose: Identify illogical or out-of-bounds values.
-- Check for negative current stock in products
SELECT product_id, product_name, current_stock FROM products WHERE current_stock < 0;
-- Expected Result: 0 rows returned.
-- Insight: All products have non-negative stock levels.