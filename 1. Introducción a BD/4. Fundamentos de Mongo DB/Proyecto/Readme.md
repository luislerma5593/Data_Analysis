# Proyecto

Las consultas se realizarán sobre la base sample_training.
Todas las consultas que realices deberás mantenerlas dentro del MongoDB Compass. Para hacer esto, da clic en el botón con los puntos ··· y en Toogle Query History. Busca la última consulta y agregala a favoritos presionando el íncono con la estrella ⭐.
Obtén los datos de contacto de cada compañía.
PROJECT
{"email_address": 1, "phone_number": 1, "_id":0}
Obtén la fuente de cada tweet.
PROJECT
{"source": 1 }
Obtén el nombre de todas las compañías fundadas en octubre.
FILTER
{"founded_month":10}
PROJECT
{"founded_month":1,"created_at":1} 
 {"$or":[{"founded_month":10}, {"founded_month":9}]} (Septiembre u Octubre)
Obtén el nombre de todas las compañías fundadas en 2008.
FILTER
{"founded_year":2008}
 
Obtén todos los post del autor machine.
FILTER
{"author":"machine"}
 
Obtén todos los tweets provenientes de la web.}
FILTER
{source:"web"}
 
Obtén todas las compañías fundadas en octubre del 2008.
FILTER
{"founded_year":2008,"founded_month":10}
 
Obtén todas las compañías con más de 50 empleados.
FILTER
{"number_of_employees":{"$gte":50}}
SORT
{"number_of_employees":1}
Obtén las historias con número de comentarios entre 10 y 30.
FILTER
{"$and":[{"comments":{"$gte":10}},{"comments":{"$lte":30}}]}
SORT
{"comments":1}
 
Obtén la empresa con el menor número de empleados.
FILTER
{"number_of_employees":{"$ne":null}}
PROJECT
{"number_of_employees":1,name:1}
SORT
{"number_of_employees":1}
LIMIT  
1
 
Obtén la empresa con el mayor número de empleados.
FILTER
{"number_of_employees":{"$ne":null}}
PROJECT
{"number_of_employees":1,name:1}
SORT
{"number_of_employees":-1}
LIMIT  
1
 
Obtén la historia más comentada.
PROJECT
{"title":1,"comments":1}
SORT
{"comments":-1}
LIMIT
1
 
Obtén la historia menos comentada.
PROJECT
{"title":1,"comments":1}
SORT
{"comments":1}
LIMIT
1

