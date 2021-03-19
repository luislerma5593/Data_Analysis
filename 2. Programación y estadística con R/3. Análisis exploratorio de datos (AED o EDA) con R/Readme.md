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
# Ejemplo 3.3

# Realizamos un scatter plot de las variables wt y mpg, debemos utilizar necesariamente geom_point()

library(ggplot2)

(my_scatplot <- ggplot(mtcars, 
                       aes(x = wt, y = mpg)) + 
  geom_point())

# Adicionalmente se puede agregar una línea de tendencia

(my_scatplot <- ggplot(mtcars, 
                       aes(x=wt,y=mpg)) + 
    geom_point() + 
    geom_smooth(method = "lm", se = T))  # modelo lineal, cambia el parametro `se`, este hace referencia al intervalo de confianza

# se → es el intervalo de confianza
# Method = "lm" → traza la línea de tendencia

cor(mtcars$wt,mtcars$mpg)

# Agregando los nombres de los ejes, observa que se almacenó el gráfico en el objeto my_scatplot (nota que pueden agregarse más características seguido del signo +)

my_scatplot + xlab('Weight (x 1000lbs)') + ylab('Miles per Gallon')

# Otras características interesantes

(my_scatplot <- ggplot(mtcars, aes(x = wt, y = mpg, col = cyl)) + geom_point())
my_scatplot + labs(x='Weight (x1000lbs)',y='Miles per Gallon',colour='Number of\n Cylinders')

# Haciendo un facewrap con la variable cyl

my_scatplot + facet_wrap("cyl")

# Separándolas por cilindros y tipo de transmisión (am = Transmission (0 = automatic, 1 = manual))

my_scatplot + facet_grid(am~cyl)

# Como puedes observar, hay muchas formas de representar el gráfico de dispersión, éstas son algunas de ellas, obviamente existen muchas más.
```

## Ejemplo 4
```r
# Ejemplo 3.4

library(dplyr)

# Comenzamos leyendo un fichero, el cual contiene información sobre dos grupos de control G1 y G2, a los cuales se les realizó a cada uno una medición en 3 momentos diferentes C1, C2 y C3
# library(dplyr) # para usar mutate

data <- read.csv("https://raw.githubusercontent.com/beduExpert/Programacion-con-R-Santander/master/Sesion-03/Data/boxp.csv")

# Revisamos el encabezado del fichero y el nombre de sus variables o columnas

head(data)
names(data)

# Observamos algunos datos estadísticos sobre las variables

summary(data)

# Como estamos ante la presencia de NA´s los eliminamos con complete.cases() y solamente seleccionamos aquellos sin NAsy convertimos en factores la variableCategoriayGrupo`

bien <- complete.cases(data)
data <- data[bien,]
data <- mutate(data, Categoria = factor(Categoria), Grupo = factor(Grupo))

# Factor es para poder categorizar

# Finalmente realizamos el boxplot 

ggplot(data, aes(x = Categoria, y = Mediciones, fill = Grupo)) + geom_boxplot() +
  ggtitle("Boxplots") +
  xlab("Categorias") +
  ylab("Mediciones")

# Agregamos el nombre de las etiquetas para los grupos G1 y G2

ggplot(data, aes(x = Categoria, y = Mediciones, fill = Grupo)) + geom_boxplot() +
  scale_fill_discrete(name = "Dos Gps", labels = c("G1", "G2")) + 
  ggtitle("Boxplots") +
  xlab("Categorias") +
  ylab("Mediciones")

```

## Ejemplo 5
```r
# Ejemplo 3.5

# Al inicio es posible que no comprendas todo el código, trata de leerlo e ir asimilando que es lo que realiza cada línea. 

# library(ggplot2)
# install.packages("scales")
library(scales) # Para mejorar la lectura de las etiquetas  en el eje de las x de tipo fecha
# Ahora vamos a leer nuestro archivo C19Mexico.csv con los infectados y muertos acumulados para cada fecha

setwd("C:/Users/LLerma/Google Drive/Analisis de Datos/M2 - Programacion y Estadistica con R/S3/Files")

mex <- read.csv("C19Mexico.csv")

head(mex); tail(mex)

mex <- mutate(mex, Fecha = as.Date(Fecha, "%Y-%m-%d"))
str(mex)

####################################################################

# A continuación, te presentamos un panorama de la situación que se ha estado viviendo en México, debido al coronavirus. Es información simple, que puede resultar valiosa para algunas personas. Las gráficas, las hemos realizado utilizando datos que puedes encontrar en el siguiente sitio: https://data.humdata.org/dataset/novel-coronavirus-2019-ncov-cases

# Acumulado de Casos Confirmados

p <- ggplot(mex, aes(x=Fecha, y=Infectados)) + 
  geom_line( color="blue") + 
  geom_point() +
  labs(x = "Fecha", 
       y = "Acumulado de casos confirmados",
       title = paste("Confirmados de COVID-19 en México:", 
                     format(Sys.time(), 
                            tz="America/Mexico_City", 
                            usetz=TRUE))) +
  theme(plot.title = element_text(size=12))  +
  theme(axis.text.x = element_text(face = "bold", color="#993333" , 
                                   size = 10, angle = 45, 
                                   hjust = 1),
        axis.text.y = element_text(face = "bold", color="#993333" , 
                                   size = 10, angle = 45, 
                                   hjust = 1))  # color, ángulo y estilo de las abcisas y ordenadas 

library(scales)

p <- p  + scale_x_date(labels = date_format("%d-%m-%Y")) # paquete scales

###

p <- p +
  theme(plot.margin=margin(10,10,20,10), plot.caption=element_text(hjust=1.05, size=10)) +
  annotate("text", x = mex$Fecha[round(dim(mex)[1]*0.4)], y = max(mex$Infectados), colour = "blue", size = 5, label = paste("Última actualización: ", mex$Infectados[dim(mex)[1]]))
p

# Casos Confirmados por Día

p <- ggplot(mex, aes(x=Fecha, y=NI)) + 
  geom_line(stat = "identity") + 
  labs(x = "Fecha", y = "Incidencia (Número de casos nuevos)",
       title = paste("Casos de Incidencia de COVID-19 en México:", 
                     format(Sys.time(), 
                            tz="America/Mexico_City", usetz=TRUE))) +
  theme(plot.title = element_text(size=12))  +
  theme(axis.text.x = element_text(face = "bold", color="#993333" , size = 10, angle = 45, hjust = 1),
        axis.text.y = element_text(face = "bold", color="#993333" , size = 10, angle = 45, hjust = 1))  # color, Ángulo y estilo de las abcisas y ordenadas

p <- p  + scale_x_date(labels = date_format("%d-%m-%Y")) # paquete scales
p

###

p <- p +
  theme(plot.margin=margin(10,10,20,10), plot.caption=element_text(hjust=1.05, size=10)) +
  annotate("text", x = mex$Fecha[round(dim(mex)[1]*0.4)], y = max(mex$NI), colour = "blue", size = 5, 
           label = paste("Última actualización: ", mex$NI[length(mex$NI)]))
p

# Muertes Acumuladas

mexm <- subset(mex, Muertos > 0) # Tomamos el subconjunto desde que comenzaron las muertes

p <- ggplot(mexm, aes(x=Fecha, y=Muertos)) + geom_line( color="red") + 
  geom_point() +
  labs(x = "Fecha", 
       y = "Muertes acumuladas",
       title = paste("Muertes por COVID-19 en México:", format(Sys.time(), tz="America/Mexico_City",usetz=TRUE))) +
  theme(axis.text.x = element_text(face = "bold", color="#993333" , size = 10, angle = 45, hjust = 1),
        axis.text.y = element_text(face = "bold", color="#993333" , size = 10, angle = 45, hjust = 1))  # color, Ángulo y estilo de las abcisas y ordenadas

p <- p  + scale_x_date(labels = date_format("%d-%m-%Y"))

p

###

p <- p +
  theme(plot.margin=margin(10,10,20,10), plot.caption=element_text(hjust=1.05, size=10)) +
  annotate("text", x = mexm$Fecha[round(dim(mexm)[1]*0.4)], 
           y = max(mexm$Muertos), colour = "red", size = 5, label = paste("Última actualización: ", mexm$Muertos[dim(mexm)[1]]))
p

# Muertes por Día
p <- ggplot(mexm, aes(x=Fecha, y=NM)) + 
  geom_line(stat = "identity") + 
  labs(x = "Fecha", y = "Número de nuevos decesos",
       title = paste("Nuevos decesos por COVID-19 en México:", 
                     format(Sys.time(), tz="America/Mexico_City",usetz=TRUE))) +
  theme(plot.title = element_text(size=12)) +
  theme(axis.text.x = element_text(face = "bold", color="#993333" , size = 10, angle = 45, hjust = 1),
        axis.text.y = element_text(face = "bold", color="#993333" , size = 10, angle = 45, hjust = 1))  # color, Ángulo y estilo de las abcisas y ordenadas

p <- p  + scale_x_date(labels = date_format("%d-%m-%Y"))

###

p <- p +
  theme(plot.margin=margin(10,10,20,10), plot.caption=element_text(hjust=1.05, size=10)) +
  annotate("text", x = mexm$Fecha[round(dim(mexm)[1]*0.2)], 
           y = max(mexm$NM), colour = "red", size = 5, label = paste("Última actualización: ", mexm$NM[dim(mexm)[1]]))
p

# Superposición de gráficas
# Acumulado de Casos Confirmados y Muertes
p <- ggplot(mex, aes(x=Fecha, y=Infectados)) + geom_line(color="blue") + 
  labs(x = "Fecha", 
       y = "Acumulado de casos",
       title = paste("COVID-19 en México:", format(Sys.time(), tz="America/Mexico_City",usetz=TRUE))) +
  geom_line(aes(y = Muertos), color = "red") +
  theme(axis.text.x = element_text(face = "bold", color="#993333" , size = 10, angle = 45, hjust = 1),
        axis.text.y = element_text(face = "bold", color="#993333" , size = 10, angle = 45, hjust = 1))  # color, Ángulo y estilo de las abcisas y ordenadas

p <- p  + scale_x_date(labels = date_format("%d-%m-%Y"))



p <- p +
  theme(plot.margin=margin(10,10,20,10), plot.caption=element_text(hjust=1.05, size=10)) +
  annotate("text", x = mex$Fecha[round(dim(mex)[1]*0.4)], 
           y = max(mex$Infectados), colour = "blue", size = 5, label = paste("Última actualización para Infectados:", mex$Infectados[dim(mex)[1]])) +
  annotate("text", x = mex$Fecha[round(dim(mex)[1]*0.4)], 
           y = max(mex$Infectados)-100000, colour = "red", size = 5, label = paste("Última actualización para Muertes:", mex$Muertos[dim(mex)[1]])) 
p

# Tasa de Letalidad: La tasa de letalidad observada para un día determinado, la calculamos dividiendo las muertes acumuladas reportadas hasta ese día, entre el acumulado de casos confirmados para el mismo día. Multiplicamos el resultado por 100 para reportarlo en forma de porcentaje. Lo que obtenemos es el porcentaje de muertes del total de casos confirmados.

p <- ggplot(mexm, aes(x=Fecha, y=Letalidad)) + geom_line(color="red") + 
  labs(x = "Fecha", 
       y = "Tasa de letalidad",
       title = paste("COVID-19 en México:", format(Sys.time(), tz="America/Mexico_City",usetz=TRUE))) +
  theme(axis.text.x = element_text(face = "bold", color="#993333" , size = 10, angle = 45, hjust = 1),
        axis.text.y = element_text(face = "bold", color="#993333" , size = 10, angle = 45, hjust = 1)) + # color, Ángulo y estilo de las abcisas y ordenadas 
  scale_y_discrete(name ="Tasa de letalidad", 
                   limits=factor(seq(1, 13.5, 1)), labels=paste(seq(1, 13.5, 1), "%", sep = ""))

p <- p  + scale_x_date(labels = date_format("%d-%m-%Y"))

###

p <- p +
  theme(plot.margin=margin(10,10,20,10), plot.caption=element_text(hjust=1.05, size=10)) +
  annotate("text", x = mexm$Fecha[round(length(mexm$Fecha)*0.2)], 
           y = max(mexm$Letalidad)-1, colour = "red", size = 4, label = paste("Última actualización: ", mexm$Letalidad[dim(mexm)[1]], "%", sep = "")) 
p

# Factores de Crecimiento:

# El factor de crecimiento de infectados para un día determinado, lo calculamos al dividir el acumulado de infectados para ese día, entre el acumulado de infectados del día anterior. El factor de crecimiento de muertes lo calculamos de forma similar.

mex <- filter(mex, FCM < Inf) # Tomamos solo valores reales de factores de crecimiento

p <- ggplot(mex, aes(x=Fecha, y=FCI)) + geom_line(color="blue") + 
  labs(x = "Fecha", 
       y = "Factor de crecimiento",
       title = paste("COVID-19 en México:", format(Sys.time(), tz="America/Mexico_City",usetz=TRUE))) +
  geom_line(aes(y = FCM), color = "red") + theme(plot.title = element_text(size=12)) +
  theme(axis.text.x = element_text(face = "bold", color="#993333" , size = 10, angle = 45, hjust = 1),
        axis.text.y = element_text(face = "bold", color="#993333" , size = 10, angle = 45, hjust = 1))  # color, Ángulo y estilo de las abcisas y ordenadas

p <- p  + scale_x_date(labels = date_format("%d-%m-%Y"))

###

p <- p +
  annotate("text", x = mex$Fecha[round(length(mex$Fecha)*0.4)], y = max(mex$FCM), colour = "blue", size = 5, label = paste("Última actualización para infectados: ", round(mex$FCI[dim(mex)[1]], 4))) +
  annotate("text", x = mex$Fecha[round(length(mex$Fecha)*0.4)], y = max(mex$FCM)-0.2, colour = "red", size = 5, label = paste("Última actualización para muertes: ", round(mex$FCM[dim(mex)[1]], 4))) 
p
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
# Reto 3.2 
 

library(ggplot2)

na <- read.csv("https://raw.githubusercontent.com/beduExpert/Programacion-con-R-Santander/master/Sesion-03/Reto-02/players_stats.csv")
naom <- na.omit(na)
# 1 Generar un histograma de los minuntos totales (MIN), de los jugadores y agregar una línea donde se muestre la media (Hint: para agregar la línea que muestre la media consulta la documentación sobre geom_vline y el argumento xintercept)
 
mnba=mean(na$MIN)

ggplot(na, aes(MIN)) + geom_histogram(binwidth=100, col="black") + geom_vline(aes(xintercept=mnba))


# 2 Generar un histograma de edad (Age) y agregar una línea con la media

(mean_age=mean(na.omit(na$Age)))

ggplot(na, aes(Age)) + geom_histogram(binwidth=1, col="black") + geom_vline(aes(xintercept=mean_age))
 
# 3 Hacer un scatterplot de las variables Weight y Height y observar la correlacón que existe entre ambas variables (1 sola gráfica)

ggplot(naom, aes(x = Weight, y = Height)) + geom_point()
cor(naom$Weight,naom$Height)
       
# 4 Utiliza la función which.max para saber quién es el jugador más alto, una vez hecho esto, presenta los resultados en una leyenda que diga "El jugador más alto es: Name, con una altura de: Height". Las unidades de altura deben ser en metros.

maxx<-which.max(naom$Height)
nom<-naom$Name[maxx]
alt<-naom$Height[maxx]
paste("El jugador mas alto es",  nom, "con una altura de ", alt*.01,"m")


# 5 Utiliza la función which.min para saber quién es el jugador más bajito, una vez hecho esto, presenta los resultados en una leyenda que diga "El jugador más bajito es: Name, con una altura de: Height". Las unidades de altura deben ser en metros.

minn<-which.min(naom$Height)
min_nom<-naom$Name[minn]
min_alt<-naom$Height[minn]
paste("El jugador mas bajo es",  min_nom, "con una altura de ", min_alt*.01,"m")

# 6 ¿Cuál es la altura promedio?, representa el resultado en una frase que diga: "La altura promedio es: ALTURA"

promedioaltura <- mean(naom$Height)
paste("La altura promedio es de",  promedioaltura*.01,"m")

# 7 Generar un scatterplot donde se representen las Asistencias totales (AST.TOV) vs Puntos (PTS), además has un face wrap con la posición (Pos).

ggplot(naom, aes(x = AST.TOV, y = PTS)) + geom_point() +
facet_wrap("Pos")
cor(naom$Weight,naom$Height)

                                                                
```

## Reto 3
```r
```
