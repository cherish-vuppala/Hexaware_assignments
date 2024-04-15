CREATE DATABASE IF NOT EXISTS SISDB;
USE sisdb;

CREATE TABLE IF NOT EXISTS students(
   student_id INT PRIMARY KEY,
   first_name VARCHAR(50),
   last_name VARCHAR(50),
   date_of_birth DATE,
   email VARCHAR(50),
   phone_number VARCHAR(15)
);

CREATE TABLE IF NOT EXISTS courses(
   course_id INT PRIMARY KEY,
   course_name VARCHAR(50),
   credits DECIMAL(10, 2),
   teacher_id INT,
   FOREIGN KEY (teacher_id) REFERENCES teachers(teacher_id)
);

CREATE TABLE IF NOT EXISTS teachers(
   teacher_id INT PRIMARY KEY AUTO_INCREMENT,
   first_name VARCHAR(50),
   last_name VARCHAR(50),
   email VARCHAR(50)
)AUTO_INCREMENT = 100;


CREATE TABLE IF NOT EXISTS payments(
   payment_id INT,
   payment_date DATE,
   amount INT,
   student_id INT ,
   PRIMARY KEY (payment_id),
   FOREIGN KEY (student_id) REFERENCES students(student_id)
);

CREATE TABLE IF NOT EXISTS Enrollments (
   enrollment_id INT AUTO_INCREMENT PRIMARY KEY,
   student_id INT,
   course_id INT,
   enrollment_date DATE,
   FOREIGN KEY (student_id) REFERENCES students(student_id),
   FOREIGN KEY (course_id) REFERENCES courses(course_id)
);


