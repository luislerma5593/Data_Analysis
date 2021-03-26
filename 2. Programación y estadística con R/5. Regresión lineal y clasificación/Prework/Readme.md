# Prework

## Introducción

Supongamos que nuestro trabajo consiste en aconsejar a un cliente sobre cómo mejorar las ventas de un producto particular, y el conjunto de datos con el que disponemos son datos de Publicidad que consisten en las ventas de aquel producto en 200 diferentes mercados, junto con presupuestos de publicidad para el producto en cada uno de aquellos mercados para tres medios de comunicación diferentes: TV, radio, y periódico. No es posible para nuestro cliente incrementar directamente las ventas del producto. Por otro lado, ellos pueden controlar el gasto en publicidad para cada uno de los tres medios de comunicación. Por lo tanto, si determinamos que hay una asociación entre publicidad y ventas, entonces podemos instruir a nuestro cliente para que ajuste los presupuestos de publicidad, y así indirectamente incrementar las ventas. En otras palabras, nuestro objetivo es desarrollar un modelo preciso que pueda ser usado para predecir las ventas sobre la base de los tres presupuestos de medios de comunicación.

En este contexto, los presupuestos de publicidad son las variables de entrada mientras que las ventas es una variable de salida. Las variables de entrada típicamente se denotan usando el símbolo X, con un subíndice para distinguirlas. Así X1 puede ser el presupuesto para TV, X2 el presupuesto para radio, y X3 el presupuesto para periódico. Las entradas tienen diferentes nombres, tales como predictores, variables independientes, características, o a veces solo variables. La variable de salida -en este caso, las ventas- frecuentemente es llamada la variable de respuesta o dependiente, y se denota típicamente con el símbolo Y.

## Forma general

Más generalmente, suponga que observamos una respuesta cuantitativa Y y p diferentes predictores, X1, X2, …, Xp. Asumimos que hay alguna relación entre Y y X=(X1, X2, …, Xp), la cual podemos escribir en la forma muy general

![image](https://user-images.githubusercontent.com/78183885/112558712-ffba2e80-8d94-11eb-8ac2-e48a64ddcfd5.png)

Aquí f es alguna función desconocida pero fija de X1, X2, …, Xp, y es un término de error aleatorio, el cual es independiente de X y tiene media cero. En esta formulación, f representa la información sistemática que X proporciona acerca de Y. Sin embargo, la función f que conecta las variables de entrada a la variable de salida en general es desconocida. En esta situación debemos estimar f basados en los datos observados. En esencia, el aprendizaje estadístico se refiere a un conjunto de enfoques para estimar f.

## ¿Por qué estimar f?
Hay dos razones principales por las cuales podemos desear estimar f: predicción e inferencia.

### Regresión lineal simple

Con frecuencia es necesario determinar si dos variables (aleatorias) están relacionadas de alguna manera. Por ejemplo, ¿tendrán los años de educación efecto sobre el salario que percibe un individuo? La relación entre dos variables cuantitativas puede visualizarse en un diagrama de dispersión en el plano, representando los valores de las variables en los ejes horizontal y vertical.

![image](https://user-images.githubusercontent.com/78183885/112558724-08126980-8d95-11eb-8834-5e2eb435b7be.png)

La correlación puede darse entre variables sin ninguna implicación de causalidad entre ellas, por ejemplo: si tomamos una muestra de individuos y medimos los diámetros del antebrazo y del muslo, seguramente encontraremos que hay una correlación positiva alta. Evidentemente no hay ninguna relación de causalidad entre estas variables y más bien ambas dependen del peso y la altura del individuo. A este tipo de correlación entre variables se le conoce como correlación espuria.

La asociación más simple entre variables es cuando éstas se relacionan en forma lineal, sin embargo, no siempre es posible establecer este tipo de relación entre ellas.

Para medir la magnitud de la asociación lineal entre dos variables, se utiliza comúnmente el coeficiente de correlación introducido por Karl Pearson. Éste es un número entre el -1 y el 1 denotado por la letra R. Si R = −1, se tiene una relación negativa perfecta y los puntos en el diagrama de dispersión se encuentran sobre una recta con pendiente negativa.

Si R = 1, la relación lineal es también perfecta pero positiva: los puntos en el diagrama de dispersión están sobre una recta con pendiente positiva. Si R = 0, entonces no hay relación lineal alguna y los puntos forman más bien una nube difusa o algún otro patrón evidentemente no lineal. Lo usual es tener casos intermedios, en donde existe algún grado moderado de correlación lineal entre las variables. En general, en las ciencias sociales es raro tener coeficientes de correlación mayores que 0.7 (o menores que −0.7).

A continuación, tenemos datos de estatura y pesos de unos individuos.

Altura <- c(1.94, 1.82, 1.75, 1.80, 1.62, 1.64, 1.68, 1.46, 1.50, 1.55, 1.72, 1.67, 1.57, 1.60) Peso <- c(98, 80, 72, 83, 65, 70, 67, 47, 45, 50, 70, 61, 50, 52)

Para obtener el coeficiente correlación de Pearson únicamente ejecutamos la siguiente instrucción en R cor(Altura, Peso)

lo cual nos da 0.9645.

A continuación, vamos a ajustar un modelo de regresión lineal simple a un conjunto de datos en R. Suponga que el conjunto de datos proviene de una fábrica que elabora productos

![image](https://user-images.githubusercontent.com/78183885/112558748-1c566680-8d95-11eb-8713-de02d860407f.png)

Para cada caso se considera un tamaño del proceso o tamaño de la ejecución (RunSize) y un tiempo del proceso o tiempo de la ejecución (RunTime). El tamaño del proceso representa la cantidad de artículos que se fabrica en un caso determinado, el tiempo del proceso representa la cantidad de minutos que toma elaborar los artículos en el caso especificado. En los datos anteriores, el primer caso indica que para elaborar 175 artículos se requirió un tiempo de 195 minutos. El segundo caso indica que para elaborar 189 artículos se tomó un tiempo de 215 minutos. El último caso indica que, para elaborar 68 artículos, se requirió un tiempo de fabricación de 172 minutos.

Para comenzar a trabajar con los datos deberá guardarlos en su directorio de trabajo. A continuación, importe los datos a R mediante la siguiente instrucción production <- read.table("production.txt", header = TRUE), puede observar el conjunto de datos en R al ejecutar la palabra production.

Extraiga las columnas RunSize y RunTime del data frame production mediante la instrucción attach(production), es decir, de ahora en adelante podrá utilizar los vectores RunSize y RunTime en R.

Realice el gráfico de dispersión de los datos al ejecutar la siguiente instrucción

plot(RunSize, RunTime, xlab="Run Size", ylab = "Run Time")

![image](https://user-images.githubusercontent.com/78183885/112558760-224c4780-8d95-11eb-831d-abf8839dbdbf.png)

Cada punto del gráfico de dispersión representa el tamaño del proceso y el tiempo del proceso de un caso determinado.

Ajuste un modelo de regresión lineal simple a los datos en R y obtenga un resumen del modelo ajustado al ejecutar las siguientes dos instrucciones

### Ajuste el modelo

m1 <- lm(RunTime~RunSize)

summary(m1)

prueba![image](https://user-images.githubusercontent.com/78183885/112558777-2b3d1900-8d95-11eb-894f-5fadd52af605.png)

![image](https://user-images.githubusercontent.com/78183885/112558782-2ed0a000-8d95-11eb-98c0-ff8be2e69e6c.png)

![image](https://user-images.githubusercontent.com/78183885/112558790-33955400-8d95-11eb-8f9e-ba4cea4f8d9e.png)

![image](https://user-images.githubusercontent.com/78183885/112558795-37c17180-8d95-11eb-9e79-ebad920afb69.png)

![image](https://user-images.githubusercontent.com/78183885/112558798-3abc6200-8d95-11eb-93ec-6b15f3b3c65f.png)

![image](https://user-images.githubusercontent.com/78183885/112558807-3ee87f80-8d95-11eb-9248-c85daf8b979d.png)

![image](https://user-images.githubusercontent.com/78183885/112558815-43ad3380-8d95-11eb-93f5-87edef8f7c5a.png)

### Máquinas de vectores de soporte

Un enfoque para clasificación que se desarrolló en la comunidad de las ciencias computacionales en los años 90 y que ha crecido en popularidad desde entonces son las máquinas de vectores de soporte (MVS o SVM por sus siglas en inglés). Las MVS han mostrado un buen desempeño en una variedad de contextos, y frecuentemente se les considera como uno de los mejores clasificadores.

### Clasificador de margen máximo

Nuestro objetivo es desarrollar un clasificador basado en los datos de entrenamiento que clasificará una observación de prueba usando sus medidas características.

![image](https://user-images.githubusercontent.com/78183885/112558846-5293e600-8d95-11eb-976e-af0ff6706bcd.png)

En un sentido, el hiperplano de margen máximo representa la línea media del bloque más ancho que podemos insertar entre las dos clases.

Podemos calcular la distancia de cada observación de entrenamiento a un hiperplano de separación dado; la más pequeña de tales distancias es la distancia mínima de las observaciones al hiperplano y se conoce como el margen. El hiperplano de margen máximo es el hiperplano de separación para el cual el margen es el más grande-es decir, es el hiperplano que tiene la distancia mínima más lejana a las observaciones de entrenamiento-.

En un espacio p-dimensional, un hiperplano es un subespacio plano de dimensión p-1 que no necesita pasar por el origen.

En p dimensiones, un hiperplano se define por la ecuación

![image](https://user-images.githubusercontent.com/78183885/112558856-57f13080-8d95-11eb-8ce1-b4f35d701ee4.png)

Podemos pensar al hiperplano como que divide el espacio p-dimensional en dos mitades. Por ejemplo, en dos dimensiones tenemos el hiperplano

![image](https://user-images.githubusercontent.com/78183885/112558863-5aec2100-8d95-11eb-8a4b-43a793ad1638.png)

![image](https://user-images.githubusercontent.com/78183885/112558871-60e20200-8d95-11eb-9e9d-9e06b2e06cba.png)

![image](https://user-images.githubusercontent.com/78183885/112558884-65a6b600-8d95-11eb-8b5a-d6b3c7e1fd50.png)

![image](https://user-images.githubusercontent.com/78183885/112558893-693a3d00-8d95-11eb-9be2-2250dc3071b4.png)

![image](https://user-images.githubusercontent.com/78183885/112558899-6b9c9700-8d95-11eb-8a89-5409ccd18e38.png)

El hiperplano de margen máximo es la solución al problema de optimización

![image](https://user-images.githubusercontent.com/78183885/112558908-6e978780-8d95-11eb-84f2-561fa642c903.png)

sujeto a

![image](https://user-images.githubusercontent.com/78183885/112558911-71927800-8d95-11eb-9edc-3ce11180450c.png)

![image](https://user-images.githubusercontent.com/78183885/112558920-75be9580-8d95-11eb-935f-c44ba6c4bf62.png)


### El caso no separable

Podemos extender el concepto de un hiperplano de separación para desarrollar un hiperplano que casi separa las clases usando lo que se conoce como un margen suave.

![image](https://user-images.githubusercontent.com/78183885/112558936-7f47fd80-8d95-11eb-8e97-868dad6375f2.png)

### Clasificador de vectores de soporte

La distancia de una observación al hiperplano puede considerarse como una medida de nuestra confianza de que la observación se clasifica correctamente.

Podemos estar dispuestos a considerar un clasificador basado en un hiperplano que no separe perfectamente las dos clases, con el interés de

- Mayor robustez a observaciones individuales, y
- Mejor clasificación de la mayoría de las observaciones de prueba.

Es decir, podría valer la pena clasificar mal unas pocas observaciones de entrenamiento para hacer un mejor trabajo al clasificar las observaciones restantes.

Un hiperplano que casi separa las clases es la solución al problema de optimización

![image](https://user-images.githubusercontent.com/78183885/112558972-8e2eb000-8d95-11eb-9b49-11745925663a.png)

sujeto a:

![image](https://user-images.githubusercontent.com/78183885/112558984-92f36400-8d95-11eb-9727-c377ac651b73.png)

M es el ancho del margen; buscamos hacer esta cantidad tan grande como sea posible.

Una vez que hemos resuelto el problema de optimización, clasificamos una observación

de prueba `x` como antes, al simplemente determinar de que lado del hiperplano se encuentra. Es decir, clasificamos la observación de prueba basados en el signo de

![image](https://user-images.githubusercontent.com/78183885/112558991-9850ae80-8d95-11eb-9057-f0e76abb2e3c.png)

Conforme el presupuesto C se incrementa, nos volvemos más tolerantes con respecto a las violaciones al margen, y así el margen se hará ancho. Por otro lado, cuando C decrece, nos volvemos menos tolerantes a las violaciones al margen y así el margen se hace angosto.

En la práctica, C es tratada como un parámetro que generalmente se elige por medio de validación-cruzada.

**Las observaciones que se encuentran directamente sobre los márgenes o del lado incorrecto del margen considerando su clase, se conocen como vectores de soporte.**

### Clasificación con frontera de decisión no lineal

![image](https://user-images.githubusercontent.com/78183885/112559015-a999bb00-8d95-11eb-8dd7-181161196cba.png)

En el caso del clasificador de vectores de soporte, podemos tratar el problema de posibles fronteras no-lineales entre clases al ampliar el espacio de características usando funciones polinomiales cuadráticas, cúbicas, o incluso de orden superior de los predictores.

Por ejemplo, en vez de ajustar un clasificador de vectores de soporte usando p características

![image](https://user-images.githubusercontent.com/78183885/112559026-aef70580-8d95-11eb-9e6c-05d99e8b28d8.png)

podríamos ajustar un clasificador de vectores de soporte usando 2p características

![image](https://user-images.githubusercontent.com/78183885/112559034-b3bbb980-8d95-11eb-8748-010170cbba9c.png)

Entonces el problema de optimización

![image](https://user-images.githubusercontent.com/78183885/112559044-b8806d80-8d95-11eb-86e7-f970d7262e7f.png)

sujeto a

![image](https://user-images.githubusercontent.com/78183885/112559318-58d69200-8d96-11eb-87af-818c8bdd6770.png)


se convertiría en

![image](https://user-images.githubusercontent.com/78183885/112559059-c33b0280-8d95-11eb-9449-80cdf47bbde3.png)

sujeto a

![image](https://user-images.githubusercontent.com/78183885/112559069-c7672000-8d95-11eb-8dcd-b47d67babb78.png)

No es difícil ver que hay muchas maneras de ampliar el espacio de características, y que a menos que seamos cuidadosos, podríamos terminar con un número enorme de características. Entonces los cálculos serían inmanejables.

### La máquina de vectores de soporte

La máquina de vectores de soporte (SVM por sus siglas en inglés) es una extensión del clasificador de vectores de soporte que resulta de ampliar el espacio de características de una manera específica, usando kernels.

Podemos querer ampliar nuestro espacio de características para acomodar una frontera no-lineal entre las clases. El enfoque del kernel que describimos aquí es simplemente un enfoque computacional eficiente para llevar a cabo esta idea.

![image](https://user-images.githubusercontent.com/78183885/112559084-d221b500-8d95-11eb-8fb9-801f3dc56224.png)

Puede demostrarse que

1. El clasificador de vectores de soporte lineal se puede representar como

![image](https://user-images.githubusercontent.com/78183885/112559106-dcdc4a00-8d95-11eb-90d6-3093b7bfe733.png)

donde hay n parámetros i, i=1,⋯,n, uno por observación de entrenamiento.

![image](https://user-images.githubusercontent.com/78183885/112559113-e1a0fe00-8d95-11eb-8cdf-205b295d521c.png)

### Kernel

Un kernel es una función que cuantifica la similaridad de dos observaciones

### Kernel lineal

![image](https://user-images.githubusercontent.com/78183885/112559149-f7162800-8d95-11eb-9bc4-b1e3e34c07e6.png)

### Kernel polinomial

![image](https://user-images.githubusercontent.com/78183885/112559154-faa9af00-8d95-11eb-9751-2ee2553ee38f.png)

Cuando el clasificador de vectores de soporte se combina con un kernel no-lineal, el clasificador que resulta se conoce como una máquina de vectores de soporte.

En este caso la función tiene la forma

![image](https://user-images.githubusercontent.com/78183885/112559159-ff6e6300-8d95-11eb-9b66-f166589e016d.png)

### Kernel radial

![image](https://user-images.githubusercontent.com/78183885/112559174-05fcda80-8d96-11eb-9750-27d5585fa8be.png)

Comportamiento local del kernel radial

![image](https://user-images.githubusercontent.com/78183885/112559182-0a28f800-8d96-11eb-8c4c-8c312bc20838.png)

### Clasificación con frontera de decisión no lineal

![image](https://user-images.githubusercontent.com/78183885/112559196-12813300-8d96-11eb-9567-ed8a01e100c8.png)

¿Cuál es la ventaja de usar un kernel en lugar de simplemente ampliar el espacio de características usando funciones de las características originales?

![image](https://user-images.githubusercontent.com/78183885/112559212-17de7d80-8d96-11eb-8cf2-94b74fe2c0fe.png)
