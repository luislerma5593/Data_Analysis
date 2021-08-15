
# Desarrollo
# Nota: este reto es opcional

library(ggplot2)

# 1 Genere 1500 muestras de tamaño 67 de la distribución exponencial con parámetro 5

set.seed(100) # 1.

a <- matrix(ncol = 1500, nrow = 67)

for (i in 1:1500){
    a[,i] <- rexp(67,5)
}

#Otra forma

b <- sapply(X = rep(67, 1500), FUN = rexp, rate = 5)

# 2 Obtenga las 1500 medias correspondientes a cada una de las muestras

mean_a <- apply(a, 2, mean)
media1500.67 <- mean_a
# 3 Realice el histograma de frecuencias de las 1500 medias

hist(mean_a, breaks = 30)

#Otra forma

mdf <- as.data.frame(media1500.67)

(ggplot(mdf, aes(media1500.67)) + # 3.
  geom_histogram(colour = 'yellow', 
                 fill = 'purple',
                 alpha = 0.7) + # Intensidad del color fill
  geom_vline(xintercept = mean(media1500.67), 
             linetype="dashed", color = "black") + 
  ggtitle('Histograma para las 1500 medias') + 
  labs(x = 'medias', y = 'Frecuencia')+
  theme_get() +
  theme(plot.title = element_text(hjust = 0.5, size = 16))
)
# 4 Encuentre la media muestral y desviación estándar muestral de las 1500 medias

(media_muestral <- mean(mean_a)) # -> 0.1989
(sd_muestral <- sd(mean_a)) # -> 0.0241

# 5 Compare la media muestral encontrada en el paso anterior con la media real (1/5) de la población de la cual provienen las muestras

### La media real es 1/lamba ??? 1/5 ??? 0.2

(media_muestral <- mean(mean_a)); 1/5

# 6 Compare la desviación estándar muestral encontrada con la desviación estándar real (1/5) de la población de la cual provienen las muestras pero dividida por 67 (el tamaño de las muestras)

(sd_muestral <- sd(mean_a)); (1/5)/sqrt(67)
