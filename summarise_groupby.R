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

##### ### AGRUPANDO (group_by) Y 
#RESUMIENDO LA INFORMACIÓN (summarise)

#control + enter
#install.packages("dplyr")
library(dplyr)
#library(openxlsx)

# Ubiquemos el directorio donde se encuentra el archivo de interés
file.choose()


## UNIENDO BASES, considerando que la varibale 
#id no puede estar repetida.

data <- read.csv("C:\\Users\\GIGATRONICS\\Desktop\\MANEJO DE BASES DE DATOS\\Iowa_Liquor_Sales.csv", 
                  stringsAsFactors = F,
                  header = T)

mean(data$Sale..Dollars.)
class(data$Sale..Dollars.)

data <- mutate(data,
               Sale..Dollars.=(
                 as.numeric(
                   substr(data$Sale..Dollars.,2,15))))

#convirtiendo minúsculas en mayúsculas
data <- mutate(data,
       City=sapply(data$City,toupper))

#agrupandola la variable de interés
data.g1 <- group_by(data,City)

#resumiendo la información

resumen <- data.frame(summarise(data.g1,
          media=mean(Sale..Dollars.,na.rm=T),
          maximo=max(Sale..Dollars.,na.rm=T),
          minimo=min(Sale..Dollars.,na.rm=T),
          contar=n(),
          perdidos=sum(is.na(Sale..Dollars.)),
          mediana=quantile(Sale..Dollars.,prob=0.5),
          contar.menos6=sum(Bottles.Sold<=6),
          contar.mas6=sum(Bottles.Sold>6)))


#resumiendo la información de una variable
#sin estar escribendo el nombre de la misma, en cada linea.

resumen2 <- data.frame(summarise_each(data.g1,
               funs(
                 media=mean(.,na.rm = T),
                 contar=n(),
                 max=max(.,na.rm=T),
                 min=min(.,na.rm=T)),
               Sale..Dollars.))

