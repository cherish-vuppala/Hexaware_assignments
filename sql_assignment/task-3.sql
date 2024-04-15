 -- 1. Write an SQL query to calculate the total payments made by a specific student. 
 -- You will need to
-- join the "Payments" table with the "Students" table based on the student's ID.
 SELECT SUM(p.amount) AS tot_payments 
 FROM payments p 
 JOIN 
	students s 
 ON s.student_id = p.student_id 
 WHERE first_name='John';
 
 -- 2. Write an SQL query to retrieve a list of courses along with the count of students enrolled in each
-- course. Use a JOIN operation between the "Courses" table and the "Enrollments" table.
 SELECT c.course_name, COUNT(e.student_id) AS student_COUNT 
 FROM courses c 
 JOIN 
	enrollments e 
 ON c.course_id=e.course_id 
 GROUP BY course_name;
 
-- 3. Write an SQL query to find the names of students who have not enrolled in any course. Use a
-- LEFT JOIN between the "Students" table and the "Enrollments" table to identify students
-- without enrollments.
SELECT s.first_name,s.last_name 
FROM students s 
LEFT JOIN enrollments e 
ON e.student_id = s.student_id 
WHERE e.student_id IS NULL;


-- 4. Write an SQL query to retrieve the first name, last name of students, and the names of the
-- courses they are enrolled in. Use JOIN operations between the "Students" table and the
-- "Enrollments" and "Courses" tables.
SELECT s.first_name,s.last_name,c.course_name 
FROM students s 
JOIN 
	enrollments e 
	ON s.student_id=e.student_id 
JOIN 
	courses c 
	ON e.course_id=c.course_id;

-- 5. Create a query to list the names of teachers and the courses they are assigned to. Join the
-- "Teacher" table with the "Courses" table.
SELECT t.first_name,t.last_name,c.course_name AS courses 
FROM teacher t 
JOIN 
	courses c 
ON t.teacher_id = c.teacher_id;


-- 6. Retrieve a list of students and their enrollment dates for a specific course. You'll need to join the
-- "Students" table with the "Enrollments" and "Courses" tables.
SELECT s.student_id,s.first_name,s.last_name,e.enrollment_date,c.course_name 
FROM students s 
JOIN 
	enrollments e 
    ON s.student_id=e.student_id
JOIN 
	courses c 
	ON e.course_id=c.course_id;

-- 7. Find the names of students who have not made any payments. Use a LEFT JOIN between the
-- "Students" table and the "Payments" table and filter for students with NULL payment records.
SELECT s.first_name,s.last_name 
FROM students s 
LEFT JOIN 
	payments p 
    ON s.student_id =p.student_id 
WHERE p.student_id IS NULL;

-- 8. Write a query to identify courses that have no enrollments. You'll need to use a LEFT JOIN
-- between the "Courses" table and the "Enrollments" table and filter for courses with NULL
-- enrollment records.
SELECT c.course_name 
FROM courses c 
	LEFT JOIN 
	enrollments e 
    ON c.course_id=e.course_id 
WHERE e.course_id IS NULL;
 
--  9. Identify students who are enrolled in more than one course. Use a self-join on the "Enrollments"
-- table to find students with multiple enrollment records.
SELECT e1.student_id 
FROM enrollments e1 
JOIN 
	enrollments e2 
    ON e1.student_id=e2.student_id 
GROUP BY e1.student_id HAVING COUNT(e1.student_id) > 1;


-- 10. Find teachers who are not assigned to any courses. Use a LEFT JOIN between the "Teacher"
-- table and the "Courses" table and filter for teachers with NULL course assignments

SELECT t.first_name, t.last_name 
FROM teacher t 
LEFT JOIN 
	courses c 
ON t.teacher_id = c.teacher_id 
WHERE c.teacher_id IS NULL;