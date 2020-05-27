// Create a database
createdb CompanyDatabase;


//Engage the psql
psql CompanyDatabase;


//Create a table
CREATE TABLE "Employees" (
  "FullName"       TEXT NOT NULL,
  "Salary"         INT,
  "JobPosition"    TEXT,
  "PhoneExtension" INT,
  "IsPartTime"     TEXT
);


//Create 10 employees

INSERT INTO "Employees" ("FullName",  "Salary", "JobPosition", "PhoneExtension", "IsPartTime" )
VALUES ('Lazy Larry', 42000 , 'Office Assistant' , 1 , 'False');

INSERT INTO "Employees" ("FullName",  "Salary", "JobPosition", "PhoneExtension", "IsPartTime" )
VALUES ('Grace Jones', 30000 , 'Cook' , 2 , 'True');

INSERT INTO "Employees" ("FullName",  "Salary", "JobPosition", "PhoneExtension", "IsPartTime" )
VALUES ('John Shepard', 50000 , 'Commander' , 3 , 'False');

INSERT INTO "Employees" ("FullName",  "Salary", "JobPosition", "PhoneExtension", "IsPartTime" )
VALUES ('Miranda Lawson', 55000 , 'Marketing Manager' , 4 , 'False');

INSERT INTO "Employees" ("FullName",  "Salary", "JobPosition", "PhoneExtension", "IsPartTime" )
VALUES ('Garrus Vakarian', 60000 , 'Accountant' , 5 , 'True');

INSERT INTO "Employees" ("FullName",  "Salary", "JobPosition", "PhoneExtension", "IsPartTime" )
VALUES ('Mordin Solus', 60000 , 'Senior Scientist' , 6 , 'True');

INSERT INTO "Employees" ("FullName",  "Salary", "JobPosition", "PhoneExtension", "IsPartTime" )
VALUES ('Kaiden Alenko', 70000 , 'Director of Sales' , 7 , 'False');

INSERT INTO "Employees" ("FullName",  "Salary", "JobPosition", "PhoneExtension", "IsPartTime" )
VALUES ('Ashley Williams', 75000 , 'Director of Operations' , 8 , 'False');

INSERT INTO "Employees" ("FullName",  "Salary", "JobPosition", "PhoneExtension", "IsPartTime" )
VALUES ('Jacob Taylor', 80000 , 'CFO' , 9 , 'False');

INSERT INTO "Employees" ("FullName",  "Salary", "JobPosition", "PhoneExtension", "IsPartTime" )
VALUES ('David Anderson', 100000 , 'CEO' , 10 , 'False');


//Select all columns for all employees

SELECT * FROM "Employees";


//Select only the full names and phone extensions for only full-time employees.

SELECT "FullName", "PhoneExtension" FROM "Employees" WHERE "IsPartTime" = 'False';


//Insert a new part-time employee, as a software developer, with a salary of 450. Make up values for the other columns.

INSERT INTO "Employees" ("FullName",  "Salary", "JobPosition", "PhoneExtension", "IsPartTime" )
VALUES ('Jeff Moreau', 450 , 'Software Developer' , 11 , 'True');


//Update all employees that are cooks to have a salary of 500.

UPDATE "Employees" SET "Salary" = 500 WHERE "JobPosition" = 'Cook';


//Delete all employees that have the full name of "Lazy Larry".

DELETE FROM "Employees" WHERE "FullName" = 'Lazy Larry';


//Add a column to the table: ParkingSpot as textual information that can store up to 10 characters.

ALTER TABLE "Employees" ADD "ParkingSpot" VARCHAR(10);

