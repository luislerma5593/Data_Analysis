
# dplyr, zoo, tidyr, lubridate, ggplot2

library(dplyr)
library(zoo)
library(tidyr)
library(lubridate)

path = "C:\\Users\\LLerma\\Documents\\GitHub\\Data_Analysis\\Ejercicios\\Datasets\\NetflixViewingHistory2.csv"

df = read.csv(path)
str(df)

df$Date = dmy(df$Date) #df = mutate(df, Date = as.Date(Date, "%d/%m/%y"))
str(df)


#Filtrado por título, temporada y episodio
df_titl = df %>%
  separate(col = Title, into = c("Titulo","Temporada","Episodio"), sep = ":")


# Quitar donde hay nulls

df_serie = df_titl[!is.na(df_titl$Temporada),]
df_serie = df_titl[!is.na(df_titl$Episodio),]


# Registro por numero de episodios

cuenta_series = df_serie %>%
  count(Titulo,Date)


# Considerar a partir de 5 episodios

maratones = cuenta_series[cuenta_series$n >= 5,] 

maratones_ord = maratones[order(maratones$n),] 


# Agrupación

agrupacion = maratones_ord %>%
  group_by(Titulo) %>%
  summarise(n = sum(n)) %>% #Group funciona con summarise
  arrange(desc(n)) # Ordena el df


# Visualizaciones

maratones_vis = agrupacion%>%
  top_n(10) %>%
  ggplot(aes(x = reorder(Titulo,n), y = n)) +
  geom_col(fill = "blue") +
  coord_flip() + 
  ggtitle("Top 10 series 5 episodios o más") +
  labs(x = "Serie de netflix", y = "# de episodios") +
  theme_minimal()
  
maratones_vis


# Pruebas

maratones_vis = agrupacion%>%
  top_n(10) %>%
  ggplot(aes(x = reorder(Titulo,n), y = n)) + #Se tienen que ordenar
  geom_col(fill = "blue") +
  coord_flip() + 
  ggtitle("Top 10 series 5 episodios o más") +
  labs(x = "Serie de netflix", y = "# de episodios") +
  theme_minimal()

maratones_vis


ggplot(agrupacion, aes(x = reorder(Titulo,n) , y = n))+ geom_col(col="black", fill="red") +
  theme(plot.title = element_text(hjust = 0.5))+ ggtitle("Prob") + coord_flip()
#3
