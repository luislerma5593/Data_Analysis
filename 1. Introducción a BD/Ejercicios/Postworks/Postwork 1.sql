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