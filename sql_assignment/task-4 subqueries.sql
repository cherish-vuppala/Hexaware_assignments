USE sisdb;
SELECT * FROM enrollments;
-- Write an SQL query to calculate the average number of students enrolled in each course. Use
-- aggregate functions and subqueries to achieve this.



-- 2. Identify the student(s) who made the highest payment. Use a subquery to find the maximum
-- payment amount and then retrieve the student(s) associated with that amount.
SELECT * FROM students WHERE student_id IN 
		(SELECT student_id FROM 
        payments WHERE amount = 
        (SELECT MAX(amount) FROM payments));
        
-- 3. Retrieve a list of courses with the highest number of enrollments. Use subqueries to find the
-- course(s) with the maximum enrollment count.
WITH courses_enrollments AS (
SELECT course_id, COUNT(student_id) AS number_of_students_enrolled
FROM enrollments
GROUP BY course_id
)

SELECT * FROM courses WHERE course_id IN (SELECT course_id FROM courses_enrollments WHERE number_of_students_enrolled =
( SELECT MAX(number_of_students_enrolled) as enrolled_students FROM courses_enrollments));


-- 4. Calculate the total payments made to courses taught by each teacher. 
-- Use subqueries to sum
-- payments for each teacher's courses.


-- 5. Identify students who are enrolled in all available courses. Use subqueries to compare a
-- student's enrollments with the total number of courses.



-- 6. Retrieve the names of teachers who have not been assigned to any courses. Use subqueries to
-- find teachers with no course assignments.
SELECT t.teacher_id, CONCAT(first_name, " ", last_name) as teacher_name 
FROM teachers t
WHERE t.teacher_id NOT IN (SELECT teacher_id FROM courses);

-- 7. Calculate the average age of all students. Use subqueries to calculate the age of each student
-- based on their date of birth.
WITH age_of_students as (
SELECT YEAR(NOW()) - YEAR(date_of_birth) as age FROM students
)
SELECT AVG(age) FROM age_of_students;

-- 8. Identify courses with no enrollments. Use subqueries to find courses without enrollment
-- records.
SELECT * FROM courses
WHERE course_id NOT IN (SELECT course_id FROM enrollments);

-- 9. Calculate the total payments made by each student for each course 
-- they are enrolled in.
-- use subqueries and aggregate functions to sum payments.



-- 10. Identify students who have made more than one payment. Use subqueries and aggregate
-- functions to count payments per student and filter for those with counts greater than one.
SELECT s.student_id, CONCAT(first_name, " ", last_name) as student_name
FROM students s
JOIN
	payments p
ON s.student_id = p.student_id
GROUP BY s.student_id
HAVING COUNT(p.payment_id) > 1;

-- 11. Write an SQL query to calculate the total payments made by each student. Join the "Students"
-- table with the "Payments" table and use GROUP BY to calculate the sum of payments for each
-- student.
SELECT s.student_id, CONCAT(first_name, " ", last_name) as student_name, SUM(amount) as total_amount_paid
FROM students s
JOIN
	payments p
ON s.student_id = p.student_id
GROUP BY s.student_id;

-- 12. Retrieve a list of course names along with the count of students enrolled in each course. Use
-- JOIN operations between the "Courses" table and the "Enrollments" table and GROUP BY to
-- count enrollments.
WITH courses_enrollments AS (
SELECT course_id, COUNT(student_id) AS number_of_students_enrolled
FROM enrollments
GROUP BY course_id
)

SELECT c.course_name, ce.number_of_students_enrolled FROM
	courses c
JOIN
	courses_enrollments ce
ON c.course_id = ce.course_id;



-- 13. Calculate the average payment amount made by students. Use JOIN operations between the
-- "Students" table and the "Payments" table and GROUP BY to calculate the average.
SELECT s.student_id, CONCAT(first_name, " ", last_name) as student_name, AVG(amount) as average_amount_paid
FROM students s
JOIN
	payments p
ON s.student_id = p.student_id
GROUP BY s.student_id;
