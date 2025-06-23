-- Insert data into the products table
INSERT INTO products (
    product_name, brand_id, product_type, category, material, color, size, retail_price, current_stock, sku, description, release_date
) VALUES
-- Prada Products (assuming brand_id = 1)
('Re-Nylon Shoulder Bag', 1, 'Bag', 'Shoulder Bag', 'Re-Nylon', 'Black', 'Medium', 1950.00, 15, 'PRD-BAG-001', 'Signature Prada Re-Nylon bag.', '2022-03-10'),
('Monolith Brushed Leather Boots', 1, 'Shoe', 'Boots', 'Leather', 'Black', 'EU 38', 1600.00, 8, 'PRD-SHOE-001', 'Chunky platform combat boots.', '2021-09-01'),
('Galleria Saffiano Leather Bag', 1, 'Bag', 'Tote Bag', 'Saffiano Leather', 'Red', 'Large', 3500.00, 5, 'PRD-BAG-002', 'Classic and elegant saffiano leather tote.', '2020-01-20'),

-- Chanel Products (assuming brand_id = 2)
('Classic Flap Bag', 2, 'Bag', 'Shoulder Bag', 'Lambskin', 'Black', 'Medium', 10200.00, 3, 'CHN-BAG-001', 'Iconic quilted classic flap bag.', '1980-01-01'),
('Two-Tone Slingback Heels', 2, 'Shoe', 'Heels', 'Goatskin', 'Beige/Black', 'EU 37', 1050.00, 12, 'CHN-SHOE-001', 'Timeless slingback heels with signature cap toe.', '1957-01-01'),
('2.55 Handbag', 2, 'Bag', 'Shoulder Bag', 'Aged Calfskin', 'Navy Blue', 'Small', 9000.00, 2, 'CHN-BAG-002', 'Original iconic 2.55 reissued handbag.', '1955-02-01'),

-- Hermes Products (assuming brand_id = 3)
('Birkin Bag 30', 3, 'Bag', 'Handbag', 'Togo Leather', 'Etoupe', '30 CM', 20000.00, 1, 'HER-BAG-001', 'Exquisite and highly coveted Birkin bag.', '1984-01-01'),
('Oran Sandal', 3, 'Shoe', 'Sandal', 'Calfskin', 'Gold', 'EU 39', 700.00, 20, 'HER-SHOE-001', 'Iconic H-cut flat sandal.', '1997-01-01'),

-- Louis Vuitton Products (assuming brand_id = 4)
('Speedy 25', 4, 'Bag', 'Handbag', 'Monogram Canvas', 'Brown', '25 CM', 1490.00, 18, 'LV-BAG-001', 'Classic Speedy bag in monogram canvas.', '1930-01-01'),
('Archlight Sneaker', 4, 'Shoe', 'Sneakers', 'Calf Leather', 'White', 'US 8', 1180.00, 10, 'LV-SHOE-001', 'Futuristic Archlight sneaker.', '2018-01-01'),

-- Fendi Products (assuming brand_id = 5)
('Baguette Bag', 5, 'Bag', 'Shoulder Bag', 'Nappa Leather', 'Tobacco', 'Standard', 3100.00, 7, 'FND-BAG-001', 'Iconic Baguette bag with FF clasp.', '1997-01-01'),
('Fendi Match Sneakers', 5, 'Shoe', 'Sneakers', 'Suede', 'Beige', 'EU 40', 890.00, 6, 'FND-SHOE-001', 'Retro-style Fendi Match sneakers.', '2022-01-01'),

-- Saint Laurent Products (assuming brand_id = 6)
('Lou Camera Bag', 6, 'Bag', 'Crossbody Bag', 'Quilted Leather', 'Black', 'Small', 1550.00, 14, 'YSL-BAG-001', 'Compact quilted camera bag.', '2019-01-01'),
('Tribute Platform Sandals', 6, 'Shoe', 'Heels', 'Patent Leather', 'Nude', 'EU 38', 995.00, 9, 'YSL-SHOE-001', 'High platform Tribute sandals.', '2008-01-01'),

-- Balenciaga Products (assuming brand_id = 7)
('Hourglass Top Handle Bag', 7, 'Bag', 'Handbag', 'Calfskin', 'Black', 'Small', 2500.00, 4, 'BLN-BAG-001', 'Distinctive hourglass shape bag.', '2019-01-01'),
('Speed Trainer Sneaker', 7, 'Shoe', 'Sneakers', 'Knit', 'Black', 'US 9', 895.00, 11, 'BLN-SHOE-001', 'Sock-like knit sneaker.', '2016-01-01'),

-- Dior Products (assuming brand_id = 8)
('Lady Dior Bag', 8, 'Bag', 'Handbag', 'Cannage Lambskin', 'Beige', 'Medium', 6000.00, 3, 'DR-BAG-001', 'Signature Lady Dior bag with Cannage stitching.', '1995-01-01'),
('JAdior Slingback Pump', 8, 'Shoe', 'Heels', 'Embroidered Cotton', 'Black', 'EU 37.5', 990.00, 7, 'DR-SHOE-001', 'Embroidered JAdior slingback pump.', '2017-01-01'),

-- Gucci Products (assuming brand_id = 9)
('Marmont Matelasse Shoulder Bag', 9, 'Bag', 'Shoulder Bag', 'Leather', 'Black', 'Small', 2100.00, 10, 'GUC-BAG-001', 'GG Marmont quilted shoulder bag.', '2016-01-01'),
('Princetown Loafer', 9, 'Shoe', 'Loafers', 'Leather', 'Black', 'EU 39', 850.00, 13, 'GUC-SHOE-001', 'Iconic Princetown leather slipper.', '2015-01-01'),

-- Valentino Products (assuming brand_id = 10)
('Rockstud Spike Bag', 10, 'Bag', 'Shoulder Bag', 'Lambskin', 'Red', 'Small', 2800.00, 6, 'VAL-BAG-001', 'Quilted bag with signature Rockstuds.', '2017-01-01'),
('Rockstud Pump', 10, 'Shoe', 'Heels', 'Calfskin', 'Poudre', 'EU 36', 1070.00, 15, 'VAL-SHOE-001', 'Signature Rockstud T-strap pump.', '2010-01-01');