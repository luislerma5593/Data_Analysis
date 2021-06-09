DATA ANALYSIS

==================================================================
```py
GENERAL

df['glucose'].sample(n=20, replace=False) - Obtener una muestra (se puede usar frac)


from scipy import stats

stats.trim_mean(df['price'], 0.1) - Calcula la media truncada, quitando el 10% de los datos


PANDAS

x.mean() - Promedio
x.median() - Mediana
x.std() - Desviación estándar muestral
pd.cut(prices, 20) - Para poder obtener rangos de una serie
df['price'].groupby(segmentos).count() - Agrupar por los rangos

#  NUMPY

np.random.normal(loc=0, scale=5, size=10000) - Generar datos con distribucion normal 
np.random.exponential(scale=1.0, size=10000) - Generar datos con distribución exponencial
np.random.uniform(low=-1, high=0, size=10000) - Generar datos con distribución uniforme

- from scipy.stats import skew, kurtosis

kurtosis(normal) - Obtener curtosis (Pos es achatada, alta y delgada)
skew(normal) - Obtener asimetría (Pos es cola larga a la derecha)


## SERIES

df['COL'].quantile(0.8) - Obtener los cuantiles de un conjunto de datos
df[col].value_counts() - Contar el número de ocurrencias 
col.nunique() - Entrega el número de valores posibles
arr_1_1.corr(arr_1_2) - Obtener correlación

## Filtro con boxplots

iqr_insulin = df_no_zeros['insulin'].quantile(0.75) - df_no_zeros['insulin'].quantile(0.25)
filter_upper_outliers = df_no_zeros['insulin'] < (df_no_zeros['insulin'].quantile(0.75) + iqr_insulin * 1.5)
df_insulin_no_outliers = df_no_zeros[filter_upper_outliers]


## Matriz de correlaciones y heatmap

df_filtered.corr()
plt.figure(figsize=(8, 6))
ax = sns.heatmap(df_filtered.corr(), vmin=-1, vmax=1, annot=True, cmap="YlGnBu", linewidths=.5);


# VISUALIZACIONES

- http://seaborn.pydata.org/tutorial/aesthetics.htmlgrid

import seaborn as sns
import matplotlib.pyplot as plt


## SEABORN

plt.figure(figsize=(5, 10)) - Definir el tamaño de una figura
sns.set(style="whitegrid") - Agregar un tema
sns.boxplot(x=df['price']) - Graficar un boxplot
sns.jointplot(df_2['age'], df_2['weight'], kind='hex'); - Generar un jointplot
sns.pairplot(no_zeros); - Generar un pairplot
sns.lineplot(data=serie_3) - Graficar una linea

sns.distplot(df['price'], kde=False, norm_hist=False, bins=20, kde_kws = {'shade': True})  - Histograma / gráfica de densidad

kde - Densidad
hist - Barras de histograma
bins - Número de barras
kde_kws = {'shade': True} - Agregar sombra

### Títulos  y etiquetas para una gráfica 

ax = sns.distplot(df['age'], kde=False, norm_hist=False)
ax.set(title='Edades de atletas que participaron en los Juegos Olímpicos', xlabel='edad', ylabel='conteo');


### Dos gráicas con una leyenda 

ax = sns.distplot(males['height'], hist=False, kde_kws = {'shade': True}, label='hombres')
sns.distplot(females['height'], hist=False, kde_kws = {'shade': True}, ax=ax, label='mujeres')
ax.set_title('Distribuciones de alturas de atletas masculinos y femeninos', fontsize=13, pad=15);
ax.set(xlabel='altura');
ax.legend(loc='upper right');


### Gráfica de barras

counts = df['user_rating'].value_counts()
ax = sns.barplot(counts.index, counts)
ax.set_title('Conteo de Ratings de restaurantes')
ax.set(ylabel='count');


### Rotar etiquetas eje x

ax = sns.barplot(as_percentages.index, as_percentages)
ax.set_title('Conteo de Ratings de restaurantes(como porcentajes)')
ax.set(ylabel='porcentaje del total')
ax.set_xticklabels(ax.get_xticklabels(), rotation=50);


### Gráfica de barras horizontales

ax = sns.barplot(as_percentages, as_percentages.index, orient='h')
ax.set_title('Conteo de Ratings de restaurantes(como porcentajes)')
ax.set(xlabel='porcentaje del total');


### Ordernar gráfico de barras

sns.barplot(rooms.index, rooms, order = rooms.index)


### Tablas de contingencia

pd.crosstab(df['price_range'], df['user_rating'])

pd.crosstab(df['price_range'], df['user_rating'], margins=True, margins_name='Total') - Con totales

### Con múltiples niveles

pd.crosstab(df['price_range'], [df['has_online_delivery'], df['user_rating']]) - Observar que el segundo elemento es una lista


### Convertir una ciolumna en índice 

crosstab.stack(level=0)


### Imprimir un lienzo con distintas gráficas

fig, axes = plt.subplots(2, 2, figsize=(10, 8), sharex=True, sharey=True)

sns.barplot(crosstab.columns, crosstab.loc[1], ax=axes[0, 0])
sns.barplot(crosstab.columns, crosstab.loc[2], ax=axes[0, 1])
sns.barplot(crosstab.columns, crosstab.loc[3], ax=axes[1, 0])
sns.barplot(crosstab.columns, crosstab.loc[4], ax=axes[1, 1])

axes[0, 0].set(xlabel='', ylabel='', title='Rango de Precio: 1')
axes[0, 1].set(xlabel='', ylabel='', title='Rango de Precio: 2')
axes[1, 0].set(xlabel='', ylabel='', title='Rango de Precio: 3')
axes[1, 1].set(xlabel='', ylabel='', title='Rango de Precio: 4')

fig.suptitle('Ratings de restaurantes separados por rango de precio', fontsize=15);


### Una figura con dos gráficas

plt.figure(figsize=(5, 10))
sns.boxplot(data=merged, x='sex', y='weight'); - 


## MATPLOTLIB

plt.scatter(arr_1_1, arr_1_2, c='m'); - Graficar un scatterplot
plt.plot(arr_1_1, arr_1_2, c='b'); - Graficar una línea
plt.axvline(df['price'].mean(), c='y') - Graficar una linea vertical (Color amarillo)


### Filtro con un boxplot

```py
iqr = df['price'].quantile(0.75) - df['price'].quantile(0.25)
filtro_inferior = df['price'] > df['price'].quantile(0.25) - (iqr * 1.5)
filtro_superior = df['price'] < df['price'].quantile(0.75) + (iqr * 1.5)

df_filtrado = df[filtro_inferior & filtro_superior]
sns.boxplot(df_filtrado['price'])
```


## Modelo de regresión lineal simple

from sklearn.linear_model import LinearRegression

lr = LinearRegression()

# Usamos `to_frame` para convertir nuestra Serie en una estructura de 2 dimensiones, como lo requiere el modelo
lr.fit(serie_1.to_frame(), serie_2)

y_predict = lr.predict(serie_1.to_frame())
y_predict

sns.scatterplot(serie_1, serie_2, s=40);
sns.scatterplot(serie_1, y_predict, s=25);

sns.scatterplot(serie_1, serie_2, s=40);
sns.scatterplot(serie_1, y_predict, s=25);

for i in range(len(serie_1)):
    plt.plot([serie_1[i], serie_1[i]], [serie_2[i], y_predict[i]], 'g--')

sns.scatterplot(serie_1, serie_2, s=40);
sns.lineplot(serie_1, y_predict, color='#FF7F0E');

-- Coeficientes

intercept = lr.intercept_ --b
coefficient = lr.coef_[0] --m

-- Ecuación de la recta

print(f'y = {coefficient} * x + {intercept}')

-- Obtener R2

print(f'R2: {np.power(serie_1.corr(serie_2), 2)}')
print(f'R2: {np.power(serie_1.corr(serie_2), 2)}') -- Otra opción


## Modelo de regresión lineal múltiples














---

## Estadística inferencial

### Obtener intervalos de confianza 

limite_inferior = serie_means.quantile(0.025)
limite_superior = serie_means.quantile(0.975)

```


C:/Users/LLerma/Google Drive/Analisis de Datos/M3 - Introduccion a Python/Files/xxxxx

https://github.com/beduExpert/B1-Procesamiento-de-Datos-con-Python-2020 
