/* we've been working with simple tables, lets expand!
Real World Data is messy and interrelated, how do we deal with this?
Well, to start, lets build more tables into our database.
Now how do we get these tables to talk to eachother? Insert Relationships
Relationships can be three different types,
One-to-One relationship is uncommon; one customer to one customer details table
One-to-Many relationship is most common; one book to a table of reviews
Many-to-Many relationship is relatively common; a book can have many authors, authors can have many books

One-to-Many, the basics:
--User and Cart--
User: name
User: email
Cart: purchase date
Cart: purchase price
--While we could use a single large table to keep this information, it will often result in duplicate data
by seperating the tables we can keep our data load smaller and more readable.
keeping the users seperate also allows us to access user information without needlessly getting their cart info
the way to make information tables relate to eachother is to have a common variable--
User: user_id ***
User: fname
User: lname
User: email
Cart: cart_id
Cart: cart_date
Cart: amount
Cart: user_id ***
--this allows data to be kept much cleaner and easier to use as well
the key way this works is through the use of Primary Key in each table
Primary Keys are always unique, Foreign Keys are Primary Keys from another table, typically used to refer */

# LETS PUT THIS INTO PRACTICE!
CREATE DATABASE interrelated;
USE interrelated;

CREATE TABLE users(
    id INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(100),
    last_name VARCHAR(100),
    email VARCHAR(100)
);
CREATE TABLE cart(
    id INT AUTO_INCREMENT PRIMARY KEY,
    cart_date DATE,
    amount DECIMAL(8,2),
    user_id INT,
    FOREIGN KEY(user_id) REFERENCES users(id)
); #FOREIGN KEY prevents cart table from creating arbitrary id's that reference nothing

INSERT INTO users (first_name, last_name, email) 
VALUES ('Boy', 'George', 'george@gmail.com'),
       ('George', 'Michael', 'gm@gmail.com'),
       ('David', 'Bowie', 'david@gmail.com'),
       ('Blue', 'Steele', 'blue@gmail.com'),
       ('Bette', 'Davis', 'bette@aol.com');
       
INSERT INTO cart (cart_date, amount, user_id)
VALUES ('2016/02/10', 99.99, 1),
       ('2017/11/11', 35.50, 1),
       ('2014/12/12', 800.67, 2),
       ('2015/01/03', 12.50, 2),
       ('1999/04/11', 450.25, 5);