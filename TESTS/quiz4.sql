//quiz 4
//Pouya Rad

SET AUTOCOMMIT ON;

DROP TABLE PGM;

CREATE TABLE PGM (
Pgm_id CHAR(3) PRIMARY KEY,
Pgm_name CHAR(40) UNIQUE NOT NULL,
No_semesters NUMBER(1) DEFAULT 6 NOT NULL,
CONSTRAINT pgm_id_chk CHECK (Pgm_id IN ('CPA', 'CPD')),
CONSTRAINT no_semester_chk CHECK (No_semesters >= 0));

DROP TABLE student;

CREATE TABLE student (
Campus_no CHAR(1),
mn NUMBER(3),
Stud_lname CHAR(15),
Stud_fname CHAR(15),
Stud_pgm CHAR(3) DEFAULT 'CPA',
Locker_no NUMBER(3) UNIQUE,
PRIMARY KEY(Campus_no, mn),
FOREIGN KEY (Stud_pgm) REFERENCES PGM(Pgm_id));

INSERT ALL 
    INTO PGM (pgm_id, pgm_name, No_semesters)
    VALUES ('CPA', 'Computer Programming', 6)
    INTO student (campus_no, mn, stud_lname, stud_fname, stud_pgm, locker_no)
    VALUES (1, 123, 'Pouya', 'Rad', 'CPA', 012)
SELECT * FROM DUAL;
