# Basic SQL

## Database Commands
SHOW DATABASES;

CREATE DATABASE <name>;

DROP DATABASE <name>;

USE <database name>;    # Use specific database

SELECT database();      # Show currently using database


## Tables Commands

- Columns (|) and Rows (--)
- Databases are made up of lots of tables.
- Data Types are **Important** (So many different types. Look them up!)
  + Numeric Types, String Types, Date Types, etc.
  + i.e. int, varchar(max num char)

CREATE TABLE Tweets(
    username varchar(15)
    content varchar(140)
    favorites int
)

