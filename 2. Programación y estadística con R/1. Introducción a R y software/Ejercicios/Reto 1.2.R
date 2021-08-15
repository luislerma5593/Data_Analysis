# Reto 2

#Realizar la lectura de los datos y seguir las instruccines que se muestran a continuación.
#Utiliza el data frame de ventas de libros por Amazon y realiza las siguientes actividades:

#Almacenalo en un data frame que se llame amazon.best
amazon.best <- read.csv("https://raw.githubusercontent.com/beduExpert/Programacion-con-R-Santander/master/Sesion-01/Data/bestsellers%20with%20categories.csv
")

#Calcula el data frame transpuesto, asígnale el nombre de tAmazon y conviértelo en un data frame (Hint: consulta la ayuda sobre las funciones t y as.data.frame)
tAmazon <- as.data.frame(t(amazon.best))

#Usa el nombre de los libros como el nombre de las columnas (Hint: consulta la documentación de names, tienes que hacer algo similar a names(dataframe) <- vector de nuevos nombres)
names(tAmazon) <- amazon.best$Name

#¿Cúal es el libro de menor y mayor precio?
max(amazon.best$Price)
min(amazon.best$Price)

