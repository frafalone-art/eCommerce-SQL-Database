-- ============================================================
-- PURCHASES TABLE (sales history)
-- ============================================================

CREATE TABLE purchases (
    purchase_id     SERIAL PRIMARY KEY,
    user_id         INT NOT NULL REFERENCES users(user_id),
    product_id      INT NOT NULL REFERENCES products(product_id),
    quantity        INT NOT NULL CHECK (quantity > 0),
    unit_price      NUMERIC(10,2) NOT NULL,
    purchase_date   TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
);

CREATE INDEX idx_purchases_date ON purchases (purchase_date);
CREATE INDEX idx_purchases_product ON purchases (product_id);
