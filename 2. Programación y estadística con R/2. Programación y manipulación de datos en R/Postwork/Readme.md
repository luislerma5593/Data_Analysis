# Postwork

Ahora vamos a generar un cúmulo de datos mayor al que se tenía, esta es una situación habitual que se puede presentar para complementar un análisis, siempre es importante estar revisando las características o tipos de datos que tenemos, por si es necesario realizar alguna transformación en las variables y poder hacer operaciones aritméticas si es el caso, además de sólo tener presente algunas de las variables, no siempre se requiere el uso de todas para ciertos procesamientos.

1. Importa los datos de soccer de las temporadas 2017/2018, 2018/2019 y 2019/2020 de la primera división de la liga española a R, los datos los puedes encontrar en el siguiente enlace https://www.football-data.co.uk/spainm.php

2. Obten una mejor idea de las características de los data frames al usar las funciones: str, head, View y summary

3. Con la función select del paquete dplyr selecciona únicamente las columnas Date, HomeTeam, AwayTeam, FTHG, FTAG y FTR; esto para cada uno de los data frames. (Hint: también puedes usar lapply).

4. Asegúrate de que los elementos de las columnas correspondientes de los nuevos data frames sean del mismo tipo (Hint 1: use as.Date y mutate para arreglar las fechas). Con ayuda de la función rbind forma un único data frame que contenga las seis columnas mencionadas en el punto 3 (Hint 2: la función do.call podría ser utilizada).

```r
library(dplyr)

setwd("C:/Users/LLerma/Google Drive/Analisis de Datos/M2 - Programacion y Estadistica con R/S2/Files/Postwork")


url1<-("https://www.football-data.co.uk/mmz4281/1718/SP1.csv")
url2<-("https://www.football-data.co.uk/mmz4281/1819/SP1.csv")
url3<-("https://www.football-data.co.uk/mmz4281/1920/SP1.csv")

download.file(url1,destfile = "File1.csv")
download.file(url2,destfile = "File2.csv")
download.file(url3,destfile = "File3.csv")

list<- sapply(dir(),read.csv)

str(list)
head(list)
View(list)
summary(list)

list2<-lapply(list,select,Date:FTR)

list2[[3]]$Time <- NULL

list3<-list2

list3[1] <- lapply(list2[1],mutate, Date = as.Date(Date, "%d/%m/%y"))
list3[2:3] <- lapply(list2[2:3],mutate, Date = as.Date(Date, "%d/%m/%Y"))

data <- do.call(rbind,list3)
```
