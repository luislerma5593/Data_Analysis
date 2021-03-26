# Work

* [Ejemplos](#Ejemplos)
  * [Ejemplo 1 (Regresión lineal simple)](#Ejemplo-1)
  * [Ejemplo 2 (Regresión lineal múltiple)](#Ejemplo-2)
  * [Ejemplo 3 (Máquinas de vectores de soporte (Compañía de tarjetas de crédito))](#Ejemplo-3)
  * [Ejemplo 4 (Máquinas de vectores de soporte)](#Ejemplo-4)

* [Retos](#Retos)
  * [ ] [Reto 1 (Regresión lineal simple)](#Reto-1)
  * [ ] [Reto 2 (Máquinas de vectores de soporte)](#Reto-2)


# Ejemplos

## Ejemplo 1
```r
# Ejemplo 1. RegresiÃ³n Lineal Simple

# Primero hay que establecer el directorio de trabajo y este deberÃ¡ contener 
# el archivo de datos production.txt

# Leemos nuestros datos con la funciÃ³n read.table

setwd("C:/Users/LLerma/Google Drive/Analisis de Datos/M2 - Programacion y Estadistica con R/S5/Files")

production <- read.table("production.txt", header = T)

# Los datos que importamos a R se encuentran como data frame con nombre 
# production. Aplicamos la funciÃ³n attach al data frame production para
# poder manipular las columnas mediante sus nombres

(attach(production))

# Hacemos el grÃ¡fico de dispersiÃ³n

plot(RunSize, RunTime, xlab = "TamaÃ±o de ejecuciÃ³n", 
     ylab = "Tiempo de ejecuciÃ³n", pch = 16)

cor(RunSize, RunTime)

# Ajustamos un modelo de regresiÃ³n lineal simple con la funciÃ³n lm, en donde
# la variable de respuesta es RunTime y la variable predictora es RunSize. 
# Guardamos nuestro modelo ajustado con el nombre de m1

(m1 <- lm(RunTime~RunSize))

# Obtenemos un resumen de nuestro modelo ajustado mediante la funciÃ³n `summary`

summary(m1) # Se usa para ver que tan confiable es el modelo

# Graficamos nuestros datos nuevamente, pero ahora con la recta de regresiÃ³n
# ajustada

plot(RunSize, RunTime, xlab = "TamaÃ±o de ejecuciÃ³n", 
     ylab = "Tiempo de ejecuciÃ³n", pch = 16)
abline(lsfit(RunSize, RunTime)) # Trazamos la recta de regresiÃ³n estimada
mtext(expression(paste('Modelo de regresiÃ³n lineal simple:',' ',y[i] == beta[0] + beta[1]*x[i] + e[i])),
      side = 3, adj=1, font = 2)

# Recta de regresiÃ³n poblacional

text(x = 200, y = 240, expression(paste('Recta de regresiÃ³n:',
                                        ' ',
                                        y[i] == beta[0] + beta[1]*x[i])),
     adj = 1, font = 2)


# Recta de regresiÃ³n estimada

text(x = 350, y = 180, expression(paste('Recta estimada:',
                                        ' ',
                                        hat(y)[i] == hat(beta)[0] + hat(beta)[1]*x[i])),
     adj = 1, font = 2)

# Recta de regresiÃ³n estimada

text(x = 350, y = 160, expression(paste('Recta estimada:',
                                        ' ',
                                        hat(y)[i] == 149.74770 + 0.25924*x[i])),
     adj = 1, font = 2)

# Residuales

points(189, 215, pch=16, col = "green") # Punto muestral
149.74770 + 0.25924 * 189 # Valor y sobre la recta estimada
lines(c(189, 189), c(198.7441, 215), col = "blue")

points(173, 166, pch=16, col = "red") # Punto muestral
149.74770 + 0.25924 * 173 # Valor y sobre la recta estimada
lines(c(173, 173), c(166, 194.5962), col = "red")

# AcontinuaciÃ³n encontramos el cuantil de orden 0.975 de la distribuciÃ³n
# t de Student con 18 (n - 2) grados de libertad. En total tenemos n = 20 
# observaciones en nuestro conjunto de datos. Estamos encontrando el valor 
# que satisface P(T > tval) = 0.025

tval <- qt(1-0.05/2, 18)
tval

# Comprobamos

pt(tval, df = 18)

# Encontramos intervalos de confianza del 95% para el intercepto y la pendiente
# del modelo de regresiÃ³n lineal simple

round(confint(m1, level = 0.95), 3)

# Ahora encontramos intervalos de confianza del 95% para la recta de regresiÃ³n
# poblacional en algunos valores de X (RunSize)

RunSize0 <- c(50,100,150,200,250,300,350) # Algunos posibles valores de RunSize

(conf <- predict(m1, newdata = 
                   data.frame(RunSize = RunSize0), 
                 interval = "confidence", level = 0.95))

# Podemos visualizar grÃ¡ficamente estos intervalos de confianza

lines(RunSize0, conf[, 2], lty = 2, lwd = 2, col = "green") # lÃ­mites inferiores
lines(RunSize0, conf[, 3], lty = 2, lwd = 2, col = "green") # lÃ­mites superiores

# TambiÃ©n podemos encontrar intervalos de predicciÃ³n del 95% para el valor
# real de la variable de respuesta Y (RunTime) en algunos valores de X (RunSize)

(pred <- predict(m1, newdata = 
                   data.frame(RunSize = RunSize0), 
                 interval = "prediction", level = 0.95))

# Podemos visualizar grÃ¡ficamente estos intervalos de predicciÃ³n

lines(RunSize0, pred[, 2], lty = 2, lwd = 2, col = "blue") # lÃ­mites inferiores
lines(RunSize0, pred[, 3], lty = 2, lwd = 2, col = "blue") # lÃ­mites superiores


# Note como los intervalos de confianza estÃ¡n contenidos dentro de los
# intervalos de predicciÃ³n correspondientes

# TambiÃ©n es posible llevar a cabo un anÃ¡lisis de varianza para decidir si 
# existe asociaciÃ³n lineal entre RunSize y RunTime

anova(m1)
# Si es menor a 0.05, se acepta la hipótesis, de lo contrario, se considera nula.

# GrÃ¡fico de diagnÃ³stico de R

# Cuando usamos un modelo de regresiÃ³n, hacemos una serie de suposiciones. 
# Entonces debemos hacer diagnÃ³sticos de regresiÃ³n para verificar las
# supocisiones.

# En residuals VS fitted, se debe buscar que no se encuentre un patrón.
# En Normal Q-Q son los valores y sí se busca que tenga un patrón

par(mfrow = c(2, 2))
plot(m1)
dev.off()
```

## Ejemplo 2
```r

```

## Ejemplo 3
```r

```

## Ejemplo 4
```r

```


# Retos

## Reto 1
```r
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
title("Correlación entre X y Y")

m1 <- lm(data)

m1$residuals

abline(lsfit(x, y))

par(mfrow = c(2, 2))
plot(m1)

```

## Reto 2
```r

```


