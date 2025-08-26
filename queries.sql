-- Total revenue
SELECT ROUND(SUM(oi.qty * oi.price), 2) AS total_revenue
FROM order_items oi;

-- Revenue by product
SELECT p.name, SUM(oi.qty * oi.price) AS revenue
FROM order_items oi
JOIN products p ON p.id = oi.product_id
GROUP BY p.name
ORDER BY revenue DESC;

-- Top customer by spend
SELECT c.name, SUM(oi.qty * oi.price) AS spend
FROM orders o
JOIN customers c ON c.id = o.customer_id
JOIN order_items oi ON oi.order_id = o.id
GROUP BY c.name
ORDER BY spend DESC;

-- Monthly revenue trend (SQLite syntax example)
SELECT strftime('%Y-%m', o.order_date) AS month, SUM(oi.qty * oi.price) AS revenue
FROM orders o
JOIN order_items oi ON oi.order_id = o.id
GROUP BY month
ORDER BY month;

-- Region performance
SELECT c.region, SUM(oi.qty * oi.price) AS revenue
FROM orders o
JOIN customers c ON c.id = o.customer_id
JOIN order_items oi ON oi.order_id = o.id
GROUP BY c.region
ORDER BY revenue DESC;
