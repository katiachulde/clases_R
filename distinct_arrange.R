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

##### ### FUNCIONES DISTINCT & ARRANGE

#control + enter
#install.packages("dplyr")
library(dplyr)


# Ubiquemos el directorio donde se encuentra el archivo de interés
file.choose()


data <- read.csv("C:\\Users\\GIGATRONICS\\Desktop\\MANEJO DE BASES DE DATOS\\Iowa_Liquor_Sales.csv",
                 stringsAsFactors=F,
                 header = T)

distinct(data,
         City)

sapply(data$City,tolower)

data <- mutate(data,
               City=sapply(data$City,tolower))

distinct(data,City)

#arrange()

names(data)

data <- arrange(data,
        desc(Sale..Dollars.))

data <- arrange(data,
                Sale..Dollars.,
                Bottles.Sold)

head(data,n=4L)





