CREATE DATABASE ElearningDB;
CREATE SCHEMA elearning;

CREATE TABLE elearning.Students (
    student_id SERIAL PRIMARY KEY ,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    email TEXT NOT NULL UNIQUE
);


CREATE TABLE elearning.Instructors  (
    instructor_id SERIAL PRIMARY KEY ,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    email TEXT NOT NULL UNIQUE
);


CREATE TABLE elearning.Courses    (
    course_id SERIAL PRIMARY KEY ,
    course_name VARCHAR(100) NOT NULL ,
    instructor_id INT,
    FOREIGN KEY (instructor_id) references elearning.Instructors(instructor_id)
);


CREATE TABLE elearning.Enrollments    (
    enrollment_id SERIAL PRIMARY KEY ,
    student_id INT ,
    FOREIGN KEY (student_id) references elearning.Students(student_id),
    course_id INT,
    FOREIGN KEY (course_id) references elearning.Courses(course_id),
    enroll_date DATE NOT NULL
);


CREATE TABLE elearning.Assignments    (
    assignment_id SERIAL PRIMARY KEY ,
    course_id INT ,
    FOREIGN KEY (course_id) references elearning.Courses (course_id),
    title VARCHAR(100) NOT NULL ,
    due_date DATE NOT NULL
);



CREATE TABLE elearning.Submissions     (
    submission_id SERIAL PRIMARY KEY ,
    assignment_id INT ,
    FOREIGN KEY (assignment_id) references elearning.Assignments (assignment_id),
    student_id INT ,
    FOREIGN KEY (student_id) references elearning.Students (student_id),
    grade NUMERIC(5,2) CHECK (grade >= 0 AND grade <= 100),
    submission_date DATE NOT NULL
);
