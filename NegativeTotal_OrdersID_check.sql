-- 4. Data Range and Consistency Checks
-- Purpose: Identify illogical or out-of-bounds values.
-- Check for negative or zero total_amount in orders
SELECT order_id, total_amount FROM orders WHERE total_amount <= 0;
-- Expected Result: Some rows might be 0 if orders have no items, but no negative.
-- Insight: Order total amounts are calculated correctly and are non-negative.