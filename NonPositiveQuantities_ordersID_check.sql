-- 4. Data Range and Consistency Checks
-- Purpose: Identify illogical or out-of-bounds values.
-- Check for non-positive quantities in order_items
SELECT order_item_id, quantity FROM order_items WHERE quantity <= 0;
-- Expected Result: 0 rows returned.
-- Insight: All order items have positive quantities.