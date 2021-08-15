# Desarrollo

# Comenzando con gráficos simples; vamos a utilizar el dataset mtcars.

# Instalamos el paquete (si es necesario) y lo cargamos

library(ggplot2)

# Primero recordamos cuales son las variables que contiene el dataset

names(mtcars)

# Graficamos las variables cyl en el eje x y hp en y, observa el comando geom_point()

ggplot(mtcars, aes(x=cyl, y = hp, colour = mpg )) + geom_point() #Para puntos


#Tipo de geometría, intenta utilizar alguna otra


# Agregando carácteristicas de tema y facewrap

names(mtcars)
p<-ggplot(mtcars, aes(x=cyl, y = hp, colour = mpg )) + 
  geom_point() +   
  theme_gray() +   # Temas (inteta cambiarlo)
  facet_wrap("cyl")  # Lo divide por el núm de cilindros
#facet_grid("am")

library(plotly)


# Para poder visualizar el nombre de los coches en la gr�fica

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
  facet_wrap("cyl") +  # Lo divide por el núm de cilindros
  xlab('Num de cilindros') +  # Nombre en los ejes
  ylab('Caballos de Fuerza')

# Adicionalmente se pueden realizar otros tipos de gráficos, estos se verán en los próximos ejemplos.