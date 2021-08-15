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

