# Postwork


```json
[{$project: {
  month: {$month: '$date'},
  year: {$year: '$date'},
  day: {$dayOfMonth : '$date'},
  "home":1,
  "away":1

  }}, {$match: 

{year:2015,
  month:12,
  day:20,
  "home.team":"Real Madrid"
}}, {$addFields: {
  goles_Madrid :  "$home.score",
  goles_visita :  "$away.score"
}}]
```
Falta en R
