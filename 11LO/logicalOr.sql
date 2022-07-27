# we are back to using books, so...
source book_data.sql;

# NOTE: || being used to represent logical or is being depreciated, use SQL OR operator

# if either conditions match, return information
SELECT title, author_lname, released_year FROM books
WHERE author_lname='Eggers' OR released_year > 2010;
 
# SELECT 40 <= 100 || -2 > 0;
# -- true
# SELECT 10 > 5 || 5 = 5;
# -- true
# SELECT 'a' = 5 || 3000 > 2000;
# -- true
 
SELECT title, author_lname, released_year, stock_quantity FROM books 
WHERE author_lname = 'Eggers' 
	OR released_year > 2010 
    OR stock_quantity > 100;

DROP DATABASE bookshop;