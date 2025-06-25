--Top-Performing Brands by Revenue
--Question: Which brand_name appears most often in your top-selling lists by revenue?

SELECT
    b.brand_name,
    SUM(oi.quantity * oi.price_at_purchase) AS total_brand_revenue
FROM
    order_items oi
JOIN
    products p ON oi.product_id = p.product_id
JOIN
    brands b ON p.brand_id = b.brand_id
GROUP BY
    b.brand_name
ORDER BY
    total_brand_revenue DESC
LIMIT 5;