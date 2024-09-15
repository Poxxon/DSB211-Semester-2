/*
Name: Pouya Rad
Oracle USER ID: prad@myseneca.ca
Student ID: 164382228
Date: 03/07/24
*/

--PART 1--

//Q1
/*
1- By establishing a new connection with oracle it starts a new transaction automatically
2- By using the keyword BEGIN; that explicitly starts a new transaction
3- By using the keywork COMMIT; that commits the current transaction and starts a new one
4- By using a DDL statement like (DROP, ALTER, CREATE) correctly that automatically 
    commits the current transaction and starts a new one
*/
//Q2
CREATE TABLE newEmployees AS
SELECT * FROM employees WHERE 1=0;

//Q3
SET AUTOCOMMIT OFF;
SET TRANSACTION READ WRITE;

//Q4
INSERT ALL 
    INTO newEmployees (employeeNumber, lastname, firstname, extension, email, OfficeCode, reportsTo, jobTitle) 
    VALUES (100, 'Patel', 'Ralph', '22333', 'rpatel@mail.com', '1', NULL, 'Sales Rep')
    INTO newEmployees (employeeNumber, lastname, firstname, extension, email, OfficeCode, reportsTo, jobTitle) 
    VALUES (101, 'Denis', 'Betty', '33444', 'bdenis@mail.com', '4', NULL, 'Sales Rep')
    INTO newEmployees (employeeNumber, lastname, firstname, extension, email, OfficeCode, reportsTo, jobTitle) 
    VALUES (102, 'Biri', 'Ben', '44555', 'bbirir@mail.com', '2', NULL, 'Sales Rep')
    INTO newEmployees (employeeNumber, lastname, firstname, extension, email, OfficeCode, reportsTo, jobTitle) 
    VALUES (103, 'Newman', 'Chad', '66777', 'cnewman@mail.com', '3', NULL, 'Sales Rep')
    INTO newEmployees (employeeNumber, lastname, firstname, extension, email, OfficeCode, reportsTo, jobTitle) 
    VALUES (104, 'Ropeburn', 'Audrey', '77888', 'aropebur@mail.com', '1', NULL, 'Sales Rep')
SELECT * FROM DUAL;

//Q5
SELECT * FROM newEmployees; --5 rows are selected

//Q6
ROLLBACK;
SELECT * FROM newEmployees; --0 rows are selected

//Q7
INSERT ALL 
    INTO newEmployees (employeeNumber, lastname, firstname, extension, email, OfficeCode, reportsTo, jobTitle) 
    VALUES (100, 'Patel', 'Ralph', '22333', 'rpatel@mail.com', '1', NULL, 'Sales Rep')
    INTO newEmployees (employeeNumber, lastname, firstname, extension, email, OfficeCode, reportsTo, jobTitle) 
    VALUES (101, 'Denis', 'Betty', '33444', 'bdenis@mail.com', '4', NULL, 'Sales Rep')
    INTO newEmployees (employeeNumber, lastname, firstname, extension, email, OfficeCode, reportsTo, jobTitle) 
    VALUES (102, 'Biri', 'Ben', '44555', 'bbirir@mail.com', '2', NULL, 'Sales Rep')
    INTO newEmployees (employeeNumber, lastname, firstname, extension, email, OfficeCode, reportsTo, jobTitle) 
    VALUES (103, 'Newman', 'Chad', '66777', 'cnewman@mail.com', '3', NULL, 'Sales Rep')
    INTO newEmployees (employeeNumber, lastname, firstname, extension, email, OfficeCode, reportsTo, jobTitle) 
    VALUES (104, 'Ropeburn', 'Audrey', '77888', 'aropebur@mail.com', '1', NULL, 'Sales Rep')
SELECT * FROM DUAL;

SELECT * FROM newEmployees; --5 rows are selected

//Q8
UPDATE newEmployees SET jobtitle = 'unknown';

//Q9
COMMIT; --make changes permenant 

//Q10
ROLLBACK;

SELECT * 
FROM newEmployees
WHERE lower(jobtitle) = 'unknown';

/*
a. all 5 are updated as the commit has been made before rollback

b. no it is not

c. in the example of Q6 the rollback was effective because the transaction was still ongoing and
had not have commited so the rollback rolled back to where there was 0 progress
in Q10 it was not effective since the changes have already been commited before the rollback occured
therefore there is nothing to rollback on. 
*/

//Q11
SET TRANSACTION READ WRITE;
DELETE FROM newEmployees;

//Q12
CREATE VIEW vwNewEmps AS
SELECT * 
FROM newEmployees
ORDER BY lastname, firstname;

//Q13
ROLLBACK;

//a. it should go back to its last state that included the records before deletion

//b. if the state before this was populated it would and should go to its last state making it effective

//Q14
SET TRANSACTION READ WRITE;
INSERT ALL 
    INTO newEmployees (employeeNumber, lastname, firstname, extension, email, OfficeCode, reportsTo, jobTitle) 
    VALUES (100, 'Patel', 'Ralph', '22333', 'rpatel@mail.com', '1', NULL, 'Sales Rep')
    INTO newEmployees (employeeNumber, lastname, firstname, extension, email, OfficeCode, reportsTo, jobTitle) 
    VALUES (101, 'Denis', 'Betty', '33444', 'bdenis@mail.com', '4', NULL, 'Sales Rep')
    INTO newEmployees (employeeNumber, lastname, firstname, extension, email, OfficeCode, reportsTo, jobTitle) 
    VALUES (102, 'Biri', 'Ben', '44555', 'bbirir@mail.com', '2', NULL, 'Sales Rep')
    INTO newEmployees (employeeNumber, lastname, firstname, extension, email, OfficeCode, reportsTo, jobTitle) 
    VALUES (103, 'Newman', 'Chad', '66777', 'cnewman@mail.com', '3', NULL, 'Sales Rep')
    INTO newEmployees (employeeNumber, lastname, firstname, extension, email, OfficeCode, reportsTo, jobTitle) 
    VALUES (104, 'Ropeburn', 'Audrey', '77888', 'aropebur@mail.com', '1', NULL, 'Sales Rep')
SELECT * FROM DUAL;

//Q15
SAVEPOINT insertion;

//Q16
UPDATE newEmployees
SET jobTitle = 'unknown';
SELECT * FROM newEmployees;

//Q17
ROLLBACK TO SAVEPOINT insertion;
SELECT * FROM newEmployees;

//Q18
ROLLBACK;
SELECT * FROM newEmployees;


--PART 2--
//Q19
REVOKE ALL ON newEmployees FROM PUBLIC;

//Q20
GRANT SELECT ON newEmployees TO 'classmate1';

//Q21
GRANT INSERT, UPDATE, DELETE ON newEmployees TO 'classmate1';

//Q22
REVOKE ALL ON newEmployees FROM 'classmate1';









