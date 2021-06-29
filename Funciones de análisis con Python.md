DATA ANALYSIS

---

GENERAL

```py

df['glucose'].sample(n=20, replace=False) - Obtener una muestra (se puede usar frac)
df['diagnosis'] = df['diagnosis'].apply(lambda x: 1 if x == 'M' else 0) - Modificación de una columna

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
```

## VISUALIZACIONES


- http://seaborn.pydata.org/tutorial/aesthetics.htmlgrid

```py
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

```py
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


 ///////////////////////////AGREGAR A PARTIR DE AQUÍ ///////////////////////////


## Modelo de regresión lineal múltiples (Entrenamiento y prueba)

from sklearn.model_selection import train_test_split
X = df[['glucose', 'skin_thickness']]
y = df['insulin']
X_training, X_test, y_training, y_test = train_test_split(X, y, test_size=0.3, shuffle=True)
from sklearn.linear_model import LinearRegression
lr = LinearRegression()
lr.fit(X_training, y_training)
lr.score(X_test, y_test)

## Modelo de regresión lineal múltiples (Validación cruzada)
X = df[['glucose', 'skin_thickness']]
y = df['insulin']

from sklearn.model_selection import cross_validate
from sklearn.linear_model import LinearRegression

lr = LinearRegression()

scores = cross_validate(lr, X, y, scoring='r2', cv = 10)
scores

print(f'Score del modelo: {scores["test_score"].mean():.3f} +/- {scores["test_score"].std():.3f}')
```

## Visualización de datos avanzada

```py
## Tipos de estilo

https://seaborn.pydata.org/tutorial/aesthetics.html
https://matplotlib.org/3.2.1/gallery/style_sheets/style_sheets_reference.html

sns.set_style('white')
sns.set_style('whitegrid')
sns.set_style('darkgrid')
plt.style.use('ggplot')
plt.style.use('classic')
plt.style.use('default')
plt.style.context('seaborn-bright')

Se usa un with, para que el estilo sea temporal

with plt.style.context('seaborn-bright'):
    (Gráfica 1)
    (Gráfica 2)
    ...
    

## Treemaps

fig = px.treemap(
    names=['A', 'B', 'C', 'D', 'E', 'a', 'b', 'c', 'd', 'x', 'y', 'z'],
    parents=['', '', '', '', '', 'A', 'B', 'B', 'E', 'b', 'a', 'd']
)
fig.show()

# Otra opción   

fig = px.treemap(df_grouped, path=['sport', 'sex'], values='count')

fig.show()


## Scatterplots por categorias

sns.scatterplot(china['height'], china['weight'], hue=china['sex'], style=china['sex']);


## Scatterplots con variables condicionantes

sns.set_style('whitegrid')
palette = ["#223127","#9c0d38","#ce5374","#dbbbf5","#F9A03F"]

fig = plt.figure(figsize=(8, 8))
axes = fig.subplots(2, 2, sharex=True, sharey=True)

sns.scatterplot(basket['height'], basket['weight'], ax=axes[0, 0], color=palette[4])
sns.scatterplot(volley['height'], volley['weight'], ax=axes[0, 1], color=palette[1])
sns.scatterplot(foot['height'], foot['weight'], ax=axes[1, 0], color=palette[2])
sns.scatterplot(base['height'], base['weight'], ax=axes[1, 1], color=palette[3]);

axes[0, 0].set_title('Basketball')
axes[0, 1].set_title('Volleyball')
axes[1, 0].set_title('Football')
axes[1, 1].set_title('Baseball')

fig.suptitle('Relationship between height and weight in 4 sports', fontsize=15, c=palette[0], x=0.53)

plt.tight_layout()
plt.subplots_adjust(top=0.9)


## Jointplot

sns.jointplot('height', 'weight', data=df_grouped, kind='hex', ratio=5, joint_kws={'gridsize': 50});


## Mapa Cloroplético

import pandas as pd
import folium

state_geo = f'../Datasets/us_states.json'
state_unemployment = f'../Datasets/us_unemployment-oct_2012.csv'
state_data = pd.read_csv(state_unemployment)

m = folium.Map(location=[48, -102], zoom_start=3, width='60%', height='60%')

folium.Choropleth(
    geo_data=state_geo,
    name='choropleth',
    data=state_data,
    columns=['State', 'Unemployment'],
    key_on='feature.id',
    fill_color='YlGn',
    fill_opacity=0.7,
    line_opacity=0.2,
    legend_name='Unemployment Rate (%)'
).add_to(m)

folium.LayerControl().add_to(m)

m


## Gráfico de barras apiladas

El DF debe de tener esta forma →

{
sex	F	M
sport		
Baseball	NaN	703.0
Basketball	877.0	1730.0
Football	703.0	3290.0
Volleyball	1074.0	1300.0}

plt.style.use('seaborn')

fig = plt.figure(figsize=(5, 5))
ax = fig.add_subplot()

plt1 = ax.bar(value_counts.index, value_counts['M'], label='M',
              color=["#7788AA","#4E638E","#2E4372","#152A55"])
plt2 = ax.bar(value_counts.index, value_counts['F'], bottom=value_counts['M'],
              color=["#FFD0AA", "#D4996A", "#AA6B39", "#804415"])

ax.set_ylabel('count')
ax.set_title('Conteo de frecuencia de 4 deportes Olímpicos', fontsize=13, pad=15);
plt.legend((plt1[0], plt2[0]), ('Men', 'Women'));
ax.set_ylim(0, 4500);



---

## Estadística inferencial

### Obtener intervalos de confianza 

limite_inferior = serie_means.quantile(0.025)
limite_superior = serie_means.quantile(0.975)



# Procesamiento de lenguaje natrual

https://www.dataquest.io/blog/regex-cheatsheet/

grouped_by_title[grouped_by_title.str.contains('woman', case=False)] - Filtrar si contiene 'x'
...str.contains('[0-9]+[a-z]+', case=False)] - Filtrar si contiene un o más digitos, seguidos de uno o más caracteres
...str.contains('[0-9]th', case=False) - Filtrar si contiene un número, seguido de un "th"
...str.contains('^After', case=False)] - Inicio con la palabra "After"
...str.contains('London.$', case=False)] - Termina con "London."
...str.contains('\scat\s|\sdog\s', case=False)] - Contiene "cat" o "dog" entre espacios en blanco
...str.contains('wom[ae]n|m[ae]n', case=False)] - Contiene "man/men/woman/women"
...str.replace('[^\w\s]', '') - Remplazar (word) y (space) por espacio vacío
...str.replace('\d','') - Reemplazar (dígitos) por espacio vacío

## NLTK

grouped_by_title.apply(nltk.word_tokenize) - Separar cada oración en palabras
all_words = tokenized.sum() - Obtiene todas las palabras que se usan
text = nltk.Text(all_words) - Crea un objeto tipo text
text.concordance('woman', lines=20) - Busca las veces que aparece woman, e imprime las líneas
text.similar('woman') - Busca palabras que se usan en el mismo contexto que "woman"
text.common_contexts(['woman', 'man']) - Regresa frases en las que se usan las palabras en el mismo contexto
len(text) - Total de palabras
len(set(text)) - Todal de palabras únicas
len(set(text)) / len(text) - Riqueza léxica
text.collocations() - Obtener los pares de palabras que se usan en conjunto

from nltk.util import ngrams
text = nltk.Text(all_words)
freq_dist_trigrams = nltk.FreqDist(list(ngrams(text, 3))) - Obtener trigramas

#Para la limpieza de datos
grouped_by_title = grouped_by_title.str.lower()
grouped_by_title = grouped_by_title.str.strip()
grouped_by_title = grouped_by_title.str.replace('[^\w\s]', '')
grouped_by_title = grouped_by_title.str.replace('\d', '')
grouped_by_title = grouped_by_title.str.replace('\\n', '')
grouped_by_title = grouped_by_title.dropna()


## Freq dist

freq_dist = nltk.FreqDist(all_words) - Obtener la distribución de frecuencias 
freq_dist.most_common(50) - Obtener las palabras más repetidas
freq_dist_no_stop_words.hapaxes()[:20] - Obtener palabras que aparecen una vez

### Limpiar las palabras que no nos dicen nada
from nltk.corpus import stopwords
english_stop_words = stopwords.words('english')
all_words_except_stop_words = [word for word in all_words if word not in english_stop_words]
freq_dist_no_stop_words = nltk.FreqDist(all_words_except_stop_words)
freq_dist_no_stop_words.most_common(50)

freq_dist_no_stop_words.plot(50, cumulative=True) - Graficar la proporción del texto que es ocupada por las 50 palabras más comunes


## Análisis de sentimientos

from textblob import TextBlob
TextBlob(grouped_by_title.iloc[100])
TextBlob(grouped_by_title.iloc[100]).sentiment - Obtener análisis de sentimientos (polaridad y subjetividad)


# Machine Learning

https://jarroba.com/seleccion-del-numero-optimo-clusters/

## K means

from sklearn.cluster import KMeans
k_means = KMeans(n_clusters=6, max_iter=10000)
k_means.fit(df[['latitud', 'longitud']])


## Matriz de confusión


y_pred = logreg.predict(X_test)
from sklearn import metrics
cnf_matrix = metrics.confusion_matrix(y_test, y_pred)
cnf_matrix

###Imprimir un heatmap
class_names=[0,1] # name  of classes
fig, ax = plt.subplots(figsize=(6, 6))
tick_marks = np.arange(len(class_names))
plt.xticks(tick_marks, class_names)
plt.yticks(tick_marks, class_names)
#Heatmap
sns.heatmap(pd.DataFrame(cnf_matrix), annot=True, cmap="Blues" ,fmt='g', cbar=False, annot_kws={"size": 20})
ax.xaxis.set_label_position("top")
plt.tight_layout()
plt.ylabel('Realidad', fontsize=15, y=0.5)
plt.xlabel('Estimado por el modelo', fontsize=15);
#Medidas de evaluación
tn, fp, fn, tp = cnf_matrix.ravel()
print("Precision:",metrics.precision_score(y_test, y_pred))
print("Exactitud:",metrics.accuracy_score(y_test, y_pred))
print("Sensibilidad:",metrics.recall_score(y_test, y_pred))
print("Especificidad:", tn / (tn + fp))

## Curva ROC

from sklearn.metrics import roc_curve, auc
fpr, tpr, _ = roc_curve(y_test, y_pred_proba[:, 1])
roc_auc = auc(fpr, tpr)
plt.figure()
plt.plot(fpr, tpr, color='darkorange',
         label='ROC curve (area = %0.2f)' % roc_auc)
plt.plot([0, 1], [0, 1], color='navy', linestyle='--')
plt.xlim([0.0, 1.0])
plt.ylim([0.0, 1.05])
plt.xlabel('Proporción Positivos False')
plt.ylabel('Proporción Positivos Verdaderos')
plt.title('Curva ROC / AUC')
plt.legend(loc="lower right")
plt.show()

### y_pred_proba = logreg.predict_proba(X_test) - Predecir la probabilidad

```


C:/Users/LLerma/Google Drive/Analisis de Datos/M3 - Introduccion a Python/Files/xxxxx

https://github.com/beduExpert/B1-Procesamiento-de-Datos-con-Python-2020 
