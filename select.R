### CURSO ONLINE ###
### MANEJO DE BASES DE DATOS ### 

###### SIGUENOS EN NUESTRAS REDES SOCIALES

### Twitter: https://twitter.com/BetametricaEC
### Facebook: https://www.facebook.com/betametricaec/
### www.betametrica.ec

### TE INVITO A SEGUIRME EN MIS REDES SOCIALES ###

### Twitter: https://twitter.com/CasaresFelix
### Facebook: https://www.facebook.com/CasaresFelix/
### www.casaresfelix.com


##### ¡Contribuyendo con el desarrollo empresarial y profesional del Ecuador!

#control + enter
#install.packages("dplyr")
library(dplyr)


# Ubiquemos el directorio donde se encuentra el archivo de interés
file.choose()

data <- read.csv("C:\\Users\\GIGATRONICS\\Desktop\\MANEJO DE BASES DE DATOS\\Iowa_Liquor_Sales.csv",
         stringsAsFactors=F)

#names es un funcion que devuelve el nombre
# de las columnas de mi base de datos

names(data)

#seleccionando variables a partir de su nombre

nueva.base <- select(data,Invoice.Item.Number,
                     Vendor.Name,Category)


#seleccionando variables a partir del numero de la columna
nueva.base <- select(data,c(2:5))

#seleccionamos las variables según su nombre, hasta
#el nombre de la ultima variable que requiramos

nueva.base <- select(data,Date:Address)

#seleccionar variables definiendo el orden en la tabla

nueva.base <- select(data,Date, everything())

#seleccionar varias variables definiendo el orden en la tabla

nueva.base <- select(data,Date,Store.Name, everything())


## BORRANDO VARIABLES
nueva.base <- select(data,-Date)

#Borrando varias variables
nueva.base <- select(data,-Date,-Address, -City)


#Borrando variables según el número de la columna
nueva.base <- select(data,-c(1,3,5))

#Borrando entre columnas las variables
nueva.base <- select(data,-c(3:5))

names(data)
nueva.base <- select(data,-c(Address:Vendor.Name))


