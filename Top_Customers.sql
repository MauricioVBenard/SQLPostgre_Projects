--Most Valuable Customers (by Total Spending)
--Question: Who are your top_10_customers by spending?
SELECT
    c.customer_id,
    c.first_name,
    c.last_name,
    c.email,
    SUM(o.total_amount) AS total_spending
FROM
    customers c
JOIN
    orders o ON c.customer_id = o.customer_id
GROUP BY
    c.customer_id, c.first_name, c.last_name, c.email
ORDER BY
    total_spending DESC
LIMIT 10;
