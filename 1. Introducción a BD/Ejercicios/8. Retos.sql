SELECT 
Store_Name,
City,
SQRT(POWER(Longitude - (-100.30238194412952),2)+ POWER(Latitude - 25.621787570457087,2)) AS Distance
FROM luis_sb
ORDER BY Distance ASC;