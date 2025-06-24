

# Luxury Retail E-commerce Data Analysis

This project demonstrates an end-to-end data analysis workflow, from database setup and data validation to extracting key business insights using SQL, and preparing for advanced visualization. The goal is to analyze sales, customer, and product data for a luxury retail e-commerce business to identify performance trends, valuable customer segments, and top-selling items.

## Table of Contents
- [Problem Statement & Business Questions](#problem-statement--business-questions)
- [Technologies Used](#technologies-used)
- [Database Schema](#database-schema)
- [Data Generation & Population](#data-generation--population)
- [Data Validation & Quality Checks](#data-validation--quality-checks)
- [Exploratory Data Analysis & Key Business Insights](#exploratory-data-analysis--key-business-insights)
- [Data Visualization (Future)](#data-visualization-future)
- [Conclusion & Recommendations (Future)](#conclusion--recommendations-future)
- [Future Enhancements](#future-enhancements)
- [Setup & Usage](#setup--usage)
- [Contact](#contact)

## Problem Statement & Business Questions

In the competitive luxury retail sector, understanding sales performance, customer behavior, and product popularity is vital for strategic decision-making. This project aims to address key business questions such as:

- What are the overall sales trends over time (e.g., monthly, quarterly)?
- Which are the top-performing brands and products by revenue and quantity sold?
- Who are the most valuable customers (e.g., by total spending or order frequency)?
- How does inventory stock relate to sales, and are there any potential stockout risks for popular items?
- Are there any seasonal patterns in sales?

## Technologies Used

- **Database:** PostgreSQL (Relational Database Management System)
- **Database Management Tool:** pgAdmin 4
- **Query Language:** SQL (PostgreSQL dialect)
- **Version Control:** Git & GitHub
- **Data Manipulation (Future):** Python (Pandas, NumPy)
- **Data Visualization (Future):** Microsoft Power BI

## Database Schema

The database consists of five interconnected tables designed to store information about brands, products, customers, orders, and order items.

- **`brands`**: Stores unique brand information (`brand_id` PK, `brand_name`).
- **`products`**: Contains details about each product (`product_id` PK, `product_name`, `brand_id` FK, `category`, `retail_price`, `current_stock`).
- **`customers`**: Holds customer demographic information (`customer_id` PK, `first_name`, `last_name`, `email`, `phone_number`, `address`, `city`, `state`, `zip_code`, `country`, `registration_date`).
- **`orders`**: Records details of each customer order (`order_id` PK, `customer_id` FK, `order_date`, `total_amount`, `order_status`).
- **`order_items`**: Details individual items within each order (`order_item_id` PK, `order_id` FK, `product_id` FK, `quantity`, `price_at_purchase`).

See [`schema.sql`](schema.sql) for the full database schema definitions.

## Data Generation & Population

The database was populated with a synthetic dataset designed to simulate realistic luxury retail transactions. This dataset includes:
- 10 unique brands
- 50 diverse products (mix of bags and shoes)
- 50 unique customer profiles
- Approximately 30 customer orders with around 60-70 individual order items.

The `total_amount` for each order was dynamically calculated based on the sum of `price_at_purchase * quantity` from the `order_items` table, ensuring data consistency.

See [`data_population.sql`](data_population.sql) for the SQL scripts used to insert this data.

## Data Validation & Quality Checks

Before proceeding with any analysis, a rigorous data validation process was conducted to ensure the integrity, consistency, and completeness of the dataset. This step is critical to guarantee the reliability of any insights derived.

### Checks Performed:

**1. Row Counts Verification:**
- **Purpose:** Confirmed that the expected number of records were successfully loaded into each table.
- **Query:**
  ```sql
  -- PASTE YOUR ACTUAL QUERY FOR ROW COUNTS HERE
  SELECT 'brands' AS table_name, COUNT(*) FROM brands
  UNION ALL
  SELECT 'products', COUNT(*) FROM products
  UNION ALL
  SELECT 'customers', COUNT(*) FROM customers
  UNION ALL
  SELECT 'orders', COUNT(*) FROM orders
  UNION ALL
  SELECT 'order_items', COUNT(*) FROM order_items;
Result:
-- PASTE YOUR ACTUAL QUERY OUTPUT HERE
table_name | count
------------+-------
brands       |    10
products     |    51
customers    |    50
orders       |    30
order_items  |    57
Insight: "The counts align with the expected data volumes, confirming a complete initial data load and no missing records during ingestion."
2. Primary Key Uniqueness:

Purpose: Verified that all primary key columns contain unique, non-null values, which is essential for data integrity and accurate record identification.
Example Query (for products table):
SQL

-- PASTE YOUR ACTUAL QUERY FOR PRODUCTS PK UNIQUENESS HERE
SELECT product_id, COUNT(*)
FROM products
GROUP BY product_id
HAVING COUNT(*) > 1;

-- Repeat for other PKs like customer_id, order_id, brand_id, order_item_id
Result: "0 rows returned" (for all PK checks)
Insight: "No duplicate primary keys were found across any of the tables, ensuring each record is uniquely identifiable and ready for relational operations."
3. Foreign Key Integrity (Orphan Record Check):

Purpose: To verify that all foreign key references point to existing records in their respective parent tables, preventing orphaned data (records referencing non-existent parent records).
Example Query (for orders referencing customers):
SQL

-- PASTE YOUR ACTUAL QUERY FOR ORDERS referencing CUSTOMERS HERE
SELECT o.order_id, o.customer_id
FROM orders o
LEFT JOIN customers c ON o.customer_id = c.customer_id
WHERE c.customer_id IS NULL;

-- Repeat for order_items referencing products, and order_items referencing orders
Result: "0 rows returned" (for all FK checks)
Insight: "All foreign key relationships were validated, confirming referential integrity throughout the database and no orphaned records were identified."
4. Data Range and Consistency Checks:

Purpose: To identify any illogical or out-of-bounds values in numerical columns (e.g., negative prices, impossible dates) or inconsistent string formats.
Example Query (for products prices/stock):
SQL

-- PASTE YOUR ACTUAL QUERY for products prices/stock HERE
SELECT product_name, retail_price, current_stock
FROM products
WHERE retail_price <= 0 OR current_stock < 0;

-- Example for order_items quantity:
SELECT order_item_id, quantity FROM order_items WHERE quantity <= 0;

-- Example for order_date consistency (e.g., in the future):
SELECT order_id, order_date FROM orders WHERE order_date > CURRENT_DATE;
Result: "0 rows returned" (for all range/consistency checks)
Insight: "Numerical data (prices, stock, quantities) falls within logical positive ranges, and dates are consistent, suggesting high quality and reliable transaction records."
See data_validation_queries.sql for all detailed validation queries.

Exploratory Data Analysis & Key Business Insights
With the data validated and confirmed for quality, SQL queries were used to extract meaningful insights addressing the initial business questions.

Overall Sales Performance
Question: How have sales performed over time (e.g., monthly, quarterly)?
Query:
SQL

-- PASTE YOUR ACTUAL SQL QUERY FOR SALES TRENDS HERE (e.g., monthly revenue)
-- SELECT TO_CHAR(order_date, 'YYYY-MM') AS sales_month,
--        SUM(total_amount) AS monthly_revenue
-- FROM orders
-- GROUP BY sales_month
-- ORDER BY sales_month;
Insight: "Analysis revealed [your specific insight, e.g., a steady increase in sales revenue month-over-month in the observed period, indicating positive business growth, or peak sales months]."
Top-Performing Products and Brands
Question: Which are the top-performing brands and products by revenue and quantity sold?

Query (Top Products by Quantity):

SQL

-- PASTE YOUR ACTUAL SQL QUERY FOR TOP PRODUCTS BY QUANTITY HERE
-- SELECT p.product_name, b.brand_name, SUM(oi.quantity) AS total_quantity_sold
-- FROM order_items oi
-- JOIN products p ON oi.product_id = p.product_id
-- JOIN brands b ON p.brand_id = b.brand_id
-- GROUP BY p.product_name, b.brand_name
-- ORDER BY total_quantity_sold DESC
-- LIMIT 5;
Insight: "The top 5 products by quantity sold were [list them], primarily from [list brands], highlighting key inventory focus areas."

Query (Top Brands by Revenue):

SQL

-- PASTE YOUR ACTUAL SQL QUERY FOR TOP BRANDS BY REVENUE HERE
Insight: "Top-performing brands by revenue include [list them], indicating strong market demand for these luxury lines."

Customer Value Analysis
Question: Who are the most valuable customers (e.g., by total spending or order frequency)?
Query (Top Customers by Total Spending):
SQL

-- PASTE YOUR ACTUAL SQL QUERY FOR TOP CUSTOMERS BY SPENDING HERE
Insight: "Customers like [customer names/IDs] stand out as high-value, suggesting opportunities for targeted loyalty programs or personalized marketing."
Inventory Analysis
Question: How does inventory stock relate to sales, and are there any potential stockout risks for popular items?
Query (Stock vs. Sales of Top Products):
SQL

-- PASTE YOUR ACTUAL SQL QUERY FOR INVENTORY ANALYSIS HERE
Insight: "While top products are selling well, some show low current stock levels relative to sales velocity, indicating potential stockout risks if not addressed."
(You will continue to fill this section as you perform more in-depth analysis based on your business questions.)

See analysis_queries.sql for all detailed analytical SQL queries.

Data Visualization (Future)
Key insights derived from the SQL analysis will be visualized using Microsoft Power BI to provide an interactive and accessible dashboard for stakeholders.

(Once complete, embed screenshots of your Power BI dashboard here and include a direct link to the published dashboard if available.)

Conclusion & Recommendations (Future)
This analysis provides a foundational understanding of the luxury retail business's performance. Key takeaways include:

[Summarize 2-3 main findings from your EDA & Insights.]
[e.g., Consistent sales growth but potential for optimizing top-tier inventory.]
Based on these insights, the following recommendations are proposed:

[Recommendation 1: e.g., Develop targeted marketing campaigns for high-value customers identified.]
[Recommendation 2: e.g., Implement dynamic inventory alerts for fast-moving luxury items to prevent stockouts.]
[Recommendation 3: e.g., Analyze seasonal sales peaks to optimize staffing and marketing spend.]
Future Enhancements
Incorporate external data sources (e.g., marketing spend, website traffic, customer demographics) for richer analysis.
Implement a customer segmentation model (e.g., RFM analysis using Python) for more targeted marketing strategies.
Develop predictive models for sales forecasting or inventory management.
Explore product recommendation algorithms based on customer purchase history.
Integrate A/B testing insights if experimental data becomes available (e.g., for new website features).
Setup & Usage
To replicate this project locally:

Prerequisites: Ensure you have PostgreSQL (v14+) and pgAdmin 4 installed. Git must also be installed on your system.
Clone the repository:
Bash

git clone [https://github.com/YourUsername/luxury_retail_db_analysis.git]((https://www.linkedin.com/in/mauricio-v-benard-566627b2/))
cd luxury_retail_db_analysis
Database Setup:
Open pgAdmin 4 and connect to your PostgreSQL server.
Create a new database (e.g., luxury_retail_db).
Connect to this new database.
Run the schema.sql script to create all tables (this script includes DROP TABLE IF EXISTS statements for easy re-creation).
Populate Data:
Run the data_population.sql script to insert sample data into the tables (this script includes TRUNCATE TABLE statements for clean re-population).
Run Analysis:
Execute queries from data_validation_queries.sql and analysis_queries.sql in pgAdmin's Query Tool to perform quality checks and generate business insights.
(Later: Open the Power BI file (.pbix) to explore the interactive dashboard.)
Contact
Feel free to connect with me on LinkedIn for any questions, collaborations, or discussions about data analysis!
