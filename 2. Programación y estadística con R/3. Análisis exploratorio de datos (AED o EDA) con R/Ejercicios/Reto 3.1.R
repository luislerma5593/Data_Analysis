# Reto 3.1

library(dplyr) # Para usar el operador %>%
library(plotly)
data <- read.csv("https://raw.githubusercontent.com/beduExpert/Programacion-con-R-2021/main/Sesion-03/Reto-01/BD_Altura_Alunos.csv", sep =";")


hist(data$Altura, breaks = seq(140,200,3), col = "red", freq = T, #Igual que bin + 1
     main = "Histograma de Altura",
     xlab = "Mediciones",
     ylab = "Altura")

data %>%
  ggplot()+
  aes(Altura) +
  geom_histogram(bins=10 ,fill="#FFFF00", col="Black", alpha=0.5)+
  theme_light()+
  ggtitle("Altura")+
  xlab("Altura")+
  ylab("Cuenta")

#ggplotly(a)

# Hist es más rápido
# Geom_histogram es más detallado