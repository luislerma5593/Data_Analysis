# Reto 2

#Desarrollo
#Considere el data frame mtcars de R y utilice las funciones:

#str
#summary
#head
#View
#para observar las características del objeto y tener una mayor comprensión de este.

#Crea una función que calcule la mediana de un conjuntos de valores, sin utilizar la función median

(x <- sample(1:30, 99, replace = T))

mediana <- function(x){
  x<-sort(x)
 len<-length(x)
  print(len)
  if ((len%%2)==0){
    med=((x[(len/2)]+x[(len/2)+1])/2)
  } else {
    med=(x[trunc(len/2)+1])
  }
  paste("La mediana es: ", med)
}

x=c(1,7,5,9,76,4,5,6)
mediana(x)

