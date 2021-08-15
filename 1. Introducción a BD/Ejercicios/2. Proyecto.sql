# USE TIENDA / CLASSICMODELS

# 1. Dentro de la tabla employees, obten el número de empleado, apellido y nombre de todos los empleados cuyo nombre empiece con a.
SELECT id_empleado, apellido_paterno, nombre 
FROM empleado
WHERE nombre LIKE "A%";

# 2. Dentro de la tabla employees, obten el número de empleado, apellido y nombre de todos los empleados cuyo nombre termina con on.
SELECT id_empleado, apellido_paterno, nombre
FROM empleado
WHERE nombre LIKE "%o";

# 3. Dentro de la tabla employees, obten el número de empleado, apellido y nombre de todos los empleados cuyo nombre incluye la cadena on.
SELECT employeeNumber, lastName, firstName
FROM classicmodels.employees
WHERE firstName LIKE "%on%";

# 4. Dentro de la tabla employees, obten el número de empleado, apellido y nombre de todos los empleados cuyos nombres tienen tres letras e inician con T y finalizan con m.
SELECT employeeNumber, lastName, firstName
FROM classicmodels.employees
WHERE firstName LIKE "___"
	AND firstName LIKE "T%"
    AND firstName LIKE "%m";

# 5. Dentro de la tabla employees, obten el número de empleado, apellido y nombre de todos los empleados cuyo nombre no inicia con B.
SELECT id_empleado, apellido_paterno, nombre
FROM empleado
WHERE nombre NOT LIKE "B%";

# 6. Dentro de la tabla products, obten el código de producto y nombre de los productos cuyo código incluye la cadena _20. / REVISAR
SELECT productCode, productName
FROM classicmodels.products
WHERE productCode LIKE "%_20%";

# 7. Dentro de la tabla orderdetails, obten el total de cada orden.
SELECT orderNumber, SUM(quantityOrdered * priceEach) AS Total #SUM para indicar qué hacer con los totales por producto
FROM orderdetails
GROUP BY orderNumber; 

# 8. Dentro de la tabla orders obten el número de órdenes por año.
SELECT YEAR(orderDate) AS Year, count(*) AS Total_Counts
FROM orders
GROUP BY YEAR(orderDate);
	
# 9. Obten el apellido y nombre de los empleados cuya oficina está ubicada en USA.
SELECT lastName, firstName, officeCode
FROM employees
WHERE officeCode IN
	(SELECT officeCode FROM offices WHERE country = "USA");

# 10. Obten el número de cliente, número de cheque y cantidad del cliente que ha realizado el pago más alto.
SELECT
 (SELECT customerName FROM customers  WHERE customerNumber = payments.customerNumber) AS Customer_Name,
 customerNumber,
 checkNumber,
 amount
 FROM payments
 ORDER BY amount DESC
 LIMIT 1;
 
# 11. Obten el número de cliente, número de cheque y cantidad de aquellos clientes cuyo pago es más alto que el promedio.
SELECT customerNumber, checkNumber, amount
FROM payments
WHERE amount > (SELECT AVG(amount) FROM payments);

# 12. Obten el nombre de aquellos clientes que no han hecho ninguna orden.
SELECT customerName
FROM customers
WHERE customerNumber NOT IN 
	(SELECT customerNumber FROM payments);

# 13. Obten el máximo, mínimo y promedio del número de productos en las órdenes de venta.
SELECT MAX(quantityOrdered),  MIN(quantityOrdered), AVG(quantityOrdered)
FROM (SELECT orderNumber, SUM(quantityOrdered) AS quantityOrdered FROM orderdetails GROUP BY orderNumber) AS Subconsulta;

# 14. Dentro de la tabla orders, obten el número de órdenes que hay por cada estado.
SELECT 
 (SELECT city FROM customers WHERE customerNumber = orders.customerNumber) AS city,
 count(*)
FROM orders
GROUP BY city;





