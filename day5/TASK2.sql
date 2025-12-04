CREATE TABLE students (
    student_id INT PRIMARY KEY,
    student_name VARCHAR(100)
);

CREATE TABLE courses (
    course_id INT PRIMARY KEY,
    course_name VARCHAR(100),
    teacher VARCHAR(100)
);

CREATE TABLE student_courses (
    student_id INT,
    course_id INT,
    PRIMARY KEY (student_id, course_id),
    FOREIGN KEY (student_id) REFERENCES students(student_id),
    FOREIGN KEY (course_id) REFERENCES courses(course_id)
);

INSERT INTO students VALUES
(1, 'Karthi'),
(2, 'Arun'),
(3, 'Vimal'),
(4, 'Ravi'),
(5, 'Suresh');

INSERT INTO courses VALUES
(101, 'Maths', 'Mr. Kumar'),
(102, 'Science', 'Mrs. Lakshmi'),
(103, 'English', 'Mr. David'),
(104, 'Physics', 'Mrs. Priya'),
(105, 'Chemistry', 'Mr. Raman');

INSERT INTO student_courses VALUES
(1, 101),
(1, 102),
(2, 103),
(3, 101),
(4, 105),
(5, 104);
