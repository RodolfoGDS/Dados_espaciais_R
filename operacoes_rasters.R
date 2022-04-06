# Neste script irems aprender a fazer operações com rasters.
# Vamos usar as imagens de Relevo do Estado do Rio de Janeiro.
## https://www.cnpm.embrapa.br/projetos/relevobr/download/rj/rj.htm

### Algoritimo:
# 1 - Setar o path(caminho) para acessar as imagens no seu computador
# 2 - Carregar o pacote raster 
# 3 - Lendo os arquivos raster e armazenando nas variáveis ---> r1, r2, r3 ..... 
# 4 - Juntar todos os arquivos rasters em apenas 1 arquivo.
# 5 - Resolvendo problemas de sobrepoição ao juntar os rasters.
# 6 - Criando uma lista com todos os arquivos rasters
# 7 - Lendo todos os raster de uma só vez.



# Setando o diretório

setwd('C:/Users/rodolfo.paula/Documents/MeusProjetos/Dados_espaciais_R/datasets/relevo_rj')

# Carregar o pacote raster

library(raster)

# Lendo os arquivos rasters

r1 =  raster('SF-23-X-B.tif')
r2 = raster('SF-23-X-D.tif')
r3 <- raster('SF-23-Z-A.tif')
r4 = raster('SF-23-Z-B.tif')
r5 = raster('SF-23-Z-C.tif')
r6 = raster('SF-23-Z-D.tif')
r7 = raster('SF-24-V-A.tif')
r8 = raster('SF-24-V-C.tif')
r9 = raster('SF-24-Y-A.tif')
r10 = raster('SF-24-Y-C.tif')


plot(rasters)

# Vamos juntar todos os arquivos rasters em um unico raster usando a função merge()


rasters_merge <- merge(r1,r2,r3,r4,r5,r6,r7,r8,r9,r10)

# Para resolver problemas de sobreposição de informação durante a junção de rasters,
# é recomendado usar a função mosaic(). A função merge() ao unir os rasters, resolve o problema de
# sobreposição de informação no pixel usando os dados do raster anterior, ou seja ele determina a 
# forma de resolver e escolher qual valor ele irá usar para aquele pixel. Já a função mosaic()
# permite alterações quando é determinado um val.or no atributo fun=  ... function.No caso vamos
# passar a média.


rasters_mosaic = mosaic(r1,r2,r3,r4,r5,r6,r7,r8,r9,r10, fun=mean)

plot(rasters_mosaic)


# Criando uma lista de arquivos rasters usando a função list.files()

lista_rasters = list.files(pattern = '*.tif')
lista_rasters


# Lendo os arquivos usando a função lapply(list, function) e do.call(function, dataset)
rm(raters_listados)
rasters_listados <- lapply(lista_rasters, raster)

rasters_unidos <- do.call(merge, rasters_listados)
plot(rasters_unidos)

