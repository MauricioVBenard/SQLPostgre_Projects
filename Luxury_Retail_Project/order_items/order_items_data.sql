-- Insert ~60-70 Order Items
INSERT INTO order_items (
    order_id, product_id, quantity, price_at_purchase
) VALUES
-- Order 1 (customer_id 1)
(1, 1, 1, 25500.00), -- Birkin 25
(1, 49, 1, 1000.00), -- Random shoe to add to a high-end order
-- Order 2 (customer_id 3)
(2, 6, 1, 10500.00), -- Classic Flap Bag
(2, 10, 1, 1100.00), -- Two-Tone Slingback Heels
-- Order 3 (customer_id 5)
(3, 16, 1, 3500.00), -- Dior Book Tote Small
-- Order 4 (customer_id 7)
(4, 2, 1, 19000.00), -- Kelly Bag 28
(4, 15, 1, 2800.00), -- Pochette Metis Monogram
(4, 47, 1, 2700.00), -- Locò Small Shoulder Bag
-- Order 5 (customer_id 10)
(5, 21, 1, 2600.00), -- GG Marmont Matelasse Shoulder Bag
(5, 41, 2, 950.00), -- Speed Trainer Sneaker
-- Order 6 (customer_id 12)
(6, 31, 1, 995.00), -- Re-Edition 2000 Nylon Mini Bag
-- Order 7 (customer_id 15)
(7, 12, 1, 6700.00), -- Capucines MM
(7, 13, 1, 2800.00), -- Pochette Metis
(7, 24, 1, 880.00), -- Princetown Loafer
-- Order 8 (customer_id 18)
(8, 36, 1, 2800.00), -- Sac de Jour Nano
-- Order 9 (customer_id 20)
(9, 7, 1, 6700.00), -- Chanel 19 Bag
(9, 27, 1, 4000.00), -- Galleria Saffiano Leather Bag
-- Order 10 (customer_id 22)
(10, 42, 1, 950.00), -- Colibrì Slingback Pump
(10, 39, 1, 2300.00), -- Le Cagole XS Shoulder Bag
-- Order 11 (customer_id 25)
(11, 4, 1, 3200.00), -- Evelyne TPM III
(11, 8, 1, 6200.00), -- Boy Chanel Flap Bag
(11, 17, 1, 2100.00), -- Neverfull MM
(11, 37, 1, 2450.00), -- Sunset Monogram Bag
(11, 44, 1, 3300.00), -- Rockstud Spike Chain Bag
-- Order 12 (customer_id 28)
(12, 14, 1, 2030.00), -- Neverfull MM (original price, if different from later inserts)
(12, 22, 1, 3200.00), -- Gucci Horsebit 1955
-- Order 13 (customer_id 30)
(13, 18, 1, 3500.00), -- Onthego PM
(13, 20, 1, 1050.00), -- JAdior Slingback Pump
-- Order 14 (customer_id 33)
(14, 32, 1, 1200.00), -- Monolith Brushed Leather Loafers
-- Order 15 (customer_id 35)
(15, 3, 1, 9800.00), -- Constance Bag 18
(15, 9, 1, 10000.00), -- Chanel 2.55 Reissue
-- Order 16 (customer_id 38)
(16, 28, 1, 3000.00), -- Prada Cleo Brushed Leather Shoulder Bag
-- Order 17 (customer_id 40)
(17, 1, 1, 25500.00), -- Birkin 25 (another one!)
-- Order 18 (customer_id 42)
(18, 50, 1, 990.00), -- Roman Stud Mules
(18, 40, 1, 2900.00), -- Downtown Small Shoulder Bag
-- Order 19 (customer_id 45)
(19, 30, 1, 995.00), -- Re-Edition 2000 Nylon Mini Bag
-- Order 20 (customer_id 48)
(20, 5, 1, 720.00), -- Oran Sandal
(20, 48, 1, 2650.00), -- Locò Small Shoulder Bag VLogo
-- Order 21 (customer_id 2)
(21, 11, 1, 950.00), -- Ballet Flats
(21, 45, 1, 2500.00), -- VSling Shoulder Bag
-- Order 22 (customer_id 4)
(22, 19, 1, 1250.00), -- Archlight Sneaker
(22, 23, 1, 950.00), -- Dionysus Super Mini Bag
-- Order 23 (customer_id 6)
(23, 1, 1, 25500.00), -- Birkin Bag 25 (yes, popular item!)
(23, 12, 1, 6700.00), -- Capucines MM
-- Order 24 (customer_id 8)
(24, 25, 1, 750.00), -- Ace Embroidered Sneaker
(24, 38, 1, 1600.00), -- Lou Camera Bag
-- Order 25 (customer_id 11)
(25, 29, 1, 4000.00), -- Galleria Saffiano Leather Bag
(25, 34, 1, 3100.00), -- Baguette Bag Nappa Leather
-- Order 26 (customer_id 14)
(26, 46, 1, 1100.00), -- Rockstud Pump Calfskin
(26, 26, 1, 6000.00), -- Peekaboo ISeeU Small
-- Order 27 (customer_id 17)
(27, 2, 1, 19000.00), -- Kelly Bag 28
-- Order 28 (customer_id 19)
(28, 43, 1, 1050.00), -- Tribute Platform Sandals
(28, 33, 1, 990.00), -- Cloudbust Thunder Sneakers
-- Order 29 (customer_id 21)
(29, 6, 1, 10500.00), -- Classic Flap Bag Medium Lambskin
(29, 7, 1, 6700.00), -- Chanel 19 Bag Small
-- Order 30 (customer_id 24)
(30, 49, 2, 1000.00), -- Random shoe again
(30, 10, 1, 1100.00); -- Two-Tone Slingback Heels