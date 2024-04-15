 -- 1. Write an SQL query to calculate the total payments made by a specific students. 
 -- You will need to
-- join the "Payments" table with the "studentss" table based on the students's ID.
 SELECT SUM(p.amount) AS total_payment
 FROM payments p 
 JOIN 
	students s 
 ON s.student_id = p.student_id 
 WHERE first_name='John';
 
 -- 2. Write an SQL query to retrieve a list of courses along with the count of studentss enrolled in each
-- course. Use a JOIN operation between the "Courses" table and the "Enrollments" table.
 SELECT course_name, COUNT(e.student_id) AS students_COUNT 
 FROM courses c 
 JOIN 
	enrollments e 
 ON c.course_id=e.course_id 
 GROUP BY course_name;
 
-- 3. Write an SQL query to find the names of studentss who have not enrolled in any course. Use a
-- LEFT JOIN between the "studentss" table and the "Enrollments" table to identify studentss
-- without enrollments.
SELECT CONCAT(first_name, " ", last_name) as students_name
FROM students s 
LEFT JOIN enrollments e 
ON e.student_id = s.student_id 
WHERE e.student_id IS NULL;


-- 4. Write an SQL query to retrieve the first name, last name of studentss, and the names of the
-- courses they are enrolled in. Use JOIN operations between the "studentss" table and the
-- "Enrollments" and "Courses" tables.
SELECT DISTINCT s.first_name,s.last_name,c.course_name 
FROM students s 
JOIN 
	enrollments e 
	ON s.student_id=e.student_id 
JOIN 
	courses c 
	ON e.course_id=c.course_id;

-- 5. Create a query to list the names of teacherss and the courses they are assigned to. Join the
-- "teachers" table with the "Courses" table.
SELECT CONCAT(first_name, last_name) as teachers_name, c.course_name AS courses 
FROM teachers t 
JOIN 
	courses c 
ON t.teacher_id = c.teacher_id;


-- 6. Retrieve a list of studentss and their enrollment dates for a specific course. You'll need to join the
-- "studentss" table with the "Enrollments" and "Courses" tables.
SELECT s.student_id,s.first_name,s.last_name,e.enrollment_date,c.course_name 
FROM students s 
JOIN 
	enrollments e 
    ON s.student_id=e.student_id
JOIN 
	courses c 
	ON e.course_id=c.course_id;

-- 7. Find the names of studentss who have not made any payments. Use a LEFT JOIN between the
-- "studentss" table and the "Payments" table and filter for studentss with NULL payment records.
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
 
--  9. Identify studentss who are enrolled in more than one course. Use a self-join on the "Enrollments"
-- table to find studentss with multiple enrollment records.
SELECT e1.student_id 
FROM enrollments e1 
JOIN 
	enrollments e2 
    ON e1.student_id=e2.student_id 
GROUP BY e1.student_id HAVING COUNT(e1.student_id) > 1;


-- 10. Find teachers who are not assigned to any courses. Use a LEFT JOIN between the "teachers"
-- table and the "Courses" table and filter for teacherss with NULL course assignments

SELECT t.teacher_id, CONCAT(first_name, last_name) as teacher_name
FROM teachers t 
LEFT JOIN 
	courses c 
ON t.teacher_id = c.teacher_id 
WHERE c.teacher_id IS NULL;