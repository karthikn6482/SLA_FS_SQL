DROP TABLE IF EXISTS employees;

CREATE TABLE employees (
  emp_id INT AUTO_INCREMENT PRIMARY KEY,
  name VARCHAR(100) NOT NULL,
  email VARCHAR(150) NOT NULL UNIQUE,
  department VARCHAR(100) NOT NULL,
  salary DECIMAL(12,2) NOT NULL,
  join_date DATE NOT NULL,
  phone VARCHAR(20) UNIQUE
);

INSERT INTO employees (name,email,department,salary,join_date,phone) VALUES
('Rahul Kumar','rahul.kumar@example.com','Engineering',75000.50,'2025-11-10','9876543210'),
('Priya Sharma','priya.sharma@example.com','Marketing',48000.00,'2025-10-15','9876501234'),
('Anil R','anil.r@example.com','Engineering',52000.75,'2025-11-25','9876512345'),
('Sneha Patel','sneha.patel@example.com','HR',45000.00,'2025-09-01','9876523456'),
('Karthik M','karthik.m@example.com','Marketing',51000.00,'2025-11-30','9876534567');

UPDATE employees SET name = UPPER(name) WHERE emp_id = 3;

SELECT department, SUM(salary) AS total_salary FROM employees GROUP BY department;

SELECT * FROM employees WHERE join_date >= CURDATE() - INTERVAL 30 DAY;

SELECT name, salary, ROUND(salary,2) AS salary_rounded FROM employees;

SELECT * FROM employees WHERE LENGTH(name) > 5;

SELECT department, AVG(salary) AS avg_salary FROM employees GROUP BY department HAVING AVG(salary) > 50000;

UPDATE employees SET salary = salary * 1.10;

ALTER TABLE employees ADD COLUMN bonus INT;

SELECT name, salary, YEAR(join_date) AS join_year FROM employees ORDER BY join_date ASC;
