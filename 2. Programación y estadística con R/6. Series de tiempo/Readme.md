# Work

### Material complementario: Causalidad de Granger

Es un test consistente en comprobar si los resultados de una variable sirven para predecir a otra variable, si tiene carácter unidireccional o bidireccional. Para ello se tiene que comparar y deducir si el comportamiento actual y el pasado de una serie temporal A predice la conducta de una serie temporal B.

→ http://www.scielo.org.mx/scielo.php?script=sci_arttext&pid=S1870-66222016000100073


* [Ejemplos](#Ejemplos)
  * [Ejemplo 1 (Ejemplos de series de tiempo y técnicas descriptivas)](#Ejemplo-1)
  * [Ejemplo 2 (Modelos estocásticos básicos, modelos estacionarios y predicción)](#Ejemplo-2)
  * [Ejemplo 3 (Modelos no estacionarios y predicción)](#Ejemplo-3)

* [Retos](#Retos)
  * [ ] [Reto 1 (Proceso AR(1))](#Reto-1)
  * [ ] [Reto 2 (Proceso ARIMA(1, 1, 1))](#Reto-2)
  * [ ] [Reto 3 (Gráfica de series de tiempo)](#Reto-3)

# Ejemplos

## Ejemplo 1
```r
#### TÃ©cnicas descriptivas: grÃ¡ficas, tendencias y variaciÃ³n estacional

library(TSA)

setwd("C:/Users/LLerma/Google Drive/Analisis de Datos/M2 - Programacion y Estadistica con R/S6/Files")

data(oilfilters)
plot(oilfilters, type = "o", ylab = "Ventas", xlab = "Tiempo", main = "Ventas Mesuales ")
plot(oilfilters, type = "l", ylab = "Ventas", xlab = "Tiempo",
     main = "Ventas Mensuales de Filtro de Aceite",
     sub = "Símbolos Especiales")

#Agregar las iniciales del mes en cada uno de los puntos
points(y = oilfilters, x = time(oilfilters),
       pch = as.vector(season(oilfilters)))

data(AirPassengers)
AP <- AirPassengers
AP

# Clase de un objeto

class(AP)

start(AP); end(AP); frequency(AP)

summary(AP)

plot(AP, ylab = "Pasajeros (1000's)", xlab = "Tiempo", 
     main = "Reserva de pasajeros aéreos internacionales", 
     sub = "Estados Unidos en el periodo 1949-1960")

################################################

layout(1:2)
plot(aggregate(AP, nfrequency = 1), xlab = "Tiempo",
     main = "Reserva de pasajeros aÃ©reos internacionales", 
     sub = "Estados Unidos en el periodo 1949-1960")

boxplot(AP ~ cycle(AP),
        xlab = "Boxplot de valores estacionales",
        sub = "Estados Unidos en el periodo 1949-1960",
        main = "Reserva de pasajeros aÃ©reos internacionales")
dev.off()

################################################

# https://github.com/AtefOuni/ts/tree/master/Data

# Series de Tiempo MÃºltiple

# Serie de producciÃ³n de electricidad, cerveza y chocolate

CBE <- read.csv("cbe.csv", header = TRUE)
CBE[1:4,]
class(CBE)

plot(CBE)

Elec.ts <- ts(CBE[, 3], start = 1958, freq = 12)
Beer.ts <- ts(CBE[, 2], start = 1958, freq = 12)
Choc.ts <- ts(CBE[, 1], start = 1958, freq = 12)

plot(cbind(Elec.ts, Beer.ts, Choc.ts), 
     main = "ProducciÃ³n de Chocolate, Cerveza y Electricidad", 
     xlab = "Tiempo",
     sub = "Enero de 1958 - Diciembre de 1990")

################################################

# Serie de temperaturas globales, expresadas como anomalÃ­as de las medias mensuales

Global <- scan("global.txt")
Global.ts <- ts(Global, st = c(1856, 1), end = c(2005, 12), fr = 12)
Global.annual <- aggregate(Global.ts, FUN = mean)
plot(Global.ts, xlab = "Tiempo", ylab = "Temperatura en ÃÂ°C", main = "Serie de Temperatura Global",
     sub = "Serie mensual: Enero de 1856 a Diciembre de 2005")
plot(Global.annual, xlab = "Tiempo", ylab = "Temperatura en ÃÂ°C", main = "Serie de Temperatura Global",
     sub = "Serie anual de temperaturas medias: 1856 a 2005")

################################################

New.series <- window(Global.ts, start = c(1970, 1), end = c(2005, 12)) 
New.time <- time(New.series)
plot(New.series, xlab = "Tiempo", ylab = "Temperatura en ÃÂ°C", main = "Serie de Temperatura Global",
     sub = "Serie mensual: Enero de 1970 a Diciembre de 2005"); abline(reg = lm(New.series ~ New.time))


#### DescomposiciÃ³n de series

# Modelo Aditivo

# Se debe elegir entre el modelo aditivo o el modelo multiplicativo cuando sea razonable suponer la descomposiciÃ³n
Elec.decom.A <- decompose(Elec.ts)

plot(Elec.decom.A, xlab = "Tiempo", 
     sub = "DescomposiciÃ³n de los datos de producciÃ³n de electricidad")

# Componentes

Tendencia <- Elec.decom.A$trend
Estacionalidad <- Elec.decom.A$seasonal
Aleatorio <- Elec.decom.A$random

ts.plot(cbind(Tendencia, Tendencia + Estacionalidad+Aleatorio), 
        xlab = "Tiempo", main = "Datos de ProducciÃ³n de Electricidad", 
        ylab = "ProducciÃ³n de electricidad", lty = 1:2,
        sub = "Tendencia con efectos estacionales aditivos sobrepuestos")

Tendencia[20] + Estacionalidad[20] + Aleatorio[20]
Elec.ts[20]

###

# Modelo Multiplicativo

Elec.decom.M <- decompose(Elec.ts, type = "mult")

plot(Elec.decom.M, xlab = "Tiempo", 
     sub = "DescomposiciÃ³n de los datos de producciÃ³n de electricidad")

# Componentes

Trend <- Elec.decom.M$trend
Seasonal <- Elec.decom.M$seasonal
Random <- Elec.decom.M$random

ts.plot(cbind(Trend, Trend*Seasonal), xlab = "Tiempo", main = "Datos de ProducciÃ³n de Electricidad", 
        ylab = "ProducciÃ³n de electricidad", lty = 1:2,
        sub = "Tendencia con efectos estacionales multiplicativos sobrepuestos")

Trend[20]*Seasonal[20]*Random[20]
Elec.ts[20]

Trend[100]*Seasonal[100]*Random[100]
Elec.ts[100]


# J. Cryer & K. Chan. (2008). Time Series Analysis With Applications 
# in R. 233 Spring Street, New York, NY 10013, USA: Springer 
# Science+Business Media, LLC.

# P. Cowpertwait & A. Metcalfe. (2009). Introductory Time Series with R. 
# 233 Spring Street, New York, NY 10013, USA: Springer Science+Business 
# Media, LLC.
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

```

## Reto 2
```r

```

## Reto 3
```r

```
