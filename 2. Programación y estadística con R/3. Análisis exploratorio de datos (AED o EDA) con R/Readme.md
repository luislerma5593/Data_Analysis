# Work

* [Ejemplos](#Ejemplos)
  * [Ejemplo 1 (Paquete ggplot2)](#Ejemplo-1)
  * [Ejemplo 2 (Histogramas)](#Ejemplo-2)
  * [Ejemplo 3 (Gráficos de dispersión)](#Ejemplo-3)
  * [Ejemplo 4 (Boxplots y outliers)](#Ejemplo-4)
  * [Ejemplo 5 (Estadísticos de la NBA)](#Ejemplo-5)
  * [Ejemplo 6 (Gráficos de líneas o barras)](#Ejemplo-6)
  
* [Retos](#Retos)
  * [ ] [Reto 1 (Altura de los alumnos)](#Reto-1)
  * [ ] [Reto 2 (Estadísticos de la NBA)](#Reto-2)
  * [ ] [Reto 3 (Series de tiempo y descomposición)](#Reto-3)
  
# Ejemplos

## Ejemplo 1
```r
# Desarrollo

# Comenzando con grÃ¡ficos simples; vamos a utilizar el dataset mtcars.

# Instalamos el paquete (si es necesario) y lo cargamos

library(ggplot2)

# Primero recordamos cuales son las variables que contiene el dataset

names(mtcars)

# Graficamos las variables cyl en el eje x y hp en y, observa el comando geom_point()

ggplot(mtcars, aes(x=cyl, y = hp, colour = mpg )) + geom_point() #Para puntos


#Tipo de geometrÃ­a, intenta utilizar alguna otra


# Agregando carÃ¡cteristicas de tema y facewrap

names(mtcars)
p<-ggplot(mtcars, aes(x=cyl, y = hp, colour = mpg )) + 
  geom_point() +   
  theme_gray() +   # Temas (inteta cambiarlo)
  facet_wrap("cyl")  # Lo divide por el nÃºm de cilindros
#facet_grid("am")

library(plotly)


# Para poder visualizar el nombre de los coches en la gráfica

cars<-mtcars 
cars$name<-row.names(mtcars)

q<-ggplot(cars, aes(x=cyl, y = hp, colour = name )) + 
  geom_point() +   
  theme_gray() +   # Temas (inteta cambiarlo)
  facet_wrap("cyl")

ggplotly(q) # Ya con los nombres


# Agregando nombres a los ejes x, y

names(mtcars)
ggplot(mtcars, aes(x = cyl, y = hp, colour = mpg )) + 
  geom_point() +   
  theme_gray() +   # Temas (inteta cambiarlo)
  facet_wrap("cyl") +  # Lo divide por el nÃºm de cilindros
  xlab('Num de cilindros') +  # Nombre en los ejes
  ylab('Caballos de Fuerza')

# Adicionalmente se pueden realizar otros tipos de grÃ¡ficos, estos se verÃ¡n en los prÃ³ximos ejemplos.
```

## Ejemplo 2
```r
# Ejemplo 3.2 - Histogramas


library(dplyr) # Para usar el operador %>%
data <- read.csv("https://raw.githubusercontent.com/beduExpert/Programacion-con-R-2021/main/Sesion-03/Data/boxp.csv")
head(data)
names(data)

# Modificando una columna para "disfrazarla"

data2 <- mutate(data, Mediciones = Mediciones*1.23) 

data3 <- mutate(data, Mediciones = Mediciones/1.23) 

# Utilizando la función hist

hist(data$Mediciones, breaks = seq(0,360, 20),  #Breakes es para el final del eje x
     main = "Histograma de Mediciones",
     xlab = "Mediciones",
     ylab = "Frecuencia")

# Ahora utilizando ggplot para apreciar los resultados de las dos funciones

# Evitar el Warning de filas con NA´s

data <- na.omit(data) 


# CON GGPLOT

data %>%
  ggplot() + 
  aes(Mediciones) +
  geom_histogram(binwidth = 20,col="black")

ggplot(data, aes(Mediciones)) + geom_histogram(binwidth = 20) #Para puntos


library(plotly)
ggplotly(g)


# Agregando algunas etiquetas y tema, intenta modificar algunas de las opciones para que aprecies los resultados

data %>%
  ggplot() + 
  aes(Mediciones) +
  geom_histogram(binwidth = 10, col="red", fill = "blue",position = "identity") + 
  ggtitle("Histograma de Mediciones") +
  ylab("Frecuencia") +
  xlab("Mediciones") + 
  theme_light()

#Clasic sin cuadrícula
#Light con cuadrícula


# Tanto hist(), como ggplot() + aes() + geom_histogram() son útiles para generar los histogramas, tu decide cual te funciona mejor.


```

## Ejemplo 3
```r
```

## Ejemplo 4
```r
```

## Ejemplo 5
```r
```

## Ejemplo 6
```r
```

# Retos

## Reto 1
```r
# Reto 3.1

library(dplyr) # Para usar el operador %>%
library(plotly)
data <- read.csv("https://raw.githubusercontent.com/beduExpert/Programacion-con-R-2021/main/Sesion-03/Reto-01/BD_Altura_Alunos.csv", sep =";")


hist(data$Altura, breaks = seq(140,200,3), col = "red", freq = T, #Igual que bin + 1
     main = "Histograma de Altura",
     xlab = "Mediciones",
     ylab = "Altura")

data %>%
  ggplot()+
  aes(Altura) +
  geom_histogram(bins=10 ,fill="#FFFF00", col="Black", alpha=0.5)+
  theme_light()+
  ggtitle("Altura")+
  xlab("Altura")+
  ylab("Cuenta")

#ggplotly(a)

# Hist es más rápido
# Geom_histogram es más detallado
```

## Reto 2
```r
```

## Reto 3
```r
```
