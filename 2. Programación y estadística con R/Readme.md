# Funciones

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
|**`download.file(url, filename, mode = "wb")`**|Descarga un archivo en el directorio establecido|


## Matemáticas

| **Comando** | **Descripción** |
| ------------- | ------------- |
|**`rnorm(n)`**|Genera un vector con 'n' elementos dentro de una distribución normal (mean = 0, sd = 1)|
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


## Ciclos y condiciones

| **Comando** | **Descripción** |
| ------------- | ------------- |
|**`for(i in 1:10){ print(i) }`**|For|
|**`while(cond){expr}`**|While|


## Gráficas

| **Comando** | **Descripción** |
| ------------- | ------------- |
|**`plot(x,y)`**|Crear una gráfica|


##  DPLYR (Manipulación y operaciones con DF)

| **Comando** | **Descripción** |
| ------------- | ------------- |
|**`select(df,col1,...) `**|Filtrar columnas|
|**`rename(df,new_col_name) `**|Renombrar columnas|
|**`mutate(df, modif) `**|Agregar o modificar columnas|
|**`merge(df1,df2)`**|Unir dos data frames|
|**`filter(df,condición) `**|Filtrar registros de un df|
