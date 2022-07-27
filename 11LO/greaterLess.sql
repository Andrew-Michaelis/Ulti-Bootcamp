# we are back to using books, so...
source book_data.sql;

# GREATER

SELECT title, released_year FROM books ORDER BY released_year;
SELECT title, released_year FROM books WHERE released_year > 2000 ORDER BY released_year;
SELECT title, released_year FROM books WHERE released_year >= 2000 ORDER BY released_year;
 
SELECT title, stock_quantity FROM books;
SELECT title, stock_quantity FROM books WHERE stock_quantity >= 100;
 
# will return boolean logic, either 1 for true or 0 for false
SELECT 99 > 1;
SELECT 99 > 567;

# 'a' > 'b'
# -- false
# 'A' > 'a'
# -- false
# 'A' >=  'a'
# -- true
 
# SQL is case insensitive, these all return the same result
SELECT title, author_lname FROM books WHERE author_lname = 'Eggers';
SELECT title, author_lname FROM books WHERE author_lname = 'eggers';
SELECT title, author_lname FROM books WHERE author_lname = 'eGGers';

# LESS

SELECT title, released_year FROM books;
SELECT title, released_year FROM books WHERE released_year < 2000;
SELECT title, released_year FROM books WHERE released_year <= 2000;
 
# will return boolean logic, either 1 for true or 0 for false
SELECT 3 < -10;
SELECT -10 < -9;
SELECT 42 <= 42; -- <= or >= will also include the value compared against
 
# SELECT 'h' < 'p';
# -- true
# SELECT 'Q' <= 'q';
# -- true

DROP DATABASE bookshop;