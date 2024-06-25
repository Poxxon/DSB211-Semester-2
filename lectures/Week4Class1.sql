DROP TABLE COURSES;

CREATE TABLE COURSES(
COURSECODE CHAR(6) PRIMARY KEY,
COURSENAME VARCHAR(15),
courseDesc VARCHAR(30));

SELECT *
FROM COURSES;

INSERT INTO COURSES
VALUES ('DBS211', 'DATABASE', 'Oracle');

INSERT ALL
INTO COURSES
VALUES ('dbs311', 'dbms', 'AdvancedDB')
INTO COURSES
VALUES ('ACT123', 'ACCOUNTING', 'MS')
INTO COURSES
VALUES ('OPS400', 'OS', 'IBM system')
SELECT * FROM DUAL;

SELECT COURSECODE, COURSEDESC
FROM COURSES
WHERE upper(COURSEDESC) LIKE '%B%';

UPDATE COURSES
SET COURSECODE = 'NYC'
WHERE coursecode = 'dbs311';

SELECT COUNT(*)
FROM OFFICES;

--------------------------------------------

CREATE TABLE players (
pID INT PRIMARY KEY,
pTIME INT);

CREATE TABLE teams (
teamID INT,
teamname VARCHAR(15) NOT NULL, //cannot be null
maxplayers INT DEFAULT 0, //makes default all to 0
CONSTRAINT maxPlater_chk CHECK (maxplayers BETWEEN 0 AND 25), 
// how to do constraints. constraints names should be meaningful names but can be anything.
PRIMARY KEY (teamID)); //how to do primary key

ALTER TABLE teams DROP CONSTRAINT maxPlayer_chk;//to remove constraints








