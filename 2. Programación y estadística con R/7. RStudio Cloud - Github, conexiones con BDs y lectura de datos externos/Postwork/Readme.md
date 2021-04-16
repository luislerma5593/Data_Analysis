# Postwork

Utilizando el manejador de BDD Mongodb Compass (previamente instalado), deberás de realizar las siguientes acciones:

Alojar el fichero match.data.csv en una base de datos llamada match_games, nombrando al collection como match

Una vez hecho esto, realizar un count para conocer el número de registros que se tiene en la base

Realiza una consulta utilizando la sintaxis de Mongodb en la base de datos, para conocer el número de goles que metió el Real Madrid el 20 de diciembre de 2015 y contra que equipo jugó, ¿perdió ó fue goleada?

Por último, no olvides cerrar la conexión con la BDD

```json
[{$project: {
  month: {$month: '$date'},
  year: {$year: '$date'},
  day: {$dayOfMonth : '$date'},
  "home":1,
  "away":1

  }}, {$match: 

{year:2015,
  month:12,
  day:20,
  "home.team":"Real Madrid"
}}, {$addFields: {
  goles_Madrid :  "$home.score",
  goles_visita :  "$away.score"
}}]
```
Falta en R
