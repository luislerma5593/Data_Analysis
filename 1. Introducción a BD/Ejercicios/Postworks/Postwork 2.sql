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
