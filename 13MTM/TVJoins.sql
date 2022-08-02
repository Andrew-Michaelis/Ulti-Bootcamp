# First we need our database
SOURCE 13MTM/mtmBasics.sql

# Now let's do some stuff

# Exercise One: (title, rating) alphabetical by title, all ratings shown seperate, only rated shows.
SELECT title, rating
FROM series JOIN reviews
	ON series.id = reviews.series_id
ORDER BY title;

# Exercise Two: (title, AVG(rating)) order by AVG(rating) asc. Only rated
SELECT
	title,
    AVG(rating) AS avg_rating
FROM series JOIN reviews
	ON series.id = reviews.series_id
GROUP BY series.id
ORDER BY avg_rating;

# Exercise Three: (first_name, last_name, rating) no order, only rated
SELECT
	first_name,
    last_name,
    rating
FROM reviewers JOIN reviews
    ON reviewers.id = reviews.reviewer_id;
    
# Exercise Four: identify unreviewed series as (unreviewed_series)
SELECT
    title AS unreviewed_series
FROM series LEFT JOIN reviews
    ON series.id = reviews.series_id
WHERE rating IS NULL;

# Exercise Five: (genre, avg_rating) group by genre, alphabetical by genre 
# Optional: rating rounded to two decimals
SELECT 
    genre,
    ROUND(AVG(rating),2) AS avg_rating
FROM series JOIN reviews
    ON series.id = reviews.series_id
GROUP BY genre
ORDER BY genre;

# Exercise Six: (first_name, last_name, COUNT, MIN, MAX, AVG, STATUS(ACTIVE, INACTIVE)) grouped by reviewers.id
# special attention is paid that one reviewer has no reviews, STATUS(INACTIVE) and 0's in place of NULLs
# new syntax introduced: IF(bool,true,false) for use in place of CASE for boolean logical operations
# example of CASE for more options
SELECT
    first_name,
    last_name,
    COUNT(rating) AS "COUNT",
    IFNULL(MIN(rating),0) AS "MIN",
    IFNULL(MAX(rating),0) AS "MAX",
    ROUND(IFNULL(AVG(rating),0),2) AS "AVG",
    IF(rating, "ACTIVE", "INACTIVE") AS "STATUS",
    CASE
        WHEN COUNT(rating) >= 10 THEN "SUPER"
    	WHEN COUNT(rating) >= 1 THEN "ACTIVE"
        ELSE "INACTIVE"
    END AS "CASED"
FROM reviewers LEFT JOIN reviews
    ON reviewers.id = reviews.reviewer_id
GROUP BY reviewers.id;

# Exercise Seven: (title, rating, reviewer) alphabetical by title, only rated
# first example of three tables tied together
SELECT 
    title,
    rating,
    CONCAT(first_name, " ", last_name) AS reviewer
FROM reviews
INNER JOIN reviewers 
	ON reviewers.id = reviews.reviewer_id
INNER JOIN series 
	ON series.id = reviews.series_id
ORDER BY title;
# OK, so with how long this unit took to get to many-table interactions I was starting to get scared.
# that was almost entirely painless

# So I'm done with my TV rating app, let's drop the database
DROP DATABASE mtm;