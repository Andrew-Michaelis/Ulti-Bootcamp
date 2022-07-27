CREATE DATABASE exercise;
USE exercise;

# What's a good usecase for CHAR?
CREATE TABLE highscore (score INT, player CHAR(3));
INSERT INTO highscore (score, player) VALUES (1500, "ASM");
SELECT * FROM highscore;

# Fill in the blanks
CREATE TABLE inventory (item_name VARCHAR(50), price DECIMAL(8,2), quantity INT);
INSERT INTO inventory (item_name, price, quantity) VALUES ("banana", 12.39, 3);
SELECT * FROM inventory;

# What's the difference between DATETIME and TIMESTAMP?
# TIMESTAMP cannot record my grandfather's birthdate, but takes less storage space for more recent dates.
# This makes TIMESTAMP good for storing timestamps

CREATE TABLE ct (curDT TIMESTAMP);
INSERT INTO ct (curDT) VALUES (NOW());
# Print out the current time (but not date)
SELECT DATE_FORMAT(curDT, "%I:%i:%s %p") FROM ct;
# Print out the current date (but not time)
SELECT CONCAT(MONTHNAME(curDT), " ", DAY(curDT), " ", YEAR(curDT)) FROM ct;
# Print out the current weekday (number)
SELECT DAYOFWEEK(curDT) FROM ct;
# Print out the current weekday (name)
SELECT DAYNAME(curDT) FROM ct;
# Print out current day and time using mm/dd/yyyy format
SELECT DATE_FORMAT(curDT, "%m/%d/%Y %h:%i:%s") FROM ct;
# Print out current day and time using "January 2nd at 3:15" format
SELECT DATE_FORMAT(curDT, "%M %D at %l:%i") FROM ct;

# Create a tweets table that stores: Tweet content, username, time created
CREATE TABLE tweets (content VARCHAR(140), username VARCHAR(20), created_at TIMESTAMP DEFAULT NOW());
INSERT INTO tweets (content, username) VALUES ("First", "Personage");
SELECT * FROM tweets;

DROP DATABASE exercise;