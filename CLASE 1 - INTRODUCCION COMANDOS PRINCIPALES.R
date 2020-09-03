##--------------BETAMERICA-------------------##
## INTRODUCCION A LOS PRINCIPALES COMANDOS DE R
## CLASE 1

## Librerias
#Solo se instala una vez y se la vuelve a llamar 
install.packages("dplyr")
install.packages("openxlsx")
install.packages("lubridate")

library("dplyr")
library(openxlsx)
library(lubridate)

## Calculos
1 + 1

## Creacion de objetos 
# x<- asigno 
# Creacion de un vector numerico
x<- c(1,3,7)
y<- c(2,7,3)

# Unir x,y en una matriz 
# data.frame convierte un conjunto de vectores en una matriz manipulable
data <- data.frame(x,y)

# Vector mas grande
x <- c(1,3,7,5,7,8)
y <- c(2,7,3,5,6,3)
data <- data.frame(x,y)
data

## Cargar base de datos con diferente extension 
# Donde se encuentra guardada la base de datos, me devuelve la ruta del archivo
file.choose()
# Base de excel 
#Columna fecha no tiene formato fecha detectDates
data1<-read.xlsx("C:\\Users\\Tefyta\\Documents\\CURSOS\\BETAMETRICA R\\BASES DE DATOS\\DEP_2016_BP.xlsx",
                 detectDates = TRUE)

# Leer matriz (fila,columna)
# Buscar un elemento especifico 
data[2,1]
data[5,2]
# Solo la fila 
data[,2]
data[1,]
# Tres primeros elementos 
# : desde hasta 
data[1:3,1:2]
data[1:5,2]
data[1:4,1]
# Otra forma llamar a columna
data$x
data$y
# Saber los nombres de las variables 
names(data)
names(data1)
# Todas las filas de la columna region
data1[,5]
# Nueva base solo con la columna 5
nueva.base<-data.frame(data1[,5])
names(nueva.base)
# Cambiar nombre a columnas 
names(nueva.base)[1]<-"REGION"





