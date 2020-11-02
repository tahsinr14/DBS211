/* Name: Tahsin Rahman
Student ID: 165063199
Date: October 2, 2020
DBS211 - Lab 03 
*/
SET AUTOCOMMIT ON;

/*Question 1*/

SELECT * FROM offices;

/*Question 2*/

SELECT employeenumber
FROM employees 
WHERE officecode = 1;

/*Question 3*/

SELECT customernumber, customername, contactfirstname, contactlastname, phone
FROM customers 
WHERE city = 'Paris';

/*Question 4*/

SELECT CONCAT(contactlastname, contactfirstname)
FROM customers
WHERE country = 'Canada';

/*Question 5*/

SELECT DISTINCT customernumber
FROM payments
WHERE amount IS NOT NULL;

/*Question 6*/

SELECT customernumber, checknumber, amount
FROM payments
WHERE amount NOT BETWEEN 30000 and 65000
ORDER BY amount DESC;

/*Question 7*/

SELECT *
FROM orders
WHERE status = 'Cancelled';

/*Question 8*/

SELECT productname, productcode, buyprice, msrp,( msrp - buyprice ) AS markup,
 round(100 *(msrp - buyprice) / buyprice, 1) AS percmarkup
FROM products;

/*Question 9*/

SELECT *
FROM products
WHERE LOWER(productname) LIKE '%co%';

/*Question 10*/

SELECT customername
FROM customers
WHERE LOWER(customername) LIKE 's%e%';

/*Question 11*/

INSERT INTO employees 
VALUES(9397,'Rahman','Tahsin','x0613','trahman31@myseneca.ca', 4, 1088,'Cashier');

/*Question 12*/

SELECT *
FROM employees
WHERE employeenumber = 9397;

/*Question 13*/

UPDATE employees 
SET jobtitle = 'Head Cashier'
WHERE employeenumber = 9397;

/*Question 14*/

INSERT INTO employees (employeenumber, lastname, firstname, extension, email, officecode, reportsto, jobtitle)
    VALUES (1993, 'Yoongi', 'Min', 'x255', 'minpd@bts.com', 4, 1893, 'Cashier');
    
/*Question 15*/

DELETE FROM employees
WHERE employeenumber = 9397; /* did not work as it has child record*/

/*Question 16*/

DELETE FROM employees
WHERE employeenumber = 1993; /*I was able to delete myself from database as it does not have child record*/

/*Question 17*/

INSERT ALL
INTO employees VALUES(9397,'Rahman','Tahsin','x0613','trahman31@myseneca.ca','4','1088','Head Cashier')

INTO employees VALUES(1993, 'Yoongi', 'Min', 'x255', 'minpd@gmail.com', 3, 1013, 'Cashier')

SELECT * FROM DUAL;

/*Question 18*/

DELETE FROM employees
WHERE employeenumber IN (9397, 1993);


