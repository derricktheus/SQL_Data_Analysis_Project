-- Schema
CREATE TABLE customers (id INTEGER PRIMARY KEY, name VARCHAR(80), region VARCHAR(32));
CREATE TABLE products (id INTEGER PRIMARY KEY, name VARCHAR(80), price DECIMAL(10,2));
CREATE TABLE orders (id INTEGER PRIMARY KEY, customer_id INTEGER, order_date DATE,
  FOREIGN KEY (customer_id) REFERENCES customers(id));
CREATE TABLE order_items (order_id INTEGER, product_id INTEGER, qty INTEGER, price DECIMAL(10,2),
  FOREIGN KEY (order_id) REFERENCES orders(id), FOREIGN KEY (product_id) REFERENCES products(id));

-- Data
INSERT INTO customers VALUES
(1,'Acme Corp','East'),
(2,'Beta LLC','West'),
(3,'Cobalt Inc','East'),
(4,'Delta Co','South');

INSERT INTO products VALUES
(1,'Laptop',1200.00),
(2,'Monitor',300.00),
(3,'Keyboard',50.00),
(4,'Mouse',30.00),
(5,'Dock',150.00);

INSERT INTO orders VALUES
(100,1,'2025-01-15'),
(101,2,'2025-01-20'),
(102,1,'2025-02-05'),
(103,3,'2025-02-10'),
(104,4,'2025-03-02');

INSERT INTO order_items VALUES
(100,1,1,1200.00),
(100,2,2,300.00),
(101,3,5,50.00),
(102,1,1,1200.00),
(102,5,1,150.00),
(103,2,3,300.00),
(103,4,2,30.00),
(104,3,10,50.00);
