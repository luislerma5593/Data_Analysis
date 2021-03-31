# Work

* [Ejemplos](#Ejemplos)
  * [Ejemplo 1 (Distribuciones binomial, normal y t de Student)](#Ejemplo-1)
  * [Ejemplo 2 (Teorema central del límite)](#Ejemplo-2)
  * [Ejemplo 3 (Algunos estimadores puntuales insesgados comunes)](#Ejemplo-3)
  * [Ejemplo 4 (Contraste de hipótesis)](#Ejemplo-4)

* [Retos](#Retos)
  * [ ] [Reto 1 (Distribuciones binomial, normal y t de Student)](#Reto-1)
  * [ ] [Reto 2 (Algunos estimadores puntuales insesgados comunes)](#Reto-2)
  * [ ] [Reto 3 (Contraste de hipótesis)](#Reto-3)


# Ejemplos

## Ejemplo 1
```r
# Distribuciones binomial, normal y t de Student

library(ggplot2)
library(reshape2)

# DistribuciÃ³n binomial

# En `R` para calcular valores de las funciones de probabilidad, distribuciÃ³n 
# o cuantiles de la distribuciÃ³n binomial (discreta), usamos las funciones dbinom,
# pbinom y  qbinom respectivamente. Para generar muestras aleatorias de esta
# distribuciÃ³n utilizamos la funciÃ³n rbinom.

# Consideremos un experimento binomial con n = 30 pruebas 
# idÃ©nticas e independientes, en donde la probabilidad de Ã©xito en cada prueba
# es p = 0.2 (parÃ¡metros n = 30 y p = 0.2)

#### FunciÃ³n de probabilidad

# Para obtener P(X = 20), es decir, la probabilidad de observar
# 20 Ã©xitos exactamente, en `R` ejecutamos

dbinom(x = 20, size = 30, prob = 0.2)

#### FunciÃ³n de distribuciÃ³n

# Para obtener P(X <= 20), es decir, la probabilidad de observar
# a lo mÃ¡s 20 Ã©xitos, en `R` corremos

pbinom(q = 20, size = 30, prob = 0.2)

# Para encontrar el valor mÃ¡s pequeÃ±o b tal que P(X <= b) >= 0.35,
# es decir, el cuantil de orden 0.35, usamos

#### Cuantiles

qbinom(p = 0.35, size = 30, prob = 0.2) # b = 5

pbinom(q = 4, size = 30, prob = 0.2) # P(X <= 4) = 0.2552 < 0.35
pbinom(q = 5, size = 30, prob = 0.2) # P(X <= 5) = 0.4275 >= 0.35
pbinom(q = 6, size = 30, prob = 0.2) # P(X <= 6) = 0.6070 >= 0.35

#### Muestras aleatorias

# Para obtener una muestra aleatoria de tamaÃ±o n = 1000, de la
# distribuciÃ³n binomial con parÃ¡metros como especificamos,
# hacemos

set.seed(4857) # Establecemos una semilla, para poder reproducir la muestra en el futuro
muestra <- rbinom(n = 1000, size = 30, prob = 0.2)
length(muestra); muestra[1:3]

# Podemos observar las frecuencias absolutas de los distintos valores
# obtenidos

as.data.frame(table(muestra))

# También podemos observar las frecuencias relativas

(df1 <- as.data.frame(table(muestra)/length(muestra)))

valg <- as.character(df1$muestra) # distintos valores generados por rbinom
(valg <- as.numeric(valg)) # Convertimos a nÃºmeros

# Las frecuencias relativas son muy parecidas a las siguientes probabilidades

(v1 <- round(sapply(valg, dbinom, size = 30, p = 0.2), 3))

# Combinamos df1 y v1 en un Ãºnico data frame

(df2 <- cbind(df1, v1))
(names(df2) <- c("Exitos", "FR", "Prob"))

(df2 <- melt(df2)) # funciÃ³n del paquete reshape2

# Las frecuencias relativas son muy parecidas a las probabilidades.

ggplot(df2, aes(x = Exitos, y = value, fill = variable)) + 
  geom_bar (stat="identity", position = "dodge") # Funciones del paquete ggplot2

# DistribuciÃ³n normal

# En `R` para calcular valores de las funciones de densidad, distribuciÃ³n 
# o cuantiles de la distribuciÃ³n normal (continua), usamos las funciones dnorm,
# pnorm y  qnorm respectivamente. Para generar muestras aleatorias de esta
# distribuciÃ³n utilizamos la funciÃ³n rnorm.

# Consideremos una variable aleatoria (v.a.) X que se distribuye como normal
# con media 175 y desviaciÃ³n estÃ¡ndar 6 (parÃ¡metros mu = 175 y sigma = 6)

#### FunciÃ³n de densidad

x <- seq(-4, 4, 0.01)*6 + 175 # Algunos posibles valores que puede tomar la v.a. X (mÃ­nimo: mu-4sigma, mÃ¡ximo: mu+4sigma)
y <- dnorm(x, mean = 175, sd = 6) # Valores correspondientes de la funciÃ³n de densidad de probabilidad

plot(x, y, type = "l", xlab = "", ylab = "")
title(main = "Densidad de Probabilidad Normal", sub = expression(paste(mu == 175, " y ", sigma == 6)))
abline(v = 175, lwd = 2, lty = 2) # La media es 175 

#### FunciÃ³n de distribuciÃ³n

# Para obtener P(X <= 180), es decir, la probabilidad de que X tome un valor
# menor o igual a 180, ejecutamos

pnorm(q = 180, mean = 175, sd = 6)

par(mfrow = c(2, 2))
# Observemos la regiÃ³n que corresponde a esta probabilidad en la siguiente grÃ¡fica en color rojo

plot(x, y, type = "l", xlab = "", ylab = "")
title(main = "Densidad de Probabilidad Normal", sub = expression(paste(mu == 175, " y ", sigma == 6)))

polygon(c(min(x), x[x<=180], 180), c(0, y[x<=180], 0), col="red")

# Para obtener P(X <= 165), es decir, la probabilidad de que X tome un valor
# menor o igual a 165, ejecutamos

pnorm(q = 165, mean = 175, sd = 6)

# Observemos la regiÃ³n que corresponde a esta probabilidad en la siguiente grÃ¡fica en color amarillo

plot(x, y, type = "l", xlab = "", ylab = "")
title(main = "Densidad de Probabilidad Normal", sub = expression(paste(mu == 175, " y ", sigma == 6)))

polygon(c(min(x), x[x<=165], 165), c(0, y[x<=165], 0), col="yellow")

# Para obtener P(165 <= X <= 180), es decir, la probabilidad de que X tome un valor
# mayor o igual a 165 y menor o igual a 180, debemos correr

pnorm(q = 180, mean = 175, sd = 6) - pnorm(q = 165, mean = 175, sd = 6)

# Observemos la regiÃ³n que corresponde a esta probabilidad en la siguiente grÃ¡fica en color verde

plot(x, y, type = "l", xlab="", ylab="")
title(main = "Densidad de Probabilidad Normal", sub = expression(paste(mu == 175, " y ", sigma == 6)))

polygon(c(165, x[x>=165 & x<=180], 180), c(0, y[x>=165 & x<=180], 0), col="green")

# Para obtener P(X >= 182), es decir, la probabilidad de que X tome un valor
# mayor o igual a 182, una alternativa es 

pnorm(q = 182, mean = 175, sd = 6, lower.tail = FALSE)

# Observemos la regiÃ³n que corresponde a esta probabilidad en la siguiente grÃ¡fica en color azul

plot(x, y, type = "l", xlab="", ylab="")
title(main = "Densidad de Probabilidad Normal", sub = expression(paste(mu == 175, " y ", sigma == 6)))

polygon(c(182, x[x>=182], max(x)), c(0, y[x>=182], 0), col="blue")

dev.off() # Para mostrar solo una grÃ¡fica

#### Cuantiles

# Para encontrar el nÃºmero b, tal que P(X <= b) = 0.75, es decir,
# el cuantil de orden 0.75, ejecutamos

(b <- qnorm(p = 0.75, mean = 175, sd = 6)) 

# Comprobamos

pnorm(b, 175, 6)

# El cuantil se encuentra en el eje de mediciÃ³n (eje horizontal)

plot(x, y, type = "l", xlab="", ylab="")
title(main = "Densidad de Probabilidad Normal", sub = expression(paste(mu == 175, " y ", sigma == 6)))

axis(side = 1, at = b, font = 2, padj = 1, lwd = 2)

#### Muestras aleatorias

# Para generar una muestra aleatoria de tamaÃ±o n = 1000 de la v.a. X
# corremos la siguiente instrucciÃ³n

set.seed(7563) # Para poder reproducir la muestra en el futuro
muestra <- rnorm(n = 1000, mean = 175, sd = 6)
length(muestra); mdf <- as.data.frame(muestra)
tail(mdf)

# Observamos que el histograma de la muestra generada tiene forma de campana
# Similar a la densidad de una normal

ggplot(mdf, aes(muestra)) + 
  geom_histogram(colour = 'red', 
                 fill = 'blue',
                 alpha = 0.3, # Intensidad del color fill
                 binwidth = 3) + 
  geom_density(aes(y = 3*..count..))+
  geom_vline(xintercept = mean(mdf$muestra), linetype="dashed", color = "black") + 
  ggtitle('Histograma para la muestra normal') + 
  labs(x = 'Valores obtenidos', y = 'Frecuencia')+
  theme_dark() +
  theme(plot.title = element_text(hjust = 0.5, size = 16))  

#### Regla empÃ­rica

mean <- 175; sd <- 6
x <- seq(mean-4*sd, mean+4*sd, 0.01)
y <- dnorm(x, mean, sd)
plot(x, y, type = "l", xlab="valores", ylab = "", xaxt = "n", yaxt = "n")
title(main = "Densidad de Probabilidad Normal", sub = expression(paste("Regla EmpÃ­rica con ", mu == 175, " y ", sigma == 6)))
abline(v=mean, lty = 2, lwd = 2)
for(k in c(-3, -2, -1, 1, 2, 3)) abline(v = mean+k*sd, lty = 2, col = abs(k))
ps <- c(mean - 3*sd, mean - 2*sd, mean - sd, mean, mean + sd, mean + 2*sd, mean + 3*sd)
axis(side = 1, at = ps)
x0 <- NULL
for(i in 1:length(ps)-1) x0 <- c(x0, (ps[i]+ps[i+1])/2)
y0 <- dnorm(x0, mean, sd)*1/3
text(x = x0, y = y0, labels = c("2.35%", "13.5%", "34%", "34%", "13.5%", "2.35%"))
x1 <- (x[1]+ps[1])/2; y1 <- dnorm(mean, mean, sd)*1/2
xf <- (x[length(x)]+ps[length(ps)])/2; yf <- dnorm(mean, mean, sd)*1/2
text(x = c(x1, xf), y = c(y1, yf), labels = c("0.15%", "0.15%"))
segments(x0 = x1, y0 = 0, x1 = x1, y1 = y1,               # Draw one line as in Example 1
         col = "cornflowerblue",                               # Color of line
         lwd = 5,                                              # Thickness of line
         lty = "dotted")     
segments(x0 = xf, y0 = 0, x1 = xf, y1 = yf,               
         col = "cornflowerblue",                               
         lwd = 5,                                              
         lty = "dotted")     

# DistribuciÃ³n t de Student

# En `R` para calcular valores de las funciones de densidad, distribuciÃ³n 
# o cuantiles de la distribuciÃ³n t de Student (continua), usamos las funciones dt,
# pt y  qt respectivamente. Para generar muestras aleatorias de esta
# distribuciÃ³n utilizamos la funciÃ³n rt.

# Consideremos una variable aleatoria (v.a.) T que se distribuye como t
# de Student con 7 grados de libertad (gl) (parÃ¡metro gl = 7)

#### FunciÃ³n de densidad

x <- seq(-4, 4, 0.01) # Algunos valores que puede tomar la v.a. T con 7 gl
y <- dt(x, df = 7) # Valores correspondientes de la densidad t de Student con 7 gl
plot(x, y, type = "l", main = "Densidad t de Student, gl = 7", xlab="", ylab="")
abline(v = 0, lwd=2, lty=2)

#### FunciÃ³n de distribuciÃ³n

# Para encontrar P(T <= 1.5), ejecutamos la siguiente instrucciÃ³n

pt(q = 1.5, df = 7)

# Observemos la regiÃ³n que corresponde a esta probabilidad en la siguiente grÃ¡fica

plot(x, y, type = "l", main = "Densidad t de Student, gl = 7", xlab="", ylab="")
polygon(c(min(x), x[x<=1.5], 1.5), c(0, y[x<=1.5], 0), col="purple")

# Para encontrar P(T >= 2), ejecutamos

pt(q = 2, df = 7, lower.tail = FALSE)

# Observemos la regiÃ³n que corresponde a esta probabilidad en la siguiente grÃ¡fica

plot(x, y, type = "l", main = "Densidad t de Student, gl = 7", xlab="", ylab="")

polygon(c(2, x[x>=2], max(x)), c(0, y[x>=2], 0), col="orange")

#### Cuantiles

# Para encontrar el nÃºmero d tal que P(T <= d) = 0.025, es decir, 
# el cuantil de orden 0.025, corremos la siguiente instrucciÃ³n

(d <- qt(p = 0.025, df = 7))

# comprobamos

pt(q = d, df = 7)

# Mostramos el cuantil contrado en el eje de mediciÃ³n (eje horizonta)

plot(x, y, type = "l", main = "Densidad t de Student, gl = 7", xlab="", ylab="")
axis(side = 1, at = d, font = 2, padj = 1, lwd = 2)

#### Muestras aleatorias

# Para generar una muestra aleatoria de tamaÃ±o n = 1000 de la v.a. T
# corremos la siguiente instrucciÃ³n

set.seed(777) # Para poder reproducir la muestra en el futuro
muestra <- rt(n = 1000, df = 7)
length(muestra); mdf <- as.data.frame(muestra)
tail(mdf)

# Observamos que el histograma de la muestra generada tiene forma de campana
# similar a la densidad t de Student

ggplot(mdf, aes(muestra)) + 
  geom_histogram(colour = 'green', 
                 fill = 'orange',
                 alpha = 0.7, # Intensidad del color fill
                 binwidth = 0.5) + 
  geom_density(aes(y = 0.5*..count..))+
  geom_vline(xintercept = mean(mdf$muestra), linetype="dashed", color = "black") + 
  ggtitle('Histograma para la muestra t de Student') + 
  labs(x = 'Valores obtenidos', y = 'Frecuencia')+
  theme_light() +
  theme(plot.title = element_text(hjust = 0.5, size = 16)) 
```

## Ejemplo 2
```r
# Ejemplo 2. Teorema central del lÃ­mite

# Cargamos el paquete ggplot2 para hacer algunas grÃ¡ficas

library(ggplot2)
# Consideremos una variable aleatoria (v.a.) X con distribuciÃ³n exponencial y parÃ¡metro lambda = 2

x <- seq(0, 5, 0.02)
plot(x, dexp(x, rate = 2), type = "l", lwd = 2, ylab = "")
title(main = "FunciÃ³n de Densidad Exponencial", ylab = "f(x)",
      sub = expression("ParÃ¡metro " ~ lambda == 2))
text(x = 3, y = 1.5, labels = expression(f(x)==2*exp(-2*x) ~ " para x "  >= 0))
text(x = 3, y = 1.3, labels = paste("0 en otro caso"))
text(x = 1, y = 1, labels = expression("E(X) = " ~ 1/lambda == 1/2), col = 2)
text(x = 3, y = 0.5, labels = expression("DE(X) = " ~ 1/lambda == 1/2), col = 4)
# Ahora obtenemos una muestra aleatoria de tamaÃ±o n = 4 de la distribuciÃ³n exponencial considerada

set.seed(10) # Para reproducir posteriormente la muestra
(m1.4 <- rexp(n = 4, rate = 2))
# Obtenemos la media de la muestra generada

mean(m1.4)

# Ahora obtenemos 5 muestras de tamaÃ±o 3

set.seed(64) # Para reproducir las muestras en el futuro
(m5.3 <- sapply(X = rep(3, 5), FUN = rexp, 2))
# Obtenemos las medias de las 5 muestras

(media5.3 <- apply(m5.3, 2, mean))
# Ahora obtenemos 1000 muestras de tamaÃ±o 7 y las 1000 medias correspondientes a las muestras

set.seed(465) # Para reproducir las muestras en el futuro
m1000.7 <- sapply(X = rep(7, 1000), FUN = rexp, 2)
media1000.7 <- apply(m1000.7, 2, mean)
mdf <- as.data.frame(media1000.7)
tail(mdf)
# Observamos que el histograma de las medias tiene forma de campana

ggplot(mdf, aes(media1000.7)) + 
  geom_histogram(colour = 'green', 
                 fill = 'orange',
                 alpha = 0.7) + # Intensidad del color fill
  geom_vline(xintercept = mean(media1000.7), linetype="dashed", color = "black") + 
  ggtitle('Histograma para las 1000 medias') + 
  labs(x = 'medias', y = 'Frecuencia')+
  theme_bw() +
  theme(plot.title = element_text(hjust = 0.5, size = 16)) 
mean(media1000.7); 1/2 # Media de las 1000 medias y media de la poblaciÃ³n de la cual vienen las 1000 muestras
sd(media1000.7); (1/2)/sqrt(7) # DE de las 1000 medias y DE de la poblaciÃ³n de la cual vienen las 1000 muestras dividida por la raÃ­z del tamaÃ±o de la muestra

# Ahora obtenemos 1000 muestras de tamaÃ±o 33 y las 1000 medias correspondientes a las muestras

set.seed(4465) # Para reproducir las muestras en el futuro
m1000.33 <- sapply(X = rep(33, 1000), FUN = rexp, 2)
media1000.33 <- apply(m1000.33, 2, mean)
mdf <- as.data.frame(media1000.33)
tail(mdf)
# Observamos que el histograma de las medias es mÃ¡s parecida todavÃ­a a una campana

ggplot(mdf, aes(media1000.33)) + 
  geom_histogram(colour = 'yellow', 
                 fill = 'purple',
                 alpha = 0.7) + # Intensidad del color fill
  geom_vline(xintercept = mean(media1000.33), linetype="dashed", color = "black") + 
  ggtitle('Histograma para las 1000 medias') + 
  labs(x = 'medias', y = 'Frecuencia')+
  theme_get() +
  theme(plot.title = element_text(hjust = 0.5, size = 16)) 
mean(media1000.33); 1/2 # Media de las 1000 medias y media de la poblaciÃ³n de la cual vienen las 1000 muestras
sd(media1000.33); (1/2)/sqrt(33) # DE de las 1000 medias y DE de la poblaciÃ³n de la cual vienen las 1000 muestras dividida por la raÃ­z del tamaÃ±o de la muestra

# Ahora obtenemos 1000 muestras de tamaÃ±o 400 y las 1000 medias correspondientes a las muestras

set.seed(543465) # Para reproducir las muestras en el futuro
m1000.400 <- sapply(X = rep(400, 1000), FUN = rexp, 2)
media1000.400 <- apply(m1000.400, 2, mean)
mdf <- as.data.frame(media1000.400)
tail(mdf)
# Observamos que el histograma de las medias es mÃ¡s parecida todavÃ­a a una campana

ggplot(mdf, aes(media1000.400)) + 
  geom_histogram(colour = 'orange', 
                 fill = 'gray',
                 alpha = 0.7) + # Intensidad del color fill
  geom_vline(xintercept = mean(media1000.400), linetype="dashed", color = "black") + 
  ggtitle('Histograma para las 1000 medias') + 
  labs(x = 'medias', y = 'Frecuencia')+
  theme_gray() +
  theme(plot.title = element_text(hjust = 0.5, size = 16)) 
mean(media1000.400); 1/2 # Media de las 1000 medias y media de la poblaciÃ³n de la cual vienen las 1000 muestras
sd(media1000.400); (1/2)/sqrt(400) # DE de las 1000 medias y DE de la poblaciÃ³n de la cual vienen las 1000 muestras dividida por la raÃ­z del tamaÃ±o de la muestra



```

## Ejemplo 3
```r
# Ejemplo 3. Algunos estimadores puntuales insesgados comunes

# Nota: este ejemplo es opcional por su similaridad con el ejemplo sobre el teorema central del lÃ­mite

# Cargamos el paquete ggplot2 para hacer algunas grÃ¡ficas

library(ggplot2)
# Consideremos una variable aleatoria (v.a.) X con distribuciÃ³n exponencial y parÃ¡metro lambda = 3

x <- seq(0, 5, 0.02)
plot(x, dexp(x, rate = 3), type = "l", lwd = 2, ylab = "")
title(main = "FunciÃ³n de Densidad Exponencial", ylab = "f(x)",
      sub = expression("ParÃ¡metro " ~ lambda == 3))
text(x = 3, y = 1.5, labels = expression(f(x)==3*exp(-3*x) ~ " para x "  >= 0))
text(x = 3, y = 1.3, labels = paste("0 en otro caso"))
text(x = 1, y = 1, labels = expression("E(X) = " ~ 1/lambda == 1/3), col = 2)
text(x = 3, y = 0.5, labels = expression("DE(X) = " ~ 1/lambda == 1/3), col = 4)
# Obtenemos 1200 muestras aleatorias de tamaÃ±o 350 y las 1200 medias correspondientes a las muestras

set.seed(65) # Para reproducir las muestras en el futuro
m1200.350 <- sapply(X = rep(350, 1200), FUN = rexp, rate = 3)
media1200.350 <- apply(m1200.350, 2, mean)
mdf <- as.data.frame(media1200.350)
tail(mdf)
# Observamos que el histograma de las medias tiene forma de campana

ggplot(mdf, aes(media1200.350)) + 
  geom_histogram(colour = 'yellow', 
                 fill = 'purple',
                 alpha = 0.7) + # Intensidad del color fill
  geom_vline(xintercept = mean(media1200.350), linetype="dashed", color = "black") + 
  ggtitle('Histograma para las 1200 medias') + 
  labs(x = 'medias', y = 'Frecuencia')+
  theme_get() +
  theme(plot.title = element_text(hjust = 0.5, size = 16)) 
mean(media1200.350); 1/3 # Media de las 1200 medias y media de la poblaciÃ³n de la cual provienen las 1200 muestras
sd(media1200.350); (1/3)/sqrt(350) # DE de las 1200 medias y DE de la poblaciÃ³n de la cual provienen las 1200 muestras dividida por la raÃ­z del tamaÃ±o de las muestras

# Ensayo Bernoulli. Con las siguientes instrucciones obtenemos un solo valor, en donde el 0 (fracaso) puede ocurrir con probabilidad 0.45 y el 1 (Ã©xito) con probabilidad p = 0.55

set.seed(345)
sample(x = c(0, 1), size = 1, prob = c(0.45, 0.55))
rbinom(n = 1, size = 1, prob = 0.55)
# Obtenemos 1000 muestras de tamaÃ±o 31 de una v.a. Bernoulli con p = 0.55

set.seed(5434) # Para reproducir las muestras en el futuro
m1000.31 <- sapply(X = rep(31, 1000), FUN = function(n) sample(x = c(0, 1), size = n, replace = TRUE, prob = c(0.45, 0.55)))
media1000.31 <- apply(m1000.31, 2, mean)
mdf <- as.data.frame(media1000.31)
tail(mdf)
# Observamos que el histograma de las medias es parecida a una campana

ggplot(mdf, aes(media1000.31)) + 
  geom_histogram(colour = 'orange', 
                 fill = 'blue',
                 alpha = 0.7) + # Intensidad del color fill
  geom_vline(xintercept = mean(media1000.31), linetype="dashed", color = "black") + 
  ggtitle('Histograma para las 1000 medias') + 
  labs(x = 'medias', y = 'Frecuencia')+
  theme_grey() +
  theme(plot.title = element_text(hjust = 0.5, size = 16)) 
mean(media1000.31); 0.55 # Media de las 1000 medias y media de la poblaciÃ³n de la cual provienen las 1000 muestras
sd(media1000.31); sqrt(0.55*0.45)/sqrt(31) # DE de las 1000 medias y DE de la poblaciÃ³n de la cual provienen las 1000 muestras dividida por la raÃ­z del tamaÃ±o de la muestra


# Obtenemos 1150 muestras aleatorias de tamaÃ±o n1 = 54 de una distribuciÃ³n exponencial con parÃ¡metro lambda1 = 3.2 y otras 1150 muestras aleatorias de tamaÃ±o n2 = 41 de una distribuciÃ³n exponencial con parÃ¡metro lambda2 = 1.5.

set.seed(65) # Para reproducir las muestras en el futuro
m1150.54 <- sapply(X = rep(54, 1150), FUN = rexp, rate = 3.2)
media1150.54 <- apply(m1150.54, 2, mean)
m1150.41 <- sapply(X = rep(41, 1150), FUN = rexp, rate = 1.5)
media1150.41 <- apply(m1150.41, 2, mean)
dif.medias <- media1150.54 - media1150.41 # Diferencia de medias
dmdf <- as.data.frame(dif.medias)
tail(dmdf)
# Observamos que el histograma de las diferencias de medias es parecida a una campana

ggplot(dmdf, aes(dif.medias)) + 
  geom_histogram(colour = 'orange', 
                 fill = 'red',
                 alpha = 0.7) + # Intensidad del color fill
  geom_vline(xintercept = mean(dif.medias), linetype="dashed", color = "black") + 
  ggtitle('Histograma para las 1000 diferencias de medias') + 
  labs(x = 'medias', y = 'Frecuencia')+
  theme_grey() +
  theme(plot.title = element_text(hjust = 0.5, size = 16)) 
mean(dif.medias); 1/3.2-1/1.5 # Media de las 1150 diferencias de medias y diferencia de medias de las poblaciones de las cuales provienen las 11500 muestras

sd(dif.medias); sqrt((1/3.2^2)/54 + (1/1.5^2)/41) # DE de las 1150 diferencias de medias y DE dada en literatura

# Obtenemos 1100 muestras de tamaÃ±o n1 = 48 de una v.a. Bernoulli con p1 = 0.65 y otras 1100 muestras de tamaÃ±o n2 = 35 de una v.a. Bernoulli con p2 = 0.53

set.seed(7434) # Para reproducir las muestras en el futuro
m1100.48 <- sapply(X = rep(48, 1100), FUN = function(n) sample(x = c(0, 1), size = n, replace = TRUE, prob = c(0.35, 0.65)))
m1100.35 <- sapply(X = rep(35, 1100), FUN = function(n) sample(x = c(0, 1), size = n, replace = TRUE, prob = c(0.47, 0.53)))
media1100.48 <- apply(m1100.48, 2, mean)
media1100.35 <- apply(m1100.35, 2, mean)
dif.medias <- media1100.48 - media1100.35
dmdf <- as.data.frame(dif.medias)
tail(dmdf)
# Observamos que el histograma de las diferencias de medias es parecida a una campana

ggplot(dmdf, aes(dif.medias)) + 
  geom_histogram(colour = 'pink', 
                 fill = 'blue',
                 alpha = 0.7) + # Intensidad del color fill
  geom_vline(xintercept = mean(dif.medias), linetype="dashed", color = "black") + 
  ggtitle('Histograma para las 1100 diferencias de medias') + 
  labs(x = 'medias', y = 'Frecuencia')+
  theme_grey() +
  theme(plot.title = element_text(hjust = 0.5, size = 16)) 
mean(dif.medias); 0.65 - 0.53 # Media de las 1100 diferencias de medias y diferencia de medias de las poblaciones de las cuales provienen las muestras
sd(dif.medias); sqrt((0.65*0.35)/48 + (0.53*0.47)/35) # DE de las 1100 diferencias de medias y DE dada en literatura


```

## Ejemplo 4
```r
# EJEMPLO 4. Contraste de hipÃ³tesis

# Nota: con cubrir un tipo de contraste es suficiente, ya que las ideas son similares en los diferentes tipos de contrastes de hipÃ³tesis

# Contrastes comunes con muestras grandes
# Contraste de cola superior
# Dada una muestra aleatoria de tamaÃ±o n = 40

set.seed(104)
muestra <- rexp(n = 40, rate = 6) # media = 1/6 aprox 0.1667 (media de la poblaciÃ³n)
tail(as.data.frame(muestra))
# estamos interesados en contrastar las hipÃ³tesis H0: mu = 0.1 vs H1: mu > 0.1 (contraste de cola superior)

# El valor observado del estadÃ­stico de prueba en este caso estÃ¡ dado por

# Z = (promedio-Mu)/(sigma/sqrt(n))
z0 <- (mean(muestra)-0.1)/(sd(muestra)/sqrt(40)) 
#mean(muestra)=0.21
z0
# z0 = 3.41

# que proviene de una distribuciÃ³n normal estÃ¡ndar aproximadamente.

# Supongamos que estamos interesados en encontrar la regiÃ³n de rechazo (de cola superior) con un nivel de significancia alpha = 0.05, debemos encontrar el valor z_{0.05} que satisface P(Z > z_{0.05}) = 0.05.

(z.05 <- qnorm(p = 0.05, lower.tail = FALSE))
# Es 1.645

z0 > z.05
# rechazamos la hipÃ³tesis nula

# p-value El p-value lo podemos calcular como

(pvalue <- pnorm(z0, lower.tail = FALSE))
x <- seq(-4, 4, 0.01)
y <- dnorm(x)
plot(x, y, type = "l", xlab="", ylab="")
title(main = "Densidad normal estándar", sub = expression(paste(mu == 0, " y ", sigma == 1)))

polygon(c(z0, x[x>=z0], max(x)), c(0, y[x>=z0], 0), col="red")
axis(side = 1, at = z0, font = 2, padj = 1, lwd = 2)
# Contraste de cola inferior
# Dada una muestra aleatoria de tamaÃ±o n = 45

set.seed(174)
muestra <- sample(x = c(1, 0), size = 45, replace = TRUE, prob = c(0.67, 0.33)); 0.67 # media real de la poblaciÃ³n
tail(as.data.frame(muestra))
# estamos interesados en contrastar las hipÃ³tesis H0: p = 0.9 vs H1: p < 0.9 (contraste de cola inferior)

# El valor observado del estadÃ­stico de prueba en este caso estÃ¡ dado por

z0 <- (mean(muestra)-0.9)/sqrt((0.9*(1-0.9))/45)
#mean(muestra)=0.57
z0 # Es -7.2

# que proviene de una distribuciÃ³n normal estÃ¡ndar aproximadamente.

# Supongamos que estamos interesados en encontrar la regiÃ³n de rechazo (de cola inferior) con un nivel de significancia alpha = 0.05, debemos encontrar el valor z_{0.05} que satisface P(Z < z_{0.05}) = 0.05.

(z.05 <- qnorm(p = 0.05))
# Es -1.645

z0 < z.05
# rechazamos la hipÃ³tesis nula.

# p-value El p-value lo podemos calcular como

(pvalue <- pnorm(z0)) # p-value muy pequeÃ±o
# Contraste de dos colas
# Dada dos muestras aleatorias de tamaÃ±os n1 = 56 y n2 = 63

set.seed(174376)
m1 <- rexp(n = 56, rate = 4.1); 1/4.1 # media real de la poblaciÃ³n
tail(as.data.frame(m1))
m2 <- rexp(n = 63, rate = 3.4); 1/3.4 # media real de la poblaciÃ³n
tail(as.data.frame(m2))
1/4.1-1/3.4 # diferencia de medias real
# estamos interesados en contrastar las hipÃ³tesis H0: mu1-mu2 = 0 vs H1: mu1-mu2 diferente de 0 (contraste de dos colas)

# El valor observado del estadÃ­stico de prueba en este caso estÃ¡ dado por

z0 <- (mean(m1)-mean(m2)-0)/sqrt(var(m1)/56 + var(m2)/63)
z0 # 0.693

# que proviene de una distribuciÃ³n normal estÃ¡ndar aproximadamente.

# Supongamos que estamos interesados en encontrar la regiÃ³n de rechazo (de dos colas) con un nivel de significancia alpha = 0.05, debemos encontrar el valor z_{0.025} que satisface P(Z > z_{0.025}) = 0.025.

(z.025 <- qnorm(p = 0.025, lower.tail = FALSE))
# Es 1.95

(z0 < -z.025) | (z0 > z.025)
# fallamos en rechazar la hipÃ³tesis nula.

# p-value El p-value lo podemos calcular como

(pvalue <- 2*pnorm(z0, lower.tail = FALSE))
x <- seq(-4, 4, 0.01)
y <- dnorm(x)
plot(x, y, type = "l", xlab="", ylab="")
title(main = "Densidad normal estÃ¡ndar", sub = expression(paste(mu == 0, " y ", sigma == 1)))

polygon(c(min(x), x[x<=-z0], -z0), c(0, y[x<=-z0], 0), col="purple")
axis(side = 1, at = -z0, font = 2, padj = 1, lwd = 2)

polygon(c(z0, x[x>=z0], max(x)), c(0, y[x>=z0], 0), col="purple")
axis(side = 1, at = z0, font = 2, padj = 1, lwd = 2)
# Contraste de hipÃ³tesis con muestras pequeÃ±as para mu y mu1 - mu2
# Contraste de cola superior
# Dada una muestra aleatoria de tamaÃ±o n = 15

set.seed(124)
muestra <- rnorm(n = 15, mean = 175, sd = 6) 
tail(as.data.frame(muestra))
# estamos interesados en contrastar las hipÃ³tesis H0: mu = 170 vs H1: mu > 170 (contraste de cola superior)

# El valor observado del estadÃ­stico de prueba en este caso estÃ¡ dado por

t0 <- (mean(muestra)-170)/(sd(muestra)/sqrt(15)) 
t0
# que proviene de una distribuciÃ³n t de Student con n-1 = 14 grados de libertad (gl).

# Supongamos que estamos interesados en encontrar la regiÃ³n de rechazo (de cola superior) con un nivel de significancia alpha = 0.05, debemos encontrar el valor t_{0.05} que satisface $P(T > t_{0.05}) = 0.05$, donde $T$ se distribuye como t de Student con n-1 = 14 gl.

(t.05 <- qt(p = 0.05, df = 14, lower.tail = FALSE))
# Como

t0 > t.05
# rechazamos la hipÃ³tesis nula

# p-value El p-value lo podemos calcular como

(pvalue <- pt(t0, df = 14, lower.tail = FALSE))
x <- seq(-5, 5, 0.01)
y <- dt(x, df = 14)
plot(x, y, type = "l", xlab="", ylab="")
title(main = "Densidad t de Student, 14 gl")

polygon(c(t0, x[x>=t0], max(x)), c(0, y[x>=t0], 0), col="red")
axis(side = 1, at = t0, font = 2, padj = 1, lwd = 2)
t.test(x = muestra,
       alternative = "greater",
       mu = 170)
# Contraste de dos colas
# Dada dos muestras aleatorias de tamaÃ±os n1 = 23 y n2 = 20

set.seed(1776)
m1 <- rnorm(n = 23, mean = 175, sd = 3)
tail(as.data.frame(m1))
m2 <- rnorm(n = 20, mean = 160, sd = 3)
tail(as.data.frame(m2))
175-160 # diferencia de medias real
# estamos interesados en contrastar las hipÃ³tesis H0: mu1-mu2 = 0 vs H1: mu1-mu2 diferente de 0 (contraste de dos colas)

# El valor observado del estadÃ­stico de prueba en este caso estÃ¡ dado por

t0 <- (mean(m1)-mean(m2)-0)/(sqrt((22*var(m1)+19*var(m2))/(23+20-2))*sqrt(1/23+1/20))
t0
# que proviene de una distribuciÃ³n t de Student con 23 + 20 - 2 = 41 gl

# Supongamos que estamos interesados en encontrar la regiÃ³n de rechazo (de dos colas) con un nivel de significancia alpha = 0.05, debemos encontrar el valor t_{0.025} que satisface P(T > t_{0.025}) = 0.025.

(t.025 <- qt(p = 0.025, df= 41, lower.tail = FALSE))
# Como

(t0 < -t.025) | (t0 > t.025)
# rechazamos la hipÃ³tesis nula.

# p-value El p-value lo podemos calcular como

(pvalue <- 2*pt(t0, df = 41, lower.tail = FALSE))
t.test(x = m1, y = m2,
       alternative = "two.sided",
       mu = 0, paired = FALSE, var.equal = TRUE)
```


# Retos

## Reto 1
```r

```

## Reto 2
```r

```

## Reto 3
```r

```
