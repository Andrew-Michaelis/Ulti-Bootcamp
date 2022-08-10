# DECIMAL can store numbers a set distance beyond the decimal point
# DECIMAL(5, 2) can store max 5 digits with 2 digits beyond the decimal, eg. 999.99
# maximum DECIMAL is DECIMAL(65, 30)

CREATE DATABASE numbers;
USE numbers


CREATE TABLE items (price DECIMAL(5,2));

INSERT INTO items(price) VALUES(7);
 
INSERT INTO items(price) VALUES(7987654); #beyond max, just stores largest possible
 
INSERT INTO items(price) VALUES(34.88);
 
INSERT INTO items(price) VALUES(298.9999); #we specified rounding to two decimals
 
INSERT INTO items(price) VALUES(1.9999);
 
SELECT * FROM items;


DROP DATABASE numbers;