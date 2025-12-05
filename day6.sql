CREATE TABLE employees (
    emp_id INT,
    name VARCHAR(50),
    department VARCHAR(50),
    job_title VARCHAR(50),
    salary INT,
    city VARCHAR(50)
);

INSERT INTO employees VALUES
(1,'Arjun','IT','Developer',65000,'Chennai'),
(2,'Meena','HR','Manager',72000,'Mumbai'),
(3,'Karthik','IT','Developer',55000,'Chennai'),
(4,'Priya','Finance','Analyst',48000,'Delhi'),
(5,'John','IT','Tester',60000,'Bangalore'),
(6,'Sanjay','HR','Executive',45000,'Mumbai'),
(7,'Divya','Sales','Sales Lead',85000,'Chennai'),
(8,'Joseph','Finance','Accountant',52000,'Delhi'),
(9,'Ram','Sales','Sales Exec',40000,'Chennai'),
(10,'Sneha','IT','Developer',70000,'Bangalore');

SELECT department, COUNT(*) FROM employees GROUP BY department HAVING COUNT(*) > 10;

SELECT department, AVG(salary) FROM employees GROUP BY department HAVING AVG(salary) > 60000;

SELECT job_title, MAX(salary) FROM employees GROUP BY job_title HAVING MAX(salary) > 80000;

SELECT department, SUM(salary) FROM employees GROUP BY department HAVING SUM(salary) > 500000;

SELECT * FROM employees;

SELECT emp_id, name, department, salary FROM employees;

SELECT emp_id AS ID, name AS EmployeeName, salary AS MonthlySalary FROM employees;

SELECT * FROM employees WHERE salary > 55000;

SELECT * FROM employees WHERE department = 'IT';

SELECT * FROM employees WHERE department='IT' AND salary>60000;

SELECT * FROM employees WHERE name LIKE 'A%';

SELECT * FROM employees ORDER BY salary DESC;

SELECT * FROM employees ORDER BY department ASC, salary DESC;

SELECT * FROM employees LIMIT 10;

SELECT * FROM employees LIMIT 10 OFFSET 10;

SELECT DISTINCT department FROM employees;

SELECT COUNT(DISTINCT department) FROM employees;

SELECT department, COUNT(*) FROM employees GROUP BY department;

SELECT department, AVG(salary) FROM employees GROUP BY department;

SELECT department, SUM(salary) FROM employees GROUP BY department;

SELECT department, MAX(salary) FROM employees GROUP BY department;

SELECT department, job_title, COUNT(*) FROM employees GROUP BY department, job_title;

SELECT department, COUNT(*) FROM employees GROUP BY department HAVING COUNT(*) > 5;

SELECT department, AVG(salary) FROM employees GROUP BY department HAVING AVG(salary) > 50000;

SELECT department, SUM(salary) FROM employees GROUP BY department HAVING SUM(salary) > 500000;

SELECT department, COUNT(*), AVG(salary) FROM employees GROUP BY department HAVING COUNT(*)>1 AND AVG(salary)>50000;

SELECT department, MAX(salary) FROM employees GROUP BY department HAVING MAX(salary)>70000;

SELECT department, AVG(salary) FROM employees WHERE salary>40000 GROUP BY department HAVING AVG(salary)>50000 ORDER BY AVG(salary) DESC LIMIT 5;

SELECT department, COUNT(*) FROM employees GROUP BY department ORDER BY COUNT(*) DESC;

SELECT department, SUM(salary) FROM employees WHERE salary>30000 GROUP BY department HAVING SUM(salary)>100000;

SELECT DISTINCT city FROM employees WHERE city LIKE '%a%';

SELECT department, COUNT(*), AVG(salary), MIN(salary), MAX(salary) FROM employees GROUP BY department;

SELECT * FROM employees WHERE (department='IT' OR department='HR') AND salary>50000 AND name LIKE 'A%';

SELECT department, COUNT(*) AS total_emp, AVG(salary) AS avg_sal, SUM(salary) AS total_sal FROM employees WHERE salary>30000 GROUP BY department HAVING COUNT(*)>1 AND AVG(salary)>40000 ORDER BY total_sal DESC LIMIT 10;
