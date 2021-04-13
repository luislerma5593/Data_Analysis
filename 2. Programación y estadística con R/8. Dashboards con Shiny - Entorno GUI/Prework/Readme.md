# Prework

## Interfaz gráfica de usuario

También conocida como GUI (del inglés graphical user interface), es un programa informático que actúa de interfaz de usuario, utilizando un conjunto de imágenes y objetos gráficos para representar la información y acciones disponibles en la interfaz. Su principal uso consiste en proporcionar un entorno visual sencillo para permitir la comunicación con el sistema operativo de una máquina o computador.

Habitualmente las acciones se realizan mediante manipulación directa, para facilitar la interacción del usuario con la computadora. Surge como evolución de las interfaces de línea de comandos que se usaban para operar los primeros sistemas operativos y es pieza fundamental en un entorno gráfico. Como ejemplos de interfaz gráfica de usuario, cabe citar los entornos de escritorio Windows, el X-Window de GNU/Linux o el de Mac OS X, Aqua.

### Dashboard en R con Shiny

Este se presenta como una alternativa a los software tradicionales proporcionando ciertas ventajas como son:

 -Una alternativa a las presentaciones estáticas, logrando interactuar con la audiencia
- Es open source, esto es una gran ventaja
- Crear una mejor experiencia para que el usuario pueda interactuar con los datos en representaciones gráficas, que puedan cambiar fácilmente los parámetros, tablas, data tables, imágenes, summarys, búsquedas con dplyr, todo lo que se te ocurra y sea un objeto de R puede ser integrado, haciendo que la solución de hipótesis pueda ser intuitiva y de manera más amigable
- La facilidad de poder compartir tu información de manera remota, publicandolos en servidores gratuitos si así se considera

Para la construcción de un dashboard en R se requiere antes que todo generar información que sea útil presentar, esto lo podemos relacionar como un informe en el que se van a mostrar los mejores resultados de la investigación de algún tema o proyecto en el que estés participando, esto no es del todo cierto ya que se pueden ir construyendo al momento de tenerlo.

La manera de crear un dashboard es utilizando creando una Shiny Web Application, esta se compone de dos maneras diferentes en su creación :

- En un solo archivo que se almacena en un archivo llamado app.R
- En dos archivos ui.R / server.R

Las dos funcionan de igual manera, sin embargo si se requiere tener un mejor orden se recomienda la segunda opción.

Como ya se mencionó dentro de las ventajas que tiene Shiny WebApp es la publicación de los dashboard en su servidor, además de que se puede utilizar un servidor de RStudio para poder compartirlos, esto resulta útil y muy sencillo y el proceso para publicación es realmente sencillo.

Algunos sitios que son de interés para la creación de los dashboards son:

- R Shiny → El sitio oficial donde se podrás encontrar diversos temas y ejemplos que te serán de gran utilidad
- Bootswatch → En este sitio encontraras diversos temas para poder publicar tus dashboards
- Fontawesome → Listas de íconos para hacer que tu dashboard quede en forma y sea amigable su visualización
 
### ¿Cómo funciona el ui.R y el server.R?

Dentro del ui.R se colocarán los comandos que permitan crear encabezados y agregar su título, paneles laterales, la parte central y demás objetos que darán a vista al dashboard, además de poder integrar pestañas, todo lo que se refiera a la interacción entre usuario y máquina para poder realizar las consultas permitidas y poder interactuar con el ratón o una pantalla touch si es el caso.

Por otro lado en el server.R se codifica la sintaxis necesaria para poder elaborar las tablas, gráficas, imágenes y demás objetos que se mostrarán en la GUI, será nuestro procesador de las entradas (inputs) que se reciban de la GUI.

Al comienzo puede parecer algo confuso el orden y el ingreso de las variables que darán forma a todos lo que se mostrará en la interfaz, sin embargo con la práctica y tomando como base algún tema su implementación se hará de manera natural.

No olvides entrar a los links de más arriba para observar el potencial que tienen las Shiny WebApp, es una forma potente y divertida de presentar tus reportes de resultados.
