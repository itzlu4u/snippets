# PostgreSQL Cheat Sheet

## Installation and Running PostgreSQL

1. Install PostgreSQL: https://www.postgresql.org/download/
2. Start PostgreSQL server: `pg_ctl start`
3. Connect to PostgreSQL server: `psql -U <username> -d <database_name>`

## Basic PostgreSQL Commands

1. List databases: `\l`
2. Connect to a database: `\c <database_name>`
3. List tables: `\dt`
4. Show table schema: `\d <table_name>`
5. Execute a SQL file: `\i <file_path.sql>`

## CRUD Operations

### Create (Insert)

1. Create a table: `CREATE TABLE <table_name> (column1 datatype1, column2 datatype2, ...);`
2. Insert a single row: `INSERT INTO <table_name> (column1, column2, ...) VALUES (value1, value2, ...);`
3. Insert multiple rows: `INSERT INTO <table_name> (column1, column2, ...) VALUES (value1, value2, ...), (value3, value4, ...), ...;`

### Read (Query)

1. Select all rows and columns: `SELECT * FROM <table_name>;`
2. Select specific columns: `SELECT column1, column2, ... FROM <table_name>;`
3. Filter rows with a condition: `SELECT * FROM <table_name> WHERE <condition>;`
4. Order rows by a column: `SELECT * FROM <table_name> ORDER BY <column> ASC|DESC;`
5. Limit the number of rows: `SELECT * FROM <table_name> LIMIT <number>;`
6. Group rows by a column: `SELECT column1, AGG_FUNC(column2) FROM <table_name> GROUP BY column1;`
7. Apply conditions after grouping: `SELECT column1, AGG_FUNC(column2) FROM <table_name> GROUP BY column1 HAVING <condition>;`
8. Join multiple tables: `SELECT * FROM <table1> JOIN <table2> ON <table1.column> = <table2.column>;`

### Update

1. Update a single or multiple rows: `UPDATE <table_name> SET column1 = value1, column2 = value2, ... WHERE <condition>;`

### Delete

1. Delete a single or multiple rows: `DELETE FROM <table_name> WHERE <condition>;`
2. Delete all rows: `DELETE FROM <table_name>;`
3. Drop a table: `DROP TABLE <table_name>;`

## Indexing

1. Create an index: `CREATE INDEX <index_name> ON <table_name> (<column>);`
2. List indexes: `\di`
3. Drop an index: `DROP INDEX <index_name>;`

## Transactions

1. Begin a transaction: `BEGIN;`
2. Commit a transaction: `COMMIT;`
3. Rollback a transaction: `ROLLBACK;`

## Best Practices

1. Normalize your database schema to reduce redundancy and improve consistency.
2. Use appropriate data types and constraints to ensure data integrity.
3. Use indexes on frequently queried columns to improve query performance.
4. Analyze query performance using the `EXPLAIN` and `EXPLAIN ANALYZE` commands.
5. Regularly backup your database using `pg_dump` and `pg_restore`.

Remember to always consult the PostgreSQL documentation for the most up-to-date information: https://www.postgresql.org/docs/
