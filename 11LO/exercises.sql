# SELECT 10 != 10;
-- False, represented as a 0
# SELECT 15 > 14 && 99 - 5 <= 94;
-- True, represented as a 1
# SELECT 1 IN (5,3) || 9 BETWEEN 8 AND 10;
-- True, only the second condition is true, but OR matches as long as either matches

# we are back to using books, so...
source book_data.sql;

# Select all books written before 1980 (non inclusive)
SELECT * FROM books WHERE released_year < 1980;

# Select all books by Eggers or Chabon
SELECT * FROM books WHERE author_lname IN ("Eggers", "Chabon");

# Select all books written by Lahiri published after 2000
SELECT * FROM books WHERE author_lname = "Lahiri" AND released_year > 2000;

# Select all books with page counts between 100 and 200
SELECT * FROM books WHERE pages BETWEEN 100 AND 200;

# Select all books where author_lname starts with a "C" or an "S"
SELECT * FROM books WHERE author_lname LIKE "C%" OR author_lname LIKE "S%";
# could be done as "SELECT * FROM books WHERE SUBSTR(author_lname,1,1) IN ("C","S");

# SELECT title, author_lname, CASE the following under TYPE 
# if title contains "stories" -> Short Stories
# if title contains Just Kids OR A Heartbreaking Work -> Memoir
# else -> Novel
SELECT title, author_lname, 
	CASE 
    	WHEN title LIKE "%stories%" THEN "Short Stories"
        WHEN title LIKE "%Just Kids%" OR title LIKE "%A Heartbreaking Work%" THEN "Memoir"
        ELSE "Novel"
    END AS TYPE
FROM books;

# Bonus, make this happen
SELECT title, author_lname,
    CASE
    	WHEN COUNT(*) > 1 THEN CONCAT(COUNT(*), " books")
        ELSE "1 book"
    END AS COUNT
FROM books GROUP BY author_lname, author_fname;

DROP DATABASE bookshop;