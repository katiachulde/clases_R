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

##### ### INTRODUCCIÓN A R Y SUS PRINCIPALES 
## COMANDOS

# para ejecutar una linea, tiene que situarse
# en la linea y presionar control+enter

1+1


#instalando librerías
#para instalar librerías es necesario
#estar conectado a una red 
install.packages("dplyr")
install.packages("openxlsx")
install.packages("lubridate")
#una vez instaladas no tiene que volver a instalarlas
#solo tiene que llamarlas cada vez
#que utilice las librerías

library(dplyr)
library(openxlsx)
library(lubridate)

# <- es equivalente al =
# y significa asigno.
#todo lo que está antes de <- es el nombre del objeto
# todo lo que está despues de asigno son los calculos
# u operaciones.


x <- c(1,3,7)
y <- c(2,7,3)

x
y

data <- data.frame(x,y)

## hagamos mas grande el vector
x <- c(1,3,7,5,7,8)
y <- c(2,7,3,5,6,3)

data <- data.frame(x,y)


file.choose()

#### 



data1 <-read.xlsx("C:\\Users\\GIGATRONICS\\Desktop\\MANEJO DE BASES DE DATOS\\DEP_2016_BP.xlsx",
                  detectDates = T) 

#nombrematrix[fila,columna]
data[2,1]
data[5,2]

data[,2]
data[,1]
data[1,]
data[2,]

data[1:3,1:2]
data[1:5,2]
data[1:4,1]

data[,2]

data$x
data$y

#para saber los nombres de las variables
#en mi base de datos
names(data)
names(data1)


nueva.base <- data.frame(data1[,5])
names(nueva.base)

#para cambiar el nombre de una variable
names(nueva.base)[1] <- "REGION"

#para realizar una tabla de fecuencia absoluta de
#cierta variable de interes

table(data1$REGION)
table(data1$ENTIDAD)


#para tener una idea de lo que contiene la base
#tomando los primeros valores
head(data1,n=2L)


#aplicando filtros basicos de R sin usa otros paquetes
# creando una nueva base que solo contenga COSTA
nueva.base <- data1[data1$REGION=="COSTA",]
table(nueva.base$REGION)
table(data1$REGION)

#Crear una nueva base que solo contenga número de clientes
#menor o igual que 5
nueva.base <- data1[data1$NUMERO.DE.CLIENTES<=5,]
min(nueva.base$NUMERO.DE.CLIENTES)
max(nueva.base$NUMERO.DE.CLIENTES)

# usando operadores lógicos

nueva.base <- data1[data1$NUMERO.DE.CLIENTES>=5 &
                      data1$NUMERO.DE.CLIENTES<=10,]

min(nueva.base$NUMERO.DE.CLIENTES)
max(nueva.base$NUMERO.DE.CLIENTES)


nueva.base <- data1[data1$REGION=="COSTA"|
                      data1$REGION=="SIERRA",]
table(nueva.base$REGION)


#elementos distintos de algo

nueva.base <- data1[data1$REGION!="COSTA",]
table(nueva.base$REGION)

#combiando los operadores lógicos y los operadores 
#aritmeticos

nueva.base <- data1[data1$REGION=="COSTA" & 
                      data1$NUMERO.DE.CLIENTES>=5,]
table(nueva.base$REGION)
min(nueva.base$NUMERO.DE.CLIENTES)
max(nueva.base$NUMERO.DE.CLIENTES)

## existen otras funciones complementarias
#sd()
#var()
#cor()
#is.na()
#n()
#summary()


