# Work

```sql
# 3. Joins y vistas
# SHOW KEYS FROM tienda.empleado;
```

## JOINS

### INNER JOIN
```sql
SELECT *
FROM tienda.empleado
JOIN tienda.puesto
ON empleado.id_puesto = puesto.id_puesto;
```

### LEFT JOIN
```sql
SELECT *
FROM tienda.puesto
LEFT JOIN tienda.empleado
ON empleado.id_puesto = puesto.id_puesto;
```

### RIGHT JOIN
```sql
SELECT *
FROM tienda.puesto
RIGHT JOIN tienda.empleado
ON empleado.id_puesto = puesto.id_puesto;
```

### 2 JOINS
```sql
SELECT
clave,
articulo.nombre AS articulo,
empleado.nombre AS empleado
FROM tienda.venta
JOIN tienda.articulo 
ON venta.id_articulo = articulo.id_articulo
	JOIN tienda.empleado
	ON venta.id_empleado = empleado.id_empleado;
  ```

### RETO 1 

```sql
# 1. Muestra una tabla con el nombre y marca de cada auto
SELECT 
car.name AS Modelo,
make.name AS Marca
FROM car
JOIN make
ON car.make_id = make.id;

# 2. ¿Cuántos autos hay por cada una de las ciudades?
SELECT region_id, count(*) AS Count
FROM car
GROUP BY  region_id;
# -->
SELECT region.name, count(*) AS Count
FROM kavak.car 
JOIN kavak.region
ON car.region_id = region.id
GROUP BY region_id; # OR  --> GROUP BY region.name;

# 3. Muestra una tabla con el nombre, marca y tipo de carrocería (body_type) de cada auto
SELECT car.name AS Modelo,
 make.name AS Marca,
 body_type.name as Tipo
FROM car
JOIN make
ON car.make_id = make.id
	JOIN body_type
    ON car.body_type_id = body_type.id;
```  

## VISTAS 

```sql
CREATE VIEW kavak.body_type_count3 AS
	SELECT region.name, count(*) AS Count
	FROM kavak.car 
	JOIN kavak.region
	ON car.region_id = region.id
	GROUP BY region_id;
  
#DROP VIEW kavak.body_type_count3
```
