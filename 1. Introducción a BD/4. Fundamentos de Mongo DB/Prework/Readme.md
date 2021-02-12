
# Prework

## Objetivo

Conocer algunos de los principales tipos de bases de datos no relacionales existentes.
Realizar una conexión a un servidor de bases de datos con MongoDB.
Conocer los principales componentes de una base de datos en MongoDB.
Conocer JSON y sus principales elementos.
Escribir consultas básicas en MongoDB.


## Introducción

Adicional a las bases de datos relacionales, existe lo que se conoce como base de datos No Relacional cuya estructura no necesariamente incluye tablas o llaves que las relacionen. En esta sesión conocerás algunos tipos de bases de datos no relacionales y escribirás tus primeras consultas en MongoDB una de las bases de datos no relacionales más usadas en la actualidad.

## Bases de datos no relacionales

Las bases de datos no relacionales están diseñadas para modelos específicos y no tienen un lenguaje de consulta en común como es el caso de las base de datos relacionales que hacen uso de SQL. Debido a esto, este tipo de bases de datos son llamadas en ocasiones, bases de datos NoSQL.
La principal diferencia con las bases de datos relacionales, es que no existe una estructura común para el almacenamiento (tablas) y de hecho, no es necesario realizar un esquema previo, la estructura de datos se va generando conforme se van insertando valores.
Existen distintos tipos de bases de datos no relacionales, a continuación se describen algunas de éstas.
Bases de datos orientada a documentos Este tipo de base de datos se basan en la definición de lo que se conoce como Documento que sigue un formato específico. Los formatos más utilizados son JSON y BSON. Cada documento es similar a un registro en una base de datos relacional, sin embargo, dos documentos, no tienen porqué tener un esquema idéntico aunque almacene la misma colección de datos.

Por ejemplo, el siguiente documento almacena los datos de una persona en formato JSON.

```json
{ id: 1, nombre: “Mauricio Escutia”, edad: 24, peso: 65.0, estatus: 1.75 }
```

Al usar JSON se usa un modelo llave/valor. Esto es equivalente al valor de una columna en una base de datos relacional.
Bases de datos orientadas a llave/valor
Este tipo de bases de datos es muy similar a las bases de datos basadas en documentos, pues se usan documentos para almacenar información, la diferencia radica en que estos documentos se almacenan en una llave, con la cual puede recuperarse el documento. Por ejemplo, el siguiente documento se almacena en una llave persona1.

```json
persona1 => { id: 1, nombre: “Mauricio Escutia”, edad: 24, peso: 65.0, estatus: 1.75 }
```

De esta forma cambia ligeramente el modo de recuperar información y de hecho puede usarse a la par con bases de datos orientadas a documentos, lo cual es posible mediante el uso de Sistemas Gestores de Bases de Datos híbridos.
Bases de Datos Orientadas a Gráficas
Este tipo de bases de datos tratan los datos mediante lo que se conoce en matemáticas como gráfica y se manipulan según dicta la Teoría de Gráficas. Cada
base de datos se compone de vértices (representados por círculos) y aristas (representadas por líneas que relacionan los vértices).
Este tipo de bases de datos sólo permiten relaciones binarias, pues un vértice sólo puede ser conectado con otro mediante una arista. A continuación se muestra la gráfica de una base de datos.

## Conexión a una base de datos MongoDB

Al igual que con las bases de datos relacionales, es común que los datos se encuentren en servidores, por lo tanto, se necesitan los mismos datos para realizar la conexión con un servidor de bases de datos:

- La dirección del servidor, también llamada host.

- El usuario con el cual nos vamos a conectar.

- Una contraseña de acceso y el puerto a través del cual realizaremos la conexión.

En esta segunda parte del módulo, usaremos como cliente a MongoDB Compass. MongoDB Compass es un cliente de MongoDB que permite conectarse con servidores de bases de datos para crear nuevas bases de datos, hacer consultas, crear documentos, entre muchas otras tareas.
Para conectarse a un servidor de bases de datos. Compass provee la siguiente pantalla:

Una vez que nos conectemos al servidor de bases de datos, podemos encontrar muchas bases dentro del mismo, por ejemplo, si fuera un servidor de bases de datos para un restaurante, podríamos encontrar una base de datos para el inventario, otra para la nómina de los empleados, otra para el menú, entre muchas otras.
Elementos de MongoDB
MongoDB es un Gestor de Bases de Datos no relacionales orientado a documentos que también hace uso de la orientación llave/valor. Su nombre proviene del inglés humongous y usa el formato BSON (JSON compilador) para almacenar datos. Es uno de los gestores más conocidos, al mismo nivel que MySQL de las bases de datos relacionales. A continuación se listan algunas definiciones básicas de este gestor.

- Definición 1. (JSON) Es un formato compacto de representación de objetos. Es un formato de intercambio de información y su uso nació del lenguaje JavaScript.

- Definición 2. (Documento) Es un conjunto de datos semiestructurados, que contienen parejas de la forma llave/valor, usando BSON como formato de almacenamiento.

- Definición 3. (Colección) Es un conjunto de documentos.

Podemos dar una comparación de esta terminología con las bases de datos relacionales:

-  Tabla -> Colección

-  Registro -> Documento

-  Columna -> Llave

## Documentos JSON

Para representar documentos se hace uso de JSON. Un documentos JSON está formado por los siguientes elementos.
Objetos. Son conjuntos desordenados de pares llave/valor. Cada objeto inicia con una llave que abre { y finaliza con una llave que cierra }. Cada par se separa con una coma.
Valores. Pueden ser cadenas, números, booleanos, null, objetos o arreglos. Estos pueden anidarse.
Arreglos. Son una colección de valores. Comienzan con un corchete izquierdo [ y finalizan con un corchete derecho ]. Cada valor se separa por una coma.
Por ejemplo, se tiene el siguiente documento JSON con los datos de un Pokémon.
{ id: 1, nombre: “Bulbasaur”, tipo: [“Hierba”, “Venenoso”] }

## Consultas

Para facilitar el proceso de consulta, Compass provee una interfaz gráfica que permite interactuar de forma sencilla e intuitiva con las distintas colecciones.

En esta sesión haremos uso de proyecciones, filtros, ordenamiento y limitaremos el número de documentos por consulta. Para realizar consultas usaremos JSON como lenguaje de intercambio de información.
