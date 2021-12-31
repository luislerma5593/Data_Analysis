# SQL Functions

### Basic
```sql
SHOW DATABASES - Show DB available
SHOW TABLES - Show tables available
SHOW COLUMNS - Show columns available
SELECT DISTINCT country - To get all unique values for a column
SELECT CONCAT(a, ', ' , b) FROM - Concatenate strings
UPPER(Name) - Comverts string to upercase
LOWER(Name) - Converts string to lowercase
SQRT() - Square root
AVG() - Avergae
UNION - Combines multiple datasets into a single dataset, and removes any existing duplicates.
UNION ALL - Combines multiple datasets into one dataset, but does not remove duplicate rows.
```

### Insert data
```sql
INSERT INTO table_name
VALUES (value1, value2, value3,...);
```

### Update data
```sql
UPDATE table_name
SET column1=value1, column2=value2, ...
WHERE condition;

# Example
UPDATE company
SET salary = salary*1.2
WHERE rating > 5;
```

### Delete data
```sql
DELETE FROM table_name
WHERE condition; 
```

### Create table
```sql
CREATE TABLE ​table_name
(
column_name1 data_type(size),
column_name2 data_type(size),
column_name3 data_type(size),
....
columnN data_type(size)
)

# Example
CREATE TABLE Users (
id int NOT NULL AUTO_INCREMENT,
username varchar(40) NOT NULL, 
password varchar(10) NOT NULL,
PRIMARY KEY(id)
);
```

### Data Types
```sql
Data types specify the type of data for a particular column.

If a column called "LastName" is going to hold names, then that particular column should have a "varchar" (variable-length character) data type.
The most common data types:
Numeric
INT -A normal-sized integer that can be signed or unsigned.
FLOAT(M,D) - A floating-point number that cannot be unsigned. You can optionally define the display length (M) and the number of decimals (D).
DOUBLE(M,D) - A double precision floating-point number that cannot be unsigned. You can optionally define the display length (M) and the number of decimals (D).

Date and Time
DATE - A date in YYYY-MM-DD format.
DATETIME - A date and time combination in YYYY-MM-DD HH:MM:SS format.
TIMESTAMP - A timestamp, calculated from midnight, January 1, 1970
TIME - Stores the time in HH:MM:SS format.

String Type
CHAR(M) - Fixed-length character string. Size is specified in parenthesis. Max 255 bytes.
VARCHAR(M) - Variable-length character string. Max size is specified in parenthesis.
BLOB - "Binary Large Objects" and are used to store large amounts of binary data, such as images or other types of files.
TEXT - Large amount of text data.
```

### Modify a table
```sql
ALTER TABLE People ADD DateOfBirth date - Add column to a table
ALTER TABLE People RENAME FirstName TO name - Rename a column in a table
RENAME TABLE ​People TO Users - Rename a table
```

### Dropping
```sql
ALTER TABLE People DROP COLUMN DateOfBirth - Delete column
DROP TABLE ​People - Drop table
```

### Modify table and update
```sql
ALTER TABLE cities ADD AttractivePlace varchar(100);

UPDATE cities
SET AttractivePlace = 'Belem Tower' WHERE name = 'Lisbon';
UPDATE cities
SET AttractivePlace = 'Plaza Mayor' WHERE name = 'Madrid';
UPDATE cities
SET AttractivePlace = 'Eiffel Tower' WHERE name = 'Paris';

SELECT * FROM cities;
```

### Views
```sql
CREATE VIEW view_name AS
SELECT column_name(s)
FROM table_name
WHERE condition;
```

### Create or replace View
```sql
CREATE OR REPLACE VIEW List AS
SELECT FirstName, LastName, Salary
FROM  Employees;
```

### Drop view
```sql
DROP VIEW ​List;
```

### Stored Procedures
```sql
CREATE DEFINER=`lldlt`@`%` PROCEDURE `insert_row`(IN a VARCHAR(1), IN b INT, IN c INT)
BEGIN
	INSERT INTO users2 (gender, age, occupation)
	VALUEs	(a,b,c);
	SELECT * FROM users2;
END

CALL insert_row("F",9, 2);
```

## Examples

### REGEX
```sql
SELECT DISTINCT(city) FROM station WHERE city REGEXP "^[aeiou]"
```
### Substract not null
```sql
SELECT count(*) - count(industry) AS missing FROM fortune500;
```
