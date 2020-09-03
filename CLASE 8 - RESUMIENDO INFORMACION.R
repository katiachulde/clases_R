##----------------BETAMETRICA---------------------------##
## CLASE 8
## Resumiendo la información: las poderosas funciones 
## group_by & summarise 

# LIBRERIA
library("dplyr")
library(openxlsx)

# Comandos
# group_by: agrupando
# summarize: resumiendo la informacion 

# Buscar base de datos
file.choose()
# Base de datos
data<-read.csv("C:\\Users\\Tefyta\\Documents\\CURSOS\\BETAMETRICA R\\BASES DE DATOS\\Iowa_Liquor_Sales.csv",
               stringsAsFactors = F,
               header = T)

# Media de las ventas en $ para cada ciudad
# Sell.dollar tiene caracter $
# transformar a numerica
class(data$Sale..Dollars.)
as.numeric(substr(data$Sale..Dollars., 2,15))
data<-mutate(data,Sale..Dollars.=
               as.numeric(substr(data$Sale..Dollars., 2,15)))

# Media por ciudad
# Agrupar la data a partir de la ciudad 
data.g1<-group_by(data,City)

# Estaisticos
# Variable nueva media
# na.rm: evita valores faltantes
# Agrupamos para q nos saque la media de cada ciudad
# contar=n(): cuenta numero de datos
# is.na: perdidos
# quantile: mediana
# Contar las botellas que sean menores a 6
# sum: suma, es decir cuenta

resumen<-data.frame (summarise(data.g1,
          media=mean(Sale..Dollars.,na.rm=T),
          maximo=max(Sale..Dollars.,na.rm=T),
          minimo=min(Sale..Dollars.,na.rm=T),
          contar=n(),
          perdidos=sum(is.na(Sale..Dollars.)),
          mediana=quantile(Sale..Dollars.,prob=0.5),
          contar.menos6=sum(Bottles.Sold<=6),
          contar.mas6=sum(Bottles.Sold>6)))

# Existe el problema de las mayusculas
sapply(data$City, tolower)
data<-mutate(data,
       City=sapply(data$City, tolower))

# summarize_each: construir funciones 
resumen2<-data.frame(summarise_each(data.g1,
               funs(
                 media=mean(.,na.rm=T),
                 contar=n(),
                 maximo=max(.,na.rm=T),
                 minimo=min(.,na.rm=T)),
               Sale..Dollars.))
names(data.g1)                 














