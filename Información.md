# Data Science

## Pasos de un proyecto

1. Identificación de un problema
2. Planteamiento de preguntas
3. Colección de datos
4. Análisis exploratorio de datos
5. Limpieza de datos y agregaciones
6. Automatización y APIs
7. Transformación, filtración y ordenamiento de datos

## Exploratory Data Analysis

1. Summary statistics
    - df.describe()

2. Visualization
    - Histograms, plos, boxplots.

3. Correlations
    - df.corr() for the correlation matrix

4. Data preparation
    - Exploration with scatterplots

## Limpieza de datos

- Limpiar las columnas con demasiados nans
- Con isna().sum(), ver qué campos se pueden llenar con datos como 0 o "Unknown"
- Separa columnas si es necesario
- Castear
- Manipulación / Transformación de strigns
- Filtros
- Sort by

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


## Tabla ANOVA

Se puede usar cuando se tiene una variable cuantitativa en función de una variable cualtiativa (categórica).

- Nos ayuda a comparar medias de grupos
- Para comparar las medias, debemos:
  -  Calcular intervalos de confianza
  -  Gráficos de diagramas de error y diagramas de caja
  -  Calcular ANOVA. Si el valor p < 0.05, existen diferencias significativas en uno de los grupos


