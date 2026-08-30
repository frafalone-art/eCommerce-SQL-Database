-- ============================================================
-- EXAMPLE QUERIES
-- ============================================================

-- Total revenue per month
SELECT
    DATE_TRUNC('month', purchase_date) AS month,
    SUM(quantity * unit_price) AS revenue
FROM purchases
GROUP BY 1
ORDER BY 1;

-- Best-selling products in a specific month (e.g. March 2026)
SELECT
    p.description,
    SUM(pu.quantity) AS units_sold
FROM purchases pu
JOIN products p ON p.product_id = pu.product_id
WHERE pu.purchase_date >= '2026-03-01' AND pu.purchase_date < '2026-04-01'
GROUP BY p.description
ORDER BY units_sold DESC;

-- Revenue by category
SELECT
    c.name AS category,
    SUM(pu.quantity * pu.unit_price) AS revenue
FROM purchases pu
JOIN products p ON p.product_id = pu.product_id
JOIN categories c ON c.category_id = p.category_id
GROUP BY c.name
ORDER BY revenue DESC;

-- Top spending users
SELECT
    u.username,
    COUNT(*) AS number_of_orders,
    SUM(pu.quantity * pu.unit_price) AS total_spent
FROM purchases pu
JOIN users u ON u.user_id = pu.user_id
GROUP BY u.username
ORDER BY total_spent DESC;
