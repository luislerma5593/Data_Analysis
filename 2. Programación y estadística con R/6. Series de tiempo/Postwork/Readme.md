# Postwork Sesión 6. 

#### Objetivo

- Aprender a crear una serie de tiempo en `R`

#### Requisitos

- Tener instalado R y RStudio
- Haber trabajado con el prework y el work

#### Desarrollo

Importa el conjunto de datos match.data.csv a `R` y realiza lo siguiente:

1. Agrega una nueva columna `sumagoles` que contenga la suma de goles por partido.

2. Obtén el promedio por mes de la suma de goles.

3. Crea la serie de tiempo del promedio por mes de la suma de goles hasta diciembre de 2019.

4. Grafica la serie de tiempo.

__Notas para los datos de soccer:__ https://www.football-data.co.uk/notes.txt
```R

library(dplyr)
library(lubridate)

data <- read.csv("https://raw.githubusercontent.com/beduExpert/Programacion-con-R-Santander/master/Sesion-06/Postwork/match.data.csv")

data$sumagoles <- data$home.score + data$away.score

data <- mutate(data, date = as.Date(date, format = "%Y-%m-%d"))

data2 <- aggregate(data, by = c(list(month(data$date)),list(year(data$date))), FUN = mean)

data2$date <- data2$home.team <- data2$away.team <- data2$home.score <- data2$away.score <- NULL

names(data2) <- c("Mes" ,   "Año" , "Promedio_Goles" )

datats <- ts(data2$Promedio_Goles, start = c(2010,8), end = c(2019,12), frequency=12)

plot(datats)
title(main="Promedio de goles por mes",sub="Agosto 2010 - Diciembre 2019")
points(y = datats, x = time(datats),
       pch = as.vector(season(datats)))

dec <- decompose(datats)
```
