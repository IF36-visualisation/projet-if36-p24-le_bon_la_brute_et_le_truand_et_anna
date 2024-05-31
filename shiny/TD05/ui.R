library(shinydashboard)
library(dplyr)

ui <- dashboardPage(
  dashboardHeader(title = "Basic dashboard"),
  dashboardSidebar(
    sidebarMenu(
      menuItem("Stats", tabName = "Stats", icon = icon("th")),
      menuItem("Graphiques", tabName = "Graphiques", icon = icon("chart-column")),
      sliderInput("slider", "Nb individus", 1, 87, 10),
      selectInput("color", "Color for distribution:", choices = c("hair_color", "eye_color", "skin_color"))
    )
  ),
  dashboardBody(
    tabItems(
      tabItem(tabName = "Stats",
              h2("Widgets tab content"),
              fluidRow(
                valueBoxOutput("fixedBox"),
                valueBoxOutput("individualsBox"),
                valueBoxOutput("dimensionsBox")
              ),
              fluidRow(
                infoBoxOutput("avgHeightBox"),
                infoBoxOutput("medianMassBox")
              )
      ),
      
      tabItem(tabName = "Graphiques",
              fluidRow(
                box(
                  title = "Height & mass correlation",
                  status = "primary",
                  solidHeader = TRUE,
                  collapsible = TRUE,
                  plotOutput("scatterPlot", height = 250)
                ),
                box(
                  title = "Distribution of color",
                  status = "warning",
                  solidHeader = TRUE,
                  collapsible = TRUE,
                  plotOutput("colorPlot", height = 250)
                )
              ),
              h2("Le graphe de gauche est interactif !")
      )
    )
  )
)
