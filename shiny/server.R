library(shiny)
library(dplyr)
library(ggplot2)
library(shinydashboard)

server <- function(input, output) {
  
  # Function to read CSV with encoding
  read_csv_with_encoding <- function(file) {
    read.csv(file, encoding = "UTF-8")
  }
  
  spotify_data <- reactive({
    read_csv_with_encoding("../data/spotify-2023.csv") %>%
      mutate(track_name = iconv(track_name, from = "UTF-8", to = "ASCII//TRANSLIT"))
  })
  
  spotify22_data <- reactive({
    read_csv_with_encoding("../data/spotify_top_charts_22.csv") %>%
      mutate(track_name = iconv(track_name, from = "UTF-8", to = "ASCII//TRANSLIT"))
  })
  
  unpopular_data <- reactive({
    read_csv_with_encoding("../data/unpopular_songs.csv") %>%
      mutate(track_name = iconv(track_name, from = "UTF-8", to = "ASCII//TRANSLIT"))
  })
  
  # Render value boxes
  output$spotifyCount <- renderValueBox({
    valueBox(
      value = spotify_data() %>% nrow(),
      subtitle = "Nombre de musiques dans spotify_data",
      icon = icon("music"),
      color = "blue"
    )
  })
  
  output$spotify22Count <- renderValueBox({
    valueBox(
      value = spotify22_data() %>% nrow(),
      subtitle = "Nombre de musiques dans spotify22_data",
      icon = icon("music"),
      color = "green"
    )
  })
  
  output$spotifyUnpopular <- renderValueBox({
    valueBox(
      value = unpopular_data() %>% nrow(),
      subtitle = "Nombre de musiques dans unpopular_data",
      icon = icon("music"),
      color = "red"
    )
  })
  
  output$spotify23_dimension <- renderValueBox({
    valueBox(
      value = ncol(spotify_data()),
      subtitle = "Dimensions de spotify_data",
      icon = icon("table"),
      color = "blue"
    )
  })
  
  output$spotify22_dimension <- renderValueBox({
    valueBox(
      value = ncol(spotify22_data()),
      subtitle = "Dimensions de spotify22_data",
      icon = icon("table"),
      color = "green"
    )
  })
  
  output$unpopular_dimension <- renderValueBox({
    valueBox(
      value = ncol(unpopular_data()),
      subtitle = "Dimensions de unpopular_data",
      icon = icon("table"),
      color = "red"
    )
  })
  
  output$spotifyStreams <- renderValueBox({
    data <- spotify_data() %>% slice(1:input$numSongs)
    data$streams <- as.numeric(data$streams)
    valueBox(
      value = sum(data$streams, na.rm = TRUE),
      subtitle = paste("Total des streams dans spotify_data des", input$numSongs, "premières musiques"),
      icon = icon("play"),
      color = "blue"
    )
  })
  
  
  # Render popularity plots
  output$popularitySpotify23 <- renderPlot({
    data <- spotify_data() %>% slice(1:input$numSongs)
    data$streams <- as.numeric(data$streams)
    ggplot(data, aes(x = reorder(track_name, -streams), y = streams)) +
      geom_bar(stat = "identity", fill = "blue") +
      coord_flip() +
      theme_minimal() +
      labs(title = "Popularité des chansons sur Spotify en 2023", x = "Chanson", y = "Streams")
  })
  
  output$popularitySpotify22 <- renderPlot({
    data <- spotify22_data() %>% slice(1:input$numSongs)
    ggplot(data, aes(x = reorder(track_name, -peak_rank), y = peak_rank)) +
      geom_bar(stat = "identity", fill = "red") +
      coord_flip() +
      theme_minimal() +
      labs(title = "Popularité des chansons sur Spotify en 2022", x = "Chanson", y = "Classement maximal")
  })

  
}
