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
