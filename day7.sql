CREATE TABLE employees (
    emp_id INT PRIMARY KEY,
    name VARCHAR(100),
    salary DECIMAL(10,2),
    department VARCHAR(50),
    created_at DATETIME,
    modified_at DATETIME
);

CREATE TABLE employee_log (
    log_id INT AUTO_INCREMENT PRIMARY KEY,
    emp_id INT,
    action_type VARCHAR(50),
    old_salary DECIMAL(10,2),
    new_salary DECIMAL(10,2),
    log_time DATETIME
);

CREATE TABLE employee_archive (
    archive_id INT AUTO_INCREMENT PRIMARY KEY,
    emp_id INT,
    name VARCHAR(100),
    salary DECIMAL(10,2),
    department VARCHAR(50),
    deleted_at DATETIME
);

CREATE TABLE stats (
    id INT PRIMARY KEY,
    employee_count INT
);

INSERT INTO stats VALUES (1,0);

SELECT * FROM employees;
SELECT * FROM employee_log;
SELECT * FROM employee_archive;
SELECT * FROM stats;

DELIMITER $$

CREATE TRIGGER trg_after_insert_log
AFTER INSERT ON employees
FOR EACH ROW
BEGIN
    INSERT INTO employee_log(emp_id, action_type, new_salary, log_time)
    VALUES (NEW.emp_id, 'INSERT', NEW.salary, NOW());
END$$

CREATE TRIGGER trg_before_insert_timestamp
BEFORE INSERT ON employees
FOR EACH ROW
BEGIN
    SET NEW.created_at = NOW();
END$$

CREATE TRIGGER trg_after_update_salary_log
AFTER UPDATE ON employees
FOR EACH ROW
BEGIN
    IF OLD.salary <> NEW.salary THEN
        INSERT INTO employee_log(emp_id, action_type, old_salary, new_salary, log_time)
        VALUES (NEW.emp_id, 'SALARY UPDATE', OLD.salary, NEW.salary, NOW());
    END IF;
END$$

CREATE TRIGGER trg_before_update_no_decrease
BEFORE UPDATE ON employees
FOR EACH ROW
BEGIN
    IF NEW.salary < OLD.salary THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Salary cannot be decreased';
    END IF;
END$$

CREATE TRIGGER trg_before_insert_validate_salary
BEFORE INSERT ON employees
FOR EACH ROW
BEGIN
    IF NEW.salary <= 0 THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Salary must be positive';
    END IF;
END$$

CREATE TRIGGER trg_after_delete_archive
AFTER DELETE ON employees
FOR EACH ROW
BEGIN
    INSERT INTO employee_archive(emp_id, name, salary, department, deleted_at)
    VALUES (OLD.emp_id, OLD.name, OLD.salary, OLD.department, NOW());
END$$

CREATE TRIGGER trg_after_insert_empcount
AFTER INSERT ON employees
FOR EACH ROW
BEGIN
    UPDATE stats SET employee_count = employee_count + 1 WHERE id = 1;
END$$

CREATE TRIGGER trg_after_delete_empcount
AFTER DELETE ON employees
FOR EACH ROW
BEGIN
    UPDATE stats SET employee_count = employee_count - 1 WHERE id = 1;
END$$

CREATE TRIGGER trg_before_insert_upper_name
BEFORE INSERT ON employees
FOR EACH ROW
BEGIN
    SET NEW.name = UPPER(NEW.name);
END$$

CREATE TRIGGER trg_before_update_modified
BEFORE UPDATE ON employees
FOR EACH ROW
BEGIN
    SET NEW.modified_at = NOW();
END$$

DELIMITER ;

SELECT * FROM employees;
SELECT * FROM employee_log;
SELECT * FROM employee_archive;
SELECT * FROM stats;
