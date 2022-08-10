SELECT COUNT(*) FROM books;

SELECT released_year, COUNT(*) FROM books GROUP BY released_year;

SELECT SUM(stock_quantity) AS "Books In Stock" FROM books;

SELECT author_fname, author_lname, AVG(released_year) FROM books GROUP BY author_lname, author_fname;

SELECT CONCAT(author_fname," ",author_lname) AS "Full Name" FROM books ORDER BY pages DESC LIMIT 0, 1;

SELECT released_year AS year, COUNT(*) AS "# books", AVG(pages) AS "avg pages" FROM books GROUP BY released_year;