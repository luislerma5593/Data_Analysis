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

Ejemplo. Un estudiante cursó seis materias en el semestre, obteniendo calificaciones de 8, 7, 10, 8, 9 y 7. Su calificación media o promedio semestral es de

Ejemplo. Una pequeña compañía consultora tiene una secretaria, un empleado de limpieza, un mensajero y un economista. Sus salarios mensuales respectivos son de $5000, $4000, $3500 y $50000. El salario promedio de la compañía es de

El lector podría pensar que este salario no es una medida representativa de los salarios del personal. ¿Qué sucede? La razón es que existe un dato, el salario del economista, que está totalmente fuera del rango de los demás salarios. Así, al realizar el promedio, este dato jala a los demás.

Para evitar problemas con datos alejados de los demás, como en el ejemplo anterior, se utiliza otra medida de tendencia central llamada mediana. La mediana es el valor que parte al conjunto de datos ordenados en dos. Para encontrar la mediana, los datos se ordenan de menor a mayor y,

- si el conjunto de datos es impar, la mediana es el valor que se encuentra a la mitad del conjunto,+ + Si el conjunto de datos es par, la mediana es el promedio de los dos datos intermedios.

Ejemplo. Encontrar la mediana del conjunto de salarios {$5000, $4000, $3500 y $50000}. Los ordenamos de menor a mayor obteniendo,

Este es un conjunto par de datos de manera que la mediana es el promedio de los dos datos intermedios, es decir la mediana es

En ocasiones, este dato puede ser una mejor representación de los salarios de la empresa que el promedio obtenido anteriormente en el ejemplo.

La media y la mediana no toman en cuenta la repetición de los datos, se define para este efecto, la moda. Ésta es simplemente el valor o categoría que ocurre con mayor frecuencia en un conjunto de datos. Es claro que puede haber más de una moda ya que puede haber más de un dato que se repita con la misma frecuencia. Para el caso de dos modas, decimos que la distribución de los datos es bimodal. Cuando existen más de dos modas, la distribución se denomina multimodal.
