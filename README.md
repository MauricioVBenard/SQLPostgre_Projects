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

* **Insight:** The monthly revenue trend shows fluctuations over the period. While some months like March 2023 ($17,690.00) and July 2023 ($22,500.00) saw higher revenues and orders, other months had lower figures. The data spans from March 2023 to February 2024, providing a year-long overview of sales performance.

### 2. Top-Performing Products by Revenue
* **Insight:** This analysis clearly identifies the primary revenue drivers within our product catalog. The top five products by total revenue demonstrate significant financial contribution, highlighting which items are central to our profitability.

Hermès leads the pack with a substantial revenue of $23,160.00, underscoring its position as a premium revenue generator.

Celine follows closely, contributing $17,340.00, signifying its strong market appeal.

Dior (with $11,800.00) and Fendi (with $9,800.00) represent other significant high-value contributors.

Chanel rounds out the top five with $8,000.00.

This data is crucial for strategic decisions related to inventory prioritization, marketing focus, and understanding the financial impact of our most valuable product offerings. It suggests that focusing on maintaining strong stock levels and marketing efforts for these high-revenue products will directly support profitability goals.

 ### 3. Top-Performing Products by Quantity Sold
* **Insight:** Top-Performing Products by Quantity Sold
Insight: When analyzing product performance by sheer quantity of units sold, a distinct pattern emerges compared to revenue leaders.

The "Belt Bag" from Celine stands out significantly, having sold 2 units, making it the most frequently purchased item in this specific dataset.

Following the Celine Belt Bag, a range of other high-end bags, including the "Book Tote" (Dior), "Classic Flap Bag" (Chanel), "La Medusa Top Handle Bag" (Versace), "Onthego GM" (Louis Vuitton), "Olympia Bag" (Burberry), "Sunshine Shopper" (Fendi), "Birkin 30" (Hermès), and "Ava Bag" (Celine), each sold 1 unit.

This insight is crucial for inventory management and understanding direct customer demand. While these products might not always be the highest revenue drivers individually, their consistent sales volume highlights their popularity and the need to ensure adequate stock levels to meet demand. The dominance of "Bags" as a category across both quantity and revenue suggests it's a core segment for the luxury retail business.


### 4. Top-Performing Brands by Revenue
* **Insight:**
* This analysis highlights the brands that are the primary financial contributors to our business. The results indicate a direct correlation between the top-performing individual products and the overall revenue generated by their respective brands in this dataset.

Hermès leads significantly with $23,160.00 in total brand revenue.

Celine follows, generating $17,340.00.

Dior contributes $11,800.00, while Fendi adds $9,800.00.

Chanel rounds out the top performers with $8,000.00.
This strong alignment suggests that the success of key individual products is a direct driver of brand-level financial performance. This insight is crucial for strategic brand partnerships, focused marketing campaigns, and understanding which brand relationships are most financially impactful.

### 5. Most Valuable Customers (by Total Spending)
* **Insight:** Most Valuable Customers (by Total Spending)
Insight: Identifying our most valuable customers by their total spending reveals the high-contribution segments of our customer base. These individuals are key to our revenue stream and are prime candidates for personalized engagement and loyalty initiatives.

Charlie Brown (charlie.brown@example.com) stands out as the top-spending customer with a significant total of $18,500.00, marking him as a highly valuable patron.

Mia Anderson (mia.anderson@example.com) is also a substantial contributor with $12,000.00 in spending.

Other key high-value customers include Uma Allen and Diana Miller (each spending $4,900.00), Eve Davis ($4,200.00), and Alice Smith ($4,150.00).

This insight allows for targeted strategies such as VIP programs, exclusive offers, or personalized communication to nurture these relationships and encourage continued high-value purchases. Understanding who these customers are is fundamental for optimizing customer lifetime value.

### 6. Customer Order Frequency
* **Insight:** This analysis highlights customers who are frequent buyers, indicating their engagement and potential loyalty to the brand, regardless of their total spending.

Charlie Brown (charlie.brown@example.com) and Alice Smith (alice.smith@example.com) stand out as the most frequent customers, each having placed 2 orders.

The remaining customers in the top 10 (Jack Lopez, Grace Rodriguez, Olivia Jackson, Frank Garcia, Liam Wilson, Zack Green, Xavier Wright, and Ivy Hernandez) have each placed 1 order.

This insight suggests that while there are a few customers demonstrating repeat purchasing behavior, many customers in this dataset have only made a single purchase so far. This information is crucial for developing retention strategies and encouraging first-time buyers to become repeat customers, potentially through personalized follow-ups or loyalty incentives.



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
