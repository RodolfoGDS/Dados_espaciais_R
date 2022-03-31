
## Passo a passo deste script: 

## 1 - Instalar pacotes necessários.

## 2 - Carregar pacotes.

## 3 - Carregar as bandas e conferir resolução e projeção.

## 4 - Reamostrar as bandas para 20m e salvar em um novo diretório.

## 5 - Empilhar os rasters e fazer uma sobreposição.
 
## 6 - Abrir um shapefile do RJ, conferir o sistema de coordenada, fazer trasnformação.

## 7 - Recortar a imagem raster usando o municipio do RJ como máscara.

## 8 - Salvar o novo Raster.


################################################################################

## 1 - Instalar pacotes necessários
# Instalando pacotes para configurar o ambiente

install.packages("raster")
install.packages("Rcpp")
install.packages("sp")
install.packages("rgdal")


########### ----> Documentação dos pacotes <------ #############################

# https://cran.r-project.org/web/packages/raster/raster.pdf
# https://cran.r-project.org/web/packages/Rcpp/Rcpp.pdf
# https://cran.r-project.org/web/packages/sp/sp.pdf
# https://cran.r-project.org/web/packages/rgdal/rgdal.pdf

################################################################################

## 2 - Carregar pacotes

library(sp)
library(raster)
library(rgdal)

################################################################################

## 3 - Carregar as bandas e conferir resolução e projeção


banda_01 = raster("raster/S2A_MSIL1C_20210128T130251_N0209_R095_T23KPQ_20210128T144818.SAFE/GRANULE/L1C_T23KPQ_A029264_20210128T130248/IMG_DATA/T23KPQ_20210128T130251_B01.jp2")
banda_01

banda_02 = raster("raster/S2A_MSIL1C_20210128T130251_N0209_R095_T23KPQ_20210128T144818.SAFE/GRANULE/L1C_T23KPQ_A029264_20210128T130248/IMG_DATA/T23KPQ_20210128T130251_B02.jp2")
banda_02

banda_03 = raster("raster/S2A_MSIL1C_20210128T130251_N0209_R095_T23KPQ_20210128T144818.SAFE/GRANULE/L1C_T23KPQ_A029264_20210128T130248/IMG_DATA/T23KPQ_20210128T130251_B03.jp2")
banda_03

banda_04 = raster("raster/S2A_MSIL1C_20210128T130251_N0209_R095_T23KPQ_20210128T144818.SAFE/GRANULE/L1C_T23KPQ_A029264_20210128T130248/IMG_DATA/T23KPQ_20210128T130251_B04.jp2")
banda_04

banda_05 = raster("raster/S2A_MSIL1C_20210128T130251_N0209_R095_T23KPQ_20210128T144818.SAFE/GRANULE/L1C_T23KPQ_A029264_20210128T130248/IMG_DATA/T23KPQ_20210128T130251_B05.jp2")
banda_05

banda_06 = raster("raster/S2A_MSIL1C_20210128T130251_N0209_R095_T23KPQ_20210128T144818.SAFE/GRANULE/L1C_T23KPQ_A029264_20210128T130248/IMG_DATA/T23KPQ_20210128T130251_B06.jp2")
banda_06

banda_07 = raster("raster/S2A_MSIL1C_20210128T130251_N0209_R095_T23KPQ_20210128T144818.SAFE/GRANULE/L1C_T23KPQ_A029264_20210128T130248/IMG_DATA/T23KPQ_20210128T130251_B07.jp2")
banda_07

banda_08 = raster("raster/S2A_MSIL1C_20210128T130251_N0209_R095_T23KPQ_20210128T144818.SAFE/GRANULE/L1C_T23KPQ_A029264_20210128T130248/IMG_DATA/T23KPQ_20210128T130251_B08.jp2")
banda_08

banda_09 = raster("raster/S2A_MSIL1C_20210128T130251_N0209_R095_T23KPQ_20210128T144818.SAFE/GRANULE/L1C_T23KPQ_A029264_20210128T130248/IMG_DATA/T23KPQ_20210128T130251_B09.jp2")
banda_09

banda_10 = raster("raster/S2A_MSIL1C_20210128T130251_N0209_R095_T23KPQ_20210128T144818.SAFE/GRANULE/L1C_T23KPQ_A029264_20210128T130248/IMG_DATA/T23KPQ_20210128T130251_B10.jp2")
banda_10

banda_11 = raster("raster/S2A_MSIL1C_20210128T130251_N0209_R095_T23KPQ_20210128T144818.SAFE/GRANULE/L1C_T23KPQ_A029264_20210128T130248/IMG_DATA/T23KPQ_20210128T130251_B11.jp2")
banda_11

banda_12 = raster("raster/S2A_MSIL1C_20210128T130251_N0209_R095_T23KPQ_20210128T144818.SAFE/GRANULE/L1C_T23KPQ_A029264_20210128T130248/IMG_DATA/T23KPQ_20210128T130251_B12.jp2")
banda_12

banda_TCI = raster("raster/S2A_MSIL1C_20210128T130251_N0209_R095_T23KPQ_20210128T144818.SAFE/GRANULE/L1C_T23KPQ_A029264_20210128T130248/IMG_DATA/T23KPQ_20210128T130251_TCI.jp2")
banda_TCI

banda_8A = raster("raster/S2A_MSIL1C_20210128T130251_N0209_R095_T23KPQ_20210128T144818.SAFE/GRANULE/L1C_T23KPQ_A029264_20210128T130248/IMG_DATA/T23KPQ_20210128T130251_B8A.jp2")
banda_8A

#################################################################################

## 4 - Reamostrar as bandas para 20m e salvar em um novo diretório.

banda_01_20 = resample(banda_01, banda_05, method ="bilinear")
banda_01_20
writeRaster(banda_01_20, filename = "raster_20m/banda_01_20.tif")

banda_02_20 = resample(banda_02, banda_05, method = "bilinear")
banda_02_20
writeRaster(banda_02_20, filename = "raster_20m/banda_02_20.tif")

banda_03_20 = resample(banda_03, banda_05, method ="bilinear")
banda_03_20
writeRaster(banda_03_20, filename = "raster_20m/banda_03_20.tif" )

banda_04_20 = resample(banda_04, banda_05, method = "bilinear")
banda_04_20
writeRaster(banda_04_20, filename = "raster_20m/banda_04_20.tif")

banda_08_20 = resample(banda_08, banda_05, method = "bilinear")
banda_08_20
writeRaster(banda_08_20, filename = "raster_20m/banda_08_20.tif")

banda_09_20 = resample(banda_09, banda_05, method = "bilinear")
banda_09_20
writeRaster(banda_09_20, filename = "raster_20m/banda_09_20.tif")

banda_10_20 = resample(banda_10, banda_05, method="bilinear")
banda_10_20
writeRaster(banda_10_20, filename = "raster_20m/banda_10_20.tif")

banda_TCI_20 = resample(banda_TCI, banda_05, method ="bilinear")
banda_TCI_20
writeRaster(banda_TCI_20, filename = "raster_20m/banda-TCI_20.tif")

# Passando os arquivos que não foram reamostrados para o diretório dos rasters_20

writeRaster(banda_05, filename = "raster_20m/banda_05_20.tif")
writeRaster(banda_06, filename = "raster_20m/banda_06_20.tif")
writeRaster(banda_07, filename = "raster_20m/banda_07_20.tif")
writeRaster(banda_8A, filename = "raster_20m/banda_8A_20.tif")
writeRaster(banda_11, filename = "raster_20m/banda_11_20.tif")
writeRaster(banda_12, filename = "raster_20m/banda_12_20.tif")

#####################################################################################

## 5 - Empilhar os rasters e fazer uma sobreposição.

# Fazendo o empilhamento dos rasters e criando um stack(para isso temos que ter tudo na mesma resolução)
# Vamos primeiro utilizar um método clássico, chamando cada arquivo 

all_bands = stack("raster_20m/banda_01_20.tif",
                  "raster_20m/banda_02_20.tif",
                  "raster_20m/banda_03_20.tif",
                  "raster_20m/banda_04_20.tif",
                  "raster_20m/banda_05_20.tif",
                  "raster_20m/banda_06_20.tif",
                  "raster_20m/banda_07_20.tif",
                  "raster_20m/banda_8A_20.tif",
                  "raster_20m/banda_08_20.tif",
                  "raster_20m/banda_09_20.tif",
                  "raster_20m/banda_10_20.tif",
                  "raster_20m/banda_11_20.tif",
                  "raster_20m/banda_12_20.tif",
                  "raster_20m/banda-TCI_20.tif")

#Plotando as imagens separadas banda a banda e depois, ela empilhada,

plot(all_bands)
plotRGB(all_bands, r=3, g=2, b=1, axes = T, stretch ="lin", main = "Sentinel 2 cor Verdadeira")
plotRGB(all_bands, r=9, g=2, b=1, axes = T, stretch ="lin", main ="Sentinel 2 falsa cor")


# Abrindo todas as bandas de uma forma mais simples

arquivos = list.files(path = "raster_20m/", pattern = "banda", full.names = T)
print(arquivos)

all_bands_20 = stack(arquivos)
plotRGB(all_bands_20, r = 9, g = 2, b=1, axes = T, stretch = "lin", main = "Sentinel 2 falsa cor")

#############################################################################################################

## 6 - Abrir um shapefile do RJ, conferir o sistema de coordenada, fazer trasnformação.

shape =  shapefile("poligonos/municio_rj.shp")
plot(shape)

municipio_rj = readOGR("poligonos/municio_rj.shp")
plot(municipio_rj) 


#Checando o sistema de coordenada do shapefile

crs(all_bands)
crs(municipio_rj)

#Converter o shapefile do municipio para UTM zona 23 S datum = WGS84

municipio_rj.utm =  spTransform(x = municipio_rj, CRSobj = crs(all_bands))
crs(municipio_rj.utm)

################################################################################

## 7 - Recortar a imagem raster usando o municipio do RJ como máscara

municipio_rj.mask = mask(x = all_bands, mask = municipio_rj.utm)
municipio_rj.crop = crop(municipio_rj.mask, municipio_rj.utm)


# Vamos plotar para ver a diferença entre o mask e o crop

par(mfrow = c(1,2))
plot(municipio_rj.mask$banda_8A_20)
plot(municipio_rj.crop$banda_8A_20)

################################################################################

## 8 - Salvar o novo Raster 

writeRaster(x = municipio_rj.crop, filename = "raster_recortado/municipio_rj_raster_20.tif")

rj_raster = raster("raster_recortado/municipio_rj_raster_20.tif")
plot(rj_raster)






