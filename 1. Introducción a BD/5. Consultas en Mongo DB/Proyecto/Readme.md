# Proyecto

Usando la colección sample_airbnb.listingsAndReviews, mediante el uso de agregaciones, encontrar el número de publicaciones que tienen conexión a Internet, 
sea desde Wifi o desde cable (Ethernet):

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
