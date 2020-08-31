# Intro to SQL
Every application uses data in some way. In many of our applications we will be
storing information in a database. In this assignment we will be practicing
using SQL databases.

## Objectives

- Create a database
- Write some queries to use the database

## Setup

1. Fork [this repository](https://github.com/suncoast-devs/sql-intro) to your
   own account.
2. Change into your project's directory.
3. Clone your repository:
   `git clone https://github.com/YOUR_NAME_HERE/sql-intro`
4. Change into your newly cloned project's directory: `cd sql-intro`
5. `code .`
6. All your SQL queries should be placed inside the `queries.sql` file.

## Requirements

- [ ] Create a database: `CompanyDatabase`.
- [ ] Create a table: `Employees` with the following columns. Use your best judgment for data types. Copy the query you used to create this table and paste it into `queries.sql`.

  - `FullName`
  - `Salary`
  - `JobPosition`
  - `PhoneExtension`
  - `IsPartTime`

- [ ] Create a few employees. Review the requirements below to see some examples of the values you may need. For instance, you may need employees of certain job positions, employees with certain names, etc. Add enough data (maybe 10 rows) such that you can validate your queries. _Copy the queries you used to create your data into `queries.sql`_
- [ ] Create queries that can do the following. **Each query** should be attempted in your database. When it works, copy the query to `queries.sql`. You may optionally copy and paste the query output to your queries.sql if you wish.

  - [ ] Select all columns for all employees.
  - [ ] Select only the full names and phone extensions for only full-time employees.
  - [ ] Insert a new part-time employee, as a software developer, with a salary of 450. Make up values for the other columns.
  - [ ] Update all employees that are cooks to have a salary of 500.
  - [ ] Delete all employees that have the full name of "Lazy Larry".
  - [ ] Add a column to the table: `ParkingSpot` as textual information that can store _up to_ 10 characters.


