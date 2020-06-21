# Oracle Joins

A join is a query that combines rows from two or more tables, views, or materialized views. Oracle Database performs a join whenever multiple tables appear in the FROM clause of the query. The select list of the query can select any columns from any of these tables. If any two of these tables have a column name in common, then you must qualify all references to these columns throughout the query with table names to avoid ambiguity.

Oracle supports inner join, left join, right join, full outer join and cross join.

You can join a table to itself to query hierarchical data using an inner join, left join, or right join. This kind of join is known as self-join.

## Setting up sample tables

We created two new tables with the same structure for the demonstration using Sample-tables.sql script. The SQL script is under followed.

```
-- Create BALLOON_A table
CREATE TABLE BALLOON_A (
    ID INT PRIMARY KEY,
    COLOR VARCHAR2 (100) NOT NULL
);

-- Create BALLOON_B table
CREATE TABLE BALLOON_B (
    ID INT PRIMARY KEY,
    COLOR VARCHAR2 (100) NOT NULL
);

-- Insert data into BALLOON_A table
INSERT INTO BALLOON_A (ID, COLOR)
VALUES (1, 'Red');

INSERT INTO BALLOON_A (ID, COLOR)
VALUES (2, 'Green');

INSERT INTO BALLOON_A (ID, COLOR)
VALUES (3, 'Blue');

INSERT INTO BALLOON_A (ID, COLOR)
VALUES (4, 'Purple');

-- Insert data into BALLOON_B table
INSERT INTO BALLOON_B (ID, COLOR)
VALUES (1, 'Green');

INSERT INTO BALLOON_B (ID, COLOR)
VALUES (2, 'Red');

INSERT INTO BALLOON_B (ID, COLOR)
VALUES (3, 'Cyan');

INSERT INTO BALLOON_B (ID, COLOR)
VALUES (4, 'Brown');
```

Both the tables have some common colors such as Red and Green. Let’s call the BALLOON_A the left table and BALLOON_B the right table.

## Oracle inner join

The inner join selects records that have matching values in both tables.

The following statement joins the left table to the right table using the values in the color column.

```
SELECT
    A.ID ID_A,
    A.COLOR COLOR_A,
    B.ID ID_B,
    B.COLOR COLOR_B
FROM
    BALLOON_A A
INNER JOIN BALLOON_B B ON A.COLOR = B.COLOR;

ID_A	COLOR_A	ID_B	COLOR_B
----	-------	----	-------
2	Green	1	Green
1	Red	2	Red

2 rows selected.
```

The above SQL query joins both tables and returns rows from the left table that match with the rows from the right table as per the selected criteria in on clause.

## Oracle left join

The left join returns all records from the left table (BALLOON_A), and the matched records from the right table (BALLOON_B). The result is NULL from the right side, if there is no match.

The following statement joins the left table with the right table using a left join.

```
SELECT
    A.ID ID_A,
    A.COLOR COLOR_A,
    B.ID ID_B,
    B.COLOR COLOR_B
FROM
    BALLOON_A A
LEFT JOIN BALLOON_B B ON A.COLOR = B.COLOR;

ID_A	COLOR_A	ID_B	COLOR_B
----	-------	----	-------
2	Green	1	Green
1	Red	2	Red
3	Blue	
4	Purple	

4 rows selected.
```

The above SQL query returns all rows from the left table with the matching rows if available from the right table. If there is no matching row found from the right table, the left join will have null values for the columns of the right table.

## Oracle right join

The right join returns all records from the right table (BALLOON_B), and the matched records from the left table (BALLOON_A). The result is NULL from the left side when there is no match.

The following example use right join to join the left table to the right table.

```
SELECT
    A.ID ID_A,
    A.COLOR COLOR_A,
    B.ID ID_B,
    B.COLOR COLOR_B
FROM
    BALLOON_A A
RIGHT JOIN BALLOON_B B ON A.COLOR = B.COLOR;

ID_A	COLOR_A	ID_B	COLOR_B
----	-------	----	-------
1	Red	2	Red
2	Green	1	Green
		4	Brown
		3	Cyan

4 rows selected.
```

The above sql query returns all rows from the right table with the matching rows if available from the left table. If there is no matching row found from the left table, the right join will have null values for the columns of the left table.

## Oracle full outer join

The full outer join returns a result set that contains all rows from both left and right tables, with the matching rows from both sides where available.

The following example shows the full outer join of the left and right tables.

```
SELECT
    A.ID ID_A,
    A.COLOR COLOR_A,
    B.ID ID_B,
    B.COLOR COLOR_B
FROM
    BALLOON_A A
FULL OUTER JOIN BALLOON_B B ON A.COLOR = B.COLOR;

ID_A	COLOR_A	ID_B	COLOR_B
----	-------	----	-------
2	Green	1	Green
1	Red	2	Red
		3	Cyan
		4	Brown
3	Blue		
4	Purple		

6 rows selected.
```

The above SQL query returns all rows from the right and left table with the matching or not matching rows.
