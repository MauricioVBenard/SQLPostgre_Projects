-- ANALYSIS_QUERIES.SQL

-- This file contains SQL queries to extract key business insights from the luxury retail e-commerce database.

-- 1. Overall Sales Performance: Monthly Revenue Trend
-- Question: How have sales performed over time (e.g., monthly)?
SELECT
    TO_CHAR(order_date, 'YYYY-MM') AS sales_month,
    SUM(total_amount) AS monthly_revenue,
    COUNT(order_id) AS total_orders
FROM
    orders
GROUP BY
    sales_month
ORDER BY
    sales_month;
-- Insight: This query shows the total revenue and number of orders for each month, allowing you to observe trends like growth, seasonality, or dips in sales.

-- 2. Top-Performing Products by Revenue
-- Question: Which are the top 10 best-selling products by total revenue?
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
    brands b ON p.brand_id = b.brand_id
GROUP BY
    p.product_name, b.brand_name, p.category
ORDER BY
    total_revenue DESC
LIMIT 10;
-- Insight: Identifies the most financially successful products, which can inform inventory management, marketing, and future purchasing decisions.

-- 3. Top-Performing Products by Quantity Sold
-- Question: Which are the top 10 best-selling products by quantity sold?
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
-- Insight: Shows products that are popular in terms of units moved, which might differ from revenue leaders (e.g., lower-priced items selling in high volume).

-- 4. Top-Performing Brands by Revenue
-- Question: Which are the top 5 brands contributing most to total revenue?
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
-- Insight: Highlights key brand partnerships and their financial contribution, useful for strategic planning and vendor relations.

-- 5. Most Valuable Customers (by Total Spending)
-- Question: Who are the top 10 customers by their total spending?
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
-- Insight: Identifies high-value customers for loyalty programs, personalized marketing, or special service.

-- 6. Customer Order Frequency
-- Question: Which customers have placed the most orders?
SELECT
    c.customer_id,
    c.first_name,
    c.last_name,
    c.email,
    COUNT(o.order_id) AS number_of_orders
FROM
    customers c
JOIN
    orders o ON c.customer_id = o.customer_id
GROUP BY
    c.customer_id, c.first_name, c.last_name, c.email
ORDER BY
    number_of_orders DESC
LIMIT 10;
-- Insight: Identifies frequent buyers, potentially different from high-value spenders, for engagement strategies.

-- 7. Product Stock Levels vs. Sales
-- Question: For top-selling products, how does current stock compare to historical sales?
-- This query shows the top 10 products by quantity sold and their current stock levels.
SELECT
    p.product_name,
    b.brand_name,
    p.current_stock,
    SUM(oi.quantity) AS total_quantity_sold_ever
FROM
    products p
JOIN
    brands b ON p.brand_id = b.brand_id
LEFT JOIN
    order_items oi ON p.product_id = oi.product_id
GROUP BY
    p.product_id, p.product_name, b.brand_name, p.current_stock
ORDER BY
    total_quantity_sold_ever DESC NULLS LAST -- NULLS LAST puts products never sold at the end
LIMIT 10;
-- Insight: Helps identify potential stockout risks for popular items (low stock, high sales history) or overstocked items (high stock, low sales history).

-- 8. Average Order Value (AOV)
-- Question: What is the average value of an order?
SELECT
    AVG(total_amount) AS average_order_value
FROM
    orders;
-- Insight: A key performance indicator (KPI) that helps understand customer spending habits per transaction.

-- 9. Sales by Product Category
-- Question: Which product categories generate the most revenue?
SELECT
    p.category,
    SUM(oi.quantity * oi.price_at_purchase) AS total_category_revenue
FROM
    order_items oi
JOIN
    products p ON oi.product_id = p.product_id
GROUP BY
    p.category
ORDER BY
    total_category_revenue DESC;
-- Insight: Identifies the most profitable categories, guiding merchandising and marketing efforts.

-- 10. Orders by Status
-- Question: What is the distribution of order statuses?
SELECT
    order_status,
    COUNT(order_id) AS count_of_orders
FROM
    orders
GROUP BY
    order_status
ORDER BY
    count_of_orders DESC;
-- Insight: Provides an overview of operational efficiency and potential bottlenecks (e.g., too many 'Pending' or 'Cancelled' orders).