# Nesse script vamos fazer a leitrua de dados de GPS. 
# O arquivo utilizado é possui a extensão gpx.
# Trata-se de dados vetoriais espaciais.

## Algoritimo

# 1 - Carregar o pacote sf (simple feature)
# 2 - Passar o diretório onde o arquivo gpx está salvo 
# 3 - Listar as camadas do arquivo gpx.
# 4 - Acessar os dados do arquivo e separar o que importa em uma variável
# 5 - Plotar usando a função plot o atributo referente a geometria
# 6 - Carregar o pacote ggplot.
# 7 - Analisar a classe da variável com o conteúdo de interesse.
# 8 - Plotar um gráfico utilizando o ggplot

# Carregando o pacote sf

library(sf)

# Passando o diretório que esta salvo o arquivo

arquivo <- ('C:/Users/rodolfo.paula/Documents/MeusProjetos/Dados_espaciais_R/datasets/schiehallion.gpx')


# Listando as camadas do arquivo gpx.

st_layers(arquivo)
rotas = st_read(dsn = arquivo, layer = 'routes')
plot(rotas$geometry)


# Carregar o pacote ggplot2
library(ggplot2)

# Analisando a classe da variável

class(rotas)


# Plotar um gráfico usando o ggplot2.

ggplot(rotas) + geom_sf()
