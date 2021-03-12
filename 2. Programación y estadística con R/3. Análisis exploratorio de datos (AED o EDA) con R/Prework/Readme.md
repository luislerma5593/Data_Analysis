# Prework

## Introducción

Un diagrama de dispersión, gráfica de dispersión o gráfico de burbujas es un tipo de diagrama matemático que utiliza las coordenadas cartesianas para mostrar los valores de dos variables para un conjunto de datos1​.

Un diagrama de dispersión, gráfica de dispersión o gráfico de burbujas es un tipo de diagrama matemático que utiliza las coordenadas cartesianas para mostrar los valores de dos variables para un conjunto de datos1​.

## Gráficos de dispersión

Los diagramas de dispersión son útiles para reconocer tendencias en datos, cuando estos son graficados en puntos, se deben tomar dos variables de tipo cuantitativo, a continuación, se presenta una imagen donde se pueden observar dos tipos de correlación que generalmente son de interés. Cuando se trata de una alta dispersión se puede suponer que la correlación es cercana a cero, y cuando tenemos poca dispersión se puede deber a correlaciones cercanas a 1 o a -1, sin embargo puede existir poca dispersión si los datos se aglomeran en clusters de información, es decir los datos están muy “compactados”, la correlación puede obtenerse mediante el comando cor().

![image](https://user-images.githubusercontent.com/78183885/110873824-34f45600-8298-11eb-88dc-c122bac7fd81.png)

![image](https://user-images.githubusercontent.com/78183885/110873831-37ef4680-8298-11eb-8459-07ce4a185b40.png)

La ilustración 1 es una correlación negativa, esto sucede cuando una variable crece (en este caso eje de las “x”) y la otra disminuye (eje de la “y”). Para el caso de la ilustración 2, se representa una correlación positiva, cuando una variable crece (eje “x”), la otra también lo hace (eje “y”). Puede suceder que no se pueda reconocer un patrón específico, esto también es útil ya que indica que las variables no tienen una correlación o que esta no es tan fácil de determinar visualmente debido a que su coeficiente de correlación es muy bajo.

![image](https://user-images.githubusercontent.com/78183885/110873854-3faeeb00-8298-11eb-88aa-63de137dae0d.png)

El comando en R para realizar un gráfico de dispersión es: plot(var1, var2, ...)

 ## Boxplots y outliers
 
También conocido como diagrama de caja y bigote, box plot, box-plot o boxplot. Es un método estandarizado para representar gráficamente una serie de datos numéricos a través de sus cuartiles (1ero; 25%, 2do; 50%, 3ro; 75%) . El máximo interés del box-plot es visualizar la distribución de una variable numérica de la manera más simplificada posible. Sólo utiliza los valores de los cuartiles, los extremos (q1 - 1.5IQR y q3 + 1.5IQR) y valores raros o outliers. No depende de valores ponderados como la media. Simplemente se fija en las características de la posición. El diagrama siguiente será de mucha utilidad para comprenderlos. En R se utiliza el comando boxplot para graficarlos.

![image](https://user-images.githubusercontent.com/78183885/110873883-489fbc80-8298-11eb-93b3-5443e57f83cb.png)

## Histogramas

Es una gráfica de la distribución de un conjunto de datos. Es un tipo especial de gráfica de barras, en la cual una barra va pegada a la otra, es decir no hay espacio entre las barras. Cada barra representa un subconjunto de los datos. Un histograma muestra la acumulación ó tendencia, la variabilidad o dispersión y la forma de la distribución. Un histograma es una gráfica adecuada para representar variables continuas, aunque también se puede usar para variables discretas. Es decir, mediante un histograma se puede mostrar gráficamente la distribución de una variable cuantitativa o numérica. Los datos se deben agrupar en intervalos de igual tamaño, llamados clases.

![image](https://user-images.githubusercontent.com/78183885/110873895-4dfd0700-8298-11eb-92ea-8a630d87aba2.png)

![image](https://user-images.githubusercontent.com/78183885/110873904-51908e00-8298-11eb-91d6-81a30f7f0cb2.png)

![image](https://user-images.githubusercontent.com/78183885/110873911-55bcab80-8298-11eb-9d47-73fbb08a2be2.png)

Se grafican en el eje de las X las clases y en el eje Y las frecuencias de nuestros datos entonces de ese modo obtenemos el histograma, que es la representación visual de la distribución de frecuencias.

Para realizar un boxplot se utiliza el comando en R: Boxplot(var1, var2,...)

## Series de tiempo

Es un conjunto de valores observados durante una serie de periodos temporales, secuencialmente ordenada. Son variables estadísticas bidimensionales en donde el tiempo es la variable independiente, y la otra es la variable dependiente.

Se construyen modelos de series de tiempo para:
- Obtención del mecanismo
- Estudio de su evolución futura o predicción.

Se realiza:

- Analizando los componentes o factores que determinan los resultados de la información.

El método clásico para el análisis de series de tiempo identifica cuatro componentes:

- TENDENCIA (T).- El movimiento general a largo plazo de los valores de la serie de tiempo (Y) sobre un extenso periodo de años.
- FLUCTUACIONES CÍCLICAS (C).- Movimientos ascendentes y descendentes respecto de las tendencias recurrentes, con una duración de varios años.
- VARIACIONES ESTACIONALES (E).- Movimientos ascendentes y descendentes respecto de la tendencia que se consuman en el término de un año y se repiten anualmente, estas variaciones suelen identificarse con base en datos mensuales o trimestrales.
- VARIACIONES IRREGULARES (I).- Las variaciones erráticas respecto de la tendencia que no puedan atribuirse a las influencias cíclicas o estacionales. A continuación, se muestran las partes de una serie de tiempo.

![image](https://user-images.githubusercontent.com/78183885/110873922-5f461380-8298-11eb-89c1-5651f1ead7ac.png)

Existe la descomposición aditiva y multiplicativa las cuales ayudan a entender el comportamiento de la serie de tiempo.

Para realizar las series de tiempo se utilizará el comando ts()
