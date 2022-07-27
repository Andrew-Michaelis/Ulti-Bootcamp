# we are back to using books, so...
source book_data.sql;

# BETWEEN is functionally the use of '>','<',and 'AND' to find everything between a range of values

# these two are functionally identical, BETWEEN is inclusive by default
SELECT title, released_year FROM books WHERE released_year >= 2004 && released_year <= 2015;
SELECT title, released_year FROM books WHERE released_year BETWEEN 2004 AND 2015;
# NOT BETWEEN is self explanatory
SELECT title, released_year FROM books 
WHERE released_year NOT BETWEEN 2004 AND 2015;

# CAST() allows datatype conversion, when using BETWEEN it's best to make sure your datatypes match through use of CAST()
SELECT CAST('2017-05-02' AS DATETIME);

DROP DATABASE bookshop;


source testingDB.sql;
 
SELECT name, birthdt FROM people WHERE birthdt BETWEEN '1980-01-01' AND '2000-01-01';
 
SELECT name, birthdt FROM people
WHERE birthdt 
BETWEEN CAST('1980-01-01' AS DATETIME)
    AND CAST('2000-01-01' AS DATETIME);

DROP DATABASE dateTime;