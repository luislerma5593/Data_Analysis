# Work

Los documentos JSON son representaciones de objetos de la vida real. Por ejemplo, si yo quisiera representar a Luke Skywalker .

HOST: ec2-54-218-86-241.us-west-2.compute.amazonaws.com

USER: root

PASS:  *9ak/oVTwtY_eI:.  

PORT: 27017

### Nuevo Servidor

Les dejo los datos del nuevo servidor:

HOST: ec2-52-26-187-36.us-west-2.compute.amazonaws.com

USER: root

PASS: *9ak/oVTwtY_eI:.

PORT: 27017

## Ejercicio 1
```json
{
  "nombre": "Luis",
  "apellido": "Lerma de la Torre",
  "edad": 25,
  "pasatiempos": [
    "cine",
    "deportes",
    "musica"
  ],
  "carrera": "Automatizacion",
  "TienePerro": 1,
  "empresa": {
    "nombre": "AMI",
    "estado": "Monterrey",
    "país": "México"
  }
}
```

## Reto 1

1.Fecha, nombre y texto de cada comentario.

`{"date":1,"name":1,"text":1}`

2.Título, elenco y año de cada película.

`{"title":1,"cast":1,"year":1}`

3.Nombre y contraseña de cada usuario.

`{"name":1,"password":1}`

## Ejercicio 2

Operadores: https://docs.mongodb.com/manual/reference/operator/query/


Fltrar por tipo películas y el año mayor a 2010
```json
{"year":{"$gt":2010},"type":"movie"}
```

Filtrar por año mayor a 2010 y enos a 2015
```json
{"$and":[{"year":{"$gt":2010}},{"year":{"$lte":2015}}]}
```
Filtrar por año?1994 o año mayor a 2010
```json
{"$or":[{"year":{"$gt":2010}},{"year":1994}]}
```

AND y OR se usan como arreglos

SORT - {"year":1} # Se usa un 1 (ASC) o -1 (DESC)

LIMIT - Sólo un entero

## Reto 2

1. ¿Qué comentarios ha hecho Greg Powell?
```json
FILTER
{name:"Greg Powell"}
PROJECT
{name:1,text:1}
```

2. ¿Qué comentarios han hecho Greg Powell o Mercedes Tyler?
```json
FILTER
{"$or":[{"name":"Greg Powell"},{"name":"Mercedes Tyler"}]}
PROJECT
{name:1,text:1}
```

3. ¿Cuál es el máximo número de comentarios en una película?
```json
FILTER
PROJECT
{"num_mflix_comments":1}
SORT
{"num_mflix_comments":-1}
MAX TIME MS
COLLATION
SKIP
LIMIT 1
```

4. ¿Cuál es el título de las cinco películas más comentadas?

```json
FILTER
PROJECT
{"title":1,"_id":0}
SORT
{"num_mflix_comments":-1}
MAX TIME MS
COLLATION
SKIP
LIMIT 5
"
```
