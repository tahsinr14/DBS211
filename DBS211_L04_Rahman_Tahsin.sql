/* Name: Tahsin Rahman
Student ID: 
Date: October 8, 2020
DBS211 - Lab 04 
*/

SET AUTOCOMMIT ON;

/*Question 1*/
--a)
SELECT  e.employeenumber, e.firstname, e.lastname, o.city, o.phone, o.postalcode
FROM employees e, offices o
WHERE o.officecode = e.officecode
AND o.country = 'France';

--b)
SELECT  e.employeenumber, e.firstname, e.lastname, o.city, o.phone, o.postalcode
FROM employees e
INNER JOIN offices o ON o.officecode = e.officecode
WHERE o.country = 'France';

/*Question 2*/

SELECT p.customernumber, c.customername, to_char(p.paymentdate, 'Month DD, YYYY') AS paymentdate, p.amount
FROM payments p
INNER JOIN customers c ON p.customernumber = c.customernumber
WHERE c.country = 'Canada'
ORDER BY customernumber;

/*Question 3*/

SELECT c.customernumber, c.customername 
FROM customers c
LEFT JOIN payments p on p.customernumber = c.customernumber
WHERE c.country = 'USA' 
AND p.customernumber IS NULL
ORDER BY c.customernumber;

/*Question 4*/
--a)
CREATE VIEW vwCustomerOrder AS
(SELECT c.customernumber, o.orderNumber, o.orderdate, p.productname, od.quantityordered, od.priceeach 
FROM customers c
LEFT JOIN orders o ON o.customernumber = c.customernumber
LEFT JOIN orderdetails od ON od.ordernumber = o.ordernumber
LEFT JOIN products p ON p.productcode = od.productcode
);

--b)
SELECT * 
FROM vwcustomerorder;

/*Question 5*/

SELECT * 
FROM vwcustomerorder vc
LEFT JOIN orderdetails od ON od.ordernumber = vc.ordernumber
WHERE customernumber = 124
ORDER BY vc.ordernumber  , od.orderlinenumber;

/*Question 6*/

SELECT c.customernumber, c.contactfirstname, c.contactlastname, c.phone, c.creditlimit
FROM customers c 
LEFT JOIN orders o ON o.customernumber = c.customernumber
WHERE o.customernumber IS NULL;

/*Question 7*/

CREATE VIEW vwEmployeeManager AS
(
SELECT e1.employeenumber, e1.lastname, e1.firstname, e1.extension, e1.email, e1.officecode, e1.reportsto, e1.jobtitle,
e2.Firstname AS Manager_FName, e2.Lastname AS Manager_LName --Manager information
FROM employees e1
LEFT JOIN employees e2 ON e1.reportsto = e2.employeenumber
);

/*Question 8*/

CREATE OR REPLACE VIEW vwEmployeeManager AS
(
SELECT e1.employeenumber, e1.lastname, e1.firstname, e1.extension, e1.email, e1.officecode, e1.reportsto, e1.jobtitle,
e2.firstname AS Manager_FName, e2.lastname AS Manager_LName --Manager information
FROM employees e1
LEFT JOIN employees e2 ON e1.reportsto = e2.employeenumber
WHERE e1.reportsto IS NOT NULL
);

/*Question 9*/

DROP VIEW vwcustomerorder;
DROP VIEW vwEmployeeManager;
