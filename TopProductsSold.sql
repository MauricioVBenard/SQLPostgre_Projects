-- Top-Performing Products by Quantity Sold
--Question: Which product_name appears most often in your top-selling lists by quantity?

SELECT
    p.product_name,
    b.brand_name,
    p.category,
    SUM(oi.quantity) AS total_quantity_sold
FROM
    order_items oi
JOIN
    products p ON oi.product_id = p.product_id 
JOIN
    brands b ON p.brand_id = b.brand_id
GROUP BY
    p.product_name, b.brand_name, p.category
ORDER BY
    total_quantity_sold DESC
LIMIT 10;