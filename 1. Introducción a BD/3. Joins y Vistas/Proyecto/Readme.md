# PROYECTO 3
```sql
# 1. Obtén el primer nombre y apellido de los empleados cuya oficina está ubicada en USA.
SELECT firstName AS Name, lastName AS Last_Name
FROM employees
JOIN  offices
ON employees.officeCode = offices.officeCode
WHERE offices.country = "USA";

# 2. Presenta en una tabla el nombre de los clientes junto con su número de órdenes no canceladas, ordénalas de mayor a menor.
SELECT customers.contactFirstName, count(*) AS Count
FROM customers
JOIN orders
ON customers.customerNumber = orders.customerNumber
WHERE orders.status != "Cancelled"
GROUP BY customers.contactFirstName
ORDER BY Count DESC;

# 3. Muestra el número de empleados por oficina, incluye las oficinas que no tengan empleado.
SELECT offices.officeCode, count(employees.employeeNumber) AS Count
FROM offices
LEFT JOIN employees
ON offices.officeCode = employees.officeCode
GROUP BY offices.officeCode;

# 4. Obtén los clientes que no tienen una orden asociada.
SELECT customerName, orderNumber 
FROM customers
LEFT JOIN orders
ON customers.customerNumber = orders.customerNumber
WHERE orderDate IS NULL;

# 5. Crea una vista llamada monthly_sales que muestre el histórico de montos de venta por mes. NOTA : Puedes usar las funciones YEAR() y MONTH() de SQL para extraer el año y mes de una fecha
CREATE VIEW LL_monthly_sales AS
	SELECT YEAR(orderDate) AS Year, MONTH(orderDate) AS Month, SUM(orderdetails.quantityOrdered * orderdetails.priceEach) AS Total	
	FROM orders
	JOIN orderdetails
	ON orders.orderNumber = orderdetails.orderNumber
	WHERE orders.status != "Cancelled"
	GROUP BY YEAR(orderDate), MONTH(orderDate);

# 6. Crea una vista llamada average_ticket en donde se muestre el ticket promedio (monto de venta promedio) por país de origen del cliente.
CREATE VIEW LL_average_ticket AS
SELECT Country, AVG(Total)
FROM
(SELECT country, orders.orderNumber, SUM(orderdetails.quantityOrdered * orderdetails.priceEach) AS Total
	FROM orders
	JOIN orderdetails
	on orderdetails.orderNumber = orders.orderNumber
		JOIN customers 
		ON orders.customerNumber = customers.customerNumber
	GROUP BY customers.country, orders.orderNumber
    ORDER BY country) AS T
GROUP BY Country;
```
    
    

