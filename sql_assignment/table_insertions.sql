  
  -- Insert 10 rows into the students table

INSERT INTO students (student_id, first_name, last_name, date_of_birth, email, phone_number) 
VALUES
(2, 'Jane', 'Smith', '1998-07-20', 'jane.smith@example.com', '987-654-3210'),
(3, 'Alice', 'Johnson', '1997-01-10', 'alice.johnson@example.com', '555-123-4567'),
(4, 'Bob', 'Williams', '1996-09-25', 'bob.williams@example.com', '222-333-4444'),
(5, 'Emily', 'Brown', '1999-11-05', 'emily.brown@example.com', '999-888-7777'),
(6, 'Michael', 'Jones', '1994-12-30', 'michael.jones@example.com', '111-222-3333'),
(7, 'Samantha', 'Davis', '1993-04-12', 'samantha.davis@example.com', '444-555-6666'),
(8, 'David', 'Martinez', '1992-08-22', 'david.martinez@example.com', '777-666-5555'),
(9, 'Olivia', 'Garcia', '1991-06-18', 'olivia.garcia@example.com', '333-222-1111'),
(10, 'William', 'Rodriguez', '1990-02-05', 'william.rodriguez@example.com', '888-999-0000');

 
  -- Insert 10 rows into the teachers table
 INSERT INTO teachers (first_name, last_name, email) VALUES
('Rahul', 'Verma', 'rahul.verma@example.com'),
('Priya', 'Patel', 'priya.patel@example.com'),
('Amit', 'Sharma', 'amit.sharma@example.com'),
('Sneha', 'Das', 'sneha.das@example.com'),
('Ravi', 'Singh', 'ravi.singh@example.com'),
('Neha', 'Joshi', 'neha.joshi@example.com'),
('Vikas', 'Gupta', 'vikas.gupta@example.com'),
('Deepak', 'Malhotra', 'deepak.malhotra@example.com'),
('Shreya', 'Chopra', 'shreya.chopra@example.com'),
('Raj', 'Mehra', 'raj.mehra@example.com');

INSERT INTO teachers(first_name, last_name, email) VALUES
('Dhoni', 'Mahendra Singh', 'dhoni.singh@gmail.com');



 -- Insert 10 rows into the courses table
 INSERT INTO courses (course_id, course_name, credits, teacher_id) 
VALUES
(1, 'Mathematics', 3.5, 101),
(2, 'Physics', 4.0, 102),
(3, 'Literature', 3.0, 103),
(4, 'History', 3.0, 104),
(5, 'Biology', 4.5, 105),
(6, 'Computer Science', 4.0, 106),
(7, 'Chemistry', 4.0, 107),
(8, 'Art', 2.5, 108),
(9, 'Music', 2.0, 109),
(10, 'Physical Education', 1.5, 110);

 INSERT INTO courses (course_id, course_name, credits, teacher_id) 
VALUES (11, 'Mechanical', 5.0, 100);

DELETE FROM courses WHERE course_id = 11;


-- Insert 10 rows into the payments table
INSERT INTO payments (payment_date, amount, student_id) VALUES
( '2024-01-01', 100, 1),
('2024-01-15', 150, 2),
('2024-02-01', 200, 3),
('2024-02-15', 120, 4),
('2024-03-01', 180, 5),
('2024-03-15', 210, 6),
('2024-04-01', 190, 7),
('2024-04-15', 220, 8),
('2024-05-01', 160, 9),
('2024-05-15', 230, 10);

INSERT INTO payments (payment_date, amount, student_id)
VALUES ('2024-04-15', 100, 1), ('2024-04-15', 120, 2),
('2024-04-15', 120, 2), ('2024-04-15', 120, 2),
('2024-04-15', 120, 2), ('2024-04-15', 120, 2),
('2024-04-15', 120, 2), ('2024-04-15', 120, 2),
('2024-04-15', 120, 2), ('2024-04-15', 120, 2);

-- Insert 10 rows into enrollments 
INSERT INTO Enrollments (student_id, course_id, enrollment_date) VALUES
(2, 2, '2024-01-01'),
(3, 3, '2024-01-02'),
(4, 4, '2024-01-03'),
(5, 5, '2024-01-04'),
(6, 6, '2024-01-05'),
(7, 7, '2024-01-06'),
(8, 8, '2024-01-07'),
(9, 9, '2024-01-08'),
(10, 10, '2024-01-09');

INSERT INTO enrollments (student_id, course_id, enrollment_date) VALUES 
(2, 3, "2024-02-02"), 
(2, 4, "2024-02-02"),
(3, 4, "2024-02-02"),
(3, 5, "2024-02-02"),
(4, 5, "2024-02-02"),
(4, 6, "2024-02-02");

INSERT INTO enrollments(student_id, course_id, enrollment_date) 
VALUES(2, 1, '2024-04-15'), (2, 2, '2024-04-15'), (2, 5, '2024-04-15'),  (2, 6, '2024-04-15'),  (2, 7, '2024-04-15'),
(2, 8, '2024-04-15'), (2, 9, '2024-04-15'),(2, 10, '2024-04-15');

-- DELETE FROM enrollments WHERE student_id = 1;

SELECT * FROM students;
SELECT * FROM teachers;
SELECT * FROM courses;
SELECT * FROM enrollments;
SELECT * FROM payments;

