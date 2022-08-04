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

# Challenge Four: Identify the user with the individual photo which has the most likes
SELECT 
	username, 
    COUNT(*) AS likes,
    photos.id AS photo_id
FROM photos JOIN likes
    ON photos.id = likes.photo_id
JOIN users
    ON photos.user_id = users.id
GROUP BY photos.id
ORDER BY likes DESC
LIMIT 1;

# Challenge Five: Find how many times a user posts on average, avg photos per user
SELECT
    (SELECT COUNT(*) FROM photos) / (SELECT COUNT(*) FROM users) AS "AVG";
    
# Challenge Six: What are the top 5 most commonly used hashtags?
SELECT
    tags.tag_name,
    COUNT(*) AS uses
FROM tags JOIN photo_tags
    ON tags.id = photo_tags.tag_id
GROUP BY tags.id
ORDER BY uses DESC
LIMIT 5;

# Challenge Seven: A problem with bots, find users who have liked every photo on the site
SELECT 
	username, 
	Count(*) AS num_likes 
FROM users INNER JOIN likes 
	ON users.id = likes.user_id 
GROUP  BY likes.user_id 
HAVING num_likes = (SELECT Count(*) FROM   photos);