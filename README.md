# Luxury Retail E-commerce Database Analysis

## Project Overview

This project involves the design, implementation, population, and analysis of a relational database for a luxury retail e-commerce platform. The goal is to simulate a realistic e-commerce environment and extract valuable business insights from transactional data.

The project demonstrates proficiency in SQL for database management, data validation, and data analysis using PostgreSQL.

## Database Schema Design (`schema.sql`)

The database is designed with a star-like schema to represent key entities and their relationships in a luxury retail context. The following tables are included:

* **`brands`**: Stores information about the luxury brands.
    * `brand_id` (PK)
    * `brand_name`
    * `country_of_origin`
* **`products`**: Contains details about individual luxury products.
    * `product_id` (PK)
    * `product_name`
    * `description`
    * `category`
    * `retail_price`
    * `current_stock`
    * `brand_id` (FK to `brands`)
* **`customers`**: Holds customer demographic and contact information.
    * `customer_id` (PK)
    * `first_name`
    * `last_name`
    * `email`
    * `phone_number`
    * `address`
    * `city`
    * `country`
* **`orders`**: Records overall order information.
    * `order_id` (PK)
    * `customer_id` (FK to `customers`)
    * `order_date`
    * `total_amount`
    * `order_status`
* **`order_items`**: Details the individual products within each order.
    * `order_item_id` (PK)
    * `order_id` (FK to `orders`)
    * `product_id` (FK to `products`)
    * `quantity`
    * `price_at_purchase`

## Data Population (`data_population.sql`)

The database is populated with synthetic, yet realistic, data to simulate transactions and entities within a luxury retail environment. This includes:

* 10 unique luxury brands.
* 51 distinct products across various categories and brands.
* 50 fictional customer profiles.
* 30 unique orders placed by customers.
* 57 individual order items detailing the products purchased in each order.

## Data Validation (`data_validation_queries.sql`)

Prior to analysis, a series of data validation checks were performed to ensure the integrity, consistency, and quality of the loaded dataset. These checks confirmed:

* **Accurate Row Counts:** All tables were populated with the expected number of records, ensuring complete data loading.
    * `brands`: 10 rows
    * `products`: 51 rows
    * `customers`: 50 rows
    * `orders`: 30 rows
    * `order_items`: 57 rows
      
* **Primary Key Uniqueness:** All primary key columns across all tables contained unique values, ensuring each record is uniquely identifiable. (Expected: 0 rows returned for duplicates)
* **Foreign Key Integrity:** All foreign key references correctly linked to existing records in their respective parent tables, preventing orphaned data. (Expected: 0 rows returned for orphans)
* **Data Range and Consistency:**
    * Product retail prices were positive.
    * Product stock levels were non-negative.
    * Order item quantities were positive.
    * Order total amounts were non-negative and logically consistent.
    * Order dates were valid and not in the future.
    *(Expected: 0 rows returned for invalid data, except potentially 0-total orders).*

These validations ensure that the data is reliable for accurate business analysis.

## Key Business Insights (`analysis_queries.sql`)

The following insights were extracted from the database using SQL queries, addressing common business questions for a luxury retail e-commerce platform:

### 1. Overall Sales Performance: Monthly Revenue Trend
* **Insight:**
* "month",  "revenue", "orders" 
* "2023-03"	17690.00	4
"2023-04"	9250.00	3
"2023-05"	7090.00	3
"2023-06"	6360.00	3
"2023-07"	22500.00	2
"2023-08"	6900.00	2
"2023-09"	3890.00	2
"2023-10"	4000.00	2
"2023-11"	7000.00	2
"2023-12"	5400.00	2
"2024-01"	4750.00	2
"2024-02"	5350.00	3

### 2. Top-Performing Products by Revenue
* **Insight:** [List the top 2-3 products and their brands. E.g., "The 'Gucci GG Marmont Matelasse Shoulder Bag' and 'Louis Vuitton Speedy Bandouliere 25' were the leading products by revenue, indicating strong demand for iconic handbag items."]

 ### 3. Top-Performing Products by Quantity Sold
* **Insight:** [Compare this to revenue. E.g., "While handbags led in revenue, smaller, more accessible items like 'Chanel N°5 Eau de Parfum' were top sellers by sheer quantity, highlighting diverse customer purchasing habits."]

### 4. Top-Performing Brands by Revenue
* **Insight:** [Identify the top brands. E.g., "Gucci, Louis Vuitton, and Chanel emerged as the top three revenue-generating brands, solidifying their dominant position in the luxury market."]

### 5. Most Valuable Customers (by Total Spending)
* **Insight:** [Describe your top customers. E.g., "Customer Jane Doe (jane.doe@example.com) was identified as the highest spender, with a total spending of $X,XXX, making her a prime candidate for VIP loyalty programs."]

### 6. Customer Order Frequency
* **Insight:** [Discuss frequent buyers. E.g., "Customer John Smith placed the most orders (X orders), suggesting high brand loyalty and potential for repeat engagement strategies."]

### 7. Product Stock Levels vs. Sales
* **Insight:** [Identify potential issues. E.g., "Several top-selling products, such as 'Hermès Birkin Bag,' show very low current stock, indicating potential stockout risks and missed sales opportunities."]

### 8. Average Order Value (AOV)
* **Insight:** [State the AOV. E.g., "The average order value was calculated to be $X,XXX, providing a benchmark for customer spending per transaction."]

### 9. Sales by Product Category
* **Insight:** [Which categories are performing best? E.g., "The 'Handbags' and 'Watches' categories collectively generated the highest revenue, aligning with expectations for high-value luxury goods."]

### 10. Orders by Status

* **Insight:** The majority of orders are successfully delivered (19 orders), with a smaller portion in 'Shipped' (6 orders) and 'Pending' (5 orders) status. This indicates a relatively efficient fulfillment process with most orders reaching completion.

## Technologies Used

* **PostgreSQL**: Relational Database Management System.
* **pgAdmin 4**: PostgreSQL administration and development platform.
* **Visual Studio Code (VS Code)**: Code editor for SQL scripts and documentation.
* **Git**: Version control system.
* **GitHub**: Cloud-based hosting for Git repositories.

## Setup and Installation

To replicate this project locally:

1.  **Install PostgreSQL and pgAdmin 4.**
2.  **Clone this repository:**
    ```bash
    git clone [https://github.com/MauricioVBenard/SQLPostgre_Projects.git](https://github.com/MauricioVBenard/SQLPostgre_Projects.git)
    cd SQLPostgre_Projects
    ```
3.  **Create a new database** in pgAdmin (e.g., `luxury_retail_db`).
4.  **Execute `schema.sql`**: Run the SQL script located at the root of the cloned repository to create the table structure.
5.  **Execute `data_population.sql`**: Run this script to populate the tables with sample data.
6.  **Execute `data_validation_queries.sql`**: Run this script to verify data integrity and consistency. Review the outputs for any anomalies.
7.  **Execute `analysis_queries.sql`**: Run these queries to generate the business insights.

---
