# Postwork

Planteamiento del Proyecto
A lo largo del programa deberás desarrollar un proyecto. En este postwork, debes definir con qué conjunto de datos vas a trabajar, si es un proyecto de datos propios o vas a seleccionar algún conjunto de datos público.

Si haces uso de los datos públicos a continuación algunas sugerencias para buscar y descargar conjuntos de datos

https://datos.gob.mx

https://grouplens.org

https://www.kaggle.com

https://archive.ics.uci.edu/ml/datasets.php

Te recomendamos descargar archivos en alguno de los siguientes formatos:

- CSV (Muy recomendado)

- JSON

- XML (Pregunta antes al experto)

Trata que sean bases de datos significativas, que incluyan tipos de datos diversos como fechas, cantidades, direcciones, entre otras. No te limites, confiamos en que lograrás resolver cualquier reto que te propongas y siempre estaremos ahí para apoyarte.

Una vez que sepas con qué datos vas a trabajar, define cómo los usarás y qué problema vas a resolver. Ten esto muy en cuenta pues lo usaremos en las siguientes sesiones.

Te recomendamos plantear en un diagrama las bases de datos que vas a utilizar. Este tipo de diagramas se conocen como entidad-relación. Por ejemplo, para la base de datos de la tienda que manejamos en la clase, se tiene el siguiente diagrama entidad-relación.

Este diagrama puedes generarlo en MySQL Workbench. Si tienes dudas de cómo trabajarlo, puedes visualizar este video para la creación de diagramas o preguntar al experto asignado.

Una vez definida la estructura de tu proyecto, define cinco preguntas que te interesen sobre la base de datos que definiste y escribe (a mano) las consultas equivalentes. Considera los siguientes tipos de pregunta.

- Preguntas que se pueden responder usando proyecciones simples (uno o más campos). SELECT campo FROM tabla;

Ejemplo: ¿Cuál es el nombre de todas los usuarios?

- Preguntas donde filtres resultados, usando la cláusula WHERE con apoyo de operaciones relacionales, los operadores lógicos o hagas uso de IN. SELECT campo FROM tabla WHERE filtro;

Ejemplo: ¿Cuáles usuarios son mayores de edad?

- Preguntas donde realices ordenamientos. SELECT campo FROM tabla WHERE filtro ORDER BY campo;

Ejemplo: ¿Cuál es el usuario más grande en edad?

- Preguntas donde limites el número de registros. SELECT campo FROM tabla WHERE filtro ORDER BY CAMPO LIMIT n;

Ejemplo: ¿Cuál es el top 5 de calificaciones en el grupo?

Más adelante te apoyaremos en instalar tu propio servidor de bases de datos y podrás probar tus consultas.
