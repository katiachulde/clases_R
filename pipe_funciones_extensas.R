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

##### ### USANDO EL OPERADOR PIPE Y
### CREANDO FUNCIONES MÁS EXTENSAS
## COMBINADO LO APRENDIDO

#control + enter
#install.packages("dplyr")
#install.packages("lubridate)
library(dplyr)
library(lubridate)


# Ubiquemos el directorio donde se encuentra el archivo de interés
file.choose()


## UNIENDO BASES, considerando que la varibale 
#id no puede estar repetida.

data <- read.csv("C:\\Users\\GIGATRONICS\\Desktop\\MANEJO DE BASES DE DATOS\\Iowa_Liquor_Sales.csv", 
                 stringsAsFactors = F,
                 header = T)

#transformemos de caracter a numérico la variable ventas en dolares
data <- mutate(data,
               Sale..Dollars.=(
                 as.numeric(
                   substr(data$Sale..Dollars.,2,15))))

#convirtiendo minúsculas en mayúsculas
data <- mutate(data,
               City=sapply(data$City,toupper))


# operador pipe %>% sirve para continuar una linea
#sin ejecutarlar, compactando el cálculo


## usted puede hacer un summarise así
#agrupando
#seleccionando la base agrupada

g1 <- group_by(data,City)
summarise(g1,
          media=mean(Sale..Dollars.))

#O UTILIZAR EL OPERADOR PIPE

data %>%
  group_by(City) %>%
  summarise(media=mean(Sale..Dollars.))

#compactando las funciones

data %>%
  group_by(City,Category.Name) %>%
  summarise_each(funs(
    media=mean(.),
    minimo=min(.),
    maximo=max(.)),Sale..Dollars.)

# CONSTRUYENDO FUNCIONES MÁS EXTENSAS

data <- mutate(data,
               Date=as.Date(data$Date,
                            format = "%m/%d/%Y"))
class(data$Date)


##compactando funciones extensas

#agrupar por anio
data %>%
  mutate(Date=as.Date(data$Date,
                      format = "%m/%d/%Y"),
         anio=year(data$Date))%>%
  group_by(City,anio) %>%
  summarise_each(funs(
    media=mean(.),
    minimo=min(.),
    maximo=max(.)),Sale..Dollars.)

#agrupar por anio mayor a 2016

data %>%
  mutate(Date=as.Date(data$Date,
                      format = "%m/%d/%Y"),
         anio=year(data$Date))%>%
  filter(anio>=2016)%>%
  group_by(City,anio) %>%
  summarise_each(funs(
    media=mean(.),
    minimo=min(.),
    maximo=max(.)),Sale..Dollars.)

# ordenar segun la media

data %>%
  mutate(Date=as.Date(data$Date,
                      format = "%m/%d/%Y"),
         anio=year(data$Date))%>%
  filter(anio>=2016)%>%
  group_by(City,anio) %>%
  summarise_each(funs(
    media=mean(.),
    minimo=min(.),
    maximo=max(.)),Sale..Dollars.)%>%
    arrange(desc(media))


#numero de botellas vendidas por mes en el año 2016

data %>%
  mutate(Date=as.Date(data$Date,
                      format = "%m/%d/%Y"),
         anio=year(data$Date),
         mes=month(data$Date))%>%
  filter(anio==2016)%>%
  group_by(mes) %>%
  summarise_each(funs(
    media=mean(.),
    minimo=min(.),
    maximo=max(.)),Bottles.Sold)%>%
  arrange(mes)





#numero de botellas vendidas por mes en el año 2016,
#por ciudad
resumen <- data %>%
  mutate(Date=as.Date(data$Date,
                      format = "%m/%d/%Y"),
         anio=year(data$Date),
         mes=month(data$Date))%>%
  filter(anio==2016)%>%
  group_by(City,mes) %>%
  summarise_each(funs(
    media=mean(.),
    minimo=min(.),
    maximo=max(.)),Bottles.Sold)%>%
  arrange(mes)
View(resumen)
rm(resumen)

### compactando usando select


resumen <- data %>%
  select(City,Bottles.Sold,Sale..Dollars.)%>%
  mutate(Date=as.Date(data$Date,
                      format = "%m/%d/%Y"),
         anio=year(data$Date),
         mes=month(data$Date))%>%
  filter(anio==2016)%>%
  group_by(City,mes) %>%
  summarise_each(funs(
    media=mean(.),
    minimo=min(.),
    maximo=max(.)),Bottles.Sold)%>%
  arrange(mes)
View(resumen)
rm(resumen)
