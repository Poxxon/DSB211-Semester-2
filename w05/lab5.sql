/*
Name: Pouya Rad
Oracle USER ID: prad@myseneca.ca
Student ID: 164382228
Date: 23/06/24
Purpose: The purpose of this lab is to introduce students to querying data from
multiple tables.  Relationships are used in relational databases to reduce 
redundant and repetitive data, but it is necessary to reconnect these tables 
when extracting data and obtaining information  
*/


SET AUTOCOMMIT ON;

--------SELECT DATA FROM MULTIPLE TABLES--------

//Q1
SELECT e.employeenumber, e.firstname, e.lastname,
       o.city, o.phone, o.postalcode
FROM offices o JOIN employees e
ON o.officecode = e.officecode
WHERE lower(o.city) = 'paris';

//Q2 - ABC
SELECT c.customernumber, c.customername,
       TO_CHAR(p.paymentdate, 'Month DD, YYYY') as paymentdate,
       p.amount
FROM customers c JOIN payments p
ON c.customernumber = p.customernumber
WHERE lower(c.country) = 'canada'
ORDER BY c.customernumber;

//Q3
SELECT c.customernumber, c.customername
FROM customers c LEFT JOIN payments p
ON c.customernumber = p.customernumber
WHERE lower(c.country) = 'usa'
AND p.paymentdate IS NULL
ORDER BY c.customernumber;

----------------VIEWS AND JOINTS-----------------

//Q4 - A
CREATE VIEW customer_order AS
SELECT o.customernumber, o.ordernumber, o.orderdate,
       p.productname, d.quantityordered, d.priceeach
FROM orders o
JOIN orderdetails d ON o.ordernumber = d.ordernumber
JOIN products p ON d.productcode = p.productcode;

//Q4 - B
SELECT * FROM customer_order;

//Q5
SELECT v.customernumber, v.ordernumber, v.orderdate,
       v.productname, v.quantityordered, v.priceeach, d.orderlinenumber
FROM customer_order v
JOIN orderdetails d ON v.ordernumber = d.ordernumber 
WHERE v.customernumber = 124
ORDER BY v.ordernumber, d.orderlinenumber;

//Q6
SELECT c.customernumber, c.contactfirstname, 
       c.contactlastname, c.phone, c.creditlimit, o.ordernumber
FROM customers c LEFT JOIN orders o
ON c.customernumber = o.customernumber
WHERE o.ordernumber IS NULL;

//Q7
CREATE VIEW employee_manager  AS
SELECT e1.employeenumber, e1.lastname, e1.firstname, e1.extension, e1.email, e1.officecode, e1.reportsto, e1.jobtitle,
       e2.firstname AS manager_firstname, e2.lastname AS manager_lastname
FROM employees e1
LEFT JOIN employees e2 ON e1.reportsto = e2.employeenumber;

SELECT * FROM employee_manager ;

//Q8
CREATE OR REPLACE VIEW employee_manager AS
SELECT e1.employeenumber, e1.lastname, e1.firstname, e1.extension, e1.email, e1.officecode, e1.reportsto, e1.jobtitle,
       e2.firstname AS manager_firstname, e2.lastname AS manager_lastname
FROM employees e1
JOIN employees e2 ON e1.reportsto = e2.employeenumber
WHERE e1.reportsto IS NOT NULL;

//Q9
DROP VIEW customer_order;
DROP VIEW employee_manager;























