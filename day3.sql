CREATE TABLE employees (
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100),
    department VARCHAR(100),
    salary INT,
    city VARCHAR(100)
);

INSERT INTO employees (name, department, salary, city) VALUES
('Arun', 'HR', 45000, 'Chennai'),
('Bala', 'HR', 55000, 'Madurai'),
('Chitra', 'IT', 70000, 'Chennai'),
('David', 'IT', 80000, 'Bangalore'),
('Elango', 'IT', 60000, 'Chennai'),
('Farook', 'Finance', 50000, 'Coimbatore'),
('Gopi', 'Finance', 90000, 'Chennai'),
('Hari', 'Sales', 30000, 'Madurai'),
('Indu', 'Sales', 45000, 'Coimbatore'),
('Jothi', 'Sales', 70000, 'Chennai');

SELECT department, COUNT(*) AS total_employees
FROM employees
GROUP BY department;

SELECT department, AVG(salary) AS avg_salary
FROM employees
GROUP BY department;

SELECT city, COUNT(*) AS total_employees
FROM employees
GROUP BY city;

SELECT department, MIN(salary) AS min_salary, MAX(salary) AS max_salary
FROM employees
GROUP BY department;

SELECT department, SUM(salary) AS total_salary
FROM employees
GROUP BY department;

SELECT department, COUNT(*)
FROM employees
GROUP BY department
HAVING COUNT(*) > 2;

SELECT department, AVG(salary)
FROM employees
GROUP BY department
HAVING AVG(salary) > 50000;

SELECT city, COUNT(*)
FROM employees
GROUP BY city
HAVING COUNT(*) > 1;

SELECT department, MAX(salary)
FROM employees
GROUP BY department
HAVING MAX(salary) > 70000;

SELECT department, SUM(salary)
FROM employees
GROUP BY department
HAVING SUM(salary) > 150000;

SELECT department, AVG(salary)
FROM employees
GROUP BY department
HAVING AVG(salary) > (SELECT AVG(salary) FROM employees);

SELECT city, AVG(salary)
FROM employees
GROUP BY city
HAVING AVG(salary) > 60000;

SELECT department, COUNT(*)
FROM employees
WHERE salary > 50000
GROUP BY department;

SELECT department, COUNT(*)
FROM employees
GROUP BY department
HAVING MIN(salary) > 40000;

SELECT department, AVG(salary) AS avg_salary
FROM employees
GROUP BY department
ORDER BY avg_salary DESC
LIMIT 1;

