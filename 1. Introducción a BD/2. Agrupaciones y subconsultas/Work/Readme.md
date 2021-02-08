# Work

```sql
#	Sesión 2 - Agrupamientos y subconsultas

SELECT * FROM tienda.empleado WHERE nombre like BINARY "%l"; # BINARY es para que sea sensible a las mayúsculas

#1. Selecciona todos los autos que incluyen en su nombre la palabra "1.6l";
SELECT * FROM kavak.car WHERE name LIKE "%1.6l%";

#2. Selecciona todos los nombres de las marcas que empiecen con la letra A
SELECT * FROM kavak.make WHERE name LIKE "A%";

#3. Selecciona todos los modelos que contengan 4 caracteres.
SELECT model FROM kavak.car WHERE model LIKE "____";

SELECT 1+1 AS "SUMA";

SELECT
MAX(precio) AS maxp,
MIN(precio) AS minp
FROM tienda.articulo;

SELECT
count(*) AS cont #Puede ser sin AS
FROM tienda.articulo;

SELECT 
precio, 
cantidad, 
(precio * cantidad) AS total
FROM tienda.articulo;

# Reto 2

#¿Cuál es el promedio un auto en Kavak?
SELECT
avg(price) AS Promedio
FROM kavak.car;

#¿Cuántos artículos según su nomre son de 1.6l?
SELECT count(*) 
FROM kavak.car
WHERE name LIKE "%1.6l";

#¿Cuál es el precio mínimo y máximo de todos los autos?
SELECT 
min(price), 
max(price)
FROM kavak.car;

#¿Cuál es la suma del precio de los tres autos más caros?
SELECT id FROM kavak.car ORDER BY price DESC LIMIT 3;
SELECT sum(price) FROM kavak.car WHERE id IN(4167,413,4474);

#	EJEMPLO 3

SELECT * FROM tienda.articulo;

SELECT nombre, sum(precio) AS total 
FROM tienda.articulo 
GROUP BY nombre;

SELECT nombre, count(*) AS count 
FROM tienda.articulo 
GROUP BY nombre
ORDER BY count DESC;

SELECT nombre, min(precio), max(precio)
FROM tienda.articulo 
GROUP BY nombre;

#	RETO 3	https://github.com/MarioHdpz/21-01-Introduccion-a-Bases-de-Datos-2020/blob/main/Sesion-02/Reto-03/Readme.md

#1. ¿Cuántos registros hay por cada uno de los modelos?
SELECT model, count(*) AS count
FROM kavak.car
GROUP BY model
ORDER BY count DESC;

#2. ¿Cuál es el promedio de kilometraje de los autos dependiendo de su año?
SELECT year, avg(km) AS Promedio_km
FROM kavak.car
GROUP BY year;

#3. ¿Cuál son las 10 combinaciones de color - transmisión más comunes? (P.E. BLANCO - Automático)
SELECT color, transmission, count(*) AS COUNT
FROM kavak.car
GROUP BY color, transmission
ORDER BY count DESC
LIMIT 10;

SELECT model
FROM kavak.car
GROUP BY model;

#select * from kavak.car where passengers is null;
#select passengers, count(*) from kavak.car group by passengers;
#select count(*) from kavak.car where passengers is null;
```

###	EJEMPLO 4

## Subconsulta simple

Dentro del WHERE, es para filtrar registros.

```sql
SELECT * FROM tienda.puesto WHERE nombre = 'Junior Executive';

#Subconsulta simple

SELECT * 
FROM tienda.empleado 
WHERE id_puesto IN (
	SELECT id_puesto FROM tienda.puesto WHERE nombre = "Junior Executive");
```
## Subconsulta correlacionada

Dentro del SELECT, es para agregar campos.

```sql
SELECT salario FROM tienda.puesto WHERE id_puesto=235 ;   
SELECT * FROM tienda.empleado;
#--> Conocer el salario de Enriqueta
SELECT 
id_empleado,
id_puesto,
nombre,
(SELECT salario FROM tienda.puesto WHERE empleado.id_puesto=puesto.id_puesto) AS salario,
(SELECT nombre FROM tienda.puesto WHERE empleado.id_puesto=puesto.id_puesto) AS puesto
 FROM tienda.empleado;
```

## Subconsulta de vista

Dentro del FROM, es para hacer una consulta sobre una consulta realizada previamente.

```sql
SELECT nombre, AVG(salario) AS salario FROM tienda.puesto GROUP BY nombre;

SELECT MAX(salario), MIN(salario) FROM(
SELECT nombre, AVG(salario) AS salario FROM tienda.puesto GROUP BY nombre) AS subconsulta;
```

### Reto 4

```sql
# 	RETO 4 - https://github.com/MarioHdpz/21-01-Introduccion-a-Bases-de-Datos-2020/blob/main/Sesion-02/Reto-04/Readme.md

# 1. Muestra cuántos autos se venden en total en la Ciudad de México y Guadalajara.
SELECT region_id AS Region, count(*) AS Count
FROM kavak.car 
WHERE region_id IN
	(SELECT id FROM kavak.region WHERE name = "Ciudad de México" OR name = "Guadalajara") GROUP BY region_id;
    
# 2. Muestra el nombre de la marca y el número de autos que hay por cada una de ellas.
SELECT make_id AS Make,
(SELECT name FROM kavak.make WHERE id =  car.make_id) AS name, 
count(*) AS count
FROM kavak.car 
GROUP BY make_id;

# 3. Muestra el promedio de autos por año.

SELECT AVG(count) FROM(
	SELECT year, count(*) AS count FROM kavak.car GROUP BY year) AS b;
  ```
