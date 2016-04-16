server <- function(input, output) {
  
  
  ##############################################################################
  ## Tile view tab
  output$tiles <- renderUI({
    
    fluidRow(
      column(12, id="columns",
             lapply(deputados$images, function(i) {
               a(box(width=NULL,
                     title = HTML(paste0("<div class='image-wrap'><img src='./images/",
                                         deputados$images[deputados$images == i],
                                         "' class='",
                                         "fixed-height",
                                         "'></div>", "<strong>",
                                         deputados$partido[deputados$images == i],
                                         "</strong><br>",
                                         '<span style="font-size: 11pt;">',
                                         deputados$nome[deputados$images == i],
                                         '</span>'))
               ), href= paste0("http://www.camara.leg.br/internet/Deputado/dep_Detalhe.asp?id=", deputados$idParlamentar[deputados$images == i]), target="_blank")
             })
      )
    )
  })

}
