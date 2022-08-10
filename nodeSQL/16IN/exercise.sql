# We have data in our database, now lets play with it to get familiarised
USE join_us;

# Exercise 1: Find the earliest date a user joined, format (month day(nd) year)
SELECT DATE_FORMAT(created_at, "%b %D %Y") AS earliest_date FROM users
ORDER BY created_at
LIMIT 1;

# Exercise 2: Find the email of the earliest user
SELECT email, created_at FROM users 
ORDER BY created_at
LIMIT 1;
# while mine works, the instructor instead did...
# SELECT * FROM users 
# WHERE created_at = (SELECT Min(created_at) FROM users); 

# Exercise 3: Count users according to the month they joined, order DESC by count
SELECT 
  MONTHNAME(created_at) AS month, 
  COUNT(*) AS count 
FROM users
GROUP BY month
ORDER BY count DESC;

# Exercise 4: Count the number of users using Yahoo emails
SELECT COUNT(*) FROM users WHERE email LIKE "%@yahoo.com";

# Exercise 5: Calculate total users for each email host
SELECT 
  CASE
    WHEN email LIKE "%@gmail.com" THEN "gmail"
	WHEN email LIKE "%@yahoo.com" THEN "yahoo"
	WHEN email LIKE "%@hotmail.com" THEN "hotmail"
    ELSE "other"
  END AS provider,
COUNT(*) AS total_users
FROM users
GROUP BY provider
ORDER BY total_users DESC;