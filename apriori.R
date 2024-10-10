install.packages("arules")
library(arules)

data<- read.csv('C:\\Users\\Mario CIfuentes\\Downloads\\db_csv_\\db_csv_\\HOGAR_BDP.csv', sep=",")
View(data)

reglas <- apriori(data, parameter = list(support=0.2, confidence=0.5))
inspect(reglas[0:100] )


inspect(head(sort(reglas, by = "support"), 3))
