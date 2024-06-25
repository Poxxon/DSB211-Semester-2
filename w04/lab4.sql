/*
Name: Pouya Rad
Oracle USER ID: prad@myseneca.ca
Student ID: 164382228
Date: 05/06/24
Purpose: The purpose of this lab is to introduce you to the DDL set of 
statements in SQL. By writing SQL to create tables, constraints, and views, 
you will have the tools needed to implement database designs that you will 
create later in the course.  
*/

SET AUTOCOMMIT ON;

//Q1
DROP TABLE movies;

CREATE TABLE movies (
mid INT PRIMARY KEY,
title VARCHAR(35) NOT NULL,
releaseYear INT NOT NULL,
director INT NOT NULL,
score DECIMAL(3,2),
CONSTRAINT scoreChk CHECK (score <= 5 AND score > 0));

DROP TABLE actors;

CREATE TABLE actors (
aid INT PRIMARY KEY,
firstname VARCHAR(20) NOT NULL,
lastname VARCHAR(30) NOT NULL);

DROP TABLE castings;

CREATE TABLE castings (
movieid INT,
actorid INT,
PRIMARY KEY (movieid, actorid),
FOREIGN KEY (movieid) REFERENCES movies(mid),
FOREIGN KEY (actorid) REFERENCES actors(aid));

DROP TABLE directors;

CREATE TABLE directors (
directorid INT PRIMARY KEY,
firstname VARCHAR(20) NOT NULL,
lastname VARCHAR(30) NOT NULL);

//Q2
ALTER TABLE movies
ADD CONSTRAINT fk_movies
FOREIGN KEY (director) REFERENCES directors(directorid);

//Q3
ALTER TABLE movies
ADD CONSTRAINTS unique_title
UNIQUE (title);

//Q4 A
INSERT ALL
    INTO directors (directorid, firstname, lastname)
    VALUES (1010, 'Rob', 'Minkoff')
    INTO directors (directorid, firstname, lastname)
    VALUES (1020, 'Bill', 'Condon')
    INTO directors (directorid, firstname, lastname)
    VALUES (1050, 'Josh', 'Cooley')
    INTO directors (directorid, firstname, lastname)
    VALUES (2010, 'Brad', 'Bird')
    INTO directors (directorid, firstname, lastname)
    VALUES (3020, 'Lake', 'Bell')
SELECT * FROM DUAL;
    
//Q4 B
INSERT ALL
    INTO movies(mid, title, releaseyear, director, score)
    VALUES (100, 'The lion king', 2019, 3020, 3.50)
    INTO movies(mid, title, releaseyear, director, score)
    VALUES (200, 'Beauty and the beast', 2017, 1050, 4.20)
    INTO movies(mid, title, releaseyear, director, score)
    VALUES (300, 'Toy story 4', 2019, 1020, 4.50)
    INTO movies(mid, title, releaseyear, director, score)
    VALUES (400, 'Mission impossible', 2018, 2010, 5.00)
    INTO movies(mid, title, releaseyear, director, score)
    VALUES (500, 'The secret life of pets', 2016, 1010, 3.90)
SELECT * FROM DUAL;

//Q5
//Order of deleting matters becuase child file has to be deleted before 
//parent file
DROP TABLE castings; //first child
DROP TABLE directors; //child of movies
DROP TABLE movies; //parent of castings and directors
DROP TABLE actors; //parent of casting

-----------------------------------------------------------------------

//Q6
CREATE TABLE employee2 AS SELECT * FROM employees WHERE 1 = 2;

//Q7
ALTER TABLE employee2 ADD username VARCHAR2(50 CHAR) NULL;
ALTER TABLE employee2 DROP COLUMN username;

//Q8
DELETE FROM employee2;

//Q9
INSERT INTO employee2 
SELECT * 
FROM employees;

//Q10
select * from employee2;
UPDATE employee2 SET firstName = 'Pouya', lastName = 'Rad' WHERE EMPLOYEENUMBER = 1002;

//Q11
UPDATE employee2
SET USERNAME = LOWER(CONCAT(SUBSTR(firstName, 1, 1), lastName));

//Q12
DELETE FROM employee2
WHERE officeCode = 4;

//Q13
DROP TABLE employee2;



