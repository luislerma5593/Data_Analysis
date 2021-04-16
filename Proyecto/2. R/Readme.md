# 2. Proyecto

```r
library(DBI)
library(RMySQL)
library(dplyr)
library(lubridate)
library(ggplot2)
# library(reshape)

MyDataBase <- dbConnect(
  drv = RMySQL::MySQL(),
  dbname = "proyecto",
  host = "bedu-llt-2101.cqoiqc8blzss.us-east-2.rds.amazonaws.com",
  username = "lldlt",
  password = "***")

dbListTables(MyDataBase)

dbListFields(MyDataBase, 'horno1')


h1_db <- dbGetQuery(MyDataBase, "select * from horno1")
h2_db <- dbGetQuery(MyDataBase, "select * from horno2")

h1 <- mutate(h1_db, FinishedTime = as.Date(FinishedTime, format("%Y-%m-%d")))
h2 <- mutate(h2_db, FinishedTime = as.Date(FinishedTime, format("%Y-%m-%d")))

h1 <- rename(h1, Date = FinishedTime)
h2 <- rename(h2, Date = FinishedTime)



##########################   INFORMACIÓN IMPORTANTE

h1_resumen <- select(h1, Date, PowerOff:ChargesTotalWeight, EnergyPerHeat, EnergyPerChargeTon)
h2_resumen <- select(h2, Date, PowerOff:EnergyPerHeat, EnergyPerChargeTon)

h1_group <- aggregate(h1_resumen, by = list(month(h1_resumen$Date)), FUN = mean)
h1_group <- rename(h1_group,Month = Group.1)
h1_group$Count <- count(h1_resumen, month(Date))[,2]

h2_group <- aggregate(h2_resumen, by = list(month(h2_resumen$Date)), FUN = mean)
h2_group <- rename(h2_group,Month = Group.1)
h2_group$Count <- count(h2_resumen, month(Date))[,2]

h1g <- h1_group
h2g <- h2_group

##########################   ELIMINAR EXCESO DE DF

rm(h1_db,h2_db,h1_group,h2_group,h1_resumen,h2_resumen)

##########################   GRAFICAS


par(mfrow = c(2, 2))

#  POF
x1<- h1g$PowerOff
x2<- h2g$PowerOff
graf <- barplot(t(cbind(x1,x2)) , border=T, beside = T , names.arg=h1g$Month , 
               las=1 , 
               col = c("SteelBlue","grey"),
               main="Power Off promedio por mes" ,
               ylim = c(0,max(x1,x2)+5), xlab = "Month", ylab="Minutes"
)
text(graf, t(cbind(x1+2,x2+2)) , paste(t(cbind(round(x1,1),round(x2,1)))),cex=0.7) 
abline(h = mean(x1), col="blue"); abline(h = mean(x2), col="black")

#  PON
x1<- h1g$PowerOn
x2<- h2g$PowerOn
graf <- barplot(t(cbind(x1,x2)) , border=T, beside = T , names.arg=h1g$Month , 
                las=1 , 
                col = c("SteelBlue","grey"),
                main="Power On promedio por mes" ,
                ylim = c(0,max(x1,x2)+10), xlab = "Month", ylab="Minutes"
)
text(graf, t(cbind(x1+2,x2+2)) , paste(t(cbind(round(x1,1),round(x2,1)))),cex=0.7) 
abline(h = mean(x1), col="blue"); abline(h = mean(x2), col="black")

#  TAPTAP
x1<- h1g$TapToTap
x2<- h2g$TapToTap
graf <- barplot(t(cbind(x1,x2)) , border=T, beside = T , names.arg=h1g$Month , 
                las=1 , 
                col = c("SteelBlue","grey"),
                main="Tap to Tap promedio por mes" ,
                ylim = c(0,max(x1,x2)+5), xlab = "Month", ylab="Minutes"
)
text(graf, t(cbind(x1+2,x2+2)) , paste(t(cbind(round(x1,1),round(x2,1)))),cex=0.7)  
abline(h = mean(x1), col="blue"); abline(h = mean(x2), col="black")

#  UTILIZATION
x1<- h1g$Utilization
x2<- h2g$Utilization
graf <- barplot(t(cbind(x1,x2)) , border=T, beside = T , names.arg=h1g$Month , 
                las=1 , 
                col = c("SteelBlue","grey"),
                main="Utilization promedio por mes" ,
                ylim = c(0,max(x1,x2)+10), xlab = "Month", ylab="Minutes"
)
text(graf, t(cbind(x1+2,x2+2)) , paste(t(cbind(round(x1,1),round(x2,1)))),cex=0.7) 
abline(h = mean(x1), col="blue"); abline(h = mean(x2), col="black")





########################## GRÁFICAS DE ENERGÍA

par(mfrow = c(2, 1))

#  MWH
x1<- h1g$EnergyPerHeat
x2<- h2g$EnergyPerHeat
graf <- barplot(t(cbind(x1,x2)) , border=T, beside = T , names.arg=h1g$Month , 
                las=1 , 
                col = c("SteelBlue","grey"),
                main="Consumo promedio de energía por mes" ,
                ylim = c(0,max(x1,x2)+5), xlab = "Month", ylab="MWH"
)
text(graf, t(cbind(x1+2,x2+2)) , paste(t(cbind(round(x1,1),round(x2,1)))),cex=0.7) 
abline(h = mean(x1), col="blue"); abline(h = mean(x2), col="black")

#  KWH/TON
x1<- h1g$EnergyPerChargeTon
x2<- h2g$EnergyPerChargeTon
graf <- barplot(t(cbind(x1,x2)) , border=T, beside = T , names.arg=h1g$Month , 
                las=1 , 
                col = c("SteelBlue","grey"),
                main="Energía por unidad de carga promedio por mes" ,
                ylim = c(0,max(x1,x2)+40), xlab = "Month", ylab="kWh/ton"
)
text(graf, t(cbind(x1+2,x2+2)) , paste(t(cbind(round(x1,1),round(x2,1)))),cex=0.7) 
abline(h = mean(x1), col="blue"); abline(h = mean(x2), col="black")


dev.off()



##########################   GGPLOT


ggplot(h1g, aes(x = factor(Month), y =  PowerOn)) + 
  geom_col(colour = "black", fill= "Steelblue") +
  geom_text(aes(y = round(PowerOn, 6), label = round(PowerOff, 3)), 
            position = "identity", size=3, vjust = -1, hjust=0.5 ,col="black") +
  ggtitle("Promedio mensual de Power Off") + 
  xlab("Mes") +
  ylab("Minutos") +
  theme_minimal()

###############################################################################
###############################################################################
###############################################################################

######################### HISTOGRAMAS

ggplot(data = resumen, aes(EnergyPerChargeTon)) + geom_histogram(col="black")

hist(resumen$EnergyPerChargeTon, breaks = 30)

hist(resumen2$EnergyPerChargeTon, breaks = 30)

filtro2 <- filter (resumen2, resumen2$EnergyPerChargeTon > 250)

hist2<-hist(filtro2$EnergyPerChargeTon, breaks = 30)

hist(resumen$EnergyPerChargeTon, breaks = 30, ylim = c(0,70))
lines(hist2, col="red",  )
lines(hist2, lty = 1, col="red" )







######################### SERIES DE TIEMPO

resumen <- aggregate(h1, by = c(list(day(h1$Date)),list(month(h1$Date))), FUN = mean)
resumen2 <- aggregate(h2, by = c(list(day(h2$Date)),list(month(h2$Date))), FUN = mean)



plot(resumen$EnergyPerChargeTon, type = "l", main ="Promedio de kwh/ton por día", ylab = "kWh/ton")
plot(resumen$EnergyPerHeat, type = "l", main ="Promedio de energía por día", ylab = "MWh")


serie <- ts(resumen$EnergyPerChargeTon, frequency = 100 ); plot(serie)

dec <- decompose(serie, type="additive")

plot(dec)


#####################

plot(resumen$EnergyPerChargeTon, type = "l")
lines(resumen2$EnergyPerChargeTon, col="red")


##################### Regresión lineal

plot(h1$EnergyPerHeat, h1$ChargesTotalWeight); cor(h1$EnergyPerHeat, h1$ChargesTotalWeight)


reg <- filter (h1, h1$ChargesTotalWeight < 200,
                    h1$ChargesTotalWeight> 50,
                    h1$EnergyPerChargeTon < 600,
               h1$EnergyPerChargeTon>200)


plot(reg$EnergyPerHeat, reg$ChargesTotalWeight); cor(reg$EnergyPerHeat, reg$ChargesTotalWeight)


filtro1 <- filter (resumen, resumen$TapToTap < 200)
plot(filtro1$Utilization,filtro1$ControlManualPercent )

plot(resumen$RWI1,resumen$AvgCurrent1)

```
