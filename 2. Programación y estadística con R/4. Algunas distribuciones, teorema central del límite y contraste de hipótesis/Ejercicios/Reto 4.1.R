# Desarrollo
# Distribución binomial
# Consideremos un experimento binomial con n = 35 pruebas idénticas e independientes, en donde la probabilidad de éxito en cada prueba es p = 0.51. Encuentre lo siguiente:

# n = 35
# p = 0.51

library(ggplot2)

# 1 La probabilidad de observar exactamente 10 éxitos

(dbinom(10, size=35, prob=0.51))

# 2 La probabilidad de observar 10 o más exitos

(pbinom(10, size=35, prob=0.51, lower.tail = FALSE))

# 3 El cuantil de orden 0.5

(qbinom(0.5, size=35, prob=0.51, lower.tail = TRUE))
(pbinom(18, size=35, prob=0.51, lower.tail = TRUE))

# 4 Genere una muestra aleatoria de tamaño 1000 de esta distribución, construya una tabla de frecuencias relativas con los resultados y realice el gráfico de barras de los resultados que muestre las frecuencias relativas.

a <- rbinom(1000, size=35, prob=0.51)
(table_a <- table(a)/length(table(a)))

(df1 <- as.data.frame(table_a))

(names(df1) <- c("Exitos", "Prob"))

plot(df1)
#1
ggplot(df1, aes(x = Exitos , y = Prob))+ geom_bar(stat="identity")
#2
ggplot(df1, aes(x = Exitos , y = Prob))+ geom_col(col="black", fill="red") +
  theme(plot.title = element_text(hjust = 0.5))+ ggtitle("Prob")
#3
ggplot(df1, aes(x = Exitos , y = Prob)) + geom_bar (stat="identity", position = "dodge") 

# Extra

b <- as.numeric(names(table_a))

c <- dbinom(b, size = 35, prob = 0.51)


#  Distribución normal

# Considere una variable aleatoria normal con media 110 y desviación estándar 7. Realice lo siguiente:

# mean = 110
# sd = 7

# 1 Grafique la función de densidad de probabilidad

a <- seq(80, 140, 1)
b <- dnorm(a, mean=110, sd=7)

df <- data.frame(a,b)

plot(a,b)
plot(a,b, type = "l", main = "Prob", xlab="x", ylab="y")
#abline(v = 100)


(p <- ggplot(df, aes(a, b)) + geom_line())

(pnorm(110+21, mean=110, sd=7, lower.tail = TRUE)-pnorm(110-21, mean=110, sd=7, lower.tail = TRUE))

# 2 Encuentre la probabilidad de que la v.a. sea mayor o igual a 140

(pnorm(140, mean=110, sd=7, lower.tail = FALSE))

# 3 Encuentre el cuantil de orden 0.95

(qnorm(0.95, mean=110, sd=7))

# 4 Genere una muestra aleatoria de tamaño 1000 y realice el histograma de frecuencias relativas para esta muestra

c <- rnorm(1000, mean=110, sd=7)

(df_c <- as.data.frame(c))

hist(df_c$c)

ggplot(df_c, aes(c)) + geom_histogram(col="red")

(p <- ggplot(df_c, aes(c)) + 
  geom_histogram(colour = 'red', 
                 fill = 'blue',
                 alpha = 0.8, # Intensidad del color fill
                 binwidth = 3.5) + 
  geom_density(aes(y = 3.5*..count..))+
  geom_vline(xintercept = mean(c), 
             linetype="dashed", color = "black") + 
  ggtitle('Histograma para la muestra normal') + 
  labs(x = 'Valores obtenidos', y = 'Frecuencia')+
  theme_dark() +
  theme(plot.title = element_text(hjust = 0.5, size = 16)))
