# let's start by making sure we have data to work with
SOURCE 14IDC/schemaIntro.sql;
# that's done, now let's PLAY WITH DATA! Yay!

# Challenge One: Find the 5 oldest users.
SELECT 
    CONCAT(id,":",username) AS user,
    DATE_FORMAT(created_at, "%M %d, %Y at %h:%s") AS date_registered #I decided to get fancy
FROM users ORDER BY created_at LIMIT 5;

# Challenge Two: What day of the week do most users register on? We need to figure out an ad schedule
SELECT 
	DAYNAME(created_at) AS day, 
    COUNT(*) AS created
FROM users 
GROUP BY day
ORDER BY created DESC
LIMIT 2;

# Challenge Three: Find the users who have never posted a photo
SELECT username
FROM users LEFT JOIN photos
    ON users.id = photos.user_id
WHERE photos.id IS NULL;