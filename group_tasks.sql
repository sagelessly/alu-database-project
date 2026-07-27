-- ==========================================
-- Group Tasks - Join Queries, Aggregate Query, Normalization Notes
-- ==========================================

-- Use the shared database
USE alu_db;

-- ==========================================
-- FK Validation (no orphaned references)
-- ==========================================
-- Foreign key relationships are valid: every foreign key value inserted points to an
-- existing parent row. Courses.faculty_id uses 1,2,3,4 (Faculty id 5 was deleted, so it
-- is never referenced). Courses.classroom_id uses 1,2,3,4 (Classroom id 5 was deleted and
-- is never referenced). Extra_Curricular_Activities.advisor_faculty_id uses 1,2,3,4.
-- Student_Courses references Students 1-4 (id 5 deleted) and Courses 1,2,3,5 (id 4 deleted).
-- Student_Activities references Students 1-4 and Activities 1-4. No INSERT references a
-- deleted parent, so there are no orphaned rows. (If run with FOREIGN_KEY_CHECKS enabled,
-- MySQL would reject any orphan; our data is consistent.)

-- ==========================================
-- Normalization Discussion
-- ==========================================
-- The schema is in at least 3NF. Each table stores only attributes that depend on its own
-- primary key: Students holds student details, Classroom holds room details, Faculty holds
-- faculty details, Courses holds course details plus two FKs, and Activities holds activity
-- details plus an advisor FK. No table repeats descriptive data that belongs elsewhere
-- (e.g. a student's name is stored once in Students, not duplicated in the junction tables).
-- The two junction tables (Student_Courses, Student_Activities) are pure linking tables:
-- they contain only the two parent PKs plus at most a small contextual attribute
-- (enrollment_date/grade, role/join_date). They correctly resolve the many-to-many
-- relationships without duplicating the Students, Courses, or Activities data, avoiding
-- the redundancy and update anomalies that a combined table would introduce.

-- ==========================================
-- Join Query 1: Student enrolled in Course, taught by Faculty, in Classroom
-- ==========================================

SELECT
    CONCAT(s.name, ' enrolled in ', c.course_name,
           ', taught by ', f.name,
           ' in room ', cl.room_number, ' (', cl.building, ')') AS result
FROM Students s
JOIN Student_Courses sc ON s.student_id = sc.student_id
JOIN Courses c ON sc.course_id = c.course_id
JOIN Faculty f ON c.faculty_id = f.faculty_id
JOIN Classroom cl ON c.classroom_id = cl.classroom_id;

-- ==========================================
-- Join Query 2: Student participates in Activity, advised by Faculty
-- ==========================================

SELECT
    CONCAT(s.name, ' participates in ', a.activity_name,
           ', advised by ', f.name) AS result
FROM Students s
JOIN Student_Activities sa ON s.student_id = sa.student_id
JOIN Extra_Curricular_Activities a ON sa.activity_id = a.activity_id
JOIN Faculty f ON a.advisor_faculty_id = f.faculty_id;

-- ==========================================
-- Join Query 3: Faculty teaching load (courses + classrooms they use)
-- ==========================================

SELECT
    CONCAT(f.name, ' teaches ', c.course_name,
           ' for ', COUNT(sc.student_id), ' student(s) in ', cl.room_number) AS result
FROM Faculty f
JOIN Courses c ON f.faculty_id = c.faculty_id
JOIN Classroom cl ON c.classroom_id = cl.classroom_id
LEFT JOIN Student_Courses sc ON c.course_id = sc.course_id
GROUP BY f.name, c.course_name, cl.room_number;

-- ==========================================
-- Aggregate Query: Number of students per course
-- ==========================================

SELECT
    c.course_name,
    COUNT(sc.student_id) AS number_of_students
FROM Courses c
LEFT JOIN Student_Courses sc ON c.course_id = sc.course_id
GROUP BY c.course_id, c.course_name
ORDER BY number_of_students DESC;
