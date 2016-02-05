#
# This is a Shiny web application. You can run the application by clicking
# the 'Run App' button above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)
library(ggplot2)


ui <- shinyUI(fluidPage(
   
   titlePanel("Laboratório 8"),
   
   sidebarLayout(
     sidebarPanel(
       # coloque aqui um seletor de qual variável do banco de dados será a resposta
       # (somente 'price', 'carat', 'x', 'y', 'z')
       selectInput("resposta", label = h3("RESPOSTA"), 
                   choices = list('price' = 'price', "carat" = "carat", "x" = "x", "y" = "y", "z" = "z"), 
                   selected = 1),
       
       # coloque aqui um seletor de qual variável será a explicativa
       # (somente 'price', 'carat', 'x', 'y', 'z')
       selectInput("x", label = h3("EXPLICATIVA"), 
                   choices = list('price' = 'price', "carat" = "carat", "x" = "x", "y" = "y", "z" = "z"), 
                   selected = 1)
     ),
     
     mainPanel(
       tags$h2('Gráfico!'),
       plotOutput("reta_ajustada")
     )
   )
))

# Define server logic required to draw a histogram
server <- shinyServer(function(input, output) {
  

  # Ajusta modelo para as variaveis y e x no banco de dados diamonds
  ajustar_modelo <- function(y, x){
    form <- as.formula(paste(y, x, sep='~'))
    modelo <- lm(form, data = diamonds)
    return(modelo)
  }
  
  
  output$reta_ajustada <- renderPlot({
    
    # definição das variáveis 
    y <- input$resposta
    x <- input$x
    
    # faça um gráfico da variável resposta pela variável selecionada para o eixo X
    # inclua a reta de regressão ajustada.
    ajuste_lm <- ajustar_modelo(y,x)
    coeficientes <- coef(ajuste_lm)
    ggplot(diamonds)+
      geom_point(aes_string(x=x, y=y))+
      geom_abline(intercept = coeficientes[1], slope=coeficientes[2], color='red')    

  })  

})

# Run the application 
shinyApp(ui = ui, server = server)

