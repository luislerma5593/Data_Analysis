# Reto 3.3

setwd("C:/Users/LLerma/Google Drive/Analisis de Datos/M2 - Programacion y Estadistica con R/S3/Files")

# 1 Importa los datos de producción de electricidad que se encuentra en el archivo cbe.csv a R

data <- read.csv("cbe.csv")


# 2 Crea la serie de tiempo mensual de producción de electricidad en R a partir del año 1958

(datats <- ts(data$elec, start=1958, frequency=12))

start(datats); end(datats); frequency(datats)

# Frequency
# 1 ??? Annual
# 4 ??? Quarterly
# 12 ??? Monthly
# 52 ??? Weekly

# 3 Realiza la descomposiciÃ³n multiplicativa de la serie de tiempo y grafica la serie original junto con sus componentes (tendencia, estacionalidad y componente aleatoria)

tsm <- decompose(datats, type = "multiplicative" )

plot(tsm)


# 4 Realiza la grÃ¡fica de tendencia y coloca la grÃ¡fica de tendencia x estacionalidad superpuesta a esta

plot(datats, main="Consumo de energía eléctrica")
lines(tsm$seasonal*tsm$trend , col="red", lty=2, lwd=1)
lines(tsm$trend, col="blue", lty=1, lwd=2)

# Otra forma

ts.plot(cbind(tsm$trend,tsm$seasonal*tsm$trend), xlab = "Tiempo", main = "Datos de ProducciÃ³n de Electricidad", 
        ylab = "ProducciÃ³n de electricidad", lty = 1:2,
        sub = "Tendencia con efectos estacionales multiplicativos sobrepuestos")


plot(tsm$seasonal*tsm$trend , col="red", lty=2, lwd=1)
lines(tsm$trend, col="blue", lty=1, lwd=2)

