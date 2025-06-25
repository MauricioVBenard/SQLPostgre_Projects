--Top-Performing Products by Revenue
--Question: Which product_name appears most often in your top-selling lists by revenue?

SELECT
    p.product_name,
    b.brand_name,
    p.category,
    SUM(oi.quantity * oi.price_at_purchase) AS total_revenue
FROM
    order_items oi
JOIN
    products p ON oi.product_id = p.product_id
JOIN
    brands b ON p.brand_id = b.brand_id -- Corrected join condition here
GROUP BY
    p.product_name, b.brand_name, p.category
ORDER BY
    total_revenue DESC
LIMIT 10;