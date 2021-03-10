# Work

* [Ejemplos](#Ejemplos)
  * [Ejemplo 1 ()](#Ejemplo-1)
  * [Ejemplo 2 ()](#Ejemplo-2)
  * [Ejemplo 3 ()](#Ejemplo-3)
  * [Ejemplo 4 ()](#Ejemplo-4)
  * [Ejemplo 5 ()](#Ejemplo-5)
  * [Ejemplo 6 ()](#Ejemplo-6)
  
* [Retos](#Retos)
  * [Reto 1](#Reto-1)
  * [Reto 2](#Reto-2)
  * [Reto 3](#Reto-3)
  
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

# Retos

#" Reto 1
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
