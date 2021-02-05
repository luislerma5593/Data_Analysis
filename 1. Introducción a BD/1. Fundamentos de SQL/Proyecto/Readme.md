## Proyecto 1


```sql
#1. Dentro del mismo servidor de bases de datos, conéctate al esquema kavak.
USE kavak;


#2. Obtén una tabla con sólo los nombres de las regiones en donde se venden autos.

SELECT * FROM region;

#3. Obtén una tabla con el nombre de los autos, su modelo y su precio.

SELECT name, model, price FROM car;

#4. Muestra el nombre y modelo de los autos que sean para 5 pasajeros.

SELECT name, model, passengers FROM car WHERE passengers = 5;

#5. Muestra el nombre, modelo y año de los autos que apliquen para Uber.

SELECT name, model, apply_uber, year FROM car WHERE apply_uber = 1;

#6. Muestra el nombre todos los autos cuyo año sea menor al 2015.

SELECT name, year FROM car WHERE year < 2015;

#7. Muestra el nombre todos los autos que sean del año 2016 o 2018.

SELECT * FROM kavak.car WHERE year=2018 OR year=2016;

#8. Muestra los todos los autos de cuyo precio sea mayor o igual a los 100000 pesos, menor a los 150000 y que tengan menos de 50000 km.
SELECT * FROM car WHERE price >=100000 AND price < 150000 AND km < 50000;

#9. Muestra los autos de modelo Aveo que sean de color AZUL, BLANCO, ROJO o GRIS.
SELECT * FROM car
WHERE model = "Aveo"
	AND color IN ("Azul","Blanco","Rojo","Gris");

#10. Muestra los autos de modelo Sentra que no sean de color BLANCO.
SELECT * FROM car
WHERE model = "Sentra"
	AND color != "Blanco";

#11. Muestra el nombre, modelo y año de todos los autos de la marca Nissan que apliquen para Uber. NOTA: Puede ser en dos o más consultas separadas.
SELECT name, model, year 
FROM car
WHERE make_id IN 
(SELECT id FROM kavak.make WHERE name = "Nissan")
	AND apply_uber = 1;

#12. Muestra el nombre y modelo de todos los autos de la marcas Audi, Mazda y KIA cuyo año sea menor o igual al 2017 y que apliquen para Uber. NOTA: Puede ser en dos o más consultas separadas.
SELECT * FROM kavak.make WHERE name IN ("Audi","Mazda","KIA"); #5, 7 y 13
SELECT * FROM kavak.car WHERE make_id IN (5,7,13) AND year <= 2017 AND apply_uber = 1;
#--> Subconsultas
SELECT *
FROM car
WHERE make_id IN
	(SELECT id FROM kavak.make WHERE name IN ("Audi","Mazda","KIA"))
    AND apply_uber = 1
    AND year <= 2017;
    

#13. Obtén el nombre de todas las marcas ordenado de manera descendente.
SELECT name
FROM make
ORDER BY name DESC;

#14 Muestra todos los autos de 7 pasajeros de transmisión automática cuyo precio esté entre los 200000 y 250000 pesos. Ordénalos de mayor a menor precio.
SELECT * FROM kavak.car WHERE passengers = 7 AND transmission = "Automática" AND price > 200000 AND price < 250000 ORDER BY price;

#15. Muestra los 10 autos de menor precio que apliquen para Uber y que sean de transmisión Automática.
SELECT *
FROM car
WHERE apply_uber = 1
	AND transmission = "Automática"
ORDER BY price
LIMIT 10;

#16. Muestra los 10 autos con menor kilometraje y ordénalos primero de mayor a menor año y después de menor a mayor precio.
SELECT * 
FROM kavak.car 
WHERE km IS NOT NULL 
ORDER BY 
	km ASC,
	year DESC, 
	price ASC 
LIMIT 10;

#17. Muestra los 3 primeros autos convertibles de menor precio que se vendan en la Ciudad de México y que sean de color ROJO pero que NO sean de transmisión Automática. NOTA: Puede ser en dos o más consultas separadas.
SELECT *
FROM car
WHERE body_type_id IN
	(SELECT id FROM body_type WHERE name = "Convertible") AND region_id IN
    (SELECT id FROM region WHERE name = "Ciudad de México")     
	AND color = "Rojo"
    AND transmission != "Automática"
ORDER BY price ASC
LIMIT 3;
```
