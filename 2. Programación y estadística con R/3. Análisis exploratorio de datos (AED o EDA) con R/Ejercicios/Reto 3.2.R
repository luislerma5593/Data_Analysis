# Reto 3.2 
 

library(ggplot2)

na <- read.csv("https://raw.githubusercontent.com/beduExpert/Programacion-con-R-Santander/master/Sesion-03/Reto-02/players_stats.csv")
naom <- na.omit(na)
# 1 Generar un histograma de los minuntos totales (MIN), de los jugadores y agregar una l�nea donde se muestre la media (Hint: para agregar la línea que muestre la media consulta la documentación sobre geom_vline y el argumento xintercept)
 
mnba=mean(na$MIN)

ggplot(na, aes(MIN)) + geom_histogram(binwidth=100, col="black") + geom_vline(xintercept = mnba) + xlab("Minutos") + ylab("Cuenta")


# 2 Generar un histograma de edad (Age) y agregar una l�nea con la media

(mean_age=mean(na.omit(na$Age)))

ggplot(na, aes(Age)) + geom_histogram(binwidth=1, col="black") + geom_vline(aes(xintercept=mean_age))
 
# 3 Hacer un scatterplot de las variables Weight y Height y observar la correlacón que existe entre ambas variables (1 sola gráfica)

ggplot(naom, aes(x = Weight, y = Height)) + geom_point()
cor(naom$Weight,naom$Height)
       
# 4 Utiliza la función which.max para saber quién es el jugador más alto, una vez hecho esto, presenta los resultados en una leyenda que diga "El jugador más alto es: Name, con una altura de: Height". Las unidades de altura deben ser en metros.

maxx<-which.max(naom$Height)
nom<-naom$Name[maxx]
alt<-naom$Height[maxx]
paste("El jugador mas alto es",  nom, "con una altura de ", alt*.01,"m")


# 5 Utiliza la función which.min para saber quién es el jugador más bajito, una vez hecho esto, presenta los resultados en una leyenda que diga "El jugador más bajito es: Name, con una altura de: Height". Las unidades de altura deben ser en metros.

minn<-which.min(naom$Height)
min_nom<-naom$Name[minn]
min_alt<-naom$Height[minn]
paste("El jugador mas bajo es",  min_nom, "con una altura de ", min_alt*.01,"m")

# 6 ¿Cuál es la altura promedio?, representa el resultado en una frase que diga: "La altura promedio es: ALTURA"

promedioaltura <- mean(naom$Height)
paste("La altura promedio es de",  promedioaltura*.01,"m")

# 7 Generar un scatterplot donde se representen las Asistencias totales (AST.TOV) vs Puntos (PTS), además has un face wrap con la posición (Pos).

ggplot(naom, aes(x = AST.TOV, y = PTS)) + geom_point() +
facet_wrap("Pos")
cor(naom$Weight,naom$Height)

                                                                