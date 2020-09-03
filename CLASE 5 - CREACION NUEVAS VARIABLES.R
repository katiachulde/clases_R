##----------------BETAMETRICA-----------------------##
## CLASE 5
## Creación de nuevas variables en la misma base de datos o en otra base de 
## datos -MDB-dplyr

# LIBRERIAS
library(dplyr)

# FUNCION MUTATE Y TRANSMUTE 
# MUTATE: permite hacer transformaciones, operaciones entre variables en la
# base
# TRANSMUTE: crea otra base con las variables nuevas

# BASE DE DATOS
# header = T : primera linea nombre variables
data<- read.csv("C:\\Users\\Tefyta\\Documents\\CURSOS\\BETAMETRICA R\\BASES DE DATOS\\Iowa_Liquor_Sales.csv", stringsAsFactors= FALSE,
                header = T)
names(data)
# Tipo de variable 
str(data)

##------------------------------------------------------
# FUNCION MUTATE 
# Costo total de botellas vendidas
# Sale error porque una variable es caracter 
data$State.Bottle.Cost*data$Bottles.Sold

# Funcion que permita cambiar tipo de variable 
# Costo de la botella tiene el operador de $, vamso a quitar
# substr es equivalente a la funcion extrae
# Extrae desde la posicion 2 porque la 1 es el signo $ 
# Hasta la posicion 15
substr(data$State.Bottle.Cost , 2 , 15)

# Lo extraido vamos hacerle numerico 
as.numeric(substr(data$State.Bottle.Cost , 2 , 15))
str(data)
names(data)

# PARA OBTENER UTILIDAD
# REPETIMOS
# Costo total de botellas vendidas
# Sale error porque una variable es caracter 
# Costo.total es nueva variable 
# Hacemos de adentro hacia afuera
data <- mutate(data,
               costo.total =
               as.numeric(substr(data$State.Bottle.Cost , 2 , 15))*
               Bottles.Sold)

# Ingreso total
# Utilidad
str(data)
data <- mutate(data,
               ingreso.total=
                 as.numeric(substr(data$State.Bottle.Retail , 2 , 15))*
                 Bottles.Sold,
               utilidad= ingreso.total-costo.total)

##------------------------------------------------------
# FUNCION TRANSMUTE
# Crea las variables en otra base 
# Ingreso total
# Utilidad
str(data)
data2 <- transmute(data,
               costo.total=
                     as.numeric(substr(data$State.Bottle.Cost , 2 , 15))*
                     Bottles.Sold,
               ingreso.total=
                 as.numeric(substr(data$State.Bottle.Retail , 2 , 15))*
                 Bottles.Sold,
               utilidad= ingreso.total-costo.total)

##------------------------------------------------------
# FUNCION if_else: equivalente a la funcion si (condicion
# verdadero, falso)
data<- mutate(data,
              resultado=if_else(utilidad>0,"utilidad", "perdida"))
table(data$resultado)

# En otra base
data3<- transmute(data,
              resultado=if_else(utilidad>0,"utilidad", "perdida"))
table(data$resultado)
table(data3$resultado)


