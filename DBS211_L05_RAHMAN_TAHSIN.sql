/* Name: Tahsin Rahman
Student ID: 
Date: October 14, 2020
DBS211 - Lab 05 
*/

SET AUTOCOMMIT ON;


/*Part A (DDL)*/

/*Question 1*/

--L5_MOVIES (movieid:int, title:varchar(35), year:int, director:int,score:decimal(3,2))
CREATE TABLE MOVIES (
    mid 	    int 			Primary Key,
    title 		varchar(35)		not null,
    releaseYear	int				not null,
    director	int				not null,
    score		decimal(3,2) 	check(score between 0 AND 5)
	);
    
--L5_ACTORS (actorid:int, name:varchar(20), lastname:varchar(30))
CREATE TABLE ACTORS (
	aid		    int				Primary Key,
    firstName	varchar(20)		not null,
    lastName	varchar(30)		not null
    );

--L5_CASTINGS (movieid:int, actorid:int)
CREATE TABLE CASTINGS(
movieid int,
actorid int,
CONSTRAINT Castings_movieid_actor_id_PK
PRIMARY KEY (movieid,actorid),
CONSTRAINT Castings_movies_FK
FOREIGN KEY(movieid)
REFERENCES MOVIES(mid), 
CONSTRAINT Castings_actors_FK
FOREIGN KEY (actorid)
REFERENCES ACTORS(aid));
    
--L5_DIRECTORS(id:int, name:varchar(20), lastname:varchar(30))
CREATE TABLE DIRECTORS (
	directorid	int,
    firstName	varchar(20)		not null,
    lastName	varchar(30)		not null,
    Primary Key (directorid)
    );
    
/*Question 2*/
--Modify the movies table to create a foreign key constraint that refers to table directors.

ALTER TABLE MOVIES
	ADD CONSTRAINT movie_directors_fk FOREIGN KEY (director) REFERENCES DIRECTORS(directorid);

/*Question 3*/
--Modify the movies table to create a new constraint so the uniqueness of the movie title is guaranteed.

ALTER TABLE MOVIES
	ADD CONSTRAINT TITLE_UNIQUE unique(title);
    
/*Question 4*/
--Write insert statements to add the following data to table directors and movies

INSERT ALL 
INTO DIRECTORS VALUES (1010, 'Rob', 'Minkoff')
INTO DIRECTORS VALUES (1020, 'Bill', 'Condon')
INTO DIRECTORS VALUES (1050, 'Josh', 'Cooley')
INTO DIRECTORS VALUES (2010, 'Brad', 'Bird')
INTO DIRECTORS VALUES (3020, 'Lake', 'Bell')
SELECT * FROM dual;

INSERT ALL
INTO MOVIES VALUES (100, 'The Lion King', 2019, 3020, 3.50)
INTO MOVIES VALUES (200, 'Beauty and the Beast', 2017, 1050, 4.20)
INTO MOVIES VALUES (300, 'Toy Story 4', 2019, 1020, 4.50)
INTO MOVIES VALUES (400, 'Mission Impossible', 2018, 2010, 5.00)
INTO MOVIES VALUES (500, 'The Secret Life of Pets', 2016, 1010, 3.90)
SELECT * FROM dual;

/*Question 5*/
--Write SQL statements to remove all above tables.
--Is the order of tables important when removing? Why?

DROP TABLE CASTINGS;
DROP TABLE MOVIES;
DROP TABLE ACTORS;
DROP TABLE DIRECTORS;

/*Yes , the order of tables matters because when we try to delete we should first delete the table which has
foreign key since it have relevant to other table. We have to be careful not to break data referential intergrity.*/

/*Part B (More DML)*/

/*Question 6*/
--Create a new empty table employee2 the same as table employees. Use a single statement to
--create the table and insert the data at the same time.

CREATE TABLE employee2 AS SELECT * FROM employees;

/*Question 7*/
--Modify table employee2 and add a new column username to this table. The value of this column
--is not required and does not have to be unique.

ALTER TABLE employee2 
	ADD username varchar(16);
    
/*Question 8*/
-- Delete all the data in the employee2 table.

DELETE FROM employee2;

/*Question 9*/
--Re-insert all data from the employees table into your new table employee2 using a single statement.

INSERT INTO employee2(employeenumber, lastname, firstname, extension, email, officecode, reportsto, jobtitle) 
    SELECT * FROM employees;

/*Question 10*/
--In table employee2, write a SQL statement to change the first name and the last name of
--employee with ID 1002 to your name.

UPDATE employee2 SET firstname = 'Tahsin', lastname = 'Rahman' 
	WHERE employeeNumber = 1002;

/*Question 11*/
--In table employee2, generate the email address for column username for each student by concatenating the first character of employee’s first name and the employee’s last name. 
--For instance, the username of employee Peter Stone will be pstone. NOTE: the username is in all lower case letters. 

UPDATE employee2 SET username = lower(concat(substr(firstname, 1, 1), lastname));
SELECT * FROM employee2;

/*Question 12*/
-- In table employee2, remove all employees with office code 4. 

DELETE FROM employee2
	WHERE OfficeCode = 4;
    
/*Question 13*/
--Drop table employee2.

DROP TABLE employee2;
