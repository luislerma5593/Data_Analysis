# Prework

## Objetivo

Realizar consultas por medio de expresiones regulares.
Utilizar algunas de las principales operaciones aritméticas.
Realizar consultas a objetos anidados.
Definir agregaciones simples que permitan reutilizar consultas.

## Introducción

En la sesión anterior, conociste un poco de la sintaxis de las consultas en JSON para MongoDB. En esta sesión conocerás más tipos de consultas con el fin de que saques el máximo provecho de MongoDB. En general, nos centraremos en tres tipos de consultas: con expresiones regulares, con operaciones aritméticas, con objetos anidados y finalizamos con una breve introducción a las agregaciones.

## Expresiones regulares

Una expresión regular es una cadena que describe un patrón de caracteres. Se basan en la técnica de búsqueda de patrones a partir de una cadena de texto, en este caso almacenada en un documento.

La sintaxis para una expresión regular es la siguiente

/pattern/modifiers

El patrón describe la estructura que deben tener las cadenas a buscar y los modificadores permiten establecer modificadores, como buscar por mayúsculas o minúsculas indistintamente. A continuación se muestran algunos de estos modificadores:

Para hacer uso de expresiones regulares se usan filtros. Vemos algunos ejemplos:
Dada una colección de usuarios, obtener todos los documentos que contienen el nombre “Pepito”.

{nombre: “/Pepito/”}

En este caso, la búsqueda se realiza por coincidencia exacta.

Dada una colección de usuarios, obtener todos los documentos que contienen el nombre “Pepito”, realizar la búsqueda ignorando mayúsculas y minúsculas.

{nombre: “/Pepito/i”}

En este caso, se ignora si “Pepito” tiene mayúsculas o minúsculas
Dada una colección de direcciones, obtener todos los documentos que finalizan con 06.

{cp: “06$”}

El símbolo $ indica el final de una línea.
Dada una colección de direcciones, obtener todos los documentos que inician con 06.

{cp: “^06”}
El símbolo ^ indica el inicio de una línea.

Dada una colección de direcciones, obtener todos los documentos que incluyen un 06 en alguna parte.

{cp: “.*06.*”}

El símbolo .* indica que en ese espacio puede haber cualquier cadena.

## Consultas a objetos anidados

Existen documentos que pueden tener objetos anidados, es decir que dentro de su definición incluyen otros objetos ya sea dentro de un sólo campo o dentro de un arreglo, por ejemplo.
En estos casos, es usual que necesitemos recuperar valores de estos objetos, con cual usaremos la notación punto. Por ejemplo, supongamos que dentro de una colección persona, se encuentra un arreglo, de contactos con objetos de la persona:

{ nombre: “...”, telefono: “...”, correo: “...” }

Para acceder a los teléfonos de todos los contactos, usamos un proyección con la siguiente estructura:

{“contacto.telefono” = 1}

Observa cómo el campo de la proyección se encuentra delimitado por comillas dobles a diferencia de cómo lo hacíamos antes. Si omites las comillas, Mongo aplicará la proyección buscando un campo llamado contacto.telefono en lugar de aplicar la notación punto.
Mientras más niveles tenga la anidación de objetos u arreglos, más puntos deberás añadir.

## Introducción a las agregaciones

De la misma forma en que hacíamos subconsultas en SQL, es posible utilizar los resultados de otras consultas dentro de Mongo. Para ello, se define el concepto de agregación.
Las agregaciones son divididas por lo que se conoce como capa. Cada capa puede ver las columnas de la capa anterior y en cada paso se genera una nueva colección con los resultados correspondientes.

Con capas podemos agregar nuevos campos, proyectar campos, ordenar colecciones, filtrar información, realizar agrupamientos entre otras. Podemos pensar en las capas como una tubería (pipeline) que inicia en la colección original y después de ciertos procesamientos genera el resultado final.

Para realizar una agregación en MongoDB Compass, se debe seleccionar la colección y presionar la pestaña superior llamada “Aggregations”.

