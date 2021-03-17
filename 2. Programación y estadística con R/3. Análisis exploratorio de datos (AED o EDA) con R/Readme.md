# Work

* [Ejemplos](#Ejemplos)
  * [Ejemplo 1 (Paquete ggplot2)](#Ejemplo-1)
  * [Ejemplo 2 (Histogramas)](#Ejemplo-2)
  * [Ejemplo 3 (Gráficos de dispersión)](#Ejemplo-3)
  * [Ejemplo 4 (Boxplots y outliers))](#Ejemplo-4)
  * [Ejemplo 5 (Estadísticos de la NBA)](#Ejemplo-5)
  * [Ejemplo 6 (Gráficos de líneas o barras)](#Ejemplo-6)
  
* [Retos](#Retos)
  * [x] [Reto 1 (Altura de los alumnos)](#Reto-1)
  * [x] [Reto 2 (Estadísticos de la NBA)](#Reto-2)
  * [x] [Reto 3 (Series de tiempo y descomposición)](#Reto-3)
  
# Ejemplos

## Ejemplo 1

```r
# Desarrollo

# Comenzando con gráficos simples; vamos a utilizar el dataset mtcars.

# Instalamos el paquete (si es necesario) y lo cargamos

library(ggplot2)

# Primero recordamos cuales son las variables que contiene el dataset

names(mtcars)

# Graficamos las variables cyl en el eje x y hp en y, observa el comando geom_point()

ggplot(mtcars, aes(x=cyl, y = hp, colour = mpg )) + 
  geom_point()  # Tipo de geometría, intenta utilizar alguna otra

# Agregando carácteristicas de tema y facewrap

names(mtcars)
ggplot(mtcars, aes(x=cyl, y = hp, colour = mpg )) + 
  geom_point() +   
  theme_gray() +   # Temas (inteta cambiarlo)
  facet_wrap("cyl")  # Lo divide por el núm de cilindros

# Agregando nombres a los ejes x, y

names(mtcars)
ggplot(mtcars, aes(x = cyl, y = hp, colour = mpg )) + 
  geom_point() +   
  theme_gray() +   # Temas (inteta cambiarlo)
  facet_wrap("cyl") +  # Lo divide por el núm de cilindros
  xlab('Núm de cilindros') +  # Nombre en los ejes
  ylab('Caballos de Fuerza')

# Adicionalmente se pueden realizar otros tipos de gráficos, estos se verán en los próximos ejemplos.```


## Ejemplo 2

## Ejemplo 3

## Ejemplo 4

## Ejemplo 5

## Ejemplo 6

# Retos

## Reto 1

## Reto 2

## Reto 3
