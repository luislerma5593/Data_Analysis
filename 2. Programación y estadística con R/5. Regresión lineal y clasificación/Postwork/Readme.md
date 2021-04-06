
# Postwork Sesión 5

### OBJETIVO

- Continuar con el desarrollo de los postworks; en esta ocasión se utiliza la función `predict` para realizar predicciones de los resultados de partidos para una fecha determinada

#### REQUISITOS

- Haber desarrollado los postworks anteriores
- Cubrir los temas del prework
- Replicar los ejemplos de la sesión

#### DESARROLLO

1. A partir del conjunto de datos de soccer de la liga española de las temporadas 2017/2018, 2018/2019 y 2019/2020, crea el data frame `SmallData`, que contenga las columnas `date`, `home.team`, `home.score`, `away.team` y `away.score`; esto lo puede hacer con ayuda de la función `select` del paquete `dplyr`. Luego establece un directorio de trabajo y con ayuda de la función `write.csv` guarda el data frame como un archivo csv con nombre *soccer.csv*. Puedes colocar como argumento `row.names = FALSE` en `write.csv`. 

2. Con la función `create.fbRanks.dataframes` del paquete `fbRanks` importe el archivo *soccer.csv* a `R` y al mismo tiempo asignelo a una variable llamada `listasoccer`. Se creará una lista con los elementos `scores` y `teams` que son data frames listos para la función `rank.teams`. Asigna estos data frames a variables llamadas `anotaciones` y `equipos`.

3. Con ayuda de la función `unique` crea un vector de fechas (`fecha`) que no se repitan y que correspondan a las fechas en las que se jugaron partidos. Crea una variable llamada `n` que contenga el número de fechas diferentes. Posteriormente, con la función `rank.teams` y usando como argumentos los data frames `anotaciones` y `equipos`, crea un ranking de equipos usando únicamente datos desde la fecha inicial y hasta la penúltima fecha en la que se jugaron partidos, estas fechas las deberá especificar en `max.date` y `min.date`. Guarda los resultados con el nombre `ranking`.

4. Finalmente estima las probabilidades de los eventos, el equipo de casa gana, el equipo visitante gana o el resultado es un empate para los partidos que se jugaron en la última fecha del vector de fechas `fecha`. Esto lo puedes hacer con ayuda de la función `predict` y usando como argumentos `ranking` y `fecha[n]` que deberá especificar en `date`.

__Notas para los datos de soccer:__ https://www.football-data.co.uk/notes.txt

```R
# Postwork 5

library(dplyr)

setwd("C:/Users/LLerma/Google Drive/Analisis de Datos/M2 - Programacion y Estadistica con R/S5/Files/PW")

#1 A partir del conjunto de datos de soccer de la liga española de las temporadas 2017/2018, 2018/2019 y 2019/2020, crea el data frame SmallData, que contenga las columnas date, home.team, home.score, away.team y away.score; esto lo puede hacer con ayuda de la función select del paquete dplyr. Luego establece un directorio de trabajo y con ayuda de la función write.csv guarda el data frame como un archivo csv con nombre soccer.csv. Puedes colocar como argumento row.names = FALSE en write.csv.

d1 <- read.csv("https://www.football-data.co.uk/mmz4281/1718/SP1.csv")
d2 <- read.csv("https://www.football-data.co.uk/mmz4281/1819/SP1.csv")
d3 <- read.csv("https://www.football-data.co.uk/mmz4281/1920/SP1.csv")

d1.2 <- select(d1, Date, HomeTeam, FTHG, AwayTeam, FTAG)
d2.2 <- select(d2, Date, HomeTeam, FTHG, AwayTeam, FTAG)
d3.2 <- select(d3, Date, HomeTeam, FTHG, AwayTeam, FTAG)

d1.3 <- mutate(d1.2, Date = as.Date(Date, format = "%d/%m/%y"))
d2.3 <- mutate(d2.2, Date = as.Date(Date, format = "%d/%m/%Y"))
d3.3 <- mutate(d3.2, Date = as.Date(Date, format = "%d/%m/%Y"))


data <- rbind(d1.3,d2.3,d3.3)

data <- rename(data, date=Date, home.team=HomeTeam, home.score=FTHG, away.team=AwayTeam, away.score=FTAG)

write.csv(data, file="soccer.csv", row.names = FALSE)


# 2 Con la función create.fbRanks.dataframes del paquete fbRanks importe el archivo soccer.csv a R y al mismo tiempo asignelo a una variable llamada listasoccer. Se creará una lista con los elementos scores y teams que son data frames listos para la función rank.teams. Asigna estos data frames a variables llamadas anotaciones y equipos.

library(fbRanks)

listasoccer <- create.fbRanks.dataframes("soccer.csv")

anotaciones <- listasoccer[[1]]
equipos <- listasoccer[[3]]


# 3 Con ayuda de la función unique crea un vector de fechas (fecha) que no se repitan y que correspondan a las fechas en las que se jugaron partidos. Crea una variable llamada n que contenga el número de fechas diferentes. Posteriormente, con la función rank.teams y usando como argumentos los data frames anotaciones y equipos, crea un ranking de equipos usando únicamente datos desde la fecha inicial y hasta la penúltima fecha en la que se jugaron partidos, estas fechas las deberá especificar en max.date y min.date. Guarda los resultados con el nombre ranking.

fecha <- unique(data$date)
n <- length(fecha)

primer_fecha <- fecha[1]
penultima_fecha <- fecha[n-1]

ranking <- rank.teams(scores = anotaciones, teams = equipos, min.date = primer_fecha, max.date = penultima_fecha)
rank <- rank.teams(scores = anotaciones, teams = equipos)

# 4 Finalmente estima las probabilidades de los eventos, el equipo de casa gana, el equipo visitante gana o el resultado es un empate para los partidos que se jugaron en la última fecha del vector de fechas fecha. Esto lo puedes hacer con ayuda de la función predict y usando como argumentos ranking y fecha[n] que deberá especificar en date.

prediccion <- predict(ranking, date = fecha[n])
```
