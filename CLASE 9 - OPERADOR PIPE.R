##----------------BETAMETRICA---------------------------##
## CLASE 9
## El operador "pipe": construyendo filtros complejos 
# Compactar funciones extensas

# INSTALAR LIBRERIA
install.packages("lubridate")

# LIBRERIAS
library(dplyr)
library("lubridate")

# Ubicar directorio
file.choose()

# Bases de datos
data<-read.csv("C:\\Users\\Tefyta\\Documents\\CURSOS\\BETAMETRICA R\\BASES DE DATOS\\Iowa_Liquor_Sales.csv",
         stringsAsFactors = F,
         header = T)

# Transformar de caracter a numerico 
data<-mutate(data,
             Sale..Dollars.=(
               as.numeric(
               substr(data$Sale..Dollars., 2, 15))))

# Convertir de minusculas a mayusculas 
data<-mutate(data,
             City=sapply(data$City, toupper))
table(data$City)

data<-mutate(data,
             Category.Name=sapply(data$Category.Name, toupper))
table(data$City)

##-----------------------------------------------------##
## OPERADOR PIPE

# %>%: sirve para continuar una linea sin ejecutarla
# compactando el calculo, es decir que en un solo paso
# se hagan muchas cosas, sinq ue se ejecute y cree objetos
# No es viable crear objetos 
g1<-group_by(data,City)
resumen<-summarize(g1,
          media=mean(Sale..Dollars.))

# PIPE
data%>%
  group_by(City) %>%
  summarize(media=mean(Sale..Dollars.))
  
# summarize_each
# Se puede agrupar por varias variables
data%>%
  group_by(City, Category.Name) %>%
  summarize_each(funs(
    media=mean(.),
    minimo=min(.),
    maximo=max(.)), Sale..Dollars.)

# Construyendo funciones mas extensas 
# Date no tiene formato correcto 
# Y: porque tiene 2015
# y: porque tiene 15
class(data$Date)
as.Date(data$Date, format="%m/%d/%Y")
data<-mutate(data,
             Date= as.Date(data$Date, format="%m/%d/%Y"))
class(data$Date)

# Compactando
data%>%
  mutate(Date= as.Date(data$Date, format="%m/%d/%Y"),
         anio=year(data$Date))%>%
  group_by(City, anio) %>%
  summarize_each(funs(
    media=mean(.),
    minimo=min(.),
    maximo=max(.)), Sale..Dollars.)

# Solo el año de la columna 
year(data$Date)

# Agrupar por anio mayor a 2016
data%>%
  mutate(Date= as.Date(data$Date, format="%m/%d/%Y"),
         anio=year(data$Date))%>%
  filter(anio>=2016)%>%
  group_by(City, anio) %>%
  summarize_each(funs(
    media=mean(.),
    minimo=min(.),
    maximo=max(.)), Sale..Dollars.)

# Ordenar según la media 
data%>%
  mutate(Date= as.Date(data$Date, format="%m/%d/%Y"),
         anio=year(data$Date))%>%
  filter(anio>=2016)%>%
  group_by(City, anio) %>%
  summarize_each(funs(
    media=mean(.),
    minimo=min(.),
    maximo=max(.)), Sale..Dollars.)%>%
    arrange(media)
    
# Numero de botellas vendidas por mes en el año 2016 
data%>%
  mutate(Date= as.Date(data$Date, format="%m/%d/%Y"),
         anio=year(data$Date),
         mes=month(data$Date)) %>%
  filter(anio==2016)%>%
  group_by(mes) %>%
  summarize_each(funs(
    media=mean(.),
    minimo=min(.),
    maximo=max(.)), Bottles.Sold)%>%
  arrange(mes)

month(data$Date)

# Numero de botellas vendidas por mes en el año 2016
# y por ciudad
data%>%
  mutate(Date= as.Date(data$Date, format="%m/%d/%Y"),
         anio=year(data$Date),
         mes=month(data$Date)) %>%
  filter(anio==2016)%>%
  group_by(City, mes) %>%
  summarize_each(funs(
    media=mean(.),
    minimo=min(.),
    maximo=max(.)), Bottles.Sold)%>%
  arrange(mes)

# Guardar como data.frame
resumen<-as.data.frame(data%>%
                         mutate(Date= as.Date(data$Date, format="%m/%d/%Y"),
                                anio=year(data$Date),
                                mes=month(data$Date)) %>%
                         filter(anio==2016)%>%
                         group_by(City, mes) %>%
                         summarize_each(funs(
                           media=mean(.),
                           minimo=min(.),
                           maximo=max(.)), Bottles.Sold)%>%
                         arrange(mes))

# Compactando usando select 
resumen<-as.data.frame(data%>%
  select(City, Bottles.Sold, Sale..Dollars.)%>%
                         mutate(Date= as.Date(data$Date, format="%m/%d/%Y"),
                                anio=year(data$Date),
                                mes=month(data$Date)) %>%
                         filter(anio==2016)%>%
                         group_by(City, mes) %>%
                         summarize_each(funs(
                           media=mean(.),
                           minimo=min(.),
                           maximo=max(.)), Bottles.Sold)%>%
                         arrange(mes))

  
  
  
  
  
  
  
  
  


















