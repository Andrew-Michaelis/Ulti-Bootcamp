# let's make ourselves a database to work with
CREATE DATABASE ex;
USE ex;

# now for the exercises,
# WRITE THIS SCHEMA: STUDENTS(id, first_name), PAPERS(title, grade, student_id(STUDENTS.id))
CREATE TABLE students(
    id INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(100)
);
CREATE TABLE papers(
    title VARCHAR(100),
    grade DECIMAL(5,2),
    student_id INT,
    FOREIGN KEY(student_id) REFERENCES students(id) ON DELETE CASCADE
);

# copy/pasta data into the tables
INSERT INTO students (first_name)
VALUES  ("Caleb"),
        ("Samantha"),
        ("Raj"),
        ("Carlos"),
        ("Lisa");
INSERT INTO papers (student_id, title, grade ) 
VALUES  (1, 'My First Book Report', 60),
        (1, 'My Second Book Report', 75),
        (2, 'Russian Lit Through The Ages', 94),
        (2, 'De Montaigne and The Art of The Essay', 98),
        (4, 'Borges and Magical Realism', 89);
        
# PRINT THIS (first_name, title, grade) putting the correct name to each item in papers, ORDER BY grade DESC
SELECT first_name, title, grade 
FROM students JOIN papers
    ON students.id = papers.student_id
ORDER BY grade DESC;

# PRINT THIS (above, but showing NULL scores for students who have submitted nothing), not ordered
SELECT first_name, title, grade 
FROM students LEFT JOIN papers
    ON students.id = papers.student_id;
    
# PRINT THIS (above, but NULLs are replaced by MISSING in title and 0 in grade)
SELECT 
	first_name, 
    IFNULL(title,"MISSING"), 
    IFNULL(grade,0) 
FROM students LEFT JOIN papers
    ON students.id = papers.student_id;
    
# PRINT THIS (first_name, average) ordered DESC by average score
SELECT
    first_name,
    IFNULL(AVG(grade),0) AS average
FROM students LEFT JOIN papers
    ON students.id = papers.student_id
GROUP BY students.id
ORDER BY average DESC;

# PRINT THIS (above, but with a new column denoting whether the student is passing or failing) passing >= 75
SELECT
    first_name,
    IFNULL(AVG(grade),0) AS average,
    CASE
    	WHEN AVG(grade) >= 75 THEN "PASSING"
        ELSE "FAILING"
    END AS passing_status
FROM students LEFT JOIN papers
    ON students.id = papers.student_id
GROUP BY students.id
ORDER BY average DESC;

DROP DATABASE ex;