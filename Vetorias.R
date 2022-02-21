# Para ler dados espaciais vetoriais --- pacotes sp e sf

## Simple Feature  baseado na ISO 19125-1:2004


install.packages('sf')


library(sf)

path=('C:/Users/rodolfo.paula/Documents/MeusProjetos/Dados_espaciais_R/datasets/BR_UF_2020.shp')

## Lendo o arquivo do tipo shapefile shp

st_read(path)

## Atribuindo a uma variável dados

dados <- st_read(path)

##Visulaizando os dados
plot(dados)

class(dados)

## selecionando a coluna dos objetos espaciais

estados <- dados$geometry
class(estados)


## Selecionando apenas um estado

estado <- estados[[2]]
class(estado)
plot(estado)
