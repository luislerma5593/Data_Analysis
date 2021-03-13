# Work

* [Ejemplos](#Ejemplos)
  * [Ejemplo 1 (Medidas de tendencia central, posición y disperción)](#Ejemplo-1)
  * [Ejemplo 2 (Características de los objetos (str, summary, head y View) y funciones)](#Ejemplo-2)
  * [Ejemplo 3 (Paquete dplyr y aplicaciones)](#Ejemplo-3)
  * [Ejemplo 4 (Funciones cbind, rbind (manipulación de data frames))](#Ejemplo-4)
  * [Ejemplo 5 (Funciones apply, lapply y do.call)](#Ejemplo-5)
  * [Ejemplo 6 (Funciones na.omit y complete.cases)](#Ejemplo-6)
  
* [Retos](#Retos)
  * [x] [Reto 1](#Reto-1)
  * [x] [Reto 2](#Reto-2)
  * [ ] [Reto 3](#Reto-3)
  
# Ejemplos

## Ejemplo 1
```r
# 2.1 Medidas de Tendencia Central, de Posición y de Dispersión

# Medidas de Tendencia Central

# En R utilizamos la función mean para calcular la media de un conjunto de
# mediciones, por ejemplo

x = c(4000, 9000, 9000, 10000); mean(x)

# Para calcular la mediana, utilizamos la función median, por ejemplo

median(x)

# Si lo que deseamos es obtener la moda de un conjunto de mediciones, una 
# alternativa es instalar el paquete DescTools en R mediante la instrucción
# install.packages("DescTools"), luego utilizamos la función Mode del paquete
# DescTools

library(DescTools)
Mode(x) # mode es diferente de Mode (Case sensitive)

# Medidas de Posición

# En R utilizamos la función quantile para obtener cuantiles muestrales. Por
# ejemplo

x <- c(29, 13, 62, 4, 63, 96, 1, 90, 50, 46)
x_sort <- sort(x,decreasing = F)

quantile(x, 0.25) # cuantil del 25%
quantile(x, c(0.25,0.50,0.75)) # Cuartiles
quantile(x, seq(0.1,0.9, by = 0.1)) # Deciles

# Medidas de Dispersión

# Podemos calcular el rango intercuartílico en R con la función IQR, 
# por ejemplo,

IQR(x)

# o bien Q3 - Q1

quantile(x, probs = 0.75) - quantile(x, probs = 0.25)

# La varianza y desviación estándar muestral en R las calculamos con las 
# siguientes instrucciones respectivamente

var(x)
sd(x)
```

## Ejemplo 2 

```r
# 2.1 Características de los objetos (str sobre df, summary, head y view) y funciones

# Función str

# str es una función que muestra de manera compacta la estructura interna 
# de un objeto de R. Por ejemplo, si usamos como argumento de str el 
# conjunto de datos iris que podemos encontrar en R

str(iris)

unique(iris$Species)

# entonces la salida de la instrucción nos muestra el tipo de objeto, 
# número de observaciones y de variables, así como el tipo de dato al 
# que corresponde cada variable.

# Función summary

# La función summary es una función genérica usada para obtener resumenes 
# de diferentes objetos de R, por ejemplo

summary(1:100)
summary(mtcars)

# También es útil para obtener resumenes de los resultados de diferentes
# ajustes a modelos

set.seed(57)
x <- rnorm(35)
e <- rnorm(35)
y <- 5 + 2*x + e
modelo <- lm(y~x)
summary(modelo)

# Función head

# La función head devuelve la primera parte de un data frame, tabla, 
# matriz, vector o función. Por ejemplo, al usar el data frame mtcars
# como argumento de la función head, se devolverán únicamente las
# primeras seis filas del data frame

head(mtcars)

# la función tail funciona de manera similar, pero en lugar de devolver
# la primera parte de un objeto, devuelve la última parte de este,
# por ejemplo, al ejecutarse la siguiente instrucción

tail(mtcars)

# se devolverán las últimas seis filas del data frame

# Función view

# La función View aplicada a un objeto de R como un data frame, 
# invoca un visor de datos al estilo de una hoja de cálculo, por ejemplo

View(iris)

# Función que calcula la moda

# En R también podemos crear nuestras propias funciones, por ejemplo

moda <- function(vector){
  f.abs <- table(vector) # frecuencias absolutas
  max.f.abs <- max(f.abs) # obtenemos la máxima frecuencia absoluta
  pos.max <- which(f.abs == max.f.abs) # posición(es) de la(s) máxima(s) frecuencia(s) absoluta(s)
  print("La(s) moda(s) es(son): ")
  print(names(f.abs[pos.max]))
  paste("Con una frecuencia de: ", unique(as.vector(f.abs[pos.max])))
}

x <- sample(1:100, 100, replace = T) # Tomamos una muestra aleatoria de tamaño 100 con reemplazo de los primeros 100 números naturales
table(x) # obtenemos las frecuencias absolutas de los valores de la muestra
moda(x) # obtenemos la moda de los valores de la muestra
```

## Ejemplo 3
```r
# Ejemplo 3

# 2.3 Paquete dplyr y aplicaciones

# El paquete dplyr cuenta con varias funciones muy Ãºtiles, para manipular 
# y transformar data frames. Una vez instalado el paquete dplyr puede cargarlo
# en R de la siguiente manera (Sin mensajes ni advertencias)

suppressMessages(suppressWarnings(library(dplyr)))

# Vamos a descargar archivos csv que contienen datos del covid-19 para mostrar
# como funcionan algunas funciones del paquete dplr. Las url desde las
# cuales descargamos los datos son las siguientes

url1 <- "https://data.humdata.org/hxlproxy/data/download/time_series_covid19_confirmed_global_narrow.csv?dest=data_edit&filter01=explode&explode-header-att01=date&explode-value-att01=value&filter02=rename&rename-oldtag02=%23affected%2Bdate&rename-newtag02=%23date&rename-header02=Date&filter03=rename&rename-oldtag03=%23affected%2Bvalue&rename-newtag03=%23affected%2Binfected%2Bvalue%2Bnum&rename-header03=Value&filter04=clean&clean-date-tags04=%23date&filter05=sort&sort-tags05=%23date&sort-reverse05=on&filter06=sort&sort-tags06=%23country%2Bname%2C%23adm1%2Bname&tagger-match-all=on&tagger-default-tag=%23affected%2Blabel&tagger-01-header=province%2Fstate&tagger-01-tag=%23adm1%2Bname&tagger-02-header=country%2Fregion&tagger-02-tag=%23country%2Bname&tagger-03-header=lat&tagger-03-tag=%23geo%2Blat&tagger-04-header=long&tagger-04-tag=%23geo%2Blon&header-row=1&url=https%3A%2F%2Fraw.githubusercontent.com%2FCSSEGISandData%2FCOVID-19%2Fmaster%2Fcsse_covid_19_data%2Fcsse_covid_19_time_series%2Ftime_series_covid19_confirmed_global.csv"
url2 <- "https://data.humdata.org/hxlproxy/data/download/time_series_covid19_deaths_global_narrow.csv?dest=data_edit&filter01=explode&explode-header-att01=date&explode-value-att01=value&filter02=rename&rename-oldtag02=%23affected%2Bdate&rename-newtag02=%23date&rename-header02=Date&filter03=rename&rename-oldtag03=%23affected%2Bvalue&rename-newtag03=%23affected%2Binfected%2Bvalue%2Bnum&rename-header03=Value&filter04=clean&clean-date-tags04=%23date&filter05=sort&sort-tags05=%23date&sort-reverse05=on&filter06=sort&sort-tags06=%23country%2Bname%2C%23adm1%2Bname&tagger-match-all=on&tagger-default-tag=%23affected%2Blabel&tagger-01-header=province%2Fstate&tagger-01-tag=%23adm1%2Bname&tagger-02-header=country%2Fregion&tagger-02-tag=%23country%2Bname&tagger-03-header=lat&tagger-03-tag=%23geo%2Blat&tagger-04-header=long&tagger-04-tag=%23geo%2Blon&header-row=1&url=https%3A%2F%2Fraw.githubusercontent.com%2FCSSEGISandData%2FCOVID-19%2Fmaster%2Fcsse_covid_19_data%2Fcsse_covid_19_time_series%2Ftime_series_covid19_deaths_global.csv"

# Descargamos los datos en nuestro directorio de trabajo con la siguiente instrucciÃ³n

download.file(url = url1, destfile = "st19ncov-confirmados.csv", mode = "wb")
download.file(url = url2, destfile = "st19ncov-muertes.csv", mode = "wb")

# Una vez que hemos descargado los datos importamos los datos de casos
# confirmados y muertes a R

conf <- read.csv("st19ncov-confirmados.csv")
mu <- read.csv("st19ncov-muertes.csv")

str(conf); str(mu)
head(conf); head(mu)

# Ahora seleccionamos todas las filas menos la primera, esto para cada
# data frame

Sconf <- conf[-1,]
Smu <- mu[-1,]

# Con la funciÃ³n select del paquete dplyr, del data frame de casos confirmados
# seleccionamos Ãºnicamente las columnas de PaÃ­s, Fecha, NÃºmero acumulado de casos

Sconf <- select(Sconf, Country.Region, Date, Value) # PaÃ­s, fecha y acumulado de infectados

# Con la funciÃ³n rename, renombramos las columnas correspondientes al paÃ­s
# y al nÃºmero acumulado de casos de infectados por covid-19

Sconf <- rename(Sconf, Pais = Country.Region, Fecha = Date, Infectados = Value)

str(Sconf)

# Como cada una de las columnas del Ãºltimo data frame aparecen como factor,
# con la funciÃ³n mutate transformamos las columnas correspondientes a fechas
# y a nÃºmero de infectados, esto para que R reconozca como fechas la 
# columna correspondiente y como nÃºmeros los elementos de la columna que 
# indica el acumulado de casos.

Sconf <- mutate(Sconf, Fecha = as.Date(Fecha, "%Y-%m-%d"), Infectados = as.numeric(Infectados))

# Hacemos algo similar con el data frame correspondiente al nÃºmero
# acumulado de muertos

Smu <- select(Smu, Country.Region, Date, Value) # Seleccionamos paÃ­s, fecha y acumulado de muertos
Smu <- rename(Smu, Pais = Country.Region, Fecha = Date, Muertos = Value) # Renombramos
Smu <- mutate(Smu, Fecha = as.Date(Fecha, "%Y-%m-%d"), Muertos = as.numeric(Muertos)) # Transformamos


Scm <- merge(Sconf, Smu) # Unimos infectados y muertos acumulados para cada fecha

mex <- filter(Scm, Pais == "Mexico") # Seleccionamos sÃ³lo a MÃ©xico
mex <- filter(mex, Infectados != 0) # Primer dÃ­a de infectados

# mex <- mutate(mex, Infectados = as.numeric(Infectados), Muertos = as.numeric(Muertos))

mex <- mutate(mex, NI = c(1, diff(Infectados))) # Nuevos infectados por dÃ­a
mex <- mutate(mex, NM = c(0, diff(Muertos))) # Nuevos muertos por dÃ­a

mex <- mutate(mex, Letalidad = round(Muertos/Infectados*100, 1)) # Tasa de letalidad

mex <- mutate(mex, IDA = lag(Infectados), MDA = lag(Muertos)) # Valores dÃ­a anterior
mex <- mutate(mex, FCI = Infectados/IDA, FCM = Muertos/MDA) # Factores de Crecimiento
mex <- mutate(mex, Dia = 1:dim(mex)[1]) # DÃ­as de contingencia

head(mex); tail(mex)
write.csv(mex, "C19Mexico.csv", row.names = FALSE)

# Nota: en el ejemplo 5 de la sesiÃ³n 3 se harÃ¡ uso del archivo creado C19Mexico.csv
```

## Ejemplo 4
```r
# Ejemplo 4

# 2.4 cbind, rbind, manipulaciÃ³n de DF 

# FunciÃ³n cbind

# La funciÃ³n cbind toma una sucesiÃ³n de argumentos que pueden ser 
# vectores, matrices o data frames y los combina por columnas, 
# por ejemplo 

a=cbind(1:10, 11:20, 21:30)
(cbind(1:10, matrix(11:30, ncol =2)))
(cbind(data.frame(x = 1:10, y = 11:20), z = 21:30))

# FunciÃ³n rbind

# La funciÃ³n rbind funciona de manera similar a cbind, pero en lugar 
# de combinar los objetos por columnas, los combina por filas, como
# ejemplo tenemos lo siguiente

df1 <- data.frame(x = 1:5, y = 6:10, z = 16:20)
df2 <- data.frame(x = 51:55, y = 101:105, z = 151:155)
df1; df2
rbind(df1, df2)
```

## Ejemplo 5
```r
# Ejemplo 5

# 2.5 apply, lapply, do.call

# FunciÃ³n apply

# La funciÃ³n apply regresa un vector, arreglo o lista de valores obtenidos 
# al aplicar una funciÃ³n a los mÃ¡rgenes de un arreglo o matriz. Por ejemplo

x <- matrix(1:49, ncol = 7)

apply(X, 1, mean) # cÃ¡lculo de la media para las filas
apply(X, 2, median) # cÃ¡lculo de la mediana para las columnas


# FunciÃ³n lapply

# La funciÃ³n lapply se usa de la siguiente manera lapply(X, FUN, ...)
# donde X puede ser un vector o una lista, FUN es una funciÃ³n que serÃ¡
# aplicada a cada elemento de X y ... representa argumentos opcionales 
# para FUN. lapply regresa una lista de la misma longitud que X, en
# donde cada elemento de la lista es el resultado de aplicar FUN al
# elemento que corresponde de X.

# Vamos a utilizar lapply para leer un conjunto de archivos csv de manera
# consecutiva y rÃ¡pida, para esto debemos especificar un directorio
# de trabajo y descargar los archivos csv en nuestro directorio, por
# ejemplo, puede crear la carpeta soccer para descargar los datos

u1011 <- "https://www.football-data.co.uk/mmz4281/1011/SP1.csv"
u1112 <- "https://www.football-data.co.uk/mmz4281/1112/SP1.csv"
u1213 <- "https://www.football-data.co.uk/mmz4281/1213/SP1.csv"
u1314 <- "https://www.football-data.co.uk/mmz4281/1314/SP1.csv"

download.file(url = u1011, destfile = "SP1-1011.csv", mode = "wb")
download.file(url = u1112, destfile = "SP1-1112.csv", mode = "wb")
download.file(url = u1213, destfile = "SP1-1213.csv", mode = "wb")
download.file(url = u1314, destfile = "SP1-1314.csv", mode = "wb")

# podemos visualizar el nombre de los archivos descargados en un vector
# de strings de la siguiente manera

getwd()
setwd("C:/Users/LLerma/Google Drive/Analisis de Datos/M2 - Programacion y Estadistica con R/S2/Files")

dir()

# podemos leer con una sola instrucciÃ³n los archivos descargados
# usando la funciÃ³n lapply de la siguiente manera

lista <- lapply(dir(), read.csv) # Guardamos los archivos en lista

# los elementos de lista son los archivos csv leidos y se encuentran
# como data frames

lista <- lapply(lista, select, Date:FTR) # seleccionamos solo algunas columnas de cada data frame
head(lista[[1]]); head(lista[[2]]); head(lista[[3]]); head(lista[[4]])

# cada uno de los data frames que tenemos en lista, los podemos combinar
# en un Ãºnico data frame utilizando las funciones rbind y do.call
# de la siguiente manera

# FunciÃ³n do.call

data <- do.call(rbind, lista)
data2<-lapply(lista,rbind)
head(data)
dim(data)
```

## Ejemplo 6


## Ejemplo 7


# Retos

## Reto 1
```r
#Considere el siguiente vector

set.seed(134) # Fijar una semilla, para generar los mismos números aleatorios.

x <- round(rnorm(1000, 175, 6), 1)

#Calcule, la media, mediana y moda de los valores en x

mean(x)
median(x)
#Mode(x)

install.packages("DescTools")

#Obtenga los deciles de los números en x

quantile(x, seq(0.1,0.9,0.1))

#Encuentre la rango intercuartílico, la desviación estándar y varianza muestral de las mediciones en x

IQR(x)
var(x)
sd(x)

plot(x)
min(x);max(x)
summary(x)
```

## Reto 2
```r

#Crea una funciÃ³n que calcule la mediana de un conjuntos de valores, sin utilizar la funciÃ³n median

(x <- sample(1:30, 99, replace = T))

mediana <- function(x){
  x<-sort(x)
 len<-length(x)
  print(len)
  if ((len%%2)==0){
    med=((x[(len/2)]+x[(len/2)+1])/2)
  } else {
    med=(x[trunc(len/2)+1])
  }
  paste("La mediana es: ", med)
 }

x=c(1,7,5,9,76,4,5,6)
mediana(x)
```


## Reto 3
