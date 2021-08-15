## Reto 3

1. Genera un vector de 44 entradas (aleatorias) llamado ran
2. Escribe un loop que eleve al cubo las primeras 15 entradas y les sume 12
3. Guarda el resultado en un data frame, donde la primera columna sea el número aleatorio y la segunda el resultado, nómbralo df.al
4. Escribe el pseudocódigo del loop anterior
```r
ran <- sample(44)
ran2<-ran

for (i in 1:15) {
  ran2[i] <- (ran[i]**3)+12
}

df.al <- data.frame(ran,ran2)
```