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

setwd("C:/BEDU/M2_R/S1_Files/") # Depende del usuario
setwd("C:/Users/LLerma/Google Drive/Analisis de Datos/M2 - Programacion y Estadistica con R/S1/Files")

# La función read.csv será util para leer fichero .csv

read.csv("Top250.csv") # El archivo csv debe estar en el directorio de trabajo

# se puede asignar a un objeto el fichero leido anteriormente

Top250Rest <- read.csv("Top250.csv")
head(Top250Rest) 
tail(Top250Rest) 
str(Top250Rest)

# También se puede leer el fichero directamente desde una URL

SP1File <- read.csv("https://www.football-data.co.uk/mmz4281/2021/SP1.csv")
tail(SP1File); str(SP1File)

# Calculamos la dimensión de la base de datos

dim(amazon.books)

# El tipo de objeto se puede saber utilizando class()

class(amazon.books)
