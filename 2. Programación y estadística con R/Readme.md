# Funciones

## Vectores

`round(x)` -> Redondear
`c(x)` -> Vector
`c(a,b)` -> Une dos vectores
`a[x]` -> Obtienes la coordenada del vector
`seq(x,y,z)` -> Vector secuencial
`length(x)` -> Longitud de vector x
`class(x)` -> Tipo de dato
`typeof(x)` -> Tipo de dato
`x:y` -> Genera un vector
`rep(x,y)` -> Repite x, y veces

## Matrices

`rbind(x,y)` -> Une los vectores 'x' y 'y' por renglones
`rbind(1:4,5:8)` -> Crea una matriz del 1 al 4 y luego del 5 al 8
`cbind(x,y)` -> Une los vectores 'x' y 'y' por columnas
`matrix(a:b,x,y)` -> Genera una matriz de 'a' a 'b' con 'x' filas y 'y' columnas
`n[n > 4] ` -> Extraer subconjuntos de la matriz
`which(n > 4)` -> Localizar la posición de las coincidencias de `n[n > 4] `
`dim(A)` -> Obtener la dimensión de la matriz
` A %*% B` -> Producto matricial
`A*B` -> Producto elemento a elemento
`t(A)` -> Traspuesta de A
`diag(A)` -> Diagonal de A
`det(A)` -> Determinante de A
`(( Ax=b )): solve(A,b)` -> Resolver un sistema de ecuaciones lineales
`solve(A)` -> Inversa de A
`eigen(A)` -> Autovalores y autovectores
