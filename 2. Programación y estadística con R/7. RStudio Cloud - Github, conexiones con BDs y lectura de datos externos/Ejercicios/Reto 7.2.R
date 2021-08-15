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
