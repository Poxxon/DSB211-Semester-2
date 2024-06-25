/*
Name: Pouya Rad
Oracle USER ID: prad@myseneca.ca
Student ID: 164382228
Date: 27/05/24
Purpose: The purpose of this lab is to start learning SQL by writing basic DML 
statements involving a single table.  You will learn to create basic CRUD 
statements (queries as well as insert, update and delete).
*/

SET AUTOCOMMIT ON;

//Q1
SELECT*
FROM offices;

//Q2
SELECT* FROM employees
WHERE officecode = 1;

//Q3
SELECT customernumber, customername, contactfirstname, 
contactlastname, phone, city
FROM customers
WHERE lower (city) = 'paris';

//Q4-A
SELECT customernumber, customername, 
contactlastname ||' '|| contactfirstname AS contactname, 
phone, country
FROM customers
WHERE LOWER (city) = 'paris';

//Q4-B
SELECT customernumber, customername, 
contactlastname ||' '|| contactfirstname AS contactname, 
phone, country
FROM customers
WHERE LOWER (country) = 'canada';

//Q5
SELECT  customernumber, amount
FROM payments
WHERE amount IS NOT NULL;

//Q6
SELECT customernumber, checknumber, amount
FROM payments
WHERE amount NOT BETWEEN 30000 AND 65000
ORDER BY amount DESC;

//Q7
SELECT* 
FROM orders
WHERE LOWER (status) = 'cancelled';

//Q8-A
SELECT productcode, productname, buyprice, msrp, msrp - buyprice AS markup
FROM products;

//Q8-B
SELECT productcode, productname, buyprice, msrp, 
ROUND(100 * (msrp - buyprice) / buyprice, 1) AS percmarkup
FROM products;

//Q9
SELECT*
FROM products
WHERE LOWER(productname) LIKE '%co%';

//Q10
SELECT*
FROM customers
WHERE lower(contactfirstname) LIKE 's%' AND lower(contactfirstname) LIKE '%e%';

//Q11
INSERT INTO employees
VALUES (1069, 'Rad', 'Pouya', 'x0000', 'prad@myseneca.ca', 4, 1088, 'Cashier');

//Q12
SELECT*
FROM employees
WHERE employeenumber = 1099;

//Q13
UPDATE employees
SET jobtitle = 'Head Cashier'
WHERE employeenumber = 1069;

//Q14
INSERT INTO employees
VALUES (1099, 'Doe', 'Jane', 'x0000', 'jdoe@myseneca.ca', 4, 1069, 'Cashier');

//Q15
DELETE
FROM employees
WHERE employeenumber = 1069;
//cant delete because child record (Jane doe reporting to me) found.

//Q16
DELETE
FROM employees
WHERE employeenumber = 1099;

DELETE
FROM employees
WHERE employeenumber = 1069;
//it worked becuase there are no dependancies on Pouya Rad anymore.

//Q17
INSERT ALL
    INTO employees (employeenumber, lastname, firstname, extension, email, officecode, reportsto, jobtitle) 
    VALUES (1069, 'Rad', 'Pouya', 'x111', 'prad@myseneca.ca', 4, 1088, 'Cashier')
    INTO employees (employeenumber, lastname, firstname, extension, email, officecode, reportsto, jobtitle)
    VALUES (1099, 'Doe', 'Jane', 'x222', 'jdoe@myseneca.ca', 4, 1088, 'Cashier')
SELECT * FROM dual;

//Q18
DELETE FROM employees
WHERE employeenumber IN (1069, 1099);






    


