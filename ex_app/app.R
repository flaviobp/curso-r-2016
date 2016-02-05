#
# This is a Shiny web application. You can run the application by clicking
# the 'Run App' button above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)

# Define UI for application that draws a histogram
ui <- shinyUI(fluidPage(
   
   # Application title
   titlePanel("Old Faithful Geyser Data"),
   
   # Sidebar with a slider input for number of bins 
   sidebarLayout(
     sidebarPanel(
                    wellPanel(
                      dateInput("date", label = h3("Date input"), value = "2014-01-01")
                    ),
                    
                    wellPanel(
                      checkboxGroupInput(inputId = 'cb', label = 'CheckBox', choices = c('a' = 'A', 'b' = 'B')),
                      textInput("text", label = h3("Text input"), value = "Enter text..."),
                      numericInput('n', label = 'N', value = 3),
                      numericInput('n2', label = 'N2', value = 3)
                    )
     ),
     mainPanel(
       fluidRow(
         plotOutput('id_graf')
       ),
       fluidRow(
         tableOutput('id_tab')
       )
      
     )
   )
))

# Define server logic required to draw a histogram
#tudo do shiney server é uma sessao
server <- shinyServer(function(input, output) {
   
  #na pratica uma funcao que muda de acordo com a opcao do usuario
  #processamento mais pesados usados por alguns objetos
  # ()->   ->  ()
  #        ->  ()
  #gera uma invalidacao e executa uma vez apenas
  #trabalhar com eventos
  
  #se executar N ele executa, mas N2 nao, apenas vai utilizar o N2 ao executar o N
  #shiny da estrutura para programar de uma forma inteligente mais leve e interessante
  dados <-reactive({
    n <- input$n
    m <- mtcars[1:input$n] # isola este cara para executar apenas uma vez ao inves de duas ficar mais leve
    isolate({
      m[1:input$n2,]
    })
  })
  
  output$id_graf <- renderPlot({
    pairs(dados())
  })
  
  output$id_tab <- renderTable({
    #cor(dados())
    dados()
  })
  
  
})

# Run the application 
shinyApp(ui = ui, server = server)


#observe - nao depende de nada, vai invalidar em segundos, vc  retorna nada, fazer um logo de utilizacao
#internamente funcao render sao observe

#isolate - isola parte do seu codigo que nao vai gerar invalidacao, so faz rodar um dos outputs especificos


#



