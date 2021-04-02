# Funciones

- https://rsanchezs.gitbooks.io/rprogramming/content/index.html
- https://es.wikipedia.org/wiki/Cuarteto_de_Anscombe
- https://raw.githubusercontent.com/rstudio/cheatsheets/master/data-visualization-2.1.pdf
- https://fhernanb.github.io/Manual-de-R/

## General

| **Comando**| **Descripción** |
| ------------- | ------------- |
|**` round(x) `** | Redondear  |
|**`paste("Texto1","Texto2")`**|Concatenar textos|
|**`rm(a)`**|(Remove) Elimina una variable|
|**`summary(X)`**|Genera un resumen de lista o dataframe|
|**`head(Top250Rest) `**|Obtener la primera parte de un vector, matriz, tabla, df o función.|
|**`tail(Top250Rest) `**|Obtener la última parte de un vector, matriz, tabla, df o función.|
|**`sort(x, decreasing = T/F)`**|Ordenar un vector|
|**`set.seed(num)`**|Para poder obtener los mismos números aleatorios|
|**`sample(a:b, n, replace = T)`**|Genera un vector con 'n' elementos de 'a' a 'b'.|
|**`lapply(vec,func) `**|Aplica la función a cada uno de los elementos|
|**`do.call(func,lista) `**|Aplica una función a una lista o argumentos|
|**`complete.cases(df)`**|Identifica las filas que están comletas (No NA) y regresa T y F|
|**`na.omit(df)`**|Omitir los valores que no son números. |
|**`row.names()`**|Regresa un vector con los nombres de las filas|
|**`colnames()`**|Regresa un vector con los nombres de las columnas|
|**`as.factor()`**|Para categorizar (Mostrar todos los números en las gráficas)|
|**`rep(a, b)`**|Genera un vector de b entradas, con el valor a|


## Instalación de paquetes

| **Comando**| **Descripción** |
| ------------- | ------------- |
|**`install.packages("ggplot2")`**|Instalar el paquete|
|**`library(ggplot2)`**|Utilizar el paquete|


## Vectores

| **Comando** | **Descripción** |
| ------------- | ------------- |
|**`c(x)`**| Vector  |
|**`c(a,b)`**| Une dos vectores|
|**`c(x)`**|Vector 
|**`c(a,b)`**| Une dos vectores |
|**`a[x]`**| Obtienes la coordenada del vector |
|**`seq(x,y,z)`**| Vector secuencial |
|**`length(x)`**| Longitud de vector x |
|**`class(x) `**| Tipo de dato |
|**`typeof(x)`**| Tipo de dato |
|**`x:y`**| Genera un vector |
|**`rep(x,y)`**| Repite x, y veces |
|**`unique(vec)`**|Obtener un vector sin elementos repetidos|


## Listas

| **Comando** | **Descripción** |
| ------------- | ------------- |
|**`list(nom1="Luis",años=25)`**|Generar una lista  con diferentes tipos de datos|
|**`str(milista)`**|Obtener información de la lista o dataframe|
|**`milista$nombre`**|Extraer elementos de una lista|


## Matrices

| **Comando** | **Descripción** |
| ------------- | ------------- |
|**`rbind(x,y)`**| Une los vectores 'x' y 'y' por renglones|
|**`rbind(1:4,5:8)`**| Crea una matriz del 1 al 4 y luego del 5 al 8|
|**`cbind(x,y)`**| Une los vectores 'x' y 'y' por columnas|
|**`matrix(a:b,x,y)`**| Genera una matriz de 'a' a 'b' con 'x' filas y 'y' columnas|
|**`n[n > 4]`**| Extraer subconjuntos de la matriz|
|**`which(n > 4)`**| Localizar la posición de las coincidencias de `n[n > 4] `|
|**`dim(A)`**| Obtener la dimensión de la matriz|
|**`apply(matriz, 1, mean)`**|Obtener el" promedio" de la matriz (1: Rows/2:Columns)|
|**`A %*% B`**| Producto matricial|
|**`A*B`**| Producto elemento a elemento|
|**`t(A)`**| Traspuesta de A|
|**`diag(A)`**| Diagonal de A|
|**`det(A)`**| Determinante de A|
|**`( Ax=b ): solve(A,b)`**| Resolver un sistema de ecuaciones lineales|
|**`solve(A)`**| Inversa de A|
|**`eigen(A)`**| Autovalores y autovectores|


## Data Frames

| **Comando** | **Descripción** |
| ------------- | ------------- |
|**`data.frame(edad = vec1, grupo = vec2)`**|Generar un dataframe con los vectores asignados|
|**`mifile$sexo <- c("H", "M", "H")`**|Agregar un campo|
|**`mifile$sexo <- NULL`**|Eliminar un campo|


## Descarga y lectura de Datasets

| **Comando** | **Descripción** |
| ------------- | ------------- |
|**`getwd()`**|Obtener la ruta del directorio de trabajo|
|**`setwd("c:/Users/User/Documents/Bedu/")`**|Fijar la ruta del directorio de trabajo|
|**`read.csv("Top250.csv")`**|Leer un archivo .csv, o directamente de un URL|
|**`as.data.frame()`**|Convertir en un dataframe|
|**`names(x) <- vec`**|Asignar un vector de nombres para el dataframe 'x'|
|**`dir()`**|Obtener los archivos que hay en el directorio establecido con setwd()|
|**`download.file(url, destfile , mode = "wb")`**|Descarga un archivo en el directorio establecido|
|**`read.table("", header=T)`**|Para leer un .txt|


## Matemáticas

| **Comando** | **Descripción** |
| ------------- | ------------- |
|**`runif(n, a, b,)`**|Genera un vector de 'n' elementos entre 'a' y 'b' (Distribución uniforme)|
|**`which.max(x)`**|Posición del máximo valor |
|**`which.min(x)`**|Posición del mínimo valor|
|**`mean(x)`**|Obtener el promedio|
|**`median(x)`**|Obtener la mediana|
|**`Mode(x)`**|Obtener la moda (Se necesita la librería "DescTools")|
|**`quantile(x, vec)`**|Obtener cuantiles|
|**`quantile(x, sec(0.1,0.9,0.1))`**|Obtener deciles|
|**`IQR(x)`**|Obtener rango intercuartílico (Q3-Q1)|
|**`var(x)`**|Obtener la varianza|
|**`sd(x)`**|Obtener la desviación estándar|
|**`table(vec/df) `**|Generar una tabla de frecuencias|


## Probabilidad

- https://estadistica-dma.ulpgc.es/cursoR4ULPGC/10-distribProbabilidad.html

| **Comando** | **Descripción** |
| ------------- | ------------- |
|**`dbinom()`**|Una probabilidad de P(X = a)|
|**`pbinom()`**|Una probabilidad de P(X <= a)|
|**`qbinom( p = 0.2, ...)`**|Obtienes el cuantil de una probabilidad|
|**`rbinom()`**|Generar una muestra de n observaciones, con una distribución binomial|
|**`dt(x, df = 7)`**|Distribución t de student con gl=7|
|**`pt(q = a, df = 7)`**|Distribución t de student P(T <= a)|
|**`qt(prob,dof)`**|Obtener el cuantil de una probabilidad en t Student|
|**`rnorm(n)`**|Genera un vector con 'n' elementos dentro de una distribución normal (mean = 0, sd = 1)|
|**`dnorm()`**|Obtener una probabilida (P X = a)|
|**`pnorm(…,lower.tail = FALSE)`**|Obtener la probabilidad (P X <= a)|
|**`qnorm()`**|Obtener el cuantil de la dsitribución normal|


## Regresión lineal

| **Comando** | **Descripción** |
| ------------- | ------------- |
|**`lm(x~y)`**|Generar un modelo de regresión lineal|
|**`confint()`**|Encontrar los intervalos de confianza del lm|
|**`predict(interval="confidence")`**|Generar límites del intervalo de confianza|
|**`predict(interval="prediction")`**|Generar límites del intervalo de predicción|
|**`df$residuals`**|Despliega los residuales del modelo|
|**`abline(lsfit(x, y))`**|Agregar la línea del modelo|
|**`update(m1, ~. - Column)`**|Eliminar un campo de un modelo|
|**`pairs(~ a + b + c, data = nyc)`**|Generar una tabla de apareamiento|
|**`m1$fitted.values`**|Muestra la suma de las variables independientes por sus betas|


## Ciclos y condiciones

| **Comando** | **Descripción** |
| ------------- | ------------- |
|**`for(i in 1:10){ print(i) }`**|For|
|**`while(cond){expr}`**|While|


## Gráficas

| **Comando** | **Descripción** |
| ------------- | ------------- |
|**`plot(x,y)`**|Crear una gráfica|
|**`barplot(x)`**|Crear una gráfica de barras|
|**`type= "l"/"p"/"b"`**|Graficar una línea, puntos o ambos|
|**`hist(df$x)`**|Generar un histograma nativo de R|
|**`main="Título"`**|Generar un título para el histograma|
|**`title(main="x",sub="y"`**|Generar un título y nota debajo|
|**`xlab="Eje x"`**|Leyenda del eje x|
|**`ylab="Eje y"`**|Leyenda del eje y|
|**`breaks = 30 / seq(a,b,c)`**|Establecer el número de secciones |
|**`lwd=a`**|"Line width" → Para poder cambiar el ancho de la línea|
|**`lty(1/2/3)`**|Para seleccionar el tipo de línea|
|**`lines(st$column)`**|Para poder agregar una línea dentro de un scatterplot|
|**`legend(cor_x,cor_y…)`**|Posición de la leyenda|
|**`legend(col=c(...))`**|Nombres de las líneas agregadas|
|**`legend(lty(1/2/3))`**|Para seleccionar el tipo de línea|
|**`legend(text.col=a))`**|Seleccionar el color del texto de la leyenda|
|**`egend(bg=a)`**|"Background" → Color de fondo de la leyenda|
|**`xlim(vec)`**|Límites en x|
|**`ylim(vec)`**|Límites en y|
|**`factor(vec)`**|Para poder categorizar una variables (0=manual,1=automático)|
|**`abline(v= a)`**|Agrega una línea vertical|
|**`par(mfrow = c(2, 2))`**|Genera un espacio con 4 gráficas (2 y 2)|
|**`polygon()`**|Colorea una parte de una gráfica|
|**`dev.off()`**|Para mostrar sólo una gráfica|
|**`pch = a`**|Tipo de elemento (punto) en un diagrama|


##  dplyr (Manipulación y operaciones con DF)

| **Comando** | **Descripción** |
| ------------- | ------------- |
|**`select(df,col1,...) `**|Filtrar columnas|
|**`rename(df,new_col_name) `**|Renombrar columnas|
|**`mutate(df, modif) `**|Agregar o modificar columnas|
|**`merge(df1,df2)`**|Unir dos data frames|
|**`filter(df,condición) `**|Filtrar registros de un df|


##  ggplot2 (Creación de gráficas)

- https://raw.githubusercontent.com/rstudio/cheatsheets/master/data-visualization-2.1.pdf
- http://www.sthda.com/english/wiki/ggplot2-axis-ticks-a-guide-to-customize-tick-marks-and-labels

| **Comando** | **Descripción** |
| ------------- | ------------- |
|**`ggplot(df, aes(x=a,y=b, colour=c)`**|Diagrama general (aes es para las variables)|
|**`+ geom_point`**|Diagrama de dispersión|
|**`+ geom_histogram`**|Histograma|
|**`+ geom_col`**|Gráfico de barras|
|**`+ geom_bar (stat="identity")`**|Gráfico de barras (Cuenta)|
|**`+ geom_tile`**|Generar un mapa de calor|
|**`+ geom_vline`**|Línea vertical|
|**`+ geom_hline`**|Línea horizontal|
|**`+ aes(Variable)`**|Seleccionar la variable para el diagrama|
|**`+ ggtitle("Title")`**|Título de digrama|
|**`+ theme_...()`**|Seleccionar un tema|
|**`+ facet_wrap("a")`**|Dividir horizontalmente|
|**`+ facet_grid("a")`**|Dividir verticalmente|
|**`+ xlab("x")`**|Etiqueta eje x|
|**`+ ylab("y")`**|Etiqueta eje y|
|**`data %>%     ggplot() + `**|Otra forma para concatenar las funciones|
|**`fill("color")`**|Color de fondo de las barras|
|**`col("color")`**|Color del contorno de las barras|
|**`binwidth = num`**|Ancho de cada una de las barras|
|**`bin = num`**|Número total de barras|
|**`alpha(0-1)`**|Seleccionar la transparencia del color de fondo|
|**`xintercept`**|Se usa dentro del `vline` para generar la línea|
|**`labs(x=a,y=b,title=c)`**|Introducir los textos de las etiquetas|
|**`theme()`**|Para poder agregar textos a las gráficas y alinear las etiquetas|
|**`theme(plot.title = element_text(hjust = 0.5))`**|Centrar el título|


##  Otras librerías

| **Comando** | **Descripción** |
| ------------- | ------------- |
|**`plotly`**|ggplotly → Mostrar los valores de una gráfica|
|**`reshape`**|melt → Genera un df a partir de una matriz para un heatmap|


##  Series de tiempo

| **Comando** | **Descripción** |
| ------------- | ------------- |
|**`start(ts)`**|Inicio de una serie de tiempo|
|**`end(ts)`**|Fin de una serie de tiempo|
|**`frequency(ts)`**|Frecuencia de la serie de tiempo|
|**`decompose(ts, type=add/mult)`**|Descomposición de una serie de tiempo|
|**`ts(df, start=a, frequency=b)`**|Generar una serie de tiempo|
