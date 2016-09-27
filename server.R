server <- function(input, output) {
  
  ##############################################################################
  ## Observer
  deputados <- reactive({
    load("./data/deputados.rda")
    deputados <- deputados %>%
      filter(voto %in% input$voto)
  })
  
  ##############################################################################
  ## Renderiznando a UI no server
  output$tiles <- renderUI({
    
    ## Define um row um column para colocar os boxes    
    fluidRow(
      column(12, id="columns",
             
             ## Aqui eu rodo o um lapply sobre os dados
             ## que cria todos os boxes com a informação
             ## apropriada
             lapply(deputados()$images, function(i) {
               
               ## Criação de cada box
               a(box(width=NULL, #background = deputados$cores[deputados$images == i],
                     title = HTML(paste0("<div class='image-wrap'><img src='./images/",
                                         deputados()$images[deputados()$images == i],
                                         "' class='",
                                         "fixed-height",
                                         "'></div>", "<strong>",
                                         deputados()$partido[deputados()$images == i],
                                         "</strong><br>",
                                         '<span style="font-size: 11pt;">',
                                         deputados()$nomeParlamentar[deputados()$images == i],
                                         '</span>')),
                     footer = HTML(paste0("<font size='3' color='",deputados()$cores[deputados()$images == i],"'>",deputados()$voto[deputados()$images == i],'</font>')
)
               ), href= paste0("http://www.camara.leg.br/internet/Deputado/dep_Detalhe.asp?id=", deputados()$idParlamentar[deputados()$images == i]), target="_blank")
             })
      )
    )
  })

}
