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

# Ahora se realiza la parte de graficación para esta parte del postwork, para visualizar las anotaciones de diversos equipos, esto es útil par darse cuenta del desempeño de cada equipo.
# 
# Con el último data frame obtenido en el postwork de la sesión 2, elabora tablas de frecuencias relativas para estimar las siguientes probabilidades:
# # La probabilidad (marginal) de que el equipo que juega en casa anote x goles (x=0,1,2,)
# # La probabilidad (marginal) de que el equipo que juega en casa anote y goles (y=0,1,2,)
# # La probabilidad (conjunta) de que el equipo que juega en casa anote x goles y el equipo que juega como visitante anote y goles (x=0,1,2,, y=0,1,2,)

library(ggplot2)
library(reshape)
library(plotly)


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
# # Un gráfico de barras para las probabilidades marginales estimadas del número de goles que anota el equipo de casa
# # Un gráfico de barras para las probabilidades marginales estimadas del número de goles que anota el equipo visitante.

phg <- (hg/max_hg)
pag <- (ag/max_ag)

a <- length(phg)
b <- length(pag)

barplot(phg, main="Probabilidades de meter 'x' goles en casa", col = "red")
barplot(pag, main="Probabilidades de meter 'x' goles de visita", col = "blue")

# # Un HeatMap para las probabilidades conjuntas estimadas de los números de goles que anotan el equipo de casa y el equipo visitante en un partido.

# Columnas → visitante
# Renglones → casa

(heatmap <- matrix(nrow = a, ncol = b ))

for ( i in 1:9){
  for (j in 1:7){
    heatmap [i,j] <- phg[i] * pag[j]
  }
}

rownames(heatmap) <- c(0:8)
colnames(heatmap) <- c(0:6)

heatmap2 <- melt(heatmap)

ggplot(heatmap2, aes(x = X1, y = X2, fill = value)) + 
  geom_tile() + 
  xlab("Goles de local")+ 
  ylab("Goles de visitante") +
  ggtitle("Heatmap de probabilidad de goles")+
  theme(plot.title = element_text(hjust = 0.5))

ggplotly(p)
```
