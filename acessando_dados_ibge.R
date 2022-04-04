# Nesse script aprederemos a usar o pacote geobr que permite um acesso 
# direto aos dados do IBGE

# Instalando o pacote geobr pelo CRAN

install.packages('geobr')

## link para dowload e referencia das bibliotecas utilizadas

### https://cran.r-project.org/web/packages/sf/index.html
### https://r-spatial.github.io/sf/

### https://github.com/ipeaGIT/geobr
### https://cran.r-project.org/web/packages/geobr/index.html

# Carregando o pacote geobr, que apresenta dependencia com o pacote sf
library(sf)
library(geobr)
library(dplyr)

# Lendo os dados referentes aos limites territoriais do Brasil.
### A função utilizada é o read_country(year = passando o ano atual podemos ver ate que ano está disponivel)
## Até o presente momento só está disponível dados ate 2020.
## Caso queira apenas o contorno do país não passe o atributo ano
## o arquivo com year = 2020 vem com as divisões dos Estados

#Armamzenando em uma variável o limite territorial do Brasil
br <- read_country()

#Plotando em mapa
plot(br)

# olhando a tabela e verificando o conteúdo. Note que lemos uma list(list(c()))
View(br)

# Agora vamos ler os dados referentes aos limites Estaduais.

estados_br = read_state(year=2020)
plot(estados_br$geom)

# Caso queira apenas a informação de um estado basta usar o atributo

rj_estado = read_state(code_state = 'RJ', year = 2020)
View(rj_estado)
class(rj_estado)
plot(rj_estado$geom)


#Acessando todos os estados 
estados = read_state(code_state='all')

plot(estados$geom)


# Acessando os dados usando o pacote dplyr

estados_norte = filter(estados,name_region =='Norte')
plot(estados_norte$geom)


#Acessando os dadosde todos os municipios
municipios_br = read_municipality()

# Acessando apenas os municipios do Estado especificado.
rj_municipio = read_municipality(code_muni = 'RJ')
plot(rj_municipio$geom)

# Acessando apenas um municipio. primeiro vamos acessar os dados pra descobrir 
# qual é o codigo do municipio desejado.

lookup_muni(name_muni = 'Rio de Janeiro')

rio_de_janeiro_municipio = read_municipality(code_muni = 3304557)
plot(rio_de_janeiro_municipio$geom)

# Acessando os biomas brasileiros
biomas_br = read_biomes()
plot(biomas_br$geom)


# Acessando os mesmos dados atraves dos dados que estao no seu computador.
# Esse caso é util para quando o servidor não está funcionando.
# Vamos usar o pacote sf e a sua função read_sf(). 
# Primeiro passo é determinar o diretorio que vamos trabalhar.

setwd('C:/Users/rodolfo.paula/Documents/MeusProjetos/Dados_espaciais_R/datasets')

#Conferindo os arquivos do diretorio que setamos.
list.files()

# Lendo os arquivos do municipio do Rio de Janeiro
muni_rj <- read_sf("RJ_Municipios_2021.shp" )

plot(muni_rj$geometry)


