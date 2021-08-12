## Módulo: Machine Learning 2020

### Objetivo: 
Identificar, seleccionar, construir e implementar algoritmos de Machine Learning con Python, con el objetivo de identificar si un problema amerita utilizar Machine Learning, seleccionar el mejor algoritmo, construirlo, implementarlo y probar su eficacia.  

### Organización del módulo:

 - [Sesión 1: Introducción a Machine Learning ](./Sesion-01)

 - [Sesión 2: Separación, validación y evaluación para algoritmos de ML ](./Sesion-02)

 - [Sesión 3: Algoritmos no supervisados ](./Sesion-03)

 - [Sesión 4: Problemas de regresión ](./Sesion-04)

 - [Sesión 5: Árboles de decisión ](./Sesion-05)

 - [Sesión 6: Clasificación y Redes Neuronales Artificiales ](./Sesion-06)

 - [Sesión 7: Arena de Clasificadores ](./Sesion-07)

 - [Sesión 8: Fundamentos de procesamiento de imágenes ](./Sesion-08)

---

## Apuntes principales

## Clusterización / Agrupación (No supervisado)

- Kmeans 
- Kmedias


## Técnica de reduccion de dimensiones (No supervisado)

- Análisis de componentes principales


## Clasificación (Supervisado)

- Árboles de decisión 
- Bosques aleatorios (Cuando se puede usar un if/else, es decir, cuando hay una o varias condicionales. Además de cuando hay correlación entre variables y hay relación con la salida)
- Redes neuronales artificiales (Cuando variables de entrada no tienen relación con la salida)
- Máquinas de soporte vectorial (Support Vector Machine)
- Teorema ingenuo de Bayes (Naive Bayes)


## Predicción (Supervisado)

- Regresión lineal
- Regresión lineal múltiple
- Regresión polinominal
- Regresión con series de tiempo

---

### Transformaciones

Adicionalmente, importamos la función "StandardScaler" que nos será útil para estandarizar nuestros datos. Este paso es fundamental cuando van a utilizarse modelos de machine learning que se construyen sobre supuestos en la distribución de los datos, como puede ser la regresión logística y el clasificador ingenuo de Bayes. Modelos como las máquinas de soporte vectorial, los árboles de decisión o las redes neuronales no tienen este tipo de supuestos, sin embargo, ayuda mucho a agilizar el proceso.

Otras técnicas de preprocesamiento son la normalización y la transformación logarítmica; te invito a que las investigues.

---

La clasificación de spearman, se debe usar para aplicaciones de clasificación y hay variables cualitiativas

Regresión → Pearson
Clasificación → Spearman

#### Investigar 

- Preprocesamiento de datos
- Análisis de componentes principales
- Transformación a valor Z
- Transformaciones → normalización y la transformación logarítmica
- Power Transformer
- Standar Scaler
