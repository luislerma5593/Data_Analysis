# Proyecto

Las consultas se realizarán sobre la base sample_training.
Todas las consultas que realices deberás mantenerlas dentro del MongoDB Compass. Para hacer esto, da clic en el botón con los puntos ··· y en Toogle Query History. Busca la última consulta y agregala a favoritos presionando el íncono con la estrella ⭐.

1. Obtén los datos de contacto de cada compañía.
```json
PROJECT
{"email_address": 1, "phone_number": 1, "_id":0}
```
2. Obtén la fuente de cada tweet.
```json
PROJECT
{"source": 1 }
```
3. Obtén el nombre de todas las compañías fundadas en octubre.
```json
FILTER
{"founded_month":10}
PROJECT
{"founded_month":1,"created_at":1} 
 {"$or":[{"founded_month":10}, {"founded_month":9}]} (Septiembre u Octubre)
 ```
4. Obtén el nombre de todas las compañías fundadas en 2008.
```json
FILTER
{"founded_year":2008}
 ```
5. Obtén todos los post del autor machine.
```json
FILTER
{"author":"machine"}
 ```
6. Obtén todos los tweets provenientes de la web.}
```json
FILTER
{source:"web"}
 ```
7. Obtén todas las compañías fundadas en octubre del 2008.
```json
FILTER
{"founded_year":2008,"founded_month":10}
 ```
8. Obtén todas las compañías con más de 50 empleados.
```json
FILTER
{"number_of_employees":{"$gte":50}}
SORT
{"number_of_employees":1}
```
9. Obtén las historias con número de comentarios entre 10 y 30.
```json
FILTER
{"$and":[{"comments":{"$gte":10}},{"comments":{"$lte":30}}]}
SORT
{"comments":1}
 ```
10. Obtén la empresa con el menor número de empleados.
```json
FILTER
{"number_of_employees":{"$ne":null}}
PROJECT
{"number_of_employees":1,name:1}
SORT
{"number_of_employees":1}
LIMIT  
1
 ```
11. Obtén la empresa con el mayor número de empleados.
```json
FILTER
{"number_of_employees":{"$ne":null}}
PROJECT
{"number_of_employees":1,name:1}
SORT
{"number_of_employees":-1}
LIMIT  
1
 ```
12. Obtén la historia más comentada.
```json
PROJECT
{"title":1,"comments":1}
SORT
{"comments":-1}
LIMIT
1
 ```
13. Obtén la historia menos comentada.
```json
PROJECT
{"title":1,"comments":1}
SORT
{"comments":1}
LIMIT
1
```
