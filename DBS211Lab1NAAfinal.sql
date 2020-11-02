-- ----------------------------------
-- DBS211 - Lab 01
-- Name: Tahsin Rahman
-- StudentID: 165063199
-- Date: September 18, 2020
-- ----------------------------------

-- Question 1
/* How many tables have been created? List the names of the created tables. */

/*A: 8 tables have been created.
1. CUSTOMERS
2. EMPLOYEES
3. OFFICES
4. ORDERDETAILS
5. ORDERS
6. PAYMENTS
7. PRODUCTLINES
8. PRODUCTS*/


-- Question 2
/*Click on table customers. Click on the Data tab near the top of the worksheet. How many rows are
there in the table customers? */

/*A: There are 122 rows in the table customers. */


-- Question 3
/*What SQL statement would return the same results. Write the statement in the .sql file and execute it. */
SELECT * FROM customers;


-- Question 4
/*How many columns does the customers table have? List the column names. */

/*A: There are 13 columns.
1. CUSTOMERNUMBER
2. CUSTOMERNAME
3. CONTACTLASTNAME
4. CONTACTFIRSTNAME
5. PHONE
6. ADDRESSLINE1
7. ADDRESSLINE2
8. CITY
9. STATE
10. POSTALCODE
11. COUNTRY
12. SALESREPEMPLOYEENUMBER
13. CREDITLIMIT */


-- Question 5
/* What is the value of each column in the first row in table customers? Write the column name and the
column data type in addition to the value. */

/*A: 
First row:
103(number)| Atelier graphique(varchar2) | Schmitt(varchar2) | Carine(varchar2) | 40.32.2555(varchar2) |
54,rue Royale(varchar2)| null | Nantes(varchar2) | null | 44000(varchar2) | France(varchar2) | 1370(number) |
21000(number)
   */


-- Question 6
/*Write the number of rows and columns for the rest of the tables in your schema. Format it something
like the following. */

/*A: TABLE NAME                    ROWS                     COLUMNS
     EMPLOYEES                      23                         8
     OFFICES                         7                         9
     ORDERDETAILS                 2996                         5
     ORDERS                        326                         6
     PAYMENTS                      273                         4
     PRODUCTLINES                    7                         4
     PRODUCTS                      110                         9
*/


-- Question 7
/* Right Click on the orderdetails table and choose tables/count rows. How many rows does the order
details table include? */

/*A: The order details table includes 2996 rows. */


-- Question 8
/*Write the following SQL statement in the new tab.*/

desc offices;

/*What is the result of the statement execution?*/
/*A: The result is a description of the table.
Name         Null?    Type         
------------ -------- ------------ 
OFFICECODE   NOT NULL VARCHAR2(10) 
CITY         NOT NULL VARCHAR2(50) 
PHONE        NOT NULL VARCHAR2(50) 
ADDRESSLINE1 NOT NULL VARCHAR2(50) 
ADDRESSLINE2          VARCHAR2(50) 
STATE                 VARCHAR2(50) 
COUNTRY      NOT NULL VARCHAR2(50) 
POSTALCODE   NOT NULL VARCHAR2(15) 
TERRITORY    NOT NULL VARCHAR2(10) 
*/


-- Question 9
/*Type the following statements in, execute them, then briefly describe what the statement is doing!*/

SELECT * FROM employees;
SELECT * FROM customers ORDER BY ContactLastName;

/*A: The first statement lists the values ordered by the first column, EMPLOYEENUMBER and selects and opens tables from
Employees. The second statement lists and rearranges the values by the order of CONTACTLASTNAME alphabetically from
the list of customers. */

-- Question 10
/*How many constraints does the products table have?*/

/*A: The products table have 11 contraints. */


-- Question 11
/* Find a way to turn on line numbers in the gutter.*/

/*A: Right click on the gutter and choose 'Toggle Line Numbers'. */


-- Question 12
/* Set the font size in the worksheet editor to a size that is best for you. (Hint: Tools/Preferences)*/

/*A: To set the font size in the worksheet editor to a size that is best for me, I have to follow this steps:
Tools->Preferences->Code Editor->Fonts->Font Size-> 18
*/
