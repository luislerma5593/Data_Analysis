# Reto 5.1

# Se cree que entre las variables x y y del archivo csv adjunto, podría haber una relación más o menos lineal. Para tener más evidencia sobre esto lleve a cabo lo siguiente:
#   
# 1  Realice el gráfico de dispersión de los datos
# 2. Ajuste un modelo de regresión lineal simple a los datos, muestre un resumen del modelo ajustado y trace la recta de regresión estimada junto con el gráfico de dispersión
# 3. Obtenga algunas gráficas de diagnóstico y diga si es razonable suponer para los errores aleatoriedad, normalidad y varianza constante.

setwd("C:/Users/LLerma/Google Drive/Analisis de Datos/M2 - Programacion y Estadistica con R/S5/Files")

data <- read.csv("datoslineal.csv")

attach(data)

plot(x,y)
title("Correlaci�n entre X y Y")

m1 <- lm(data)

m1$residuals

abline(lsfit(x, y))

par(mfrow = c(2, 2))
plot(m1)
