Basic SQL

# Database Commands
SHOW DATABASES;
CREATE DATABASE <name>;
DROP DATABASE <name>;
USE <databasename>;    # Use specific database
SELECT database();      # Show currently using database


# Tables Commands
SHOW TABLES;

CREATE TABLE tablename
(
 column_name data_type,
 column_name data_type
 );

i.e.

CREATE TABLE cats
(
 name VARCHAR(100),
 age INT
 );


SHOW COLUMNS FROM <tablename>;

or

DESC <tablename>;

i.e.

SHOW COLUMNS FROM cats;

DROP TABLE <tablename>;


# Data Management

### Insert: Adding data to your tables
INSERT INTO <tablename>(column_01, column_02) VALUES (col_01_value, col_02_value);

ex01)

INSERT INTO cats(name, age) VALUES ('Jetson', 7);
INSERT INTO cats(name, age) VALUES ('Charlie', 10), ('Sadie', 3), ('Lazy Bear', 1);

SHOW WARNINGS           # when you see a sign of warning count


### Allowing Null as value or NOT allowing Null as value
CREATE TABLE cats2
(
     name VARCHAR(100) NOT NULL,
     age INT NOT NULL
);

### Set Default Values
CREATE TABLE cats3
(
     name VARCHAR(100) DEFAULT 'unnamed',
     age INT DEFAULT 99
);


### NOT NULL and DEFAULT specified
CREATE TABLE cats4
(
     name VARCHAR(100) NOT NULL DEFAULT 'unnamed',
     age INT NOT NULL DEFAULT 99
);

### Primary Keys - A Unique Identifer
CREATE TABLE unique_cats
(
     cat_id INT NOT NULL,
     name VARCHAR(100),
     age INT,
     PRIMARY KEY (cat_id)
);


    ** Make it automatic =- AUTO_INCREMENT

CREATE TABLE unique_cats2
(
     cat_id INT NOT NULL AUTO_INCREMENT,
     name VARCHAR(100),
     age INT,
     PRIMARY KEY (cat_id)
);

i.e.

CREATE TABLE employees 
(
    id INT AUTO_INCREMENT NOT NULL,
    first_name VARCHAR(255) NOT NULL,
    last_name VARCHAR(255) NOT NULL,
    middle_name VARCHAR(255),
    age INT NOT NULL,
    current_status VARCHAR(255) NOT NULL DEFAULT 'employed',
    PRIMARY KEY(id)
);


# CRUD

### Selecting a specific column
SELECT name FROM cats;
SELECT age FROM cats;
SELECT name, age FROM cats;

* order counts

### WHERE clause to get specific
SELECT * FROM cats WHERE age=4;
SELECT * FROM CATS WHERE name='Egg';

* case-insensitive

### Aliases
SELECT cat_id AS id, name FROM cats;

### Update
UPDATE <tablename> SET <key>=<value> where <key>=<value>
UPDATE cats SET breed='Shorthair' WHERE breed='Tabby';
UPDATE cats SET age=14 WHERE name='Misty';

* try SELECT and then UPDATE

### Delete
DELETE FROM cats WHERE name="Egg";
DELETE FROM cats WHERE age=4;


# String Function

source file_name.sql

### CONCAT
CONCAT(column, another_column);
CONCAT(auther_fname, ' ', auther_lname);
SELECT CONCAT('Hello', '...', 'WORLD');
SELECT CONCAT(author_fname, ' ', author_lname) FROM books;
SELECT CONCAT(author_fname, ' ', author_lname) AS 'full name' FROM books;
SELECT author_fname AS first, author_lname AS last, CONCAT(author_fname, ', ', author_lname) AS full FROM books;

### CONCAT_WS - concat with separator
SELECT CONCAT_WS(' - ', title, author_fname, author_lname) FROM books;


### SUBSTRING - work with parts of strings
SELECT SUBSTRING('Hello WORLD', 1, 4);  # Hell
SELECT SUBSTRING('Hello World', 7);     # World
SELECT SUBSTRING('Hello World', -3);    # rld
SELECT SUBSTRING(title, 1, 10) AS 'short title' FROM books;

* SUBSTR() also works


### CONCAT + SUBSTRING
SELECT CONCAT(SUBSTRING(title, 1, 10), '...') AS 'short title' FROM books;


### REPLACE - replace parts of strings
SELECT REPLACE('Hello World', 'Hell', '%$&@');
SELECT REPLACE('cheese bread coffee milk', ' ', ' and ');
SELECT REPLACE(title, 'e', '3') FROM books;

* case sensitive

### SUBSTRING + REPLACE
SELECT
    SUBSTRING(REPLACE(title, 'e', '3'), 1, 10)
FROM books;


### REVERSE
SELECT REVERSE('Hello World');
SELECT CONCAT(author_fname, REVERSE(author_fname)) FROM books;


### CHAR_LENGTH
SELECT CHAR_LENGTH('Hello World');      # 11
SELECT author_lname, CHAR_LENGTH(author_lname) AS 'length' from books;
SELECT CONCAT(author_lname, ' is ', CHAR_LENGTH(author_lname), ' characters long') FROM books;

### UPPER() and LOWER()
SELECT UPPER('Hello World');
SELECT CONCAT('My favorite book is ', UPPER(title)) FROM books;


* Just one query
SELECT CONCAT(SUBSTR(title, 1, 10), '...') AS "short title", CONCAT(author_lname, ",", author_fname) AS "author", CONCAT(stock_quantity, " in stock") AS "quantity" FROM books;


# Refining Selections

### DISTINCT - NOT print out redundant items multiple times
SELECT DISTINCT author_lname FROM books;
SELECT DISTINCT author_lname, author_fname FROM books;

### ORDER BY - sorting our results (DESC/ASC)
SELECT author_lname FROM books ORDER BY author_lname DESC;
SELECT title, pages FROM books ORDER BY released_year;
SELECT title, author_fname, author_lname FROM books ORDER BY 2;         * 2 stands for the 'second' selected item, author_fname
SELECT author_fname, author_lname FROM books ORDER BY author_lname, author_fname;       * second item for ORDER BY will come  to effect when first column items are overlapping

### LIMIT - get only specified number of items
SELECT title, released_year FROM books ORDER BY released_year DESC LIMIT 10;
SELECT title, released_year FROM books ORDER BY released_year DESC LIMIT 10, 1;         * gives one 11th item
