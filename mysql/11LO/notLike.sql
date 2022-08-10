# we are back to using books, so...
source book_data.sql;

SELECT title FROM books WHERE title LIKE 'W';
SELECT title FROM books WHERE title LIKE 'W%';
SELECT title FROM books WHERE title LIKE '%W%';
SELECT title FROM books WHERE title LIKE 'W%';
# NOT LIKE finds everything that doesn't match the string provided
SELECT title FROM books WHERE title NOT LIKE 'W%';

DROP DATABASE bookshop;