# Prework

## Introducción

En este prework, conocerás algunas definiciones y resultados importantes de la estadística inferencial. En el work trabajarás con datos simulados y los cálculos serán muy rápidos y fáciles de hacer con algunas funciones de R. Con los ejemplos que estudiarás durante la sesión del work, lograrás una mayor comprensión de estos resultados.


## Distribuciones binomial, normal y t de Student

### Distribución binomial.

`Definición` Un experimento binomial presenta las siguientes propiedades:

- Consiste en un número fijo, n, de pruebas idénticas.
- Cada prueba resulta en uno de dos resultados: éxito, S, o fracaso, F.
- La probabilidad de éxito en una sola prueba es igual a algún valor p y es la misma de una prueba a la otra. La probabilidad de fracaso es igual a q = (1-p).
- Las pruebas son independientes.
- La variable aleatoria (v.a. discreta) de interés es Y, el número de éxitos observado durante las n pruebas.

`Definición` Se dice que una variable aleatoria Y tiene una distribución binomial basada en n pruebas con probabilidad p de éxito si y sólo si

![image](https://user-images.githubusercontent.com/78183885/111713371-18669980-8815-11eb-8b0e-9e25b4865c04.png)

y

![image](https://user-images.githubusercontent.com/78183885/111713377-1e5c7a80-8815-11eb-8be0-ea53e9bda554.png)

### Distribución normal

Las funciones de densidad de probabilidad (de variables aleatorias continuas) cumplen con algunas propiedades:

- El área bajo la curva de la función de densidad de probabilidad es igual a 1
- La probabilidad de que X se encuentre en determinado intervalo (a, b) es igual al área bajo la curva entre los puntos a y b.
- P(X = c) = 0 para cualquier valor c para el que se encuentre definida la función de densidad.

![image](https://user-images.githubusercontent.com/78183885/111713386-26b4b580-8815-11eb-8e46-29ab06b9e27d.png)

![image](https://user-images.githubusercontent.com/78183885/111713408-2caa9680-8815-11eb-840d-9105e02cdf63.png)

![image](https://user-images.githubusercontent.com/78183885/111713417-3207e100-8815-11eb-9814-88b65fe85e43.png)

### Distribución t de Student

La función de densidad t de Student se define como

![image](https://user-images.githubusercontent.com/78183885/111713432-37fdc200-8815-11eb-97b1-28541dad7416.png)

donde `-∞<t<∞` y `(la letra griega nu)`, representa el parámetro de la distribución t llamado grados de libertad y es la función Gamma.

![image](https://user-images.githubusercontent.com/78183885/111713442-3cc27600-8815-11eb-890f-962862e9e21e.png)

### Teorema central del límite

Sean Y1, Y2,…, Yn variables aleatorias independientes y distribuidas idénticamente con E(Yi)= y VYi=2<∞. 
Definamos

![image](https://user-images.githubusercontent.com/78183885/111713448-41872a00-8815-11eb-9679-5f6333ca411b.png)

![image](https://user-images.githubusercontent.com/78183885/111713457-45b34780-8815-11eb-9c65-5c64b28d45e7.png)

![image](https://user-images.githubusercontent.com/78183885/111713465-4946ce80-8815-11eb-8a30-4f7d6e8bd1bd.png)

![image](https://user-images.githubusercontent.com/78183885/111713472-4d72ec00-8815-11eb-9d10-48c7793fab1a.png)

Para toda u.

![image](https://user-images.githubusercontent.com/78183885/111713482-56fc5400-8815-11eb-9ea4-cd8908de958a.png)


## Algunos estimadores puntuales insesgados comunes

Un `estimador` es una regla, a menudo expresada como una fórmula, que indica cómo calcular el valor de una estimación con base en las mediciones contenidas en una muestra.

![image](https://user-images.githubusercontent.com/78183885/111713496-5d8acb80-8815-11eb-945e-960b9bd1b056.png)

![image](https://user-images.githubusercontent.com/78183885/111713502-61b6e900-8815-11eb-916a-81647d8fd43f.png)


## Contraste de hipótesis

### Los elementos de un contraste de hipótesis

- Hipótesis nula, H0
- Hipótesis alternativa, Ha
- Estadístico de prueba
- Región de rechazo

`Nota`: También llamaremos prueba de hipótesis a un contraste de hipótesis, sin caer en discusiones formales. Buscamos decidirnos por una de las hipótesis y no estamos exentos de cometer errores.

![image](https://user-images.githubusercontent.com/78183885/111713517-6e3b4180-8815-11eb-9887-6e27110e226a.png)

![image](https://user-images.githubusercontent.com/78183885/111713525-71cec880-8815-11eb-855c-2cab3260c0e6.png)

### Contrastes comunes con muestras grandes

Suponga que deseamos contrastar un conjunto de hipótesis respecto a un parámetro con base a una muestra aleatoria Y1, Y2, …, Yn. En esta sección desarrollaremos procedimientos de contrastes de hipótesis que están basados en un estimador que tiene una distribución muestral normal (aproximadamente) con media y error estándar .

Si 0 es un valor específico de , podemos probar H0: θ=0 contra Ha: θ>0. En este caso, las hipótesis nula y alternativa, el estadístico de prueba y la región de rechazo son como sigue:

![image](https://user-images.githubusercontent.com/78183885/111713539-7bf0c700-8815-11eb-8979-0092bc3ad90d.png)

![image](https://user-images.githubusercontent.com/78183885/111713547-801ce480-8815-11eb-8370-f5e0e916465b.png)

![image](https://user-images.githubusercontent.com/78183885/111713564-86ab5c00-8815-11eb-9310-b06cc8b99a55.png)

### Contrastes de hipótesis de nivel para muestras grandes

![image](https://user-images.githubusercontent.com/78183885/111713603-94f97800-8815-11eb-8ea8-384aff8e9f80.png)

![image](https://user-images.githubusercontent.com/78183885/111713596-91fe8780-8815-11eb-8113-f12b9184a363.png)

¿Cómo decidir cuál hipótesis alternativa usar para una prueba? La respuesta depende de la hipótesis que pretendemos apoyar. Si estamos interesados sólo en detectar un aumento en el porcentaje de piezas defectuosas, por ejemplo, debemos localizar la región de rechazo en la cola superior de la distribución normal estándar. Por otra parte, si deseamos detectar un cambio en p ya sea arriba o debajo de p=0.10, debemos localizar la región de rechazo en ambas colas de la distribución normal estándar y emplear una prueba de dos colas.

![image](https://user-images.githubusercontent.com/78183885/111713622-9cb91c80-8815-11eb-8819-6e78a5ba9d4c.png)

![image](https://user-images.githubusercontent.com/78183885/111713630-a3479400-8815-11eb-9ade-46b321c4734c.png)

![image](https://user-images.githubusercontent.com/78183885/111713681-b8bcbe00-8815-11eb-84d0-6dccf09bf06c.png)

![image](https://user-images.githubusercontent.com/78183885/111713701-c40fe980-8815-11eb-9f92-e7440f4472bc.png)
