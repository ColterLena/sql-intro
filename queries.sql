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

INSERT INTO "Employees" ("FullName",  "Salary", "JobPosition", "PhoneExtension", "IsPartTime")
VALUES ('Lazy Larry', 42000, 'Office Assistant', 1, 'False');

INSERT INTO "Employees" ("FullName",  "Salary", "JobPosition", "PhoneExtension", "IsPartTime")
VALUES ('Grace Jones', 30000, 'Cook', 2, 'True');

INSERT INTO "Employees" ("FullName",  "Salary", "JobPosition", "PhoneExtension", "IsPartTime")
VALUES ('John Shepard', 50000, 'Commander', 3, 'False');

INSERT INTO "Employees" ("FullName",  "Salary", "JobPosition", "PhoneExtension", "IsPartTime")
VALUES ('Miranda Lawson', 55000, 'Marketing Manager', 4, 'False');

INSERT INTO "Employees" ("FullName",  "Salary", "JobPosition", "PhoneExtension", "IsPartTime")
VALUES ('Garrus Vakarian', 60000, 'Accountant', 5, 'True');

INSERT INTO "Employees" ("FullName",  "Salary", "JobPosition", "PhoneExtension", "IsPartTime")
VALUES ('Mordin Solus', 60000, 'Senior Scientist', 6, 'True');

INSERT INTO "Employees" ("FullName",  "Salary", "JobPosition", "PhoneExtension", "IsPartTime")
VALUES ('Kaiden Alenko', 70000, 'Director of Sales', 7,'False');

INSERT INTO "Employees" ("FullName",  "Salary", "JobPosition", "PhoneExtension", "IsPartTime")
VALUES ('Ashley Williams', 75000, 'Director of Operations', 8, 'False');

INSERT INTO "Employees" ("FullName",  "Salary", "JobPosition", "PhoneExtension", "IsPartTime")
VALUES ('Jacob Taylor', 80000, 'CFO', 9, 'False');

INSERT INTO "Employees" ("FullName",  "Salary", "JobPosition", "PhoneExtension", "IsPartTime")
VALUES ('David Anderson', 100000, 'CEO', 10, 'False');


//Select all columns for all employees

SELECT * FROM "Employees";


//Select only the full names and phone extensions for only full-time employees.

SELECT "FullName", "PhoneExtension" FROM "Employees" WHERE "IsPartTime" = 'False';


//Insert a new part-time employee, as a software developer, with a salary of 450. Make up values for the other columns.

INSERT INTO "Employees" ("FullName",  "Salary", "JobPosition", "PhoneExtension", "IsPartTime")
VALUES ('Jeff Moreau', 450 , 'Software Developer' , 11 , 'True');


//Update all employees that are cooks to have a salary of 500.

UPDATE "Employees" SET "Salary" = 500 WHERE "JobPosition" = 'Cook';


//Delete all employees that have the full name of "Lazy Larry".

DELETE FROM "Employees" WHERE "FullName" = 'Lazy Larry';


//Add a column to the table: ParkingSpot as textual information that can store up to 10 characters.

ALTER TABLE "Employees" ADD "ParkingSpot" VARCHAR(10);


//Create a table named Departments

CREATE TABLE "Departments" (
  "Id"              SERIAL PRIMARY KEY,
  "DepartmentName"  TEXT,
  "Building"        TEXT
);

//Add a Foreign key DepartmentId to your Employees Table.

ALTER TABLE "Employees" ADD COLUMN "DepartmentId" INTEGER NULL REFERENCES "Departments" ("Id");


//Add a table named Orders.

CREATE TABLE "Orders" (
  "Id"           SERIAL PRIMARY KEY,
  "OrderNumber"  TEXT,
  "DatePlaced"   TIMESTAMP,
  "Email"        TEXT 
);

//Add a table named Products.

CREATE TABLE "Products" (
  "Price"             MONEY,
  "Name"              TEXT,
  "Description"       TEXT,
  "QuantityInStock"   INT
);

//Create a table named ProductOrders to reconcile the many to many relationship.

ALTER TABLE "Products" ADD COLUMN "Id" SERIAL PRIMARY KEY;


CREATE TABLE "ProductOrders" (
  "Id"            SERIAL PRIMARY KEY,
  "OrdersId"      INTEGER REFERENCES "Orders" ("Id"),
  "ProductsId"    INTEGER REFERENCES "Products" ("Id"),
  "OrderQuantity" INT
);


//Insert the following Departments from the homework prompt.

INSERT INTO "Departments" ("DepartmentName", "Building")
VALUES ('Development', 'Main');

INSERT INTO "Departments" ("DepartmentName", "Building")
VALUES ('Marketing', 'North');


//Insert the followng Employees from the homework prompt.

INSERT INTO "Employees" ("FullName",  "Salary", "JobPosition", "PhoneExtension", "IsPartTime", "DepartmentId")
VALUES ('Tim Smith', 40000, 'Programmer', 123, 'False', 1);

INSERT INTO "Employees" ("FullName",  "Salary", "JobPosition", "PhoneExtension", "IsPartTime", "DepartmentId")
VALUES ('Barbara Ramsey', 80000, 'Manager', 234, 'False', 1);

INSERT INTO "Employees" ("FullName",  "Salary", "JobPosition", "PhoneExtension", "IsPartTime", "DepartmentId")
VALUES ('Tom Jones', 32000, 'Admin', 456, 'True', 2);


//Insert the following Product from the homework prompt.

INSERT INTO "Products" ("Price",  "Name", "Description", "QuantityInStock")
VALUES ( 12.45, 'Widget', 'The Original Widget', 100);

INSERT INTO "Products" ("Price",  "Name", "Description", "QuantityInStock")
VALUES ( 99.99, 'Flowbee', 'Perfect for haircuts', 3);


//Insert a new order with order number X529, placed on Jan 1st, 2020 at 4:55PM, by someone with the email address "person@example.com".

INSERT INTO "Orders" ("OrderNumber", "DatePlaced", "Email")
VALUES ('X529', '2020-01-01 4:55:00', 'person@example.com');


//Add an order quantity of 3 for the product named Widget to the order X529.

INSERT INTO "ProductOrders" ("OrdersId", "ProductsId", "OrderQuantity") VALUES (1, 1, 3);


//Add an order quantity of 2 for the product named Flowbee to the order X529.

INSERT INTO "ProductOrders" ("OrdersId", "ProductsId", "OrderQuantity") VALUES (1, 2, 2);


//Given a department id, return all employees in the department.

SELECT "Employees"."FullName"
FROM "Employees"
JOIN "Departments" ON "Employees"."DepartmentId" = "Departments"."Id"
WHERE "DepartmentName" = 'Development';


//Given a department name, return all the phone extensions.

SELECT "Employees"."PhoneExtension"
FROM "Employees"
JOIN "Departments" ON "Employees"."DepartmentId" = "Departments"."Id"
Where "DepartmentName" = 'Development';


//Find all orders that contain the product id of 2.

Select "Orders"."OrderNumber"
From "Orders"
Join "ProductOrders" ON "ProductOrders"."OrdersId" = "Orders"."Id"
Join "Products" ON "Products"."Id" = "ProductOrders"."ProductsId"
Where "Products"."Id" = 2;


//Remove the Flowbee product from order with order number X529.

Delete 
From "ProductOrders"
Where "OrdersId" = 1 and "ProductsId" = 2;