dashboardPage(
  skin = "black",

  dashboardHeader(
    title = "Impeachment"
  ),

  dashboardSidebar(
    includeCSS("www/styles.css"),
    includeScript("www/d3.v3.min.js"),
    includeScript("www/d3-tip.js"),
    useShinyjs(),
    #extendShinyjs(text = showModal),
    sidebarMenu(
      menuItem("Carômetro", tabName = "carometro"
        #icon = icon("glass", lib="font-awesome")
      ),
      
      checkboxGroupInput("voto", "Voto:",
                         c("A FAVOR" = "A FAVOR",
                           "CONTRA" = "CONTRA",
                           "INDECISO" = "INDECISO"), selected = c('A FAVOR', 'CONTRA', 'INDECISO')),
      
      menuItem("Sobre", tabName = "sobre",
        icon = icon("info-circle", lib="font-awesome")
      )
    )
  ),

  dashboardBody(
    tabItems(
      tabItem(tabName = "carometro",
        uiOutput("tiles")
#         bsModal("aboutModal", h3(" "), "", size = "large",
#                 includeMarkdown("www/about.md")
#         )
      ),

      tabItem(tabName = "sobre",
        box(width = 12,
            includeMarkdown("www/about.md")
        )
      )

    ) ## end tabItems
  ) ## end dashboardBody
) ## end dashboardPage
