library(shinydashboard)
library(dplyr)

ui <- dashboardPage(
  dashboardHeader(title = "Comparaison des données Spotify"),
  dashboardSidebar(
    sidebarMenu(
      menuItem("Comparaison", tabName = "Comparaison", icon = icon("th")),
      menuItem("Graphiques", tabName = "Graphiques", icon = icon("chart-column")),
      sliderInput("slider", "Nombre de musiques", 1, 100, 10),
      selectInput("color", "Couleur pour la distribution:", choices = c("energy_%", "valence_%", "acousticness_%")),
      selectInput("feature", "Feature pour le scatter plot:", choices = c("streams", "danceability_%", "bpm")),
      selectInput("chart_type", "Type de graphique:", choices = c("Bar Plot", "Line Plot", "Scatter Plot"))
    )
  ),
  dashboardBody(
    tabItems(
      tabItem(tabName = "Comparaison",
              h2("Comparaison des données"),
              fluidRow(
                valueBoxOutput("spotifyCount"),
                valueBoxOutput("spotify22Count")
              ),
              fluidRow(
                valueBoxOutput("spotifyStreams"),
                valueBoxOutput("spotify22Streams")
              )
      ),
      
      tabItem(tabName = "Graphiques",
              fluidRow(
                box(
                  title = "Comparaison des Streams",
                  status = "primary",
                  solidHeader = TRUE,
                  collapsible = TRUE,
                  plotOutput("streamsPlot", height = 250)
                ),
                box(
                  title = "Comparaison des Features",
                  status = "warning",
                  solidHeader = TRUE,
                  collapsible = TRUE,
                  plotOutput("featurePlot", height = 250)
                )
              ),
              h2("Sélectionnez les paramètres pour afficher les graphiques.")
      )
    )
  )
)
