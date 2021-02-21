# Proyecto

Continuaremos trabajando con la base de datos de películas y sus comentarios.

El proyecto consiste en obtener, por país, el número de películas que hay de cada género. Un ejemplo de salida en formato de tabla sería:

pais	genero	peliculas

USA	Short	10

USA	Drama	20

...	...	...

```json
[{$unwind: {
  path: "$genres",

}}, {$unwind: {
  path: "$countries",

}}, {$group: {
  _id : {Country:"$countries",Genre:"$genres"},
  "Count": {
    "$sum": 1
  }
}}, {$addFields: {
  Country: "$_id.Country",
  Genre: "$_id.Genre"
}}, {$project: {
  _id:0
}}, {$sort: {
  Count: -1
}}]
```
