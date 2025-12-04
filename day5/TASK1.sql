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
    order_date DATE,
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id),
    FOREIGN KEY (product_id) REFERENCES products(product_id)
);
INSERT INTO customers VALUES
(1, 'Karthi', '9876543210'),
(2, 'Arun', '9123456780'),
(3, 'Vimal', '9898989898'),
(4, 'Ravi', '9000011111'),
(5, 'Suresh', '9555533333');
INSERT INTO products VALUES
(101, 'Laptop', 55000),
(102, 'Mouse', 500),
(103, 'Keyboard', 1200),
(104, 'Monitor', 8000),
(105, 'USB Cable', 150);
INSERT INTO orders VALUES
(1, 1, 101, '2025-01-05'),
(2, 2, 103, '2025-01-08'),
(3, 1, 102, '2025-01-10'),
(4, 3, 105, '2025-01-12'),
(5, 2, 104, '2025-01-15');
