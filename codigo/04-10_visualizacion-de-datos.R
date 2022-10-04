library(readr)
library(dplyr)
library(ggplot2)
library(ggtext)
library(gghighlight)

#Importar los datos ----
desarrollo<-read.csv('datos/datos-desarrollo.csv')

#subset de los datos: los paises de sudamerica

sudamerica<- filter(desarrollo, pais %in% c('Chile','Argentina','Uruguay','Paraguay','Bolivia','Perú','Ecuador','Colombia','Venezuela','Brasil','Suriname','Guyana'))

sudamerica %>% 
  filter(anio==2020) %>% 
  ggplot(aes(reorder(pais,-esperanza_vida), esperanza_vida))+
  geom_col(fill='skyblue2')+
  geom_text(aes(label= esperanza_vida),
            vjust= 5,
            color='navy',
            fontface= 'bold')+
  labs(title = 'Esperanza de vida en 2020',
       subtitle = 'Países de Sudamérica',
       x=NULL,
       y='Esperanza de vida')+
  theme_bw()

# columnas horizontales
sudamerica %>% 
  filter(anio==2020) %>% 
  ggplot(aes(y= reorder(pais,esperanza_vida), esperanza_vida))+
  geom_col(fill='skyblue2')+
  geom_text(aes(label= esperanza_vida),
            hjust= 2,
            color='navy',
            fontface= 'bold')+
  labs(title = 'Esperanza de vida en 2020',
       subtitle = 'Países de Sudamérica',
       y=NULL,
       x='Esperanza de vida')+
  theme_bw()
#Ejemplo 2: destacar valores dentro de un gráfico

ggplot(sudamerica,aes(anio,pib,color=pais))+
  geom_line(size=2)+
  gghighlight(pais=='Chile',unhighlighted_params = aes(color='lightgreen'))+
  scale_color_manual(values='springgreen4')+
  labs(title = 'Comparación del PIB de Chile con el del resto de Sudamérica')+
  theme_bw()

#Ejemplo 3: como anotar nuestros gráficos

desarrollo %>% 
  filter(pais=='Ruanda') %>% 
  ggplot(aes(anio,esperanza_vida))+
  geom_line(size=2,color= 'darkorchid4')+
  geom_label(aes(x=1995,y=10,label= '1993: año del genocidio \n de la población Tutsi'),
             hjust=-0.01,
             fill= 'darkorchid4',
             color='white',
             fontface='bold')+
  scale_y_continuous(limits = c(0,80))+
  scale_x_continuous(breaks = seq(1960,2020,by=10))+
  labs(title='Esperanza de vida en Ruanda',
       x=NULL, y=NULL)+
  theme_bw()

#Ejemplo 4: cómo indicar a que corresponde 
#cada cosa del gráfico (alternativa a la 'leyenda')

sudamerica %>% 
  filter(pais %in% c('Uruguay','Argentina')) %>% 
  ggplot(aes(anio,pib,color=pais))+
  geom_line(size=2,show.legend = FALSE)+
  scale_color_manual(values = c('Uruguay'='green','Argentina'='purple'))+
  labs(title='Evolución del PIB en <b style=color:"purple"> Argentina</b> y <b style=color:"green">Uruguay</b>',
       x=NULL,
       y=NULL)+
  theme_bw()+
  theme(plot.title = element_markdown())
