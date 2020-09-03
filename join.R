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

##### ### FUSIONANDO BASES, UNIENDO FILAS Y COLUMNAS

#control + enter
#install.packages("dplyr")
library(dplyr)
library(openxlsx)

# Ubiquemos el directorio donde se encuentra el archivo de interés
file.choose()


## UNIENDO BASES, considerando que la varibale 
#id no puede estar repetida.

data1 <- read.csv("C:\\Users\\GIGATRONICS\\Desktop\\MANEJO DE BASES DE DATOS\\Iowa_Liquor_Sales_A.csv", 
                  stringsAsFactors = F)
data2 <- read.csv("C:\\Users\\GIGATRONICS\\Desktop\\MANEJO DE BASES DE DATOS\\Iowa_Liquor_Sales_B.csv", 
                  stringsAsFactors = F)

names(data1)

data3 <- full_join(data1,data2,
                   by="Invoice.Item.Number")

#### COMBINANDO COLUMNAS
data1 <- read.xlsx("C:\\Users\\GIGATRONICS\\Desktop\\MANEJO DE BASES DE DATOS\\DEP_2016_BP_A.xlsx", 
                   detectDates = TRUE)
data2 <- read.xlsx("C:\\Users\\GIGATRONICS\\Desktop\\MANEJO DE BASES DE DATOS\\DEP_2016_BP_B.xlsx", 
                   detectDates = TRUE)

z <- bind_cols(data1,data2)




#### COMBINANDO FILAS
data1 <- read.xlsx("C:\\Users\\GIGATRONICS\\Desktop\\MANEJO DE BASES DE DATOS\\DEP_2016_BP_C.xlsx", 
                   detectDates = TRUE)
data2 <- read.xlsx("C:\\Users\\GIGATRONICS\\Desktop\\MANEJO DE BASES DE DATOS\\DEP_2016_BP_D.xlsx", 
                   detectDates = TRUE)

#que sean las mismas variables danto en 1 como es 2
names(data1)
names(data2)
#tengan el mismo formato


data1$OFICINAS <- as.numeric(data1$OFICINAS) 
#data1 <- select(data1,-OFICINA)
data.nueva <- bind_rows(data1,data2)

  class(data1$OFICINAS)
