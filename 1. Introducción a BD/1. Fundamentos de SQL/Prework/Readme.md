
# Prework

## Objetivo

Identificar los conceptos básicos de las bases de datos relacionales.
 Analizar y comprender cada una de las partes involucradas en una conexión con bases de datos.
Describir tablas para conocer sus campos, tipos de datos y otros datos.
Reconocer la estructura básica de una consulta en SQL mediante la instrucción SELECT y ordenar los datos de salida mediante la cláusula ORDER BY.

## Terminología Básica

En las bases de datos relacionales existe un vocabulario específico con el objetivo de que las personas dedicadas a esta actividad puedan entender de qué se trata cada uno de los elementos involucrados. A continuación se definen algunos de estos conceptos. 

Definición 1 (Dato) Un dato es considerado la unidad mínima de información. Por sí mismo no provee un significado particular, simplemente es un ente que requiere de una interpretación para dar lugar a la información. 

Definición 2 (Información) Es un conjunto de datos que a través del procesamiento adecuado adquieren un significado en un contexto determinado. 

Definición 3 (Base de datos) Es un conjunto de datos con alguna característica en común, puede ser un tema, situación geográfica o algún elemento que los relacione, además de que pueden estar almacenados de manera tradicional (impresos en papel) o en formato digital como un archivo. Las bases de datos relacionales se basan en el Modelo relacional, propuesto por Edgar F. Codd en los años setenta. Veamos algunos de sus principales elementos más adelante, te presentamos un ejemplo para que puedas observar los elementos de manera más clara): 

Definición 4 (Tabla) Una tabla o relación es una entidad con atributos, campos o columnas y tuplas, registros o renglones. Una tabla representa a un número indefinido de elementos descritos con características en común, cada uno en un diferente renglón. 

Definición 5 (Registros) Los registros, también llamados tuplas o renglones, se refieren a la descripción de cada ente de la tabla. Son instancias particulares, por ejemplo, si tenemos una tabla Persona, un registro contendrá una persona sus datos particulares. 

Definición 6 (Campo) Los campos o atributos se refieren a las columnas de las tablas y representan una característica particular de cada entidad. Por ejemplo para una persona podrían haber campos para el nombre, edad, dirección, etc. Es importante recordar que los campos son comunes a todos los registros de una tabla. 

Definición 7 (Dominio) El dominio se refiere al número de valores que puede obtener una columna, por ejemplo si tuviéramos un campo para almacenar el estado civil, su dominio sería 2 en el caso de tener los valores soltero o casado. 

Definición 8 (Cardinalidad) Es el número de registros que tiene una tabla. 

Definición 9 (Grado) Es el número de campos que tiene una tabla. Veamos un ejemplo para asegurarnos que has comprendido estos conceptos. Tenemos la siguiente tabla que representa un conjunto de usuarios almacenados en una base de datos.

En la tabla anterior, tenemos: 
Seis columnas que describen a cada usuario, por lo tanto el grado es en efecto 6. Ya que el número de campos de una tabla es el grado. En este caso las seis columnas son: id, nombre, apellido_paterno, apellido_materno, correo y contraseña.
 Se tienen tres registros, que describen a tres usuarios distintos y el dominio del campo id, en este caso es 3, pues tienen tres valores distintos. → id = al número de registros.
 Existen varios sistemas que permiten diseñar, crear y administrar en general bases de datos relacionales, este tipo de software recibe el nombre de Sistema Gestor de Bases de Bases de Datos (SGBD). Algunos de los sistemas más populares hoy en día son: 
Oracle Database
 MySQL
 MariaDB
 PostgreSQL
 Microsoft SQL Server
 Ahora no es muy importante que reconozcas todas las características de cada una, pero en cada nombre encontrarás hipervínculos donde puedes revisar sus descripciones.


## Conexión a una Base de Datos

Las bases de datos por lo general tienen cientos y miles de registros. Por ejemplo, ¿puedes imaginar cuantos registros tiene la base de datos de los usuarios de Facebook? ¡Miles de millones! Para almacenar las bases de datos, por lo general, una computadora personal como nuestra vieja y confiable laptop no son suficientes, de manera tal que necesitamos alojarla en un servidor. Un servidor es, en pocas palabras, un equipo de cómputo súper potente que que forma parte de una red de computadora y que provee distintos servicios a otros equipos llamados “clientes”. A los servidores que almacenan bases de datos se les llama Servidores de Bases de Datos. Para conectarnos a un servidor, necesitamos de cuatro cosas esenciales: 
La dirección del servidor, también llamada host.
 El usuario con el cual nos vamos a conectar.
 Una contraseña de acceso.
 Y el puerto a través del cual realizaremos la conexión.
 En esta primera parte del módulo, usaremos como cliente a Workbench. Workbench es un cliente de MySQL que permite conectarse con servidores de bases de datos para crear nuevas bases de datos, hacer consultas, crear tablas, entre muchas otras tareas. Para conectarse a un servidor de bases de datos, Workbench provee la siguiente pantalla:

Una vez que nos conectemos al servidor de bases de datos, podemos encontrar muchas bases dentro del mismo, por ejemplo, si fuera un servidor de bases de datos para un restaurante, podríamos encontrar una base de datos para el inventario, otra para la nómina de los empleados, otra para el menú, entre muchas otras.

## Comunicación con la base de datos

Las bases de datos relacionales, tiene su propio lenguaje, con éste nos podemos comunicar con ellas y pedirles que realicen algunas acciones, este lenguaje es llamado SQL y es un estándar para bases de datos relacionales. Cada SGBD tiene su propia implementación de SQL, añadiendo características especiales, pero sigue en general un estándar. La primera instrucción de SQL que estudiaremos será USE que permite conectarse a una base de datos. Su sintaxis es la siguiente: Las bases de datos relacionales, tiene su propio lenguaje, con éste nos podemos comunicar con ellas y pedirles que realicen algunas acciones, este lenguaje es llamado SQL y es un estándar para bases de datos relacionales. Cada SGBD tiene su propia implementación de SQL, añadiendo características especiales, pero sigue en general un estándar. La primera instrucción de SQL que estudiaremos será USE que permite conectarse a una base de datos. Su sintaxis es la siguiente: USE <nombre_de_la_base>; Por ejemplo, para conectarnos a la base de datos del inventario del restaurante podríamos escribir algo como: USE inventario; Para saber qué bases de datos hay en un servidor, se puede usar el comando:  SHOW DATABASES; Observa que todas las instrucciones deben terminar con un punto y coma. Esto está diseñado de esa manera pues en SQL pueden definirse pequeños procedimientos que ejecutan varios comandos a la vez y esta es la forma en la que el lenguaje detecta donde termina e inicia una instrucción.

## Estructura de una Tabla

Una vez conectados a la base de datos y dependiendo de cómo esté definida, podremos ver todas las tablas contenidas en la misma, mediante el comando: SHOW TABLES; Como mencionamos antes, una tabla se conforma de un conjunto de columnas que describen cada registro que se almacena en la misma. Para conocer los campos de una tabla, puede usarse el comando DESCRIBE que muestra los campos de la misma y el tipo de dato a almacenar. DESCRIBE <nombre_tabla>; Por ejemplo, supongamos que existe en una base de datos, la tabla movies. Al ejecutar el comando DESCRIBE sobre la misma, podríamos obtener un resultado como: DESCRIBE movies;

En realidad, MySQL arroja más resultados cuando realizamos una operación DESCRIBE. Sin embargo, hasta este punto basta con que analicemos estos dos campos. El resultado de la descripción, nos indica que la tabla incluye tres campos: id, título y género y nos muestra el tipo de dato que almacena cada uno. Los tipos de datos nos permiten manipular de forma más eficientes los datos almacenados, por ejemplo, si tenemos un campo numérico, esto facilitará que podemos hacer alguna operación aritmética con ella. En nuestro ejemplo se muestra dos tipos de datos: int y varchar que indican que cada campo almacena números enteros y cadenas de caracteres respectivamente. Para conocer más de los tipos de datos que se le asignan a una columna, puedes consultar la documentación de MySQL: Data Types.

## Estructura Básica de una Consulta

Ahora que sabemos cómo está definida la estructura de una tabla podemos obtener los registros que tiene. Para hacer esto, haremos uso de la instrucción SELECT que permite obtener registros de una tabla a partir del nombre de los campos y de la tabla. A continuación se muestra la estructura de un SELECT en su forma más básica.
SELECT <campo1>, <campo2>, … FROM <tabla>;
Esta estructura permite seleccionar (algunos autores lo llaman proyectar) los registros. La primera parte , , … indica los campos que se mostrarán, separados por comas. Por otro lado la parte indica la tabla de la cual tomaremos los datos. Por ejemplo, supongamos que queremos visualizar los registros almacenados en la columna título de la tabla movies, tendríamos que escribir la instrucción:
SELECT titulo FROM movies;

Este tipo de instrucciones recibe el nombre de “consulta” pues como su nombre lo indica, se realiza una consulta de los registros que hay en la tabla correspondiente. Observa que los resultados de una consulta siempre se muestran en una tabla, aún cuando sólo contengan un único registro. Si quisiéramos traer todos los campos de una tabla, pueden reemplazarse los nombres de las columnas por un asterisco, por ejemplo:
SELECT * FROM movies;

También podemos aplicar filtros a los resultados con el fin de facilitar la búsqueda de datos. Por ejemplo, supongamos que queremos los datos de aquellos registros cuyo nombre es “Toy Story”. Para filtrar resultados se añade la restricción WHERE a la consulta, por ejemplo:
SELECT * FROM movies WHERE titulo = ‘Toy Story’;

Con WHERE podemos utilizar operadores relacionales, lógicos y algunos otros de utilidad con el fin de hacer combinaciones de filtros. La siguiente tabla muestra algunos de estos operadores. Es importante que los identifiques y comprendas ya que son los caracteres que te van a permitir realizar operaciones matemáticas, concatenar cadenas y hacer comparaciones.



## Ordenamientos y Límites
Otras restricciones que pueden aplicarse a las consultas son ORDER BY y LIMIT. La primera le indica a la consulta la forma en que debe mostrar los datos, ordenando los mismos por un campo de forma ascendente (ASC) o descendente (DESC). Por defecto, los resultados siempre son ordenados de forma ascendente. La segunda restricción, indica el número de registros máximo que traerá la consulta. Por ejemplo, la siguiente consulta, ordena los resultados por el campo edad de forma descendente y limita los registros a 3.
SELECT * FROM persona WHERE estatura = 1.75 ORDER BY edad DESC LIMIT 3;
Por otro lado las siguiente consulta, ordenan de forma ascendente. Son equivalentes.
SELECT * FROM persona WHERE estatura = 1.75 ORDER BY edad LIMIT 3; SELECT * FROM persona WHERE estatura = 1.75 ORDER BY edad ASC LIMIT 3;
