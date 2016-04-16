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
    extendShinyjs(text = showModal),
    sidebarMenu(
      menuItem("Recipe View", tabName = "recipeView",
        icon = icon("glass", lib="font-awesome")
      ),
      menuItem("About", tabName = "about",
        icon = icon("info-circle", lib="font-awesome")
      )
    )
  ),

  dashboardBody(
    tabItems(
      tabItem(tabName = "recipeView",
        uiOutput("tiles")
#         bsModal("aboutModal", h3(" "), "", size = "large",
#                 includeMarkdown("www/about.md")
#         )
      ),

      tabItem(tabName = "about",
        box(width = 12,
            includeMarkdown("www/about.md")
        )
      )

    ) ## end tabItems
  ) ## end dashboardBody
) ## end dashboardPage
