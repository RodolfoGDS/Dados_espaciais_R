# Passo a passo deste script:

## 1 - Instalar pacotes necessários.

## 2 - Carregar pacotes.

## 3 - Ler o arquivo raster com indice do municipio do RJ.

## 4 - Ler o arquivo csv com os nomes das bandas.

## 5 - Ler o arquivo shapefile das amostras geradas no qgis.

## 6 - Criar um obejto que junte os poligonos da mesma classe.

## 7 - Extrair da imagem Raster do municipio RJ os valores(pixel) para cada classe.

## 8 - Criar um dataframe para cada classe.

## 9 - Juntar os dataframe em um único dataframe.

## 10 - Salvar o dataframe final em um arquivo csv.

################################################################################

## 1 - Instalar pacotes necessários

install.packages("rgeos")


#### https://cran.rstudio.com/web/packages/rgeos/rgeos.pdf

################################################################################


## 2 - Carregar pacotes

library(sp)
library(raster)
library(rgdal)
library(rgeos)

################################################################################

## 3 - Ler o arquivo raster com indice do municipio do RJ

rj = stack("raster_recortado/municipio_rj_indices.tif")
plot(rj)

names(rj)

################################################################################

## 4 - Ler o arquivo csv com os nomes das bandas

nomes_bandas = read.table("raster_recortado/nomes_bandas.csv", header = T, sep = ",")
print(nomes_bandas)
names(rj) = nomes_bandas[,2]
names(rj)

################################################################################

## 5 - Ler o arquivo shapefile das amostras geradas no qgis

amostras_rj = readOGR("Amostras_exercicio/amostras_rj.shp")
View(data.frame(amostras_rj))

################################################################################


## 6 - Criar um obejto que junte os poligonos da mesma classe


unidos.shp = gUnaryUnion(spgeom = amostras_rj, id = amostras_rj$Classe)
names(unidos.shp)

################################################################################

## 7 - Extrair da imagem Raster do municipio RJ os valores(pixel) para cada classe

atributos = extract(x = rj, y = unidos.shp)
atributos

################################################################################

## 8 - Criar um dataframe para cada classe
names(unidos.shp)

Agua = data.frame(Classe = "Agua", atributos[[1]])
Area_urbana = data.frame(Classe = "Area_urbana", atributos[[2]])
Floresta = data.frame(Classe = "Floresta", atributos[[3]])
Mata_secundaria = data.frame(Classe = "Mata_secundaria", atributos[[4]])

################################################################################

## 9 - Juntar os dataframe em um único dataframe

amostras_rj.final = rbind(Agua, Area_urbana, Floresta, Mata_secundaria)

################################################################################

## 10 - Salvar o dataframe final em um arquivo csv

write.csv(x = amostras_rj.final, file = "Amostras_exercicio/amostras_rj_extraidas.csv" )


