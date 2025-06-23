CREATE TABLE customers (
customer_id SERIAL PRIMARY KEY,
first_name VARCHAR(50),
last_name VARCHAR(50),
email VARCHAR(50) UNIQUE,
address VARCHAR (255),
city VARCHAR (50),
state VARCHAR (50),
country VARCHAR (50),
zip_code VARCHAR (10),
registration_date DATE 
)