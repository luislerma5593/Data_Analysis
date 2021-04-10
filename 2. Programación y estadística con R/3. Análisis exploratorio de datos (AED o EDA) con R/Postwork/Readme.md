# Postwork

Ahora graficaremos probabilidades (estimadas) marginales y conjuntas para el número de goles que anotan en un partido el equipo de casa o el equipo visitante.

1. Con el último data frame obtenido en el postwork de la sesión 2, elabora tablas de frecuencias relativas para estimar las siguientes probabilidades:

- La probabilidad (marginal) de que el equipo que juega en casa anote x goles (x=0,1,2,)

- La probabilidad (marginal) de que el equipo que juega como visitante anote y goles (y=0,1,2,)

- La probabilidad (conjunta) de que el equipo que juega en casa anote x goles y el equipo que juega como visitante anote y goles (x=0,1,2,, y=0,1,2,)

2. Realiza lo siguiente:

- Un gráfico de barras para las probabilidades marginales estimadas del número de goles que anota el equipo de casa
- Un gráfico de barras para las probabilidades marginales estimadas del número de goles que anota el equipo visitante.
- Un HeatMap para las probabilidades conjuntas estimadas de los números de goles que anotan el equipo de casa y el equipo visitante en un partido.

```r
# Postwork 2.3

# Ahora se realiza la parte de graficaciÃ³n para esta parte del postwork, para visualizar las anotaciones de diversos equipos, esto es Ãºtil par darse cuenta del desempeÃ±o de cada equipo.
# 
# Con el Ãºltimo data frame obtenido en el postwork de la sesiÃ³n 2, elabora tablas de frecuencias relativas para estimar las siguientes probabilidades:
# # La probabilidad (marginal) de que el equipo que juega en casa anote x goles (x=0,1,2,)
# # La probabilidad (marginal) de que el equipo que juega en casa anote y goles (y=0,1,2,)
# # La probabilidad (conjunta) de que el equipo que juega en casa anote x goles y el equipo que juega como visitante anote y goles (x=0,1,2,, y=0,1,2,)

library(ggplot2)
library(reshape)
library(plotly)
library(dplyr)


setwd("C:/Users/LLerma/Google Drive/Analisis de Datos/M2 - Programacion y Estadistica con R/S3/Postwork")

data <- read.csv("Datos Finales.csv")

hg <- table(data$FTHG)
ag <- table(data$FTAG)

max_hg<-sum(hg)
max_ag<-sum(ag)

for (i in 0:2){
  print(paste("La probabilidad de que el equipo local anote",i,"goles, es de ", round(hg[i+1]/max_hg,4)))
}

for (i in 0:2){
  print(paste("La probabilidad de que el equipo visitante anote",i,"goles, es de ", round(ag[i+1]/max_hg,4)))
}

for (i in 0:2){
  print(paste("La probabilidad de que ambos qeuipos anoten",i,"goles, es de ", round((hg[i+1]/max_hg)*(ag[i+1]/max_hg),4)))
  }

# Realiza lo siguiente:
# # Un grÃ¡fico de barras para las probabilidades marginales estimadas del nÃºmero de goles que anota el equipo de casa
# # Un grÃ¡fico de barras para las probabilidades marginales estimadas del nÃºmero de goles que anota el equipo visitante.

phg <- as.data.frame((hg/max_hg))
pag <- as.data.frame((ag/max_ag))

a <- dim(phg)[1]
b <- dim(pag)[1]

barplot(phg[,2], main="Probabilidades de meter 'x' goles en casa", col = "red")
barplot(pag[,2], main="Probabilidades de meter 'x' goles de visita", col = "blue")

ggplot(pag, aes(x = Var1, y = Freq)) + 
  geom_col(colour = "black", fill= "orange") +
  geom_text(aes(y = round(Freq, 6), label = round(Freq, 3)), 
            position = "identity", size=3, vjust = -1, hjust=0.5 ,col="black") +
  ggtitle("Probabilidades marginales de goles de equipos visitantes") + 
  xlab("Goles") +
  ylab("Probabilidades") +
  theme_minimal()

# # Un HeatMap para las probabilidades conjuntas estimadas de los nÃºmeros de goles que anotan el equipo de casa y el equipo visitante en un partido.

# Columnas â visitante
# Renglones â casa

(heatmap <- matrix(0, nrow = a, ncol = b ))

# for ( i in 1:9){
#   for (j in 1:7){
#     heatmap [i,j] <- round(phg[i,2] * pag[j,2],4)
#   }
# }

(for ( i in 1:9){
  for (j in 1:7){
    heatmap[i,j]<-count(data, data$FTHG == i-1 & data$FTAG == j-1 )[2,2]/1140
  }
})

heatmap[is.na(heatmap)] <- 0

rownames(heatmap) <- c(0:8)
colnames(heatmap) <- c(0:6)

heatmap2 <- melt(heatmap)

p <- ggplot(heatmap2, aes(x = factor(X1), y = factor(X2), fill = value)) + 
  geom_tile() + 
  xlab("Goles de local")+ 
  ylab("Goles de visitante") +
  ggtitle("Heatmap de probabilidad de goles")+
  theme(axis.text.x = element_text(angle = 90, vjust = 0.5, hjust=1)) +
  scale_fill_gradient(low="white", high="blue") 

ggplotly(p)

p <- ggplot(heatmap2, aes(x = X1, y = X2, fill = value)) +
  geom_tile() +
  theme(axis.text.x = element_text(angle = 90, vjust = 0.5, hjust=1)) +
  scale_fill_gradient(low="white", high="steelblue") +
  labs(x = "Anio semana", y = "Estado", title = "Count of unique pdv's by week")
p %>% ggplotly()


setwd("C:/Users/LLerma/Google Drive/Analisis de Datos/M2 - Programacion y Estadistica con R/S4/Files/PW")

write.csv(heatmap,"Heatmap_probabilidades.csv", quote = TRUE, row.names = FALSE)
```
