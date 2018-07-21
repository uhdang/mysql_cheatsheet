# Basic SQL

## Database Commands
SHOW DATABASES;

CREATE DATABASE <name>;

DROP DATABASE <name>;

USE <databasename>;    # Use specific database

SELECT database();      # Show currently using database


## Tables Commands

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


## Data Management

#### Insert: Adding data to your tables

INSERT INTO <tablename>(column_01, column_02) VALUES (col_01_value, col_02_value);

ex01)

INSERT INTO cats(name, age) VALUES ('Jetson', 7);

INSERT INTO cats(name, age) VALUES ('Charlie', 10), ('Sadie', 3), ('Lazy Bear', 1);

SHOW WARNINGS           # when you see a sign of warning count


#### Allowing Null as value or NOT allowing Null as value

CREATE TABLE cats2
(
     name VARCHAR(100) NOT NULL,
     age INT NOT NULL
);

#### Set Default Values

CREATE TABLE cats3
(
     name VARCHAR(100) DEFAULT 'unnamed',
     age INT DEFAULT 99
);


#### NOT NULL and DEFAULT specified

CREATE TABLE cats4
(
     name VARCHAR(100) NOT NULL DEFAULT 'unnamed',
     age INT NOT NULL DEFAULT 99
);

#### Primary Keys - A Unique Identifer

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


## CRUD

#### Selecting a specific column
SELECT name FROM cats;
SELECT age FROM cats;
SELECT name, age FROM cats;

* order counts

#### WHERE clause to get specific
SELECT * FROM cats WHERE age=4;
SELECT * FROM CATS WHERE name=Egg';

* case-insensitive

#### Aliases
SELECT cat_id AS id, name FROM cats;

#### Update
UPDATE <tablename> SET <key>=<value> where <key>=<value>
UPDATE cats SET breed='Shorthair' WHERE breed='Tabby';
UPDATE cats SET age=14 WHERE name='Misty';

* try SELECT and then UPDATE

#### Delete
DELETE FROM cats WHERE name="Egg";
DELETE FROM cats WHERE age=4;



