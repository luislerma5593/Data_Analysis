## Reto 3

# 1. Descargue los archivos csv que corresponden a las temporadas 2017/2018, 2018/2019, 2019/2020 y 2020/2021 de la Bundesliga 1 y que se encuentran en el siguiente enlace https://www.football-data.co.uk/germanym.php
# 
# 2. Importe los archivos descargados a R
# 
# 3. Usando la función select del paquete dplyr, seleccione únicamente las columnas:
#   
# Date
# HomeTeam
# AwayTeam
# FTHG
# FTAG
# FTR
# Combine cada uno de los data frames en un único data frame con ayuda de las funciones:
#   rbind
#do.call

library(dplyr)

setwd("C:/Users/LLerma/Google Drive/Analisis de Datos/M2 - Programacion y Estadistica con R/S2/Files/Reto 3")


url1<-"https://www.football-data.co.uk/mmz4281/1718/D1.csv"
url2<-"https://www.football-data.co.uk/mmz4281/1819/D1.csv"
url3<-"https://www.football-data.co.uk/mmz4281/1920/D1.csv"
url4<-"https://www.football-data.co.uk/mmz4281/2021/D1.csv"

download.file(url1, destfile ="File1Reto3.csv", mode = "wb")
download.file(url2, destfile ="File2Reto3.csv", mode = "wb")
download.file(url3, destfile ="File3Reto3.csv", mode = "wb")
download.file(url4, destfile ="File4Reto3.csv", mode = "wb")

lista<-lapply(dir(),read.csv)
lista2<-lapply(lista,select,Date,HomeTeam,AwayTeam,FTHG,FTAG,FTR)

lista_docall <- do.call(rbind,lista2)
lista_lapply <- lapply(lista2,rbind)

