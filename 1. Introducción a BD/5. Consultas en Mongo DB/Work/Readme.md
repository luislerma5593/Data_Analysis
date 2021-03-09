# Work

- Patrón 
```json
FILTER
{"transit": /Metro/i} # i -> Case insensitive
PROJECT
{transit:1}
```

- Patrón iniciando
```json
FILTER
{"name": /^n/i} # Empiece con la letra 'n'
```

- Patrón finalizando
```json
FILTER
{"email": /@gameofthron\.es$/i} # Que termine con X, la  / es para buscar un símbolo que puede ser reservado.
```

- Patrón en medio
 ```json
FILTER
{"name": /.*m.*/i} # Contener m en cualquier parte
```

- Patrón de 6 letraas
```json
FILTER
{"name": /^......$/i} # Podría ser {"name": /^{6}$/i}
```

## RETO 1

1. Propiedades que no permitan fiestas.
```json
FILTER
{"$or": [{"house_rules": /.*no fiesta.*/i},{"house_rules": /.*no party.*/i},{"house_rules": /.*no parties.*/i}]} # -> {"house_rules": /.*no smoke.*|.*no fumar.*/i}
PROJECT
{"house_rules": 1}
```

2. Propiedades que admitan mascotas.
```json
FILTER
{"$and":[{"house_rules":/pets/i},{"house_rules":{"$not":/no pets/i}}]}  # Que diga pet y que no diga "no pet"
```

3. Propiedades que no permitan fumadores.
```json
FILTER
{"house_rules": /no smoke|no fumar/i}
```

4. Propiedades que no permitan fiestas ni fumadores.
```json
FILTER
{"house_rules": /no smoke|no fumar|no party|no parties/i}
```

## EJERCICIO 2

1. Que tenga cocina y wifi
```json
FILTER
{"amenities": {"$in":["Kitchen","Wifi"]}} # $nin es not in
```

2. Podemos obtener la lista de todas las publicaciones con un costo menor a 100, que se encuentren en España, con una valoración de 50 o más puntos, 
que cuenten con Internet o Wifi y que tegan Elevador.

```json
{"price":{"$lt":100}, "address.country":"Spain","review_scores.review_scores_rating" : {"$gt":50 }, "$and" : [{"amenities" :{ "$in" : ["Wifi", "Internet"]}},{"amenities" :{ "$in" : ["Elevator"]}}]}
```

## RETO 2

- Usando la colección sample_airbnb.listingsAndReviews, agrega un filtro que permita obtener todas las publicaciones que tengan 50 o más comentarios, 
que la valoración sea mayor o igual a 80, que cuenten con conexión a Internet vía cable y estén ubicada en Brazil.

```json
FILTER
{"number_of_reviews": {"$gte":50},"review_scores.review_scores_rating":{"$gte":80}, "address.country":"Brazil", "amenities": {"$in":["Ethernet connection"]}}
PROJECT
{number_of_reviews:1,"review_scores.review_scores_rating":1,"address.country":1,amenities:1}
```

### Funciones para "Aggregations"

https://docs.mongodb.com/manual/reference/operator/aggregation/

## EJERCICIO 3

### Agrupamientos
```json
{"numberrr_of_reviews":   {"$size": "$reviews"}}
```

### GROUP

{
  _id: null,
  count: {
   "$sum":1}
}

## RETO 3

Usando la colección sample_airbnb.listingsAndReviews, mediante el uso de agregaciones, encontrar el número de publicaciones que tienen conexión a Internet, 
sea desde Wifi o desde cable (Ethernet):

```json
[{$match: {
  amenities: {"$in": ["Wifi","Ethernet connection"]}
}}, {$count: 'Count'}]
```


