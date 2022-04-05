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

# criando as variáveis para cada tipo de arquivo 
poligono_kml =  st_read('Lagoa de Marapendi.kml')
linha_kml = st_read('casa_reserva.kml')
ponto_kml = st_read('casa.kml')

ggplot()+geom_sf()
