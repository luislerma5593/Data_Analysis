# Work

* [Ejemplos](#Ejemplos)
  * [Ejemplo 1 (Conexión entre RStudio y Github)](#Ejemplo-1)
  * [Ejemplo 2 (Conexión a una BDD con R)](#Ejemplo-2)
  * [Ejemplo 3 (Variantes en la lectura de BDD con R)](#Ejemplo-3)
  * [Ejemplo 4 (Lectura de archivos JSON, XML y tablas en HTML)](#Ejemplo-4)

* [Retos](#Retos)
  * [x] [Reto 1 (Vinculación entre RStudio Cloud -> Github)](#Reto-1)
  * [x] [Reto 2 (Extracción de tablas en un HTML)](#Reto-2)
  * [x] [Reto 3 (Vinculación entre Github -> RStudio)](#Reto-3)

# Ejemplos

## Ejemplo 1

En este ejercicio se sincronizó Github con RStudio Cloud

- En la terminal
git config --global user.email "e.coronadoj@gmail.com"
git config --global user.name "Erick"

- Creas un .R y lo guardas
Git > Commit


## Ejemplo 2
```r
# Ejemplo 2. Conexión a una BDD con R

# Comenzaremos instalando las librerias necesarias para realizar la conexión y 
# lectura de la base de datos en RStudio, si previamente los tenías instalados 
# omite la instalación, recuerda que solo necesitas realizarla una vez.

 install.packages("DBI")
 install.packages("RMySQL")

library(DBI)
library(RMySQL)

# Una vez que se tengan las librerias necesarias se procede a la lectura 
# (podría ser que necesites otras, si te las solicita instalalas y cargalas), 
# de la base de datos de Shiny la cual es un demo y nos permite interactuar con 
# este tipo de objetos. El comando dbConnect es el indicado para realizar la 
# lectura, los demás parametros son los que nos dan acceso a la BDD.

MyDataBase <- dbConnect(
  drv = RMySQL::MySQL(),
  dbname = "shinydemo",
  host = "shiny-demo.csa7qlmguqrf.us-east-1.rds.amazonaws.com",
  username = "guest",
  password = "guest")

# Si no se arrojaron errores por parte de R, vamos a explorar la BDD

dbListTables(MyDataBase)

# Ahora si se quieren desplegar los campos o variables que contiene la tabla 
# City se hará lo siguiente

dbListFields(MyDataBase, 'City')

# Para realizar una consulta tipo MySQL sobre la tabla seleccionada haremos lo 
# siguiente

DataDB <- dbGetQuery(MyDataBase, "select ID from City WHERE")

# Observemos que el objeto DataDB es un data frame, por lo tanto ya es un objeto 
# de R y podemos aplicar los comandos usuales

class(DataDB)
head(DataDB)


pop.mean <- mean(DataDB$Population)  # Media a la variable de población
pop.mean 

pop.3 <- pop.mean *3   # Operaciones aritméticas
pop.3

# Incluso podemos hacer unos de otros comandos de busqueda aplicando la 
# libreria dplyr

library(dplyr)
pop50.mex <-  DataDB %>% filter(CountryCode == "MEX" ,  Population > 50000)   # Ciudades del país de México con más de 50,000 habitantes

head(pop50.mex)

unique(DataDB$CountryCode)   # Países que contiene la BDD

```

## Ejemplo 3
```r
# Ejemplo 3. Variantes en la lectura de BDD con R

# Ahora utilizaremos otra opción para realizar queries a una BDD con la ayuda 
# de dplyr que sustituye a SELECT en MySQL y el operador %>%, hay que recordar 
# que con este comando también podemos realizar búsquedas de forma local.

# Comenzamos instalando las paqueterías necesarias y cargándolas a R

# install.packages("pool")
# install.packages("dplyr")

library(dplyr)
library(pool)
library(dbplyr)

# Se realiza la lectura de la BDD con el comando dbPool, los demás parámetros 
# se siguen utilizando igual que el ejemplo anterior

my_db <- dbPool(
  RMySQL::MySQL(), 
  dbname = "shinydemo",
  host = "shiny-demo.csa7qlmguqrf.us-east-1.rds.amazonaws.com",
  username = "guest",
  password = "guest"
)

# Para ver el contenido de la BDD y realizar una búsqueda se procede de la 
# siguiente manera

dbListTables(my_db)

# Obtener los primeros 5 registros de Country

my_db %>% tbl("Country") %>% head(5) # library(dplyr)

# Obtener los primeros 5 registros de CountryLanguage

my_db %>% tbl("CountryLanguage") %>% head(5)

# Otra forma de generar una búsqueda será con la librería DBI, utilizando el 
# comando dbSendQuery

library(DBI)
conn <- dbConnect(
  drv = RMySQL::MySQL(),
  dbname = "shinydemo",
  host = "shiny-demo.csa7qlmguqrf.us-east-1.rds.amazonaws.com",
  username = "guest",
  password = "guest")

rs <- dbSendQuery(conn, "SELECT * FROM City LIMIT 5;")

dbFetch(rs)

# Para finalizar nos desconectamos de la BDD

dbClearResult(rs)
dbDisconnect(conn)
© 2021 GitHub, Inc.
```

## Ejemplo 4
```r
# Ejemplo 4. Lectura de archivos JSON, XML y tablas en HTML

# Comenzaremos instalando los paquetes necesarios para despuÃ©s cargarlos a R

# install.packages("rjson")   #Siempre usar comillas en el nombre del paquete

library(rjson)            # Quitar comillas del nombre

# Json
# Vamos a leer un archivo Json de prueba alojado aquÃ­

URL <- "https://tools.learningcontainer.com/sample-json-file.json" # Asignando el link a una variable

JsonData <- fromJSON(file= URL)     # Se guarda el JSon en un objeto de R
aaz<-as.data.frame(JsonData)
class(JsonData)                     # Vemos que tipo de objeto es JsonData

str(JsonData)                       # Vemos la naturaleza de sus variables

# Finalmente ya que pudimos acceder al contenido del Json, tambiÃ©n podemos 
# realizar la manipulaciÃ³n de los datos dentro del Json, por ejemplo:

sqrt(JsonData$Mobile)

# Para entrar a las demÃ¡s variables recuerda que puedas usar el operador de $, 
# es decir, JsonData$

# XML
# Ahora vamos a leer datos XML en R, utilizando un archivo XML alojado aquÃ­

# Lo primero es instalar y cargar el paquete XML y alojar el link en una variable 
# link, para su lectura

# install.packages("XML")
library(XML)
link <- "http://www-db.deis.unibo.it/courses/TW/DOCS/w3schools/xml/cd_catalog.xml"

# Analizando el XML desde la web
xmlfile <- xmlTreeParse(link)
# Ahora ya podemos ver las propiedades del objetvo xmlfile

summary(xmlfile)
head(xmlfile)
# TambiÃ©n gracias al xmlTreeParse podemos extraer los datos contenidos en el archivo

#Extraer los valores xml
topxml <- xmlSApply(xmlfile, function(x) xmlSApply(x, xmlValue))

# Colocandolos en un Data Frame
xml_df <- data.frame(t(topxml), row.names= NULL)

str(xml_df) # Observar la naturaleza de las variables del DF
# Convertiremos incluso las variables de PRICE y YEAR en datos numÃ©ricos para 
# poder realizar operaciones con este dato

xml_df$PRICE <- as.numeric(xml_df$PRICE) 
xml_df$YEAR <- as.numeric(xml_df$YEAR)

mean(xml_df$PRICE)
mean(xml_df$YEAR)
# Todo esto se puede realizar en un solo paso utilizando el siguiente comando

data_df <- xmlToDataFrame(link)
head(data_df)

# Tablas en HTML
# Comenzamos instalando el paquete rvest el cual nos permitirÃ¡ realizar la 
# lectura de la tabla en el HTML

# install.packages("rvest")
library(rvest)
# Introducimos una direcciÃ³n URL donde se encuentre una tabla

theurl <- "https://solarviews.com/span/data2.htm"
file <- read_html(theurl)    # Leemos el html
# Selecciona pedazos dentro del HTML para identificar la tabla

tables <- html_nodes(file, "table")  
# Hay que analizar 'tables' para determinar cual es la posiciÃ³n en la lista 
# que contiene la tabla, en este caso es la no. 4

# Extraemos la tabla de acuerdo a la posiciÃ³n en la lista

table1 <- html_table(tables[4], fill = TRUE)

table <- na.omit(as.data.frame(table1))   # Quitamos NAÂ´s que meten filas extras 
# y convertimos la lista en un data frame para su manipulaciÃ³n con R

str(table)  # Vemos la naturaleza de las variables
# Por Ãºltimo realizamos una conversiÃ³n de una columna tipo chr a num, se pueden 
# hacer las conversiones que se requieran

table$Albedo <- as.numeric(table$Albedo)
str(table)
Â© 2021 GitHub, Inc.
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
```r
# Reto 7.1

# Crea un repositorio en Github llamado Reto_Sesion_7
# 
# Crea un Project llamado Reto_Sesion_07 dentro de RStudio Cloud utilizando tu cuenta de RStudio, que esté ligado al repositorio recién creado
# 
# Ahora en RStudio crea un script llamado queries.Ren donde se conecte a la BDD shinydemo
# 
# Una vez hecha la conexión a la BDD, generar una busqueda con dplyr que devuelva el porcentaje de personas que hablan español en todos los países
# 
# Realizar una gráfica con ggplot que represente este porcentaje de tal modo que en el eje de las Y aparezca el país y en X el porcentaje, y que diferencíe entre aquellos que es su lengua oficial y los que no con diferente color (puedes utilizar la geom_bin2d() y coord_flip())
# 
# Una vez hecho esto hacer el commit y push para mandar tu archivo al repositorio de Github Reto_Sesion_7
# 


library(DBI)
library(RMySQL)
library(dplyr)
library(ggplot2)

MyDataBase <- dbConnect(
  drv = RMySQL::MySQL(),
  dbname = "shinydemo",
  host = "shiny-demo.csa7qlmguqrf.us-east-1.rds.amazonaws.com",
  username = "guest",
  password = "guest")


dbListTables(MyDataBase)

city <- dbGetQuery(MyDataBase, "select * from City")
country <- dbGetQuery(MyDataBase, "select * from Country")
CountryLanguage <- dbGetQuery(MyDataBase, "select * from CountryLanguage")

porcentaje <- filter(CountryLanguage, Language == "Spanish" )

ggplot(porcentaje, aes(x=Percentage, y=CountryCode, col=IsOfficial)) + geom_point()

```

## Reto 2
```r
# Reto 7.2

# Ahora es momento de realizar la extracción de una tabla desde un html, realiza este reto desde tu RStudio Desktop.
# 
# De la siguiente dirección donde se muestran los sueldos para Data Scientists
# 
# (https://www.glassdoor.com.mx/Sueldos/data-scientist-sueldo-SRCH_KO0,14.htm), realiza las siguientes acciones:
#   
#   Extraer la tabla del HTML
# 
# Quitar los caracteres no necesarios de la columna sueldos (todo lo que no sea número), para dejar solamente la cantidad mensual (Hint: la función gsub podría ser de utilidad)
# 
# Asignar ésta columna como tipo numérico para poder realizar operaciones con ella
# 
# Ahora podrás responder esta pregunta ¿Cuál es la empresa que más paga y la que menos paga?

library(rvest)

url <- "https://www.glassdoor.com.mx/Sueldos/data-scientist-sueldo-SRCH_KO0,14.htm"

file <- read_html(url)    # Leemos el html

tables <- html_nodes(file, "table")  

table1 <- html_table(tables[1], fill = TRUE)

table <- na.omit(as.data.frame(table1))   # Quitamos NA´s que meten filas extras 
final <- table
str(table) 

final$Sueldo <- gsub(pattern="MXN$", replacement="", x=final$Sueldo, fixed = TRUE)
final$Sueldo <- gsub(pattern="/mes", replacement="", x=final$Sueldo, fixed = TRUE)
final$Sueldo <- gsub(pattern=",", replacement="", x=final$Sueldo, fixed = TRUE)

final$Cargo <- gsub(pattern="Sueldos para Data Scientist en", replacement="", x=final$Cargo, fixed = TRUE)
final$Cargo <- gsub(pattern="sueldos informados", replacement="", x=final$Cargo, fixed = TRUE)
final$Cargo <- gsub(pattern="- \\d", replacement="", x=final$Cargo)

final$Sueldo <- as.numeric(final$Sueldo)


# > which.max(final$Sueldo)
# [1] 11
# > final[11,]
# Cargo Sueldo
# 11  IBM    87378

```

## Reto 3

* No se realizó, es hacer un pull desde RStudio
