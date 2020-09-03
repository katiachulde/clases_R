library(tidyverse)
df <- datacleaning
#Para conocer el número de variables y observaciones con las que cuenta el dataset
glimpse(df)
#Para seleccionar sólo algunas observaciones del dataset
df1 <- df %>%
  filter(Churn=="yes") %>%
  select(customerID, TotalCharges)
#Cuando la variable es numérica , R detecta tanto los vacíos como Nan (not a number)
df$MonthlyCharges
is.na(df$MonthlyCharges)
#Si quiero ver cuántos valores distintos toma la variable MonthlyCharges
df %>%
  distinct(MonthlyCharges)
#Para obtener el número de valores distintos que toma la variable MonthlyCharges
df %>%
  summarise(n = n_distinct(MonthlyCharges))
#Si queremos conocer el número de valores faltantes
df %>%
  summarise(count = sum(is.na(MonthlyCharges)))
#En caso de que se quiera conocer el número de valores distintos, faltanes y la mediana
df %>% 
  summarise(n = n_distinct(MonthlyCharges),
                 na = sum(is.na(MonthlyCharges)),
                 med = median(MonthlyCharges, na.rm = TRUE))
#Una de las opciones que tenemos es sustituir los valores faltantes por la mediana
df %>%
  mutate(MonthlyCharges
         = replace(MonthlyCharges,
                   is.na(MonthlyCharges),
                   median(MonthlyCharges, na.rm = TRUE)))
#Si queremos modificar el dataframe, basta con llamar df a la table resultante del cambio hecho en la tabla anterior
df <- df %>%
  mutate(MonthlyCharges
         = replace(MonthlyCharges,
                   is.na(MonthlyCharges),
                   median(MonthlyCharges, na.rm = TRUE)))
#Puede darse el caso de que haya valores faltntes que no sean estándar. Es decir, que R no los detecte de manera simple.
df$TotalCharges
is.na(df$TotalCharges)
#Para ver cuántos valores perdidos detecta R en TotalCharges
df %>%
  summarise(count = sum(is.na(TotalCharges)))
#Para reemplazar por valores perdidos
df <- df %>%
  mutate(TotalCharges = replace(TotalCharges, TotalCharges == "na", NA)) %>%
  mutate(TotalCharges = replace(TotalCharges, TotalCharges == "N/A", NA))%>%
  mutate(TotalCharges = replace(TotalCharges, TotalCharges == "NA", NA))
df
#Para poder ver si ya se ha solucionado
is.na(df$TotalCharges)
#R cree que Total Charges es es una variable no númerica, sino character. Para comprobarlo.
glimpse(df$TotalCharges)
#Para cambiar esta variable a numérica
df$TotalCharges <- as.numeric(df$TotalCharges)
glimpse(df$TotalCharges)
#En caso de que se quiera conocer el número de valores distintos, faltanes y la mediana
df <- df %>%
  mutate(TotalCharges = replace(TotalCharges,
                                is.na(TotalCharges),
                                median(TotalCharges, na.rm = T)))
df$TotalCharges
#Hay veces que los valores faltantes se representan con guinoes (como PaymentMethod). Para ver los faltantes
df$PaymentMethod
is.na(df$PaymentMethod)
#Para reemplazar guiones por NA
df <- df %>%
  mutate(PaymentMethod = replace(PaymentMethod, PaymentMethod ==  "--", NA))
is.na(df$PaymentMethod)
df$PaymentMethod
#En este caso, no nos encontramos con una variable numérica con la que poder hacer la media o la mediana. Por ello, para etiquetar los valores faltantes
df <- df %>%
  mutate(PaymentMethod = replace(PaymentMethod, is.na(PaymentMethod), "no disponible"))
df$PaymentMethod
df
