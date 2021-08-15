# Reto 1

#Considere el siguiente vector

set.seed(134) # Fijar una semilla, para generar los mismos números aleatorios.

x <- round(rnorm(1000, 175, 6), 1)

#Calcule, la media, mediana y moda de los valores en x

mean(x)
median(x)
#Mode(x)

install.packages("DescTools")

#Obtenga los deciles de los números en x

quantile(x, seq(0.1,0.9,0.1))

#Encuentre la rango intercuartílico, la desviación estándar y varianza muestral de las mediciones en x

IQR(x)
var(x)
sd(x)

plot(x)
min(x);max(x)
summary(x)
