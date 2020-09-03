##--------------BETAMERICA-------------------##
## INTRODUCCION A LOS PRINCIPALES COMANDOS DE R
##CLASE 2

# FILTROS
# Categorias dentro de una variable y conteo 
table(data1$REGION)
table(data1$ENTIDAD)
# Tomar una muestra rapida, primeras observaciones 
head(data1)
# Solo dos observaciones 
head(data1, n=2L)

#Aplicando filtros rapidos 
#Elementos de la Region costa
nueva.base<-data1[data1$REGION=="COSTA",]
# Numero de clientes menores a 5
nueva.base<-data1[data1$NUMERO.DE.CLIENTES<=5,]
# Minimo de una variable 
min(nueva.base$NUMERO.DE.CLIENTES)
max(nueva.base$NUMERO.DE.CLIENTES)

# Usando operadores logicos 
# Y: &
nueva.base<-data1[data1$NUMERO.DE.CLIENTES>=5 &
                    data1$NUMERO.DE.CLIENTES<=10,]
min(nueva.base$NUMERO.DE.CLIENTES)
max(nueva.base$NUMERO.DE.CLIENTES)
# O: |
nueva.base<-data1[data1$REGION=="COSTA" | data1$REGION=="SIERRA",]
table(nueva.base$REGION)
# Distinto: !=
nueva.base<-data1[data1$REGION!="COSTA",]
table(nueva.base$REGION)
# Combinando operadores logicos y aritmeticos 
nueva.base<-data1[data1$REGION=="COSTA" & data1$NUMERO.DE.CLIENTES>=5,]
table(nueva.base$REGION)
min(nueva.base$NUMERO.DE.CLIENTES)







