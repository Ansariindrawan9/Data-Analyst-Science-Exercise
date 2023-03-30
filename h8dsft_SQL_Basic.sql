-- create a table with the table name is teacher
CREATE TABLE teachers ( 
id INTEGER PRIMARY KEY AUTOINCREMENT,
first_name varchar(25) NOT NULL,
last_name varchar(50), 
school varchar(50) NOT NULL,
hire_date date,
salary numeric
);

-- 
INSERT INTO teachers (first_name, last_name, school, hire_date, salary)
    VALUES ('Janet', 'Smith', 'MIT', '2011-10-30', 36200),
           ('Lee', 'Reynolds', 'MIT', '1993-05-22', 65000),
           ('Samuel', 'Cole', 'Cambridge University', '2005-08-01', 43500),
           ('Samantha', 'Bush', 'Cambridge University', '2011-10-30', 36200),
           ('Betty', 'Diaz', 'Cambridge University', '2005-08-30', 43500),
           ('Kathleen', 'Roush', 'MIT', '2010-10-22', 38500),
           ('James', 'Diaz', 'Harvard University', '2003-07-18', 61000),
           ('Zack', 'Smith', 'Harvard University', '2000-12-29', 55500),
           ('Luis', 'Gonzales', 'Standford University', '2002-12-01', 50000),
           ('Frank', 'Abbers', 'Standford University', '1999-01-30', 66000);
           
INSERT INTO teachers (first_name, last_name, school, hire_date, salary)
    VALUES ('Samuel', 'Abbers', 'Standford University', '2006-01-30', 32000),
           ('Jessica', 'Abbers', 'Standford University', '2005-01-30', 33000),
           ('Tom', 'Massi', 'Harvard University', '1999-09-09', 39500),
           ('Esteban', 'Brown', 'MIT', '2007-01-30', 36000),
           ('Carlos', 'Alonso', 'Standford University', '2001-01-30', 44000);
           
--SELECT * FROM teachers
------------------------------------------------------------------------------
-- create a table with the table name is teacher
CREATE TABLE courses (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    name varchar(30),
    teachers_id integer,
    total_students integer
    );
    
--  
INSERT INTO courses (name, teachers_id, total_students)
    VALUES  ('Calculus', 2, 20),
            ('Physics', 2, 10),
            ('Calculus', 1, 30),
            ('Computer Science', 1, 20),
            ('Politic', 13, 15),
            ('Algebra', 2, 10),
            ('Algebra', 13, 30),
            ('Computer Science', 10, 35),
            ('Life Science', 11, 20),
            ('Chemistry', 9, 22),
            ('Chemistry', 8, 16),
            ('Calculus', 5, 19),
            ('Politic', 4, 17),
            ('Biology', 6, 22),
            ('Physics', 3, 29),
            ('Biology', 8, 28),
            ('Calculus', 12, 34),
            ('Physics', 13, 34),
            ('Biology', 14, 25),
            ('Calculus', 15, 20);

--SELECT * FROM courses
select *
from teachers
JOIN courses on teachers.id=courses.teachers_id
where(courses.name, teachers.salary)
in (
  SELECT courses.name, MAX(teachers.salary)
  FROM teachers
  JOIN courses on teachers.id=courses.teachers_id
  GROUP BY courses.name
  )
  ORDER by courses.name ASC
