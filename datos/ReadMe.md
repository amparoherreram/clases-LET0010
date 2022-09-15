# Datos

datos

## datos-desarrollo.csv

Este set de datos contiene siete variables:

+------------------+----------+-------------------------------------------------------------+
| Variable         | TIpo     | Descripción                                                 |
+==================+==========+=============================================================+
| `pais`           | caracter | Nombre del país                                             |
+------------------+----------+-------------------------------------------------------------+
| `anio`           | numérica | Año de observación (1960-2020)                              |
+------------------+----------+-------------------------------------------------------------+
| `esperanza_vida` | numérica | Esperanza de vida al nacer en años                          |
+------------------+----------+-------------------------------------------------------------+
| `pib`            | numérica | PIB per cápita en dólares (ajustados a dólares de 2015)     |
+------------------+----------+-------------------------------------------------------------+
| `poblacion`      | numérica | población del año                                           |
+------------------+----------+-------------------------------------------------------------+
| iso3             | caracter | código ISO de tres caracteres                               |
+------------------+----------+-------------------------------------------------------------+
| continente       | caracter | Continente del pais                                         |
|                  |          |                                                             |
|                  |          | (América del Norte, Centro y Sur aparecen como 'Américas'). |
+------------------+----------+-------------------------------------------------------------+

Los datos fueron obtenidos del banco mundial en el caso de la variable `pib` y de la página del proyecto Gapminder en el caso de las variables `esperanza_vida` y `poblacion.`

El código utilizado para crear este set de datos se encuentra disponible en `/codigo/2022-09-13_limpieza-datos.R`
