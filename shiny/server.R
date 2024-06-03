library(shiny)
library(dplyr)
library(ggplot2)

server <- function(input, output) {
  
  spotify_data <- reactive({
    read.csv("../data/spotify-2023.csv")
  })
  
  spotify22_data <- reactive({
    read.csv("../data/spotify_top_charts_22.csv")
  })
  
  unpopular_data <- reactive({
    read.csv("../data/unpopular_songs.csv")
  })
  
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
      value = sum(data$streams),
      subtitle = paste("Total des streams dans spotify_data des ",input$numSongs," premières musiques"),
      icon = icon("play"),
      color = "blue"
    )
  })
  
  output$spotify22Streams <- renderValueBox({
    valueBox(
      value = sum(spotify22_data()$streams),
      subtitle = "Total des streams dans spotify22_data",
      icon = icon("play"),
      color = "green"
    )
  })
  
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
  
  output$streamComparison <- renderPlot({
    data23 <- spotify_data() %>% slice(1:input$numSongs)
    data22 <- spotify22_data() %>% slice(1:input$numSongs)
    data23$type <- "Spotify 2023"
    data22$type <- "Spotify 2022"
    data <- rbind(data23 %>% select(track_name, streams) %>% rename(value = streams),
                  data22 %>% select(track_name, peak_rank) %>% rename(value = peak_rank))
    ggplot(data, aes(x = reorder(track_name, -value), y = value, fill = type)) +
      geom_bar(stat = "identity", position = "dodge") +
      coord_flip() +
      theme_minimal() +
      labs(title = "Comparaison des streams entre 2022 et 2023", x = "Chanson", y = "Valeur")
  })
  
  output$featureComparison <- renderPlot({
    feature <- input$feature
    data23 <- spotify_data() %>% slice(1:input$numSongs)
    data22 <- spotify22_data() %>% slice(1:input$numSongs)
    data23$type <- "Spotify 2023"
    data22$type <- "Spotify 2022"
    data23 <- data23 %>% select(`artist(s)_name`, all_of(feature))
    data22 <- data22 %>% select(artist_names, all_of(feature))
    data22 <- data22 %>% rename(`artist(s)_name` = artist_names)
    data <- rbind(data23 %>% rename(value = all_of(feature)),
                  data22 %>% rename(value = all_of(feature)))
    
    ggplot(data, aes(x = reorder(`artist(s)_name`, -value), y = value, fill = type)) +
      geom_bar(stat = "identity", position = "dodge") +
      coord_flip() +
      theme_minimal() +
      labs(title = paste("Comparaison de", feature, "entre 2022 et 2023"), x = "Artiste", y = feature)
  })
}
