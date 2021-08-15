# Ejemplo 3.2 - Histogramas


library(dplyr) # Para usar el operador %>%
library(ggplot2)
data <- read.csv("https://raw.githubusercontent.com/beduExpert/Programacion-con-R-2021/main/Sesion-03/Data/boxp.csv")
head(data)
names(data)

# Modificando una columna para "disfrazarla"

data2 <- mutate(data, Mediciones = Mediciones*1.23) 

data3 <- mutate(data, Mediciones = Mediciones/1.23) 

# Utilizando la función hist

hist(data$Mediciones, breaks = seq(0,360, 20),  #Breakes es para el final del eje x
     main = "Histograma de Mediciones",
     xlab = "Mediciones",
     ylab = "Frecuencia")

# Ahora utilizando ggplot para apreciar los resultados de las dos funciones

# Evitar el Warning de filas con NA´s

data <- na.omit(data) 


# CON GGPLOT

data %>%
  ggplot() + 
  aes(Mediciones) +
  geom_histogram(binwidth = 20,col="red")

ggplot(data, aes(Mediciones)) + geom_histogram(binwidth = 20) #Para puntos


library(plotly)
ggplotly(g)


# Agregando algunas etiquetas y tema, intenta modificar algunas de las opciones para que aprecies los resultados

data %>%
  ggplot() + 
  aes(Mediciones) +
  geom_histogram(binwidth = 10, col="red", fill = "blue",position = "identity") + 
  ggtitle("Histograma de Mediciones") +
  ylab("Frecuencia") +
  xlab("Mediciones") + 
  theme_light()

#Clasic sin cuadrícula
#Light con cuadrícula


# Tanto hist(), como ggplot() + aes() + geom_histogram() son útiles para generar los histogramas, tu decide cual te funciona mejor.

