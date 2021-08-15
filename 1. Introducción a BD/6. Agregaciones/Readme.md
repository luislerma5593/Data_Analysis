# Work

## Agregaciones

- [Prework](Prework) 
- [Work](Work)
- [x] [Proyecto](Proyecto)
- [ ] [Postwork](Postwork)

## Ejercicio 1

1. 

```json
[{$match: {
 property_type : "House"

}}, {$match: {
  bedrooms : {"$gt":0}
}}, {$addFields: {
  "price_per_room": {
    $divide: [ "$price" , "$bedrooms"]
  }
}}, {$group: {
  _id: "$address.country" ,  # null, se usa para poder agrupar a todos los documentos 
  sum: {
    $sum : 1
  },
  max_price : {
    "$max": "$price"
  },
  avergae_price : {
    $avg : "$price"  }
}}]
```

2.  Average price per room

```json
[{$match: {
 property_type : "House"

}}, {$match: {
  bedrooms : {"$gt":0}
}}, {$addFields: {
  "price_per_room": {
    $divide: [ "$price" , "$bedrooms"]
  }
}}, {$group: {
  _id: "$address.country" ,
  sum: {
    $sum : 1
  },
  max_price : {
    "$max": "$price"
  },
  min_price: {
    $min : "$price"
  },
  avergae_price : {
    $avg : "$price"  },

        price : {
      $push : "$price" # Genera un array con todos los valores
    }
}}]
```

## Reto 1

1. Muestra la relación promedio que hay entre la tarifa de limpieza y el precio de una propiedad.
```json
[{$addFields: {
  "cleaning_fee_per_price": {
  $divide : ["$cleaning_fee", "$price"]}
}}, {$group: {
  _id: null,
  avg_cleaning_fee_per_price: {
    $avg: "$cleaning_fee_per_price"
  }
}}, {$addFields: {
  pct_cleaning_fee_per_price: {
    "$multiply" : ["$avg_cleaning_fee_per_price",100]
  }
}}]
```

2. Muestra el costo promedio por habitación por país de las propiedades de tipo casa.
```json
[{$match: {
  property_type : "House"
}}, {$match: {
  bedrooms: {"$gt":0}
}}, {$addFields: {
  price_per_room: {
    $divide : ["$price","$bedrooms"]
  }
}}, {$group: {
  _id: null,
  avg_price_per_room: {
    $avg: "$price_per_room"
  }
}}]
```

3. Muestra el promedio del mínimo de noches para todas las propiedades.
```json
[{$addFields: {
  min_nights_int: {
    $toInt : "$minimum_nights"
  }
}}, {$group: {
  _id: null,
  avg_min_nights: {
    "$avg": "$min_nights_int"
  }
}}]
```

## Ejercicio 2

- Unwind

De ser un arreglo, pasa a ser una string, en este caso todos los elementos de cast.

```json
[{$match: 
{
  _id : ObjectId("573a1390f29313caabcd4135")
}}, {$unwind: {
  path: "$cast",
}}]
```

- Contar en cuantas películas aparece cada actor
```json
[{$unwind: {
  path: "$cast",
}}, {$group: {
  _id: "$cast",
    Count: {
      "$sum":1
    }
  }
}, {$sort: {
  Count: -1
}}]
```

## Reto 2

1. Mflix
Usando las colecciones comments y users, se requiere conocer el correo y contraseña de cada persona que realizó un comentario. Construye un pipeline que genere como resultado estos datos.

- Opción 1

Es la mejor opción, el orden es:

1. Lookup: Para relacionar (genera un objeto dentro de un array)
2. Unwind: Extrae el objeto del arreglo
3. AddFields: Extrae los elementos del objeto que tu seleccionas.

```json
[{$lookup: {
  from: "users",
  localField: "email",
  foreignField: "email",
  as: "users"
}}, {$unwind: {
  path: "$users",

 }}, {$addFields: {
  user_email: "$users.email",
  user_password: "$users.password"
}}, {$project: {
  _id:0,
  name : 1,
  text: 1,
  user_email:1,
  user_password:1
}}]
```
- Opción 2

No es la mejor opción porque van a coincidir usuario (como arreglo) y usuario_objeto (como objeto).

```json
[{$lookup: {
  from: 'users',
  localField: 'name',
  foreignField: 'name',
  as: 'usuario'
}}, {$addFields: {
  usuario_objeto: {$arrayElemAt: ["$usuario", 0]}
}}, {$addFields: {
  usuario_password: "$usuario_objeto.password"
}}]
```

2. Airbnb - Muestra los 3 ids de usuario (reviewers_id) que tengan más comentarios.

```json
[{$unwind: {
  path: "$reviews",
}}, {$group: {
  _id: "$reviews.reviewer_id",
  Count: {
    $sum: 1
  },
  name: {
    "$first" : "$reviews.reviewer_name" #Toma el nombre de la primera ocurrencia
  }
}}, {$sort: {
  "Count": -1
}}]
```
