# we are back to using books, so...
source book_data.sql;

# equal will find exact values
SELECT title FROM books WHERE released_year = 2017;
# not equal will find anything not matched
SELECT title FROM books WHERE released_year != 2017;

SELECT title, author_lname FROM books; 
SELECT title, author_lname FROM books WHERE author_lname = 'Harris';
SELECT title, author_lname FROM books WHERE author_lname != 'Harris';

DROP DATABASE bookshop;