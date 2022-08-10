# both CHAR and VARCHAR store strings, so what's the difference?
# CHAR has a FIXED LENGTH, a char(3) will only store data that is exactly 3 characters long
# If you try and input a value lower than specified it will pad with spaces to the right which will be removed when retrieved
# CHAR is faster for fixed length text, like State Abbreviations (UT, CO) or binary inputs (M/F, Y/N)
# CHAR(4) will always take exactly 4 bytes of storage

CREATE DATABASE pound;
USE pound;


CREATE TABLE dogs (name CHAR(5), breed VARCHAR(10));
 
INSERT INTO dogs (name, breed) VALUES ('bob', 'beagle');
 
INSERT INTO dogs (name, breed) VALUES ('robby', 'corgi');
 
INSERT INTO dogs (name, breed) VALUES ('Princess Jane', 'Retriever');
 
SELECT * FROM dogs;
 
INSERT INTO dogs (name, breed) VALUES ('Princess Jane', 'Retrievesadfdsafdasfsafr');
 
SELECT * FROM dogs;


DROP DATABASE pound;