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

## Matriz de confusión
```py
y_predichos = bosque.predict(X_test) #Ejemplo

from sklearn.metrics import confusion_matrix

resultado = confusion_matrix(y_test, y_predichos)
print(resultado)

tn, fp, fn, tp = resultado.ravel()

print("Precision:",metrics.precision_score(y_test, y_pred))
print("Exactitud:",metrics.accuracy_score(y_test, y_pred))
print("Sensibilidad:",metrics.recall_score(y_test, y_pred))
print("Especificidad:", tn / (tn + fp))
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

## MSE en regresiones
```py
y_train_predict = lin_model.predict(X_train)
MSE = mean_squared_error(Y_train,y_train_predict)
print("Entrenamiento: MSE ="+str(MSE))

y_test_predict = lin_model.predict(X_test)
MSE = (mean_squared_error(Y_test, y_test_predict))
print("Pruebas: MSE ="+str(MSE))
```

Información sobre regresiones
https://www.ccg.unam.mx/~vinuesa/R4biosciences/docs/Tema9_regresion.html

## Regresión polinominal
```py
import numpy as np
import pandas as pd
from sklearn.datasets import load_boston
from sklearn.model_selection import train_test_split
from sklearn.linear_model import LinearRegression
from sklearn.preprocessing import PolynomialFeatures
from sklearn.metrics import mean_squared_error

poly_model = LinearRegression()
poly = PolynomialFeatures(degree=2)

Xpolytrain = poly.fit_transform(X_train)
Xpolytest = poly.fit_transform(X_test)

poly_model.fit(Xpolytrain, Y_train)
y_train_predict = poly_model.predict(Xpolytrain)

MSE = mean_squared_error(Y_train,y_train_predict)
print("Entrenamiento: MSE ="+str(MSE))

y_test_predict = poly_model.predict(Xpolytest)
MSE = (mean_squared_error(Y_test, y_test_predict))
print("Pruebas: MSE ="+str(MSE))

df_predicciones = pd.DataFrame({'valor_real':Y_test, 'prediccion':y_test_predict, 'diferencia':Y_test-y_test_predict})
df_predicciones = df_predicciones.reset_index(drop = True)
df_predicciones.head(10)
```

## Regresión en series de tiempo
```py
import numpy as np
import pandas as pd
from sklearn.datasets import load_boston
from sklearn.model_selection import train_test_split
from sklearn.linear_model import LinearRegression
from sklearn.metrics import mean_squared_error

# Acomoda la base de datos (valores), en un dataset
def transformarSerieADataset(serie, elementosPorMuestra):
    dataset = None
    salidasDataset = None
    for counter in range (len(serie)-elementosPorMuestra-1):        
        muestra = np.array([serie[counter:counter+elementosPorMuestra]])        
        salida = np.array([serie[counter+elementosPorMuestra]])
        if dataset is None:
            dataset = muestra
        else:
            dataset = np.append(dataset,muestra,axis = 0)
        if salidasDataset is None:
            salidasDataset = salida    
        else:        
            salidasDataset = np.append(salidasDataset,salida)
    return dataset, salidasDataset
    
# import os
# os.chdir("...")

df_timeseries = pd.read_csv('../Datasets/timeseries_temperature.csv')
df_timeseries['Temp']
serie = df_timeseries['Temp'].to_numpy()

X, Y = transformarSerieADataset(serie, elementosPorMuestra = 10)

X_train, X_test, Y_train, Y_test = train_test_split(X, Y, test_size = 0.4, random_state=5)

lin_model = LinearRegression()
lin_model.fit(X_train, Y_train)

y_train_predict = lin_model.predict(X_train)
MSE = mean_squared_error(Y_train,y_train_predict)
print("Entrenamiento: MSE ="+str(MSE))

y_test_predict = lin_model.predict(X_test)
MSE = (mean_squared_error(Y_test, y_test_predict))
print("Pruebas: MSE ="+str(MSE))

df_predicciones = pd.DataFrame({'valor real':Y_test, 'prediccion':y_test_predict, 'diferencia':Y_test-y_test_predict})
df_predicciones = df_predicciones.reset_index(drop = True)
df_predicciones.head(10)
```

## Regresión polinominal con series de tiempo
```py
poly_model = LinearRegression()
poly = PolynomialFeatures(degree= 2 )

Xpolytrain = poly.fit_transform(X_train)
Xpolytest = poly.fit_transform(X_test)

poly_model.fit(Xpolytrain, Y_train)

y_train_predict = poly_model.predict(Xpolytrain)
MSE = mean_squared_error(Y_train, y_train_predict)
print("Entrenamiento: MSE ="+str(MSE))

y_test_predict = poly_model.predict(Xpolytest)
MSE = mean_squared_error(Y_test, y_test_predict)
print("Pruebas: MSE ="+str(MSE))

df_predicciones = pd.DataFrame({'valor_real':Y_test, 'prediccion':y_test_predict, 'diferencia':Y_test-y_test_predict})
df_predicciones = df_predicciones.reset_index(drop = True)
df_predicciones.head(10)
```

## Árboles de decisión
```py
from sklearn import tree as treeClassifier

#Para las salidas, utilizaremos la variable Y
y = ["Antonio", "Elly", "Patricia", "María", "Juana", "José", "Luis"]

#Características: 
#Cabello largo | Usa lentes | Usa sombrero | Es mujer | Tiene bigote | Tiene ojos claros
x = np.array([
     [0,1,0,0,0,0], #Antonio: No tiene cabello largo, usa lentes, no usa sombrero, no es mujer, no tiene bigote, no tiene ojos claros
     [1,1,1,1,0,0], #Elly: Tiene cabello largo, usa lentes, usa sombrero, es mujer, no tiene bigote, no tiene ojos claros
     [0,0,1,1,0,1], #Patricia: ...
     [1,1,0,1,0,0], #Maria: ...
     [0,0,1,1,0,0], #Juana: ...
     [1,0,0,0,1,1], #José: ...
     [0,1,1,0,0,1]  #Luis: ...
    ], dtype=np.int16)

arbol = treeClassifier.DecisionTreeClassifier()
arbol = arbol.fit(x, y)

plt.figure(figsize = (5,5), dpi = 300)
treeClassifier.plot_tree(arbol,filled = True);
plt.show()

caracteristicas = np.array([[1,0,0,0,1,1]], dtype=np.int16)
print("Nuestro sospechoso es")
print(arbol.predict(caracteristicas))
```

## Bosques aleatorios
```py
import numpy as np
from matplotlib import pyplot as plt
from sklearn import tree as treeClassifier
from sklearn.ensemble import RandomForestClassifier as forest

#Para las salidas, utilizaremos la variable Y
y = ["Antonio", "Elly", "Patricia", "María", "Juana", "José", "Luis"]

#Características: 
#Cabello largo | Usa lentes | Usa sombrero | Es mujer | Tiene bigote | Tiene ojos claros
x = np.array([
     [0,1,0,0,0,0], #Antonio: No tiene cabello largo, usa lentes, no usa sombrero, no es mujer, no tiene bigote, no tiene ojos claros
     [1,1,1,1,0,0], #Elly: Tiene cabello largo, usa lentes, usa sombrero, es mujer, no tiene bigote, no tiene ojos claros
     [0,0,1,1,0,1], #Patricia: ...
     [1,1,0,1,0,0], #Maria: ...
     [0,0,1,1,0,0], #Juana: ...
     [1,0,0,0,1,1], #José: ...
     [0,1,1,0,0,1]  #Luis: ...
    ], dtype=np.int16)
    
random_seed = 12

bosque = forest(n_estimators = 800, random_state = random_seed)
bosque.fit(x, y)

#Este sospechoso es José: Es exactamente igual a los datos del adivina quien.
caracteristicas = np.array([[1,0,0,0,1,1]], dtype=np.int16)
print("Nuestro sospechoso original es")
print(bosque.predict(caracteristicas))

#Se puede seleccionar uno de los árboles del bosque para poder graficarlo
#Sientete libre de elegir alguno de los arboles:
numeroArbol = 1
arbolDelBosque = bosque.estimators_[numeroArbol]

plt.figure(figsize = (5,5), dpi = 300)
treeClassifier.plot_tree(arbolDelBosque,filled = True);
plt.show()
```

## Clasificación con SGDClassifier
```py
import numpy as np
from sklearn.linear_model import SGDClassifier
from sklearn.metrics import confusion_matrix

# AND
X = np.array([[0,0],[0,1],[1,0],[1,1]])
Y = np.array([0,0,0,1])

model = SGDClassifier(max_iter=1000, tol=1e-3)
model.fit(X, Y)
results = model.predict(X)
print("Entradas:"+str(X))
print("Resultados AND:"+str(results))
print("Matriz de confusión:", confusion_matrix(Y, results), sep = "\n")

# Con XOR no funciona
X = np.array([[0,0],[0,1],[1,0],[1,1]])
Y = np.array([0,1,1,0])

model = SGDClassifier(max_iter=10000, tol=1e-3)
model.fit(X, Y)
results = model.predict(X)
print("Entradas:"+str(X))
print("Resultados XOR:"+str(results))
print("Matriz de confusión:", confusion_matrix(Y, results), sep = "\n")
```

## Redes neuronales artificiales con sklearn
```py
import numpy as np
from matplotlib import pyplot as plt
from sklearn.neural_network import MLPClassifier
from sklearn.datasets import make_blobs
from sklearn.model_selection import train_test_split

x, y = make_blobs(n_samples=1000, centers=2, n_features=10)
plt.scatter(x[:,0], x[:,1], c=y)
plt.show()

x_train, x_test, y_train, y_test = train_test_split(x,y,test_size=0.4)


redNeuronal = MLPClassifier(hidden_layer_sizes=(4,2),
                            max_iter=20000,
                            activation ='logistic',
                            tol= 1e-7)

redNeuronal.fit(x_train, y_train)
y_pred = redNeuronal.predict(x_test)
print("¡Entrenamiento completado!")
```
Tensor flow, es la librería que se utiliza para aplicaciones más robustas de redes neuronales.

## Máquinas de soporte vectorial
```py
import numpy as np
from matplotlib import pyplot as plt
from sklearn.datasets import make_blobs
from sklearn.model_selection import train_test_split

x, y = make_blobs(n_samples=1000, centers=2, n_features=10)
plt.scatter(x[:,0], x[:,1], c=y)
plt.show()

x_train, x_test, y_train, y_test = train_test_split(x,y,test_size=0.4)

from sklearn.svm import SVC #Support Vector Classifier

SupportVectorMachine = SVC()
SupportVectorMachine.fit(x_train, y_train) 
y_pred = SupportVectorMachine.predict(x_test) 

resultado = confusion_matrix(y_test, y_pred)
print(resultado)
```

## Naive Bayes Classificator
```py
import numpy as np
from matplotlib import pyplot as plt
from sklearn.datasets import make_blobs
from sklearn.model_selection import train_test_split

x, y = make_blobs(n_samples=1000, centers=2, n_features=10)
plt.scatter(x[:,0], x[:,1], c=y)
plt.show()

x_train, x_test, y_train, y_test = train_test_split(x,y,test_size=0.4)

from sklearn.naive_bayes import GaussianNB

NaiveBayes = GaussianNB()
NaiveBayes.fit(x_train, y_train) 
y_pred = NaiveBayes.predict(x_test) 

resultado = confusion_matrix(y_test, y_pred)
print(resultado)
```

## RandomizedSearchCV
La función **RandomizedSearchCV** toma 3 argumentos principales: 
1. La instancia del modelo a entrenar 
2. Un diccionario con todos los hiperparámetros a probar 
3. El número de validaciones cruzadas a realizar
```py
# Hiperparámetros
n_neighbors = [2, 4, 6, 8, 10, 12, 14, 16, 18, 20]
weights = ['uniform', 'distance']
metric = ['euclidean', 'manhattan', 'minkowski']

param_grid = {"n_neighbors": n_neighbors, "weights": weights, "metric": metric}

# Instancia del modelo
from sklearn.neighbors import KNeighborsClassifier
KNN = KNeighborsClassifier()

# Ajusta de hiperparámetros y entrenamiento
KNN_cv = RandomizedSearchCV(KNN, param_grid, cv = 5)
KNN_cv.fit(X_train, y_train)

# Hiperparámetros que generan el mejor modelo
print("K vecinos más cercanos con hiperparámetros ajustados: {}".format(KNN_cv.best_params_))

# Evaluación del modelo
print("Precisión del modelo en el subconjunto de entrenamiento: {}".format(KNN_cv.best_score_.round(2)))
print("Precisión del modelo en el subconjunto de prueba: {}".format(KNN_cv.score(X_test, y_test).round(2)))
```

## Pre-procesamiento de datos

- https://scikit-learn.org/stable/auto_examples/preprocessing/plot_scaling_importance.html

## Técnica de preprocesamiento de datos (Transformación → Power Transformer)

Se usa para poder tratar de quitar los sesgos en los datos, es especial en regresión logística y el clasificador ingenuo de Bayes, que se basan en la distribución de los datos
```py
from sklearn.preprocessing import PowerTransformer 

ss = PowerTransformer()
X_scaled = ss.fit_transform(X)

df_scaled = pd.DataFrame(X_scaled)
print(df_scaled.describe().T.round(2))
```

## Técnica de preprocesamiento de datos (Transformación → Standard Scaler)
```py
from sklearn.preprocessing import StandardScaler

# Estandarizar variables
ss = StandardScaler()
X_ss = ss.fit_transform(X) #Ajusta y transforma

x_df = pd.DataFrame(X_ss)
print(x_df.describe().T)
```

## Análisis de componentes principales 

Revisar M5S9 - Sesión_9_NoSupervisado

```py
from sklearn.decomposition import PCA #Análisis de componentes principales

# Crear la instancia PCA y ajustar los datos
pca = PCA()
pca.fit(X_ss)

# Gráfica de varianza explicada
features = range(pca.n_components_)
plt.bar(features, pca.explained_variance_)
plt.xlabel('PCA feature')
plt.ylabel('variance')
plt.xticks(features)
plt.show()


#Si deseamos explicar aproximadamente el 90% de la varianza original, deberiamos retener los primeros dos componentes principales, 
#los cuales explican aproximadamente el 60% y 30% respectivamente.

#Con base en este análisis, retenemos los dos componentes principales


# Generemos la instancia indicando el número de componentes a retener
pca = PCA(n_components = 2)

# Ajustamos y transformamos los datos
pca_features = pca.fit_transform(X_ss)
print(pca_features)
print(pca_features.shape)

# Gráfica de varianza explicada (Ya nada mas con 2 componentes)
features = range(pca.n_components_)
plt.bar(features, pca.explained_variance_)
plt.xlabel('PCA feature')
plt.ylabel('variance')
plt.xticks(features)
plt.show()

# Asignamos los componentes a dos variables
xs = pca_features[:,0]
ys = pca_features[:,1]

#Extraemos las etiquetas de las entidades
ent = df['entidad']
ent = np.asarray(ent)

# Generemos el diagrama de dispersión
plt.figure(figsize=(15, 10))
plt.scatter(xs, ys)

for i, n in enumerate(ent):
    plt.annotate(n, (xs[i], ys[i]))
    
plt.title('Finanzas Públicas - Entidades Federativas')
plt.xlabel('PCA 1')
plt.ylabel('PCA 2')

plt.show()
```


# Procesamiento de imágemes    

## Leer imágenes
```py
import cv2
import numpy as np
from matplotlib import pyplot as plt

imageOpenCV = cv2.imread("Imagenes/pueblacity.jpg", cv2.IMREAD_COLOR) #Se lee en BGR
imagen = cv2.cvtColor(imageOpenCV, cv2.COLOR_BGR2RGB) #Para cambiar a RGB

print(type(imagen))
print("Tamaño de la imagen: (alto, ancho, canales)")
print(imagen.shape)
plt.figure(figsize=(40,40))
plt.imshow(imagen)
```

##Obtener una sola capa de una imagen
```py
canal_rojo = imagen[:,:,0]
print(canal_rojo.shape)

#Volveremos los canales que ignoramos a 0.
dummy_channel = np.zeros_like(canal_rojo)
img_canal_rojo = np.dstack((canal_rojo, dummy_channel, dummy_channel))

print(img_canal_rojo.shape)
plt.figure(figsize=(40,40))
plt.imshow(img_canal_rojo)
```

## Imagen en escala de grises
```py
imagen_grayscale = np.sum(imagen,axis = 2)
imagen_grayscale = imagen_grayscale / 3
print(imagen_grayscale.shape)
plt.figure(figsize=(40,40))
plt.imshow(imagen_grayscale,cmap=plt.cm.gray)       
```

## Funciones
```py
def obtenerNegativo(imagen):
    negativo = np.abs(imagen - 255)
    return negativo

def reducirColores(imagenGris, cantidadDeColores):
    if(cantidadDeColores <= 0):
        return np.zeros_like(imagenGris)
    
    stepSize = int(255 / (cantidadDeColores))
    for counter in range (0, 255, stepSize):
        if(counter == 0):
            buffer = np.zeros_like(imagenGris)
        else:
            imgFiltrada = np.where(((imagenGris > (counter - stepSize)) & (imagenGris <= counter)), counter, 0)
            buffer = np.add(buffer, imgFiltrada)
    return buffer
    
def binarizar(imagenGris, threshold):
    imgBinaria = np.where(imagenGris > threshold, 255, 0)
    return imgBinaria
    
def convertirAGrayScale(imagen):
    imagenGris = np.sum(imagen, axis = 2) / 3    
    return imagenGris

imagenGris = convertirAGrayScale(imagen)
plt.figure(figsize=(40,40))
plt.imshow(imagenGris, cmap=plt.cm.gray)
```

## Recortar imagen
```py
def recortar(imgOriginal, imgBinarizada):
    patronBinario = np.where(imgBinarizada > 0, 0, 1) #negativo = np.abs(imagen - 255)
    #patronBinario = obtenerNegativo(imgBinarizada) #negativo = np.abs(imagen - 255)
    imgRecortada_rojo = np.multiply(imgOriginal[:,:,0],patronBinario)
    imgRecortada_verde = np.multiply(imgOriginal[:,:,1],patronBinario)
    imgRecortada_azul = np.multiply(imgOriginal[:,:,2],patronBinario)
    imgRecortada = np.dstack((imgRecortada_rojo, imgRecortada_verde, imgRecortada_azul))
    return imgRecortada

manzana_recortada = recortar(imagenManzana, imagenManzana_bin)

plt.figure(figsize=(7,7))
plt.imshow(manzana_recortada)
plt.show()
```

## Histograma de colores    
```py
def crearHistograma(imagen):
    histograma = np.zeros((256))
    imgEnArray = np.ravel(imagen)
    for counter in range(0, len(imgEnArray)):
        histograma[int(imgEnArray[counter])]+=1
        
    return histograma

histograma = crearHistograma(imagen[:,:,0])
print("Color mas usado:"+str(np.argmax(histograma))+". Usado "+str(np.max(histograma))+" veces.")

histogramaRojo = crearHistograma(imagen[:,:,0])
histogramaVerde = crearHistograma(imagen[:,:,1])
histogramaAzul = crearHistograma(imagen[:,:,2])

plt.bar(np.arange(len(histogramaRojo)),histogramaRojo, color='red')
plt.show()
plt.bar(np.arange(len(histogramaVerde)),histogramaVerde, color='green')
plt.show()
plt.bar(np.arange(len(histogramaAzul)),histogramaAzul, color='blue')
plt.show()
```

## Crear descriptor
```py
def crearDescriptor(imagen):
    histogramaRojo = crearHistograma(imagen[:,:,0])
    histogramaVerde = crearHistograma(imagen[:,:,1])
    histogramaAzul = crearHistograma(imagen[:,:,2])
    
    descriptor = np.concatenate([histogramaRojo, histogramaVerde, histogramaAzul])
    print(descriptor.shape)
    return descriptor
    
 descriptorManzana1 = crearDescriptor(imgManzana1)
plt.ylim(0,500)
plt.bar(np.arange(len(descriptorManzana1)),descriptorManzana1, color='red')
plt.show()

descriptorManzana2 = crearDescriptor(imgManzana2)
plt.ylim(0,500)
plt.bar(np.arange(len(descriptorManzana2)),descriptorManzana2, color='red')
plt.show()

descriptorManzana3 = crearDescriptor(imgManzana3)
plt.ylim(0,500)
plt.bar(np.arange(len(descriptorManzana3)),descriptorManzana3, color='red')
plt.show()

```

