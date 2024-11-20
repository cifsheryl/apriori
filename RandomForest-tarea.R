install.packages("randomForest")
library(randomForest)

migracion<- read.csv('C:/Users/Mario CIfuentes/Downloads/db/migracion.csv', sep=',')
migracion <- na.omit(migracion)

migracion <- migracion[, c("DEPARTAMENTO",  "AREA", "PEI3", "PEI4", "PEI5")]

migracion$DEPARTAMENTO <- as.factor(migracion$DEPARTAMENTO)
migracion$PEI3 <- as.factor(migracion$PEI3)

str(migracion)

set.seed(123)
migracion <- migracion[sample(1:nrow(migracion)),]
index <- sample(1:nrow(migracion), 0.1 * nrow(migracion))

train <- migracion[index, ]
test <- migracion[-index, ]

rf_model <- randomForest(PEI5 ~ DEPARTAMENTO + AREA + PEI3 + PEI4,
                         data = train, ntree = 50, mtry = 3)     

print(rf_model)

importance(rf_model)

predicciones <- predict(rf_model, test)


nuevo_dato <- data.frame(
  DEPARTAMENTO = factor(1, levels = levels(train$DEPARTAMENTO)), 
  AREA = 1,  
  PEI3 = factor("2", levels = levels(train$PEI3)),  
  PEI4 = 30 
)

prediccion_nueva <- predict(rf_model, nuevo_dato)

prediccion_nueva


str(train)
str(nuevo_dato) 
