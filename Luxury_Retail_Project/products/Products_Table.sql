CREATE TABLE products (
    product_id SERIAL PRIMARY KEY,
    product_name VARCHAR(255) NOT NULL,
    brand_id INT NOT NULL REFERENCES brands(brand_id),
    product_type VARCHAR(50) NOT NULL CHECK (product_type IN ('Bag', 'Shoe', 'Accessory', 'Apparel')), -- Added product_type
    category VARCHAR(100), -- Adjusted size for sub-categories
    material VARCHAR(100), -- Added material
    color VARCHAR(50),     -- Added color
    size VARCHAR(50),      -- Added size
    retail_price DECIMAL(10, 2) NOT NULL CHECK (retail_price > 0),
    current_stock INT NOT NULL DEFAULT 0 CHECK (current_stock >= 0),
    sku VARCHAR(50) UNIQUE, -- Added SKU
    description TEXT,      -- Added description
    release_date DATE      -- Added release_date
);