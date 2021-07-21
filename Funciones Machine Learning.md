# Machine Learning

## Separación, validación y evaluación

```py
make_blobs(n_samples=1000, centers=2, n_features=2) - Genera de forma aleatoria, 1000 observaciones, 2 clusters y 2 variables

### Particionar base de datos
def particionar(entradas, salidas, porcentaje_entrenamiento, porcentaje_validacion, porcentaje_prueba):
    temp_size = porcentaje_validacion + porcentaje_prueba
    print(temp_size)
    x_train, x_temp, y_train, y_temp = train_test_split(entradas, salidas, test_size =temp_size)
    if(porcentaje_validacion > 0):
        test_size = porcentaje_prueba/temp_size
        x_val, x_test, y_val, y_test = train_test_split(x_temp, y_temp, test_size = test_size)
    else:
        return [x_train, None, x_temp, y_train, None, y_temp]
    return [x_train, x_val, x_test, y_train, y_val, y_test]

[x_train, x_val, x_test, y_train, y_val, y_test] = particionar(x,y,0.60,0.10,0.30)

print(x_train.shape)
print(x_val.shape)
print(x_test.shape)
```

K means Ejemplo 1 - http://shabal.in/visuals/kmeans/1.html

K means Ejemplo 2 - https://stanford.edu/class/engr108/visualizations/kmeans/kmeans.html

## Algoritmo K means
```py
# Definimos el número de centroides determinado
K = 4

# Determinamos el número de centróides y asignamos los datos
modelo_kmeans = KMeans(n_clusters = K)

modelo_kmeans.fit(x)

#Y extraemos los centroides.
centroides = modelo_kmeans.cluster_centers_
print(centroides)

# Para la clasificación
clasificaciones = k_means.predict(df[['latitud', 'longitud']])
```


```py
```


```py
```


```py
```


```py
```


```py
```



