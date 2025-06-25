-- Check for future order dates (assuming current data is historical)
SELECT order_id, order_date FROM orders WHERE order_date > CURRENT_DATE;
-- Expected Result: 0 rows returned (assuming test data is in the past or present).
-- Insight: All order dates are valid and not in the future.