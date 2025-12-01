CREATE TABLE employees (
    emp_id INT PRIMARY KEY,
    name VARCHAR(50) NOT NULL,
    department VARCHAR(50) NOT NULL,
    city VARCHAR(50) DEFAULT 'Chennai',
    salary INT CHECK (salary > 0)
);

INSERT INTO employees (emp_id, name, department, city, salary) VALUES
(1, 'Karthik', 'HR', 'Chennai', 45000),
(2, 'Gokul', 'IT', 'Bangalore', 60000),
(3, 'Mathan', 'Finance', 'Chennai', 52000),
(4, 'Ragul', 'IT', 'Hyderabad', 58000),
(5, 'Kavin', 'Marketing', 'Coimbatore', 40000),
(6, 'Sanjay', 'HR', 'Chennai', 47000),
(7, 'Praveen', 'IT', 'Bangalore', 65000);

SELECT * FROM employees;

SELECT emp_id, name, city, salary
FROM employees
WHERE department = 'IT';

SELECT department, AVG(salary) AS avg_salary
FROM employees
GROUP BY department;

INSERT INTO employees (emp_id, name, department, salary)
VALUES (8, 'Manoj', 'HR', 48000);

SELECT * FROM employees;

UPDATE employees
SET salary = salary + 2000
WHERE department = 'HR';

SELECT *
FROM employees
WHERE department = 'HR';

DELETE FROM employees
WHERE emp_id = 5;

SELECT * FROM employees;

CREATE TABLE departments (
    dept_id INT PRIMARY KEY,
    dept_name VARCHAR(50) UNIQUE NOT NULL
);

INSERT INTO departments (dept_id, dept_name) VALUES
(10, 'HR'),
(20, 'IT'),
(30, 'Finance'),
(40, 'Marketing');

CREATE TABLE employees_2 (
    emp_id INT PRIMARY KEY,
    name VARCHAR(50) NOT NULL,
    dept_id INT,
    city VARCHAR(50) DEFAULT 'Chennai',
    salary INT CHECK (salary > 0),
    CONSTRAINT fk_dept FOREIGN KEY (dept_id) REFERENCES departments(dept_id)
);

INSERT INTO employees_2 (emp_id, name, dept_id, city, salary) VALUES
(1, 'Karthik', 10, 'Chennai', 45000),
(2, 'Gokul', 20, 'Bangalore', 60000),
(3, 'Mathan', 30, 'Chennai', 52000);

SELECT e.emp_id, e.name, d.dept_name, e.city, e.salary
FROM employees_2 e
JOIN departments d ON e.dept_id = d.dept_id;
