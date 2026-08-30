-- ============================================================
-- E-COMMERCE DATABASE SCHEMA
-- ============================================================

-- --------------------------------------------
-- USERS TABLE
-- --------------------------------------------
CREATE TABLE users (
    user_id         SERIAL PRIMARY KEY,
    username        VARCHAR(50)  NOT NULL UNIQUE,
    email           VARCHAR(100) NOT NULL UNIQUE,
    password_hash   VARCHAR(255) NOT NULL,
    created_at      TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
);

-- --------------------------------------------
-- CATEGORIES TABLE
-- --------------------------------------------
CREATE TABLE categories (
    category_id     SERIAL PRIMARY KEY,
    name            VARCHAR(50) NOT NULL UNIQUE
);

-- --------------------------------------------
-- PRODUCTS TABLE
-- --------------------------------------------
CREATE TABLE products (
    product_id      SERIAL PRIMARY KEY,
    description     VARCHAR(255) NOT NULL,
    category_id     INT NOT NULL REFERENCES categories(category_id),
    price           NUMERIC(10,2) NOT NULL CHECK (price >= 0),
    quantity        INT NOT NULL DEFAULT 0 CHECK (quantity >= 0)
);

CREATE INDEX idx_products_category ON products (category_id);
