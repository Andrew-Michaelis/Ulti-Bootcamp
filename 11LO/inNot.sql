# we are back to using books, so...
source book_data.sql;

# IN is used to condense basic OR opperations, the two SELECTs below are functionally the same
SELECT title, author_lname FROM books
WHERE author_lname='Carver' OR
      author_lname='Lahiri' OR
      author_lname='Smith';
SELECT title, author_lname FROM books
WHERE author_lname IN ('Carver', 'Lahiri', 'Smith');
 
SELECT title, released_year FROM books WHERE released_year IN (2017, 1985);
 
# IN gets more useful when trying to exclude options from a search, the two SELECTs below are functionally the same
SELECT title, released_year FROM books
WHERE released_year != 2000 AND
      released_year != 2002 AND
      released_year != 2004 AND
      released_year != 2006 AND
      released_year != 2008 AND
      released_year != 2010 AND
      released_year != 2012 AND
      released_year != 2014 AND
      released_year != 2016;
SELECT title, released_year FROM books
WHERE released_year NOT IN (2000,2002,2004,2006,2008,2010,2012,2014,2016);
 
# With the use of AND you can set control values then further filter
SELECT title, released_year FROM books
WHERE released_year >= 2000
AND released_year NOT IN (2000,2002,2004,2006,2008,2010,2012,2014,2016);

# quick tangent
# this isn't always the strongest option, like in the cases below where the modulus calculation is much easier
SELECT title, released_year FROM books
WHERE released_year >= 2000 
AND released_year % 2 != 0;

SELECT title, released_year FROM books
WHERE released_year >= 2000 AND
released_year % 2 != 0 ORDER BY released_year;

DROP DATABASE bookshop;