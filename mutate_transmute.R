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

##### ### FUNCIONES MUTATE Y TRANSMUTE

#control + enter
#install.packages("dplyr")
library(dplyr)


# Ubiquemos el directorio donde se encuentra el archivo de interés
file.choose()


data <- read.csv("C:\\Users\\GIGATRONICS\\Desktop\\MANEJO DE BASES DE DATOS\\Iowa_Liquor_Sales.csv",
                 stringsAsFactors=F,
                 header=T)
str(data)
#substr es equivalente a la función extrae


data <- mutate(data,
               costo.total=
                 as.numeric(substr(
                   data$State.Bottle.Cost,2,15))*
                 Bottles.Sold,
               ingreso.total=as.numeric(
                 substr(data$State.Bottle.Retail,2,15))*
                 Bottles.Sold,
               utilidad=ingreso.total-costo.total)


#transmute

data2 <- transmute(data,
               costo.total=
                 as.numeric(substr(
                   data$State.Bottle.Cost,2,15))*
                 Bottles.Sold,
               ingreso.total=as.numeric(
                 substr(data$State.Bottle.Retail,2,15))*
                 Bottles.Sold,
               utilidad=ingreso.total-costo.total)

###

#if_else()
#es equivalente a la función si(condicion,verdadero,falso)
#de Excel

data <- mutate(data,
               resultado=if_else(utilidad>0,
                                 "utilidad",
                                 "perdida"))
table(data$resultado)

#transmute
data3 <- transmute(data,
               resultado=if_else(utilidad>0,
                                 "utilidad",
                                 "perdida"))
table(data3$resultado)


names(data)

