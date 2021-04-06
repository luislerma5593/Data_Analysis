# Prework

## Ejemplos de series de tiempo y técnicas descriptivas

Las series de tiempo son analizadas para entender el pasado y para predecir el futuro, permitiendo a los administradores o creadores de políticas tomar decisiones informadas propiamente.

Cuando una variable es medida secuencialmente en el tiempo durante o en un intervalo fijo, conocido como el intervalo de muestreo, los datos que resultan forman una serie de tiempo.

El número de reservas de pasajeros internacionales (en miles) por mes en una aerolínea (Pan Am) en los Estados Unidos fue obtenida de la Administración de Aviación Federal para el periodo 1949-1960 (Brown, 1963). La compañía usó los datos para predecir la demanda futura antes de ordenar nuevos aviones y tripulación de entrenamiento.

![image](https://user-images.githubusercontent.com/78183885/113787330-71349e00-9700-11eb-8635-1e66d009bb04.png)

![image](https://user-images.githubusercontent.com/78183885/113787338-7396f800-9700-11eb-8828-dda1af29df86.png)


### Tendencia 
En general, un cambio sistemático en una serie de tiempo que no parece ser periódica es conocida como una tendencia.

### Variación estacional
Un patrón que se repite dentro de cada año es conocido como variación estacional, aunque el término es aplicado más generalmente para patrones que se repiten dentro de cualquier periodo fijo.

### Ciclos
A veces podemos afirmar que hay ciclos en una serie de tiempo que no corresponden a algún periodo natural fijo.

### Pronósticos
Los `pronósticos` confían en la extrapolación, y los pronósticos están generalmente basados en la suposición de que las tendencias presentes continuarán. No podemos verificar esta suposición en alguna forma empírica, pero si podemos identificar causas probables para una tendencia, podemos justificar extrapolarla, por algunos pocos pasos en el tiempo al menos.

Un pronóstico es un valor futuro que se predice, y el número de pasos de tiempo hacia el futuro es el tiempo de espera (k).

Hay varias formas para estimar la tendencia mt al tiempo t, pero un procedimiento relativamente simple, el cual está disponible en R y no asume ninguna forma específica es calcular un promedio móvil centrado en xt.

La longitud de pronósticos promedio móvil es elegida para promediar los efectos estacionales, los cuales pueden ser estimados después.

Un segundo algoritmo de suavizamiento ofrecido por R es ***stl***. Este usa una técnica de regresión ponderada localmente conocida como loess.

Procedimientos de suavizamiento tales como el promedio móvil centrado y loess no requieren un modelo predeterminado, pero no producen una fórmula que pueda ser extrapolada para dar pronósticos

En R, la función ***decompose*** estima tendencias y efectos estacionales usando un método de promedio móvil.

![image](https://user-images.githubusercontent.com/78183885/113787623-fa4bd500-9700-11eb-959d-a0183c64737a.png)

### Modelos estocásticos básicos, modelos estacionarios y predicción

![image](https://user-images.githubusercontent.com/78183885/113787656-0cc60e80-9701-11eb-9b96-14374f39bc97.png)

![image](https://user-images.githubusercontent.com/78183885/113787664-0fc0ff00-9701-11eb-9565-a364d97389b8.png)

![image](https://user-images.githubusercontent.com/78183885/113787670-13548600-9701-11eb-8ef8-6ac84b85f1d8.png)

![image](https://user-images.githubusercontent.com/78183885/113787690-1c455780-9701-11eb-8964-34e2ecafc7c5.png)

![image](https://user-images.githubusercontent.com/78183885/113787699-1f404800-9701-11eb-865e-6a5a9079e1ba.png)

![image](https://user-images.githubusercontent.com/78183885/113787710-22d3cf00-9701-11eb-8f3c-39142e8564fc.png)

![image](https://user-images.githubusercontent.com/78183885/113787722-26675600-9701-11eb-8936-52860e19caf0.png)

![image](https://user-images.githubusercontent.com/78183885/113787727-2a937380-9701-11eb-9399-c7134ec0c460.png)

### La función de autocovarianza sólo identifica un único proceso MA(q) si la condición de que el proceso sea invertible es impuesta.

![image](https://user-images.githubusercontent.com/78183885/113787739-31ba8180-9701-11eb-84b6-4dbe7b14e018.png)

![image](https://user-images.githubusercontent.com/78183885/113787749-354e0880-9701-11eb-8e5f-0cc286e184ac.png)

### Modelos no estacionarios y predicción

![image](https://user-images.githubusercontent.com/78183885/113787774-4139ca80-9701-11eb-827b-90af9ed9489a.png)

![image](https://user-images.githubusercontent.com/78183885/113787793-4a2a9c00-9701-11eb-8901-25160c8bfe19.png)
