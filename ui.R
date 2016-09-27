#################### UI File ###################################
# Esse arquivo segue a estrutura de um dashboard normal,       #
# com o dashboard page, dashboard header e sidebar.            #
#                                                              #
# Como a apresentação do carômetro depende de dados que devem  #
# ser processador no server a ui do carômetro é feita lá.      #
#                                                              #
# Este é um recurso que pode ser utilizado nestas situações    #
# apesar de ser algo que pode deixar o app um pouco confuso.   #
#                                                              #
################################################################

## Corpo da página
dashboardPage(
  skin = "black",
  
  ## Cabeçalho com o título
  dashboardHeader(
    title = "Impeachment"
  ),

  ## Barra lateral
  dashboardSidebar(
    
    ## Incluindo recursos css e js para melhorar a aparência da página
    includeCSS("www/styles.css"),
    includeScript("www/d3.v3.min.js"),
    includeScript("www/d3-tip.js"),
    useShinyjs(),
    
    ## Meu com os seletores
    sidebarMenu(
      menuItem("Carômetro", tabName = "carometro"),
      
      ## Caixas de seleção
      checkboxGroupInput("voto", "Voto:",
                         c("A FAVOR" = "A FAVOR",
                           "CONTRA" = "CONTRA",
                           "INDECISO" = "INDECISO"), selected = c('A FAVOR', 'CONTRA', 'INDECISO')),
      
      ## Link para o readme
      menuItem("Sobre", tabName = "sobre",
        icon = icon("info-circle", lib="font-awesome")
      )
    )
  ),

  ## Corpo do dashboard
  dashboardBody(
    tabItems(
      tabItem(tabName = "carometro",
        uiOutput("tiles")
      ),

      tabItem(tabName = "sobre",
        box(width = 12,
            includeMarkdown("www/about.md")
        )
      )

    ) ## end tabItems
  ) ## end dashboardBody
) ## end dashboardPage
