# let's build our database and tables
SOURCE 12OTM/relationJoin.sql

# how could we combine these?
SELECT * FROM cart WHERE user_id = 1;
SELECT * FROM users WHERE last_name = "George";

# we could do this.... but...
SELECT * FROM cart WHERE user_id = (
    SELECT id FROM users WHERE last_name = "George"
); # it's a bit of a messy way of doing things, and doesn't do what we want anyways

# we can CROSS JOIN tables like this
SELECT * FROM users, cart; # this shoves every possible combination together
# while this is kinda useless, it's a start

# we could clean this up by comparing our stored id's
SELECT * FROM users, cart WHERE users.id = cart.user_id;
# table.category is necessary in many cases, and it's good practice to always use it **

# this is an IMPLICIT INNER JOIN
SELECT first_name, last_name, cart_date, amount 
FROM users, cart WHERE users.id = cart.user_id;
# it's essentially a Venn diagram, where the only information we gather is what matches our conditions

# there is an EXPLICIT way to JOIN our tables that is considered better syntax
SELECT first_name, last_name, cart_date, amount 
FROM users INNER JOIN cart
    ON users.id = cart.user_id;
# INNER is not necessary, and is implied if only JOIN is used
    
# does order matter?
SELECT * 
FROM cart JOIN users
    ON users.id = cart.user_id;
# yes, and no. The data will be the same, but the order it's presented will be flipped
# this is assuming that you don't specify what you want your table to output

# let's get fancy
SELECT first_name, last_name, cart_date, amount 
FROM users JOIN cart
    ON users.id = cart.user_id
ORDER BY cart_date;
# there's nothing inherently special about these tables that would prevent our earlier query magic

# who is our biggest spender?, and let's clean the data
SELECT 
    CONCAT(first_name, " ", last_name) AS users_name, 
    SUM(amount) AS total_spent 
FROM users JOIN cart
    ON users.id = cart.user_id
GROUP BY cart.user_id
ORDER BY total_spent DESC;

#--LEFT JOINS--#
# while INNER JOINs are the most common there are other JOIN options

# so what's LEFT JOIN?, well it SELECTs EVERYTHING from left table and tries to match with the second
SELECT first_name, last_name, cart_date, amount 
FROM users LEFT JOIN cart
    ON users.id = cart.user_id;
# where there is no match, it will fill in NULL
# this can be used to check user spendings and gift coupons to both our highest spenders and those who haven't spent

# in some cases it would be nice to display a value rather than NULL, so how do we do that?
# we could do case statements like; SUM(amount) IS NULL THEN(0), or...
SELECT 
    CONCAT(first_name, " ", last_name) AS users_name, 
    IFNULL(SUM(amount), 0) AS total_spent
FROM users LEFT JOIN cart
    ON users.id = cart.user_id
GROUP BY users.id
ORDER BY total_spent;

#--RIGHT JOINS--#
# RIGHT JOINs are left joins but backwards

# currently we have no cart information that doesn't correspond to a user
SELECT * 
FROM users RIGHT JOIN cart
    ON users.id = cart.user_id;
# this means that right now our RIGHT JOIN is identical to our INNER JOIN

# say, however, that our database gets messed up and we lose important information 
/*
DELETE FROM users WHERE id = 1; actually, this doesn't work, due to our Foreign Key in the Cart table
we similarly cannot "DROP TABLE users;" because our cart relies on data in our users table
*/
# so to demonstrate faulty data lets...
CREATE TABLE catr (
	id INT AUTO_INCREMENT PRIMARY KEY,
    cart_date DATE,
    amount DECIMAL(8,2),
    user_id INT
);
INSERT INTO catr (cart_date, amount, user_id)
VALUES ('2016/02/10', 99.99, 1),
       ('2017/11/11', 35.50, 1),
       ('2014/12/12', 800.67, 2),
       ('2015/01/03', 12.50, 2),
       ('1999/04/11', 450.25, 5),
       (CURDATE(), 23.45, 45),
       (CURDATE(), 777.77, 109);
       
SELECT * 
FROM users RIGHT JOIN catr
    ON users.id = catr.user_id;
# this is really useful for finding orphan data

# let's clean up the NULL's our orphan data is giving us
SELECT 
    CONCAT(IFNULL(first_name,"MISSING "), IFNULL(last_name,"USER")) AS users_name,
    SUM(amount) AS total_spent 
FROM users RIGHT JOIN catr
    ON users.id = catr.user_id
GROUP BY first_name, last_name
ORDER BY total_spent;

# we are done with our faulty table, so let's make sure to clean up after ourselves
DROP TABLE catr;

# so, we had some issues trying to delete data earlier, let's see how it's done.
DROP TABLE cart;
#--ON DELETE CASCADE--#
# when we create our table, set ON DELETE CASCADE
CREATE TABLE cart(
    id INT AUTO_INCREMENT PRIMARY KEY,
    cart_date DATE,
    amount DECIMAL(8,2),
    user_id INT,
    FOREIGN KEY(user_id) REFERENCES users(id) ON DELETE CASCADE
); # important bit here ----------------------^^^^^^^^^^^^^^^^^
INSERT INTO cart (cart_date, amount, user_id)
VALUES ('2016/02/10', 99.99, 1),
       ('2017/11/11', 35.50, 1),
       ('2014/12/12', 800.67, 2),
       ('2015/01/03', 12.50, 2),
       ('1999/04/11', 450.25, 5);

# we can see that all our data is here, but now...
SELECT *
FROM users JOIN cart
    ON users.id = cart.user_id;
# we can delete a user without running an error, and more interestingly
DELETE FROM users WHERE id = 1;
# all the data in cart that referenced the now missing user has been deleted as well
SELECT * FROM cart;

# well, we don't need this database anymore so...
DROP DATABASE interrelated;

# RIGHT and LEFT JOINs differ only in which of the two inputted tables have priority
# this means that SELECT * FROM cart LEFT JOIN users ON 'compare', is functionally identical to
#				  SELECT * FROM users RIGHT JOIN cart ON 'compare'