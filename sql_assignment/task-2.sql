 -- Queries
 -- task-2
-- Write an SQL query to insert a new student into the "Students" table with the following details:
-- a. First Name: John
-- b. Last Name: Doe
-- c. Date of Birth: 1995-08-15
-- d. Email: john.doe@example.com
-- e. Phone Number: 1234567890


-- Write an SQL query to enroll a student in a course. Choose an existing student and course and
-- insert a record into the "Enrollments" table with the enrollment date.
INSERT INTO Enrollments 
(student_id, course_id, enrollment_date) 
VALUES(1, 1, '2024-01-01');

-- 3. Update the email address of a specific teacher in the "Teacher" table. Choose any teacher and
-- modify their email address.
UPDATE  teachers 
SET email = 'rahulverma@gmail.com'
WHERE first_name = 'Rahul' ;


-- 4. Write an SQL query to delete a specific enrollment record from the "Enrollments" table. Select
-- an enrollment record based on the student and course.
DELETE 	FROM enrollments WHERE student_id = 1 AND course_id = 1;

-- 5. Update the "Courses" table to assign a specific teacher to a course. Choose any course and
-- teacher from the respective tables.
UPDATE courses
SET teacher_id = (SELECT teacher_id FROM teachers WHERE first_name = 'Rahul')
WHERE course_name = 'Physics';


-- 6. Delete a specific student from the "Students" table and remove all their enrollment records
-- from the "Enrollments" table. Be sure to maintain referential integrity.
DELETE FROM enrollments 
WHERE student_id = (SELECT student_id FROM students WHERE first_name = 'Jane');

DELETE FROM students 
WHERE student_id = (SELECT student_id FROM (SELECT student_id FROM students WHERE first_name = 'Jane') AS temp );

-- 7. Update the payment amount for a specific payment record in the "Payments" table. Choose any
-- payment record and modify the payment amount.


UPDATE payments
SET amount = 1000
WHERE student_id = (SELECT student_id FROM students WHERE first_name = 'John');