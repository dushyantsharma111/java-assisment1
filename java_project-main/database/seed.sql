USE shopsphere;

-- Categories for BEAST LIFE
INSERT INTO categories(name, description, status) VALUES
('Proteins & Mass Gainers', 'Ultra-pure whey isolate, whey blend and mass gainers for maximum muscle synthesis.', TRUE),
('Creatine & Pre-Workout', 'Micronized creatine monohydrate and explosive pre-workout formulas for unmatched strength and pump.', TRUE),
('Gym Equipment & Gear', 'Heavy-duty dumbbells, lever weightlifting belts, resistance bands, and leakproof shakers.', TRUE),
('Vitamins & Recovery', 'Triple-strength fish oil, daily athletic multivitamins, and recovery support.', TRUE)
ON DUPLICATE KEY UPDATE description=VALUES(description), status=TRUE;

-- Products for BEAST LIFE
-- 1. Whey Isolate
INSERT INTO products(category_id, name, brand, description, price, discount, stock, image_url, status)
SELECT category_id, 'Beast Life 100% Whey Isolate (2kg)', 'BEAST LIFE', 
'Ultra-pure cross-flow micro-filtered whey isolate delivering 27g protein, 5.9g BCAAs and 0g sugar per serving. Triple Chocolate fudge flavour. Rapid post-workout absorption.', 
4899.00, 15, 45, 'https://images.unsplash.com/photo-1579722821273-0f6c7d44362f?auto=format&fit=crop&w=900&q=85', TRUE
FROM categories WHERE name='Proteins & Mass Gainers' LIMIT 1;

-- 2. Whey Protein Blend
INSERT INTO products(category_id, name, brand, description, price, discount, stock, image_url, status)
SELECT category_id, 'Beast Life Gold Whey Protein (1kg)', 'BEAST LIFE', 
'Premium whey concentrate & isolate blend with digestive enzymes (DigeZyme) for clean digestion and 24g protein per scoop. Cafe Mocha delight.', 
2499.00, 10, 60, 'https://images.unsplash.com/photo-1593095948071-474c5cc2989d?auto=format&fit=crop&w=900&q=85', TRUE
FROM categories WHERE name='Proteins & Mass Gainers' LIMIT 1;

-- 3. Micronized Creatine Monohydrate
INSERT INTO products(category_id, name, brand, description, price, discount, stock, image_url, status)
SELECT category_id, 'Beast Life Micronized Creatine Monohydrate (250g)', 'BEAST LIFE', 
'100% pure 200-mesh micronized creatine monohydrate. Unflavored, rapid dissolution. Boosts ATP resynthesis, explosive strength and cellular muscle hydration.', 
1199.00, 20, 80, 'https://images.unsplash.com/photo-1584735935682-2f2b69dff9d2?auto=format&fit=crop&w=900&q=85', TRUE
FROM categories WHERE name='Creatine & Pre-Workout' LIMIT 1;

-- 4. Savage Pre-Workout Matrix
INSERT INTO products(category_id, name, brand, description, price, discount, stock, image_url, status)
SELECT category_id, 'Beast Life Savage Pre-Workout Matrix (400g)', 'BEAST LIFE', 
'High-intensity pre-workout with 350mg anhydrous caffeine, 6000mg L-Citrulline Malate for skin-splitting pumps, and 3200mg Beta-Alanine for endless endurance. Green Apple punch.', 
1899.00, 12, 35, 'https://images.unsplash.com/photo-1546483875-ad9014c88eba?auto=format&fit=crop&w=900&q=85', TRUE
FROM categories WHERE name='Creatine & Pre-Workout' LIMIT 1;

-- 5. Cast Iron Dumbbell Set 20KG
INSERT INTO products(category_id, name, brand, description, price, discount, stock, image_url, status)
SELECT category_id, 'Beast Life Cast Iron Adjustable Dumbbell Set (20kg Pair)', 'BEAST LIFE', 
'Heavy-duty cast iron plates with knurled non-slip chrome handles and spin-lock collars. Ideal for home gym bench presses, bicep curls and shoulder presses.', 
3499.00, 25, 20, 'https://images.unsplash.com/photo-1583454110551-21f2fa2afe61?auto=format&fit=crop&w=900&q=85', TRUE
FROM categories WHERE name='Gym Equipment & Gear' LIMIT 1;

-- 6. Pro Leather Lever Belt 10mm
INSERT INTO products(category_id, name, brand, description, price, discount, stock, image_url, status)
SELECT category_id, 'Beast Life Pro Leather Weightlifting Lever Belt (10mm)', 'BEAST LIFE', 
'Top-grain genuine cowhide leather belt with heavy-duty steel alloy lever buckle. Maximum intra-abdominal pressure support for heavy squats and deadlifts. IPF spec.', 
2199.00, 15, 18, 'https://images.unsplash.com/photo-1517838277536-f5f99be501cd?auto=format&fit=crop&w=900&q=85', TRUE
FROM categories WHERE name='Gym Equipment & Gear' LIMIT 1;

-- 7. Resistance Bands Set
INSERT INTO products(category_id, name, brand, description, price, discount, stock, image_url, status)
SELECT category_id, 'Beast Life Heavy Duty Resistance Loop Bands (5-Pack)', 'BEAST LIFE', 
'100% natural Malaysian latex bands ranging from 10 lbs to 125 lbs resistance. Perfect for assisted pull-ups, mobility, stretching, and powerlifting tension work.', 
899.00, 30, 50, 'https://images.unsplash.com/photo-1598289431512-b97b0917affc?auto=format&fit=crop&w=900&q=85', TRUE
FROM categories WHERE name='Gym Equipment & Gear' LIMIT 1;

-- 8. Stainless Steel Shaker Bottle
INSERT INTO products(category_id, name, brand, description, price, discount, stock, image_url, status)
SELECT category_id, 'Beast Life Matte Black Stainless Steel Shaker (750ml)', 'BEAST LIFE', 
'Double-wall vacuum insulated kitchen-grade stainless steel shaker. Keeps beverages ice-cold for 24 hours. Odor-resistant with built-in blending whisk and leak-proof seal.', 
699.00, 10, 95, 'https://images.unsplash.com/photo-1517963879433-6ad2b056d712?auto=format&fit=crop&w=900&q=85', TRUE
FROM categories WHERE name='Gym Equipment & Gear' LIMIT 1;

-- 9. Wrist Wraps & Lifting Straps Combo
INSERT INTO products(category_id, name, brand, description, price, discount, stock, image_url, status)
SELECT category_id, 'Beast Life Heavy Duty Wrist Wraps & Lifting Straps Combo', 'BEAST LIFE', 
'Reinforced 18-inch thumb-loop elastic wrist wraps paired with heavy cotton deadlift straps. Protects wrists and eliminates grip fatigue during heavy pull days.', 
549.00, 15, 70, 'https://images.unsplash.com/photo-1534438327276-14e5300c3a48?auto=format&fit=crop&w=900&q=85', TRUE
FROM categories WHERE name='Gym Equipment & Gear' LIMIT 1;

-- 10. Triple Strength Fish Oil
INSERT INTO products(category_id, name, brand, description, price, discount, stock, image_url, status)
SELECT category_id, 'Beast Life Triple Strength Fish Oil Omega-3 (1000mg, 60 Softgels)', 'BEAST LIFE', 
'Molecularly distilled fish oil with 550mg EPA and 350mg DHA per softgel. Enteric-coated to prevent fishy aftertaste. Supports joint mobility, heart health and muscle recovery.', 
799.00, 10, 85, 'https://images.unsplash.com/photo-1550572017-edd951aa8f72?auto=format&fit=crop&w=900&q=85', TRUE
FROM categories WHERE name='Vitamins & Recovery' LIMIT 1;

-- 11. Athletic Daily Multivitamin
INSERT INTO products(category_id, name, brand, description, price, discount, stock, image_url, status)
SELECT category_id, 'Beast Life High-Potency Athletic Multivitamin (60 Tablets)', 'BEAST LIFE', 
'Comprehensive formula with 24 vitamins and essential chelated minerals, plus ashwagandha and zinc for natural testosterone and energy metabolism support.', 
649.00, 15, 90, 'https://images.unsplash.com/photo-1584017911766-d451b3d0e843?auto=format&fit=crop&w=900&q=85', TRUE
FROM categories WHERE name='Vitamins & Recovery' LIMIT 1;

-- Demo coupons for BEAST LIFE
INSERT INTO coupons(code, discount_type, discount_value, minimum_order, maximum_discount, expiry_date, status)
VALUES 
('BEAST10', 'PERCENT', 10, 499, 500, DATE_ADD(CURRENT_DATE, INTERVAL 90 DAY), TRUE),
('PUMP20', 'PERCENT', 20, 1999, 1000, DATE_ADD(CURRENT_DATE, INTERVAL 90 DAY), TRUE),
('WELCOME10', 'PERCENT', 10, 499, 200, DATE_ADD(CURRENT_DATE, INTERVAL 90 DAY), TRUE)
ON DUPLICATE KEY UPDATE status=TRUE, expiry_date=DATE_ADD(CURRENT_DATE, INTERVAL 90 DAY);
