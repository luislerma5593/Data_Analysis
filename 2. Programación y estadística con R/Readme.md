# Funciones

## General

| **Comando**| **Descripción** |
| ------------- | ------------- |
|**` round(x) `** | Redondear  |
|**`paste("Texto1","Texto2")`**|Concatenar textos|
|**`summary(X)`**|Genera un resumen de lista o dataframe|
|**`head(Top250Rest) `**|Obtener la primera parte de un vector, matriz, tabla, df o función.|
|**`tail(Top250Rest) `**|Obtener la última parte de un vector, matriz, tabla, df o función.|



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

