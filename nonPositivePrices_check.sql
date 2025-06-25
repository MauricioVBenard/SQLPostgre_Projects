-- 4. Data Range and Consistency Checks
-- Purpose: Identify illogical or out-of-bounds values.

-- Check for non-positive retail prices in products
SELECT product_id, product_name, retail_price FROM products WHERE retail_price <= 0;
-- Expected Result: 0 rows returned.
-- Insight: All products have positive retail prices.

