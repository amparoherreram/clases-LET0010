#Script 13-09 ----
##Activar paquetes ----
library(readxl)
library(readr)
library(dplyr)
library(tidyr)
library(stringr)

##Importar datos ----

datos_paises<-read_excel("datos/datos-sin-procesar/datos-paises.xlsx",sheet = 'ES')
#solo nos importa la hoja llamada 'ES'

esperanza_vida<-read_csv('datos/datos-sin-procesar/esperanza-de-vida.csv', skip=4)
#los archivos csv tienen metadatos en las primeras 4 filas

pib<-read_csv('datos/datos-sin-procesar/pib.csv', skip=4)

poblacion<-read_csv('datos/datos-sin-procesar/poblacion.csv', skip=4)
#View(poblacion)

##Limpiar y ordenar los datos ----

# %>% ctrl + shift + M
esperanza_vida <- esperanza_vida %>% 
  pivot_longer(cols = '1960':'2020',
               names_to = 'anio',
               values_to = 'esperanza_vida',
               names_transform = list(anio=as.integer))
pib <- pib %>% 
  pivot_longer(cols = '1960':'2020',
               names_to = 'anio',
               values_to = 'pib',
               names_transform = list(anio=as.integer))
poblacion <- poblacion %>% 
  pivot_longer(cols = '1960':'2020',
               names_to = 'anio',
               values_to = 'poblacion',
               names_transform = list(anio=as.integer)) %>% 
  mutate(poblacion=case_when(
    str_detect(poblacion,'B') ~ as.numeric(str_remove(poblacion,'B'))*1000000000,
    str_detect(poblacion,'M') ~ as.numeric(str_remove(poblacion,'M'))*1000000,
    str_detect(poblacion,'k') ~ as.numeric(str_remove(poblacion,'k'))*1000,
    #k porque sabemos que esta escrito así, sino [kK]
    TRUE ~ as.numeric(poblacion)
  ))

## Consolidar el set de datos ----

datos_desarrollo <- esperanza_vida %>% 
  left_join(pib) %>% 
  left_join(poblacion) %>% 
  left_join(datos_paises)

## Guardar datos ----

write.csv(datos_desarrollo,'datos/datos-desarrollo.csv')
