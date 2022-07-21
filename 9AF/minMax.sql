# SELECT MIN(released_year) FROM books;

# SELECT MAX(released_year) FROM books;

# SELECT MIN(pages) FROM books;

# SELECT MAX(pages) FROM books;

# SELECT MAX(pages), title FROM books;

# # SUBQUERIES, a problem with MinMax

# SELECT * FROM books WHERE pages = (SELECT MIN(pages) FROM books);

# SELECT title, pages FROM books WHERE pages=(SELECT MAX(pages) FROM books);

# SELECT * FROM books ORDER BY pages ASC LIMIT 1;

# SELECT title, pages FROM books ORDER BY pages DESC LIMIT 1;

# # Using Min and Max with Group By

# SELECT author_fname, author_lname, MIN(released_year) FROM books GROUP BY author_lname, author_fname;

# SELECT author_fname, author_lname, MAX(pages) FROM books GROUP BY author_lname, author_fname;

SELECT CONCAT(author_fname," ",author_lname) AS Author, MAX(pages) AS "Longest Book" FROM books GROUP BY author_lname, author_fname;