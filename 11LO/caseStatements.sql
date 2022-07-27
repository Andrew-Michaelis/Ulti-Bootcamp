# we are back to using books, so...
source book_data.sql;

# CASE allows basic if/else in your SQL queries.

# if released >= 2000 " " else " "
SELECT title, released_year,
       CASE 
         WHEN released_year >= 2000 THEN 'Modern Lit'
         ELSE '20th Century Lit'
       END AS GENRE -- AS does alliasing, not necessary, but really really prefered
FROM books;

# you can stack conditions
SELECT title, stock_quantity,
    CASE 
        WHEN stock_quantity BETWEEN 0 AND 50 THEN '*'
        WHEN stock_quantity BETWEEN 51 AND 100 THEN '**'
        ELSE '***'
    END AS STOCK
FROM books;

# simplified, doesn't show stock amount as a number
# SELECT title,
#     CASE 
#         WHEN stock_quantity BETWEEN 0 AND 50 THEN '*'
#         WHEN stock_quantity BETWEEN 51 AND 100 THEN '**'
#         ELSE '***'
#     END AS STOCK
# FROM books;

# simplified, execution order allows some sneaky math options. Ordered because I can
SELECT title, stock_quantity,
    CASE 
        WHEN stock_quantity <= 50 THEN '*'
        WHEN stock_quantity <= 100 THEN '**'
        ELSE '***'
    END AS STOCK
FROM books ORDER BY stock_quantity; 

DROP DATABASE bookshop;