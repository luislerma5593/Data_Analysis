

# NaN
df.isna().sum()

df.dropna(axis=x, how="any")

df.fillna(x)

df["col"].astype(int)
pd.to_numeric(df["col"])

df.sort_values("col", ascending = True)

pd.merge(users, occupations, left_on='occupation', right_index=True)


users.groupby('gender')['age_id'].agg(['mean', 'median', 'std'])

df['col'].str.replace('Descr:', "") - Reemplazar texto en toda una coolumna
df['col'].str.strip() - Quitar espacios en blanco al inicio y al final del string
df['col'].str.split(' ', expand=True) - Separa texto dependiendo el separador

## Gráficas

ax = sns.barplot(x,y)
ax.set:title("...")

## Limpieza de nans

- Limpiar las columnas con demasiados nans
- Con isna().sum(), ver qué campos se pueden llenar con datos como 0 o "Unknown"
- Separa columnas si es necesario
- Castear
- Manipulación / Transformación de strigns
- Filtros
- Sort by


Identificación de un problema
Planteamiento de preguntas
Colección de datos
Análisis exploratorio de datos
Limpieza de datos y agregaciones
Automatización y APIs
Transformación, filtración y ordenamiento de datos


ETL