# Reto 1

#Abre el fichero que se encuentra en el repositorio y obten sus carácteristicas, para finalmente imprimir los resultados en un fichero CSV.

#Leer el archivo "netflix_titles.csv" desde Github (https://raw.githubusercontent.com/ecoronadoj/Sesion_1/main/Data/netflix_titles.csv), almacenarlo en un df llamado netflix

#Obtener la dimensión y el tipo de objeto que se obtiene

#Obtener los títulos que se estrenaron después del 2015. Almacenar este df en una variable llamada net.2015 (Hint: primero podrías filtrar solo aquellas filas del data frame que corresponden a estrenos después del 2015, por ejemplo, dataframe[columna > 2015, ])

#Escribir los resultados en un archivo .csv llamado res.netflix.csv (Hint: consulta la función write.csv)


netflix <- read.csv("https://raw.githubusercontent.com/ecoronadoj/Sesion_1/main/Data/netflix_titles.csv")

dim(netflix)

class(netflix)
str(netflix)

new_netflix<-netflix[netflix$release_year > 2015,]

write.csv(new_netflix)

write.csv(netflix, "Netflix")
write.csv(new_netflix, "New Netflix")

