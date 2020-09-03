##----------------BETAMETRICA-----------------------##
## CLASE 4
## Filtrando bases de datos utilizando la función filter - MDB - dplyr

# LIBRERIAS
library(dplyr)

# BASE DE DATOS 
# header = T : primera linea nombre variables
data<- read.csv("C:\\Users\\Tefyta\\Documents\\CURSOS\\BETAMETRICA R\\BASES DE DATOS\\Iowa_Liquor_Sales.csv", stringsAsFactors= FALSE,
                header = T)

# PAQUETE DPLYR
#FILTRAR VARIABLES 
names(data)
nueva.base<-filter(data,
                   City=="DAVENPORT")
table(nueva.base$City)

# Problema en nombre de variables 
# La , significa igual que & 
# & : Operador logico Y
# | : Operador logico O
# En este caso el operador logico | es porque de una sola columna
# no puede haber una interseccion 
table(data$City)
nueva.base<-filter(data, 
                   City=="DAVENPORT"| City=="CEDAR RAPIDS") 
table(nueva.base$City)
nueva.base<-filter(data,
                   City=="DAVENPORT" &
                   Bottles.Sold>=6)
min(nueva.base$Bottles.Sold)
max(nueva.base$Bottles.Sold)
table(nueva.base$City)

#FILTRO CON PAQUETE BASE 
zz<-data[data$City=="DAVENPOR"&
           data$Bottles.Sold>=6]

# EFICIENCIA PAQUETE BASE Y DPLR 
# DPYR Consume menos recursos del sistema 
system.time(nueva.base<-filter(data, 
                               City=="DAVENPORT"| City=="CEDAR RAPIDS") )
system.time(zz<-data[data$City=="DAVENPOR"&
                       data$Bottles.Sold>=6])

# Filtro con 3 condicionales 
nueva.base<-filter(data, 
                   City=="DAVENPORT" &
                   Bottles.Sold>=6 &
                   Volume.Sold..Gallons.>=3)
names(data)

table(nueva.base$City)

# Filtro con mas condicionales 
# Mejor poner la coma para el & y separar diferente condicional
# Para un solo condicional si utilizar &
nueva.base<-filter(data, 
                   City=="Davenport" | City=="CEDAR RAPIDS" ,
                   Bottles.Sold>=6 & Bottles.Sold<=15)
table(nueva.base$City)
min(nueva.base$Bottles.Sold)
max(nueva.base$Bottles.Sold)

# Condicional distinto 
nueva.base<-filter(data,
                   City!="DAVENPORT",
                   Bottles.Sold!=6)
table(nueva.base$City)

# Obtener 20 primeros registros de la base de datos
# Slice: toma el numero de filas que disponga 
nueva.base<-slice(data, 1:20)

