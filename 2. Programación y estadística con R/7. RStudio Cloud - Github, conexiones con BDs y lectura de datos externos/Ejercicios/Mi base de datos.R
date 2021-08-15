
library(DBI)
library(RMySQL)

MyDataBase <- dbConnect(
  drv = RMySQL::MySQL(),
  dbname = "proyecto",
  host = "bedu-llt-2101.cqoiqc8blzss.us-east-2.rds.amazonaws.com",
  username = "lldlt",
  password = "xxx#")

dbListTables(MyDataBase)

dbListFields(MyDataBase, 'horno1')


DataDB <- dbGetQuery(MyDataBase, "select * from horno1")
