#PARA DEFAULT EM FUNCAO
funcao <- function(a, b = 7){
  return (a)
}

#
funcao2 <- function(a, b = 7){
 a
}

#soma de vetores
vetores <- c(1:10)

#vetor com funcao
vetores + 1

#R desenvolvidas em Fortran ou C

#OPERACAO COM VETORES

#RECICLAGEM - DOIS VETORES COM TAMANHOS DIFERENTES
  # MENOR VETOR E DUPLICADO ATE FICAR NO TAMANHO DO MAIOR VETOR
x <- c(1, 5)
y <- c(1, 10, 100, 1000)
x + y


# #  COM TAMANHOS DIFERENTES DE MULTIPLO FAZ A OPERACAO
#   MAS COM UM WARNING
# IF(FALSE){
# ##
#   
# }
# 
# #MATRIZ DIAGONAL
# #DIAG(2)
# 
# 
# #


# #TIPOS DE DADOS
# ATOMICO = NUMERO 1, STRING COM UMA PALAVRA
# VETOR = CONJUNTO DE ESTRUTURAS ATOMICAS
# MATRIZ = VETOR DE VETORES
# ARRAY = VETOR DE VARIOS vetores
# 
# O Q TEM EM COMUM HOMOGENEO
# 
# HOMOGENEO = TODOS OS ELEMENTOS DO MESMO TIPO


# CARACTERISTICAS
#   TIPO DE VARIAVEL + DIMENSAO
#   
# LISTA --- HETEROGENEA
#   ELEMENTO OBJETO COMPLEXO, STRING 
  

# ATOMIC VECTORS - UTILIZA MESMA ATRIBUICAO
#   TRUE == T
#   FALSE == F
# 
# PARA INTEIRO TER CERTEZA COLOCA UM L NA FRENTE
#     
# double
# 
# COMPLEXO
# 
# CHARACTER - STRING


# CRIAR VETOR - CONCATENATE
# C


# PARA SABER O TIPO DE OBJETO 
# typeof()


# inteiro e double e considerado numerico pelo R

#COERACAO R TENTA ATRIBUIR AO VETOR O TIPO DE VARIAVEL QUE O ACOMODA NA ORDEM DE COERCAO

# VAI CONVERTER TUDO PARA STRING
#c("a", 1, TRUE, T)

#PODE FAZER CONTAS COM COISAS QUE NAO FAZ SENTIDO
#SOMA DE VETOR DE TRUE E FALSES
#sum(c(T, F, T, F, T))


#FACTORS
#TIPO ESPECIAL DE VARIAVEL QUE POR LOGICA SAO INTEIROS
#MAS NA EXECUCAO PARECEM STRING
#HASH TABLE PARA MAPEAR STRING E NUMEROS

#LEVELS ORDEM ALFABETICA


# #f <- factor(c("2", "3", "1", "10"))
# as.numeric(f)
# ## [1] 3 4 1 2
# #ORDEM DAS STRINGS
# 3 - "1"
# 4 - "0"
# 1 - "2"
# 2 - "3"


# Um vetor para descrever todas as dimensões
# (X,Y,Z)
#arr <- array(1:12, dim = c(3, 2, 2))

#dim - quantos elementos tem em cada dimensao



#LISTAS
#COM DOIS ELEMENTOS Q SAO VETORES

#DATA FRAME, ESTRUTURA PRINCIPAL PARA DADOS
#LISTA - CADA ELEMENTO DA LISTA MESMO NUMERO DE ELEMENTOS



#STR - STRUCTURE
#VAI TER INFORMACAO DO QUE TEM DENTRO DELE



#df <- data.frame(x = 1:4, y = c("oi", "oi", "oi", "oi"), z = T, 
#stringsAsFactors = F)
# FORCA O DATA FRAME A UTILIZAR STRING NAO TRANSFORMAR EM FACTOR

#NAMES DE DF
#RETORNA O NOME DAS VARIAVEIS

#RBIND - COLA NOS ROWS
#CBIND - COLAR NOS COLUNS



#SUBSETTING SUBCONJUNTO DE DF DE UM OBJETO
#[]

#order(x) - ORDER DENTRO DO VETOR CLASSIFICACAO


#PARA ORDERNAR UM VETOR x[order(x)]

#RETIRA OS ELEMENTOS DO VETORX[]
#x[-c(2, 5, 6)]


#FORMA LOGICA
#x[x == 1]



#selecionar segunda coluna data frame
#mtcars[,2]
#mtcars[[2]
#mtcars$cyl
#mtcars[,'cyl']

#seleciona as 2° e a 3° coluna
#mtcars[c(2,3)]


#summary - estatistica basica
#summary(mtcars)

#media
#mean(mtcars$mpg)
#median(mtcars$mpg)

#variancia amostral nao é a populacional
#var(mtcars$mpg)

#desvio padrao
#sd(mtcars$mpg)
# 
# #quartil
# quartile(mtcars$m, c(0.25, 0.5, 0.75))
# 
# #deceis
# quantile(mtcars$mpg, 0:10/10)



#funcao aggregate
  

#base de dados carregados de um pacote
#data(diamonds, package='ggplot2')


#
#table(diamonds$cur)
  

#table retorna um arrua


#tabela de dupla entrada
#table(diamonds$cut, diamonds$color, diamonds$clarity)

#proporcoes condicionais
#prop.table(diamonds$cut, diamonds$color)


#operador pipe
#%>%
#pode criar um operador
#ex soma2   = a+b+2

#carregando o pacote
#library(magrittr)
#mean(mtcars$mpg)=
#mtcars$mpg%>%mean()


#retirando o que nao existe na.rm = .
#TRUE %>% mean(c(NA, 1:101), na.rm = .)



#
#1:101%>%c(NA,.)%>%mean(., na.rm = TRUE)
##1:101%>%c(NA)%>%mean(., na.rm = TRUE)