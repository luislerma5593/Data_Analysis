# Proyecto

Para este proyecto deberás practicar en el uso de agregaciones, pues serán usadas durante la siguiente sesión.

La base de datos y colección que debes usar es sample_airbnb.listingsAndReviews.

El proyecto consiste en obtener todas las publicaciones que tengan 50 o más comentarios, que la valoración sea mayor o igual a 80, que cuenten con conexión a Internet vía cable y estén ubicadas en Brazil.

```json
[{$match: {
  number_of_reviews: {"$gte": 50}
}}, {$match: {
  "review_scores.review_scores_rating":
  {"$gte":80}
}}, {$match: {
  "address.country": "Brazil"
}}, {$match: {
  amenities : "Ethernet connection"
}}, {$count: 'Count'}]
```
