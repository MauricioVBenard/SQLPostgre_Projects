--Overall Sales Performance: Monthly Revenue Trend
--What's the Monthly revenue trend?

SELECT
TO_CHAR(order_date, 'YYYY-MM') AS sales_month,
SUM(total_amount) AS monthly_revenue,
COUNT(order_id) AS total_orders

FROM
orders

Group By
sales_month

Order By
sales_month

