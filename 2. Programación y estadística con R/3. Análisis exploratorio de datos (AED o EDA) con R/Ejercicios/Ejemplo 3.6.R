# Ejemplo 3.6

# Utilizaremos un data set del paquete datasets

library(datasets)
(AP <- AirPassengers) # NÃºmero de pasajeros (en miles) por mes de una aerolínea
class(AP)

# Inicio, fin y frecuencia de la serie

start(AP); end(AP); frequency(AP)

# Graficamos la serie de tiempo

plot(AP, main = "Pasajeros mensuales en una aerolínea", ylab = "Número de pasajeros (en miles)", xlab = "Mes", col="red")

# DescomposiciÃ³n multiplicativa

comp <- decompose(AP, type = "multiplicative")

#comp_mult <- decompose(AP, type = "multiplicative")
#comp_add <- decompose(AP, type = "additive")

# Graficamos la serie original, tendencia, estacionalidad, y componente aleatoria

plot(comp)
#plot(comp_mult)
#plot(comp_add)

# Graficamos Ãºnicamente la serie de tendencia

plot(comp$trend, col = "purple", lwd = 5, main = "Componente de tendencia", ylab = "Tendencia", xlab = "Mes")  # GrÃ¡fica de la tendencia 

# Graficamos la componente estacional

plot(comp$seasonal, col = "red", lwd = 2, main = "Componente de estacionalidad", ylab = "Estacionalidad", xlab = "Mes") # GrÃ¡fica de la estacionalidad

# Finalmente graficamos la serie original, junto con la tendencia y tendencia*estacionalidad

plot(AP, main = "Pasajeros mensuales en una aerolínea", ylab = "Número de pasajeros (en miles)", xlab = "Mes", ylim = c(100, 800))
lines(comp$trend , col = "purple", lwd = 2)
lines(comp$seasonal * comp$trend, col = "red", lty = 2, lwd = 2 )
legend(1949, 800, 
       c('Serie de tiempo original', 'Tendencia', 'Tendencia x Estacionalidad'),
       col = c('black', 'purple', 'red'), text.col = "green4", lty = c(1, 2, 1), lwd = c(1, 2, 2),
       merge = FALSE, bg = 'gray90')
