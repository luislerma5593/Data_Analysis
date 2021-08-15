# Work

## Query Competition

- [Prework](Prework) 
- [Work](Work)
- [ ] [Postwork](Postwork)

* No hay proyecto

## Reto 1: Starbucks

1. Descarga la fuente de datos de los locales de Starbucks:

`https://raw.githubusercontent.com/MarioHdpz/21-01-Introduccion-a-Bases-de-Datos-2020/main/Sesion-08/Reto-01/datos/directory.csv`

2. Analiza los datos, limpia los datos en caso de ser necesario.

3. Elige MySQL o MongoDB y crea una base de datos para el conjunto de datos del reto.

4. Carga los datos en la base de datos que elegiste y revisa que éstos se muestren correctamente.

5. Usando la latitud y longitud de tu posición actual, encuenta el Starbucks más cercano a tu posición. Para conocer tu posición actual puedes usar Google Maps para, sólo debes copiar los datos de la URL.

### SQL

```sql
SELECT 
Store_Name,
City,
SQRT(POWER(Longitude - (-100.30238194412952),2)+ POWER(Latitude - 25.621787570457087,2)) AS Distance
FROM luis_sb
ORDER BY Distance ASC;
```

### Mongo DB

```json
[{
    $addFields: {
        "distance": {
            "$sqrt": {
                "$sum": [{
                        $pow: [{
                            $subtract: ["$Latitude", 19.37601710555175]
                        }, 2]
                    },
                    {
                        $pow: [{
                            $subtract: ["$Longitude", -99.14116841152736]
                        }, 2]
                    }
                ]
            }
        }
    }
}, {
    $sort: {
        distance: 1
    }
}, {
    $match: {
        distance: {
            $ne: NaN
        }
    }
}, {
    $limit: 1
}]
```
