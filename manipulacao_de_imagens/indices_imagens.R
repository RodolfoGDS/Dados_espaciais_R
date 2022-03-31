## Passo a passo deste scripit:

## 1 - Carregar pacotes.

## 2 - Carregar a imagem Raster do município.

## 3 - Renomear as bandas do raster.

## 4 - Calcular alguns índices para melhorar a amostragem e adiciona-los ao stack.

## 5 - Visualizar os índices em mapas.

## 6 - Salvar um arquivo tif do Raster com os novos índices e um arquivo csv com os nomes das bandas.

################################################################################

## 1 - Carregar pacotes

library(sp)
library(raster)

################################################################################

## 2 - Carregar a imagem Raster do município

img = stack("raster_recortado/municipio_rj_raster_20.tif")
plot(img$municipio_rj_raster_20.1)



################################################################################

## 3 - Renomear as bandas do raster

names(img)
names(img) <- c("BTCI","B01", "B02", "B03", "B04", "B05", "B06", "B07", "B08", "B09", "B10", "B11", "B12", "B8A") 
names(img)

################################################################################

## 4 - Calcular alguns índices para melhorar a amostragem

### Para saber mais das bandas e dos índices
### https://www.instrutorgis.com.br/gdal-processamento-de-imagens-sentinel2_p01/
### http://www.engesat.com.br/sentinel-2/

#NDVI - Normalized Difference Vegetation Index

NDVI = (img$B8A - img$B04) / (img$B8A + img$B04)
plot(NDVI)

img$NDVI = NDVI

names(img)

#SR - Simple Ratio

img$Simple_Ratio = img$B8A / img$B04

#EVI  - Enhanced vegetation index

img$EVI = (2.5*((img$B8A-img$B04)/10000))/(img$B8A/10000+6*img$B04/10000-7.5*img$B02/10000+1)

#NDWI - Normalized difference water index

img$NDWI = (img$B03-img$B12)/(img$B03+img$B12)
  
  
################################################################################
  
  
## 5 - Visualizar os índices em mapas

par(mfrow = c(2,2))
plot(img$NDVI, col = gray(0:100/100), main = "NDVI")
plot(img$Simple_Ratio, col =gray(0:100/100), main = "Simple Ratio")
plot(img$EVI, col = gray(0:100/100), main = "EVI")
plot(img$NDWI, col = gray(0:100/100), main = "NDWI")

################################################################################

## 6 - Salvar um arquivo tif do Raster com os novos índices e um arquivo csv com os nomes das bandas.


#Salvar o Raster

writeRaster(x = img, filename = "raster_recortado/municipio_rj_indices.tif")

#Salvar a tabela csv com os nomes

nomes_img <- names(img)

write.csv(x = nomes_img, file = "raster_recortado/nomes_bandas.csv")




