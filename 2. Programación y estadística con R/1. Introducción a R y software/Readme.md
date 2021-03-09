# Work

* [Ejemplos](#Ejemplos)
 * [Ejemplo 1](#Ejemplo-1)
* [Retos](#Retos)


# Ejemplos

## Ejemplo 1
```r
# EJEMPLO 1. Tipos de datos y vectores

# Objetivo
# Poder determinar el tipo de variables y objetos que se utilizan
# CreaciÃ³n y manipulaciÃ³n de objetos (vectores, matrices, data frames, entre otros)
# Operaciones bÃ¡sicas

# Requisitos
# Tener previamente instalados R y RStudio
# Haber leido y comprendido el Prework

# Desarrollo
# Se tiene una serie de cÃ³digos los cuales deberÃ¡n irse corriento lÃ­nea a lÃ­nea, recordar que siempre se ejecuta una lÃ­nea presionando Ctrl + Enter

# Primero vamos a crear algunas variables de diferentes tipos:

(var.hola <- "Hola Mundo")
(var.number <- 5L)
(var.double <- 2.7076)
(var.logical <- T)
(vector <- c(1,2))
#vector2<-c(1,5,6,1,5)

# Ahora con la funciÃ³n class veremos la tipologÃ­a de las variables

class(var.number)
class(var.hola)
class(var.double)
class(var.logical)

typeof(var.number)
typeof(var.hola)
typeof(var.double)
typeof(var.logical)


# Observa que diferencia hay entre class y typeof

class(var.logical)
typeof(var.logical)

# En este paso vamos a crear vectores, siempre serÃ¡n de la forma c(elem1, elem2, ...)

a <- c(4, 6, 8, 10,12)
b <- c(3, 5, 7, 9)
c <- c(1,2,3,"a",4,"hola")

# Para saber la longitud del vector

length(a)
length(b)

# Se puede acceder a las coordenadas de un vector haciendo uso de [] y su posiciÃ³n

a[1]
b[4]

# Para unir 2 vectores

d<-c(a,b)

# Organizarlos con la funciÃ³n sort, cambia la F por T y observa que ocurre

sort(d, decreasing = T)

# Otra forma de generar el vector es de la siguiente manera, utilizando ":"

3:12  # asÃ­ de sencillo es

# Intenta los siguientes y prueba con otras que se te vengan a la imaginaciÃ³n

10:1
1:1000
0:10

# TambiÃ©n se pueden generar vectores que no sean sucesivos con la funciÃ³n seq, intenta cambiar el valor de los argumentos y observa el comportamiento de los vectores

(vector.by2 <- seq(from = 1, to = 10, by =2))

(vector.by3 <- seq(1, 10, 3))



# Para repetir un nÃºmero o un vector un determinado nÃºmero de ocasiones utilizamos rep

rep(5, times = 6)

# Observa que hace el siguiente comando con los vectores a y b

rep(a, 2)
rep(b, 3)

# Reciclaje, al hacer operaciones entre vectores, R repetirÃ¡ los valores del vector, hasta alcanzar la dimensiÃ³n requerida

c(1, 2) + c(7, 8, 9, 10)


# Existen varias operaciones entre vectores, intenta probar algunas de las siguientes:

a + b     
a - b     
a*b
a/b
a^2
a1 <- a*0.5 + b^2
a1[1]
```

## Ejemplo 2

```R
# Ejemplo 2. Matrices

# Objetivo

# Crear nuevas matrices
# Extraer datos dentro de una matriz
# Calcular sus dimensiones
# Realizar operaciones bÃ¡sicas entre matrices

# Requisitos

# Tener instalados R y RStudio
# Haber estudiado el Prework

# Desarrollo

# Se debe seguir el cÃ³digo propuesto y tratar de compreder que es lo que realiza

# Crear Matrices. 

(m <- matrix(1:9, nrow = 3, ncol = 3))

# Extrayendo la primera entrada

m[1,1]

# Extrayendo la primer columna, con todas sus filas

m[ ,1]

# Â¿QuÃ© sucede si se suma un vector y una matriz?

(sum.vecmat <- c(1, 2) + m)

# Creando otra matriz

(n <- matrix(2:7, 4, 6))

# Podemos conocer la dimensiÃ³n de la matriz asÃ­

dim(n)

# Extrayendo subconjuntos de la matriz

n[n > 4] 

# Ahora veremos como localizar la posiciÃ³n de las entradas anteriores

which(n > 4)

# Uniendo Vectores para formar una matriz

a <- 2:6
b <- 5:9

# Construyendo la matriz utilizando la funciÃ³n cbind, para unirlos por culumna

cbind(a,b)

# Construyendo la matriz utilizando la funciÃ³n rbind, para unirlos por fila

rbind(a,b)

# Aplicando una funciÃ³n a las filas o columnas de una matriz (mean, sort)

round(apply(n, 1, mean))
apply(n, 1, sort)

# Algunas operaciones bÃ¡sicas de matrices

# Producto matricial: A %*% B
# Producto elemento a elemento: A*B
# Traspuesta: t(A)
# Determinante: det(A)
# Extraer la diagonal: diag(A)
# Resolver un sistema de ecuaciones lineales (( Ax=b )): solve(A,b)
# Inversa: solve(A)
# Autovalores y autovectores: eigen(A)
```

## Ejemplo 3

```R
# Ejemplo 3. Listas y data frames

# Objetivo
# Crear listas y data frames
# Extraer informaciÃ³n de estos
# CÃ¡lculo de estadÃ­sticos bÃ¡sicos

# Requisitos

# Prework
# R, RStudio
# Ejemplos 1 y 2

# Desarrollo

# Seguir el contenido y tratar de comprender el cÃ³digo mostrado a continuaciÃ³n

# Listas

(milista <- list(nombre = "Pepe", no.hijos = 3, edades.hijos = c(4, 7, 9)))

# propiedades de la lista

str(milista)

# Extrayendo elementos de la lista, recuerda que para ingresar se debe usar el sÃ­mbolo $

milista$nombre

# Creando data frames

x <- 6:8
y <- c("A", "B", "C")
(mifile <- data.frame(edad = x, grupo = y))

str(mifile)

# Extrayendo informaciÃ³n del df, se hace igual que con las matrices

mifile[1]
mifile[,2]
mifile$edad

# Calculando algunos estadÃ­sticos bÃ¡sicos

mean(mifile$edad)

# Podemos hacer uso de la funciÃ³n `paste` para agregar un mensaje

paste("La media de la edad es:", mean(mifile$edad))

# Podemos inspeccionar a detalle el df utilizando `summary`

summary(mifile)

# TambiÃ©n se puede conocer su dimensiÃ³n

dim(mifile)

# Podemos agregar una columna extra con datos

mifile$sexo <- c("H", "M", "H")
mifile

# Si fuera el caso, se puede eliminar una columna

mifile$sexo <- NULL
mifile
```

## Ejemplo 4

```R
# EJEMPLO 4. Descarga y lectura de data sets.

# Objetivo
# Fijar y conocer ruta de trabajo
# Lectura de ficheros CSV, locales y en repositorio
# Manejo de objetos

# Requisitos
# R, RStudio
# Prework
# Desarrollo

# Ejecutar las líneas de comando y tratar de comprender que realiza cada parte de sus entradas

# Se pueden obtener diversos data sets de Kaggle, visita el sitio para que te familiarices
# La siguiente es una base de datos de los libros más vendidos en Amazon del 2009 - 2019

# Obtenemos la ruta del directorio de trabajo

getwd()

# Fijando el directorio de trabajo

setwd("c:/Users/User/Documents/Bedu/") # Depende del usuario

# La función read.csv será util para leer fichero .csv

read.csv("bestsellers with categories.csv") # El archivo csv debe estar en el directorio de trabajo

# se puede asignar a un objeto el fichero leido anteriormente

amazon.books <- read.csv("bestsellers with categories.csv")
tail(amazon.books); str(amazon.books)

# También se puede leer el fichero directamente desde una URL

data.url <- read.csv("https://www.football-data.co.uk/mmz4281/2021/SP1.csv")
tail(data.url); str(data.url)

# Calculamos la dimensión de la base de datos

dim(amazon.books)

# El tipo de objeto se puede saber utilizando class()

class(amazon.books)
```


## Ejemplo 5

```R
# EJEMPLO 5. Instalar paquetes y cargarlos.

# Objetivo
# Instalar paquetes
# Cargar paquetes

# Requisitos
# R y RStudio
# Prework

# Desarrollo
# En este ejemplo se te guiará para poder realizar la instalación y carga de paquetes que son requeridos para realizar análisis, gráficas, o para extraer información con diversas funciones. Esto es útil ya que agrega funcionalidades a R, ya sea para graficar o generar análisis con diversas técnicas.

# Se instalan de la siguiente manera

install.packages("ggplot2") #siempre lleva  comillas

# Una vez que se instaló, se debe de cargar

library(ggplot2) # Se omite el uso de las comillas

# Otro ejemplo

install.packages("dplyr")
library(dplyr)

# Algo útil es revisar la versión que se tiene de R, ya que en ocasiones no se instalan ciertos paquetes por la incompatibilidad de R, el siguiente comando nos indicará la versión que estamos trabajando.

version

# También se puede realizar esta acción en la pestaña de Packages, intentalo.
```


## Ejemplo 6

```R
# EJEMPLO 6. Loops y pseudocódigo: for, while, if, else, if-else

# Objetivo
# Conocer la inicialización de variables
# Ejecutar un loop, for, while, if y if-else
  
# Requisitos
# R, RStudio
# Prework

# Desarrollo
# Durante este ejemplo se darán las bases para inicializar una variable que sea utilizada dentro de un loop, adicionalmente se utilizaran los comandos while, if y if-else para poder utilizarlos adecuadamente

# Este ejemplo elevará al cuadrado las primeras 10 entradas de un vector generado aleatóriamente de 20 entradas

w <- rnorm(20)              
print("Este loop calcula el cuadrado de los 10 primeros elementos del vector w")

# inicializando la varialbe wsq

wsq <- 0

for(i in 1:10) {
  wsq[i] <- w[i]**2
  print(wsq[i])
}

# Los bucles WHILE comienzan comprobando una condición. Si esta es verdadera, entonces se entra al cuerpo del bucle. Una vez completada una ejecución de este bloque, se comprueba la condición nuevamente y así sucesivamente hasta que la comprobación de la condición de falso.

# while(<condicion>) {
#                     código
#                     ...
#             }

# Ejemplo:
  
count <- 0
while(count < 10) {
  print(count)
  count <- count + 1
}
  
# Pseudocódigo para IF - ELSE

# if(<condicion>) {
  ## bloque de código
# }

## Continua con el resto del código

# if(<condicion>){
                  ## bloque de código
#               } else {
                        ## otro bloque de código
#                      }

# if(<condition1>) {
                     ## bloque de código
#                 } else if(<condicion2>) {
                                           ## otro bloque de código
#                                        } else {
                                                 ## otro bloque de código
#                                               }

# Ejemplo

x <- runif(1, 0, 10) ## creamos un número aleatorio entre 0 y 10
if(x > 5) {
  y <- TRUE
} else {
  y <- FALSE
}
x; y

# De este modo estamos asignando un valor a una variable en función del valor de otra. Lo que se debe tener en cuenta es que la condición debe retornar un valor TRUE o FALSE.
© 2021 GitHub, Inc.
Terms
Privacy
Security
Status
Docs
Contact GitHub
Pricing
API
Training
Blog
About

```

# Retos 

## Reto 1

Abre el fichero que se encuentra en el repositorio y obten sus carácteristicas, para finalmente imprimir los resultados en un fichero CSV.

Leer el archivo "netflix_titles.csv" desde Github (https://raw.githubusercontent.com/ecoronadoj/Sesion_1/main/Data/netflix_titles.csv), almacenarlo en un df llamado netflix

Obtener la dimensión y el tipo de objeto que se obtiene

Obtener los títulos que se estrenaron después del 2015. Almacenar este df en una variable llamada net.2015 (Hint: primero podrías filtrar solo aquellas filas del data frame que corresponden a estrenos después del 2015, por ejemplo, dataframe[columna > 2015, ])

Escribir los resultados en un archivo .csv llamado res.netflix.csv (Hint: consulta la función write.csv)

```r
netflix <- read.csv("https://raw.githubusercontent.com/ecoronadoj/Sesion_1/main/Data/netflix_titles.csv")

dim(netflix)

class(netflix)
str(netflix)

new_netflix<-netflix[netflix$release_year > 2015,]
  
write.csv(new_netflix)

write.csv(netflix, "Netflix")
write.csv(new_netflix, "New Netflix")
```
