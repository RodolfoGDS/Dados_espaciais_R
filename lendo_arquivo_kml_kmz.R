# Nesse script vamos fazer a leitura de arquivos kmz e kml oriundos do Google Earth

# Algoritimo:

# 1 - Carregar o pacote sf ---> simple features.
# 2 - Passar o endereço dos arquivos que serão lidos.
# 3 - Fazer a leitura dos arquivos.
# 4 - Conferir a classe das variáveis.
# 5 - Plotar em gráfico.


# Carregando o pacote sf
library(sf)
library(ggplot2)

# Passando o caminho para os arquivos
setwd('C:/Users/rodolfo.paula/Documents/MeusProjetos/Dados_espaciais_R/datasets')

# criando as variáveis para cada tipo de arquivo kml
poligono_kml =  st_read('Lagoa de Marapendi.kml')
linha_kml = st_read('casa_reserva.kml')
ponto_kml = st_read('casa.kml')

plot(poligono_kml$geometry)

ggplot(poligono_kml)+geom_sf()

ggplot(linha_kml)+geom_sf()

ggplot(ponto_kml)+geom_sf()

# Criando as variáveis para daca tipo de arquivo kmz ---> que é o arquivo kml zipado

# Para isso vamos ter usar a função unzip()

poligono_kmz = st_read(unzip('Lagoa de Marapendi.kmz'))
linha_kmz = st_read(unzip('casa_reserva.kmz'))
ponto_kmz = st_read(unzip('casa.kmz'))

plot(poligono_kmz$geometry)

ggplot(poligono_kmz)+geom_sf()

ggplot(linha_kmz)+geom_sf()

ggplot(ponto_kmz)+geom_sf()
