# Postwork Sesión 4

#### Objetivo

- Investigar la dependencia o independecia de las variables aleatorias X y Y, el número de goles anotados por el equipo de casa y el número de goles anotados por el equipo visitante.

#### Requisitos

- R, RStudio
- Haber trabajado con el prework y el work

#### Desarrollo

Ahora investigarás la dependencia o independencia del número de goles anotados por el equipo de casa y el número de goles anotados por el equipo visitante mediante un procedimiento denominado bootstrap, revisa bibliografía en internet para que tengas nociones de este desarrollo. 

1. Ya hemos estimado las probabilidades conjuntas de que el equipo de casa anote X=x goles (x=0,1,... ,8), y el equipo visitante anote Y=y goles (y=0,1,... ,6), en un partido. Obtén una tabla de cocientes al dividir estas probabilidades conjuntas por el producto de las probabilidades marginales correspondientes.

2. Mediante un procedimiento de boostrap, obtén más cocientes similares a los obtenidos en la tabla del punto anterior. Esto para tener una idea de las distribuciones de la cual vienen los cocientes en la tabla anterior. Menciona en cuáles casos le parece razonable suponer que los cocientes de la tabla en el punto 1, son iguales a 1 (en tal caso tendríamos independencia de las variables aleatorias X y Y).

```R
# Postwork 4

# https://support.minitab.com/es-mx/minitab/20/help-and-how-to/probability-distributions-random-data-and-resampling-analyses/supporting-topics/resampling-analyses/what-is-bootstrapping/

# Ahora investigarás la dependencia o independencia del número de goles anotados por el equipo de casa y el número de goles anotados por el equipo visitante mediante un procedimiento denominado bootstrap, revisa bibliografía en internet para que tengas nociones de este desarrollo.

# Ya hemos estimado las probabilidades conjuntas de que el equipo de casa anote X=x goles (x=0,1,... ,8), y el equipo visitante anote Y=y goles (y=0,1,... ,6), en un partido. Obtén una tabla de cocientes al dividir estas probabilidades conjuntas por el producto de las probabilidades marginales correspondientes.

# Mediante un procedimiento de boostrap, obtén más cocientes similares a los obtenidos en la tabla del punto anterior. Esto para tener una idea de las distribuciones de la cual vienen los cocientes en la tabla anterior. Menciona en cuáles casos le parece razonable suponer que los cocientes de la tabla en el punto 1, son iguales a 1 (en tal caso tendríamos independencia de las variables aleatorias X y Y).}

library(rsample)
# lsumibrary(estcomp)
library(pryr)
library(reshape)


# 1 - TABLA DE COCIENTES

setwd("C:/Users/LLerma/Google Drive/Analisis de Datos/M2 - Programacion y Estadistica con R/S4/Files/PW")
prob<-read.csv("Heatmap_probabilidades.csv", header = TRUE)

setwd("C:/Users/LLerma/Google Drive/Analisis de Datos/M2 - Programacion y Estadistica con R/S3/Postwork")
data <- read.csv("Datos Finales.csv")

hg <- as.data.frame(table(data$FTHG))
ag <- as.data.frame(table(data$FTAG))

# Prbabilidades marginales

hg$Var1<- NULL
ag$Var1<- NULL

p_hg <- hg/1140
p_ag <- ag/1140


# Tabla de cocientes

cocientes <- as.data.frame(matrix(nrow=9,ncol=7))

for ( i in 1:9){
  for (j in 1:7){
    cocientes[i,j]<- prob[i,j]/(p_hg[i,]*p_ag[j,])
  }
}

rownames(cocientes) <- c(0:8)
colnames(cocientes) <- c(0:6)

cocientes2 <- melt(as.matrix(cocientes))

p <- ggplot(cocientes2, aes(x = factor(X1), y = factor(X2), fill = value)) + 
  geom_tile(col="black") + 
  xlab("Goles de local")+ 
  ylab("Goles de visitante") +
  ggtitle("Heatmap de probabilidad de goles")+
  theme(axis.text.x = element_text(angle = 90, vjust = 0.5, hjust=1)) +
  scale_fill_gradient(low="white", high="blue") 

ggplotly(p)

# 2 - BOOSTRAP

setwd("C:/Users/LLerma/Google Drive/Analisis de Datos/M2 - Programacion y Estadistica con R/S3/Postwork")

data <- read.csv("Datos Finales.csv")

muestra <- sample_n(data, 1140)
muestra

# Generamos 100 muestras bootstrap

bootm <- bootstraps(muestra, times = 5)
bootm

first <- bootm$splits[[1]]
sec <- bootm$splits[[2]]
third <- bootm$splits[[3]]


x <-as.data.frame(first)
y <-as.data.frame(sec)
z <-as.data.frame(third)


#Mismo código

(prob2 <- matrix(0, nrow = 9, ncol = 7 ))

(for ( i in 1:9){
  for (j in 1:7){
    prob2[i,j]<-count(x, x$FTHG == i-1 & x$FTAG == j-1 )[2,2]/1140
  }
})

(prob2[is.na(prob2)] <- 0)

hg2 <- as.data.frame(table(x$FTHG))
ag2 <- as.data.frame(table(x$FTAG))

# Prbabilidades marginales

hg2$Var1<- NULL
ag2$Var1<- NULL

p_hg2 <- hg2/1140
p_ag2 <- ag2/1140


# Tabla de cocientes

cocientesx <- as.data.frame(matrix(nrow=9,ncol=7))

for ( i in 1:9){
  for (j in 1:7){
    cocientesx[i,j]<- prob2[i,j]/(p_hg2[i,]*p_ag2[j,])
  }
}

(cocientesx[is.na(cocientesx)] <- 0)

rownames(cocientesx) <- c(0:8)
colnames(cocientesx) <- c(0:6)

cocientesx2 <- melt(as.matrix(cocientesx))

p2 <- ggplot(cocientesx2, aes(x = factor(X1), y = factor(X2), fill = value)) + 
  geom_tile(col="black") + 
  xlab("Goles de local")+ 
  ylab("Goles de visitante") +
  ggtitle("Heatmap de probabilidad de goles")+
  theme(axis.text.x = element_text(angle = 90, vjust = 0.5, hjust=1)) +
  scale_fill_gradient(low="white", high="blue") 

ggplotly(p2)
```
