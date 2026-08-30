-- ============================================================
-- SEED DATA
-- ============================================================

-- --------------------------------------------
-- CATEGORIES
-- --------------------------------------------
INSERT INTO categories (name) VALUES
    ('Electronics'),
    ('Home & Kitchen'),
    ('Books'),
    ('Sports & Outdoors');

-- --------------------------------------------
-- USERS
-- --------------------------------------------
INSERT INTO users (username, email, password_hash) VALUES
    ('mrossi', 'mario.rossi@example.com', '$2b$12$examplehash1'),
    ('lverdi', 'laura.verdi@example.com', '$2b$12$examplehash2'),
    ('gbianchi', 'giulia.bianchi@example.com', '$2b$12$examplehash3'),
    ('fcolombo', 'franco.colombo@example.com', '$2b$12$examplehash4');

-- --------------------------------------------
-- PRODUCTS
-- --------------------------------------------
INSERT INTO products (description, category_id, price, quantity) VALUES
    ('Wireless Headphones', 1, 59.99, 120),
    ('Smartphone Stand', 1, 14.50, 300),
    ('Non-stick Frying Pan', 2, 24.90, 80),
    ('Electric Kettle', 2, 32.00, 60),
    ('The Pragmatic Programmer', 3, 39.99, 50),
    ('Clean Code', 3, 34.99, 45),
    ('Yoga Mat', 4, 19.99, 150),
    ('Running Shoes', 4, 79.00, 90);

-- --------------------------------------------
-- PURCHASES
-- --------------------------------------------
INSERT INTO purchases (user_id, product_id, quantity, unit_price, purchase_date) VALUES
    (1, 1, 1, 59.99, '2026-01-15'),
    (1, 5, 2, 39.99, '2026-01-20'),
    (2, 3, 1, 24.90, '2026-02-03'),
    (2, 7, 1, 19.99, '2026-02-10'),
    (3, 2, 3, 14.50, '2026-02-14'),
    (3, 8, 1, 79.00, '2026-03-01'),
    (4, 4, 1, 32.00, '2026-03-05'),
    (4, 6, 2, 34.99, '2026-03-05'),
    (1, 7, 1, 19.99, '2026-03-12'),
    (2, 1, 2, 59.99, '2026-03-18');
