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






##### �Contribuyendo con el desarrollo empresarial y profesional del Ecuador!

##### ### FUNCI�N FILTER()

#control + enter
#install.packages("dplyr")
library(dplyr)


# Ubiquemos el directorio donde se encuentra el archivo de inter�s
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

#& es el operador l�gico Y (and)
# | es el operador l�gico o (or)

nueva.base <- filter(data,
                     City=="DAVENPORT" |City=="CEDAR RAPIDS")

table(nueva.base$City)

names(data)

#& y operadores matem�ticos
nueva.base <- filter(data,
                     City=="DAVENPORT" &
                       Bottles.Sold >= 6)
#funci�n max y min
min(nueva.base$Bottles.Sold)
max(nueva.base$Bottles.Sold)


# midiendo eficiencia de la fuci�n usando c�digo dply
#versus c�digo natural de R

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

## generando m�s de dos condicionales
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

#slice permite tomar el n�mero de filas que usted disponga

nueva.base <- slice(data, 350:420)

