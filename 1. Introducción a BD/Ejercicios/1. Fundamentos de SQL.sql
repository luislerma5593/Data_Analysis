#SHOW DATABASES;
#SHOW TABLES;
#DESCRIBE empleado;
#SELECT * FROM empleado;

USE tienda;

#	RETO 2

#1 ¿Cuál es el nombre de los empleados con el puesto 4?
SELECT * FROM empleado WHERE id_puesto = 4;

#2 ¿Qué puestos tienen un salario mayor a $10,000?
SELECT * from puesto WHERE salario > 10000;

#3 ¿Qué articulos tienen un precio mayor a $1,000 y un iva mayor a 100?
SELECT * FROM articulo WHERE precio > 1000 AND iva > 100;

#4 ¿Qué ventas incluyen los artículo 135 o 963 y fueron hechas por los empleados 835 o 369?
SELECT * from venta WHERE id_articulo IN (135,963) AND id_empleado IN (835,369);

#	EJEMPLO 4

SELECT * FROM puesto ORDER BY salario DESC;

SELECT * FROM empleado ORDER BY id_puesto ASC LIMIT 5;

#	RETO 3

# Usando la base de datos tienda, escribe una consulta que permita obtener el top 5 de puestos por salarios.

SELECT * from puesto ORDER BY salario DESC LIMIT 5;

#---------------------------------------------------------------
# El reto de sesión 1 pero con la BD de Kavak
SELECT * FROM kavak.car ORDER BY price;

#¿De que año es el auto más antiguo?
SELECT * FROM kavak.car ORDER BY year limit 1;

#¿Cuál son los 3 autos con mayor kilometraje?
SELECT * FROM kavak.car ORDER BY km DESC limit 1;

#¿Cuál es el auto que lleva más tiempo sin venderse?
SELECT * from car ORDER BY post_date limit 1;