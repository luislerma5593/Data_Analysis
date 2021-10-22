# Numpy

```py
np.array() - Creates an array
arr.reshape(rows,cols) - New shape to the array
np.hstack((a1,a2)) - Combine arrays horizontally
np.vstack((a1,a2)) - Combine arrays vertically
np.concatenate((a1,a2)) - Concatentes arrays (Can use axis = 0/1)
array.sum( axis = 0/1) 
array.min()
array.max()
array.mean()
np.nanmean(x) - Calculates the mean ignoring NaNs
np.isnan(x) - Return True or False
np.around(array,n) - Round the numbers of an array

np.linalg.inv() - Return inverse when det != 0
np.linalg.pinv() -Return inverse when det != 0 or pseudo inverse when det = 0

np.sin(x) - Creates the values for y from x

np.linspace(a,b,c) - Creates c numbers from a to b 
```

```py
# Example to get two numbers in one line

n, p = [int(x) for x in input().split()]
```

# Pandas

```py
df.head()
df.tail()
df.info() - Shows Column names and Data types
df.describe() - Describe df
df.min()
df.max()
df.mean()
df.quantile([0.25 0.5 0.74 1])
df.median()
df.var()
df.std()

df.groupby("col").mean()
df.groupby("col")["col2"].agg(["min","max"])

# Categorical
df["col"].value_couns() - Count ocurrencies
df["col"].describe() - Count, unique, top, freq
```

# Matplotlib

```py
plt.style.use('ggplot') - Change style as R

plt.plot(x,y)
plt.hist(x)
plt.boxplot(x)
plt.barplot(x)

plt.xlabel('x') - X Label
plt.ylabel('y') - Y Label
plt.title('Lab') - Title
plt.legend() - Add legend
plt.xlim() - X limit
plt.ylim() - Y limit
plt.show() - Show a plot

plt.savefig("Img.png")

df.plot(kind = 'scatter',x = 'x',y = 'y') - Plot with Pandas
df.plot(kind = "hist"....) - Histogram

plt.scatter(x, y, c='m'); - Scatterplot
plt.plot(x, y, c='b'); - Plot x and y
plt.axvline(x.mean(), c='y') - Vertical line

plt.plot(..., linestyle = "--") #Or next to the color (plt.plot(x, np.cos(x), 'r--'...))
plt.scatter(..., marker='<', color='b') - Change the marker and the color

https://matplotlib.org/stable/api/markers_api.html

```

## Colors

```py
k for black 
r for red
b for blue
g for green
c for cyan
```

## Create a figure
```py
import matplotlib.pyplot as plt
fig = plt.figure()  #First fig
ax = plt.axes()     #Then axes
plt.savefig('fig.png')
plt.show()
```

# Machine Learning
```py
df.corr().round(x) - Creates a correlation matrix

model.intercept_ - To get the intercept_
model.coef_ - To get the coefficient/slope
model.score() - R-squared
```
## Linear Regressión

To evalutae you cane either use:
- MSE
- R-squared

Compare different models

## Classification

KN Neighbors Classifier
- https://scikit-learn.org/stable/modules/generated/sklearn.neighbors.KNeighborsClassifier.html
```py
```

## Clustering 

- https://scikit-learn.org/stable/modules/clustering.html#overview-of-clustering-methods
```py
```

```py
```










