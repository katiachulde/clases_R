##PREPARAR LOS DATOS
library(readxl)
datos <- read.xlsx("C:/Users/THONY$27/Desktop/RESPALDOS KATIA CHULDE/Desktop/PERSONAL/2019/Maestria Universitaria en Inteligencia de Negocios/Materias/2. Segundo semestre/Gestion_Proyectos_BI/Tarea 3/t7_cigarrillos_empleo.xlsx")


nrow(datos)
ncol(datos)
str(datos)
summary(datos)

boxplot(datos$Consumocigarrillos)
mean(datos$Consumocigarrillos)
median(datos$Consumocigarrillos)
##logaritmo
names(datos)
Consumocigarrillos<-log(datos$Consumocigarrillos)
Preciomedio<-log(datos$Preciomedio)
Salariomedio<-log(datos$Salariomedio)
Desempleados<-log(datos$Desempleados)

##CREAR MODELO
Modelo1=lm(datos$Consumocigarrillos~datos$Preciomedio+datos$Salariomedio+datos$Desempleados)
summary(Modelo1)
confint(Modelo1, level=0.95)

##CREAR MODELO CON VARIABLES TRANSFORMADAS
Modelo2=lm(Consumocigarrillos~Preciomedio+Salariomedio+Desempleados)
summary(Modelo2)
confint(Modelo2, level=0.95)

##SERIE TEMPORAL PRECIO
preciots<-ts(Preciomedio, frequency = 2, start=c(1990))
plot(preciots)
decompose(preciots)
plot(decompose(preciots))


##SERIE TEMPORAL SALARIO
salariots<-ts(datos$Salariomedio, frequency = 2, start=c(1990))
plot(salariots)
decompose(salariots)
plot(decompose(salariots))

##SERIE TEMPORAL DESEMPLEO
desempleots<-ts(datos$Desempleados, frequency = 2, start=c(1990))  
plot(desempleots)
decompose(desempleots)
plot(decompose(desempleots))

##CONTRASTE DE HIPÓTESIS
hyp = c(0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0)
rhs = c(0.40)

lht(Model1, hyp, rhs)