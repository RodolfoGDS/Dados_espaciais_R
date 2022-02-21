## Formas de representação do Sistema de Coordenadas:


## 1. WKT2 ---> well known text
## 2. Proj.4
## 3. EPSG

# Carregando os pacotes
library(sf)
library(raster)

# Setando um diretorio padrão para esse script
setwd('C:/Users/rodolfo.paula/Documents/MeusProjetos/Dados_espaciais_R/datasets/')
##Lendo os arquivos shp e TIF
dados <- st_read('SE_Microrregioes_2020.shp')
plot(dados)

# Acessando o Coordenate Reference Sistem (crs)

st_crs(dados)

# Acessando o código do EPSG
st_crs(dados)$epsg

# Acessando as informações do Proj4
st_crs(dados)$proj4string
