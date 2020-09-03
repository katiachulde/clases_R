##----------------BETAMETRICA---------------------------##
## CLASE 7
## Ordenando los datos y obteniendo valores únicos MBD-dplyr

# LIBRERIAS
library(dplyr)

# Funciones distinct & arrange
# Distinct: sirve para obtener valores unicos de una categoria
# Arrange: sirve para ordenar una columna de forma ascendente
# o descendente

file.choose()
data<-read.csv("C:\\Users\\Tefyta\\Documents\\CURSOS\\BETAMETRICA R\\BASES DE DATOS\\Iowa_Liquor_Sales.csv", stringsAsFactors = F,
               header=T)

# Quiero saber cuantas categorias existen en ciudad
distinct(data,City)

# Unos nombres de las ciudades esta en mayusculas y minisculas
# Sapply: hacer todo mayusculas o minusculas
# Tolower: minusculas
# Toupper: mayusculas
sapply(data$City,tolower)
# Incorporar como una variable dentro de data que reemplace
# a City

data<-mutate(data, City=sapply(data$City,tolower))
distinct(data,City)

# Arrange: ordena los valores ascendente
names(data)
data<-arrange(data,
        Sale..Dollars.)
# De forma descendente
data<-arrange(data,
              desc(Sale..Dollars.))
# Ordenar por otra variable
data<-arrange(data,
              Sale..Dollars. ,Bottles.Sold)

# Principales valores, en este caso los 3 primeros 
head(data, n=3L)
