# while DECIMAL is exact and the decimal point is static, it is also precise.
# FLOAT's can store much larger numbers, but at the cost of loss of precision beyond 7 digits
# DOUBLE's can store large numbers the same as FLOAT's but only lose precision beyond 15 digits as the cost of double the storage consumption
# Always default to decimal unless precission is not important

CREATE DATABASE numbers;
USE numbers;


CREATE TABLE thingies (price FLOAT);
 
INSERT INTO thingies(price) VALUES (88.45);
 
SELECT * FROM thingies;
 
INSERT INTO thingies(price) VALUES (8877.45);
 
SELECT * FROM thingies;
 
INSERT INTO thingies(price) VALUES (8877665544.45);
 
SELECT * FROM thingies;


DROP DATABASE numbers;