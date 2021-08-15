library(dplyr)

# Step 1
data <- read.csv("https://raw.githubusercontent.com/guru99-edu/R-Programming/master/lahman-batting.csv") 
  
  # Step 2
 data2 <- select(data, playerID, yearID, AB, teamID, lgID, G, R, HR, SH)
  
  # Step 3
  data3 <- arrange(data2, playerID, teamID, yearID)

  glimpse(data3)

 a<-  summarise(data3, mean_run =mean(R))  

 
 #############

 group_by(mtcars, cyl)
 