# DATE stores date with no time, "YYYY-MM-DD" format
# TIME stores time with no date, "HH:MM:SS" format
# DATETIME stores both values, usually the most useful, "YYYY-MM-DD HH:MM:SS" format

source testingDB.sql;
 
SELECT * FROM people;

# CURDATE, CURTIME, & NOW
# CURDATE() gives current date
# CURTIME() gives current time
# NOW() gives current datetime

INSERT INTO people (name, birthdate, birthtime, birthdt) 
VALUES ("Susan", CURDATE(), CURTIME(), NOW());

# Formatting datetime
# There are a LOT of date and time funcitons. You usually won't need most, some useful ones are...

SELECT name, birthdate FROM people;
# DAY() extracts the day from the date data
SELECT name, DAY(birthdate) FROM people;
SELECT name, birthdate, DAY(birthdate) FROM people;
# DAYNAME() shows the day of the week the day represents (Sunday-Saturday)
SELECT name, birthdate, DAYNAME(birthdate) FROM people;
# DAYOFWEEK() shows the day of the week the day represents (1-7)
SELECT name, birthdate, DAYOFWEEK(birthdate) FROM people;
# DAYOFYEAR() shows the day of the year the day represents (1-365)
SELECT name, birthdate, DAYOFYEAR(birthdate) FROM people;
# Trying to pull date information from a time formatted variable will fail to fetch values, but will still function
SELECT name, birthtime, DAYOFYEAR(birthtime) FROM people;
# datetime variables have both date and time information and can be formatted as such
SELECT name, birthdt, DAYOFYEAR(birthdt) FROM people;
# MONTH() shows which month of the year the month represents (1-12)
SELECT name, birthdt, MONTH(birthdt) FROM people;
# MONTHNAME() shows which month of the year the month represents (January-December)
SELECT name, birthdt, MONTHNAME(birthdt) FROM people;
# HOUR() and MINUTE() give the hour and minute from time information
SELECT name, birthtime, HOUR(birthtime) FROM people;
SELECT name, birthtime, MINUTE(birthtime) FROM people;
# CONCAT() can help make the information more human readable with help from above functions
SELECT CONCAT(MONTHNAME(birthdate), " ", DAY(birthdate), " ", YEAR(birthdate)) FROM people;
# DATE_FORMAT allows you to format datetime information according to specifiers, view spreadsheets for modifiers
# following gives weekday in english
SELECT DATE_FORMAT(birthdt, "Was born on a %W") FROM people;
# following gives month/day/YEAR in "mm/dd/YYYY" format
SELECT DATE_FORMAT(birthdt, "%m/%d/%Y") FROM people;
# following gives month/day/YEAR h/i in "mm/dd/YYYY at h:i" format, i represents minute
SELECT DATE_FORMAT(birthdt, "%m/%d/%Y at %h:%i") FROM people;

# Date Math
# doing math operations on date information can turn out awful and is a pain to code
# good thing other people have done it for us.

SELECT * FROM people;
# DATEDIFF(x,y) shows the difference in days between "x" and "y"
SELECT DATEDIFF(NOW(), birthdate) FROM people;
SELECT name, birthdate, DATEDIFF(NOW(), birthdate) FROM people;
SELECT birthdt FROM people;
# DATEADD(x,y) will show date "x" modified by the choosen interval "y"
SELECT birthdt, DATE_ADD(birthdt, INTERVAL 1 MONTH) FROM people;
SELECT birthdt, DATE_ADD(birthdt, INTERVAL 10 SECOND) FROM people;
SELECT birthdt, DATE_ADD(birthdt, INTERVAL 3 QUARTER) FROM people;
# DATEADD(x,y) can be shortcut with math operations
SELECT birthdt, birthdt + INTERVAL 1 MONTH FROM people;
SELECT birthdt, birthdt - INTERVAL 5 MONTH FROM people;
SELECT birthdt, birthdt + INTERVAL 15 MONTH + INTERVAL 10 HOUR FROM people;

# Timestamps
# generic term for "storing information about upload or update"
# is also a datatype
# TIMESTAMP stores the same data as DATETIME but is limited from 1970-2038
# TIMESTAMPs' main purpose is that it takes half the storage space of DATETIME

CREATE TABLE comments (content VARCHAR(100), created_at TIMESTAMP DEFAULT NOW());
INSERT INTO comments (content) VALUES('lol what a funny article');
INSERT INTO comments (content) VALUES('I found this offensive');
INSERT INTO comments (content) VALUES('Ifasfsadfsadfsad');
SELECT * FROM comments ORDER BY created_at DESC;
# using ON UPDATE changes the field as specified when the row containing it is updated
CREATE TABLE comments2 (content VARCHAR(100), changed_at TIMESTAMP DEFAULT NOW() ON UPDATE CURRENT_TIMESTAMP);
INSERT INTO comments2 (content) VALUES('dasdasdasd');
INSERT INTO comments2 (content) VALUES('lololololo');
INSERT INTO comments2 (content) VALUES('I LIKE CATS AND DOGS');
UPDATE comments2 SET content='THIS IS NOT GIBBERISH' WHERE content='dasdasdasd';
SELECT * FROM comments2;
SELECT * FROM comments2 ORDER BY changed_at;
# you can also use NOW() instead of CURRENT_TIMESTAMP
# CREATE TABLE comments3 (content VARCHAR(100), changed_at TIMESTAMP DEFAULT NOW() ON UPDATE NOW());

DROP DATABASE dateTime;