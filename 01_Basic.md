# Basic SQL

## Database Commands
SHOW DATABASES;

CREATE DATABASE <name>;

DROP DATABASE <name>;

USE <databasename>;    # Use specific database

SELECT database();      # Show currently using database


## Tables Commands

- Create a table

CREATE TABLE tablename
(
    column_name data_type,
    column_name data_type
);

ex01)

CREATE TABLE cats 
(
    name VARCHAR(100),
    age INT
);


- Show columns

SHOW COLUMNS FROM <tablename>;

or 

DESC <tablename>;

ex01)

SHOW COLUMNS FROM cats;


- Deleteing Tables

DROP TABLE <tablename>;


## Data Management 

- Insert: Adding data to your tables

INSERT INTO <tablename>(column_01, column_02) VALUES (col_01_value, col_02_value);

ex01)

INSERT INTO cats(name, age) VALUES ('Jetson', 7);

- Multiple Insert

INSERT INTO cats(name, age) VALUES ('Charlie', 10), ('Sadie', 3), ('Lazy Bear', 1);

- Show warnings

SHOW WARNINGS           # when you see a sign of warning count


- Allowing Null as value or NOT allowing Null as value

CREATE TABLE cats2
(
    name VARCHAR(100) NOT NULL,
    age INT NOT NULL
);

- Set Default Values

CREATE TABLE cats3
(
    name VARCHAR(100) DEFAULT 'unnamed',
    age INT DEFAULT 99
);


- NOT NULL and DEFAULT specified

CREATE TABLE cats4
(
    name VARCHAR(100) NOT NULL DEFAULT 'unnamed',
    age INT NOT NULL DEFAULT 99
);

## Primary Keys - A Unique Identifer

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


