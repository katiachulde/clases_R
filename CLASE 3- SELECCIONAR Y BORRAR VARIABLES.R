##----------------BETAMETRICA-----------------------##
## CLASE 3 
## Seleccionando y borrando variables de la una base de datos -MBD-dply

# Librerias 
library(dplyr)

# BASE DE DATOS
file.choose()
# Archivo cvs, stringsAsFactors convierte factor alguna variable
data<- read.csv("C:\\Users\\Tefyta\\Documents\\CURSOS\\BETAMETRICA R\\BASES DE DATOS\\Iowa_Liquor_Sales.csv", stringsAsFactors= FALSE)
names(data)

## TRATAMIENTO DATOS 

# SELECCIONAR VARIABLES 
# Forma 1: nombre columna
nueva.base<-select(data, Invoice.Item.Number,Vendor.Name,Category)
nueva.base<-select(data, Date:Address)
# Forma 2: segun numero de columna 
nueva.base<-select(data, c(2:5))
# Ordenar variables siempre al principio 
nueva.base<-select(data, Date, everything())
nueva.base<-select(data, Date, Store.Name, everything())

# BORRAR VARIABLES 
#Forma 1: nombre variables
nueva.base<-select(data, -Date)
nueva.base<-select(data, -Date, -Address, -City)
nueva.base<-select(data, -c(Address:Vendor.Name))
# Forma 2: numero columnas 
nueva.base<-select(data, -c(1,3,5))
nueva.base<-select(data, -c(3:5))




