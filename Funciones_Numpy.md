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
np.around(array,n) - Round the numbers of an array
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