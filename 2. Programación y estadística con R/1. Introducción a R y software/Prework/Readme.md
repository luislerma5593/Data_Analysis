# Prework

## Objetivo
Al final de este prework, seremos capaces de:

- Entender la diferencia entre R y R Studio.
- Utilizar R como calculadora.
- Pedir ayuda en R y en Internet.
- Identificar los tipos de datos y estructuras en R.
- Declarar una variable.
- Buscar, instalar y ejecutar paquetes útiles de R.
- Entender la estructura y cómo explorar un dataframe.
- Explorar las funciones precargadas de R.
- Declarar una nueva función.

## Introduccion

Bienvenido a la sesión propedéutica del módulo de programación y estadística con R. En este módulo aprenderás los conceptos básicos de estadística y los aplicarás con R, un lenguaje de programación que tiene un enfoque de análisis estadístico. Esta primera sesión propedéutica te dará las bases necesarias para utilizar el lenguaje R durante todo el módulo a la par que aprendes conceptos estadísticos.

Antes de comenzar, sigue las instrucciones para instalar R y Rstudio. Te compartimos anteriormente estas instrucciones si aún no lo realizas o tienes dudas, puedes consultar los siguientes 3 videos tutoriales que te ayudarán a conocer como instalar R, R Estudio y sus paquetes..

- Instalar R - https://drive.google.com/file/d/1CMLvw_uhYP-wrWeWEnc5UTB8LeQRJGGu/view?usp=sharing

- Instalar R Studio - https://drive.google.com/file/d/1N5ckkyxPzjCZwg-cgE4Y2ZLnPILZqQLk/view?usp=sharing

- Usar R Studio / Usar paquetes - https://drive.google.com/file/d/1Afz0j07r4Di7wUMlRfvZlpoXpAvg_6em/view?usp=sharing

La primera vez que nos enfrentamos a un lenguaje de programación suele ser confuso e intimidante. Existen algunos temas que vale la pena tener claros para, más adelante, evitar confusiones. En este nuevo mundo que estás por descubrir, el mundo de R, se pueden crear muchos tipos de análisis, pero antes de dar este salto, es importante reforzar los fundamentos del lenguaje.

¿Te has detenido a pensar cómo aprendiste a comunicarte con las demás personas que también hablan español?

- Primero, escuchaste a las personas de tu entorno hablando español.
- Después, empezaste a repetir algunas palabras.
- Cuando pasó un poco de tiempo, fuiste capaz de crear oraciones.
- Eventualmente, fuiste capaz de hablar fluidamente con otras personas.

Eso queremos lograr, pero ahora queremos aprender a comunicarnos con una computadora a través del lenguaje de programación R.

## ¿R o R Studio?

Lo primero que debemos entender es qué es R y la diferencia con R Studio, los cuáles ya tienes instalados. Como dijimos, R es un lenguaje de programación mientras que R Studio es un Entorno Integrado de Desarrollo (IDE), el cual nos brindará herramientas para poder escribir nuestro código de manera amigable y poder administrar nuestros proyectos muy fácilmente.

### Actividad 1

Busca en tus programas instalados y completa ¿Cuál icono corresponde a R y cuál a R Studio?

A lo largo de este curso y para hacernos la vida más fácil trabajaremos en R Studio. Es importante mencionar que, como el lenguaje de programación es R, es indispensable tener instalados ambos programas juntos. De hecho, R podría vivir solo, pero R Studio no puede vivir sin que también exista R en nuestra computadora.

## Empezando con R Studio

Vamos a abrir R Studio por primera vez. Para hacerlo es muy fácil:

- Busca el icono de R Studio en tu computadora
- Dale doble click

Al abrirla, podemos ver tres elementos principales:

- La consola
- El entorno e historia
- Files/Plots/Packages/Help/Viewer

¿Cómo sé si R Studio está listo para recibir mis instrucciones? ¡Muy fácil! Busca en la consola el icono > y da clic a la derecha, podrás ver en la imágen 1 cómo debe de verse. Esto nos indica que estamos listos para comenzar.

## Mi primer línea de código

Prueba escribir la siguiente línea de código y da Enter. De respuesta, obtendrás algo como lo siguiente:
```r
print('Hola R')
[1] "Hola R"
```

Es oficial, lograste comunicarte con tu computadora por primera vez. Lo podemos pensar como: “Acabo de decirle a la computadora que me imprima el texto Hola R, después di Enter, que fue la manera de decirle ‘Hazlo ahora’. Entonces, la computadora hizo lo que le pedí: imprimió el texto Hola R.” Nota: No es necesario utilizar la función print cuando se requiera imprimir una variable, con su nombre es suficiente.

Es de resaltar que en R el uso de '', es idéntico al de utilizar “ ”, las puedes utilizar del mismo modo cuando quieras escribir identificar datos de tipo caracter.

## R como calculadora
Una de las maneras más sencillas de utilizar R, es como una calculadora. A continuación tenemos las operaciones básicas y la manera de escribir el código en R.

### Actividad 2

Ejecuta en la consola cada operación de la tabla para descubrir el resultado. ¿Son los resultados que esperabas? 

## ¿Cómo escribir números pequeños y grandes?
Hay que tener en mente que cuando escribimos números pequeños o grandes, R cambia los números a la notación e. Podemos ver el siguiente ejemplo:
```r
 + 10000000
   [1] 1e+07
 + 0.0000001
   [1] 1e-07
```
En esta notación, 1e+07 es lo mismo a 1 × 107 que a su vez es lo mismo a 10000000 .

Por otro lado, 1e-07 es lo mismo a 1 × 10− 7 que a su vez es lo mismo a 0.0000001 .

En resumen, la notación e nos dice que cualquier número a puede ser expresado como aey, que representa al número a × 10y .

Pero, R tiene un límite. Al intentar representar un número mucho más grande o mucho más pequeño, entonces lo hace con infinitos. Por ejemplo,
```r
 +  10000^100
    [1] Inf
 + -10000^100
    [1] -Inf
 + 1/0
    [1] Inf
 + -1/0
    [1] -Inf
```

## Orden de operaciones

¿Recuerdas cuando nos enseñaron el orden de las operaciones en matemáticas? Bueno, R las respeta al ejecutar código. Por lo tanto, hay que tenerlas presentes, este orden lo enlistamos a continuación:

- Paréntesis
- Exponentes
- Multiplicación
- División
- Suma
- Resta
-
Esto quiere decir que, si tenemos una operación con paréntesis, R ejecutará primero lo que esté en paréntesis. Cuando termine, entonces elevará a las potencias que tenga y así sucesivamente.

## Help y Stackoverflow

Cuando empezamos en el mundo de la programación, es normal que no sepamos qué escribir. Imaginate, podrías estar en alguno de los siguientes casos:

- Hace mucho tiempo utilicé una función para obtener el promedio, la cual sé que se llama mean, pero no recuerdo qué tenía que poner de argumento.
- *Solución:** ?mean
- Creo que puede existir una función que me de el promedio, pero no sé cómo se llama esa función.
- *Solución:** ??mean
- Estoy atorado, ya no sé qué escribir o hacer.
- *Solución:** Seguramente, tu duda alguien más la tuvo anteriormente y la puedes buscar (con solución) en la siguente página: https://stackoverflow.com/

## Importar archivos A R

R puede leer diferentes tipos de archivos. Por lo tanto, es muy importante que sepas cómo importarlos y exportarlos. Esto lo irás aprendiendo poco a poco, sin embargo el siguiente recurso puede ser de mucha ayuda para identificar los diferentes tipos de archivos que puedes usar en R así como la manera en la que los puedes importar.

Como ejercicio adicional puedes importar a Rstudio uno de estos sencillos datasets (base de datos) para principiantes de la plataforma Kaggle.

Sigue los pasos del primer recurso sobre importación de archivos y si necesitas más información, indaga en stackoverflow (con tus habilidades de investigación) para lograr importar alguno de estos archivos.

En este prework aprenderás algunos conceptos básicos sobre R. Identificarás los diferentes tipos de datos que existen en este lenguaje; las estructuras como vectores y matrices; las funciones y finalmente la lectura de datos.

Comencemos con los tipos de datos. En R hay varios tipos de datos. Sin embargo, vamos a comenzar a identificar los más básicos.

- Numeric (numéricos) Estos tipos de datos son de tipo numérico. Es decir, son números. Dentro de esta categoría hay otras subcategorías:
- Integer (enteros) → Estos se representan con una L para indicarle a R que son enteros y no decimales. 2L, 97L, 3888L …
 -Float (decimales) 18.9, 0.19 …
- Complex (complejos) → Números complejos con números imaginarios 1+4i …
- Logical (lógicos) → Sólo hay dos opciones ya sea TRUE o FALSE
- Character (carácter) → Son letras, palabras o frases y se representan entre comillas siempre. Pueden ser números entre comillas que serán tomados como caracteres y no como numéricos.
- 
“A”, “Hello world”, “34”

Puedes empezar a hacer pruebas con los diferentes tipos de datos dentro de Rstudio. Si utilizas las siguientes funciones puedes:

- Identificar el tipo de dato 

Dentro del paréntesis pon el dato que quieras identificar.

- cambiar el tipo de dato → as.integer() as.numeric() as.logical() as.character()

Por otro lado existen varias estructuras en R (a estructuras nos referimos a la manera en la que organizamos los diferentes tipos de datos que tenemos). Vamos a revisar un ejemplo de cada una de las estructuras yendo de las más sencillas a las más complejas.

- **Vectores**

Estos son valores que sólo están en una dimensión (Esto quiere decir que están en una línea y no forman tablas con columnas ni filas). Normalmente se crean con la función c(). Esto hace que lo que esté dentro del paréntesis se convierta en un vector. Con los vectores se pueden hacer operaciones aritméticas y ÚNICAMENTE pueden ser del mismo tipo de dato.

Ejemplo: x <- c(24, 55,66,84) Esto es un vector numérico de integers y la información se ve así en una línea en una única dimensión.

- **Listas** 

Las listas son igual a los vectores, pero lo que difiere de ellos es que estas sí pueden guardar diferentes tipos de datos. Estas se pueden crear usando la función **list()**.

Ejemplo: x <- list(24, “55”,2.5, c(2,3))

Nota que se pueden guardar vectores dentro de listas.

- **Matrix**

Las matrices son datos estructurados en dos dimensiones: columnas y filas. Estas se pueden crear con la función **matrix()** y al igual que los vectores, únicamente pueden guardar 1 mismo tipo de dato.

Ejemplo: x <- matrix(1 : 9, byrow = TRUE, nrow = 3) Cuando imprimes x, este es el resultado:

La función matrix() hace que los números se representen en dos dimensiones: columnas (arriba a abajo) y filas (de un lado a otro). Puedes poner esta línea de código en Rstudio y darle enter para saber cuáles son los argumentos de esta función: ?matrix

- **Data Frames**

Los data frames (datos organizados en 2 dimensiones: columnas y filas) son igual que las matrices, pero estos sí pueden guardar diferentes tipos de datos.

Ahora, ya sabes cuáles son los tipos de datos y las estructuras en R. En la siguiente sección aprenderás lo que es una función y una variable, así como la manera en la que asignas una.

Como ya habrás identificado, existen funciones en R. Por ejemplo, las funciones que ya revisaste previamente como las de identificar tipos de datos `typeof()`, `class()` o funciones para convertir estructuras de datos como `matrix()`, `list()`, etc…

Las **funciones** en R son aquellas que convierten una entrada o dato, las procesan y arrojan un resultado. Realiza la actividad 3 para poner en práctica tus habilidades con las funciones en R.

### Actividad 3

Existe una función en R llamada max, la cual tiene las siguientes partes: Argumento, Operación y Resultado

**Utiliza esta función para encontrar el máximo entre los números 100/4, 108/5, 200/20, sqrt(81), 35. Recuerda que para saber cómo implementar la función mean puedes pedir ayuda.**
