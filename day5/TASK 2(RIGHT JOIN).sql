CREATE TABLE customers (
    customer_id INT PRIMARY KEY,
    customer_name VARCHAR(100),
    customer_phone VARCHAR(20)
);

CREATE TABLE products (
    product_id INT PRIMARY KEY,
    product_name VARCHAR(100),
    product_price DECIMAL(10,2)
);

CREATE TABLE orders (
    order_id INT PRIMARY KEY,
    customer_id INT,
    product_id INT,
    order_date DATE
);

INSERT INTO customers VALUES
(1, 'Karthi', '9876543210');

INSERT INTO products VALUES
(101, 'Laptop', 55000);

INSERT INTO orders VALUES
(1, 1, 101, '2025-01-05'),
(2, 1, 999, '2025-01-08'),
(3, 1, 500, '2025-01-12');

SELECT
    orders.order_id,
    orders.order_date,
    products.product_name
FROM products
RIGHT JOIN orders ON products.product_id = orders.product_id;
