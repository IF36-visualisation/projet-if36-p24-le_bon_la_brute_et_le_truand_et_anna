library(shiny)
library(shinydashboard)

ui <- dashboardPage(
  dashboardHeader(title = "Comparaison des données Spotify"),
  dashboardSidebar(
    sidebarMenu(
      menuItem("Comparaison", tabName = "Comparaison", icon = icon("th")),
      menuItem("Graphiques", tabName = "Graphiques", icon = icon("chart-column")),
      sliderInput("numSongs", "Nombre de musiques", 1, 100, 10)
    )
  ),
  dashboardBody(
    tabItems(
      tabItem(tabName = "Comparaison",
              h2("Comparaison des données"),
              fluidRow(
                valueBoxOutput("spotifyCount"),
                valueBoxOutput("spotify22Count"),
                valueBoxOutput("spotifyUnpopular")
              ),
              fluidRow(
                valueBoxOutput("spotify23_dimension"),
                valueBoxOutput("spotify22_dimension"),
                valueBoxOutput("unpopular_dimension")
              ),
              h2("Analyse des datasets"),
              fluidRow(
                valueBoxOutput("spotifyStreams")
              )
      ),
      
      tabItem(tabName = "Graphiques",
              fluidRow(
                box(title = "Popularité sur Spotify 2023", status = "primary", solidHeader = TRUE, collapsible = TRUE, 
                    plotOutput("popularitySpotify23")),
                box(title = "Popularité sur Spotify 2022", status = "primary", solidHeader = TRUE, collapsible = TRUE, 
                    plotOutput("popularitySpotify22"))
              ),
              fluidRow(
                box(title = "Corrélation entre Danceability et Streams (2023)", status = "primary", solidHeader = TRUE, collapsible = TRUE, 
                    plotOutput("corrDanceabilityStreams23")),
                box(title = "Corrélation entre Danceability et Classement (2022)", status = "primary", solidHeader = TRUE, collapsible = TRUE, 
                    plotOutput("corrDanceabilityRank22"))
              ),
              fluidRow(
                box(title = "Heatmap des corrélations (2023)", status = "primary", solidHeader = TRUE, collapsible = TRUE, 
                    plotOutput("heatmapCorr23")),
                box(title = "Heatmap des corrélations (2022)", status = "primary", solidHeader = TRUE, collapsible = TRUE, 
                    plotOutput("heatmapCorr22"))
              ),
              fluidRow(
                box(title = "Distribution des Streams par Danceability (2023)", status = "primary", solidHeader = TRUE, collapsible = TRUE, 
                    plotOutput("boxplotStreamsDanceability23")),
                box(title = "Distribution des Classements par Danceability (2022)", status = "primary", solidHeader = TRUE, collapsible = TRUE, 
                    plotOutput("boxplotRankDanceability22"))
              )
      )
    )
  )
)
