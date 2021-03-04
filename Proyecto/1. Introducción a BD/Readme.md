# Introducción a BD

La consulta que más puede servir para obtener información de los dos hornos, agrupados por mes es la siguiente:

```sql
SELECT 
MONTH(horno1.FinishedTime),
AVG(horno1.SteelTemperature) AS Temp_H1,
AVG(horno2.SteelTemperature) AS Temp_H2
FROM horno1
JOIN horno2
ON MONTH(horno1.FinishedTime) = MONTH(horno2.Finishedtime)
GROUP BY MONTH(horno1.FinishedTime);
```

- Es importante primero realizar el join y después hacer la agrupación, para que sea más eficiente.

- Es más eficiente el JOIN que una subconsulta.

## Postwork 1

```sql
SELECT * FROM proyecto.horno2;

# 1. Filtrar las columnas de HeatId, P_On, P_Off 
SELECT HeatNumber, TapToTap, PowerOff, PowerOn FROM horno1;
SELECT HeatNumber, TapToTap, PowerOff, PowerOn FROM horno2;
SELECT Horno, HeatNumber, TapToTap, PowerOff, PowerOn FROM hornos;

# 2. Filtrar las coladas con duración mayor a 1 hora y media
SELECT FinishedTime, HeatNumber, TapToTap FROM horno1 WHERE TapToTap > 90;
SELECT FinishedTime, HeatNumber, TapToTap FROM horno2 WHERE TapToTap > 90;
SELECT Horno, FinishedTime, HeatNumber, TapToTap FROM hornos WHERE TapToTap > 90;

# 3. Filtrar las coladas con el rendimiento más alto (Utilization -> PowerOn/TapToTap)
SELECT DATE(FinishedTime), HeatNumber, Utilization, TapToTap, PowerOn, PowerOff FROM horno1 ORDER BY Utilization DESC;
SELECT DATE(FinishedTime), HeatNumber, Utilization, TapToTap, PowerOn, PowerOff FROM horno2 ORDER BY Utilization DESC;
SELECT Horno, DATE(FinishedTime), HeatNumber, Utilization, TapToTap, PowerOn, PowerOff FROM hornos ORDER BY Utilization DESC;

# 4. Filtrar el top 10 de coladas más largas y después más cortas
SELECT HeatNumber, TapToTap, PowerOn, PowerOff FROM horno1 ORDER BY TapToTap DESC LIMIT 10;
SELECT HeatNumber, TapToTap, PowerOn, PowerOff FROM horno1 ORDER BY TapToTap ASC LIMIT 10;
SELECT Horno, HeatNumber, TapToTap, PowerOn, PowerOff FROM hornos ORDER BY TapToTap ASC LIMIT 10;

SELECT HeatNumber, TapToTap, PowerOn, PowerOff FROM horno2 ORDER BY TapToTap DESC LIMIT 10;
SELECT HeatNumber, TapToTap, PowerOn, PowerOff FROM horno2 ORDER BY TapToTap ASC LIMIT 10;
SELECT Horno, HeatNumber, TapToTap, PowerOn, PowerOff FROM hornos ORDER BY TapToTap ASC LIMIT 10;

# 5. Filtrar las 10 coladas que más energía se utilizó cuando se usaron 2 cargas.
SELECT HeatNumber, EnergyPerHeat, TapToTap, PowerOn, PowerOff, ChargesTotalWeight, Charges FROM horno1 WHERE Charges = 2 ORDER BY EnergyPerHeat DESC LIMIT 10;
SELECT HeatNumber, EnergyPerHeat, TapToTap, PowerOn, PowerOff, ChargesTotalWeight, Charges FROM horno2 WHERE Charges = 2 ORDER BY EnergyPerHeat DESC LIMIT 10;
SELECT Horno, HeatNumber, EnergyPerHeat, TapToTap, PowerOn, PowerOff, ChargesTotalWeight, Charges FROM hornos WHERE Charges = 2 ORDER BY EnergyPerHeat DESC LIMIT 10;

SELECT MONTH(FinishedTime), HeatNumber, EnergyPerHeat, TapToTap, PowerOn, PowerOff, ChargesTotalWeight, Charges FROM horno1 ORDER BY ChargesTotalWeight DESC LIMIT 10;
```

## Postwork 2

En esta sección se encuentran la mayoría de las consultas que se utilizaron para poder obtener las gráficas.

```sql
SELECT * FROM proyecto.horno2;

# 1. Filtra cuantas coladas se realizaron en cada uno de los hornos en todo el año
SELECT count(*)AS Num_Coladas_H1_2020 FROM horno1;
SELECT count(*)AS Num_Coladas_H2_2020 FROM horno2;

# 2. Filtra cuantas coladas se realizaron por mes
SELECT MONTH(FinishedTime) AS Month, COUNT(*) AS HeatsPerMonth FROM horno1 GROUP BY MONTH(FinishedTime);
SELECT MONTH(FinishedTime) AS Month, COUNT(*) AS HeatsPerMonth FROM horno2 GROUP BY MONTH(FinishedTime);

SELECT COUNT(*) AS HeatsPerMonth FROM horno1 GROUP BY MONTH(FinishedTime);
SELECT COUNT(*) AS HeatsPerMonth FROM horno2 GROUP BY MONTH(FinishedTime);

# 3. Selecciona el promedio, máximo y mínimo de energía que se utilizó por mes.
SELECT MONTH(FinishedTime) AS Month, AVG(EnergyPerHeat) AS AvgEnergyPerHeat, MIN(EnergyPerHeat) AS MinEnergyPerHeat, MAX(EnergyPerHeat) AS MaxEnergyPerHeat FROM horno1 GROUP BY MONTH(FinishedTime);
SELECT MONTH(FinishedTime) AS Month, AVG(EnergyPerHeat) AS AvgEnergyPerHeat, MIN(EnergyPerHeat) AS MinEnergyPerHeat, MAX(EnergyPerHeat) AS MaxEnergyPerHeat FROM horno2 GROUP BY MONTH(FinishedTime);

# 4. Selecciona el peso promedio y energía total consumida por mes
SELECT MONTH(FinishedTime) AS Month, 
AVG(ChargesTotalWeight) AS AvgWeight, 
AVG(EnergyPerHeat) AS AvgEnergy,
SUM(ChargesTotalWeight) AS TotalWeight, 
SUM(EnergyPerHeat) AS TotalEnergy,
(SUM(EnergyPerHeat)/SUM(ChargesTotalWeight))*1000 AS kWH_Per_Ton
FROM horno2 GROUP BY MONTH(FinishedTime);

# 5. El número de CaveIn por mes en cada una de las fases
SELECT MONTH(FinishedTime) AS Month , SUM(CaveInCount1) AS CaveIn_PH1,SUM(CaveInCount2) AS CaveIn_PH2,SUM(CaveInCount3) AS CaveIn_PH3 FROM horno2 GROUP BY MONTH(FinishedTime);

SELECT MONTH(FinishedTime) AS Month , SUM(CaveInCount1) AS CaveIn_PH1,SUM(CaveInCount2) AS CaveIn_PH2,SUM(CaveInCount3) AS CaveIn_PH3, SUM(CaveInCount1+CaveInCount2+CaveInCount3) 
FROM horno1 GROUP BY MONTH(FinishedTime);

SELECT MONTH(FinishedTime) AS Month , SUM(CaveInCount1) AS CaveIn_PH1,SUM(CaveInCount2) AS CaveIn_PH2,SUM(CaveInCount3) AS CaveIn_PH3, SUM(CaveInCount1+CaveInCount2+CaveInCount3) 
FROM horno2 GROUP BY MONTH(FinishedTime);

#Cave In
SELECT SUM(CaveInCount1), SUM(CaveInCount2), SUM(CaveInCount3), SUM(CaveInCount1+CaveInCount2+CaveInCount3) FROM horno1;
SELECT SUM(CaveInCount1), SUM(CaveInCount2), SUM(CaveInCount3), SUM(CaveInCount1+CaveInCount2+CaveInCount3) FROM horno2;

#NCC totales
SELECT SUM(NonConductorCount1), SUM(NonConductorCount2), SUM(NonConductorCount3), SUM(NonConductorCount1+NonConductorCount2+NonConductorCount3) FROM horno1;
SELECT SUM(NonConductorCount1), SUM(NonConductorCount2), SUM(NonConductorCount3), SUM(NonConductorCount1+NonConductorCount2+NonConductorCount3) FROM horno2;

#NCC por mes
SELECT MONTH(FinishedTime) ,SUM(NonConductorCount1), SUM(NonConductorCount2), SUM(NonConductorCount3), SUM(NonConductorCount1+NonConductorCount2+NonConductorCount3) 
FROM horno1
GROUP BY MONTH(FinishedTime);

SELECT MONTH(FinishedTime) ,SUM(NonConductorCount1), SUM(NonConductorCount2), SUM(NonConductorCount3), SUM(NonConductorCount1+NonConductorCount2+NonConductorCount3) 
FROM horno2
GROUP BY MONTH(FinishedTime);

#I2T por mes
SELECT MONTH(FinishedTime) ,AVG(I2t1), AVG(I2t2), AVG(I2t3) 
FROM horno2
GROUP BY MONTH(FinishedTime);

#ISEC
SELECT MONTH(FinishedTime) ,AVG(AvgCurrent1), AVG(AvgCurrent2), AVG(AvgCurrent3) 
FROM horno1
GROUP BY MONTH(FinishedTime);

# Peso total
SELECT SUM(ChargesTotalWeight)AS Num_Coladas_H1_2020 FROM horno1;
SELECT SUM(ChargesTotalWeight)AS Num_Coladas_H1_2020 FROM horno2;

SELECT SUM(ChargesTotalWeight) FROM horno2;


#Energía total
SELECT SUM(EnergyPerHeat) FROM horno1;
SELECT SUM(EnergyPerHeat) FROM horno2;

SELECT (SUM(EnergyPerHeat)/ SUM(ChargesTotalWeight))*1000 FROM horno1;
SELECT (SUM(EnergyPerHeat)/ SUM(ChargesTotalWeight))*1000 FROM horno2;

#Costo energía eléctrica
SELECT SUM(EnergyPerHeat) * 111 FROM horno1;
SELECT SUM(EnergyPerHeat) * 111 FROM horno2;

#Costo chatarra
SELECT SUM(ChargesTotalWeight)*201 FROM horno1;
SELECT SUM(ChargesTotalWeight)*201 FROM horno2;

#Promedios
SELECT AVG(Utilization) FROM horno1;
SELECT AVG(Utilization) FROM horno2;

#Utilization
SELECT AVG(Utilization) FROM horno2 GROUP BY MONTH(FinishedTime);

#Steel temp
SELECT AVG(SteelTemperature) FROM horno2 GROUP BY MONTH(FinishedTime);
-----------------
################################################
SELECT h1.Month, h1.Temp_H1, h2.Temp_H2
FROM(
SELECT MONTH(FinishedTime) AS Month,
AVG(SteelTemperature) AS Temp_H1
FROM horno1 GROUP BY MONTH(FinishedTime)) AS h1
JOIN (
SELECT MONTH(FinishedTime) AS Month,
AVG(SteelTemperature) AS Temp_H2
FROM horno2 GROUP BY MONTH(FinishedTime)) AS h2
ON h1.Month=h2.month;


##OTRO (No funcionó)

SELECT SUM(CaveInCount1) AS x,
(SELECT SUM(CaveInCount1) FROM horno2 GROUP BY month(horno2.FinishedTime)) AS xx
FROM horno1
GROUP BY month(FinishedTime);

#EL BUENO

#Es mejor el join porque es más eficiente, por lo que se deben unir las tablas con el join, y posteriormente se agrupa.
#No como en el ejemplo anterior donde se agrupan dos tablas y luego se unen a través de subconsultas (No es tan eficinte.

SELECT 
MONTH(horno1.FinishedTime),
AVG(horno1.SteelTemperature) AS Temp_H1,
AVG(horno2.SteelTemperature) AS Temp_H2
FROM horno1
JOIN horno2
ON MONTH(horno1.FinishedTime) = MONTH(horno2.Finishedtime)
GROUP BY MONTH(horno1.FinishedTime);

#################################################
SELECT MONTH(FinishedTime) AS Month,
(SteelTemperature) AS Temp
FROM horno2 GROUP BY MONTH(FinishedTime);
---------

SELECT SteelTemperature FROM horno2;

SELECT SteelTemperature FROM horno1 WHERE MONTH(FinishedTime)=12;

#Peso
SELECT AVG(ChargesTotalWeight), stddev_samp(ChargesTotalWeight) FROM horno2 GROUP BY MONTH(FinishedTime);

SELECT Utilization FROM horno2 WHERE MONTH(FinishedTime)=8;

SELECT SUM(a+b+c)
FROM
(SELECT SUM(CaveInCount1) AS a, SUM(CaveInCount2) AS b, SUM(CaveInCount3) AS c FROM horno1) as z;
```
## Postwork 3

```sql
SELECT * FROM horno1;

# 1. Join de las dos tablas relacionando su número de colada 
#CREATE VIEW vista1 AS
SELECT 
horno2.HeatNumber, horno2.TapToTap AS TapToTap_H2, horno2.EnergyPerHeat AS Energy_H2,
horno1.TapToTap AS TapToTap_H1, horno1.EnergyPerHeat AS Energy_H1
FROM horno1
RIGHT JOIN horno2
ON horno1.HeatNumber = horno2.HeatNumber;

# 2. Join y comparación de energía consumida por tonelada de acero fundido
#CREATE VIEW vista2 AS
SELECT 
horno2.HeatNumber, horno2.EnergyPerChargeTon AS H2_EnergyPerChargeTon, horno2.ChargesTotalWeight AS H2_TotWeight,
horno1.EnergyPerChargeTon AS H1_EnergyPerChargeTon, horno1.ChargesTotalWeight AS H1_TotWeight
FROM horno1
RIGHT JOIN horno2
ON horno1.HeatNumber = horno2.HeatNumber;

# 3. Seleccionar el promedio y desviación estándar de la energía por mes
#CREATE VIEW vista3 AS
SELECT MONTH(FinishedTime) AS Month, AVG(EnergyPerHeat) AS AvgEnergyPerHeat, STDDEV_POP(EnergyPerHeat) AS Std_Dev_EnergyPerHeat
FROM horno1
GROUP BY MONTH(FinishedTime);

# 4. Selecciona los datos más importantes promedio por día de la semana durante todo el año (lunes a domingo)
#CREATE VIEW vista4 AS
SELECT weekday(FinishedTime) AS Day, count(*) AS NumHeats,
AVG(EnergyPerHeat) AS AvgEnergyPerHeat,
AVG(ChargesTotalWeight) AS AvgChargesTotalWeight,
AVG(TapToTap) AS TapToTap,
AVG(Utilization) AS AvgUtilization
FROM horno2 
GROUP BY WEEKDAY(FinishedTime) 
ORDER BY Day;

# 5. Selecciona el top 10 de coladas con un mayor factor de potencia (promedio por las 3 fases) y muestra la información de la potencia
#CREATE VIEW vista5 AS
SELECT 
DATE(FinishedTime) AS Date,
HeatNumber,
TapToTap,
PowerOn,
Utilization,
(PowerFactor1+PowerFactor2+PowerFactor3)/3 AS AvgPowerFactor,
(ApparentPower1+ApparentPower2+ApparentPower3)/3 AS AvgApparentPower,
(ReactivePower1+ReactivePower2+ReactivePower3)/3 AS AvgReactivePower,
(RealPower1+RealPower2+RealPower3)/3 AS AvgRealPower
FROM horno1
ORDER BY AvgPowerFactor DESC
LIMIT 10;

#SELECT MONTH(FinishedTime),
#(PowerFactor1+PowerFactor2+PowerFactor3)/3 AS AvgPowerFactor
#FROM horno1
#GROUP BY MONTH(FinishedTime);
```
## Postwork 4

```json
# 1. Filtrar las columnas de HeatId, P_On, P_Off 

[{$project: {
  HeatNumber:1,
  TapToTap:1,
  PowerOff:1,
  PowerOn:1
}}]


# 2. Filtrar las coladas con duración mayor a 1 hora y media

[{$project: {
  HeatNumber: 1,
  TapToTap: 1,
  PowerOff: 1,
  PowerOn: 1
}}, {$match: {
  TapToTap : {$gte : 90}
}}]

# 3. Filtrar las coladas con el rendimiento más alto (Utilization -> PowerOn/TapToTap)

[{$project: {
  HeatNumber: 1,
  TapToTap: 1,
  PowerOff: 1,
  PowerOn: 1,
  Utilization:1
}}, {$sort: {
  Utilization:-1

  }}]


# 4. Filtrar el top 10 de coladas más largas y después más cortas

[{$project: {
  HeatNumber: 1,
  TapToTap: 1,
  PowerOff: 1,
  PowerOn: 1,

}}, {$sort: {
  TapToTap:-1
  }}]


# 5. Filtrar las 10 coladas que más energía se utilizó cuando se usaron 2 cargas.


[{$project: {
  HeatNumber: 1,
  TapToTap: 1,
  PowerOff: 1,
  PowerOn: 1,
  EnergyPerHeat:1,
  Charges:1

}}, {$match: {
  Charges:2
}}, {$sort: {
  EnergyPerHeat:-1
}}, {$limit: 10}]
```

