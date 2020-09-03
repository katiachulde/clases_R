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

##### ### FUNCIÓN FILTER()

#control + enter
#install.packages("dplyr")
library(dplyr)


# Ubiquemos el directorio donde se encuentra el archivo de interés
file.choose()

data <- read.csv("C:\\Users\\GIGATRONICS\\Desktop\\MANEJO DE BASES DE DATOS\\Iowa_Liquor_Sales.csv",
                 stringsAsFactors=F,
                 header=T)

names(data)
nueva.base <- filter(data,
                     City=="DAVENPORT")

table(nueva.base$City)
table(data$City)

#, es igual al caracter &

#& es el operador lógico Y (and)
# | es el operador lógico o (or)

nueva.base <- filter(data,
                     City=="DAVENPORT" |City=="CEDAR RAPIDS")

table(nueva.base$City)

names(data)

#& y operadores matemáticos
nueva.base <- filter(data,
                     City=="DAVENPORT" &
                       Bottles.Sold >= 6)
#función max y min
min(nueva.base$Bottles.Sold)
max(nueva.base$Bottles.Sold)


# midiendo eficiencia de la fución usando código dply
#versus código natural de R

nueva.base <- filter(data,
                     City=="DAVENPORT" &
                       Bottles.Sold >= 6)

zz <- data[data$City=="DAVENPORT" &
             data$Bottles.Sold >= 6,]


system.time(nueva.base <- filter(data,
                                 City=="DAVENPORT" &
                                   Bottles.Sold >= 6))

system.time(
  zz <- data[data$City=="DAVENPORT" &
               data$Bottles.Sold >= 6,]
)

## generando más de dos condicionales
nueva.data <- filter(data,
                     City=="Davenport",
                     Bottles.Sold >= 6,
                     Volume.Sold..Gallons.>=3)
names(data)


#generando condicionales mezclados
nueva.base <- filter(data,
                     City=="Davenport" | City=="CEDAR RAPIDS",
                     Bottles.Sold >= 6 ,Bottles.Sold <= 15)

min(nueva.base$Bottles.Sold)
max(nueva.base$Bottles.Sold)

#operador distinto de !=

nueva.base <- filter(data,
                     City!="DAVENPORT")
table(nueva.base$City)

nueva.base <- filter(data,
                     City!="DAVENPORT",
                     Bottles.Sold!=6)

#slice permite tomar el número de filas que usted disponga

nueva.base <- slice(data, 350:420)

