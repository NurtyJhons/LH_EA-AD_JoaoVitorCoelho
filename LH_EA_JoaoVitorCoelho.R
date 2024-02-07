# Chamando o caminho da pasta e o arquivo onde estão no MEU computador (será necessário
# trocar o caminho conforme o arquivo está no computador que você, avaliador, está lendo isso):

setwd("C:/Users/joao/Downloads/banvic_data")

# Trazendo o nome de um arquivo em especifico que está dentro do caminho acima, e com ele criando
# o Dataframe "dfclientes":
dfclientes <- read.csv("clientes.csv",header=TRUE,encoding="UTF-8")

# Tentando criar um histograma de forma manual, e depois desse utilizando o programa 
# "esquisser" para facilitar na criação dos gráficos. Entretanto, não é possível pois
# precisamos fazer mudanças, como retirar variáveis não numéricas:
hist(dfclientes$data_nascimento, breaks=6,labels=T)

dfclientes$primeiro_nome <- NULL
dfclientes$ultimo_nome <- NULL
dfclientes$email <- NULL
dfclientes$tipo_cliente <- NULL
dfclientes$endereco <- NULL
dfclientes$cpfcnpj <- NULL
dfclientes$data_inclusao <- NULL

# E transformar o que não era tipo numérico para tal:
dfclientes$cod_cliente <- as.numeric(dfclientes$cod_cliente)

# Retirando o "-" pois o R não estava conseguindo converter CEP para tipo numérico
dfclientes$cep <- gsub("-| ","",dfclientes$cep)
dfclientes$cep <- as.numeric(dfclientes$cep)

# Retirando o "-" pois o R não estava conseguindo converter data_nascimento para tipo numérico
dfclientes$data_nascimento <- gsub("-| ","",dfclientes$data_nascimento)
dfclientes$data_nascimento <- as.numeric(dfclientes$data_nascimento)

# Agora sim o gráfico:
hist(dfclientes$data_nascimento, breaks=10,labels=T, col = "blue", main = "Histograma da quantidade de clientes por década de nascimento", ylab = "Quantidade de pessoas", xlab = "Por décadas")


# Agora vou fazer gráficos com o pacote esquisser!

install.packages("esquisse")
library(esquisse)
install.packages("ggplot2")
library(ggplot2)
install.packages("dplyr")
library(dplyr)

setwd("C:/Users/joao/Downloads/banvic_data")

dftransacoes <- read.csv("transacoes.csv",header=TRUE,encoding="UTF-8")

ggplot(dftransacoes) +
 aes(x = nome_transacao, colour = valor_transacao) +
 geom_bar(fill = "#112446") +
 scale_color_gradient(low = "#000004", high = "#296931") +
 labs(x = "Nome transações", y = "Quantidade de transações") +
 theme_minimal()  

setwd("C:/Users/joao/Downloads/banvic_data")

dfpropostas_cred <- read.csv("propostas_credito.csv",header=TRUE,encoding="UTF-8")

ggplot(dfpropostas_cred) +
 aes(x = quantidade_parcelas) +
 geom_histogram(bins = 30L, fill = "#114620") +
 labs(x = "Quantidade de parcelas", y = "Quantidade de propostas") +
 theme_minimal() +
 facet_wrap(vars(status_proposta))

setwd("C:/Users/joao/Downloads/banvic_data")

dfpropostas_cred <- read.csv("propostas_credito.csv",header=TRUE,encoding="UTF-8")

ggplot(dfpropostas_cred) +
 aes(x = carencia) +
 geom_histogram(bins = 30L, fill = "#462C11") +
 theme_minimal() +
 facet_wrap(vars(status_proposta))   