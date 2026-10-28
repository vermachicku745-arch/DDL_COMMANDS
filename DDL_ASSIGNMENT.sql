CREATE DATABASE company_training;
USE company_training;
CREATE TABLE departments (
department_id INT NOT NULL,
dept_name VARCHAR(80) NOT NULL,
city VARCHAR(60)
);
CREATE TABLE employees (
employee_id INT NOT NULL,
employee_name VARCHAR(100) NOT NULL,
email VARCHAR(120),
department_id INT NOT NULL,
salary DECIMAL(12,2),
status VARCHAR(20) default 'active'
);

describe employees;
 -- Add a PRIMARY KEY constraint on departments.department_id.
 alter table departments
 add primary key (department_id);

--  Add a PRIMARY KEY constraint on employees.employee_id.
alter table employees
add primary key (employee_id);

-- Rename the column dept_name to department_name in the departments table, keeping its existing data type and NOT NULL requirement.
alter table departments
change dept_name department_name
varchar(100) not null;

-- Add a new column named location of type VARCHAR(100) to the departments table.
alter table departments
add location varchar (100);

-- Modify employees.salary to DECIMAL(12,2) and ensure that it does not allow NULL values.
alter table employees
modify salary decimal (12,2) not null

-- Set the default value of employees.status to Active.
alter table employees   
alter table

-- Add a UNIQUE constraint on employees.email.
alter table employees
add constraint uq_employees_email unique(email);

-- Rename the employees table to staff.
rename table employees to staff;

-- Add a FOREIGN KEY constraint on staff.department_id referencing departments.department_id.
alter table staff 
add constraint fk_staff_department 
foreign key (department_id)
references departments (department_id);

-- Drop the UNIQUE constraint added to staff.email in Question 7.
alter table staff
drop index uq_employees_email;

-- Drop the FOREIGN KEY constraint created in Question 9 without dropping the department_id column.
alter table staff 
drop foreign key fk_staff_department;

-- Drop the PRIMARY KEY constraint from the staff table, retaining its employee_id column.
alter table staff
drop primary key;

-- Add the PRIMARY KEY constraint back on staff.employee_id.
alter table staff
add primary key (employees_id);

-- Drop the location column from the departments table.
alter table department
drop column location ;

-- rename the database from company_training to company_management using MySQL-supported DDL operations.Create the new database, move both tables to it, and remove the old empty database. (MySQL does not support a direct rename database command).
create database company_management;

rename table 
company_training .departments
to company_management.departments;

drop database company_training;

describe employees;

alter table employees
modify salary decimal(12,2)not null;
describe employees