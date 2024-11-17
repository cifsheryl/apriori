install.packages("rpart")
install.packages("rpart.plot")

library(rpart)
library(rpart.plot)

vivienda <- read.csv('C:/Users/Mario CIfuentes/Downloads/db/VIVIENDA_BDP.csv', sep = ',')

arbol <- rpart(AREA ~
                 PCV1+
                 PCV2+
                 PCV3+
                 PCV4+
                 PCV5,
               data = vivienda, method = "class")

rpart.plot(arbol, type=2, extra=0, under = TRUE, fallen.leaves = TRUE, box.palette = "BuGn", 
           main ="Predicción de area", cex = 1)

casa <- data.frame(
  PCV1=c(2),
  PCV2=c(3),
  PCV3=c(1),
  PCV4=c(1),
  PCV5=c(1)
)

result <- predict(arbol,casa, type="class")

result

------------------------------------------------------------------------------------------

arbol_pc1 <- rpart(PCV1 ~ PCV2 + PCV3 + PCV4 + PCV5, data = vivienda, method = "class")


rpart.plot(arbol_pc1, type = 2, extra = 0, under = TRUE, fallen.leaves = TRUE, 
           box.palette = "BuGn", main = "Predicción del Tipo de Vivienda (PCV1)", cex = 1)


nueva_casa_pc1 <- data.frame(
  PCV2 = c(3),
  PCV3 = c(1),
  PCV4 = c(1),
  PCV5 = c(1)
)


prediccion_tipo_vivienda <- predict(arbol_pc1, nueva_casa_pc1, type = "class")


print(prediccion_tipo_vivienda)


