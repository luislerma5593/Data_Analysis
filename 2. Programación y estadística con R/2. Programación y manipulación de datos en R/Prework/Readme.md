# Prework

## Objetivo

- Conocer las principales medidas de tendencia central, sus interpretaciones, así como ventajas y desventajas
- Conocer la utilidad de los cuantiles y algunas medidas de posición útiles y comunes en la práctica
- Conocer algunas medidas de dispersión y saber interpretarlas

## Introducción

En este prework, estudiarás las medidas de tendencia central más conocidas, algunas medidas de posición muy útiles como los cuartiles y medidas de dispersión. Es muy importante que conozcas estos conceptos básicos cuando estudias estadística, posteriormente en el work, trabajarás con datos, y los cálculos serán muy rápidos y fáciles de hacer con algunas funciones de R, pero primero necesitas entender el significado de estas medidas, para que, en el work, te puedas enfocar únicamente en cálculos fáciles e interpretaciones.

## Medidas de tendencia central
Dado un conjunto de datos, las llamadas medidas de tendencia central son números alrededor de los cuales se concentran los datos. La media o promedio es quizás la medida de tendencia central más conocida. Dado un conjunto de datos {x1, ⋯, xn} que representa una muestra de alguna población, la media del conjunto se define como

![image](https://user-images.githubusercontent.com/78183885/110557289-ef078880-8105-11eb-8203-5ff264ae9428.png)

es decir, el promedio de los datos.

![image](https://user-images.githubusercontent.com/78183885/110557325-fcbd0e00-8105-11eb-935c-0b086d5cd0f6.png)

Ejemplo. Un estudiante cursó seis materias en el semestre, obteniendo calificaciones de 8, 7, 10, 8, 9 y 7. Su calificación media o promedio semestral es de

Ejemplo. Una pequeña compañía consultora tiene una secretaria, un empleado de limpieza, un mensajero y un economista. Sus salarios mensuales respectivos son de $5000, $4000, $3500 y $50000. El salario promedio de la compañía es de

![image](https://user-images.githubusercontent.com/78183885/110557334-02b2ef00-8106-11eb-81f7-23146803a613.png)

El lector podría pensar que este salario no es una medida representativa de los salarios del personal. ¿Qué sucede? La razón es que existe un dato, el salario del economista, que está totalmente fuera del rango de los demás salarios. Así, al realizar el promedio, este dato jala a los demás.

Para evitar problemas con datos alejados de los demás, como en el ejemplo anterior, se utiliza otra medida de tendencia central llamada mediana. La mediana es el valor que parte al conjunto de datos ordenados en dos. Para encontrar la mediana, los datos se ordenan de menor a mayor y,

- si el conjunto de datos es impar, la mediana es el valor que se encuentra a la mitad del conjunto,+ + Si el conjunto de datos es par, la mediana es el promedio de los dos datos intermedios.

Ejemplo. Encontrar la mediana del conjunto de salarios {$5000, $4000, $3500 y $50000}. Los ordenamos de menor a mayor obteniendo,

![image](https://user-images.githubusercontent.com/78183885/110557348-08a8d000-8106-11eb-991e-fc8657a4f9cf.png)

Este es un conjunto par de datos de manera que la mediana es el promedio de los dos datos intermedios, es decir la mediana es

![image](https://user-images.githubusercontent.com/78183885/110557356-0d6d8400-8106-11eb-9454-a264c1185791.png)

En ocasiones, este dato puede ser una mejor representación de los salarios de la empresa que el promedio obtenido anteriormente en el ejemplo.

La media y la mediana no toman en cuenta la repetición de los datos, se define para este efecto, la moda. Ésta es simplemente el valor o categoría que ocurre con mayor frecuencia en un conjunto de datos. Es claro que puede haber más de una moda ya que puede haber más de un dato que se repita con la misma frecuencia. Para el caso de dos modas, decimos que la distribución de los datos es bimodal. Cuando existen más de dos modas, la distribución se denomina multimodal.

## Medidas de posición

De manera un poco informal pero útil para la práctica, podemos decir que el cuantil de orden p (0 < p < 1) de un conjunto de mediciones, es un número que deja una proporción p de valores del conjunto por debajo de él. Por ejemplo, el cuantil de orden 0.43 dejaría un 43% de las observaciones por debajo de él.

- Cuartiles

Los cuartiles son 3 números que dividen al conjunto de datos en cuatro partes iguales, es decir, debajo del primer cuartil se encuentra el 25% de las observaciones, el segundo cuartil es la mediana y el tercer cuartil es un número que tiene el 75% de las observaciones por debajo de él.

![image](https://user-images.githubusercontent.com/78183885/110558342-efa11e80-8107-11eb-8235-fccd69ac4b1d.png)

![image](https://user-images.githubusercontent.com/78183885/110558384-05164880-8108-11eb-8e9e-5eff87d718f0.png)

- Deciles

Los deciles son 9 valores que dividen el conjunto de datos en 10 partes iguales.


## Medidas de dispersión

Consideremos a los conjuntos {5, 6, 7, 8, 9} y {1, 2, 7, 12, 13}. Ambos tienen media y mediana iguales a 7 y, sin embargo, nuestra intuición nos dice que los datos del segundo conjunto están más dispersos. ¿Cómo formalizar este concepto de dispersión? Una forma de hacerlo es considerando el rango o extensión de los datos que se define como la diferencia entre el dato más grande y el más pequeño.

Ejemplo. El rango del conjunto de datos {5, 6, 7, 8, 9} es de 9 - 5 = 4 y el rango del conjunto {1, 2, 7, 12, 13} es de 13 – 1 = 12. Observemos que el conjunto con el rango más grande es más disperso.

Una forma muy utilizada para medir la dispersión de un conjunto de datos es la llamada desviación estándar. Ésta mide qué tanto los datos se desvían de la media y se denota comúnmente por sn. Esta desviación se construye a partir de su cuadrado conocido como varianza, como sigue: dado un conjunto de datos {x1, ⋯xn} con media x, la **varianza** se define como

![image](https://user-images.githubusercontent.com/78183885/110558426-1c553600-8108-11eb-9306-610707ee21c7.png)

Intuitivamente, xi-x es la distancia a la media del dato xi, ésta se eleva al cuadrado para tener siempre un valor positivo y se divide entre n para obtener el promedio de estas desviaciones.

![image](https://user-images.githubusercontent.com/78183885/110558435-224b1700-8108-11eb-85aa-19674dfe8bfa.png)

Por definición, la varianza da un valor numérico para el promedio de los cuadrados de las distancias. Para que el número conserve las unidades originales de la variable, se toma la raíz cuadrada y se tiene así la desviación estándar

prueba![image](https://user-images.githubusercontent.com/78183885/110558459-28d98e80-8108-11eb-97c0-e7945fe4c406.png)

Esta desviación nos da una idea de que tan alejados están los datos de la media.

A la varianza de una población se le denota por 2 y a su desviación estándar por . Al igual que en el caso de la media, la varianza de una población puede inferirse a partir de las varianzas de las muestras. Desgraciadamente, en este caso se tiene una complicación: la varianza de la población no se aproxima bien por el valor esperado de las varianzas de las muestras y tiende a subestimarse.

![image](https://user-images.githubusercontent.com/78183885/110558474-3131c980-8108-11eb-90ca-b34656b9408d.png)

El problema de estimación de la varianza poblacional puede solucionarse

![image](https://user-images.githubusercontent.com/78183885/110558481-355de700-8108-11eb-8861-8da719960c7c.png)

![image](https://user-images.githubusercontent.com/78183885/110558488-38f16e00-8108-11eb-974b-059415e2f420.png)

![image](https://user-images.githubusercontent.com/78183885/110558501-3d1d8b80-8108-11eb-93af-3028bdc81654.png)

- Rango intercuartílico

 Otra medida de dispersión muy útil es el rango intercuartílico, consulta en diversas fuentes acerca del rango intercuartílico y cuáles son sus ventajas como medida de dispersión.
