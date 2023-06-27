# Data Science

https://www.forbes.com/sites/brentdykes/2022/01/12/data-analytics-marathon-why-your-organization-must-focus-on-the-finish/?sh=702b7ca03c3b

## Pasos de un proyecto

1. Identificación de un problema
2. Planteamiento de preguntas
3. Colección de datos
4. Análisis exploratorio de datos
5. Limpieza de datos y agregaciones
6. Automatización y APIs
7. Transformación, filtración y ordenamiento de datos

## Data Science Process

1. Raw Data
2. Data processing
3. Clean Dataset
4. EDA
5. Models & Algorithms
6. Reports
7. Decision Making

## Limpieza de datos

- Quitar columnas que no sirven al análisis 
- Limpiar las columnas con demasiados nans
- Con isna().sum(), ver qué campos se pueden llenar con datos como 0 o "Unknown"
- Separa columnas si es necesario
- Castear
- Manipulación / Transformación de strigns
- Filtros
- Sort by

---

## Exploratory Data Analysis

1. Summary statistics
    - df.describe()
    - df.info()

2. Visualization
    - Histograms, plots, boxplots.
    - Remove outliers if necessary.

3. Correlations
    - df.corr() for the correlation matrix
    - Scatterplots

--- 

## Prediction(Regression)

- Get x and y variables
- Split in train and test
- Train model
- Predict
   
## Data preparation for Classification and Clustering
- Preprocess Data
- PowerTransform
    
## Classification
- Preprocess Data
- PowerTransform
- Get x and y variables
- Split in train and test
- Search parameters
    - RandomizedSearchCV
    - GridSearchCV        
- Train model
- Predict
- Evaluate model
- Confusion Matrix

## Clustering

1. Preprocess data (StandardScaler)
2. Look for optimal clusters
3. Train model
4. Assign to cluster

---
    
## Storytelling con los datos

Storytelling

1. Saber analizar datos
2. Saber crear visualizaciones correctas
3. Narrativa de la historia

```
Se puede observar como han ido aumentando los nuevos suscriptores por trimestre, y los úlitmos tres trimestres son los que nos importa analizar.
Son los nuevos clientes que surgieron durante la pandemia y varía por regiones.
```

- https://www.youtube.com/watch?v=ihltOyKn9I0

![image](https://user-images.githubusercontent.com/78183885/129826387-d1479726-fc67-4aec-aede-9da1e97d83fb.png)

## Convencer para entrar en acción

1. Situación
2. ¿Por qué ha cambiado?
3. ¿Cuál es la evidencia?
4. ¿Qué pasa si no hacemos nada?
5. ¿Qué acciones podemos tomar?

## Preprocesamiento de datos 

- https://scikit-learn.org/stable/auto_examples/preprocessing/plot_scaling_importance.html

* Siempre es útil estandarizar las variables para métodos no supervisados

Adicionalmente, importamos la función "StandardScaler" que nos será útil para estandarizar nuestros datos. Este paso es fundamental cuando van a utilizarse modelos de machine learning que se construyen sobre supuestos en la distribución de los datos, como puede ser la regresión logística y el clasificador ingenuo de Bayes. Modelos como las máquinas de soporte vectorial, los árboles de decisión o las redes neuronales no tienen este tipo de supuestos, sin embargo, ayuda mucho a agilizar el proceso.

Otras técnicas de preprocesamiento son la normalización y la transformación logarítmica; te invito a que las investigues.


* MinMaxScaler() - Sustrae el mínimo y luego se divide en6tre el rango. Se usa como primera opción salvo que se necesiten características específicas.
* RobustScaler() - Sustrae la media y divide entre el rango intercuartil. Se usa cuando tenemos datos atípicos y no deseamos que tengan mucha influencia.
* StandardScaler() - Sustrae la media y luego escala a la unidad de vaarianza (std), y la media de la distribución es 0, y std=1. Se usa cuando se requiere una distribución normal.
* Normalizer() - Trabaja en filas, no en columnas y se usa normalización L2 (Euclidiana) por default. Transforma los valores entre -1 y 1.

## Tabla ANOVA

Se puede usar cuando se tiene una variable cuantitativa en función de una variable cualtiativa (categórica).

- Nos ayuda a comparar medias de grupos
- Para comparar las medias, debemos:
  -  Calcular intervalos de confianza
  -  Gráficos de diagramas de error y diagramas de caja
  -  Calcular ANOVA. Si el valor p < 0.05, existen diferencias significativas en uno de los grupos

## Clusterización / Agrupación (No supervisado)

- Kmeans 

## Técnica de reduccion de dimensiones (No supervisado)

- PCA (Principal Component Analysis)
- Correlation with target
- Tree-based
- LASSO Regression

## Clasificación (Supervisado)

- Árboles de decisión 
- Bosques aleatorios (Cuando se puede usar un if/else, es decir, cuando hay una o varias condicionales. Además de cuando hay correlación entre variables y hay relación con la salida)
- Redes neuronales artificiales (Cuando variables de entrada no tienen relación con la salida)
- Máquinas de soporte vectorial (Support Vector Machine)
- Teorema ingenuo de Bayes (Naive Bayes)
- Regresión logística
- KNeighborsClassifier (KNN)

## Predicción (Supervisado)

- Regresión lineal
- Regresión lineal múltiple
- Regresión polinominal
- Regresión con series de tiempo
