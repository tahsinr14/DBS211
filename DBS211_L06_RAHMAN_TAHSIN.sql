/* Name: Tahsin Rahman
Student ID: 165063199
Date: November 7, 2020
DBS211 - Lab 06 
*/
SET AUTOCOMMIT ON;
/*PART A - Transactions*/
/*1. List the 4 ways that we know that a transaction can be started*/
--    a) The user establishes a new connection to the server and creates a blank tab which is ready,the user starts a new 
--      transaction.
--    b) The user executes ANY DDL statement, it triggers an auto-commit of the current transaction and starts a new 
--      transaction.
--    c) The user executes a COMMIT statement, the current transaction is commited, which starts a new transaction.
--    d) The user uses the BEGIN statement in Oracle SQL, it starts a new transaction.

/*2. Using SQL, create an empty table, that is the same as the employees table, and name it
newEmployees.*/
CREATE TABLE newEmployees (
employeenumber  NUMBER(38,0), 
lastname        VARCHAR(50), 
firstname       VARCHAR(50), 
extension       VARCHAR(10), 
email           VARCHAR(100), 
officecode      VARCHAR(10), 
reportsto       NUMBER(38,0), 
jobtitle        VARCHAR(50));

/*3. Execute the following commands.
SET AUTCOMMIT OFF;
SET TRANSACTION READ WRITE; */

SET AUTOCOMMIT OFF;
SET TRANSACTION READ WRITE;

/*4. Write an INSERT statement to populate the newEmployees table with the rows of the sample data.
Insert the NULL value for the reportsTo column. (Write a single INSERT statement to insert all the rows)*/

INSERT ALL
    INTO newEmployees VALUES (100, 'Patel', 'Ralph', 22333, 'rpatel@mail.com', 1, NULL, 'Sales Rep')
    INTO newEmployees VALUES (101, 'Denis', 'Betty', 22333, 'bdenis@mail.com', 4, NULL, 'Sales Rep')
    INTO newEmployees VALUES (102, 'Biri', 'Ben', 44555, 'bbirir@mail.com', 2, NULL, 'Sales Rep')
    INTO newEmployees VALUES (103, 'Newman', 'Chad', 66777, 'cnewman@mail.com', 3, NULL, 'Sales Rep')
    INTO newEmployees VALUES (104, 'Ropeburn', 'Audrey', 77888, 'aropebur@mail.com', 1, NULL, 'Sales Rep')
    SELECT * FROM dual;
    
/*5. Create a query that shows all the inserted rows from the newEmployees table. How many rows are
selected?*/

SELECT * FROM newEmployees;
-- 5 rows are selected.

/*6. Execute the rollback command. Display all rows and columns from the newEmployees table. How many
rows are selected?*/

ROLLBACK;
SELECT * FROM newEmployees;
-- There were no rows selected.

/*7. Repeat Task 4. Make the insertion permanent to the table newEmployees. Display all rows and
columns from the newEmployee table. How many rows are selected?*/

INSERT ALL
    INTO newEmployees VALUES (100, 'Patel', 'Ralph', 22333, 'rpatel@mail.com', 1, NULL, 'Sales Rep')
    INTO newEmployees VALUES (101, 'Denis', 'Betty', 22333, 'bdenis@mail.com', 4, NULL, 'Sales Rep')
    INTO newEmployees VALUES (102, 'Biri', 'Ben', 44555, 'bbirir@mail.com', 2, NULL, 'Sales Rep')
    INTO newEmployees VALUES (103, 'Newman', 'Chad', 66777, 'cnewman@mail.com', 3, NULL, 'Sales Rep')
    INTO newEmployees VALUES (104, 'Ropeburn', 'Audrey', 77888, 'aropebur@mail.com', 1, NULL, 'Sales Rep')
    SELECT * FROM dual; 
    
COMMIT;
SELECT * FROM newEmployees;

-- Number of rows selected: 5

/*8. Write an update statement to update the value of column jobTitle to 'unknown' for all the employees
in the newEmployees table.*/



UPDATE newEmployees SET jobtitle = 'unknown';

/*9. Make your changes permanent.*/

COMMIT;

/*10. Execute the rollback command. */

ROLLBACK;

/*10a. Display all employees from the newEmployees table whose job title is ‘unknown’. How many
rows are still updated?*/

SELECT jobtitle
FROM newEmployees
WHERE jobtitle = 'unknown';
-- 5 rows are still updated

/*10b. Was the rollback command effective?*/

-- The ROLLBACK command was not effective.

/*10c. What was the difference between the result of the rollback execution from Task 6 and the
result of the rollback execution of this task?*/

-- The difference between the results of the ROLLBACK from task 6 to this execution is that this time the changes made by the
-- INSERT command was permanent in task 9 because of the COMMIT command.

/*11. Begin a new transaction and then create a statement to delete to employees from the newEmployees
table*/

COMMIT;
DELETE FROM newEmployees
WHERE employeenumber BETWEEN 100 AND 104; 

/*12. Create a VIEW, called vwNewEmps, that queries all the records in the newEmployees table sorted by
last name and then by first name.*/

CREATE VIEW vwNewEmps AS
    SELECT *
    FROM newEmployees
    ORDER BY lastname, firstname;
    
/*13. Perform a rollback to undo the deletion of the employees*/

ROLLBACK;

/*13a. How many employees are now in the newEmployees table?*/

-- There are 0(Zero) employees in the newEmployees table now.

/*13b. Was the rollback effective and why?*/

-- ROLLBACK was not effective as new transaction was started in task 12 by executing a DDL statement.  
-- The delete command was made permenant 

/*14. Begin a new transaction and rerun the data insertion from Task 4 (copy the code down to Task 14 and
run it)*/

COMMIT;
INSERT ALL
    INTO newEmployees VALUES (100, 'Patel', 'Ralph', 22333, 'rpatel@mail.com', 1, NULL, 'Sales Rep')
    INTO newEmployees VALUES (101, 'Denis', 'Betty', 22333, 'bdenis@mail.com', 4, NULL, 'Sales Rep')
    INTO newEmployees VALUES (102, 'Biri', 'Ben', 44555, 'bbirir@mail.com', 2, NULL, 'Sales Rep')
    INTO newEmployees VALUES (103, 'Newman', 'Chad', 66777, 'cnewman@mail.com', 3, NULL, 'Sales Rep')
    INTO newEmployees VALUES (104, 'Ropeburn', 'Audrey', 77888, 'aropebur@mail.com', 1, NULL, 'Sales Rep')
    SELECT * FROM dual;
    
/*15. Set a Savepoint, called insertion, after inserting the data*/


SAVEPOINT insertion;


/*16. Rerun the update statement from Task 8 and run a query to view the data (copy the code down and
run it again)*/

UPDATE newEmployees SET jobtitle = 'unknown';

/*17. Rollback the transaction to the Savepoint created in task 15 above and run a query to view the data.
What does the data look like (i.e. describe what happened?*/

ROLLBACK TO insertion;
SELECT * FROM newEmployees;

--The changes made by the UPDATE command in task 16 have been reversed by the ROLLBACK command. The ROLLBACK command reverts
--back to the insertion SAVEPOINT

/*18. Use the basic for of the rollback statement and again view the data. Describe what the results look like
and what happened.*/

ROLLBACK;
SELECT * FROM newEmployees;

--All of the employees from the newEmployees table are gone. This ROLLBACK reverts the data back to how it was before the INSERT 
--command in task 14

/*Part B - Permissions*/

/*19. Write a statement that denies all access to the newemployees table for all public users*/

REVOKE ALL ON newEmployees FROM public;

/*20. Write a statement that allows a classmate (use their database login) read only access to the
newemployees table.*/

GRANT SELECT ON newEmployees TO dbs211_203a01;

/*21. Write a statement that allows the same classmate to modify (insert, update and delete) the data of the
newemployees table.*/

GRANT INSERT, UPDATE, DELETE ON newEmployees TO dbs211_203a01;

/*22. Write a statement the denies all access to the newemployees table for the same classmate.*/

REVOKE ALL ON newEmployees FROM dbs211_203a01;

/*Part C – Clean up*/

/*23. Write statements to permanently remove the view and table created for this lab*/

DROP TABLE newEmployees;
DROP VIEW vwNewEmps;



