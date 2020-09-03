##----------------BETAMETRICA---------------------------##
## CLASE 6
## Uniendo bases, uniendo filas y columnas: join, bind_rows,
## bind_col - MBD

# LIBRERIAS
library(dplyr)
library(openxlsx)

# Ubicar directorio 
file.choose()


#--------------------------------------------------------

# UNIENDO BASE DE DATOS 
# Bases de datos 
data1<- read.csv("C:\\Users\\Tefyta\\Documents\\CURSOS\\BETAMETRICA R\\BASES DE DATOS\\Iowa_Liquor_Sales_A.csv", stringsAsFactors= FALSE,
                 header = T)

data2<- read.csv("C:\\Users\\Tefyta\\Documents\\CURSOS\\BETAMETRICA R\\BASES DE DATOS\\Iowa_Liquor_Sales_B.csv", stringsAsFactors= FALSE,
                 header = T)

# Existen dos variables que solo estan en data2 
# Hacer una sola base con todas las variables 
# Buscar variable de referencia id
# JOIN combinar bases de datos
# De base 2 se vaya a 1 left_join
# De base 1 se vaya a 2 right_join
names(data1)

data3 <-  full_join(data1, data2,
                    by="Invoice.Item.Number")
# inner_join: todas las filas en x y y
# semi_join: nunca devuelve valores duplicados valores en x
# mantiene las columnas de x
# anti_join: devuelve las filas de x que no coinciden en y 
# mantiene la columna de x
# full_join: devuelve todo y tambien valores faltantes 
  
##-----------------------------------------------------##  
# COMBINAR COLUMNAS 

# Ubicar directorio 
file.choose()
# Bases de datos 
data1<- read.xlsx("C:\\Users\\Tefyta\\Documents\\CURSOS\\BETAMETRICA R\\BASES DE DATOS\\DEP_2016_BP_A.xlsx" ,detectDates = TRUE)

data2<- read.xlsx("C:\\Users\\Tefyta\\Documents\\CURSOS\\BETAMETRICA R\\BASES DE DATOS\\DEP_2016_BP_B.xlsx" ,detectDates = TRUE)

# No existe una variable unica como id 
# No se puede utilizar join, solo combinar las variables
# que hace falta
# Bind_cols: Combina columnas 
z<- bind_cols(data1, data2)

##-----------------------------------------------------##  
# COMBINAR FILAS 

# Ubicar directorio 
file.choose()
# Bases de datos 
data1<- read.xlsx("C:\\Users\\Tefyta\\Documents\\CURSOS\\BETAMETRICA R\\BASES DE DATOS\\DEP_2016_BP_C.xlsx" ,detectDates = TRUE)

data2<- read.xlsx("C:\\Users\\Tefyta\\Documents\\CURSOS\\BETAMETRICA R\\BASES DE DATOS\\DEP_2016_BP_D.xlsx" ,detectDates = TRUE)

# No existe una variable unica como id 
# Bind_rows: Combina columnas 
# En el ejemplo las fechas son la continuidad de la otra
# S1: Deben ser las mismas variables tanto en 1 como en 2
# S2: tengan el mismo formato 
names(data2)
z<- bind_rows(data1, data2)
class(data1$OFICINAS)
# oficinas en data1 es caracter y data2 es numerico
# vamos hacer numerico en data1
data1$OFICINAS<-as.numeric(data1$OFICINAS)
data.nueva<- bind_rows(data1, data2)

  
  

